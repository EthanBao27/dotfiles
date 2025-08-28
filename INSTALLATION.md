# 📖 安装指南

本指南将帮助你安装和配置所有包含在 dotfiles 中的工具和应用程序。

## 📋 系统要求

- **操作系统**: macOS (推荐) 或 Linux
- **Shell**: zsh (推荐) 或 bash
- **包管理器**: Homebrew (macOS) 或对应的包管理器

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/ethanbao27/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. 安装基础工具

#### macOS (使用 Homebrew)
```bash
# 安装 Homebrew (如果尚未安装)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 安装基础工具
brew install neovim kitty starship yazi fzf git zsh
```

#### Linux (使用包管理器)
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install neovim kitty starship yazi fzf git zsh

# Fedora
sudo dnf install neovim kitty starship yazi fzf git zsh

# Arch Linux
sudo pacman -S neovim kitty starship yazi fzf git zsh
```

### 3. 安装字体

```bash
# macOS
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-maple-mono-nerd-font
brew install --cask font-hack-nerd-font

# Linux
# 从 Nerd Fonts 网站下载并安装字体
# https://www.nerdfonts.com/font-downloads
```

### 4. 创建符号链接

```bash
# 备份现有配置 (可选)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.config/kitty ~/.config/kitty.backup 2>/dev/null || true
mv ~/.config/starship.toml ~/.config/starship.toml.backup 2>/dev/null || true
mv ~/.config/yazi ~/.config/yazi.backup 2>/dev/null || true

# 创建符号链接
ln -s ~/dotfiles/neovim ~/.config/nvim
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/yazi ~/.config/yazi
```

### 5. 初始化配置

#### Neovim
```bash
# 启动 Neovim 并自动安装插件
nvim --headless "+Lazy sync" +qa

# 或者手动启动 Neovim
nvim
# 然后运行 :Lazy sync
```

#### Starship
```bash
# 初始化 Starship
eval "$(starship init zsh)"

# 将上述命令添加到 ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

#### FZF
```bash
# 安装 FZF 键绑定和模糊补全
$(brew --prefix fzf)/install --all

# 或者手动添加到 ~/.zshrc
echo 'source <(fzf --zsh)' >> ~/.zshrc
echo 'source <(fzf --bash)' >> ~/.zshrc
```

## 🔧 详细配置

### Neovim 配置

#### 插件安装
```bash
# 启动 Neovim
nvim

# 运行插件同步
:Lazy sync

# 检查健康状态
:checkhealth
```

#### LSP 服务器安装
```bash
# 在 Neovim 中运行
:Mason

# 然后安装所需的 LSP 服务器
- pylsp (Python)
- lua_ls (Lua)
- rust_analyzer (Rust)
- gopls (Go)
- tsserver (TypeScript/JavaScript)
- clangd (C/C++)
- bashls (Bash)
```

#### 常用命令
```bash
# 格式化代码
:lua vim.lsp.buf.format()

# 重命名符号
:lua vim.lsp.buf.rename()

# 代码动作
:lua vim.lsp.buf.code_action()

# 查看定义
:lua vim.lsp.buf.definition()

# 查看引用
:lua vim.lsp.buf.references()
```

### Kitty 配置

#### 主题切换
```bash
# 编辑 Kitty 配置文件
vim ~/.config/kitty/kitty.conf

# 取消注释想要的主题
# include everforest.conf
# include mocha.conf
```

#### 字体配置
```bash
# 编辑字体配置文件
vim ~/.config/kitty/font.conf

# 选择喜欢的字体
# font_family JetBrainsMono Nerd Font Mono
# font_family Maple Mono Nerd Font
```

### Yazi 配置

#### 插件管理
```bash
# Yazi 插件位于 ~/dotfiles/yazi/plugins/
# 当前包含的插件：
# - parent-arrow.yazi: 父目录箭头显示
# - smart-enter.yazi: 智能回车键
# - starship.yazi: Starship 集成
```

#### 主题配置
```bash
# 编辑 Yazi 配置文件
vim ~/.config/yazi/yazi.toml

# 主题文件位于：
# - theme.toml (默认主题)
# - theme-everforest.toml (Everforest 主题)
# - Catppuccin-mocha.tmTheme (Catppuccin 主题)
```

### Starship 配置

#### 自定义模块
```bash
# 编辑 Starship 配置
vim ~/.config/starship/starship.toml

# 当前配置包含：
# - OS 图标和名称
# - 用户名和主机名
# - 目录信息
# - Git 状态
# - 编程语言环境 (Python, Node.js, Rust)
# - 命令执行时间
# - 电池状态
# - 时间显示
```

## 🎨 主题配置

### 统一主题
所有工具都支持 Everforest 主题，提供一致的视觉体验：

1. **Neovim**: 自动加载 Everforest 主题
2. **Kitty**: 使用 `include everforest.conf`
3. **Yazi**: 使用 `theme-everforest.toml`
4. **Starship**: 使用 Everforest 配色方案

### 其他主题
- **Catppuccin**: 现代的深色主题
- **Nord**: 北极光主题
- **Mocha**: 深棕色主题

## 🚨 故障排除

### 常见问题

#### Neovim 插件安装失败
```bash
# 清理插件缓存
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim

# 重新安装
nvim --headless "+Lazy sync" +qa
```

#### 字体显示问题
```bash
# 确认 Nerd Font 已安装
fc-list | grep -i "nerd font"

# 重启终端
exec zsh
```

#### 权限问题
```bash
# 修复配置文件权限
chmod -R 755 ~/.config
chmod -R 644 ~/.config/*/*.toml
chmod -R 644 ~/.config/*/*.conf
```

#### FZF 键绑定不工作
```bash
# 确保 FZF 初始化脚本被加载
echo $FZF_VERSION

# 手动加载
source <(fzf --zsh)
```

## 🔄 更新配置

### 更新 dotfiles
```bash
cd ~/dotfiles
git pull origin main
```

### 更新 Neovim 插件
```bash
nvim --headless "+Lazy sync" +qa
```

### 更新其他工具
```bash
# macOS
brew upgrade neovim kitty starship yazi fzf

# Linux
sudo apt upgrade neovim kitty starship yazi fzf  # Ubuntu/Debian
sudo dnf upgrade neovim kitty starship yazi fzf  # Fedora
```

## 📞 支持

如果遇到问题，请检查：

1. 系统和工具版本兼容性
2. 配置文件权限
3. 依赖项是否正确安装
4. 查看工具的日志和错误信息

你也可以在 [GitHub Issues](https://github.com/ethanbao27/dotfiles/issues) 中报告问题。

---

<div align="center">
🎉 享受你的新开发环境！
</div>
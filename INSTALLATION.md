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
brew install neovim kitty starship yazi fzf git zsh neofetch fastfetch
```

#### Linux (使用包管理器)
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install neovim kitty starship yazi fzf git zsh neofetch fastfetch

# Fedora
sudo dnf install neovim kitty starship yazi fzf git zsh neofetch fastfetch

# Arch Linux
sudo pacman -S neovim kitty starship yazi fzf git zsh neofetch fastfetch
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
mv ~/.config/neofetch ~/.config/neofetch.backup 2>/dev/null || true
mv ~/.config/fastfetch ~/.config/fastfetch.backup 2>/dev/null || true
mv ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
mv ~/.zprofile ~/.zprofile.backup 2>/dev/null || true
mv ~/.zshenv ~/.zshenv.backup 2>/dev/null || true

# 创建符号链接
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/dotfiles/neovim ~/.config/nvim
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/yazi ~/.config/yazi
ln -s ~/dotfiles/neofetch ~/.config/neofetch
ln -s ~/dotfiles/fastfetch ~/.config/fastfetch
```

### 5. 初始化配置

#### Zsh
```bash
# 安装 Oh My Zsh (如果尚未安装)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装 Powerlevel10k 主题
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 重新加载 zsh 配置
source ~/.zshrc

# 配置 Powerlevel10k (首次运行时会显示配置向导)
p10k configure
```

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

#### Neofetch
```bash
# 测试 Neofetch
neofetch

# 使用 Apple 专用配置
neofetch --config ~/.config/neofetch/config-apple.conf
```

#### Fastfetch
```bash
# 测试 Fastfetch
fastfetch
```

## 🔧 详细配置

### Zsh 配置

#### Oh My Zsh 管理
```bash
# 编辑 Zsh 配置
vim ~/.zshrc

# 当前配置包含：
# - Oh My Zsh 框架集成
# - Powerlevel10k 主题配置
# - 常用插件 (zsh-autosuggestions, zsh-syntax-highlighting 等)
# - 环境变量配置 (Homebrew, Cargo, OrbStack)
# - 别名和函数定义
```

#### 插件管理
```bash
# 查看已安装的插件
ls ~/.oh-my-zsh/custom/plugins/

# 安装新插件
git clone <plugin-url> ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/<plugin-name>

# 在 ~/.zshrc 中添加插件到 plugins=(...)
```

#### 环境配置
```bash
# Zsh 配置文件说明：
# - .zshrc: 主要配置文件，包含 Oh My Zsh 设置、插件、别名等
# - .zprofile: 登录时配置，包含环境变量设置
# - .zshenv: 环境变量配置，包含 Cargo 等工具路径
```

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

### Neofetch 配置

#### 自定义显示
```bash
# 编辑 Neofetch 配置
vim ~/.config/neofetch/config.conf

# 使用 Apple 专用配置
vim ~/.config/neofetch/config-apple.conf

# 当前配置包含：
# - 自定义 Apple logo (Catppuccin 主题)
# - 系统信息显示优化
# - 颜色主题配置
```

#### 常用选项
```bash
# 显示图片
neofetch --w3m /path/to/image

# 禁用图片
neofetch --off

# 使用特定配置
neofetch --config ~/.config/neofetch/config-apple.conf
```

### Fastfetch 配置

#### JSONC 配置
```bash
# 编辑 Fastfetch 配置
vim ~/.config/fastfetch/config.jsonc

# 当前配置包含：
# - 自定义 ASCII 艺术显示
# - 系统信息模块配置
# - 颜色和布局优化
```

#### 常用选项
```bash
# 使用特定配置
fastfetch --config ~/.config/fastfetch/config.jsonc

# 禁用 ASCII 艺术
fastfetch --logo none

# 显示更多信息
fastfetch --show-errors
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
brew upgrade neovim kitty starship yazi fzf git zsh neofetch fastfetch

# Linux
sudo apt upgrade neovim kitty starship yazi fzf git zsh neofetch fastfetch  # Ubuntu/Debian
sudo dnf upgrade neovim kitty starship yazi fzf git zsh neofetch fastfetch  # Fedora
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
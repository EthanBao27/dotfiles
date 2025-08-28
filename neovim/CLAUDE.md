# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一个基于 Lua 的 Neovim 配置，使用 lazy.nvim 作为插件管理器。配置采用模块化结构，支持多种编程语言的 LSP、代码格式化、调试等功能。

## 核心架构

### 配置结构
- `init.lua` - 主入口文件，按顺序加载各个模块
- `lua/custom/` - 核心配置目录
  - `options.lua` - 基础选项设置
  - `keymaps.lua` - 键位映射
  - `lsp.lua` - LSP 全局配置
  - `lazy.lua` - lazy.nvim 插件管理器配置
  - `plugins/` - 各个插件的配置文件
  - `config/` - 插件的详细配置
- `after/ftplugin/` - 文件类型特定的 LSP 配置
- `lsp/` - LSP 服务器配置文件
- `snippets/` - 代码片段配置

### 插件管理
使用 lazy.nvim 管理插件，所有插件配置在 `lua/custom/plugins/` 目录中，每个插件一个独立的配置文件。

## 关键功能

### LSP 配置
- 使用 Neovim 内置 LSP 客户端
- LSP 服务器配置在 `lsp/` 目录
- 文件类型特定的 LSP 在 `after/ftplugin/` 中启用
- 支持的语言：Python (pylsp, ruff), Lua (lua_ls), C/C++ (clangd), Rust (rust_analyzer), Go (gopls), TypeScript/JavaScript, Bash 等

### 代码格式化
- 使用 conform.nvim 进行代码格式化
- 配置在 `lua/custom/config/conform.lua`

### 调试支持
- 使用 nvim-dap 进行调试
- 配置在 `lua/custom/config/debugger.lua` 和 `lua/custom/config/dapui.lua`

### 任务运行
- 使用 overseer.nvim 管理任务
- 任务模板在 `lua/overseer/template/` 目录

### 文件浏览
- 使用 oil.nvim 作为文件管理器

### 模糊查找
- 使用 snacks.picker 替代 telescope

## 常用开发命令

### 配置验证
```bash
# 检查 Neovim 配置
nvim --checkhealth

# 检查 LSP 配置
:LspInfo
```

### 插件管理
```bash
# 在 Neovim 中同步插件
:Lazy sync

# 清理未使用的插件
:Lazy clean
```

### LSP 操作
```bash
# 重启 LSP 服务器
:LspRestart <server_name>

# 查看 LSP 日志
:LspLog
```

### 代码操作
```bash
# 格式化代码
:lua vim.lsp.buf.format()

# 重命名符号
:lua vim.lsp.buf.rename()

# 代码动作
:lua vim.lsp.buf.code_action()
```

## 开发约定

### 键位映射
- Leader 键设置为空格
- LSP 相关功能使用 `<leader>l` 前缀
- Git 相关功能使用 `<leader>g` 前缀
- 查找功能使用 `<leader>f` 前缀
- 切换功能使用 `<leader>t` 前缀

### 配置文件结构
- 每个插件有独立的配置文件
- 复杂配置分离到 `config/` 目录
- 工具函数放在 `utils.lua` 中

### 文件类型特定配置
- 在 `after/ftplugin/` 中设置文件类型特定的 LSP
- 使用 `vim.lsp.enable` 启用对应的 LSP 服务器

## 特殊功能

### Python 开发
- 使用 pylsp + ruff 组合
- 支持 Snakemake 和 Ganga 框架
- 提供交互式 Python 运行模板

### LaTeX 支持
- 使用 vimtex 插件
- 配置在 `lua/custom/plugins/vimtex.lua`

### Markdown 支持
- 配置了渲染和预览功能
- 支持数学公式和图表

### 远程开发
- 使用 remote-nvim 进行远程开发
- 配置在 `lua/custom/plugins/remote-nvim.lua`
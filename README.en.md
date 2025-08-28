# 💻 dotfiles

> _My personal dotfiles collection, including Neovim, Kitty, Starship, and other development environment configurations_

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/OS-macOS-blue?logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green?logo=neovim&logoColor=white)](https://neovim.io/)
[![Kitty](https://img.shields.io/badge/Kitty-0.35+-orange?logo=kitty&logoColor=white)](https://sw.kovidgoyal.net/kitty/)
[![Starship](https://img.shields.io/badge/Starship-1.18+-purple?logo=starship&logoColor=white)](https://starship.rs/)

[🇨🇳 中文版本](README.md) | [🇺🇸 English Version](README.en.md)

</div>

## 🚀 Features

- **🎨 Modern Neovim Configuration** - Lua-based with lazy.nvim plugin manager
- **🌲 Everforest Theme** - Unified visual experience with eye-friendly green theme
- **🔧 Complete LSP Support** - Python, Lua, Rust, Go, TypeScript and more
- **📝 Code Snippets** - Intelligent snippets for multiple languages
- **🖥️ Terminal Configuration** - Kitty terminal with Starship prompt
- **🎯 Modular Design** - Easy to maintain and extend configuration structure

## 📁 Configuration Overview

### Neovim ([`./neovim/`](./neovim/))
- **Plugin Management**: lazy.nvim automatic plugin management
- **LSP Support**: Python (pylsp + ruff), Lua, Rust, Go, TS/JS, etc.
- **Code Formatting**: conform.nvim unified code formatting
- **Debugging**: nvim-dap debugger support
- **Task Management**: overseer.nvim task runner
- **File Browser**: oil.nvim modern file manager
- **Themes**: Everforest, Catppuccin, Nord, etc.

### Kitty ([`./kitty/`](./kitty/))
- **Theme Configuration**: Everforest, Mocha, and other themes
- **Font Support**: Multiple Nerd Font configurations
- **Performance**: Background blur, transparency, and visual effects
- **Keybindings**: Efficient keyboard mappings and operations

### Starship ([`./starship/`](./starship/))
- **Prompt Customization**: Elegant command-line prompt
- **Theme Colors**: Everforest color scheme
- **Information Display**: Git, Python, Node.js, Rust, and other environment info

### Yazi ([`./yazi/`](./yazi/))
- **File Management**: Modern terminal file manager
- **Theme Configuration**: Everforest, Catppuccin, and other themes
- **Plugin Support**: parent-arrow, smart-enter, starship, and other plugins
- **Keybindings**: Efficient file operation shortcuts

### FZF
- **Fuzzy Finding**: Command-line fuzzy finder tool
- **Keybindings**: Shell-integrated shortcut operations

## 🛠️ Installation & Usage

### Clone Repository
```bash
git clone https://github.com/ethanbao27/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Create Symbolic Links
```bash
# Neovim
ln -s ~/dotfiles/neovim ~/.config/nvim

# Kitty
ln -s ~/dotfiles/kitty ~/.config/kitty

# Starship
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# Yazi
ln -s ~/dotfiles/yazi ~/.config/yazi
```

### Install Dependencies
```bash
# Neovim plugins
nvim --headless "+Lazy sync" +qa

# Kitty fonts (if needed)
# Select your preferred font in ~/.config/kitty/kitty.conf
```

## 📸 Preview

### Kitty Interface
![Kitty Screenshot](screenshots/terminal.png)

## 🎨 Themes

Currently using **Everforest** theme, providing a comfortable green eye-care experience. Supported themes include:
- Everforest (default)
- Catppuccin
- Nord
- Mocha

## 📖 Installation Guide

For detailed installation instructions, see [Installation Guide](INSTALLATION.md).

## 🤝 Acknowledgments

Special thanks to [patricorgi's config](https://github.com/patricorgi/dotfiles) for Neovim configuration inspiration.

## 📄 License

This project is licensed under the [MIT License](LICENSE) - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
Made with ❤️ by <a href="https://github.com/ethanbao27">baoyuxiang</a>
</div>
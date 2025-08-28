# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME='powerlevel10k/powerlevel10k'
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
autojump
)
#zsh-autosuggestions
#zsh-syntax-highlighting
source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"

#ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#FF79C6'
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#FF79C6'
#ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#FF79C6'
## Serializable / Configuration Languages
## Storage
## Strings
#ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#F1FA8C'
#ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#F1FA8C'
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#F1FA8C'
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#FF5555'
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#F1FA8C'
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#FF5555'
#ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#F1FA8C'
## Variables
#ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#FF5555'
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[assign]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#F8F8F2'
## No category relevant in spec
#ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FF5555'
#ZSH_HIGHLIGHT_STYLES[path]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#FF79C6'
#ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#FF79C6'
#ZSH_HIGHLIGHT_STYLES[globbing]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#BD93F9'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#FF5555'
#ZSH_HIGHLIGHT_STYLES[redirection]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[arg0]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[default]='fg=#F8F8F2'
#ZSH_HIGHLIGHT_STYLES[cursor]='standout'

export PATH="/opt/homebrew/anaconda3/bin:$PATH"
export KAGGLE_CONFIG_DIR=~/.kaggle/
export GEM_PATH=/opt/homebrew/lib/ruby/gems/3.3.0
export GEM_HOME=/opt/homebrew/lib/ruby/gems/3.3.0
export PATH="/opt/homebrew/bin:$PATH"
export NVM_DIR=~/.nvm
export HEXO_ALGOLIA_INDEXING_KEY=7a8d42ca35e1abc59a2f9a22aca1be1c
source $(brew --prefix nvm)/nvm.sh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi


fpath+=/opt/homebrew/share/zsh/site-functions

eval $(thefuck --alias)

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
alias vim='nvim'
alias fzf='x fzf'
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
alias fcd='cd "$(find . -type d | fzf --preview="ls -la {}")"'
alias fvi='vim "$(find . -type f | fzf --preview="cat {}")"'
alias gcb='git branch | fzf | cut -c 3- | xargs git checkout'
export TLDR_LANG=zh
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"
export NVIM=/opt/homebrew/bin/nvim
export EDITOR='nvim'

[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

alias e='exit'
alias v='nvim'
alias nc='netcat'

alias ls='eza --icons'
alias ll='eza -a --icons'
alias la='eza -l'
alias cat='bat'
alias cl='clear'
alias icat="kitten icat"
alias s="kitten ssh"
alias poketex="poketex -l zh"
# 盒盖休眠自定义命令 用于屏幕镜像
alias disablelock='sudo -i pmset -a disablesleep 1'
alias enablelock='sudo -i pmset -a disablesleep 0'

alias neofetch='neofetch --config none'

alias neovide='neovide --frame none'

# hugo博客快捷键发布
# alias hugoblogdeploy="git push master "$(git subtree split --prefix public master)":gh-pages"

# pnpm
export PNPM_HOME="/Users/baoyuxiang/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# npm

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# 之后再初始化 pyenv
eval "$(pyenv init --path)"

# starship
export STARSHIP_CONFIG="$HOME/.config/starship-everforest.toml"
eval "$(starship init zsh)"

export PATH=$PATH:/Users/baoyuxiang/.spicetify

export HTTPS_PROXY=http://127.0.0.1:7890 
export HTTP_PROXY=http://127.0.0.1:7890 
export ALL_PROXY=socks5://127.0.0.1:7890

export PATH="$PATH:/Applications/GoLand.app/Contents/MacOS"
export PATH="$PATH:/Applications/RustRover.app/Contents/MacOS"

export PATH="$PATH:~/.local/share/nvim/mason/bin/bash-language-server"

[ -f "/Users/baoyuxiang/.ghcup/env" ] && . "/Users/baoyuxiang/.ghcup/env" # ghcup-env

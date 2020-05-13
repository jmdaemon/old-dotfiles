# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# https://github.com/ohmyzsh/ohmyzsh/issues/7332#issuecomment-593308026
skip_global_compinit=1
ZSH_CACHE_DIR=$HOME/.cache/zsh
ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump-${HOST/.*/}-${ZSH_VERSION}"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Custom Prompt
POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_COLOR_SCHEME='gruvbox'
#POWERLEVEL9K_CUSTOM_OS_ICON="echo   $(whoami) "
#POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND="black"
#POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND="white"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator anaconda virtualenv dir dir_writable vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh root_indicator anaconda virtualenv dir dir_writable vcs)


POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K="truncate_beginning"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

#PROMPT="%K{black}%F{white} %F{cyan}%f %m %K{red}%F{black}"$'\ue0b0'"%k"
#PROMPT+="%K{red}%F{white} %(4~|%-1~/…/%2~|%4~) %k%F{red}"$'\ue0b0'"%k"
#PROMPT+="%K{yellow}%F{black}  $(git_prompt_info)%k%F{yellow}"$'\ue0b0'"%k"
#PROMPT+="%F{yellow} $ %k%f"

#RPROMPT="%F{yellow}"$'\ue0b2'"%K{yellow}%F{black}  $(git_prompt_info)%k%f"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "

HISTFILE=$HOME/.history/zsh/arch-laptop/.zsh_history
HISTSIZE=10000
SAVEHIST=10000



fpath=(~/config/.zsh/completion $fpath)
#autoload -Uz compinit && compinit -i
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.  COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    # tmux
    # docker
    # docker-compose

)

# Added in quick hack
source $ZSH/oh-my-zsh.sh

# Aliases
## LSD - https://github.com/Peltoche/lsd 
alias l='ls -l'
alias ls='lsd'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# NeoViM
alias nv='nvim'

# X Server copy to clipboard
alias xclip='xclip -selection c'

# Git Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

cfgm () { 
    msg=$1
    config commit -m $msg
}

# GitHub wrapper for Git - https://hub.github.com/
#alias git=hub
#alias gpr='git pull-request -m "$(git log -1 --pretty=%B)"'
#clonefork() {
#hub clone "$1"
#cd "${1##*/}"
#hub fork
#}

# If colorscheme is gruvbox
# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
# source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
#

case $HOST in
    "Laptop" | rina) 
        # Make everything twice as big
        export GDK_SCALE=2
        export GDK_DPI_SCALE=0.5
        ;;
    "PC" | avalon)
        # Default sizes
        export GDK_SCALE=1
        export GDK_DPI_SCALE=1
        ;;
    *) ;;
esac

source $HOME/.profile
fortune | cowsay

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda config --set auto_activate_base False

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

if [[ $HOST == "kali" ]]; then
    sudo su
fi

# Persistent Tmux Sessions
#if [ $(tty) == /dev/tty1 ]; then
#  /usr/bin/tmux new -s 0
#  /usr/bin/tmux attach -t 0
#fi

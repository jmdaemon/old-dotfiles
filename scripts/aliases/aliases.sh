#!/bin/bash/

# LSD - https://github.com/Peltoche/lsd 
alias l='ls -l'
alias ls='lsd'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Hub - https://hub.github.com/
#alias git=hub
#alias gpr='git pull-request -m "$(git log -1 --pretty=%B)"'
#clonefork() {
#hub clone "$1"
#cd "${1##*/}"
#hub fork
#}

# Shortcuts
alias nv='nvim'
alias xclip='xclip -selection c' # X Server copy to clipboard
alias start_env="source $HOME/.config/dotfiles/scripts/startup/start-env.sh"
alias pkgs="expac -H M '%m\t%n' | sort -h"
alias conda-init="source $DOTFILES/scripts/terminal/conda-init.sh"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
#alias npm-list=`ls -l $(npm root -g) | cut -d ' ' -f 12`

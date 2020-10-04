#!/bin/bash/

# Naming Convention:
# g -> goto

alias fonts="$XDG_DATA_HOME"/fonts
alias gconfig=$XDG_CONFIG_HOME/git/config

# LSD - https://github.com/Peltoche/lsd 
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

# ML
alias gml="cd $HOME/workspace/ml/fastai"
alias gdev="cd $HOME/git/fastai_dev/"
alias gdocs="cd $HOME/git/fastai_docs/"
alias gcv="cd $HOME/git/course-v3"
alias gfast="cd $HOME/git/fastprogress"

alias gts="cd $HOME/workspace/School/" 
alias gtws="cd $HOME/workspace"

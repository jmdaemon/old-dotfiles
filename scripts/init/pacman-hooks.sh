#!/bin/bash

DEST="/etc/pacman.d/hooks"
HOOKS_DIR="$HOME/.config/dotfiles/hooks/pacman"
REHASH_DIR=/var/cache/zsh

# https://wiki.archlinux.org/title/Zsh#On-demand_rehash
setup_zsh_auto_rehash() {
    if [[ ! -d $DEST ]]; then sudo mkdir $DEST; else :; fi
    if [[ ! -z $DEST/zsh.hook ]]; then sudo cp $HOOKS_DIR/zsh.hook $DEST; else :; fi
    if [[ ! -d $REHASH_DIR ]]; then sudo mkdir $REHASH_DIR; else :; fi

}

show_usage() {
    echo "Usage: pacman-hooks.sh [hook]"
    echo "      -r, --rehash,       Rehash to find new executables in \$PATH"
    echo "                          after new package installation"
    echo ""
}

if [[ -z $1 ]]; then
  show_usage
elif [[ $1 == "-r" || $1 == "--rehash" ]]; then
    setup_zsh_auto_rehash
else 
    show_usage
fi

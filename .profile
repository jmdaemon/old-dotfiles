# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="/$HOME/bin:$PATH"
fi

XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
XDG_CACHE_HOME="$HOME/.cache"

SBIN=/usr/sbin
NPM=$HOME/npm/bin
RUST=$HOME/.cargo/bin
GO=/usr/local/go/bin
LOCAL=$HOME/.local/bin
RVM=$HOME/.rvm/bin

# Languages
export CARGO_HOME="$XDG_DATA_HOME"/cargo 
export GOPATH="$XDG_DATA_HOME"/go 
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem   
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup 
export STACK_ROOT="$XDG_DATA_HOME"/stack
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NVM_DIR="$XDG_DATA_HOME"/nvm 

# History 
export GDBHISTFILE=$HOME/.history/gdb/arch-laptop/.gdb_history

# Applications
#export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default 
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle


if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export PATH=$PATH:$SBIN:$NPM:$RUST:$GO:$LOCAL:$RVM

OPENJDK_8=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JAVA_HOME=/usr/lib/jvm/java-14-openjdk

export CFG=$HOME/.cfg/
export WEECHAT_HOME=$CFG/.weechat/
export KAGGLE_CONFIG_DIR=$CFG/.kaggle/
export NPM_CONFIG_USERCONFIG=$CFG/.npm/
export GNUPGHOME=$CFG/.gnupg
#export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
#export LIBVIRT_DEFAULT_URI='qemu:///system'

export EDITOR=nvim
ALIAS="$HOME/.cfg/scripts/aliases"

source $ALIAS/shared.sh
source $ALIAS/nvidia.sh
source $ALIAS/pacman.sh
source $ALIAS/school.sh
source $HOME/.cfg/scripts/tstart/fortunecow.sh

#export GOPATH="$HOME/workspace/go_projects"
#export GOBIN="$GOPATH/bin"

# fortune | cowsay
#export PATH=~/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Persistent Tmux Sessions
#/usr/bin/tmux attach -t 0

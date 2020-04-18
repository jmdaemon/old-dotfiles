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

SBIN=/usr/sbin
NPM=$HOME/npm/bin
RUST=$HOME/.cargo/bin
GO=/usr/local/go/bin
LOCAL=$HOME/.local/bin
RVM=$HOME/.rvm/bin

export PATH=$PATH:$SBIN:$NPM:$RUST:$GO:$LOCAL:$RVM
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
#export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
#export LIBVIRT_DEFAULT_URI='qemu:///system'

export CFG=$HOME/.cfg/
export WEECHAT_HOME=$CFG/.weechat/
export KAGGLE_CONFIG_DIR=$CFG/.kaggle/
export NPM_CONFIG_USERCONFIG=$CFG/.npm/
export GNUPGHOME=$CFG/.gnupg/

#export GOPATH="$HOME/workspace/go_projects"
#export GOBIN="$GOPATH/bin"

# fortune | cowsay
#export PATH=~/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Persistent Tmux Sessions
#/usr/bin/tmux attach -t 0

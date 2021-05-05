#!/bin/bash/

# Manually Launch Zsh
# if [ -t 1 ]; then
# exec zsh
# fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
## For conda installed in $HOME
#__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        #. "$HOME/anaconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="$HOME/anaconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#conda config --set auto_activate_base False

## For conda installed in /opt/
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda config --set auto_activate_base False

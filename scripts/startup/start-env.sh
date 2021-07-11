#!/usr/bin/zsh
CONDA_PATH="/opt/anaconda/etc/profile.d/conda.sh"

WORK_DIR="$HOME/git/ml"
PORT=8887

start_conda_env() {
    conda activate $1
    #find ./git/ -mindepth 1 -maxdepth 1 -type d -not -path "./git/i3" -not -path "./git/opencv_build" -not -path "./git/swift_build" -not -path "./git/nerd-fonts"  -print -execdir git --git-dir={}/.git --work-tree=$PWD/git/{} pull origin master \;
    #cd ./git/fastai/
    #jupyter notebook --no-browser --port=8887

    cd ./git/fastai/ 
    find $WORK_DIR \
        -mindepth 1 \
        -maxdepth 1 \
        -type d \
        -print \
        -execdir git --git-dir={}/.git \
        --work-tree=$WORK_DIR/{} pull origin master \;
    cd $WORK_DIR
    jupyter notebook --no-browser --port=$PORT
}

show_usage() {
    echo "Usage: start_env.sh [conda_environment]"
}

echo "Loading anaconda..."
source $CONDA_PATH
ENVS_LIST=$(conda info --envs | tail -n +3 | awk '{print $1}' | awk '{printf $1 " "}END{printf "\n"}')

if [[ -z $1 ]]
  then
      show_usage
elif echo ${ENVS_LIST[@]} | grep -q -w $1
  then 
      start_conda_env
else
    show_usage
fi

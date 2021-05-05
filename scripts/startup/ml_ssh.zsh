#!/usr/bin/zsh

source ~/anaconda3/etc/profile.d/conda.sh
conda activate swift
find ./git/ -mindepth 1 -maxdepth 1 -type d -not -path "./git/i3" -not -path "./git/opencv_build" -not -path "./git/swift_build" -not -path "./git/nerd-fonts"  -print -execdir git --git-dir={}/.git --work-tree=$PWD/git/{} pull origin master \;
cd ./git/fastai/
jupyter notebook --no-browser --port=8887

#!/usr/bin/zsh

source ~/anaconda3/etc/profile.d/conda.sh
conda activate swift
## Git pull all repositories

# This one is used only for current directory
#find ./git/ -mindepth 1 -maxdepth 1 -type d -not -path "./i3" -not -path "./opencv_build" -not -path "./swift_build" -not -path "./nerd-fonts"  -print -execdir git --git-dir=./{}/.git --work-tree=$PWD/{} pull origin master \;
find ./git/ -mindepth 1 -maxdepth 1 -type d -not -path "./git/i3" -not -path "./git/opencv_build" -not -path "./git/swift_build" -not -path "./git/nerd-fonts"  -print -execdir git --git-dir={}/.git --work-tree=$PWD/git/{} pull origin master \;
cd ./git/fastai/
jupyter notebook

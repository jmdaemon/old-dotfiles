#!/bin/bash

CUDNN=http://files.fast.ai/files/cudnn-10.2-linux-x64-v7.6.5.32.tgz

mkdir -p $HOME/download && cd $HOME/download
wget $CUDNN
tar xf cudnn-10*.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
sudo ldconfig

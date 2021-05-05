#!/bin/bash

CUDA=http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run

mkdir -p $HOME/download && cd $HOME/download
wget $CUDA
chmod u+x cuda_1*_linux*
sudo ./cuda_*_linux.run --silent --toolkit
echo /usr/local/cuda/lib64 | sudo tee -a /etc/ld.so.conf
sudo ldconfig

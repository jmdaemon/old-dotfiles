#!/bin/bash

# Anaconda
cd $HOME/download
# Latest
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-*.sh -b
cd 
# If you haven't already initialized this in your .zshrc, .bashrc, and or .profile:
#   conda init
#   source ~/.bashrc

# Fastai
ENV="fastai"
conda create -y -n $ENV python=3.6
conda activate $ENV
conda install -y -c pytorch -c fastai fastai 
conda uninstall --force jpeg libtiff -y
conda install -y -c conda-forge libjpeg-turbo pillow==6.0.0
CC="cc -mavx2" pip install --no-cache-dir -U --force-reinstall --no-binary :all: --compile pillow-simd
conda deactivate

# Fastai - Audio
ENV="fastai_audio"
conda create -y -n $ENV python=3.6
conda activate $ENV
conda install -y -c pytorch -c fastai fastai
cd $HOME/workspace/fastai_audio && ./install.sh
conda uninstall --force jpeg libtiff -y
conda install -y -c conda-forge libjpeg-turbo pillow==6.0.0
CC="cc -mavx2" pip install --no-cache-dir -U --force-reinstall --no-binary :all: --compile pillow-simd
conda deactivate

# Fastai - Swift + Tensorflow
ENV="s4tf"
conda create -n $ENV -y  python=3.6
conda activate $ENV
conda install -y matplotlib scikit-learn tensorflow-gpu jupyter numpy
conda deactivate


# You should get the newest versions here: https://developer.nvidia.com/cuda-downloads
# NVIDIA="NVIDIA-Linux-x86_64-440.31.run"
CUDA="cuda_10.1.243_418.87.00_linux.run"
CUDNN="cudnn-10.1-linux-x64-v7.6.3.30.tgz"

cd download
if [[ ! -e $HOME/download/$CUDA ]]; then
    wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/$CUDA
fi
chmod u+x cuda_1*_linux*
sudo sh /cuda_*_linux.run --silent --toolkit --driver
echo /usr/local/cuda/lib64 | sudo tee -a /etc/ld.so.conf 
sudo ldconfig
#echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc ; source ~/.bashrc

cd $HOME/download # CUDNN
if [[ ! -e $HOME/download/$CUDNN ]]; then
    wget http://files.fast.ai/files/$CUDNN
fi

tar xf cudnn-10*.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
sudo ldconfig

# Set up Jupyter's extensions
jupyter notebook --generate-config
cat << 'EOF' >> ~/.jupyter/jupyter_notebook_config.py
c.NotebookApp.open_browser = False
#c.NotebookApp.token = ''
EOF
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable collapsible_headings/main
mkdir $HOME/.jupyter/custom
echo '.container { width: 99% !important; }' > ~/.jupyter/custom/custom.css

# Swift
cd $HOME/download/
wget https://storage.googleapis.com/s4tf-kokoro-artifact-testing/latest/swift-tensorflow-DEVELOPMENT-cuda10.0-cudnn7-ubuntu18.04.tar.gz
sudo apt-fast -y install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev systemtap-sdt-dev tzdata rsync
tar xf swift-tensorflow-DEVELOPMENT-cuda10.0-cudnn7-ubuntu18.04.tar.gz
cd && mkdir swift && cd swift
mv $HOME/download/usr ./
cd

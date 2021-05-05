#!/bin/bash

# Nightly Build
# NURL="https://storage.googleapis.com/swift-tensorflow-artifacts/nightlies/latest/" 
# NSWIFT="swift-tensorflow-DEVELOPMENT-cuda10.2-cudnn7-ubuntu18.04.tar.gz"
URL="https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.11/rc2/"
SWIFT="swift-tensorflow-RELEASE-0.11-cuda10.2-cudnn7-ubuntu18.04.tar.gz"
ENV="swift"

mkdir -p $HOME/download
# wget $NURL/$NSWIFT
wget $URL/$SWIFT -P $HOME/download
mkdir -p $HOME/swift/
mv $HOME/download/usr $HOME/swift/
cd $HOME/git/swift-jupyter/ && git pull origin master
conda activate $ENV
python register.py --sys-prefix --swift-python-use-conda --use-conda-shared-libs   --swift-toolchain ~/swift

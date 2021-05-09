#!/bin/bash

URL="https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.11/rc2/"
SWIFT="swift-tensorflow-RELEASE-0.11-cuda10.2-cudnn7-ubuntu18.04.tar.gz"
ENV="swift"

mkdir -p $HOME/swift/
wget $URL/$SWIFT -P $HOME/Download
mv $HOME/Download/usr $HOME/swift/
cd $HOME/git/swift-jupyter/ && git pull origin master
conda activate $ENV
python register.py --sys-prefix --swift-python-use-conda --use-conda-shared-libs  --swift-toolchain ~/swift

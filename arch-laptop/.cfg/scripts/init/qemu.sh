#!/bin/bash


URL="https://downloads.raspberrypi.org/raspbian/images/"

JIMG=2017-04-10-raspbian-jessie
BIMG=2019-07-10-raspbian-buster

JURL=$URL/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip
BURL=$URL/raspbian-2019-07-12/2019-07-10-raspbian-buster.zip

DIR=$HOME/workspace/qemu_vms/images
MP=/mnt/raspbian

mkdir -p $DIR && cd $DIR

wget -N - $JURL $BURL 
unzip -u $JIMG.zip $BIMG.zip

git clone https://github.com/dhruvvyas90/qemu-rpi-kernel $HOME/qemu_vms 2> /dev/null || git -C $HOME/qemu_vms/qemu-rpi-kernel pull 

jstart=$(sudo fdisk -l "$HOME/qemu_vms/images/$JIMG.img" | tail -n -1 | tr -s ' ' | cut -d ' ' -f 2) # Offset: 47185920 (92160 * 512)
bstart=$(sudo fdisk -l "$HOME/qemu_vms/images/$BIMG.img" | tail -n -1 | tr -s ' ' | cut -d ' ' -f 2) # Offset: 276824064 (540672 * 512)

sudo mkdir -p {$MP/jessie,$MP/buster}
sudo mount -v -o offset=47185920 -t ext4 $DIR/$JIMG.img $MP/jessie 
sudo mount -v -o offset=276824064 -t ext4 $DIR/$BIMG.img $MP/buster 
sudo sed -i -e 's/^/#/' $MP/jessie/etc/ld.so.preload $MP/buster/etc/ld.so.preload

sudo cat $MP/jessie/etc/fstab $MP/buster/etc/fstab  # Check fstab for errors
sudo umount -R $MP

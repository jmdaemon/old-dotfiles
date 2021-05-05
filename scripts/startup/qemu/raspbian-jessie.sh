#!/bin/bash

Jessie=2017-04-10-raspbian-jessie
JKernel=kernel-qemu-4.4.34-jessie
DIR=$HOME/workspace/qemu_vms/
#qemu-system-arm \
#-kernel "$HOME/$DIR/qemu-rpi-kernel/$JKernel" \
#-cpu arm1176 \
#-m 256 \
#-M versatilepb \
#-serial stdio \
#-append "root=/dev/sda2 rootfstype=ext4 rw" \
#-hda "$HOME/$DIR/images/$Jessie.img" \
#-nic user,hostfwd=tcp::5022-:22 \
#-no-reboot ;;
sudo qemu-system-arm -kernel $DIR/qemu-rpi-kernel/$JKernel -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda $DIR/images/raspbian.img -nic user,hostfwd=tcp::5022-:22

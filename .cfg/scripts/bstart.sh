#!/bin/bash

Buster="2019-07-10-raspbian-buster"
BKernel="kernel-qemu-4.19.50-buster"

qemu-system-aarch64 \ 
    -kernel "$HOME/$DIR/qemu-rpi-kernel/$BKernel" \
    -cpu arm1176 \
    -m 256 \
    -M versatilepb \
    -serial stdio \
    -append "root=/dev/sda2 rootfstype=ext4 rw" \
    -hda "$HOME/$DIR/images/$Buster.img" \
    -dtb $HOME/qemu_vms/qemu-rpi-kernel/versatile-pb.dtb \
    -net user,hostfwd=tcp::5022-:22 \
    -no-reboot

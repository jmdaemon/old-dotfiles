#!/bin/bash

echo "
[greeter]
theme-name = Flat-Remix-GTK-Red-Darker
icon-theme-name = Flat-Remix-Red-Dark
font-name = Sans 13
background = /usr/share/pixmaps/Firewatch.jpg
clock-format = %a - %m/%d/%y - %H:%M - %I:%M%p
xft.dpi = 220
xft-antialias = true
xft-dpi = 150
xft-rgba = rgb
xft-hintstyle = hintfull

" | sudo tee /etc/lightdm/lightdm-gtk-greeter.conf

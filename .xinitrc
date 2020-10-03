#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xrdb -merge ~/.Xresources
xrandr --dpi 240

. ~/.fehbg
rofi &
mpd &
picom -b
bash ~/.config/polybar/launch.sh

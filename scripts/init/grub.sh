#!/bin/bash

## https://wiki.archlinux.org/index.php/GRUB
WALLPAPER=$HOME/Pictures/Backgrounds/mbjtwkC.png
FONT=/boot/grub/fonts/DejaVuSansMono36.pf2
DEFAULT_GRUB=/etc/default/grub

make_bigger_font() {
    sudo grub2-mkfont -s 36 -o $FONT /usr/share/fonts/dejavu/DejaVuSansMono.ttf
}

customize_default_grub() {
    sudo sed -i 's,GRUB_BACKGROUND.*,GRUB_BACKGROUND='"$WALLPAPER"',' "$DEFAULT_GRUB"   # Change bootloader background
    if [[ ! -z $FONT ]]; then make_bigger_font; else :; fi                              # Make font if not generated
    sudo sed -i 's,GRUB_FONT.*,GRUB_FONT='"$FONT"',' "$DEFAULT_GRUB"                    # Change bootloader font
}

create_custom_grub_cfg() {
    echo "
    menuentry \"System Shutdown\" {
      echo "System shutting down..."
      halt
    }

    menuentry \"System Restart\" {
      echo "System rebooting..."
      reboot
    }

    if [ ${grub_platform} == \"efi\" ]; then
      menuentry \"Firmware Setup\" {
        fwsetup
      }
    fi
    " | sudo tee /boot/grub/custom.cfg
} 

show_usage() {
    echo "Usage: grub.sh [action]"
    echo "  -c, --customize,            Change grub background and font"
    echo "  -b, --boot-entry,           Add grub boot entries to a custom grub.cfg file"
    echo "  -a, --all,                  Modify grub background, font, and grub.cfg file"
    echo ""
}

if [[ -z $1 ]]; then
  show_usage
elif [[ $1 == "-c" || $1 == "--customize" ]]; then
    customize_default_grub
elif [[ $1 == "-b" || $1 == "--boot-entry" ]]; then
    create_custom_grub_cfg
elif [[ $1 == "-a" || $1 == "--all" ]]; then
    customize_default_grub
    create_custom_grub_cfg
else 
    show_usage
fi

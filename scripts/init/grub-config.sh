#!/bin/bash

WALLPAPER=$HOME/backgrounds/mbjtwkC.png
FONT=/boot/grub/fonts/DejaVuSansMono36.pf2
TEST="$TEST"
#sed -i 's,GRUB_BACKGROUND.*,GRUB_BACKGROUND='"$WALLPAPER"',' "$TEST" # Change bootloader background
#sudo grub2-mkfont -s 36 -o $FONT /usr/share/fonts/dejavu/DejaVuSansMono.ttf
#sed -i 's,GRUB_FONT.*,GRUB_FONT='"$FONT"',' "$TEST" # Change bootloader font

# https://wiki.archlinux.org/index.php/GRUB
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

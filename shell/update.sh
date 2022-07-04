#!/usr/bin/bash

yes | yay -Syu

# 蓝牙
#sudo modprobe btusb
#sudo modprobe hci_uart
# 加密盘
#sudo modprobe dm_crypt
# 虚拟机
#sudo modprobe vboxdrv
#sudo modprobe vboxnetadp
#sudo modprobe vboxnetflt
#sudo vboxreload

sudo mkinitcpio -p linux
sudo grub-mkconfig -o /boot/grub/grub.cfg
#update-desktop-database -v /home/mike/.local/share/applications
#sudo update-desktop-database -v /usr/local/share/applications
# 刷新字体缓存
fc-cache -fv
#fc-cache -fv /home/mike/.local/share/fonts


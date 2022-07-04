#!/usr/bin/bash
echo "Pass 1"
sudo umount /dev/sr0
rm -f dvd.iso
dd if=/dev/sr0 of=dvd.iso status=progress
sudo sync
md5sum dvd.iso
echo "Pass 2"
dd if=/dev/sr0 bs=2048 count=$(( $(stat -c "%s" dvd.iso) / 2048 )) status=progress | md5sum
#eject /dev/sr0


#!/usr/bin/bash
# sudo ntpdate -u ntp.ntsc.ac.cn && \
# sudo ntpdate -u pool.ntp.org && \
sudo ntpdate pool.ntp.org && \
    sudo hwclock --systohc --utc

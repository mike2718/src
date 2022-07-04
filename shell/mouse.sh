#!/usr/bin/bash
echo -e "select E0:2A:82:CD:EA:88\npower on\nagent on\ndefault-agent\npair 98:FD:B4:81:2E:EE\ntrust 98:FD:B4:81:2E:EE\nconnect 98:FD:B4:81:2E:EE\n" | bluetoothctl

#!/usr/bin/bash
SSID="ASUS_5G"
PASSWORD=$(head /dev/random | tr -dc '[:alnum:]' | head -c63)
echo "WIFI:T:WPA;S:$SSID;P:$PASSWORD;;"
qrencode -s 6 -d 300 -l H -o "wifi-5g.png" "WIFI:T:WPA;S:$SSID;P:$PASSWORD;;"

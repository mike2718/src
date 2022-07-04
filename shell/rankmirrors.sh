#!/usr/bin/bash
curl -s "https://archlinux.org/mirrorlist/?country=CN&protocol=http&ip_version=4&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 -


#!/bin/bash

#to create wallpaper with Imagemagick

#to get the list of colors and save it in a folder
if [ -e /home/$USER/color.txt ];then
   null=$null1
else
   convert -list color | cut -d "(" -f 1 | sed 's/srgb//g'| sed -n '6,$p' > /home/$USER/color.txt
fi

#for selecting colors randomly 

rand=$(openssl rand 2 | od -DAn | tr -d " ")

select=$[ ( $rand % 3 ) + 1 ]
num1=$[ ( $rand % 680 ) + 1 ]
num2=$[ ( $rand % 680 ) + 1 ]

color1=$(sed -n "${num1}p" /home/$USER/color.txt)

color2=$(sed -n "${num2}p" /home/$USER/color.txt)


if [ $select == 1 ];then
   convert -size 1600x900  plasma:$color1 random.jpg
elif [ $select == 2 ];then
   convert -size 1600x900  plasma:"$color1-$color2" random.jpg
else
   convert -size 1600x900  plasma:fractal random.jpg
fi


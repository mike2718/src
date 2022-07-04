#!/bin/bash
OIFS="$IFS"
IFS=$'\n'
list=$(find . -type f | shuf)
numleft=$(echo "$list" | wc -l)
for file in $list ; do
	ending=$(echo "$file" | sed 's/\(.*\)\.\(.*\)$/\2/')
	
	#include this block if you want to have 5% recovery data
	if [ ! -e "$file-5p.par2" ] && [ "$ending" != "par2" ] && [ "$ending" != "sig" ] && [ "$(stat --format=%s "$file")" != 0 ]; then
		echo "$numleft original files left"
		par2create -q -n1 -r5 "$file"
		rm "$file".par2
		mv "$file".vol*par2 "$file"-5p.par2
	fi
	
	#include this block if you want to have 100% recovery data
#	if [ ! -e "$file-100p.par2" ] && [ "$ending" != "par2" ] && [ "$ending" != "sig" ] && [ "$(stat --format=%s "$file")" != 0 ]; then
#		echo "$numleft original files left"
#		par2create -q -n1 -r100 "$file"
#		rm "$file".par2
#		mv "$file".vol*par2 "$file"-100p.par2
#	fi
	
	#include this block if you want to check for normal AND cryptographic integrity 
#	if [ ! -e "$file.sig" ] && [ "$ending" != "par2" ] && [ "$ending" != "sig" ]; then
#		gpg --default-key 40FEA41DCC55C0D8D1AF814C17C22010D29A50BC --detach-sign --yes "$file"
#	fi
	
	numleft=$((numleft-1))
done
IFS="$OIFS"


#!/bin/bash

for i in {1..12}; do
    for j in {1..5}; do
        echo -n -e "$(head /dev/urandom | tr -dc "[:upper:]" | head -c5)\t"
    done
    echo
done


#!/usr/bin/bash

#echo $(head /dev/random | tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' | head -c8)
#echo $(head /dev/random | tr -dc [:graph:] | head -c8)

# 生成微信/支付宝密码
# echo $(head /dev/random | tr -dc [:digit:] | head -c6)

# 生成5个数字或字母的密码
for i in {1..5}; do
    echo $(head /dev/random | tr -dc [:alnum:] | head -c10)
done


#!/usr/local/bin/awk -f
# 使用7 Days to End with You游戏中奇怪字符密码进行加密的awk程序
# 在one true awk version 20220530中测试通过
# 请先看把密码字符转换成可输入字符的对应表：
# https://www.sakuranamiki.net/7days/index.html
#
BEGIN {
    for(n=0;n<256;n++)
        ord[sprintf("%c",n)]=n
    for(n=0;n<256;n++)
        chr[n]=sprintf("%c",n)
    printf "%-10s %s\n", "Input text", "Encrypted string"
    printf "%-10s %s\n", "----------", "----------"
}
match($0, /[a-zA-Z]+$/) {
    FS = "\000"
    n=split($0, m)
    printf "%-10s ", $0
    sum = 0
    for(i=1; i<=n; i++) {
        c = ord[m[i]] - 97
        sum = sum + c
    }
    s = int(sum / 12 + 0.5)
    #printf "sum = %d, shift = %d, ", sum, s
    for(i=1; i<=n; i++) {
        if(ord[m[i]] - 97 + s >= 25)  # through 'z'
            printf "%c", s - 25 + ord[m[i]]
        else
            printf "%c", ord[m[i]] + s
    }
    printf " (shift = %d)", s
    printf "\n\n"
}
END {
}

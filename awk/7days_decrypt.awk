#!/usr/local/bin/awk -f
# 穷举7 Days to End with You游戏中奇怪字符密码的awk程序
# 在one true awk version 20220530中测试通过
# 请先看把密码字符转换成可输入字符的对应表：
# https://www.sakuranamiki.net/7days/index.html
#
BEGIN {
    for(n=0;n<256;n++)
        ord[sprintf("%c",n)]=n
    for(n=0;n<256;n++)
        chr[n]=sprintf("%c",n)
    printf "%-10s %s\n", "Input text", "Decrypted strings"
    printf "%-10s %s\n", "----------", "----------"
}
match($0, /[a-zA-Z]+$/) {
    FS = "\000"
    n=split($0, m)
    printf "%-10s ", $0
    for(j=0; j<26; j++) {
        for(i=1; i<=n; i++) {
            e=ord[m[i]]
            s=(e + j - 97) % 26 + 97
            #if(s >= 115 && r <= 122)
            #    s = s - 1
            printf "%c", s
        }
        printf "(S=%d), ", j
    }
    printf "\n\n"
}
END {
}

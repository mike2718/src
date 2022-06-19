#!/usr/local/bin/awk -f
# 穷举7 Days to End with You中密码的awk程序
# 在one true awk version 20220530中测试通过
#
BEGIN {
    for(n=0;n<256;n++)
        ord[sprintf("%c",n)]=n
    for(n=0;n<256;n++)
        chr[n]=sprintf("%c",n)
    printf "%-10s %s\n", "密文", "穷举字符串"
    printf "%-10s %s\n", "----------", "----------"
}
match($1, /[a-zA-Z]+$/) {
    FS = "\000"
    n=split($1, m)
    printf "%-10s ", $1
    for(j=0; j<26; j++) {
        for(i=1; i<=n; i++) {
            printf "%c", (ord[m[i]] + 97 + j) % 26 + 97
        }
        printf ", "
    }
}
END {
    printf "\n"
}

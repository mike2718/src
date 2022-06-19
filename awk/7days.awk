#!/usr/local/bin/awk -f
# 穷举7 Days to End with You游戏中奇怪字符密码的awk程序
# 在one true awk version 20220530中测试通过
# 请先看把密码字符转换成可输入字符的对应表：
# https://docs.google.com/document/d/e/2PACX-1vRGVB7DoMCVObCsYQfHpazx60K2PyBUp0FOY588xHX99RjqADFdS4R3gPx5esaYHTSpK_ZR3UEBMe5J/pub
#
BEGIN {
    for(n=0;n<256;n++)
        ord[sprintf("%c",n)]=n
    for(n=0;n<256;n++)
        chr[n]=sprintf("%c",n)
    printf "%-10s %s\n", "密文", "穷举字符串"
    printf "%-10s %s\n", "----------", "----------"
}
match($0, /[a-zA-Z]+$/) {
    FS = "\000"
    n=split($0, m)
    printf "%-10s ", $0
    for(j=0; j<26; j++) {
        for(i=1; i<=n; i++) {
            printf "%c", (ord[m[i]] - 97 + j) % 26 + 97
        }
        printf ", "
    }
    printf "\n\n"
}
END {
}

#!/usr/local/bin/awk -f
# 解密7 Days to End with You游戏中奇怪字符密码的awk程序
# 在one true awk version 20220530中测试通过
# 请先看把密码字符转换成可输入字符的对应表：
# https://docs.google.com/document/d/e/2PACX-1vRGVB7DoMCVObCsYQfHpazx60K2PyBUp0FOY588xHX99RjqADFdS4R3gPx5esaYHTSpK_ZR3UEBMe5J/pub
#
BEGIN {
    for(n=0;n<256;n++)
        ord[sprintf("%c",n)]=n
    for(n=0;n<256;n++)
        chr[n]=sprintf("%c",n)
    printf "%-10s %s\n", "输入密文", "解密后明文"
    printf "%-10s %s\n", "----------", "----------"
}
match($0, /[a-zA-Z]+$/) {
    FS = "\000"
    n = split($0, m)
    printf "%-10s ", $0
    for(i = 0; i <= 11; i++) {
        s = 0
        for(j = 1; j <= n; j++) {
            p = ord[m[j]]
            s = s + (p - 97 - i)
        }
        for(i = 0; i <= 11; i++) {
            if(s / 12 - 1 == i) {
                for(j = 1; j <= n; j++)
                    printf "%c", ord[m[j]] - i
                printf ", "
            }
        }
    }
    printf "\n\n"
}
END {
}

#!/usr/local/bin/awk -f
# ���7 Days to End with You��Ϸ������ַ������awk����
# ��one true awk version 20220530�в���ͨ��
# ���ȿ��������ַ�ת���ɿ������ַ��Ķ�Ӧ��
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

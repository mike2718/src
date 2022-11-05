# �� 7 Days to End with You ��Ϸ������ַ������㷨���ַ������м��ܵ�awk����
# ������֤���ܳ������ַ����Ƿ���ȷ
# �� One true awk version 20220830 �в���ͨ��
# ���ȿ��������ַ�ת���ɿ������ַ��Ķ�Ӧ��
# https://www.sakuranamiki.net/7days/index.html
#
BEGIN {
    FS = "\000"
    for(n=0;n<256;n++)
        ord[sprintf("%c",n)]=n
    for(n=0;n<256;n++)
        chr[n]=sprintf("%c",n)
    printf "%-10s %s\n", "Input", "Output"
    printf "%-10s %s\n", "----------", "----------"
}
match($0, /[a-zA-Z]+$/) {
    n=split(tolower($0), m)
    printf "%-10s ", $0
    sum = 0
    for(i=1; i<=n; i++) {
        c = ord[m[i]] - 97
        sum = sum + c
    }
    s = int(sum / 12 + 0.5)
    for(i=1; i<=n; i++) {
        if(ord[m[i]] - 97 + s >= 25)  # ͨ���� 'z'
            printf "%c", s - 25 + ord[m[i]]
        else
            printf "%c", ord[m[i]] + s
    }
    printf " (��λ = %d)", s
    printf "\n\n"
}
END {
}

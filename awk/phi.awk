#!/usr/local/bin/awk -f
#
# ����ƽ�ָ�����awk����
# ��one true awk version 20211208�в���ͨ��

function phie(n) {
    if (n == 0)
        return 1.0
    else if (n == 1)
        return (sqrt(5) + 1 ) / 2
    else if (n > 1)
        return ((sqrt(5) + 1 ) / 2) ^ n
    else if (n < 0)
        return ((sqrt(5) - 1 ) / 2) ^ n
    else
        return 33
}

function phip(n) {
    if (n == 0)
        return 1.0
    else if (n == 1)
        return (sqrt(5) + 1 ) / 2
    else if (n > 1)
        return phip(n - 1) + phip(n - 2)
    else if (n < 0)
        return phip(n + 2) - phip(n + 1)
    else
        return 33
}

BEGIN {
    printf "\t����ƽ�ָ�����awk����\n"
    printf "\n������Ҫ�����������"
    getline n < "-"
    n += 0
    printf "%-10s %s\n", "���㷨", "�ݵĺ��㷨"
    printf "%-10s %s\n", "------", "----------"
    for (i = 1; i <= n; i++)
        printf "%-10.3f %.3f\n", phie(i), phip(i)
}

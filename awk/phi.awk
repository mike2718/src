#!/usr/local/bin/awk -f
#
# 计算黄金分割数的awk程序
# 在one true awk version 20211208中测试通过

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
    printf "\t计算黄金分割数的awk程序\n"
    printf "\n请输入要计算的数量："
    getline n < "-"
    n += 0
    printf "%-10s %s\n", "幂算法", "幂的和算法"
    printf "%-10s %s\n", "------", "----------"
    for (i = 1; i <= n; i++)
        printf "%-10.3f %.3f\n", phie(i), phip(i)
}

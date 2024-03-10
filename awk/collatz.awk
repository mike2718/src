#!/usr/local/bin/awk -f
#
# 用来计算考拉兹猜想的awk程序
# 目前只在One true awk中测试过
#
# TODO 1. 无法计算无穷大的数
# TODO 2. 无法计算负数

function collatz(n)
{
    do {
        if (n % 2 == 0)
            n /= 2
        else if (n % 2 == 1)
            n = n * 3 + 1
        print n
    } while (n != 1)
}

BEGIN {
    printf "\t计算考拉兹猜想的awk程序\n"
    printf "\n请输入一个整数："
    getline n < "-"
    collatz(n)
}

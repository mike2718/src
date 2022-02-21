#!/usr/local/bin/awk -f
#
# 计算斐波那契质数的awk程序
# 在one true awk version 20211208中测试通过

function fib(n) {
    if (n == 0)
        return 0
    else if (n == 1)
        return 1
    else if (n > 1)
        return fib(n - 1) + fib(n - 2)
    else
        return 33
}

function is_prime(n) {
    if (n <= 2)
        return 1
    last = sqrt(n) + 1
    for (i = 2; i <= last; ++i)
        if (n % i == 0)
            return 0
    return 1
}

BEGIN {
    printf "\t计算斐波那契质数的awk程序\n"
    printf "\n请输入要计算的数量："
    getline n < "-"
    n += 0
    printf "%-10s %s\n", "斐波那契数列第n项", "斐波那契质数"
    printf "%-10s %s\n", "-----------------", "------------"
    j = 3    # fib(3) == 2
    do {
        if (is_prime(fib(j))) {
            printf "%-10d %d\n", j, fib(j)
            n--
        }
        j++
    } while (n > 0)
}

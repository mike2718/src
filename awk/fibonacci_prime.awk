#!/usr/local/bin/awk -f
#
# ����쳲�����������awk����
# ��one true awk version 20211208�в���ͨ��

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
    printf "\t����쳲�����������awk����\n"
    printf "\n������Ҫ�����������"
    getline n < "-"
    n += 0
    printf "%-10s %s\n", "쳲��������е�n��", "쳲���������"
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

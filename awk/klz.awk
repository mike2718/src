function collatz(n)
{
    do {
        if (n % 2 == 0)
            n /= 2
        else
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
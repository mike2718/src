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
    printf "\t���㿼���Ȳ����awk����\n"
    printf "\n������һ��������"
    getline n < "-"
    collatz(n)
}
#!/usr/local/bin/awk -f
#
# �������㿼���Ȳ����awk����
# Ŀǰֻ��One true awk�в��Թ�
#
# TODO 1. �޷�������������
# TODO 2. �޷����㸺��

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
    printf "\t���㿼���Ȳ����awk����\n"
    printf "\n������һ��������"
    getline n < "-"
    collatz(n)
}

#!/usr/local/bin/awk -f
#
# ��ӡ�ƽ�ָ�����awk����
# Ŀǰֻ��One true awk�в��Թ�

function phie(n)
{
    do {
        if (n >= 1) {
            print 1.6180339887 ^ n
            n -= 1
        }
        else {
            print "����"
            break
        }
    } while (n != 0)
}

BEGIN {
    OFMT = "%.3f"
    printf "\t����ƽ�ָ���\��awk����\n"
    printf "\n������Ҫ�����������"
    getline n < "-"
    #print "OFMT = " OFMT
    #print "CONVFMT = " CONVFMT
    phie(n)
}

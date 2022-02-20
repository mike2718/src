#!/usr/local/bin/awk -f
#
# 打印黄金分割数的awk程序
# 目前只在One true awk中测试过

function phie(n)
{
    do {
        if (n >= 1) {
            print 1.6180339887 ^ n
            n -= 1
        }
        else {
            print "错误！"
            break
        }
    } while (n != 0)
}

BEGIN {
    OFMT = "%.3f"
    printf "\t计算黄金分割数\的awk程序\n"
    printf "\n请输入要计算的数量："
    getline n < "-"
    #print "OFMT = " OFMT
    #print "CONVFMT = " CONVFMT
    phie(n)
}

#!/usr/local/bin/awk -f
#
# 打印黄金分割数的awk程序

BEGIN {
    OFMT = "%7.3f"
    p = 1.6180339887
    #print "OFMT = " OFMT
    #print "CONVFMT = " CONVFMT
    print p - 1.0
    print 1.0
    print p
    print p^2
    print p^3
    print p^4
    print p^5
    print p^6
    print p^7
    print p^8
    print p^9
    print p^10
}

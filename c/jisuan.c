// �����߼��ŵ�·����ź����ʹ𰸵�C����
// �÷���
//   $ pcc -Wall -Wpedantic -Wextra -std=c99 -o jisuan jisuan.c
//   $ ./jisuan
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
int main(void)
{
    char b[40];
    bool a[8] = {false, false, false, false, false, false, false, false};
    printf("\n\t�����߼��ŵ�·����ź����ʹ𰸵�C����\n\n");
    printf("�����Ŀ�����������ź���Ϸֱ�Ϊ10��01��00��11��\n");
    printf("�����벻��Ҫ�ٺŵ�10010011\n");
    printf("�����룺");
    if (fgets(b, 40, stdin))
        b[strcspn(b, "\n")] = 0;
    for (int i = 0; i < 8; i++)
        if (b[i] - '1') a[i] = true;
    printf("\n����źţ�\n");
    printf("���ţ�AND��\t%i��%i��%i��%i\n", a[0] && a[1], a[2] && a[3],
           a[4] && a[5], a[6] && a[7]);
    printf("���ţ�OR��\t%i��%i��%i��%i\n", a[0] || a[1], a[2] || a[3],
           a[4] || a[5], a[6] || a[7]);
    printf("����ţ�XOR��\t%i��%i��%i��%i\n", a[0] != a[1], a[2] != a[3],
           a[4] != a[5], a[6] != a[7]);
    printf("����ţ�NAND��\t%i��%i��%i��%i\n", !(a[0] && a[1]), !(a[2]
            && a[3]),
           !(a[4] && a[5]), !(a[6] && a[7]));
    printf("����ţ�NOR��\t%i��%i��%i��%i\n", !(a[0] || a[1]), !(a[2]
            || a[3]),
           !(a[4] || a[5]),  !(a[6] || a[7]));
    printf("�����ţ�NXOR��\t%i��%i��%i��%i\n", !(a[0] != a[1]),
           !(a[2] != a[3]),
           !(a[4] != a[5]),
           !(a[6] != a[7]));
    printf("\n");
    return 0;
}

// ҵ�����ߵ�̨��������������Ϣ��ѯC����
// ʹ�÷�����
//   $ pcc -Wall -Wpedantic -Wextra -std=c99 hhcx.c -o hhcx
//   $ ./hhcx
// ���ԣ�
//   BS7H, JJ1DSB, BG1AAA, BT55CRF, BT1A, BY1PK, B1Z, B1A
//   K4X, N2ASD, A22A, I20000X, 4X4AAA, 3DA0RS
#include <stdio.h>
#include <string.h>
#include <ctype.h>
void func(char *temp)
{
    char *name;
    name = strtok(temp, ":");
    // ���ַ���ת��Ϊ��д
    char *s = name;
    while (*s)
    {
        *s = toupper((unsigned char) * s);
        s++;
    }
}
int main(void)
{
    const char *f[10][4] =
    {
        {"����"},
        {"������", "����", "����"},
        {"���", "���ɹ�", "�ӱ�", "ɽ��"},
        {"�Ϻ�", "ɽ��", "����"},
        {"�㽭", "����", "����"},
        {"����", "����", "����"},
        {"����", "�㶫", "����", "����"},
        {"�Ĵ�", "����", "����", "����"},
        {"����", "����", "����", "�ຣ"},
        {"�½�", "����"}
    };
    char h[20];
    printf("\n\tҵ�����ߵ�̨��������������Ϣ��ѯC����\n\n");
    printf("������Ҫ��ѯ�ĺ��ţ����ӣ�BH9YYY��bh1aa����");
    if (fgets(h, 20, stdin))
    {
        h[strcspn(h, "\n")] = 0;
    }
    func(h);
    printf("\n�ú�����Ϣ��\n");
    if (strlen(h) == 5 || strlen(h) == 6)   // 5λ���š�6λ����
    {
        if (h[0] == 'B')   // ���ʵ������˷�����й�
        {

            if (h[1] < 'A' || h[1] > 'Z')
                printf("�ڶ�λ�ַ�%c����̨���͸�ʽ����\n", h[1]);
            else if ((h[1] >= 'L' && h[1] <= 'Q') || (h[1] >= 'U' && h[1] <= 'X'))
                // LMNOPQ��UVWXΪ����
                printf("�ڶ�λ�ַ�%c���������ߵ���������������\n", h[1]);
            else if (h[1] == 'J')
                printf("�ڶ�λ�ַ�%c��ҵ���ű�̨��ռ�ҵ�����ߵ�̨\n", h[1]);
            else if (h[1] == 'R')
                printf("�ڶ�λ�ַ�%c��ҵ���м�̨\n", h[1]);
            else if (h[1] == 'Y')
                printf("�ڶ�λ�ַ�%c��������ָ��������̨\n", h[1]);
            else if (h[1] == 'Z')
                printf("�ڶ�λ�ַ�%c��������ָ����ڼ����̨��ʹ�õĸ��˺���\n", h[1]);
            if (h[2] < '0' || h[2] > '9')
                printf("����λ�ַ�%c����̨�����ŷ����֣�\n", h[2]);
            if (strlen(h) == 5 && h[3] && h[4] && !h[5] && (h[4] < 'A'
                    || h[4] > 'Z'))
                printf("���һλ�ַ�%c��Ϊ��ĸ��\n", h[4]);
            if (strlen(h) == 6 && h[3] && h[4] && h[5] && (h[5] < 'A' || h[5] > 'Z'))
                printf("���һλ�ַ�%c��Ϊ��ĸ��\n", h[5]);
            int i;
            for (i = 0;  i < 2 ; i++)
            {
                if (strlen(h) == 5 && h[i + 3] > '0' && h[i + 3] < '9')
                    printf("����׺�ַ�%c�ĺ����ɹ������ߵ��������������\n", h[i + 3]);
            }
            for (i = 0;  i < 3 ; i++)
            {
                if (strlen(h) == 6 && h[i + 3] > '0' && h[i + 3] < '9')
                    printf("����׺�ַ�%c�ĺ����ɹ������ߵ��������������\n", h[i + 3]);
            }
            switch (h[2])
            {
            case '1':
                printf("��1��\t");
                if (h[3] >= 'A' && h[3] <= 'X')    // ����
                    printf("%s\n", f[0][0]);
                // �����ʽBH9YY/BH9YYY�Բ�
                else if (strlen(h) == 5 && h[3] && h[4] && !h[5] && (h[3] == 'Y'
                         || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[3] && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '2':
                printf("��2��\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[1][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[1][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[1][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '3':
                printf("��3��\t");
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[2][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[2][1]);
                else if (h[3] >= 'M' && h[3] <= 'R')
                    printf("%s\n", f[2][2]);
                else if (h[3] >= 'S' && h[3] <= 'X')
                    printf("%s\n", f[2][3]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '4':
                printf("��4��\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[3][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[3][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[3][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '5':
                printf("��5��\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[4][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[4][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[4][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '6':
                printf("��6��\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[5][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[5][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[5][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '7':
                printf("��7��\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[6][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[6][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[6][2]);
                else if (h[3] >= 'Y' && h[3] <= 'Z')
                    printf("%s\n", f[6][3]);
                //  AAA-ZZZ
                break;
            case '8':
                printf("��8��\t");
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[7][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[7][1]);
                else if (h[3] >= 'M' && h[3] <= 'R')
                    printf("%s\n", f[7][2]);
                else if (h[3] >= 'S' && h[3] <= 'X')
                    printf("%s\n", f[7][3]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '9':
                printf("��9��\t");
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[8][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[8][1]);
                else if (h[3] >= 'M' && h[3] <= 'R')
                    printf("%s\n", f[8][2]);
                else if (h[3] >= 'S' && h[3] <= 'X')
                    printf("%s\n", f[8][3]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '0':
                printf("��0��\t");  // �½�������
                // AAA-LZZ
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[9][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[9][1]);
                // MAA-ZZZ
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] >= 'M' || h[3] <= 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] >= 'M' || h[3] <= 'Z'))
                    printf("\n�ɹ������ߵ��������������ĺ��ź�׺��%c%c%c\n", h[3], h[4], h[5]);
                break;
            }
        }
        else
            printf("����ǰ׺��һλ�ַ�%c�����й��ĺ��ţ�\n", h[0]);
    }
    else if (strlen(h) == 4)     // 4λ���ţ�������
    {
        if (h[0] == 'B')
        {
            printf("4λ����%c%c%c%c�ɹ������ߵ��������������\n", h[0], h[1], h[2],
                   h[3]);
            if (h[0] == 'B' && h[1] == 'S' && h[2] == '7' && h[3] == 'H') // BS7H
                printf("��7��\t���ҵ�\n");
        }
        else
            printf("����ǰ׺��һλ�ַ�%c�����й��ĺ��ţ�\n", h[0]);
    }
    else if (strlen(h) == 7)     // 7λ���ţ�������
    {
        if (h[0] == 'B')
        {
            printf("7λ����%c%c%c%c%c%c%c�ɹ������ߵ��������������\n", h[0], h[1],
                   h[2],
                   h[3], h[4], h[5], h[6]);
        }
        else
            printf("����ǰ׺��һλ�ַ�%c�����й��ĺ��ţ�\n", h[0]);
    }
    else
        printf("\t���ų��Ȳ���ȷ��\n");
    printf("\n");
    return 0;
}

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdbool.h>
char* convert(const char *c, const char *n)
{
    //char* r = strdup("BURN");
    static char r[40];
    for (int i = 0; c[i] != '\0'; i++)
        r[i] = c[i] + (n[i] - 48);
    return r;
}
bool is_upper(char* str)
{
    bool found_upper = true;
    for (int i = 0; str[i] != '\0'; i++)
    {
        if (!isupper(str[i]))
        {
            found_upper = false;
            break;
        }
    }
    return found_upper;
}
bool is_lower(char* str)
{
    bool found_lower = true;
    for (int i = 0; str[i] != '\0'; i++)
    {
        if (!islower(str[i]))
        {
            found_lower = false;
            break;
        }
    }
    return found_lower;
}
bool is_num(char* str)
{
    bool found_digit = true;
    for (int i = 0; str[i] != '\0'; i++)
    {
        if (!isdigit(str[i]))
        {
            found_digit = false;
            break;
        }
    }
    return found_digit;
}
int main(void)
{
    char c1[40], n1[40];
    printf("\t���ڽ��һ�⡰�ַ���λ����C����\n");
    printf("\n���ӣ�");
    printf("\n�����ĿΪABCD (1234) -> ????");
    printf("\n��ֱ�����ABCD�س���1234�س�");
    printf("\n\n������4����д��ĸ��");
    if (fgets(c1, 40, stdin))
        c1[strcspn(c1, "\n")] = 0;
    printf("������4λ���֣�");
    if (fgets(n1, 40, stdin))
        n1[strcspn(n1, "\n")] = 0;
    if (is_upper(c1) && !is_lower(c1) && is_num(n1) && strlen(c1) == 4
            && strlen(n1) == 4)
    {
        printf("\n%s��%s��λ��õ�%s\n", c1, n1, convert(c1, n1));
    }
    else
        printf("\n������4����д��ĸ��4λ���֣�\n");
    return 0;
}

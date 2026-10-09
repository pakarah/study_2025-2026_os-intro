#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int n;
    printf("Введите число: ");
    if (scanf("%d", &n) != 1) {
        return 2;   // ошибка ввода
    }

    if (n > 0) {
        exit(0);    // больше нуля
    } else if (n < 0) {
        exit(1);    // меньше нуля
    } else {
        exit(3);    // равно нулю
    }
}

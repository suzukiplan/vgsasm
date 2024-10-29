#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[])
{
    if (argc != 3) {
        puts("Invalid argument number");
        exit(-1);
    }
    const char* cmp = strstr(argv[1], ") ");
    if (cmp) {
        cmp = cmp + 2;
    } else {
        cmp = argv[1];
    }
    if (0 == strcmp(cmp, argv[2])) {
        printf("E: %s ... OK\n", cmp);
        return 0;
    } else {
        printf("E: %s ... NG!\n", cmp);
        return -1;
    }
}

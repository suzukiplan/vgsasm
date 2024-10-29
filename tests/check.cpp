#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[])
{
    if (argc != 3) {
        puts("Invalid argument number");
        exit(-1);
    }
    if (0 == strcmp(argv[1], argv[2])) {
        printf("%s ... OK\n", argv[1]);
        return 0;
    } else {
        printf("%s ... NG! <%s>\n", argv[1], argv[2]);
        return -1;
    }
}

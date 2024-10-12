#pragma once
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <map>
#include <algorithm>

void trimstring(char* src)
{
    int i, j;
    int len;
    for (i = 0; ' ' == src[i]; i++);
    if (i) {
        for (j = 0; src[i] != '\0'; j++, i++) {
            src[j] = src[i];
        }
        src[j] = '\0';
    }
    for (len = (int)strlen(src) - 1; 0 <= len && ' ' == src[len]; len--) {
        src[len] = '\0';
    }
}

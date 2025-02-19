/**
 * Z80 Assembler for VGS-Zero
 * Copyright (c) 2024, Yoji Suzuki.
 * License under GPLv3: https://github.com/suzukiplan/vgsasm/blob/master/LICENSE.txt
 */
#include "common.hpp"
#include "../src/numeric.hpp"
#include "../src/org.hpp"

void test_normal(const char* text, int n, ...)
{
    auto line = new LineData("", -1, text);
    numeric_parse(line);
    org_parse(line);
    printf("N: %-12s ---> ", text);
    line->printDebug();
    if (line->error) {
        puts(("Unexpected error: " + line->errmsg).c_str());
        throw -1;
    }
    if (n != line->token.size()) {
        printf("Unexpected token number: %d, %d\n", n, (int)line->token.size());
        throw -1;
    }
    va_list arg;
    va_start(arg, n);
    for (int i = 0; i < n; i++) {
        auto first = va_arg(arg, TokenType);
        auto second = va_arg(arg, const char*);
        if (line->token[i].first != first) {
            printf("Unexpected TokenType #%d\n", i + 1);
            throw -1;
        }
        if (line->token[i].second != second) {
            printf("Unexpected Token#%d: %s != %s\n", i + 1, line->token[i].second.c_str(), second);
            throw -1;
        }
    }
}

void test_error(const char* text, const char* errmsg)
{
    auto line = new LineData("", -1, text);
    numeric_parse(line);
    org_parse(line);
    printf("E: %-12s ---> ", text);
    if (!line->error) {
        puts("Error expect bad not...");
        throw -1;
    }
    if (line->errmsg != errmsg) {
        puts(("Unexpected error: " + line->errmsg).c_str());
        throw -1;
    }
    printf(" %s\n", errmsg);
}

int main()
{
    try {
        test_normal("org $100", 1, TokenType::Org, "256");
        test_error("a org", "`org` must appear at the beginning of the line.");
        test_error("org", "`org` address is not specified.");
        test_error("org hoge", "Unexpected symbol: HOGE");
        test_normal("org 0xFFFF", 1, TokenType::Org, "65535");
        test_error("org 65536", "`org` address is incorrect: 65536");
        test_error("org 65535 org", "Unexpected symbol: ORG");
        test_error("org 65534", "Multiple orgs must be written in ascending order from the beginning of the line.");
        test_error("org 65535", "Multiple orgs must be written in ascending order from the beginning of the line.");
    } catch (...) {
        return -1;
    }
    return 0;
}

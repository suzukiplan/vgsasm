#pragma once
#include "common.hpp"
#include "file.hpp"

std::string hex2dec(const char* hex)
{
    int result = 0;
    int len = 0;
    while (*hex) {
        if (isdigit(*hex)) {
            result <<= 4;
            result += (*hex) - '0';
            len++;
        } else if ('A' <= *hex && *hex <= 'F') {
            result <<= 4;
            result += (*hex) - 'A' + 10;
            len++;
        } else {
            return "";
        }
        hex++;
    }
    return 0 < len ? std::to_string(result) : "";
}

std::string bin2dec(const char* bin)
{
    int result = 0;
    int len = 0;
    while (*bin) {
        if ('0' == *bin || '1' == *bin) {
            result <<= 1;
            result += (*bin) - '0';
            len++;
        } else {
            return "";
        }
        bin++;
    }
    return 0 < len ? std::to_string(result) : "";
}

void parse_numeric(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->first != TokenType::Other) {
            continue;
        }
        auto str = it->second.c_str();
        bool minus = false;
        if ('-' == *str) {
            minus = true;
            str++;
        }
        if ('$' == *str || 0 == strncmp("0X", str, 2)) {
            auto dec = hex2dec(str + ('$' == *str ? 1 : 2));
            if (!dec.empty()) {
                it->first = TokenType::Numeric;
                it->second = minus ? "-" + dec : dec;
            } else {
                line->error = true;
                line->errmsg = "Invalid hexadecimal number";
                return;
            }
        } else if ('%' == *str || 0 == strncmp("0B", str, 2)) {
            auto dec = bin2dec(str + ('%' == *str ? 1 : 2));
            if (!dec.empty()) {
                it->first = TokenType::Numeric;
                it->second = minus ? "-" + dec : dec;
            } else {
                line->error = true;
                line->errmsg = "Invalid binary number";
                return;
            }
        }
    }
}
#pragma once
#include "common.h"

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
        } else {
            bool isNumeric = true;
            while (*str) {
                if (!isdigit(*str)) {
                    isNumeric = false;
                    break;
                }
                str++;
            }
            if (isNumeric) {
                it->first = TokenType::Numeric;
            }
        }
    }
}

// , - n を , -n にする
void parse_numeric_minus(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->first == TokenType::Split || it->first == TokenType::Mnemonic) {
            if (it + 1 != line->token.end() && it + 2 != line->token.end()) {
                if ((it + 1)->first == TokenType::Minus && (it + 2)->first == TokenType::Numeric) {
                    (it + 1)->first = TokenType::Delete;
                    (it + 2)->second = "-" + (it + 2)->second;
                    it += 2;
                }
            }
        }
    }
}

// , + n を , n にする
void parse_numeric_plus(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->first == TokenType::Split || it->first == TokenType::Mnemonic) {
            if (it + 1 != line->token.end() && it + 2 != line->token.end()) {
                if ((it + 1)->first == TokenType::Plus && (it + 2)->first == TokenType::Numeric) {
                    (it + 1)->first = TokenType::Delete;
                    it += 2;
                }
            }
        }
    }
}

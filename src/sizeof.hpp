#pragma once
#include "common.hpp"
#include "file.hpp"
#include "struct.hpp"

void parse_sizeof(LineData* line)
{
    TokenType expect = TokenType::None;
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->first == TokenType::Other) {
            if (it->second == "SIZEOF") {
                it->first = TokenType::Delete;
                it++;
                if (it == line->token.end() || it->first != TokenType::BracketBegin) {
                    line->error = true;
                    line->errmsg = "No `(` in sizeof syntax.";
                    return;
                }
                it->first = TokenType::Delete;
                it++;
                if (it == line->token.end() || it->first != TokenType::Other) {
                    line->error = true;
                    line->errmsg = "No name specified in sizeof syntax.";
                    return;
                }
                it->first = TokenType::SizeOf;
                it++;
                if (it == line->token.end() || it->first != TokenType::BracketEnd) {
                    line->error = true;
                    line->errmsg = "No `)` in sizeof syntax.";
                    return;
                }
                it->first = TokenType::Delete;
            }
        }
    }
}

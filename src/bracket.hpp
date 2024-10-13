#pragma once
#include "common.hpp"
#include "file.hpp"

// 特定箇所の BrakectBegin ~ BracketEnd を AddressBegin ~ AddressEnd に置き換える
void bracket_to_address(LineData* line)
{
    if (line->token.size() < 2) {
        return; // 1トークン以下
    }
    int pos;
    if (line->token[0].first != TokenType::Label ||
        line->token[0].first != TokenType::LabelAt) {
        pos = 2;
    } else {
        pos = 1;
    }
}
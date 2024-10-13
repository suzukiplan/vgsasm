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

enum class TokenType {
    String,       // 文字列 "str" or 'str'
    Label,        // ラベル（HOGE: or .HOGE）
    LabelAt,      // @HOGE 形式のラベル
    Numeric,      // 数値
    Split,        // , カンマ
    Plus,         // - プラス
    Minus,        // * マイナス
    Div,          // / 割り算
    Mul,          // * 掛け算
    ArrayBegin,   // [ 配列起点
    ArrayEnd,     // ] 配列終点
    BracketBegin, // ( カッコ
    BracketEnd,   // ) カッコ
    ScopeBegin,   // { スコープ起点
    ScopeEnd,     // } スコープ終点
    Other         // その他
};

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

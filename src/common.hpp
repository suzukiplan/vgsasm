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
    None,         // トークンが無い
    Mnemonic,     // ニーモニック
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
    AddressBegin, // ( カッコ（※特定箇所のみ）
    AddressEnd,   // ) カッコ (※特定箇所のみ)
    ScopeBegin,   // { スコープ起点
    ScopeEnd,     // } スコープ終点
    Other         // その他
};

enum class Mnemonic {
    None = 0,
    LD,
    LDI,
    LDD,
    LDIR,
    LDDR,
    PUSH,
    POP,
    EX,
    EXX,
    CP,
    CPI,
    CPIR,
    CPD,
    CPDR,
    ADD,
    ADC,
    SUB,
    SBC,
    AND,
    OR,
    XOR,
    INC,
    DEC,
    DAA,
    CPL,
    NEG,
    CCF,
    SCF,
    NOP,
    HALT,
    RL,
    RLA,
    RLC,
    RLCA,
    RR,
    RRA,
    RRC,
    RRCA,
    SLA,
    SLL,
    SRA,
    SRL,
    RLD,
    RRD,
    BIT,
    SET,
    RES,
    JP,
    JR,
    JZ,
    JNZ,
    JC,
    JNC,
    JPO,
    JPE,
    JPP,
    JPM,
    DJNZ,
    CALL,
    RET,
    RETI,
    RETN,
    RST,
    OUT,
    OUTI,
    OTIR,
    OUTD,
    OTDR,
    IN,
    INI,
    INIR,
    IND,
    INDR,
    DI,
    EI,
    IM,
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

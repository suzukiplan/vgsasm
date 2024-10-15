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
#include <list>

enum class TokenType {
    None,         // トークンが無い
    Delete,       // 削除マーク
    Mnemonic,     // ニーモニック
    Operand,      // オペランド
    Struct,       // 構造体
    SizeOf,       // 構造体サイズ
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
    Other         // その他 (構文解析の仮定で最終的にはなくなる)
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

class LineData
{
  public:
    bool error;
    std::string errmsg;
    std::string path;
    int lineNumber;
    std::string text;
    std::vector<std::pair<TokenType, std::string>> token;
    Mnemonic mnemonic;
    LineData(std::string text) { LineData(nullptr, 0, text); }
    LineData(const char* path, int lineNumber, std::string text);
};

class StructField
{
  public:
    LineData* line;
    std::string name;
    std::vector<std::pair<TokenType, std::string>> token;
    int size;
    int count;
    int address;

    StructField(LineData* line, std::string name)
    {
        this->line = line;
        this->name = name;
        this->size = 0;
        this->count = 0;
        this->address = 0;
    }
};

class Struct
{
  public:
    LineData* line;
    std::string name;
    int start;
    int size;
    std::vector<StructField*> fields;

    Struct(LineData* line, std::string name)
    {
        this->line = line;
        this->name = name;
        this->start = 0;
        this->size = 0;
    }
};

enum class Operand {
    A,
    B,
    C,
    D,
    E,
    H,
    L,
    IXH,
    IXL,
    IYH,
    IYL,
    AF,
    AF_dash,
    BC,
    DE,
    HL,
    IX,
    IY,
    SP,
};

// tables (defined in main.cpp)
extern std::map<std::string, LineData*> nameTable;
extern std::vector<std::string> includeFiles;
extern std::map<std::string, std::vector<std::pair<TokenType, std::string>>> defineTable;
extern std::map<std::string, LineData*> labelTable;
extern std::map<std::string, Mnemonic> mnemonicTable;
extern std::map<std::string, Operand> operandTable;
extern std::map<std::string, Struct*> structTable;

extern int arrayCount;
extern int bracketCount;
extern int scopeCount;
extern LineData* lastScopeBegin;

void addNameTable(std::string name, LineData* line);                                  // main.cpp
void trimstring(char* src);                                                           // main.cpp
bool parse_define(LineData* line);                                                    // define.cpp
void replace_define(LineData* line);                                                  // define.cpp
void bracket_to_address(LineData* line);                                              // bracket.cpp
bool bracket_eliminate(LineData* line);                                               // bracket.cpp
std::vector<LineData*> readFile(const char* filePath);                                // file.cpp
std::string evaluate_formulas(std::vector<std::pair<TokenType, std::string>>* token); // formulas.cpp
void evaluate_formulas(LineData* line);                                               // formulas.cpp
void parse_label(LineData* line);                                                     // label.cpp
void parse_mneoimonic(LineData* line);                                                // mnemonic.cpp
std::string hex2dec(const char* hex);                                                 // numeric.cpp
std::string bin2dec(const char* bin);                                                 // numeric.cpp
void parse_numeric(LineData* line);                                                   // numeric.cpp
void parse_operand(LineData* line);                                                   // operand.cpp
void parse_sizeof(LineData* line);                                                    // sizeof.cpp
void replace_sizeof(LineData* line);                                                  // sizeof.cpp
void parse_struct(LineData* line);                                                    // struct.cpp
bool struct_syntax_check(std::vector<LineData*>* lines);                              // struct.cpp
bool struct_check_size();                                                             // struct.cpp
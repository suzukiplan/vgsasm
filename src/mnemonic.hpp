#pragma once
#include "common.hpp"

enum class Mnemonic {
    None = 0,
    ADD,
    AND,
    XOR,
    LD,
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
    BC,
    DE,
    HL,
    IX,
    IY,
    SP,
    BC_Addr,
    DE_Addr,
    HL_Addr,
    IX_Addr,
    IY_Addr,
    SP_Addr,
    Addr,
    Num,
};

static std::map<std::string, Mnemonic> mnemonicTable = {
    {"ADD ", Mnemonic::ADD},
    {"AND ", Mnemonic::AND},
    {"XOR ", Mnemonic::XOR},
    {"LD ", Mnemonic::LD},
};

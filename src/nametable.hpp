/**
 * Z80 Assembler for VGS-Zero
 * Copyright (c) 2024, Yoji Suzuki.
 * License under GPLv3: https://github.com/suzukiplan/vgsasm/blob/master/LICENSE.txt
 */
#pragma once
#include "common.h"

bool checkNameTable(std::string name)
{
    if (!isalpha(name.c_str()[0])) {
        return false;
    } else if (nameTable.find(name) != nameTable.end()) {
        return true;
    } else {
        return false;
    }
}

void addNameTable(std::string name, LineData* line)
{
    if (checkNameTable(name)) {
        line->error = true;
        line->errmsg = "Reserved symbol name " + name + " was specified.";
    } else {
        nameTable[name] = line;
    }
}

void nametable_init()
{
    for (auto mnemonic : mnemonicTable) {
        addNameTable(mnemonic.first, nullptr);
    }
    for (auto operand : operandTable) {
        addNameTable(operand.first, nullptr);
    }
    addNameTable("SIZEOF", nullptr);
    addNameTable("OFFSET", nullptr);
    addNameTable("STRUCT", nullptr);
    addNameTable("ENUM", nullptr);
    addNameTable("DS.B", nullptr);
    addNameTable("DS.W", nullptr);
    addNameTable("ORG", nullptr);
}

#include "common.h"
#include "mnemonic.h"

static uint8_t getJpCond(LineData* line, std::string cond)
{
    switch (operandTable[cond]) {
        case Operand::NZ: return 0xC2;
        case Operand::Z: return 0xCA;
        case Operand::NC: return 0xD2;
        case Operand::C: return 0xDA;
        case Operand::PO: return 0xE2;
        case Operand::PE: return 0xEA;
        case Operand::P: return 0xF2;
        case Operand::M: return 0xFA;
    }
    line->error = true;
    line->errmsg = "Invalid condition: " + cond;
    return 0x00;
}

static uint8_t getJrCond(LineData* line, std::string cond)
{
    switch (operandTable[cond]) {
        case Operand::NZ: return 0x20;
        case Operand::Z: return 0x28;
        case Operand::NC: return 0x30;
        case Operand::C: return 0x38;
    }
    line->error = true;
    line->errmsg = "Invalid condition: " + cond;
    return 0x00;
}

void mnemonic_JP(LineData* line)
{
    if (mnemonic_format_test(line, 2, TokenType::Numeric)) {
        auto addr = atoi(line->token[1].second.c_str());
        if (mnemonic_range(line, addr, 0x0000, 0xFFFF)) {
            line->machine.push_back(0xC3);
            line->machine.push_back(addr & 0xFF);
            line->machine.push_back((addr & 0xFF00) >> 8);
            return;
        }
    } else if (mnemonic_format_test(line, 2, TokenType::LabelJump)) {
        line->machine.push_back(0xC3);
        tempAddrs.push_back(new TempAddr(line, line->token[1].second, line->machine.size(), false));
        line->machine.push_back(0x00);
        line->machine.push_back(0x00);
        return;
    } else if (mnemonic_format_test(line, 4, TokenType::Operand, TokenType::Split, TokenType::Numeric) &&
               operand_is_condition(line->token[1].second)) {
        uint8_t code = getJpCond(line, line->token[1].second);
        auto addr = atoi(line->token[3].second.c_str());
        if (code && mnemonic_range(line, addr, 0x0000, 0xFFFF)) {
            line->machine.push_back(code);
            line->machine.push_back(addr & 0xFF);
            line->machine.push_back((addr & 0xFF00) >> 8);
            return;
        }
    } else if (mnemonic_format_test(line, 4, TokenType::Operand, TokenType::Split, TokenType::LabelJump) &&
               operand_is_condition(line->token[1].second)) {
        uint8_t code = getJpCond(line, line->token[1].second);
        if (code) {
            line->machine.push_back(code);
            tempAddrs.push_back(new TempAddr(line, line->token[3].second, line->machine.size(), false));
            line->machine.push_back(0x00);
            line->machine.push_back(0x00);
            return;
        }
    }
    if (!line->error) {
        line->error = true;
        line->errmsg = "Illegal JP instruction.";
    }
}

void mnemonic_JR(LineData* line)
{
    if (mnemonic_format_test(line, 2, TokenType::Numeric)) {
        auto e = atoi(line->token[1].second.c_str());
        if (mnemonic_range(line, e, -128, 127)) {
            line->machine.push_back(0x18);
            line->machine.push_back(e);
            return;
        }
    } else if (mnemonic_format_test(line, 2, TokenType::LabelJump)) {
        line->machine.push_back(0x18);
        tempAddrs.push_back(new TempAddr(line, line->token[1].second, line->machine.size(), true));
        line->machine.push_back(0x00);
        return;
    } else if (mnemonic_format_test(line, 4, TokenType::Operand, TokenType::Split, TokenType::Numeric) &&
               operand_is_condition(line->token[1].second)) {
        uint8_t code = getJrCond(line, line->token[1].second);
        auto e = atoi(line->token[3].second.c_str());
        if (code && mnemonic_range(line, e, -128, 127)) {
            line->machine.push_back(code);
            line->machine.push_back(e);
            return;
        }
    } else if (mnemonic_format_test(line, 4, TokenType::Operand, TokenType::Split, TokenType::LabelJump) &&
               operand_is_condition(line->token[1].second)) {
        uint8_t code = getJrCond(line, line->token[1].second);
        if (code) {
            line->machine.push_back(code);
            tempAddrs.push_back(new TempAddr(line, line->token[3].second, line->machine.size(), true));
            line->machine.push_back(0x00);
            return;
        }
    }
    if (!line->error) {
        line->error = true;
        line->errmsg = "Illegal JR instruction.";
    }
}

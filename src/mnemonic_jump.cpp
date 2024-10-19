#include "common.h"
#include "mnemonic.h"

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
    }
    if (!line->error) {
        line->error = true;
        line->errmsg = "Illegal JR instruction.";
    }
}

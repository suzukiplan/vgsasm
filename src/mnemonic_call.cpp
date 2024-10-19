#include "common.h"
#include "mnemonic.h"

void mnemonic_CALL(LineData* line)
{
    if (mnemonic_format_test(line, 2, TokenType::Numeric)) {
        auto addr = atoi(line->token[1].second.c_str());
        if (mnemonic_range(line, addr, 0x0000, 0xFFFF)) {
            line->machine.push_back(0xCD);
            line->machine.push_back(addr & 0xFF);
            line->machine.push_back((addr & 0xFF00) >> 8);
            return;
        }
    } else if (mnemonic_format_test(line, 2, TokenType::LabelJump)) {
        line->machine.push_back(0xCD);
        tempAddrs.push_back(new TempAddr(line, line->token[1].second, line->machine.size(), false));
        line->machine.push_back(0x00);
        line->machine.push_back(0x00);
        return;
    }
    if (!line->error) {
        line->error = true;
        line->errmsg = "Illegal CALL instruction.";
    }
}

void mnemonic_RET(LineData* line)
{
    if (line->token.size() == 1) {
        ML_RET;
        return;
    }
    if (!line->error) {
        line->error = true;
        line->errmsg = "Illegal RET instruction.";
    }
}

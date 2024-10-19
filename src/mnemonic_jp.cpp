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
    }
    if (!line->error) {
        line->error = true;
        line->errmsg = "Illegal JP instruction.";
    }
}

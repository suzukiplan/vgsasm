#include "common.h"
#include "mnemonic.h"

void mnemonic_MUL(LineData* line)
{
    if (mnemonic_format_test(line, 2, TokenType::Operand)) {
        switch (operandTable[line->token[1].second]) {
            case Operand::BC:
                ML_PUSH_AF;
                ML_PUSH_HL;
                ML_LD_H_B;
                ML_LD_L_C;
                ML_LD_A_n(0x00);
                ML_OUT_A(0xC5);
                ML_LD_B_H;
                ML_LD_C_L;
                ML_POP_HL;
                ML_POP_AF;
                return;
            case Operand::DE:
                ML_PUSH_AF;
                ML_PUSH_HL;
                ML_LD_H_D;
                ML_LD_L_E;
                ML_LD_A_n(0x00);
                ML_OUT_A(0xC5);
                ML_LD_D_H;
                ML_LD_E_L;
                ML_POP_HL;
                ML_POP_AF;
                return;
            case Operand::HL:
                ML_PUSH_AF;
                ML_LD_A_n(0x00);
                ML_OUT_A(0xC5);
                ML_POP_AF;
                return;
        }
    } else if (mnemonic_format_test(line, 4, TokenType::Operand, TokenType::Split, TokenType::Operand)) {
        if (operandTable[line->token[1].second] == Operand::HL) {
            switch (operandTable[line->token[3].second]) {
                case Operand::A:
                    ML_PUSH_AF;
                    ML_PUSH_BC;
                    ML_LD_C_A;
                    ML_LD_A_n(0x80);
                    ML_OUT_A(0xC5);
                    ML_POP_BC;
                    ML_POP_AF;
                    return;
                case Operand::B:
                    ML_PUSH_AF;
                    ML_PUSH_BC;
                    ML_LD_C_B;
                    ML_LD_A_n(0x80);
                    ML_OUT_A(0xC5);
                    ML_POP_BC;
                    ML_POP_AF;
                    return;
                case Operand::C:
                    ML_PUSH_AF;
                    ML_LD_A_n(0x80);
                    ML_OUT_A(0xC5);
                    ML_POP_AF;
                    return;
                case Operand::D:
                    ML_PUSH_AF;
                    ML_PUSH_BC;
                    ML_LD_C_D;
                    ML_LD_A_n(0x80);
                    ML_OUT_A(0xC5);
                    ML_POP_BC;
                    ML_POP_AF;
                    return;
                case Operand::E:
                    ML_PUSH_AF;
                    ML_PUSH_BC;
                    ML_LD_C_E;
                    ML_LD_A_n(0x80);
                    ML_OUT_A(0xC5);
                    ML_POP_BC;
                    ML_POP_AF;
                    return;
            }
        }
    }
    if (!line->error) {
        line->error = true;
        line->errmsg = "Illegal MUL instruction.";
    }
}

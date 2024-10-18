#include "common.h"
#include "mnemonic.h"

static bool isReg8(Operand op)
{
    return op == Operand::A ||
           op == Operand::B ||
           op == Operand::C ||
           op == Operand::D ||
           op == Operand::E ||
           op == Operand::H ||
           op == Operand::L ||
           op == Operand::IXH ||
           op == Operand::IXL ||
           op == Operand::IYH ||
           op == Operand::IYL;
}

static uint8_t getBitReg8(Operand op)
{
    switch (op) {
        case Operand::B: return 0x00;
        case Operand::C: return 0x01;
        case Operand::D: return 0x02;
        case Operand::E: return 0x03;
        case Operand::H: return 0x04;
        case Operand::L: return 0x05;
        case Operand::A: return 0x07;
        case Operand::IXH: return 0x04;
        case Operand::IXL: return 0x05;
        case Operand::IYH: return 0x04;
        case Operand::IYL: return 0x05;
    }
    return 0xFF;
}

void mnemonic_LD(LineData* line)
{
    if (mnemonic_format_test(line, 4, TokenType::Operand, TokenType::Split, TokenType::Operand)) {
        // LD r, r'
        auto op1 = operandTable[line->token[1].second];
        auto op2 = operandTable[line->token[3].second];
        if (isReg8(op1) && isReg8(op2)) {
            if (op1 == Operand::IXH || op1 == Operand::IXL || op1 == Operand::IYH || op1 == Operand::IYL) {
                if (op2 == Operand::H || op2 == Operand::L) {
                    line->error = true;
                    line->errmsg = "LD {IXH|IXL},{H|L} is not supported.";
                    return;
                }
                bool isOp1IX = op1 == Operand::IXH || op1 == Operand::IXL;
                bool isOp1IY = op1 == Operand::IYH || op1 == Operand::IYL;
                bool isOp2IX = op2 == Operand::IXH || op2 == Operand::IXL;
                bool isOp2IY = op2 == Operand::IYH || op2 == Operand::IYL;
                if (isOp1IX && isOp2IY) {
                    line->error = true;
                    line->errmsg = "LD {IXH|IXL},{IYH|IYL} is not supported.";
                    return;
                }
                if (isOp1IY && isOp2IX) {
                    line->error = true;
                    line->errmsg = "LD {IYH|IYL},{IXH|IXL} is not supported.";
                    return;
                }
                line->machine.push_back(isOp1IX ? 0xDD : 0xFD);
                uint8_t code = 0x60;
                code |= getBitReg8(op1) << 3;
                code |= getBitReg8(op2);
                line->machine.push_back(code);
            } else {
                if (op2 == Operand::IXH || op2 == Operand::IXL) {
                    if (op1 == Operand::H || op1 == Operand::L) {
                        line->error = true;
                        line->errmsg = "LD {H|L},{IXH|IXL} is not supported.";
                        return;
                    }
                    line->machine.push_back(0xDD);
                } else if (op2 == Operand::IYH || op2 == Operand::IYL) {
                    if (op1 == Operand::H || op1 == Operand::L) {
                        // LD {H|L}, {IYH,IYL}
                        line->error = true;
                        line->errmsg = "LD {H|L},{IYH|IYL} is not supported.";
                        return;
                    }
                    line->machine.push_back(0xFD);
                }
                uint8_t code = 0x40;
                code |= getBitReg8(op1) << 3;
                code |= getBitReg8(op2);
                line->machine.push_back(code);
            }
            return;
        } else {
            switch (op1) {
                case Operand::BC:
                    switch (op2) {
                        case Operand::BC: ML_LD_BC_BC; return;
                        case Operand::DE: ML_LD_BC_DE; return;
                        case Operand::HL: ML_LD_BC_HL; return;
                        case Operand::IX: ML_LD_BC_IX; return;
                        case Operand::IY: ML_LD_BC_IY; return;
                    }
                    break;
                case Operand::DE:
                    switch (op2) {
                        case Operand::BC: ML_LD_DE_BC; return;
                        case Operand::DE: ML_LD_DE_DE; return;
                        case Operand::HL: ML_LD_DE_HL; return;
                        case Operand::IX: ML_LD_DE_IX; return;
                        case Operand::IY: ML_LD_DE_IY; return;
                    }
                    break;
                case Operand::HL:
                    switch (op2) {
                        case Operand::BC: ML_LD_HL_BC; return;
                        case Operand::DE: ML_LD_HL_DE; return;
                        case Operand::HL: ML_LD_HL_HL; return;
                        case Operand::IX: ML_LD_HL_IX; return;
                        case Operand::IY: ML_LD_HL_IY; return;
                    }
                    break;
                case Operand::IX:
                    switch (op2) {
                        case Operand::BC: ML_LD_IX_BC; return;
                        case Operand::DE: ML_LD_IX_DE; return;
                        case Operand::HL: ML_LD_IX_HL; return;
                        case Operand::IX: ML_LD_IX_IX; return;
                        case Operand::IY: ML_LD_IX_IY; return;
                    }
                    break;
                case Operand::IY:
                    switch (op2) {
                        case Operand::BC: ML_LD_IY_BC; return;
                        case Operand::DE: ML_LD_IY_DE; return;
                        case Operand::HL: ML_LD_IY_HL; return;
                        case Operand::IX: ML_LD_IY_IX; return;
                        case Operand::IY: ML_LD_IY_IY; return;
                    }
                    break;
                case Operand::SP:
                    switch (op2) {
                        case Operand::HL: ML_LD_SP_HL; return;
                        case Operand::IX: ML_LD_SP_IX; return;
                        case Operand::IY: ML_LD_SP_IY; return;
                    }
            }
        }
    } else if (mnemonic_format_test(line, 6, TokenType::Operand, TokenType::Split, TokenType::AddressBegin, TokenType::Operand, TokenType::AddressEnd) &&
               operandTable[line->token[4].second] == Operand::HL) {
        // LD r, (HL)
        switch (operandTable[line->token[1].second]) {
            case Operand::A: ML_LD_A_HL; return;
            case Operand::B: ML_LD_B_HL; return;
            case Operand::C: ML_LD_C_HL; return;
            case Operand::D: ML_LD_D_HL; return;
            case Operand::E: ML_LD_E_HL; return;
            case Operand::F: break; // this opcode $76 is HALT
            case Operand::H: ML_LD_H_HL; return;
            case Operand::L: ML_LD_L_HL; return;
            case Operand::IXH: ML_LD_IXH_HL; return;
            case Operand::IXL: ML_LD_IXL_HL; return;
            case Operand::IYH: ML_LD_IYH_HL; return;
            case Operand::IYL: ML_LD_IYL_HL; return;
            case Operand::BC:
                ML_LD_C_HL;
                ML_INC_HL;
                ML_LD_B_HL;
                ML_DEC_HL;
                return;
            case Operand::DE:
                ML_LD_E_HL;
                ML_INC_HL;
                ML_LD_D_HL;
                ML_DEC_HL;
                return;
            case Operand::IX:
                ML_PUSH_AF;
                ML_LD_A_HL;
                ML_LD_IXL_A;
                ML_INC_HL;
                ML_LD_A_HL;
                ML_LD_IXH_A;
                ML_DEC_HL;
                ML_POP_AF;
                return;
            case Operand::IY:
                ML_PUSH_AF;
                ML_LD_A_HL;
                ML_LD_IYL_A;
                ML_INC_HL;
                ML_LD_A_HL;
                ML_LD_IYH_A;
                ML_DEC_HL;
                ML_POP_AF;
                return;
        }
    } else if (mnemonic_format_test(line, 6, TokenType::AddressBegin, TokenType::Operand, TokenType::AddressEnd, TokenType::Split, TokenType::Operand) &&
               operandTable[line->token[2].second] == Operand::HL) {
        // LD (HL), r
        switch (operandTable[line->token[5].second]) {
            case Operand::A: ML_LD_HL_A; return;
            case Operand::B: ML_LD_HL_B; return;
            case Operand::C: ML_LD_HL_C; return;
            case Operand::D: ML_LD_HL_D; return;
            case Operand::E: ML_LD_HL_E; return;
            case Operand::F: break; // this opcode $76 is HALT
            case Operand::H: ML_LD_HL_H; return;
            case Operand::L: ML_LD_HL_L; return;
            case Operand::IXH: ML_LD_HL_IXH; return;
            case Operand::IXL: ML_LD_HL_IXL; return;
            case Operand::IYH: ML_LD_HL_IYH; return;
            case Operand::IYL: ML_LD_HL_IYL; return;
        }
    }
    line->error = true;
    line->errmsg = "Illegal LD instruction.";
}
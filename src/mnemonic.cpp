#include "common.h"
#include "mnemonic.h"

#define ML_PUSH_BC line->machine.push_back(0xC5)
#define ML_PUSH_DE line->machine.push_back(0xD5)
#define ML_PUSH_HL line->machine.push_back(0xE5)
#define ML_PUSH_AF line->machine.push_back(0xF5)
#define ML_PUSH_IX                 \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0xE5)
#define ML_PUSH_IY                 \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0xE5)
#define ML_POP_BC line->machine.push_back(0xC1)
#define ML_POP_DE line->machine.push_back(0xD1)
#define ML_POP_HL line->machine.push_back(0xE1)
#define ML_POP_AF line->machine.push_back(0xF1)
#define ML_POP_IX                  \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0xE1)
#define ML_POP_IY                  \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0xE1)

#define ML_LD_A_n(X)               \
    line->machine.push_back(0x3E); \
    line->machine.push_back(X)
#define ML_LD_B_n(X)               \
    line->machine.push_back(0x06); \
    line->machine.push_back(X)
#define ML_LD_C_n(X)               \
    line->machine.push_back(0x0E); \
    line->machine.push_back(X)
#define ML_LD_D_n(X)               \
    line->machine.push_back(0x16); \
    line->machine.push_back(X)
#define ML_LD_E_n(X)               \
    line->machine.push_back(0x1E); \
    line->machine.push_back(X)
#define ML_LD_H_n(X)               \
    line->machine.push_back(0x26); \
    line->machine.push_back(X)
#define ML_LD_L_n(X)               \
    line->machine.push_back(0x2E); \
    line->machine.push_back(X)

#define ML_ADD_HL_BC line->machine.push_back(0x09)
#define ML_ADD_HL_DE line->machine.push_back(0x19)
#define ML_ADD_HL_HL line->machine.push_back(0x29)
#define ML_ADD_HL_SP line->machine.push_back(0x39)

#define ML_ADD_IX_BC               \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x09)
#define ML_ADD_IX_DE               \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x19)
#define ML_ADD_IX_IX               \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x29)
#define ML_ADD_IX_SP               \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x39)

#define ML_ADD_IY_BC               \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x09)
#define ML_ADD_IY_DE               \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x19)
#define ML_ADD_IY_IY               \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x29)
#define ML_ADD_IY_SP               \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x39)

#define ML_INC_A line->machine.push_back(0x3C)
#define ML_INC_B line->machine.push_back(0x04)
#define ML_INC_C line->machine.push_back(0x0C)
#define ML_INC_D line->machine.push_back(0x14)
#define ML_INC_E line->machine.push_back(0x1C)
#define ML_INC_H line->machine.push_back(0x24)
#define ML_INC_L line->machine.push_back(0x2C)
#define ML_INC_BC line->machine.push_back(0x03)
#define ML_INC_DE line->machine.push_back(0x13)
#define ML_INC_HL line->machine.push_back(0x23)
#define ML_INC_ADDR_HL line->machine.push_back(0x34)
#define ML_INC_SP line->machine.push_back(0x33)
#define ML_INC_IXH                 \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x24)
#define ML_INC_IXL                 \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x2C)
#define ML_INC_IYH                 \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x24)
#define ML_INC_IYL                 \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x2C)
#define ML_INC_IX                  \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x23)
#define ML_INC_IY                  \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x23)
#define ML_INC_ADDR_IX(D)          \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x34); \
    line->machine.push_back(D)
#define ML_INC_ADDR_IY(D)          \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x34); \
    line->machine.push_back(D)

#define ML_DEC_A line->machine.push_back(0x3D)
#define ML_DEC_B line->machine.push_back(0x05)
#define ML_DEC_C line->machine.push_back(0x0D)
#define ML_DEC_D line->machine.push_back(0x15)
#define ML_DEC_E line->machine.push_back(0x1D)
#define ML_DEC_H line->machine.push_back(0x25)
#define ML_DEC_L line->machine.push_back(0x2D)
#define ML_DEC_BC line->machine.push_back(0x0B)
#define ML_DEC_DE line->machine.push_back(0x1B)
#define ML_DEC_HL line->machine.push_back(0x2B)
#define ML_DEC_ADDR_HL line->machine.push_back(0x35)
#define ML_DEC_SP line->machine.push_back(0x3B)
#define ML_DEC_IXH                 \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x25)
#define ML_DEC_IXL                 \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x2D)
#define ML_DEC_IYH                 \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x25)
#define ML_DEC_IYL                 \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x2D)
#define ML_DEC_IX                  \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x2B)
#define ML_DEC_IY                  \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x2B)
#define ML_DEC_ADDR_IX(D)          \
    line->machine.push_back(0xDD); \
    line->machine.push_back(0x35); \
    line->machine.push_back(D)
#define ML_DEC_ADDR_IY(D)          \
    line->machine.push_back(0xFD); \
    line->machine.push_back(0x35); \
    line->machine.push_back(D)

std::map<std::string, Mnemonic> mnemonicTable = {
    {"LD", Mnemonic::LD},
    {"LDI", Mnemonic::LDI},
    {"LDIR", Mnemonic::LDIR},
    {"LDD", Mnemonic::LDD},
    {"LDDR", Mnemonic::LDDR},
    {"PUSH", Mnemonic::PUSH},
    {"POP", Mnemonic::POP},
    {"EX", Mnemonic::EX},
    {"EXX", Mnemonic::EXX},
    {"CP", Mnemonic::CP},
    {"CPI", Mnemonic::CPI},
    {"CPIR", Mnemonic::CPIR},
    {"CPD", Mnemonic::CPD},
    {"CPDR", Mnemonic::CPDR},
    {"ADD", Mnemonic::ADD},
    {"ADC", Mnemonic::ADC},
    {"SUB", Mnemonic::SUB},
    {"SBC", Mnemonic::SBC},
    {"AND", Mnemonic::AND},
    {"OR", Mnemonic::OR},
    {"XOR", Mnemonic::XOR},
    {"EOR", Mnemonic::XOR},
    {"INC", Mnemonic::INC},
    {"DEC", Mnemonic::DEC},
    {"DAA", Mnemonic::DAA},
    {"CPL", Mnemonic::CPL},
    {"NEG", Mnemonic::NEG},
    {"CCF", Mnemonic::CCF},
    {"SCF", Mnemonic::SCF},
    {"NOP", Mnemonic::NOP},
    {"HALT", Mnemonic::HALT},
    {"RL", Mnemonic::RL},
    {"RLA", Mnemonic::RLA},
    {"RLC", Mnemonic::RLC},
    {"RLCA", Mnemonic::RLCA},
    {"RR", Mnemonic::RR},
    {"RRA", Mnemonic::RRA},
    {"RRC", Mnemonic::RRC},
    {"RRCA", Mnemonic::RRCA},
    {"SLA", Mnemonic::SLA},
    {"SL", Mnemonic::SLA},
    {"SLL", Mnemonic::SLL},
    {"SRA", Mnemonic::SRA},
    {"SRL", Mnemonic::SRL},
    {"SR", Mnemonic::SRL},
    {"RLD", Mnemonic::RLD},
    {"RRD", Mnemonic::RRD},
    {"BIT", Mnemonic::BIT},
    {"SET", Mnemonic::SET},
    {"RES", Mnemonic::RES},
    {"JP", Mnemonic::JP},
    {"JR", Mnemonic::JR},
    {"JZ", Mnemonic::JZ},
    {"JNZ", Mnemonic::JNZ},
    {"JC", Mnemonic::JC},
    {"JNC", Mnemonic::JNC},
    {"JPO", Mnemonic::JPO},
    {"JPE", Mnemonic::JPE},
    {"JPP", Mnemonic::JPP},
    {"JPM", Mnemonic::JPM},
    {"JPN", Mnemonic::JPM},
    {"DJNZ", Mnemonic::DJNZ},
    {"CALL", Mnemonic::CALL},
    {"RST", Mnemonic::RST},
    {"RET", Mnemonic::RET},
    {"RETI", Mnemonic::RETI},
    {"RETN", Mnemonic::RETN},
    {"OUT", Mnemonic::OUT},
    {"OUTI", Mnemonic::OUTI},
    {"OUTIR", Mnemonic::OTIR},
    {"OTIR", Mnemonic::OTIR},
    {"OUTD", Mnemonic::OUTD},
    {"OUTDR", Mnemonic::OTDR},
    {"OTDR", Mnemonic::OTDR},
    {"IN", Mnemonic::IN},
    {"INI", Mnemonic::INI},
    {"INIR", Mnemonic::INIR},
    {"IND", Mnemonic::IND},
    {"INDR", Mnemonic::INDR},
    {"DI", Mnemonic::DI},
    {"EI", Mnemonic::EI},
    {"IM", Mnemonic::IM},
    {"DB", Mnemonic::DB},
    {"DEFB", Mnemonic::DB},
    {"DW", Mnemonic::DW},
    {"DEFW", Mnemonic::DW},
    {"BYTE", Mnemonic::DB},
    {"WORD", Mnemonic::DW},
};

static bool parseMneimonicSkipScope = false;

void parse_mneoimonic(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        // スコープ内ではニーモニック解析をスキップ
        if (parseMneimonicSkipScope) {
            if (it->first == TokenType::ScopeEnd) {
                parseMneimonicSkipScope = false;
            }
            continue;
        }

        // スコープ開始を検出したらスキップ
        if (it->first == TokenType::ScopeBegin) {
            parseMneimonicSkipScope = true;
            continue;
        }

        // Other ならチェック
        if (it->first == TokenType::Other) {
            auto m = mnemonicTable.find(it->second);
            if (m != mnemonicTable.end()) {
                if (it == line->token.begin()) {
                    it->first = TokenType::Mnemonic;
                } else {
                    line->error = true;
                    line->errmsg = "A mnemonic specified position was incorrect.";
                    return;
                }
            }
        }
    }
}

bool mnemonic_format_check(LineData* line, int size, ...)
{
    if (line->token.size() != size) {
        line->error = true;
        line->errmsg = "Excessive or insufficient number of operands.";
        return false;
    }
    if (1 == size) {
        return true;
    }
    va_list arg;
    va_start(arg, size);
    bool error = false;
    for (auto it = line->token.begin() + 1; it != line->token.end(); it++) {
        auto expect = va_arg(arg, TokenType);
        if (!error) {
            error = it->first != expect;
            if (error) {
                line->error = true;
                line->errmsg = "Unexpected operand: " + it->second;
            }
        }
    }
    va_end(arg);
    return !line->error;
}

bool mnemonic_range(LineData* line, int n, int min, int max)
{
    if (n < min || max < n) {
        line->error = true;
        line->errmsg = "Numerical range incorrect: " + std::to_string(n);
        return false;
    }
    return true;
}

bool mnemonic_is_reg16(Operand op)
{
    switch (op) {
        case Operand::AF: return true;
        case Operand::BC: return true;
        case Operand::DE: return true;
        case Operand::HL: return true;
        case Operand::IX: return true;
        case Operand::IY: return true;
        case Operand::SP: return true;
        default: return false;
    }
}

void mnemonic_single(LineData* line, uint8_t code)
{
    if (mnemonic_format_check(line, 1)) {
        line->machine.push_back(code);
    }
}

void mnemonic_single_ED(LineData* line, uint8_t code)
{
    if (mnemonic_format_check(line, 1)) {
        line->machine.push_back(0xED);
        line->machine.push_back(code);
    }
}

void mnemonic_IM(LineData* line)
{
    if (mnemonic_format_check(line, 2, TokenType::Numeric)) {
        line->machine.push_back(0xED);
        switch (atoi(line->token[1].second.c_str())) {
            case 0: line->machine.push_back(0x46); break;
            case 1: line->machine.push_back(0x56); break;
            case 2: line->machine.push_back(0x5E); break;
            default:
                line->error = true;
                line->errmsg = "Unsupported interrupt mode: " + line->token[1].second;
        }
    }
}

void mnemonic_PUSH(LineData* line)
{
    if (mnemonic_format_check(line, 2, TokenType::Operand)) {
        switch (operandTable[line->token[1].second]) {
            case Operand::BC: ML_PUSH_BC; break;
            case Operand::DE: ML_PUSH_DE; break;
            case Operand::HL: ML_PUSH_HL; break;
            case Operand::AF: ML_PUSH_AF; break;
            case Operand::IX: ML_PUSH_IX; break;
            case Operand::IY: ML_PUSH_IY; break;
            default:
                line->error = true;
                line->errmsg = "Unsupported PUSH operand: " + line->token[1].second;
        }
    }
}

void mnemonic_POP(LineData* line)
{
    if (mnemonic_format_check(line, 2, TokenType::Operand)) {
        switch (operandTable[line->token[1].second]) {
            case Operand::BC: ML_POP_BC; break;
            case Operand::DE: ML_POP_DE; break;
            case Operand::HL: ML_POP_HL; break;
            case Operand::AF: ML_POP_AF; break;
            case Operand::IX: ML_POP_IX; break;
            case Operand::IY: ML_POP_IY; break;
            default:
                line->error = true;
                line->errmsg = "Unsupported POP operand: " + line->token[1].second;
        }
    }
}

void mnemonic_EX(LineData* line)
{
    if (line->token.size() < 4) {
        line->error = true;
        line->errmsg = "Excessive or insufficient number of operands.";
    }
    if (line->token[1].first == TokenType::Operand) {
        if (mnemonic_format_check(line, 4, TokenType::Operand, TokenType::Split, TokenType::Operand)) {
            auto left = operandTable[line->token[1].second];
            auto right = operandTable[line->token[3].second];
            if (left == Operand::DE && right == Operand::HL) {
                line->machine.push_back(0xEB);
            } else if (left == Operand::AF && right == Operand::AF_dash) {
                line->machine.push_back(0x08);
            } else {
                line->error = true;
                line->errmsg = "Incorrect EX syntax.";
            }
        }
    } else if (line->token[1].first == TokenType::AddressBegin) {
        if (mnemonic_format_check(line, 6, TokenType::AddressBegin, TokenType::Operand, TokenType::AddressEnd, TokenType::Split, TokenType::Operand)) {
            auto left = operandTable[line->token[2].second];
            auto right = operandTable[line->token[5].second];
            if (left == Operand::SP && right == Operand::HL) {
                line->machine.push_back(0xE3);
            } else if (left == Operand::SP && right == Operand::IX) {
                line->machine.push_back(0xDD);
                line->machine.push_back(0xE3);
            } else if (left == Operand::SP && right == Operand::IY) {
                line->machine.push_back(0xFD);
                line->machine.push_back(0xE3);
            } else {
                line->error = true;
                line->errmsg = "Incorrect EX syntax.";
            }
        }
    } else {
        line->error = true;
        line->errmsg = "Incorrect EX syntax.";
    }
}

void mnemonic_calc8(LineData* line, uint8_t code)
{
    if (line->token.size() == 2 && line->token[1].first == TokenType::Operand) {
        auto op = operandTable[line->token[1].second];
        if (op == Operand::IXH || op == Operand::IXL) {
            line->machine.push_back(0xDD);
        } else if (op == Operand::IYH || op == Operand::IYL) {
            line->machine.push_back(0xFD);
        }
        switch (op) {
            case Operand::A: code |= 0x07; break;
            case Operand::B: code |= 0x00; break;
            case Operand::C: code |= 0x01; break;
            case Operand::D: code |= 0x02; break;
            case Operand::E: code |= 0x03; break;
            case Operand::H: code |= 0x04; break;
            case Operand::L: code |= 0x05; break;
            case Operand::IXH: code |= 0x04; break;
            case Operand::IXL: code |= 0x05; break;
            case Operand::IYH: code |= 0x04; break;
            case Operand::IYL: code |= 0x05; break;
            default:
                line->error = true;
                line->errmsg = "Illegal 8-bit arithmetic instruction.";
                return;
        }
        line->machine.push_back(code);
    } else if (line->token.size() == 2 && line->token[1].first == TokenType::Numeric) {
        auto n = atoi(line->token[1].second.c_str());
        if (mnemonic_range(line, n, -128, 255)) {
            line->machine.push_back(code | 0x46);
            line->machine.push_back(n & 0xFF);
        }
    } else if (4 <= line->token.size() &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Operand) {
        auto op = operandTable[line->token[2].second];
        if (op == Operand::HL) {
            if (4 != line->token.size() && line->token[3].first == TokenType::AddressEnd) {
                line->error = true;
                line->errmsg = "Illegal 8-bit arithmetic instruction.";
            } else {
                line->machine.push_back(code | 0x06);
            }
        } else if (op == Operand::IX || op == Operand::IY) {
            line->machine.push_back(op == Operand::IX ? 0xDD : 0xFD);
            line->machine.push_back(code | 0x06);
            if (4 == line->token.size() && line->token[3].first == TokenType::AddressEnd) {
                line->machine.push_back(0x00);
            } else if (6 == line->token.size() &&
                       line->token[3].first == TokenType::Plus &&
                       line->token[4].first == TokenType::Numeric &&
                       line->token[5].first == TokenType::AddressEnd) {
                auto n = atoi(line->token[4].second.c_str());
                if (mnemonic_range(line, n, 0, 127)) {
                    line->machine.push_back(n & 0xFF);
                }
            } else if (6 == line->token.size() &&
                       line->token[3].first == TokenType::Minus &&
                       line->token[4].first == TokenType::Numeric &&
                       line->token[5].first == TokenType::AddressEnd) {
                auto n = atoi(line->token[4].second.c_str());
                if (mnemonic_range(line, n, 0, 128)) {
                    line->machine.push_back((0 - n) & 0xFF);
                }
            } else {
                line->error = true;
                line->errmsg = "Illegal 8-bit arithmetic instruction.";
            }
        } else {
            line->error = true;
            line->errmsg = "Illegal 8-bit arithmetic instruction.";
        }
    } else if (3 < line->token.size() && line->token[1].first == TokenType::Operand && line->token[2].first == TokenType::Split) {
        auto op = operandTable[line->token[1].second];
        if (op == Operand::A) {
            auto it = line->token.begin() + 1;
            line->token.erase(it);
            line->token.erase(it);
            mnemonic_calc8(line, code);
        } else {
            line->error = true;
            line->errmsg = "Illegal arithmetic instruction.";
        }
    } else {
        line->error = true;
        line->errmsg = "Illegal 8-bit arithmetic instruction.";
    }
}

static void mnemonic_calc16(LineData* line, uint8_t code)
{
    bool supportImmediate = true;
    bool supportIXY = true;
    switch (mnemonicTable[line->token[0].second]) {
        case Mnemonic::ADC:
        case Mnemonic::SBC:
            line->machine.push_back(0xED);
            supportImmediate = false;
            supportIXY = false;
            break;
    }
    if (line->token.size() == 4 && line->token[1].first == TokenType::Operand && line->token[2].first == TokenType::Split && line->token[3].first == TokenType::Operand) {
        auto op1 = operandTable[line->token[1].second];
        auto op2 = operandTable[line->token[3].second];
        if (op1 == Operand::HL) {
            if (op2 != Operand::BC && op2 != Operand::DE && op2 != Operand::HL && op2 != Operand::SP) {
                line->error = true;
                line->errmsg = "Illegal 16-bit arithmetic instruction.";
                return;
            }
        } else if (supportIXY && op1 == Operand::IX) {
            line->machine.push_back(0xDD);
            if (op2 != Operand::BC && op2 != Operand::DE && op2 != Operand::IX && op2 != Operand::SP) {
                line->error = true;
                line->errmsg = "Illegal 16-bit arithmetic instruction.";
                return;
            }
        } else if (supportIXY && op1 == Operand::IY) {
            line->machine.push_back(0xFD);
            if (op2 != Operand::BC && op2 != Operand::DE && op2 != Operand::IY && op2 != Operand::SP) {
                line->error = true;
                line->errmsg = "Illegal 16-bit arithmetic instruction.";
                return;
            }
        } else {
            line->error = true;
            line->errmsg = "Illegal 16-bit arithmetic instruction.";
            return;
        }
        switch (op2) {
            case Operand::BC: line->machine.push_back(code); break;
            case Operand::DE: line->machine.push_back(code | 0x10); break;
            case Operand::HL: line->machine.push_back(code | 0x20); break;
            case Operand::IX: line->machine.push_back(code | 0x20); break;
            case Operand::IY: line->machine.push_back(code | 0x20); break;
            case Operand::SP: line->machine.push_back(code | 0x30); break;
        }
    } else if (supportImmediate && line->token.size() == 4 && line->token[1].first == TokenType::Operand && line->token[2].first == TokenType::Split && line->token[3].first == TokenType::Numeric) {
        auto op = operandTable[line->token[1].second];
        auto nn = atoi(line->token[3].second.c_str());
        if (op != Operand::HL && op != Operand::IX && op != Operand::IY) {
            line->error = true;
            line->errmsg = "Illegal 16-bit arithmetic instruction.";
            return;
        }
        if (mnemonic_range(line, nn, -32768, 65535)) {
            uint8_t nl = nn & 0xFF;
            uint8_t nh = (nn & 0xFF00) >> 8;
            ML_PUSH_DE;
            ML_LD_D_n(nh);
            ML_LD_E_n(nl);
            switch (op) {
                case Operand::IX: line->machine.push_back(0xDD); break;
                case Operand::IY: line->machine.push_back(0xFD); break;
            }
            line->machine.push_back(code | 0x10);
            ML_POP_DE;
        }
    } else {
        line->error = true;
        line->errmsg = "Illegal 16-bit arithmetic instruction.";
    }
}

static void mnemonic_calcOH(LineData* line, uint8_t code8, uint8_t code16)
{
    if (line->token.size() == 2 && line->token[1].first == TokenType::Operand) {
        mnemonic_calc8(line, code8);
    } else if (line->token.size() == 2 && line->token[1].first == TokenType::Numeric) {
        mnemonic_calc8(line, code8);
    } else if (3 <= line->token.size() && line->token[1].first == TokenType::AddressBegin) {
        mnemonic_calc8(line, code8);
    } else if (3 < line->token.size() && line->token[1].first == TokenType::Operand && line->token[2].first == TokenType::Split) {
        auto op = operandTable[line->token[1].second];
        if (op == Operand::A) {
            auto it = line->token.begin() + 1;
            line->token.erase(it);
            line->token.erase(it);
            mnemonic_calc8(line, code8);
        } else if (mnemonic_is_reg16(op)) {
            mnemonic_calc16(line, code16);
        } else {
            line->error = true;
            line->errmsg = "Illegal arithmetic instruction.";
        }
    } else {
        line->error = true;
        line->errmsg = "Illegal arithmetic instruction.";
    }
}

static void mnemonic_bit_op(LineData* line, Mnemonic mne)
{
    if (line->token.size() == 4) {
        if (line->token[1].first == TokenType::Numeric &&
            line->token[2].first == TokenType::Split &&
            line->token[3].first == TokenType::Operand) {
            int b = atoi(line->token[1].second.c_str());
            if (!mnemonic_range(line, b, 0, 7)) {
                return;
            }
            b <<= 3;
            uint8_t r;
            switch (operandTable[line->token[3].second]) {
                case Operand::A: r = 0b111; break;
                case Operand::B: r = 0b000; break;
                case Operand::C: r = 0b001; break;
                case Operand::D: r = 0b010; break;
                case Operand::E: r = 0b011; break;
                case Operand::H: r = 0b100; break;
                case Operand::L: r = 0b101; break;
                default:
                    line->error = true;
                    line->errmsg = "Illegal BIT/SET/RES instruction.";
                    return;
            }
            uint8_t c;
            switch (mne) {
                case Mnemonic::BIT: c = 0b01000000; break;
                case Mnemonic::SET: c = 0b11000000; break;
                case Mnemonic::RES: c = 0b10000000; break;
                default:
                    line->error = true;
                    line->errmsg = "Illegal BIT/SET/RES instruction.";
                    return;
            }
            line->machine.push_back(0xCB);
            line->machine.push_back(c | b | r);
            return;
        }
    } else if (line->token.size() == 6) {
        if (line->token[1].first == TokenType::Numeric &&
            line->token[2].first == TokenType::Split &&
            line->token[3].first == TokenType::AddressBegin &&
            line->token[4].first == TokenType::Operand &&
            line->token[5].first == TokenType::AddressEnd) {
            bool setZero = true;
            switch (operandTable[line->token[4].second]) {
                case Operand::HL: setZero = false; break;
                case Operand::IX: line->machine.push_back(0xDD); break;
                case Operand::IY: line->machine.push_back(0xFD); break;
                default:
                    line->error = true;
                    line->errmsg = "Illegal BIT/SET/RES instruction.";
                    return;
            }
            int b = atoi(line->token[1].second.c_str());
            if (!mnemonic_range(line, b, 0, 7)) {
                return;
            }
            b <<= 3;
            uint8_t c;
            switch (mne) {
                case Mnemonic::BIT: c = 0b01000110; break;
                case Mnemonic::SET: c = 0b11000110; break;
                case Mnemonic::RES: c = 0b10000110; break;
                default:
                    line->error = true;
                    line->errmsg = "Illegal BIT/SET/RES instruction.";
                    return;
            }
            line->machine.push_back(0xCB);
            if (setZero) {
                line->machine.push_back(0x00);
            }
            line->machine.push_back(c | b);
            return;
        }
    } else if (line->token.size() == 8) {
        if (line->token[1].first == TokenType::Numeric &&
            line->token[2].first == TokenType::Split &&
            line->token[3].first == TokenType::AddressBegin &&
            line->token[4].first == TokenType::Operand &&
            (line->token[5].first == TokenType::Plus || line->token[5].first == TokenType::Minus) &&
            line->token[6].first == TokenType::Numeric &&
            line->token[7].first == TokenType::AddressEnd) {
            switch (operandTable[line->token[4].second]) {
                case Operand::IX: line->machine.push_back(0xDD); break;
                case Operand::IY: line->machine.push_back(0xFD); break;
                default:
                    line->error = true;
                    line->errmsg = "Illegal BIT/SET/RES instruction.";
                    return;
            }
            int b = atoi(line->token[1].second.c_str());
            if (!mnemonic_range(line, b, 0, 7)) {
                return;
            }
            b <<= 3;
            int n = atoi(line->token[6].second.c_str());
            if (line->token[5].first == TokenType::Plus) {
                if (!mnemonic_range(line, n, 0, 127)) {
                    return;
                }
            } else {
                if (!mnemonic_range(line, n, 0, 128)) {
                    return;
                }
                n = 0 - n;
            }
            uint8_t c;
            switch (mne) {
                case Mnemonic::BIT: c = 0b01000110; break;
                case Mnemonic::SET: c = 0b11000110; break;
                case Mnemonic::RES: c = 0b10000110; break;
                default:
                    line->error = true;
                    line->errmsg = "Illegal BIT/SET/RES instruction.";
                    return;
            }
            line->machine.push_back(0xCB);
            line->machine.push_back(n & 0xFF);
            line->machine.push_back(c | b);
            return;
        }
    }
    line->error = true;
    line->errmsg = "Illegal BIT/SET/RES instruction.";
}

static void mnemonic_INC(LineData* line)
{
    if (line->token.size() == 2 && line->token[1].first == TokenType::Operand) {
        switch (operandTable[line->token[1].second]) {
            case Operand::A: ML_INC_A; return;
            case Operand::B: ML_INC_B; return;
            case Operand::C: ML_INC_C; return;
            case Operand::D: ML_INC_D; return;
            case Operand::E: ML_INC_E; return;
            case Operand::H: ML_INC_H; return;
            case Operand::L: ML_INC_L; return;
            case Operand::IXH: ML_INC_IXH; return;
            case Operand::IXL: ML_INC_IXL; return;
            case Operand::IYH: ML_INC_IYH; return;
            case Operand::IYL: ML_INC_IYL; return;
            case Operand::BC: ML_INC_BC; return;
            case Operand::DE: ML_INC_DE; return;
            case Operand::HL: ML_INC_HL; return;
            case Operand::SP: ML_INC_SP; return;
            case Operand::IX: ML_INC_IX; return;
            case Operand::IY: ML_INC_IY; return;
        }
    } else if (line->token.size() == 4 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Operand &&
               line->token[3].first == TokenType::AddressEnd) {
        switch (operandTable[line->token[2].second]) {
            case Operand::HL: ML_INC_ADDR_HL; return;
            case Operand::IX: ML_INC_ADDR_IX(0); return;
            case Operand::IY: ML_INC_ADDR_IY(0); return;
        }
    } else if (line->token.size() == 4 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Numeric &&
               line->token[3].first == TokenType::AddressEnd) {
        int addr = atoi(line->token[2].second.c_str());
        if (mnemonic_range(line, addr, 0x0000, 0xFFFF)) {
            ML_PUSH_HL;
            ML_LD_L_n(addr & 0x00FF);
            ML_LD_H_n((addr & 0xFF00) >> 8);
            ML_INC_ADDR_HL;
            ML_POP_HL;
            return;
        }
    } else if (line->token.size() == 6 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Operand &&
               (line->token[3].first == TokenType::Plus || line->token[3].first == TokenType::Minus) &&
               line->token[4].first == TokenType::Numeric &&
               line->token[5].first == TokenType::AddressEnd) {
        int n = atoi(line->token[4].second.c_str());
        if (line->token[3].first == TokenType::Plus) {
            if (!mnemonic_range(line, n, 0, 127)) {
                return;
            }
        } else {
            if (!mnemonic_range(line, n, 0, 128)) {
                return;
            }
            n = 0 - n;
        }
        switch (operandTable[line->token[2].second]) {
            case Operand::IX: ML_INC_ADDR_IX(n); return;
            case Operand::IY: ML_INC_ADDR_IY(n); return;
        }
    }
    line->error = true;
    line->errmsg = "Illegal INC instruction.";
}

static void mnemonic_DEC(LineData* line)
{
    if (line->token.size() == 2 && line->token[1].first == TokenType::Operand) {
        switch (operandTable[line->token[1].second]) {
            case Operand::A: ML_DEC_A; return;
            case Operand::B: ML_DEC_B; return;
            case Operand::C: ML_DEC_C; return;
            case Operand::D: ML_DEC_D; return;
            case Operand::E: ML_DEC_E; return;
            case Operand::H: ML_DEC_H; return;
            case Operand::L: ML_DEC_L; return;
            case Operand::IXH: ML_DEC_IXH; return;
            case Operand::IXL: ML_DEC_IXL; return;
            case Operand::IYH: ML_DEC_IYH; return;
            case Operand::IYL: ML_DEC_IYL; return;
            case Operand::BC: ML_DEC_BC; return;
            case Operand::DE: ML_DEC_DE; return;
            case Operand::HL: ML_DEC_HL; return;
            case Operand::SP: ML_DEC_SP; return;
            case Operand::IX: ML_DEC_IX; return;
            case Operand::IY: ML_DEC_IY; return;
        }
    } else if (line->token.size() == 4 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Operand &&
               line->token[3].first == TokenType::AddressEnd) {
        switch (operandTable[line->token[2].second]) {
            case Operand::HL: ML_DEC_ADDR_HL; return;
            case Operand::IX: ML_DEC_ADDR_IX(0); return;
            case Operand::IY: ML_DEC_ADDR_IY(0); return;
        }
    } else if (line->token.size() == 4 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Numeric &&
               line->token[3].first == TokenType::AddressEnd) {
        int addr = atoi(line->token[2].second.c_str());
        if (mnemonic_range(line, addr, 0x0000, 0xFFFF)) {
            ML_PUSH_HL;
            ML_LD_L_n(addr & 0x00FF);
            ML_LD_H_n((addr & 0xFF00) >> 8);
            ML_DEC_ADDR_HL;
            ML_POP_HL;
            return;
        }
    } else if (line->token.size() == 6 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Operand &&
               (line->token[3].first == TokenType::Plus || line->token[3].first == TokenType::Minus) &&
               line->token[4].first == TokenType::Numeric &&
               line->token[5].first == TokenType::AddressEnd) {
        int n = atoi(line->token[4].second.c_str());
        if (line->token[3].first == TokenType::Plus) {
            if (!mnemonic_range(line, n, 0, 127)) {
                return;
            }
        } else {
            if (!mnemonic_range(line, n, 0, 128)) {
                return;
            }
            n = 0 - n;
        }
        switch (operandTable[line->token[2].second]) {
            case Operand::IX: ML_DEC_ADDR_IX(n); return;
            case Operand::IY: ML_DEC_ADDR_IY(n); return;
        }
    }
    line->error = true;
    line->errmsg = "Illegal DEC instruction.";
}

static void mnemonic_shift(LineData* line, uint8_t code)
{
    if (line->token.size() == 2 && line->token[1].first == TokenType::Operand) {
        line->machine.push_back(0xCB);
        switch (operandTable[line->token[1].second]) {
            case Operand::A: line->machine.push_back(code | 0x07); return;
            case Operand::B: line->machine.push_back(code | 0x00); return;
            case Operand::C: line->machine.push_back(code | 0x01); return;
            case Operand::D: line->machine.push_back(code | 0x02); return;
            case Operand::E: line->machine.push_back(code | 0x03); return;
            case Operand::H: line->machine.push_back(code | 0x04); return;
            case Operand::L: line->machine.push_back(code | 0x05); return;
        }
    } else if (line->token.size() == 4 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Operand &&
               line->token[3].first == TokenType::AddressEnd) {
        switch (operandTable[line->token[2].second]) {
            case Operand::HL:;
                line->machine.push_back(0xCB);
                line->machine.push_back(code | 0x06);
                return;
            case Operand::IX:;
                line->machine.push_back(0xDD);
                line->machine.push_back(0xCB);
                line->machine.push_back(0x00);
                line->machine.push_back(code | 0x06);
                return;
            case Operand::IY:;
                line->machine.push_back(0xFD);
                line->machine.push_back(0xCB);
                line->machine.push_back(0x00);
                line->machine.push_back(code | 0x06);
                return;
        }
    } else if (line->token.size() == 6 &&
               line->token[1].first == TokenType::AddressBegin &&
               line->token[2].first == TokenType::Operand &&
               (line->token[3].first == TokenType::Plus || line->token[3].first == TokenType::Minus) &&
               line->token[4].first == TokenType::Numeric &&
               line->token[5].first == TokenType::AddressEnd) {
        int n = atoi(line->token[4].second.c_str());
        if (line->token[3].first == TokenType::Plus) {
            if (!mnemonic_range(line, n, 0, 127)) {
                return;
            }
        } else {
            if (!mnemonic_range(line, n, 0, 128)) {
                return;
            }
            n = 0 - n;
        }
        switch (operandTable[line->token[2].second]) {
            case Operand::IX:
                line->machine.push_back(0xDD);
                line->machine.push_back(0xCB);
                line->machine.push_back(n);
                line->machine.push_back(code | 0x06);
                return;
            case Operand::IY:
                line->machine.push_back(0xFD);
                line->machine.push_back(0xCB);
                line->machine.push_back(n);
                line->machine.push_back(code | 0x06);
                return;
        }
    }
    line->error = true;
    line->errmsg = "Illegal shift/rotate instruction.";
}

static void setpc(LineData* prev, LineData* cur)
{
    if (cur->programCounterInit) {
        return;
    }
    cur->programCounterInit = true;
    if (prev) {
        cur->programCounter = prev->programCounter + prev->machine.size();
    } else {
        cur->programCounter = 0;
    }
}

void mnemonic_syntax_check(std::vector<LineData*>* lines)
{
    LineData* prev = nullptr;
    for (auto line : *lines) {
        if (line->token.empty()) {
            setpc(prev, line);
            prev = line;
            continue;
        }
        if (line->token[0].first != TokenType::Mnemonic) {
            setpc(prev, line);
            prev = line;
            continue;
        }
        auto m = mnemonicTable[line->token[0].second];
        switch (m) {
            case Mnemonic::IM: mnemonic_IM(line); break;
            case Mnemonic::PUSH: mnemonic_PUSH(line); break;
            case Mnemonic::POP: mnemonic_POP(line); break;
            case Mnemonic::EX: mnemonic_EX(line); break;
            case Mnemonic::NOP: mnemonic_single(line, 0x00); break;
            case Mnemonic::DI: mnemonic_single(line, 0xF3); break;
            case Mnemonic::EI: mnemonic_single(line, 0xFB); break;
            case Mnemonic::HALT: mnemonic_single(line, 0x76); break;
            case Mnemonic::EXX: mnemonic_single(line, 0xD9); break;
            case Mnemonic::DAA: mnemonic_single(line, 0x27); break;
            case Mnemonic::CPL: mnemonic_single(line, 0x2F); break;
            case Mnemonic::CCF: mnemonic_single(line, 0x3F); break;
            case Mnemonic::SCF: mnemonic_single(line, 0x37); break;
            case Mnemonic::NEG: mnemonic_single_ED(line, 0x44); break;
            case Mnemonic::LDI: mnemonic_single_ED(line, 0xA0); break;
            case Mnemonic::LDIR: mnemonic_single_ED(line, 0xB0); break;
            case Mnemonic::LDD: mnemonic_single_ED(line, 0xA8); break;
            case Mnemonic::LDDR: mnemonic_single_ED(line, 0xB8); break;
            case Mnemonic::CPI: mnemonic_single_ED(line, 0xA1); break;
            case Mnemonic::CPIR: mnemonic_single_ED(line, 0xB1); break;
            case Mnemonic::CPD: mnemonic_single_ED(line, 0xA9); break;
            case Mnemonic::CPDR: mnemonic_single_ED(line, 0xB9); break;
            case Mnemonic::OUTI: mnemonic_single_ED(line, 0xA3); break;
            case Mnemonic::OTIR: mnemonic_single_ED(line, 0xB3); break;
            case Mnemonic::OUTD: mnemonic_single_ED(line, 0xAB); break;
            case Mnemonic::OTDR: mnemonic_single_ED(line, 0xBB); break;
            case Mnemonic::AND: mnemonic_calc8(line, 0xA0); break;
            case Mnemonic::OR: mnemonic_calc8(line, 0xB0); break;
            case Mnemonic::XOR: mnemonic_calc8(line, 0xA8); break;
            case Mnemonic::CP: mnemonic_calc8(line, 0xB8); break;
            case Mnemonic::ADD: mnemonic_calcOH(line, 0x80, 0x09); break;
            case Mnemonic::ADC: mnemonic_calcOH(line, 0x88, 0x4A); break;
            case Mnemonic::SUB: mnemonic_calc8(line, 0x90); break;
            case Mnemonic::SBC: mnemonic_calcOH(line, 0x98, 0x42); break;
            case Mnemonic::BIT: mnemonic_bit_op(line, Mnemonic::BIT); break;
            case Mnemonic::SET: mnemonic_bit_op(line, Mnemonic::SET); break;
            case Mnemonic::RES: mnemonic_bit_op(line, Mnemonic::RES); break;
            case Mnemonic::INC: mnemonic_INC(line); break;
            case Mnemonic::DEC: mnemonic_DEC(line); break;
            case Mnemonic::RLCA: mnemonic_single(line, 0x07); break;
            case Mnemonic::RLA: mnemonic_single(line, 0x17); break;
            case Mnemonic::RRCA: mnemonic_single(line, 0x0F); break;
            case Mnemonic::RRA: mnemonic_single(line, 0x1F); break;
            case Mnemonic::RLC: mnemonic_shift(line, 0x00); break;
            case Mnemonic::RL: mnemonic_shift(line, 0x10); break;
            case Mnemonic::RRC: mnemonic_shift(line, 0x08); break;
            case Mnemonic::RR: mnemonic_shift(line, 0x18); break;
            case Mnemonic::SLA: mnemonic_shift(line, 0x20); break;
            case Mnemonic::SRA: mnemonic_shift(line, 0x28); break;
            case Mnemonic::SLL: mnemonic_shift(line, 0x30); break;
            case Mnemonic::SRL: mnemonic_shift(line, 0x38); break;
            case Mnemonic::RLD: mnemonic_single_ED(line, 0x6F); break;
            case Mnemonic::RRD: mnemonic_single_ED(line, 0x67); break;
            default:
                printf("Not implemented: %s\n", line->token[0].second.c_str());
                exit(-1);
        }
        setpc(prev, line);
        prev = line;
    }
}

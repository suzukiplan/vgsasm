#include "common.h"

std::map<std::string, Operand> operandTable = {
    {"A", Operand::A},
    {"B", Operand::B},
    {"C", Operand::C},
    {"D", Operand::D},
    {"E", Operand::E},
    {"H", Operand::H},
    {"L", Operand::L},
    {"IXH", Operand::IXH},
    {"IXL", Operand::IXL},
    {"IYH", Operand::IYH},
    {"IYL", Operand::IYL},
    {"AF", Operand::AF},
    {"AF'", Operand::AF_dash},
    {"BC", Operand::BC},
    {"DE", Operand::DE},
    {"HL", Operand::HL},
    {"IX", Operand::IX},
    {"IY", Operand::IY},
    {"SP", Operand::SP},
};

static bool parseOperandSkipScope = false;

void parse_operand(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        // スコープ内では解析をスキップ
        if (parseOperandSkipScope) {
            if (it->first == TokenType::ScopeEnd) {
                parseOperandSkipScope = false;
            }
            continue;
        }

        // スコープ開始を検出したらスキップ
        if (it->first == TokenType::ScopeBegin) {
            parseOperandSkipScope = true;
            continue;
        }

        // Other ならチェック
        if (it->first == TokenType::Other) {
            auto op = operandTable.find(it->second);
            if (op != operandTable.end()) {
                it->first = TokenType::Operand;
            }
        }
    }
}

#pragma once
#include "common.hpp"
#include "file.hpp"

static std::map<std::string, Mnemonic> mnemonicTable = {
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
    {"SLL", Mnemonic::SLL},
    {"SRA", Mnemonic::SRA},
    {"SRL", Mnemonic::SRL},
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
    {"RET", Mnemonic::RET},
    {"RETI", Mnemonic::RETI},
    {"RETN", Mnemonic::RETN},
    {"RETN", Mnemonic::RST},
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
};

bool parseMneimonicSkipScope = false;

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
                if (line->mnemonic == Mnemonic::None) {
                    line->mnemonic = m->second;
                    it->first = TokenType::Mnemonic;
                } else {
                    line->error = true;
                    line->errmsg = "Multiple mnemonics specified in one line";
                    return;
                }
            }
        }
    }
}

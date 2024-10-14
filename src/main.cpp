#include "common.hpp"
#include "file.hpp"
#include "mnemonic.hpp"
#include "operand.hpp"
#include "label.hpp"
#include "numeric.hpp"
#include "formulas.hpp"
#include "bracket.hpp"
#include "struct.hpp"

int errorCount = 0;

static int check_error(LineData* line)
{
    if (line->error) {
        printf("Error: %s (%d) %s\n", line->path.c_str(), line->lineNumber, line->errmsg.c_str());
        return -1;
    }
    return 0;
}

static int check_error(std::vector<LineData*> lines)
{
    int ret = 0;
    for (auto line : lines) {
        ret |= check_error(line);
    }
    return ret;
}

void clear_delete_token(std::vector<LineData*>* lines)
{
    for (auto it1 = lines->begin(); it1 != lines->end();) {
        auto token = &(*it1)->token;
        for (auto it2 = token->begin(); it2 != token->end();) {
            if (it2->first == TokenType::Delete) {
                token->erase(it2);
            } else {
                it2++;
            }
        }
        if (token->empty()) {
            lines->erase(it1);
        } else {
            it1++;
        }
    }
}

static int assemble(std::vector<LineData*> lines)
{
    bool error = false;

    // 基本構文解析
    for (auto line : lines) {
        parse_label(line);        // Other -> Label or LabelAt
        parse_mneoimonic(line);   // Other -> Mnemonic
        parse_operand(line);      // Other -> Operand
        parse_struct(line);       // Other -> Struct
        bracket_to_address(line); // Braket -> Address
        parse_numeric(line);      // Other -> Numeric
        evaluate_formulas(line);  // Numeric + Numeric - Numeric * Numeric / Numer -> Numeric

        // ( Numric ) -> Numeric and formulas again
        while (bracket_eliminate(line)) {
            evaluate_formulas(line);
        }
        error = check_error(line) ? true : error;
    }
    if (error) {
        return -1;
    }

    // struct 構文解析
    while (struct_syntax_check(&lines)) {
        if (check_error(lines)) {
            return -1;
        }
    }
    int retryCount = 0;
    while (struct_check_size()) {
        if (check_error(lines)) {
            return -1;
        }
        retryCount++;
        if (structTable.size() <= retryCount) {
            // 循環参照が発生している構造体をエラーにする
            for (auto it = structTable.begin(); it != structTable.end(); it++) {
                if (0 == it->second->size) {
                    it->second->line->error = true;
                    it->second->line->errmsg = "Detects circular references between structures";
                    break;
                }
            }
        }
    }
    if (check_error(lines)) {
        return -1;
    }
    clear_delete_token(&lines);

    // struct解析結果を出力（デバッグ）
    for (auto s : structTable) {
        printf("Struct: %s (0x%X) size = %d\n", s.first.c_str(), s.second->start, s.second->size);
        for (auto f : s.second->fields) {
            printf(" - %s (size=%d, count=%d)\n", f->name.c_str(), f->size, f->count);
        }
    }

    // 解析結果を出力（デバッグ）
    for (auto line : lines) {
        printf("%16s:%04d", line->path.c_str(), line->lineNumber);
        for (auto token : line->token) {
            if (token.first == TokenType::Mnemonic || token.first == TokenType::Operand) {
                printf(" <%s>", token.second.c_str());
            } else if (token.first == TokenType::AddressBegin) {
                printf(" _(");
            } else if (token.first == TokenType::AddressEnd) {
                printf(" )_");
            } else {
                printf(" `%s`", token.second.c_str());
            }
        }
        printf("\n");
    }

    return 0;
}

static int assemble(const char* path)
{
    return assemble(readFile(path));
}

int main(int argc, char* argv[])
{
    for (int i = 1; i < argc; i++) {
        if (!assemble(argv[i])) {
            return -1;
        }
    }
    return 0;
}

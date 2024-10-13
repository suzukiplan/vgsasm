#include "common.hpp"
#include "file.hpp"
#include "mnemonic.hpp"
#include "operand.hpp"
#include "label.hpp"
#include "numeric.hpp"
#include "formulas.hpp"
#include "bracket.hpp"

static int assemble(std::vector<LineData*> lines)
{
    bool error = false;
    int errorCount = 0;
    for (auto line : lines) {
        parse_label(line);        // Other -> Label or LabelAt
        parse_mneoimonic(line);   // Other -> Mnemonic
        parse_operand(line);      // Other -> Operand
        bracket_to_address(line); // Braket -> Address
        parse_numeric(line);      // Other -> Numeric
        evaluate_formulas(line);  // Numeric + Numeric - Numeric * Numeric / Numer -> Numeric

        // ( Numric ) -> Numeric and formulas again
        while (bracket_eliminate(line)) {
            evaluate_formulas(line);
        }

        if (line->error) {
            printf("Error: %s (%d) %s\n", line->path.c_str(), line->lineNumber, line->errmsg.c_str());
            error = true;
            if (100 < ++errorCount) {
                break;
            }
        }
    }
    if (error) {
        return -1;
    }

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

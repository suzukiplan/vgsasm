#include "common.hpp"
#include "file.hpp"
#include "mnemonic.hpp"
#include "label.hpp"
#include "numeric.hpp"
#include "formulas.hpp"
#include "bracket.hpp"

static int assemble(std::vector<LineData*> lines)
{
    bool error = false;
    int errorCount = 0;
    for (auto line : lines) {
        parse_label(line);
        parse_mneoimonic(line);
        bracket_to_address(line);
        parse_numeric(line);
        evaluate_formulas(line);
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
            if (token.first == TokenType::Mnemonic) {
                printf(" <%s>", token.second.c_str());
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

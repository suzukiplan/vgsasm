#include "common.hpp"
#include "file.hpp"
#include "mnemonic.hpp"
#include "label.hpp"

static int assemble(std::vector<LineData*> lines)
{
    bool error = false;
    for (auto line : lines) {
        if (line->error) {
            printf("Error: %s (%d) %s\n", line->path.c_str(), line->lineNumber, line->errmsg.c_str());
            error = true;
        } else {
            parse_label(line);
        }
    }
    if (error) {
        return -1;
    }

    for (auto line : lines) {
        printf("%16s:%04d", line->path.c_str(), line->lineNumber);
        for (auto token : line->token) {
            printf(" `%s`", token.second.c_str());
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

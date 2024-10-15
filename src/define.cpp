#include "common.h"

bool parse_define(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->second == "#DEFINE") {
            it++;
            if (it == line->token.end() || it->first != TokenType::Other) {
                line->error = true;
                line->errmsg = "No definition name specified in #define.";
                return false;
            }
            auto name = it->second;
            auto d = defineTable.find(name);
            if (d != defineTable.end()) {
                line->error = true;
                line->errmsg = "Duplicate definition name " + name + " in #define";
                return false;
            }
            defineTable[name].push_back(std::make_pair(TokenType::Delete, ""));
            it++;
            while (it != line->token.end()) {
                defineTable[name].push_back(std::make_pair(it->first, it->second));
                it++;
            }
            return true;
        }
    }
    return false;
}

void replace_define(LineData* line)
{
    bool result = false;
    bool replace = true;
    int tryCount = 0;
    int maxTryCount = (int)line->token.size() + 1;
    while (replace) {
        replace = false;
        tryCount++;
        if (maxTryCount < tryCount) {
            line->error = true;
            line->errmsg = "Detect circular references in #define definition names.";
            break;
        }
        for (auto it = line->token.begin(); it != line->token.end(); it++) {
            auto d = defineTable.find(it->second);
            if (d != defineTable.end()) {
                addNameTable(it->second, line);
                line->token.erase(it);
                line->token.insert(it, d->second.begin(), d->second.end());
                replace = true;
                result = true;
                break;
            }
        }
    }
}
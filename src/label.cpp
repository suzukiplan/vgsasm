#include "common.h"

static std::string lastLabel = "";

void parse_label(LineData* line)
{
    if (line->token.empty()) {
        return;
    }
    auto token = &line->token[0];
    if (token->first != TokenType::Other || token->second.empty()) {
        return;
    }

    auto str = token->second.c_str();
    std::string label = "";
    if (str[0] == '.') {
        token->first = TokenType::Label;
        label = str + 1;
        lastLabel = label;
    } else if (str[strlen(str) - 1] == ':') {
        token->first = TokenType::Label;
        label = token->second.substr(0, token->second.length() - 1);
        lastLabel = label;
    } else if (str[0] == '@') {
        token->first = TokenType::LabelAt;
        label = str + 1;
        label += "@" + lastLabel;
    }
    if (!label.empty()) {
        if (labelTable.find(label) != labelTable.end()) {
            line->error = true;
            line->errmsg = "Duplicate label: " + label;
        } else {
            addNameTable(label, line);
            token->second = label;
            labelTable[label] = line;
        }
    }
}
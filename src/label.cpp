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
        token->second = label;
    } else if (str[strlen(str) - 1] == ':') {
        token->first = TokenType::Label;
        label = token->second.substr(0, token->second.length() - 1);
        lastLabel = label;
        token->second = label;
    } else if (str[0] == '@') {
        token->first = TokenType::LabelAt;
        label = str + 1;
        label += "@" + lastLabel;
        token->second = label;
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

void parse_label_jump(LineData* line)
{
    static auto lastLabel = line->token.end();
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->first == TokenType::Label) {
            lastLabel = it;
        } else if (it->first == TokenType::Other) {
            std::string labelName;
            bool errorIfNotFound;
            auto str = it->second.c_str();
            if ('@' == str[0]) {
                if (lastLabel == line->token.end()) {
                    line->error = true;
                    line->errmsg = "Unknown label specified: " + it->second;
                    return;
                }
                labelName = &str[1];
                labelName += "@" + lastLabel->second;
                errorIfNotFound = true;
            } else {
                labelName = it->second;
                errorIfNotFound = false;
            }
            auto label = labelTable.find(labelName);
            if (label != labelTable.end()) {
                it->first = TokenType::LabelJump;
                it->second = labelName;
            } else if (errorIfNotFound) {
                line->error = true;
                line->errmsg = "Unknown label specified: " + it->second;
                return;
            }
        }
    }
}

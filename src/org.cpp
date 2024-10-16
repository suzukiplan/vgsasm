#include "common.h"

void parse_org(LineData* line)
{
    if (line->token.empty()) {
        return;
    }
    if (line->token[0].second != "ORG") {
        return;
    }
    if (line->token.size() != 2 || line->token[1].first != TokenType::Numeric) {
        line->error = true;
        line->errmsg = "ORG formatting is incorrect.";
        return;
    }
    line->token[0].first = TokenType::Org;
    line->token[0].second = line->token[1].second;
    line->token.erase(line->token.begin() + 1);
}

void setpc_org(std::vector<LineData*>* lines)
{
    auto prev = lines->end();
    for (auto it = lines->begin(); it != lines->end(); it++) {
        // 直前の行が ORG の行を探す
        if (prev != lines->end() && !(*prev)->token.empty() && (*prev)->token[0].first == TokenType::Org) {
            (*it)->programCounterInit = true;
            (*it)->programCounter = atoi((*prev)->token[0].second.c_str());
            lines->erase(prev);
            it = lines->begin();
        }
        prev = it;
    }
}
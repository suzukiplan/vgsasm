#include "common.h"

void parse_struct(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->second == "STRUCT") {
            it->first = TokenType::Struct;
        }
    }
}

bool struct_syntax_check(std::vector<LineData*>* lines)
{
    // struct を探索
    TokenType expect = TokenType::None;
    Struct* newStruct = nullptr;
    StructField* newField = nullptr;
    bool searchField = false;

    for (auto it1 = lines->begin(); it1 != lines->end(); it1++) {
        auto line = *it1;
        newField = nullptr;
        for (auto it2 = line->token.begin(); it2 != line->token.end(); it2++) {
            if (searchField) {
                if (it2->first == TokenType::ScopeEnd) {
                    it2->first = TokenType::Delete;
                    return true;
                } else {
                    if (newField) {
                        newField->token.push_back(std::make_pair(it2->first, it2->second));
                        it2->first = TokenType::Delete;
                    } else {
                        for (auto field : newStruct->fields) {
                            if (field->name == it2->second) {
                                line->error = true;
                                line->errmsg = "Duplicate field name `" + it2->second + "` in struct `" + newStruct->name + "`";
                                return false;
                            }
                        }
                        newField = new StructField(line, it2->second);
                        newStruct->fields.push_back(newField);
                        it2->first = TokenType::Delete;
                    }
                }
            } else if (TokenType::None == expect) {
                // searching... (Struct が見つかるまで探索を続ける状態)
                if (it2->first == TokenType::Struct) {
                    newStruct = nullptr;
                    expect = TokenType::Other;
                    it2->first = TokenType::Delete;
                }
            } else {
                if (it2->first != expect) {
                    line->error = true;
                    line->errmsg = "Incorrect syntax for struct: " + it2->second;
                    return false;
                }
                switch (expect) {
                    case TokenType::Other:
                        if (structTable.end() != structTable.find(it2->second)) {
                            line->error = true;
                            line->errmsg = "Duplicate structure name: " + it2->second;
                            return false;
                        }
                        addNameTable(it2->second, line);
                        newStruct = new Struct(line, it2->second);
                        structTable[it2->second] = newStruct;
                        expect = TokenType::Numeric;
                        break;
                    case TokenType::Numeric:
                        newStruct->start = atoi(it2->second.c_str());
                        expect = TokenType::ScopeBegin;
                        break;
                    case TokenType::ScopeBegin:
                        searchField = true;
                        break;
                }
                it2->first = TokenType::Delete;
            }
        }
    }

    return false;
}

bool struct_check_size()
{
    bool needRetry = false;
    for (auto s = structTable.begin(); s != structTable.end(); s++) {
        int sizeOfStruct = 0;
        int startAddress = s->second->start;
        bool skip = false;
        for (auto f = s->second->fields.begin(); f != s->second->fields.end(); f++) {
            auto field = *f;
            if (field->token.size() != 2) {
                field->line->error = true;
                field->line->errmsg = "Invalid field " + field->name + " in structure " + s->first;
                continue;
            }
            if (TokenType::Numeric != field->token[1].first) {
                field->line->error = true;
                field->line->errmsg = "Specify non-numeric number of field " + field->name + " in structure " + s->first + ": " + field->token[1].second;
                continue;
            }
            if (field->token[0].second == "DS.B") {
                field->size = 1;
            } else if (field->token[0].second == "DS.W") {
                field->size = 2;
            } else {
                auto ss = structTable.find(field->token[0].second);
                if (ss == structTable.end()) {
                    field->line->error = true;
                    field->line->errmsg = "Unknown structure name " + field->token[0].second + " specified in field " + field->name + " of structure " + s->first;
                    continue;
                }
                if (0 == ss->second->size) {
                    // 構造体サイズが確定していないのでリトライを要求してスキップ
                    needRetry = true;
                    skip = true;
                    continue;
                }
                field->size = ss->second->size;
            }
            field->count = atoi(field->token[1].second.c_str());
            field->address = startAddress;
            startAddress += field->size * field->count;
            sizeOfStruct += field->size * field->count;
        }
        if (!skip) {
            s->second->size = sizeOfStruct;
        }
    }
    return needRetry;
}
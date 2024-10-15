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

void parse_struct_name(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->first == TokenType::Other) {
            // A.B (ドットあり 2 トークン) または A (ドットなし) ならチェック
            auto token = it->second;
            auto tokens = split_token(token, '.');
            if (1 == tokens.size()) {
                // 1 トークンの場合構造体名であればスタートアドレスに置換
                auto str = structTable.find(tokens[0]);
                if (str != structTable.end()) {
                    it->first = TokenType::StructName;
                } else {
                    // 構造体ではないので無視
                }
            } else if (2 == tokens.size()) {
                // 2 トークンの場合構造体名のフィールド名に該当するアドレスに置換
                auto str = structTable.find(tokens[0]);
                if (str != structTable.end()) {
                    bool found = false;
                    for (auto field : str->second->fields) {
                        if (field->name == tokens[1]) {
                            it->first = TokenType::StructName;
                            found = true;
                            break;
                        }
                    }
                    // フィールド名が見つからなかった場合はエラー
                    if (!found) {
                        line->error = true;
                        line->errmsg = "Unknown field name in structure " + tokens[0] + ": " + tokens[1];
                    }
                } else {
                    // 構造体ではないので無視
                }
            } else {
                // 構造体ではないので無視
            }
        }
    }
}

void replace_struct(LineData* line)
{
    for (auto it = line->token.begin(); it != line->token.end(); it++) {
        if (it->first == TokenType::StructName) {
            it->first = TokenType::Numeric;
            auto token = it->second;
            auto tokens = split_token(token, '.');
            auto str = structTable.find(tokens[0]);
            if (tokens.size() == 1) {
                it->second = std::to_string(str->second->start);
            } else {
                for (auto field : str->second->fields) {
                    if (field->name == tokens[1]) {
                        it->second = std::to_string(field->address);
                    }
                }
            }
        }
    }
}

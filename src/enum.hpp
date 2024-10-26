/**
 * Z80 Assembler for VGS-Zero
 * Copyright (c) 2024, Yoji Suzuki.
 * License under GPLv3: https://github.com/suzukiplan/vgsasm/blob/master/LICENSE.txt
 */
#pragma once
#include "common.h"
#include "numeric.hpp"

// enum を解析して defineTable へ展開する
void enum_extract(std::vector<LineData*>* lines)
{
    for (auto it = lines->begin(); it != lines->end(); it++) {
        auto line = *it;
        if (line->token.empty() || line->token[0].first != TokenType::Other || line->token[0].second != "ENUM") {
            continue;
        }
        line->token[0].first = TokenType::Delete;

        // enum 名を取得して名前空間に登録
        auto name = line->token.begin() + 1;
        if (name == line->token.end()) {
            line->error = true;
            line->errmsg = "No enum name specified.";
            continue;
        }
        if (name->first != TokenType::Other) {
            line->error = true;
            line->errmsg = "Invalid enum name: " + name->second;
            continue;
        }
        addNameTable(name->second, line);
        defineTable[name->second + "."].push_back(std::make_pair(TokenType::None, ""));
        name->first = TokenType::Delete;
        if (line->error) {
            continue;
        }

        // { を探索
        auto begin = name + 1;
        if (begin == line->token.end()) {
            for (++it; it != lines->end(); it++) {
                line = *it;
                if (line->token.empty()) {
                    continue;
                }
                begin = line->token.begin();
                break;
            }
        }
        if (begin->first != TokenType::ScopeBegin) {
            line->error = true;
            line->errmsg = "The starting scope of enum is not defined: " + begin->second;
            continue;
        }
        begin->first = TokenType::Delete;

        // { の後は改行しなければ NG とする
        if (begin + 1 != line->token.end()) {
            line->error = true;
            line->errmsg = "Unexpected symbol: " + (begin + 1)->second;
            continue;
        }
        it++;
        int number = 0;
        bool closed = false;
        for (; it != lines->end(); it++) {
            line = *it;
            if (line->token.empty()) {
                continue;
            }

            // スコープエンドを検出したらチェック終了
            if (line->token[0].first == TokenType::ScopeEnd) {
                if (1 < line->token.size()) {
                    line->error = true;
                    line->errmsg = "Illegal enum definition format.";
                } else {
                    closed = true;
                    line->token[0].first = TokenType::Delete;
                }
                break;
            }

            // フィールド or フィールド = 数値以外はNG
            if (line->token.size() != 1 && line->token.size() != 3) {
                line->error = true;
                line->errmsg = "Illegal enum definition format.";
                continue;
            }

            // 3 トークンの場合の処理を実行
            if (line->token.size() == 3) {
                if (line->token[1].first != TokenType::Equal) {
                    line->error = true;
                    line->errmsg = "Illegal enum definition format.";
                    continue;
                }
                parse_numeric(line);
                if (line->error) {
                    continue;
                }
                if (line->token[2].first != TokenType::Numeric) {
                    line->error = true;
                    line->errmsg = "Illegal enum definition format.";
                    continue;
                }
                number = atoi(line->token[2].second.c_str());
                line->token[0].first = TokenType::Delete;
                line->token[1].first = TokenType::Delete;
                line->token[2].first = TokenType::Delete;
            } else {
                line->token[0].first = TokenType::Delete;
            }
            auto field = name->second + "." + line->token[0].second;
            addNameTable(field, line);
            defineTable[field].push_back(std::make_pair(TokenType::Numeric, std::to_string(number++)));
        }

        if (closed) {
            it = lines->begin();
        }
    }
}

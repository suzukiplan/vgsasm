#pragma once
#include "common.hpp"
#include "file.hpp"

void evaluate_formulas(LineData* line)
{
    std::vector<std::pair<TokenType, std::string>>::iterator prev;
    std::vector<std::pair<TokenType, std::string>>::iterator next;
    bool calc;

    // 掛け算と割り算を計算
    calc = true;
    while (calc) {
        calc = false;
        prev = line->token.end();
        for (auto it = line->token.begin(); it != line->token.end(); it++) {
            if (it->first == TokenType::Mul || it->first == TokenType::Div) {
                // 直前のトークンが　Numeric 型かチェック
                if (line->token.end() == prev || prev->first != TokenType::Numeric) {
                    line->error = true;
                    line->errmsg = "Illegal expression with no specification of the number of operations to be performed.";
                    puts(prev->second.c_str());
                    return;
                }
                // 次のトークンが　Numeric 型かチェック
                next = it + 1;
                if (next == line->token.end() || next->first != TokenType::Numeric) {
                    line->error = true;
                    line->errmsg = "Illegal expression with no specification of the number of operations to be performed.";
                    return;
                }
                // 計算を実行
                // printf("calc: %s %s %s\n", prev->second.c_str(), it->second.c_str(), next->second.c_str());
                int result = atoi(prev->second.c_str());
                if (it->first == TokenType::Mul) {
                    result *= atoi(next->second.c_str());
                } else {
                    int value = atoi(next->second.c_str());
                    if (0 == value) {
                        line->error = true;
                        line->errmsg = "Division by zero.";
                        return;
                    }
                    result /= value;
                }
                prev->second = std::to_string(result); // prev を演算結果に書き換え
                line->token.erase(next);               // 掛けた or 割った 数は削除
                line->token.erase(it);                 // * or / は削除
                calc = true;                           // 演算を実行したので再度評価を実施
                break;
            }
            prev = it;
        }
    }

    // 足し算と引き算を評価
    calc = true;
    while (calc) {
        calc = false;
        prev = line->token.end();
        for (auto it = line->token.begin(); it != line->token.end(); it++) {
            if (it->first == TokenType::Plus || it->first == TokenType::Minus) {
                // 直前のトークンが　Numeric 型かチェック
                if (line->token.end() == prev || prev->first != TokenType::Numeric) {
                    // 直前のトークンが Operand の場合は無視（IX+dなどに対応するため）
                    if (line->token.end() != prev && prev->first == TokenType::Operand) {
                        continue;
                    }
                    line->error = true;
                    line->errmsg = "Illegal expression with no specification of the number of operations to be performed.";
                    puts(prev->second.c_str());
                    return;
                }
                // 次のトークンが　Numeric 型かチェック
                next = it + 1;
                if (next == line->token.end() || next->first != TokenType::Numeric) {
                    line->error = true;
                    line->errmsg = "Illegal expression with no specification of the number of operations to be performed.";
                    return;
                }
                // 計算を実行
                // printf("calc: %s %s %s\n", prev->second.c_str(), it->second.c_str(), next->second.c_str());
                int result = atoi(prev->second.c_str());
                if (it->first == TokenType::Plus) {
                    result += atoi(next->second.c_str());
                } else {
                    result -= atoi(next->second.c_str());
                }
                prev->second = std::to_string(result); // prev を演算結果に書き換え
                line->token.erase(next);               // 足した or引いた 数は削除
                line->token.erase(it);                 // * or / は削除
                calc = true;                           // 演算を実行したので再度評価を実施
                break;
            }
            prev = it;
        }
    }
}

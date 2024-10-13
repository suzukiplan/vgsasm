#pragma once
#include "common.hpp"

static std::vector<std::string> includeFiles;

class LineData
{
  public:
    bool error;
    std::string errmsg;
    std::string path;
    int lineNumber;
    std::string text;
    std::vector<std::pair<TokenType, std::string>> token;

    LineData(std::string text) { LineData(nullptr, 0, text); }

    LineData(const char* path, int lineNumber, std::string text)
    {
        this->path = path;
        this->lineNumber = lineNumber;
        this->text = text;
        char formed[4096];
        memset(formed, 0, sizeof(formed));

        if (sizeof(formed) <= this->text.length()) {
            // 1行4096byte以上なのでエラー扱い
            this->error = true;
            this->errmsg = "One line is 4096 bytes or more.";
        } else {
            // 整形テキストを作成
            this->error = false;
            this->errmsg = "";
            strcpy(formed, this->text.c_str());

            // 行末が CR なら潰しておく
            auto len = strlen(formed);
            if (0 < len && formed[len - 1] == '\r') {
                formed[len - 1] = 0;
            }

            // 文字列リテラルを一時的に　0x01 に置換
            std::vector<std::string> slets;
            char* cp = formed;
            int ptr = 0;
            for (; cp[ptr]; ptr++) {
                if ('\"' == cp[ptr]) {
                    ptr++;
                    char* ed = &cp[ptr];
                    while (*ed) {
                        if (*ed == '\"') {
                            break;
                        } else if (*ed == '\\') {
                            ed++;
                            if (0 == *ed) {
                                break;
                            }
                        }
                        ed++;
                    }
                    if (!*ed) {
                        this->error = true;
                        this->errmsg = "String literals are not closed with double quotes.";
                    } else {
                        ed--;
                        char slet[4096];
                        memset(slet, 0, sizeof(slet));
                        int len = (int)(ed - (cp + ptr)) + 1;
                        memcpy(slet, cp + ptr, len);
                        slets.push_back(slet);
                        for (int i = 0; i < len; i++) {
                            cp[ptr++] = 0x20;
                        }
                        ptr++;
                    }
                }
            }

            // コメント削除
            cp = strchr(formed, ';');
            if (cp) {
                *cp = 0;
            }
            cp = strstr(formed, "//");
            if (cp) {
                *cp = 0;
            }

            // 小文字は大文字、TABは空白に変換
            for (cp = formed; *cp; cp++) {
                if (islower(*cp)) {
                    *cp = toupper(*cp);
                }
                if ('\t' == *cp) {
                    *cp = ' ';
                }
            }

            // 前後の空白をトリム
            trimstring(formed);

            // トークン分割
            cp = formed;
            char* ed;
            bool parseEnd = false;
            int sletIndex = 0;
            while (!parseEnd && !this->error) {
                switch (*cp) {
                    case '\0':
                        parseEnd = true;
                        break;
                    case ' ':
                        cp++;
                        break;
                    case ',':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Split, ","));
                        break;
                    case '+':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Plus, "+"));
                        break;
                    case '-':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Minus, "-"));
                        break;
                    case '/':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Div, "/"));
                        break;
                    case '*':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Mul, "*"));
                        break;
                    case '[':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::ArrayBegin, "["));
                        break;
                    case ']':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::ArrayEnd, "]"));
                        break;
                    case '(':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::BracketBegin, "("));
                        break;
                    case ')':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::BracketEnd, ")"));
                        break;
                    case '{':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::ScopeBegin, "{"));
                        break;
                    case '}':
                        cp++;
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::ScopeEnd, "}"));
                        break;
                    case '\"': {
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::String, slets[sletIndex++].c_str()));
                        cp = strchr(cp + 1, '\"') + 1;
                        break;
                    }
                    default: {
                        ed = cp + 1;
                        while (*ed) {
                            if (' ' == *ed ||
                                '[' == *ed ||
                                ']' == *ed ||
                                '(' == *ed ||
                                ')' == *ed ||
                                '{' == *ed ||
                                '}' == *ed ||
                                '\"' == *ed ||
                                '\'' == *ed ||
                                '+' == *ed ||
                                '-' == *ed ||
                                '*' == *ed ||
                                '/' == *ed ||
                                ',' == *ed) {
                                break;
                            }
                            ed++;
                        }
                        if (*ed) {
                            char work[sizeof(formed)];
                            memset(work, 0, sizeof(work));
                            memcpy(work, cp, ed - cp);
                            this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Other, work));
                            cp = ed;
                            while (' ' == *cp) {
                                cp++;
                            }
                        } else {
                            this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Other, cp));
                            parseEnd = true;
                        }
                    }
                }
            }
        }
    }
};

std::vector<LineData*> readFile(const char* filePath)
{
    int lineNumber = 0;
    std::ifstream ifs(filePath, std::ios::binary);
    ifs.seekg(0, std::ios::end);
    auto sz = ifs.tellg();
    ifs.seekg(0, std::ios::beg);
    std::vector<char> buf(sz);
    ifs.read(buf.data(), sz);
    auto str = std::string(buf.data(), sz);
    int first = 0;
    int last = str.find_first_of('\n');
    std::vector<LineData*> result;
    while (first < str.size()) {
        std::string subStr(str, first, last - first);
        auto line = new LineData(filePath, ++lineNumber, subStr);

        // #include は他のプリプロセッサよりも優先して先に展開
        if (2 == line->token.size() && line->token[0].second == "#INCLUDE" && TokenType::String == line->token[1].first) {
            auto path = line->token[1].second.c_str();
            bool alreadyIncluded = false;
            for (auto includeFile : includeFiles) {
                if (0 == strcmp(includeFile.c_str(), path)) {
                    alreadyIncluded = true;
                }
            }
            if (!alreadyIncluded) {
                includeFiles.push_back(path);
                char basePath[4096];
                if ('/' != path[0]) {
                    strcpy(basePath, line->path.c_str());
                    char* cp = strrchr(basePath, '/');
                    if (cp) {
                        cp++;
                        *cp = 0;
                    }
                    strcat(basePath, path);
                    path = basePath;
                }
                for (auto includeLine : readFile(path)) {
                    result.push_back(includeLine);
                }
            }
        } else {
            if (line->token.empty()) {
                delete line;
            } else {
                result.push_back(line);
            }
        }

        first = last + 1;
        last = str.find_first_of('\n', first);
        if (last == std::string::npos) {
            last = str.size();
        }
    }
    return result;
}

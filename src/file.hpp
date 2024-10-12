#include "common.hpp"

enum class TokenType {
    String,  // 文字列 "str" or 'str'
    Address, // アドレス (xxx)
    Other    // その他
};

class LineData
{
  public:
    bool error;
    std::string errmsg;
    std::string path;
    int lineNumber;
    std::string text;
    std::vector<std::pair<TokenType, std::string>> token;

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
                    case ',':
                        cp++;
                        break;
                    case '\"': {
                        this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::String, slets[sletIndex++].c_str()));
                        cp = strchr(cp + 1, '\"') + 1;
                        break;
                    }
                    case '(': {
                        cp++;
                        ed = cp;
                        int nest = 1;
                        while (0 < nest && *ed) {
                            switch (*ed) {
                                case ')': nest--; break;
                                case '(': nest++; break;
                                case '"': {
                                    this->error = true;
                                    this->errmsg = "String literals cannot be written in parentheses.";
                                    break;
                                }
                            }
                            ed++;
                        }
                        if (0 == *ed) {
                            // カッコが閉じられていない
                            this->error = true;
                            this->errmsg = "Parentheses are not closed.";
                        } else {
                            ed--;
                            char work[sizeof(formed)];
                            memset(work, 0, sizeof(work));
                            memcpy(work, cp, ed - cp);
                            this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Address, work));
                            cp = ed + 1;
                        }
                        break;
                    }
                    default: {
                        ed = cp + 1;
                        while (*ed) {
                            if (' ' == *ed || '(' == *ed || '\"' == *ed || '\'' == *ed || ',' == *ed) {
                                break;
                            }
                            ed++;
                        }
                        if (*ed) {
                            char work[sizeof(formed)];
                            memset(work, 0, sizeof(work));
                            memcpy(work, cp, ed - cp);
                            this->token.push_back(std::make_pair<TokenType, std::string>(TokenType::Other, work));
                            cp = ed + 1;
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
        result.push_back(line);
        first = last + 1;
        last = str.find_first_of('\n', first);
        if (last == std::string::npos) {
            last = str.size();
        }
    }
    return result;
}

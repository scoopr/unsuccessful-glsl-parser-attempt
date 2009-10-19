#include "Token.h"


std::ostream& operator<<(std::ostream& os, const Token& token) {
    os << token.id << "[" << token.string << "]@(" << token.file << ":" << token.line << ":" << token.column << ")";
    return os;
}

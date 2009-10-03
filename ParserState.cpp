#include "ParserState.h"

#include "Node.h"


IdentifierNode* ParserState::identifier(Token* token) {
    return new IdentifierNode(token);
}

#include "ParserState.h"

#include "Node.h"


Node* ParserState::identifier(Token* token) {
    return s(NODE_IDENTIFIER, token);
}

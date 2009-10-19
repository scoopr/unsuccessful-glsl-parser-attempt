#ifndef GLSL_PARSERSTATE_H
#define GLSL_PARSERSTATE_H

#include <cstdlib>

#include "Node.h"

class Node;
class Token;
class IdentifierNode;

class ParserState {
public:
    ParserState() : syntax_error(false), result(NULL) {}
    
    bool syntax_error;
    Node* result;
    
    IdentifierNode* identifier(Token* token);
    
};

#endif

#ifndef GLSL_PARSERSTATE_H
#define GLSL_PARSERSTATE_H

#include <cstdlib>

class Node;

class ParserState {
public:
    ParserState() : syntax_error(false), result(NULL) {}
    
    bool syntax_error;
    Node* result;
};

#endif

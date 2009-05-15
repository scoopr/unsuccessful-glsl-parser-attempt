#ifndef LANG_LANG_H
#define LANG_LANG_H

#include "glsl_parser.h"
#include "Token.h"
#include "Node.h"

void *glslparserAlloc(void *(*mallocProc)(size_t));
void glslparserFree(void *p, void (*freeProc)(void*));

void glslparser(
  void *yyp,                   /* The parser */
  int yymajor,                 /* The major token code number */
  Token* token       /* The value for the token */
                 /* Optional %extra_argument parameter */
  );


class Node;

Node* glsl_parse(void* parser, char *p, char *pe, const std::string& filename);


#endif


#ifndef LANG_LANG_H
#define LANG_LANG_H

#include "lang_parser.h"

#ifdef __cplusplus 
extern "C" { 
#endif

    void *langparserAlloc(void *(*mallocProc)(size_t));
    void langparserFree(void *p, void (*freeProc)(void*));

    void langparser(
      void *yyp,                   /* The parser */
      int yymajor,                 /* The major token code number */
      int yyminor       /* The value for the token */
                     /* Optional %extra_argument parameter */
      );

#ifdef __cplusplus
}
#endif

void tokenize(void* parser, char* p, char *pe);




#endif


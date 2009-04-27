%token_type {int}

%name langparser

%left PLUS MINUS.
%left DIVIDE TIMES.

%include {
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    
    #include "lang.h"





}

program ::= expr(A).   { printf("Result=%%d\n",  A); }

expr(A) ::= expr(B) MINUS  expr(C).   { A = B - C; }
expr(A) ::= expr(B) PLUS  expr(C).   { A = B + C; }
expr(A) ::= expr(B) TIMES  expr(C).   { A = B * C; }
expr(A) ::= expr(B) DIVIDE expr(C).  {

    if(C != 0) {
        A = B / C;
    } else {
        printf("div by zero\n");
    }
}

expr(A) ::= INTEGER(B). { A = B; }





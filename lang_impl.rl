
#include <iostream>
#include "lang.h"


%%{


    machine lang;


    action done {
        std::cout << "Done." << std::endl;
    }



    action begin_token {
//        printf("begin token .. at %p\n", p);
        begin_token = p;
    }

    action INTEGER {
        if(begin_token) {
            char str[p-begin_token+1];
            memset(str,0,p-begin_token+1);
            strncpy(str, begin_token, p-begin_token);

//            printf("integer token %s.. at %p\n",str, p);
            
            token(parser, INTEGER, strtol(str, NULL, 0));
            begin_token = NULL;        
        }
    }

    action OP_PLUS {
        token(parser, PLUS);
    }

    action OP_MINUS {
        token(parser, MINUS);
    }
    action OP_TIMES {
        token(parser, TIMES);
    }
    action OP_DIVIDE {
        token(parser, DIVIDE);
    }
    
    action LPAREN {
        token(parser, LPAREN);
    }

    action RPAREN {
        token(parser, RPAREN);
    }



    include lang "lang.rl";





}%%


%% write data;


void token(void *parser, int token) {
    printf("Token %d\n", token);
    langparser(parser, token, 0);
}

void token(void *parser, int token, int value) {
    printf("Token %d (%d)\n", token, value);
    langparser(parser, token, value);
}


void tokenize(void *parser, char *p, char *pe) {

    char *eof = pe;
    int cs;
    
    char *begin_token = NULL;

    %% write init;
    %% write exec;

    langparser(parser, 0, 0);

}



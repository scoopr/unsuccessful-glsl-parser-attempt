
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
            
            langparser(parser, INTEGER, strtol(str, NULL, 0));
            begin_token = NULL;        
        }
    }

    action OP_PLUS {
        langparser(parser, PLUS, 0);
    }

    action OP_MINUS {
        langparser(parser, MINUS, 0);
    }
    action OP_TIMES {
        langparser(parser, TIMES, 0);
    }
    action OP_DIVIDE {
        langparser(parser, DIVIDE, 0);
    }
    



    include lang "lang.rl";





}%%


%% write data;





void tokenize(void *parser, char *p, char *pe) {

    char *eof = pe;
    int cs;
    
    char *begin_token = NULL;

    %% write init;
    %% write exec;

    langparser(parser, 0, 0);

}




#include <iostream>

#include "lang.h"





void run(char*p, char *pe) {

    void* plangparser = langparserAlloc (malloc);

    tokenize(plangparser, p, pe);

    langparserFree(plangparser, free );

}


int main( int argc, char **argv ) 
{ 

    if ( argc > 1 ) { 

        
        char *p = argv[1]; 
        char *pe = p + strlen( p );
        
        run(p, pe);
    } 



    return 0; 
} 

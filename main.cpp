
#include <iostream>
#include <stdexcept>
#include <cstdlib>
#include <cstdio>

#include "libglsl/glsl.h"

#include <cstring>





int main(int argc, char **argv) {

    int retval = EXIT_SUCCESS;

    if ( argc > 1 ) { 

        Node* tree = NULL;
        
        if(argc>2 && strcmp(argv[1], "-e") == 0 ) {
            tree = glsl_parseString(argv[2]);
        } else {
            tree = glsl_parseFile(argv[1]);
        }


        if(tree) {
            tree->dumpTree(std::cout);
        } else { 
            std::cerr << "No tree?" << std::endl; 
            retval = EXIT_FAILURE;
        }
        
        delete tree;


    } 


    return retval;
}


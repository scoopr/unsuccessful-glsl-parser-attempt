
#include <iostream>

#include "glsl.h"







int main(int argc, char **argv) {

    if ( argc > 1 ) { 

        FILE *f = fopen(argv[1], "r");

        fseek(f, 0, SEEK_END);

        off_t size = ftello(f);
        fseek(f, 0, SEEK_SET);


        char *p = static_cast<char*>(malloc(size));
        fread(p,size,1,f);
        char *pe = p + size;
        fclose(f);

        void* pglslparser = glslparserAlloc (malloc);

        Node *tree = glsl_parse(pglslparser, p, pe, argv[1]);

        if(tree) {
            tree->dumpTree(std::cout);
        } else { std::cout << "No tree?" << std::endl; }

        glslparserFree(pglslparser, free );

        free(p);


    } 


    return 0;
}


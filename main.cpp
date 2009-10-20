
#include <iostream>
#include <stdexcept>
#include <cstdlib>
#include <cstdio>

#include "libglsl/glsl.h"

#include <cstring>



class DumpVisitor : NodeVisitor {
public:
    
    std::ostream& os;
    int depth;
    
    DumpVisitor(std::ostream& os_) : os(os_), depth(0) {
        
    }

    void indent(int d = -1) {
        if( d == -1 ) d = depth;
        for(int i = 0; i < d; ++i) { os << " "; }    
    }
    
    void visit(Node *n) {


        if(n == NULL) {
            indent(depth+1);
            os << "(null node)" << std::endl;
            return;
        }

        indent();
        std::string t = n->getNodeType();
        os << t << " " ;
        if(n->terminal) {
            os << "[" << n->terminal->string << "] ";
        }

        if( n->children.size() > 0 ) {
            os << "{" << std::endl;
            depth++;
            n->traverse(*this);
            depth--;
            indent();
            os << "}" << std::endl;
        } else {
            os << std::endl;
        }
        

    }

};


class CodeDumper : public NodeVisitor {
public:
    std::ostream& os;
    CodeDumper(std::ostream& os_) : os(os_) {} 
    void visit(Node* n) {
        
        FunctionDeclarationNode* fn = node_cast<FunctionDeclarationNode>(n);
        
        if(fn) {
            os << fn->getReturnType() << " " << fn->getName() << "()";
            os << "{";
            fn->getBody()->traverse(*this);
            os << "}";
        } else {


            if(n->terminal) {
                os << n->terminal->string;
            }
            
            n->traverse(*this);
        }
    }    
};


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
            std::cout << "AST:" << std::endl;
            DumpVisitor d(std::cout);
            d.visit(tree);
            std::cout << "Code:" << std::endl;
            CodeDumper cd(std::cout);
            cd.visit(tree);
        } else { 
            std::cerr << "No tree?" << std::endl; 
            retval = EXIT_FAILURE;
        }
        
        delete tree;


    } 


    return retval;
}


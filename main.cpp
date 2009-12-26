
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

//        indent();
        std::string t = n->getNodeType();
        os << "s(" << t ;
        if(n->terminal) {
            os << ", token(\"" << n->terminal->string << "\")";
        }

        if( n->children.size() > 0 ) {
            depth+=2;
//            n->traverse(*this);
            
            std::vector<Node*>::iterator i = n->children.begin(), itEnd = n->children.end();

            for(; i != itEnd; ++i)
            {
                os << ", \n";
                indent();
                visit(*i);
            }

            depth-=2;
            os << "\n";
            indent();
            os << ")";
        } else {
            os << ")";
        }
        

        if(depth==0) os << ";\n";
    }

};


class CodeDumper : public NodeVisitor {
public:
    std::ostream& os;
    CodeDumper(std::ostream& os_) : os(os_) {} 
    void visit(Node* n) {
        if(!n) { std::cerr << "Warning: NULL!" << std::endl; return; }
        FunctionDeclarationNode* fn = node_cast<FunctionDeclarationNode>(n);
        
        if(fn) {
            os << fn->getReturnType() << " " << fn->getName() << "()";
            os << "{";
/*            if(fn->getBody()) {
                fn->getBody()->traverse(*this);
            } else { std::cerr << "Warning: NULL FunctionDeclarationNode" << std::endl; }
            os << "}";*/
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
            std::cout << std::endl;
        } else { 
            std::cerr << "No tree?" << std::endl; 
            retval = EXIT_FAILURE;
        }
        
        delete tree;


    } 


    return retval;
}


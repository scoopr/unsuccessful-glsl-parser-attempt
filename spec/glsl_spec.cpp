
#include "spec_helper.h"


std::ostream& operator<<(std::ostream& os, const Node& n) {
    os << n.getNodeType();
    if(n.terminal) os << "[" << n.terminal->string << "]";
    
    os << "( ";
    std::vector<Node*>::const_iterator i = n.children.begin(), itEnd = n.children.end();
    for(; i != itEnd; ++i)
    {
        os << *i << ", ";
        
    }
    os << ")";
    return os;    
}


describe(glsl_ast, "nodes") {
    
    it("should have operator==") {
        Node *n1 = s(NODE_TYPE, token("int"));
        Node *n2 = s(NODE_TYPE, token("int"));
        should_equal(*n1, *n2);
    }

    it("operator== should respect AnyNode") {
        Node *n1 = s(NODE_TYPE, token("int"));
        Node *n2 = s(NODE_ANY);
        should_equal(*n1, *n2);
        should_equal(*n2, *n1);
        should_equal(*n2, *n2);
    }

    
}

describe(glsl, "function") {
    
    it("should parse empty function") {
        should_equal_ast("void f(){}", 
                         s(NODE_FUNCTIONDECLARATION,
                           s(NODE_TYPE, token("void")),
                           s(NODE_IDENTIFIER, token("f")), 
                           any_tree() 
                          )
                        );
    }

    
}


describe(glsl, "variables in function context") {

    it("should parse int declaration") {
        should_equal_function_ast("int a;", 
                             s(NODE_ANY,
                               s(NODE_TYPE, token("int")),
                               s(NODE_IDENTIFIER, token("a"))
                             )
                        );
    }


    it("should parse int declaration with initializer") {
        should_equal_function_ast("int a = 42;", 
                             s(NODE_ANY,
                               s(NODE_TYPE, new Token("int")),
                               s(NODE_IDENTIFIER, new Token("a")),
                               s(NODE_INT, new Token("42"))
                             )
                        );
    }

    
}


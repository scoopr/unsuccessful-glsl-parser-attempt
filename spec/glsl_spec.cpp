
#include "spec_helper.h"

describe(glsl, "function") {
    
    it("should parse empty function") {
        should_equal_ast("void f(){}", 
                         s(NODE_FUNCTIONDECLARATION,
                           s(NODE_TYPE, std::string("void")),
                           s(NODE_IDENTIFIER, std::string("f")), 
                           any() 
                          )
                        );
    }

    it("should parse function with variable declaration") {
        should_equal_ast("void f(){ int a; }", 
                         s(NODE_FUNCTIONDECLARATION,
                           s(NODE_TYPE, std::string("void")),
                           s(NODE_IDENTIFIER, std::string("f")), 
                           s("Node",
                             s("Node",
                               s(NODE_TYPE, std::string("int")),
                               s(NODE_IDENTIFIER, std::string("a"))
                             )) 
                          )
                        );
    }
    
}

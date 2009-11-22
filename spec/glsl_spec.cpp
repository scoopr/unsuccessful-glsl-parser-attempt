
#include "spec_helper.h"

describe(glsl, "function") {
    
    it("should parse empty function") {
        should_equal_ast("void f(){}", 
                         s(NODE_FUNCTIONDECLARATION,
                           s(NODE_TYPE, new Token("void")),
                           s(NODE_IDENTIFIER, new Token("f")), 
                           any_tree() 
                          )
                        );
    }

    
}


describe(glsl, "variables in function context") {

    it("should parse int declaration") {
        should_equal_function_ast("int a;", 
                             s(NODE_ANY,
                               s(NODE_TYPE, new Token("int")),
                               s(NODE_IDENTIFIER, new Token("a"))
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


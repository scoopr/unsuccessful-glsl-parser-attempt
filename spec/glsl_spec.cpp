
#include "spec_helper.h"

describe(glsl, "function") {
    
    it("should parse empty function") {
        should_equal_ast("void f(){}", 
                         s(NODE_FUNCTIONDECLARATION,
                           s(NODE_TYPE, std::string("void")),
                           s(NODE_IDENTIFIER, std::string("f")), 
                           any_tree() 
                          )
                        );
    }

    
}


describe(glsl, "variables in function context") {

    it("should parse int declaration") {
        should_equal_function_ast("int a;", 
                             s(NODE_ANY,
                               s(NODE_TYPE, std::string("int")),
                               s(NODE_IDENTIFIER, std::string("a"))
                             )
                        );
    }


    it("should parse int declaration with initializer") {
        should_equal_function_ast("int a = 42;", 
                             s(NODE_ANY,
                               s(NODE_TYPE, std::string("int")),
                               s(NODE_IDENTIFIER, std::string("a")),
                               s(NODE_INT, std::string("42"))
                             )
                        );
    }

    
}


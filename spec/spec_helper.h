#ifndef GLSL_SPEC_HELPER_H
#define GLSL_SPEC_HELPER_H

#include "spec.h"
#include "../libglsl/glsl.h"
#include <cstdio>



Node* any_tree() { AnyNode *r = new AnyNode; r->recursive = true; return r; }


#define should_equal_ast(n,cn) should_equal_ast_(this, n, cn, __FILE__, __LINE__)
#define should_equal_function_ast(n,cn) should_equal_function_ast_(this, n, cn, __FILE__, __LINE__)


static void should_equal_ast__rec(specific::SpecBase *sb, Node* n, Node *cn, const char *file, int line, int depth=0) {

    sb->should_equal_template( *n, *cn, file, line);

    std::vector<Node*>::iterator i = n->children.begin(), iEnd = n->children.end();
    std::vector<Node*>::iterator ci = cn->children.begin(), ciEnd = cn->children.end();
    
    for(; i != iEnd && ci != ciEnd; ++i, ++ci) {
        should_equal_ast__rec(sb, *i, *ci, file, line,depth+1);
    }
    
    
}
static void should_equal_ast_(specific::SpecBase *sb, const char* str, Node *cn, const char *file, int line) {
    Node * n= glsl_parseString(str);
    should_equal_ast__rec(sb,n, cn,file,line);
    delete n;
    delete cn;
}

static void should_equal_function_ast_(specific::SpecBase *sb, const char* str, Node *cn, const char *file, int line) {

    Node *cnn = s(NODE_TRANSLATIONUNIT,
                 s(NODE_FUNCTIONDECLARATION,
                   s(NODE_FUNCTIONHEADER,
                     s(NODE_TYPE, token("void")),
                     s(NODE_IDENTIFIER, token("f"))
                    ),
                   s(NODE_ANY, cn)
                  )
                 );

    std::string fn = std::string("void f() {") + str + "}";
    should_equal_ast_(sb, fn.c_str(), cnn, file, line);
    
}


#endif

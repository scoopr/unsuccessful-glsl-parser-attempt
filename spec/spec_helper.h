#ifndef GLSL_SPEC_HELPER_H
#define GLSL_SPEC_HELPER_H

#include "spec.h"
#include "../libglsl/glsl.h"

struct CheckNode {
    CheckNode(NodeType t) : type(t), any(false) {}
    CheckNode(NodeType t, std::string term) : type(t), any(false), terminal(term) {}
    NodeType type;
    bool any;
    std::string terminal;
    std::vector<CheckNode*> children;
};

CheckNode* any() { CheckNode *r = new CheckNode(NULL); r->any = true; return r; }
CheckNode* s( NodeType t ) { return new CheckNode(t); }
CheckNode* s( NodeType t, std::string term ) { return new CheckNode(t,term); }
CheckNode* s( NodeType t, CheckNode* n ) { CheckNode *r =  new CheckNode(t); r->children.push_back(n); return r; }
CheckNode* s( NodeType t, CheckNode* n, CheckNode* n2 ) { CheckNode *r =  new CheckNode(t); r->children.push_back(n); r->children.push_back(n2); return r; }
CheckNode* s( NodeType t, CheckNode* n, CheckNode* n2, CheckNode* n3 ) { CheckNode *r =  new CheckNode(t); r->children.push_back(n); r->children.push_back(n2); r->children.push_back(n3); return r; }



#define should_equal_ast(n,cn) should_equal_ast_(this, n, cn, __FILE__, __LINE__)


static void should_equal_ast__rec(specific::SpecBase *sb, Node* n, CheckNode *cn, const char *file, int line, int depth=0) {
    
    if(cn->any) { return; }
    
    char tmp[256];
    snprintf(tmp,255,"differing vector size at depth %d on node %s", depth, n->getNodeType());
    sb->should_equal_template( n->getNodeType(), cn->type, file, line);
    sb->should_equal_template( n->children.size(), cn->children.size(), file, line, tmp);

    if(cn->terminal.size() > 0) {
        sb->should_equal_template( n->terminal->string, cn->terminal , file, line);
    }

    std::vector<Node*>::iterator i = n->children.begin(), iEnd = n->children.end();
    std::vector<CheckNode*>::iterator ci = cn->children.begin(), ciEnd = cn->children.end();
    
    for(; i != iEnd && ci != ciEnd; ++i, ++ci) {
        should_equal_ast__rec(sb, *i, *ci, file, line,depth+1);
    }
    
    
}
static void should_equal_ast_(specific::SpecBase *sb, const char* str, CheckNode *cn, const char *file, int line) {
    Node * n= glsl_parseString(str);
    should_equal_ast__rec(sb,n, cn,file,line);
    delete n;
    delete cn;
}


#endif

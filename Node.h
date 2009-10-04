#ifndef LANG_NODE_H
#define LANG_NODE_H

#include <iostream>
#include <vector>
#include <string>

#include "Token.h"

static inline void indent(std::ostream& os, int depth) {
    for(int i = 0; i < depth; ++i) { os << " "; }    
}


class Node {
public:


    Node() : terminal(NULL) {}
    Node(Token* term) : terminal(term) {}
    Node(Node* child1) : terminal(NULL) {
        addChild(child1);
    }
    Node(Node* child1, Node* child2) : terminal(NULL) {
        addChild(child1);
        addChild(child2);
    }
    Node(Node* child1, Node* child2, Node* child3) : terminal(NULL) {
        addChild(child1);
        addChild(child2);
        addChild(child3);
    }

    Node(Node* child1, Node* child2, Node* child3, Node* child4) : terminal(NULL) {
        addChild(child1);
        addChild(child2);
        addChild(child3);
        addChild(child4);
    }
    
    void addChild(Node* c) {
        children.push_back(c);
        if(c) {
        } else {
            std::cerr << "Warning: null child " << std::endl;
        }
    }
        
    virtual ~Node() {
        std::vector<Node*>::iterator i = children.begin(), itEnd = children.end();
        for(; i != itEnd; ++i)
        {
            delete *i;
        }
        children.clear();
    }
    
    
    Token *terminal;

    std::vector<Node*> children;

    virtual std::string getNodeName() const { return "Node"; }
//    virtual const std::string& inspect() const { return ""; }

    std::ostream& dumpTree(std::ostream& os, int depth = 0) {
        indent(os,depth);
        os << getNodeName() << " " ;
        if(terminal) {
            os << "[" << terminal->string << "] ";
        }
        
        std::vector<Node*>::iterator i = children.begin(), itEnd = children.end();
        if( i!= itEnd) {
            os << "{" << std::endl;
            
            for(; i != itEnd; ++i)
            {
                if(*i) {
                    (*i)->dumpTree(os, depth+1);                    
                } else {
                    indent(os,depth+1);
                    os << "(null node)" << std::endl;
                }
            }
            indent(os,depth);
            os << "}" ;
        }
        os << std::endl;
        
        return os;
    }

};


class NotImplementedNode : public Node {
public:
    NotImplementedNode() : Node((Token*)NULL) {}
    std::string getNodeName() const { return "NotImplementedNode"; }
};

class FloatNode : public Node {
public:
    FloatNode(Token* t) : Node(t) {}
    std::string getNodeName() const { return "FloatNode"; }
};

class IntNode : public Node {
public:
    IntNode(Token* t) : Node(t) {}
    std::string getNodeName() const { return "IntNode"; }
};

class IdentifierNode : public Node {
public:
    IdentifierNode(Token* t) : Node(t) {}
    std::string getNodeName() const { return "IdentifierNode"; }
};

class ArrayIndexNode : public Node {
public:
    ArrayIndexNode(Node *ary, Node *index) : Node(ary, index) {
    }
    std::string getNodeName() const { return "ArrayIndexNode"; }
};

class ParameterDeclarationNode : public Node {
public:
    ParameterDeclarationNode(Node *t1, Node *t2) :Node(t1,t2) {
    }
    ParameterDeclarationNode(Node *t1, Node *t2, Node *t3) :Node(t1,t2,t3)  {
    }
    std::string getNodeName() const { return "ParameterDeclarationNode"; }
    
};

class TypeNode : public Node {
public:
    TypeNode(Token* t) : Node(t) {  }
    std::string getNodeName() const { return "TypeNode"; }
};

class MultiplicationNode : public Node {    
public:
    MultiplicationNode(Node* left, Node* right) : Node(left,right) {  }
    std::string getNodeName() const { return "MultiplicationNode"; }
};

class AdditionNode : public Node {    
public:
    AdditionNode(Node* left, Node* right) : Node(left,right) {  }
    std::string getNodeName() const { return "AdditionNode"; }
};

class CallNode : public Node {    
public:
    CallNode(Node* n1, Node* n2) : Node(n1,n2) {  }
    std::string getNodeName() const { return "CallNode"; }
};

class AssignNode : public Node {
public:
    AssignNode(Node* n1, Node* n2, Token *assignop) : Node(n1,n2) { terminal = assignop;  }
    std::string getNodeName() const { return "AssignNode"; }    
};

class SelectionNode : public Node {
public:
    SelectionNode(Node* expr, Node *then, Node *otherwise) : Node(expr,then,otherwise) {}
    SelectionNode(Node* expr, Node *then) : Node(expr,then) {}
    std::string getNodeName() const { return "SelectionNode"; }    
};

class RelationalNode : public Node {
public:
    RelationalNode(Node* n1, Node* n2, Token *relationop) : Node(n1,n2) { terminal = relationop;  }
    std::string getNodeName() const { return "RelationalNode"; }    
};

class FunctionDeclarationNode : public Node {
public:
    FunctionDeclarationNode(Node* n1, Node *n2) : Node(n1,n2) {  }
    std::string getNodeName() const { return "FunctionDeclarationNode"; }
};

class LogicalOpNode : public Node {
public:
    LogicalOpNode(Node *n1, Node *n2, Token *op) : Node(n1,n2) { terminal = op; }
    std::string getNodeName() const { return "LogicalOpNode"; }
};

class EqualityOpNode : public Node {
public:
    EqualityOpNode(Node *n1, Node *n2, Token *op) : Node(n1,n2) { terminal = op; }
    std::string getNodeName() const { return "EqualityOpNode"; }
};

class IterationNode : public Node {
public:
    IterationNode(Node *init, Node *expr, Node *stmt) : Node(init,expr,stmt) {}
    IterationNode(Node *expr, Node *stmt) : Node(expr,stmt) {}
    std::string getNodeName() const { return "IterationNode"; }
};

#endif


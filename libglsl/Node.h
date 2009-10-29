#ifndef LANG_NODE_H
#define LANG_NODE_H

#include <iostream>
#include <vector>
#include <string>

#include "Token.h"


typedef const char* NodeType;

extern NodeType NODE_FLOAT;
extern NodeType NODE_INT;
extern NodeType NODE_IDENTIFIER;
extern NodeType NODE_ARRAYINDEX;
extern NodeType NODE_PARAMETERDECLARATION;
extern NodeType NODE_TYPE;
extern NodeType NODE_MULTIPLICATION;
extern NodeType NODE_ADDITION;
extern NodeType NODE_CALL;
extern NodeType NODE_ASSIGN;
extern NodeType NODE_SELECTION;
extern NodeType NODE_RELATION;
extern NodeType NODE_FUNCTIONDECLARATION;
extern NodeType NODE_LOGICALOP;
extern NodeType NODE_EQUALITYOP;
extern NodeType NODE_ITERATION;




class Node;


class NodeVisitor {
public:
    virtual void visit(Node* n) = 0;
};


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
        
        delete terminal;
    }
    
    
    Token *terminal;

    std::vector<Node*> children;

    virtual NodeType getNodeType() const { return "Node"; }


    void traverse(NodeVisitor& nv) {

        std::vector<Node*>::iterator i = children.begin(), itEnd = children.end();
        
        for(; i != itEnd; ++i)
        {
            nv.visit(*i);
        }
        
    }

};



class NotImplementedNode : public Node {
public:
    NotImplementedNode() : Node((Token*)NULL) {}
    NodeType getNodeType() const { return  "NotImplementedNode" ; }
};

class FloatNode : public Node {
public:
    FloatNode(Token* t) : Node(t) {}
    NodeType getNodeType() const { return NODE_FLOAT; }
};

class IntNode : public Node {
public:
    IntNode(Token* t) : Node(t) {}
    NodeType getNodeType() const { return NODE_INT; }
};

class IdentifierNode : public Node {
public:
    IdentifierNode(Token* t) : Node(t) {}
    NodeType getNodeType() const { return NODE_IDENTIFIER; }
};

class ArrayIndexNode : public Node {
public:
    ArrayIndexNode(Node *ary, Node *index) : Node(ary, index) {
    }
    NodeType getNodeType() const { return  NODE_ARRAYINDEX ; }
};

class ParameterDeclarationNode : public Node {
public:
    ParameterDeclarationNode(Node *t1, Node *t2) :Node(t1,t2) {
    }
    ParameterDeclarationNode(Node *t1, Node *t2, Node *t3) :Node(t1,t2,t3)  {
    }
    NodeType getNodeType() const { return  NODE_PARAMETERDECLARATION ; }
    
};

class TypeNode : public Node {
public:
    TypeNode(Token* t) : Node(t) {  }
    NodeType getNodeType() const { return  NODE_TYPE ; }
};

class MultiplicationNode : public Node {    
public:
    MultiplicationNode(Node* left, Node* right) : Node(left,right) {  }
    NodeType getNodeType() const { return  NODE_MULTIPLICATION ; }
};

class AdditionNode : public Node {    
public:
    AdditionNode(Node* left, Node* right) : Node(left,right) {  }
    NodeType getNodeType() const { return  NODE_ADDITION ; }
};

class CallNode : public Node {    
public:
    CallNode(Node* n1, Node* n2) : Node(n1,n2) {  }
    NodeType getNodeType() const { return  NODE_CALL ; }
};

class AssignNode : public Node {
public:
    AssignNode(Node* n1, Node* n2, Token *assignop) : Node(n1,n2) { terminal = assignop;  }
    NodeType getNodeType() const { return  NODE_ASSIGN ; }    
};

class SelectionNode : public Node {
public:
    SelectionNode(Node* expr, Node *then, Node *otherwise) : Node(expr,then,otherwise) {}
    SelectionNode(Node* expr, Node *then) : Node(expr,then) {}
    NodeType getNodeType() const { return  NODE_SELECTION ; }    
};

class RelationalNode : public Node {
public:
    RelationalNode(Node* n1, Node* n2, Token *relationop) : Node(n1,n2) { terminal = relationop;  }
    NodeType getNodeType() const { return  NODE_RELATION ; }    
};

class FunctionDeclarationNode : public Node {
public:
    FunctionDeclarationNode(Node* n1, Node *n2) : Node(n1,n2) {  }
    NodeType getNodeType() const { return  NODE_FUNCTIONDECLARATION ; }
    const std::string& getReturnType() { return children[0]->terminal->string; }
    const std::string& getName() { return children[1]->terminal->string; }
    Node* getBody() { return children[2]; }
};

class LogicalOpNode : public Node {
public:
    LogicalOpNode(Node *n1, Node *n2, Token *op) : Node(n1,n2) { terminal = op; }
    NodeType getNodeType() const { return  NODE_LOGICALOP ; }
};

class EqualityOpNode : public Node {
public:
    EqualityOpNode(Node *n1, Node *n2, Token *op) : Node(n1,n2) { terminal = op; }
    NodeType getNodeType() const { return  NODE_EQUALITYOP ; }
};

class IterationNode : public Node {
public:
    IterationNode(Node *init, Node *expr, Node *stmt) : Node(init,expr,stmt) {}
    IterationNode(Node *expr, Node *stmt) : Node(expr,stmt) {}
    NodeType getNodeType() const { return  NODE_ITERATION ; }
};



template<class T> NodeType node_type() {
    return  ((T*)NULL ) ->T::getNodeType(); 
}

template<class T> T* node_cast(Node* f) { 
    if( node_type<T>() != f->getNodeType()) return NULL;  
    return reinterpret_cast<T*>(f); 
}


#endif


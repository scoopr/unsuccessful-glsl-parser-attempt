#ifndef LANG_NODE_H
#define LANG_NODE_H


#include <vector>
#include <string>

#include "Token.h"

class Node {
public:


    Node() : terminal(NULL) {}
    Node(Token* term) : terminal(term) {}
    Node(Node* child1) : terminal(NULL) {
        children.push_back(child1);
    }
    Node(Node* child1, Node* child2) : terminal(NULL) {
        children.push_back(child1);
        children.push_back(child2);
    }
    Node(Node* child1, Node* child2, Node* child3) : terminal(NULL) {
        children.push_back(child1);
        children.push_back(child2);
        children.push_back(child3);
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


    std::ostream& dumpTree(std::ostream& os, int depth = 0) {
        for(int i = 0; i < depth; ++i) { os << " "; }
        os << getNodeName() << " " ;
        if(terminal) {
            os << "[" << terminal->string << "] ";
        }
        
        std::vector<Node*>::iterator i = children.begin(), itEnd = children.end();
        if( i!= itEnd) {
            os << "{" << std::endl;
            
            for(; i != itEnd; ++i)
            {
                (*i)->dumpTree(os, depth+1);
            }
            for(int i = 0; i < depth; ++i) { os << " "; }
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

#endif LANG_NODE_H

#include "Node.h"


NodeType NODE_NOTIMPLEMENTED = "NotImplementedNode";
NodeType NODE_ANY = "AnyNode";

NodeType NODE_FLOAT = "FloatNode";
NodeType NODE_INT = "IntNode";
NodeType NODE_IDENTIFIER = "IdentifierNode";
NodeType NODE_ARRAYINDEX = "ArrayIndexNode";
NodeType NODE_PARAMETERDECLARATION = "ParameterDeclarationNode";
NodeType NODE_TYPE = "TypeNode";
NodeType NODE_MULTIPLICATION = "MultiplicationNode";
NodeType NODE_ADDITION = "AdditionNode";
NodeType NODE_CALL = "CallNode";
NodeType NODE_ASSIGN = "AssignNode";
NodeType NODE_SELECTION = "SelectionNode";
NodeType NODE_RELATION = "RelationalNode";
NodeType NODE_FUNCTIONDECLARATION = "FunctionDeclarationNode";
NodeType NODE_LOGICALOP = "LogicalOpNode";
NodeType NODE_EQUALITYOP = "EqualityOpNode";
NodeType NODE_ITERATION = "IterationNode";


Node* createNode(NodeType type) {
    if(type == NODE_NOTIMPLEMENTED) return new NotImplementedNode;
    if(type == NODE_ANY) return new AnyNode;
    
    if(type == NODE_FLOAT) return new FloatNode;
    else if(type == NODE_INT) return new IntNode;
    else if(type == NODE_IDENTIFIER) return new IdentifierNode;
    else if(type == NODE_ARRAYINDEX) return new ArrayIndexNode;
    else if(type == NODE_PARAMETERDECLARATION) return new ParameterDeclarationNode;
    else if(type == NODE_TYPE) return new TypeNode;
    else if(type == NODE_MULTIPLICATION) return new MultiplicationNode;
    else if(type == NODE_ADDITION) return new AdditionNode;
    else if(type == NODE_CALL) return new CallNode;
    else if(type == NODE_ASSIGN) return new AssignNode;
    else if(type == NODE_SELECTION) return new SelectionNode;
    else if(type == NODE_RELATION) return new RelationalNode;
    else if(type == NODE_FUNCTIONDECLARATION) return new FunctionDeclarationNode;
    else if(type == NODE_LOGICALOP) return new LogicalOpNode;
    else if(type == NODE_EQUALITYOP) return new EqualityOpNode;
    else if(type == NODE_ITERATION) return new IterationNode;
    return NULL;
}



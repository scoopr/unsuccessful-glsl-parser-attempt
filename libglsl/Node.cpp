#include "Node.h"

typedef const char* NodeType;

NodeType NODE_NOTIMPLEMENTED = "NODE_NOTIMPLEMENTED";
NodeType NODE_ANY = "NODE_ANY";

NodeType NODE_FLOAT = "NODE_FLOAT";
NodeType NODE_INT = "NODE_INT";
NodeType NODE_IDENTIFIER = "NODE_IDENTIFIER";
NodeType NODE_ARRAYINDEX = "NODE_ARRAYINDEX";
NodeType NODE_PARAMETERDECLARATION = "NODE_PARAMETERDECLARATION";
NodeType NODE_TYPE = "NODE_TYPE";
NodeType NODE_MULTIPLICATION = "NODE_MULTIPLICATION";
NodeType NODE_ADDITION = "NODE_ADDITION";
NodeType NODE_CALL = "NODE_CALL";
NodeType NODE_ASSIGN = "NODE_ASSIGN";
NodeType NODE_SELECTION = "NODE_SELECTION";
NodeType NODE_RELATION = "NODE_RELATION";
NodeType NODE_FUNCTIONDECLARATION = "NODE_FUNCTIONDECLARATION";
NodeType NODE_LOGICALOP = "NODE_LOGICALOP";
NodeType NODE_EQUALITYOP = "NODE_EQUALITYOP";
NodeType NODE_ITERATION = "NODE_ITERATION";
NodeType NODE_TRANSLATIONUNIT = "NODE_TRANSLATIONUNIT";
NodeType NODE_FUNCTIONHEADER = "NODE_FUNCTIONHEADER";
NodeType NODE_SCOPE = "NODE_SCOPE";
NodeType NODE_VARIABLEDECLARATION = "NODE_VARIABLEDECLARATION";
NodeType NODE_VARIABLE = "NODE_VARIABLE";


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
    else if(type == NODE_TRANSLATIONUNIT) return new TranslationUnitNode;
    else if(type == NODE_FUNCTIONHEADER) return new FunctionHeaderNode;
    else if(type == NODE_SCOPE) return new ScopeNode;
    else if(type == NODE_VARIABLEDECLARATION) return new VariableDeclarationNode;
    else if(type == NODE_VARIABLE) return new VariableNode;

    return new NotImplementedNode;
}



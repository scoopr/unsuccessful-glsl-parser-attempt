%token_type {Token*}

%default_type { Node* }

%token_prefix GLSL_
%name glslparser

%type unary_operator {Token*}
%type assignment_operator {Token*}

%extra_argument {ParserState* state}

/*
Precedence Operator Class Operators Associativity 
1 (highest) parenthetical grouping ( )       NA 
2 array subscript 
    function call and constructor structure 
    field or method selector, swizzler 
    post fix increment and decrement 
    [ ] ( ) . ++  -- 
    Left to Right 
3 prefix increment and decrement 
    unary ++  -- +  -  ~  ! Right to Left 
4 multiplicative *   /    % Left to Right 
5 additive +  - Left to Right 
6 bit-wise shift <<    >> Left to Right 
7 relational <    >    <=   >= Left to Right 
8 equality ==   != Left to Right 
9 bit-wise and & Left to Right 
10 bit-wise exclusive or ^ Left to Right 
11 bit-wise inclusive or | Left to Right 
12 logical and && Left to Right 
13 logical exclusive or ^^ Left to Right 
14 logical inclusive or | | Left to Right 
15 selection ? : Right to Left 
16 
Assignment 
arithmetic assignments =+=  -= 
*=  /= 
%=    <<=   >>= 
&=  ^=  |= 
Right to Left 
17 (lowest) sequence , Left to Right 
*/


//%nonassoc LEFT_PAREN RIGHT_PAREN.
%left LEFT_BRACKET RIGHT_BRACKET LEFT_PAREN RIGHT_PAREN DOT INC_OP DEC_OP.
%left UNARY TILDE BANG.
%left STAR DASH PERCENT.
%left PLUS MINUS.
%left LEFT_OP RIGHT_OP.
%left LEFT_ANGLE RIGHT_ANGLE LE_OP GE_OP.
%left EQ_OP NE_OP .
%left AMPERSAND.
%left CARET.
%left VERTICAL_BAR.
%left AND_OP.
%left XOR_OP.
%left OR_OP.
%right QUESTION COLON.
%right EQUAL ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN LEFT_ASSIGN RIGHT_ASSIGN
       AND_ASSIGN XOR_ASSIGN OR_ASSIGN.
%right COMMA.



%syntax_error {
    state->syntax_error = true;
//    throw std::runtime_error("Syntax terror!")
    if(TOKEN)
        std::cout << "Syntax error on token: " << *TOKEN << std::endl;
    else
        std::cout << "ICE" << std::endl;
}




%include {
    #include <stdexcept>
    #include <iostream>
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    
    #include "Token.h"
    #include "glsl.h"
    #include "Node.h"
    
    #include "ParserState.h"

//    bool syntax_error = false;
//    Node *result = NULL;

}

//program ::= expression(A).   { result = A; }
//program ::= expression(A).   { result = new Node(A); }
program ::= translation_unit(A).   { state->result = A; }


variable_identifier(A) ::= IDENTIFIER(B). { A = state->identifier(B); }

primary_expression(A) ::= variable_identifier(B). { A = B; }
primary_expression(A) ::= FLOATCONSTANT(B). { A = new FloatNode(B); }
primary_expression(A) ::= INTCONSTANT(B). { A = new IntNode(B); }
primary_expression(A) ::= UINTCONSTANT(B). { A = new Node(B); }
primary_expression(A) ::= LEFT_PAREN expression(B) RIGHT_PAREN. { A = B; }


postfix_expression(A) ::= primary_expression(B) . { A = B; }
postfix_expression(A) ::= postfix_expression(B) LEFT_BRACKET integer_expression(C) RIGHT_BRACKET . { A = new Node(B,C); }
postfix_expression(A) ::= function_call(B) . { A = B; }
postfix_expression(A) ::= postfix_expression(B) DOT IDENTIFIER(C) . { A = new Node(B,state->identifier(C)); }
//postfix_expression ::= postfix_expression DOT FIELD_SELECTION .
postfix_expression(A) ::= postfix_expression(B) INC_OP . { A = B; }
postfix_expression(A) ::= postfix_expression(B) DEC_OP . { A = B; }


integer_expression(A) ::= expression(B). { A = B; }

function_call(A) ::= function_call_or_method(B) . { A = B; }
function_call_or_method(A) ::= function_call_generic(B) . { A = B; }
function_call_or_method(A) ::= postfix_expression(B) DOT function_call_generic(C) .{ A = new Node(B,C); }

function_call_generic(A) ::= function_call_header_with_parameters(B) RIGHT_PAREN . { A = B; }
function_call_generic(A) ::= function_call_header_no_parameters(B) RIGHT_PAREN .   { A = B; }

function_call_header_no_parameters(A) ::= function_call_header(B) VOID . { A = B; }
function_call_header_no_parameters(A) ::= function_call_header(B) .      { A = B; }

function_call_header_with_parameters(A) ::= function_call_header(B) assignment_expression(C) . { A = new Node(B,C); }
function_call_header_with_parameters(A) ::= function_call_header_with_parameters(B) COMMA assignment_expression(C) . { A = B; A->addChild(C); }

function_call_header(A) ::= function_identifier(B) LEFT_PAREN . { A = B; }

function_identifier(A) ::= type_specifier(B) .  { A = B; }
function_identifier(A) ::= IDENTIFIER(B) .      { A  = state->identifier(B); }
// function_identifier ::= FIELD_SELECTION .


unary_expression(A) ::= postfix_expression(B).  { A = B; }
unary_expression(A) ::= INC_OP unary_expression(B) . [UNARY]  { A = new Node(B); }
unary_expression(A) ::= DEC_OP unary_expression(B) . [UNARY]  { A = new Node(B); }
unary_expression(A) ::= unary_operator(B) unary_expression(C) . [UNARY] { A = new Node(new Node(B),C); }


unary_operator(A) ::= PLUS(B) . [UNARY]  { A = B; }
unary_operator(A) ::= DASH(B) . [UNARY]  { A = B; }
unary_operator(A) ::= BANG(B) . [UNARY]  { A = B; }
unary_operator(A) ::= TILDE(B) . [UNARY] { A = B; }


multiplicative_expression(A) ::= unary_expression(B) . { A = B; }
multiplicative_expression(A) ::= multiplicative_expression(B) STAR unary_expression(C) . { A = new MultiplicationNode(B,C); }
multiplicative_expression(A) ::= multiplicative_expression(B) SLASH unary_expression(C) .  { A = new Node(B,C); }
multiplicative_expression(A) ::= multiplicative_expression(B) PERCENT unary_expression(C) .{ A = new Node(B,C); }


additive_expression(A) ::= multiplicative_expression(B) . { A = B; }
additive_expression(A) ::= additive_expression(B) PLUS multiplicative_expression(C) . { A = new AdditionNode(B,C); }
additive_expression(A) ::= additive_expression(B) DASH multiplicative_expression(C) . { A = new Node(B,C); }


shift_expression(A) ::= additive_expression(B) . { A = B; }
shift_expression(A) ::= shift_expression LEFT_OP additive_expression .
shift_expression(A) ::= shift_expression RIGHT_OP additive_expression .


relational_expression(A) ::= shift_expression(B) . { A = B; }
relational_expression(A) ::= relational_expression(B) LEFT_ANGLE(C) shift_expression(D) . { A = new RelationalNode(B,D,C); }
relational_expression(A) ::= relational_expression(B) RIGHT_ANGLE(C) shift_expression(D) . { A = new RelationalNode(B,D,C); }
relational_expression(A) ::= relational_expression(B) LE_OP(C) shift_expression(D) . { A = new RelationalNode(B,D,C); }
relational_expression(A) ::= relational_expression(B) GE_OP(C) shift_expression(D) . { A = new RelationalNode(B,D,C); }


equality_expression(A) ::= relational_expression(B) . { A = B; }
equality_expression(A) ::= equality_expression(B) EQ_OP(C) relational_expression(D) . { A = new EqualityOpNode(B, D, C); }
equality_expression(A) ::= equality_expression(B) NE_OP(C) relational_expression(D) . { A = new EqualityOpNode(B, D, C); }

and_expression(A) ::= equality_expression(B) . { A = B; }
and_expression(A) ::= and_expression AMPERSAND equality_expression.

exclusive_or_expression(A) ::= and_expression(B) . { A = B; }
exclusive_or_expression(A) ::= exclusive_or_expression CARET and_expression .

inclusive_or_expression(A) ::= exclusive_or_expression(B) . { A = B; }
inclusive_or_expression(A) ::= inclusive_or_expression(B) VERTICAL_BAR(C) exclusive_or_expression(D) . { A = new LogicalOpNode(B,D,C); }

logical_and_expression(A) ::= inclusive_or_expression(B) . { A = B; }
logical_and_expression(A) ::= logical_and_expression(B) AND_OP(C) inclusive_or_expression(D) . { A = new LogicalOpNode(B,D,C); }

logical_xor_expression(A) ::= logical_and_expression(B) . { A = B; }
logical_xor_expression(A) ::= logical_xor_expression(B) XOR_OP(C) logical_and_expression(D) . { A = new LogicalOpNode(B,D,C); }

logical_or_expression(A) ::= logical_xor_expression(B) . { A = B; }
logical_or_expression(A) ::= logical_or_expression(B) OR_OP(C) logical_xor_expression(D) . { A = new LogicalOpNode(B,D,C); }


conditional_expression(A) ::= logical_or_expression(B) . { A = B; }
conditional_expression(A) ::= logical_or_expression(B) QUESTION expression(C) COLON assignment_expression(D) . { A = new Node(B,C,D); }



assignment_expression(A) ::= conditional_expression(B). { A = B; } 
assignment_expression(A) ::= unary_expression(B) assignment_operator(C) assignment_expression(D). { A = new AssignNode(B,D,C); }




assignment_operator(A) ::= EQUAL(B).        { A = B; }
assignment_operator(A) ::= MUL_ASSIGN(B).   { A = B; }
assignment_operator(A) ::= DIV_ASSIGN(B).   { A = B; }
assignment_operator(A) ::= MOD_ASSIGN(B).   { A = B; }
assignment_operator(A) ::= ADD_ASSIGN(B).   { A = B; }
assignment_operator(A) ::= SUB_ASSIGN(B).   { A = B; }
assignment_operator(A) ::= LEFT_ASSIGN(B).  { A = B; }
assignment_operator(A) ::= RIGHT_ASSIGN(B). { A = B; }
assignment_operator(A) ::= AND_ASSIGN(B).   { A = B; }
assignment_operator(A) ::= XOR_ASSIGN(B).   { A = B; }
assignment_operator(A) ::= OR_ASSIGN(B).    { A = B; }



expression(A) ::= assignment_expression(B). { A = B; }
expression(A) ::= expression(B) COMMA assignment_expression(C). { A = B; B->addChild(C); }


constant_expression(A) ::= conditional_expression(B). { A = B; }

declaration(A) ::= function_prototype(B) SEMICOLON. { A = B; }
declaration(A) ::= init_declarator_list(B) SEMICOLON .{ A = B; }
declaration ::= PRECISION precision_qualifier type_specifier_no_prec SEMICOLON .
declaration ::= type_qualifier IDENTIFIER LEFT_BRACE struct_declaration_list RIGHT_BRACE SEMICOLON .
declaration ::= type_qualifier SEMICOLON .

function_prototype(A) ::= function_declarator(B) RIGHT_PAREN. { A = B; }

function_declarator(A) ::= function_header(B) . { A = B; }
function_declarator(A) ::= function_header_with_parameters(B) . { A = B; }

function_header_with_parameters(A) ::= function_header(B) parameter_declaration(C). { A = new Node(B,C); }
function_header_with_parameters(A) ::= function_header_with_parameters(B) COMMA parameter_declaration(C). { A = B; B->addChild(C); }

//function_header(A) ::= fully_specified_type(B) IDENTIFIER(C) LEFT_PAREN. { A = new Node(B,C); }
function_header(A) ::= fully_specified_type(B) IDENTIFIER(C) LEFT_PAREN. { A = new FunctionDeclarationNode(B,state->identifier(C)); }


parameter_declarator(A) ::= type_specifier(B) IDENTIFIER(C). { A = new Node(B, state->identifier(C)); }
parameter_declarator(A) ::= type_specifier(B) IDENTIFIER(C) LEFT_BRACKET constant_expression(D) RIGHT_BRACKET. { A = new Node(B, state->identifier(C), D); }

parameter_declaration(A) ::= parameter_type_qualifier(B) parameter_qualifier(C) parameter_declarator(D). { A = new ParameterDeclarationNode(B,C,D); }
parameter_declaration(A) ::= parameter_qualifier(B) parameter_declarator(C) . { A = new ParameterDeclarationNode(B,C); }
parameter_declaration(A) ::= parameter_type_qualifier(B) parameter_qualifier(C) parameter_type_specifier(D) . { A = new ParameterDeclarationNode(B,C,D); }
parameter_declaration(A) ::= parameter_qualifier(B) parameter_type_specifier(C) . { A = new ParameterDeclarationNode(B,C); }

parameter_qualifier(A) ::=. { A = new Node(); }
parameter_qualifier(A) ::= IN(B) . { A = new Node(B); }
parameter_qualifier(A) ::= OUT(B) . { A = new Node(B); }
parameter_qualifier(A) ::= INOUT(B) . { A = new Node(B); }


parameter_type_specifier(A) ::= type_specifier(B) . { A = B; }



init_declarator_list(A) ::= single_declaration(B) . { A = B; }
init_declarator_list(A) ::= init_declarator_list(B) COMMA IDENTIFIER(C) . { A = B; B->addChild(state->identifier(C)); }
init_declarator_list(A) ::= init_declarator_list(B) COMMA IDENTIFIER(C) LEFT_BRACKET  RIGHT_BRACKET .
init_declarator_list(A) ::= init_declarator_list(B) COMMA IDENTIFIER(C) LEFT_BRACKET constant_expression(D) RIGHT_BRACKET .
init_declarator_list(A) ::= init_declarator_list(B) COMMA IDENTIFIER(C) LEFT_BRACKET RIGHT_BRACKET EQUAL initializer(D) .
init_declarator_list(A) ::= init_declarator_list(B) COMMA IDENTIFIER(C) LEFT_BRACKET constant_expression(D) RIGHT_BRACKET EQUAL initializer(E) .
init_declarator_list(A) ::= init_declarator_list(B) COMMA IDENTIFIER(C) EQUAL initializer(D) . { A = B; IdentifierNode* c = state->identifier(C); c->addChild(D); B->addChild(c); }



single_declaration(A) ::= fully_specified_type(B) . { A = B; }
single_declaration(A) ::= fully_specified_type(B) IDENTIFIER(C) . { A = new Node(B, state->identifier(C)); }
single_declaration(A) ::= fully_specified_type(B) IDENTIFIER(C) LEFT_BRACKET  RIGHT_BRACKET . { A = new Node(B, state->identifier(C)); }
single_declaration(A) ::= fully_specified_type(B) IDENTIFIER(C) LEFT_BRACKET constant_expression(D) RIGHT_BRACKET . { A = new Node(B, state->identifier(C), D); }
single_declaration(A) ::= fully_specified_type(B) IDENTIFIER(C) LEFT_BRACKET RIGHT_BRACKET EQUAL initializer(D) . { A = new Node(B, state->identifier(C) ,D); }
single_declaration(A) ::= fully_specified_type(B) IDENTIFIER(C) LEFT_BRACKET constant_expression(D) RIGHT_BRACKET EQUAL initializer(E) . { A = new Node(B, state->identifier(C), D ,E); }
single_declaration(A) ::= fully_specified_type(B) IDENTIFIER(C) EQUAL initializer(D) . { A = new Node(B, state->identifier(C),D); }
single_declaration(A) ::= INVARIANT IDENTIFIER .  // Vertex only. 


fully_specified_type(A) ::= type_specifier(B) . { A = B; }
fully_specified_type(A) ::= type_qualifier(B) type_specifier(C) . { A = new Node(B,C); }


invariant_qualifier ::= INVARIANT .

interpolation_qualifier ::= SMOOTH .
interpolation_qualifier ::= FLAT. 
interpolation_qualifier ::= NOPERSPECTIVE .


layout_qualifier ::= LAYOUT LEFT_PAREN layout_list RIGHT_PAREN .
layout_list ::= IDENTIFIER .
layout_list ::= layout_list COMMA IDENTIFIER .


parameter_type_qualifier ::= CONST .



type_qualifier(A) ::= storage_qualifier(B) . { A = B; }
type_qualifier(A) ::= layout_qualifier(B).  { A = B; }
type_qualifier(A) ::= layout_qualifier storage_qualifier(B). { A = B; }
type_qualifier(A) ::= interpolation_qualifier type_qualifier(B) . { A = B; }
type_qualifier(A) ::= invariant_qualifier type_qualifier(B) . { A = B; }
//type_qualifier ::= invariant_qualifier interpolation_qualifier type_qualifier . // Cannot be reduced?


storage_qualifier(A) ::= CONST(B) . { A = new Node(B); }
storage_qualifier(A) ::= ATTRIBUTE(B) . { A = new Node(B); } // Vertex only. 
storage_qualifier(A) ::= VARYING(B) . { A = new Node(B); }
storage_qualifier(A) ::= CENTROID(B) VARYING(C) . { A = new Node(new Node(B),new Node(C)); }
storage_qualifier(A) ::= IN(B) . { A = new Node(B); }
storage_qualifier(A) ::= OUT(B) . { A = new Node(B); }
storage_qualifier(A) ::= CENTROID(B) IN(C) . { A = new Node(new Node(B),new Node(C)); }
storage_qualifier(A) ::= CENTROID(B) OUT(C) . { A = new Node(new Node(B),new Node(C)); }
storage_qualifier(A) ::= UNIFORM(B) . { A = new Node(B); }



type_specifier(A) ::= type_specifier_no_prec(B). { A = B; } 
type_specifier(A) ::= precision_qualifier(B) type_specifier_no_prec(C). { A = new Node(B,C); }


type_specifier_no_prec(A) ::= type_specifier_nonarray(B) . { A = B; }
type_specifier_no_prec(A) ::= type_specifier_nonarray(B) LEFT_BRACKET RIGHT_BRACKET . { A = B; }
type_specifier_no_prec(A) ::= type_specifier_nonarray(B) LEFT_BRACKET constant_expression(C) RIGHT_BRACKET . { A = new Node(B,C); }


type_specifier_nonarray(A) ::= VOID(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= FLOAT(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= INT(B).                                { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= UINT(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= BOOL(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= VEC2(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= VEC3(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= VEC4(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= BVEC2(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= BVEC3(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= BVEC4(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= IVEC2(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= IVEC3(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= IVEC4(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= UVEC2(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= UVEC3(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= UVEC4(B).                              { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT2(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT3(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT4(B).                               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT2X2(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT2X3(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT2X4(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT3X2(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT3X3(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT3X4(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT4X2(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT4X3(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= MAT4X4(B).                             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER1D(B).                          { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER2D(B).                          { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER3D(B).                          { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLERCUBE(B).                        { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER1DSHADOW(B).                    { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER2DSHADOW(B).                    { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLERCUBESHADOW(B).                  { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER1DARRAY(B).                     { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER2DARRAY(B).                     { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER1DARRAYSHADOW(B).               { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= SAMPLER2DARRAYSHADOW(B).               { A = new TypeNode(B); }
//type_specifier_nonarray(A) ::= SAMPLERCUBESHADOW(B).                { A = new TypeNode(B); }
//type_specifier_nonarray(A) ::= SAMPLER1DARRAY(B).                   { A = new TypeNode(B); }
//type_specifier_nonarray(A) ::= SAMPLER2DARRAY(B).                   { A = new TypeNode(B); }
//type_specifier_nonarray(A) ::= SAMPLER1DARRAYSHADOW(B).             { A = new TypeNode(B); }
//type_specifier_nonarray(A) ::= SAMPLER2DARRAYSHADOW(B).             { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= ISAMPLER1D(B).                         { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= ISAMPLER2D(B).                         { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= ISAMPLER3D(B).                         { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= ISAMPLERCUBE(B).                       { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= ISAMPLER1DARRAY(B).                    { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= ISAMPLER2DARRAY(B).                    { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= USAMPLER1D(B).                         { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= USAMPLER2D(B).                         { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= USAMPLER3D(B).                         { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= USAMPLERCUBE(B).                       { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= USAMPLER1DARRAY(B).                    { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= USAMPLER2DARRAY(B).                    { A = new TypeNode(B); }
type_specifier_nonarray(A) ::= struct_specifier(B).                   { A = B; }
type_specifier_nonarray(A) ::= TYPE_NAME(B).                          { A = new TypeNode(B); }


precision_qualifier ::= HIGH_PRECISION .
precision_qualifier ::= MEDIUM_PRECISION. 
precision_qualifier ::= LOW_PRECISION .


struct_specifier ::= STRUCT IDENTIFIER LEFT_BRACE struct_declaration_list RIGHT_BRACE .
struct_specifier ::= STRUCT LEFT_BRACE struct_declaration_list RIGHT_BRACE .



struct_declaration_list ::= struct_declaration .
struct_declaration_list ::= struct_declaration_list struct_declaration .

struct_declaration ::= type_specifier struct_declarator_list SEMICOLON .
struct_declaration ::= type_qualifier type_specifier struct_declarator_list SEMICOLON .


struct_declarator_list ::= struct_declarator .
struct_declarator_list ::= struct_declarator_list COMMA struct_declarator .

struct_declarator ::= IDENTIFIER .
struct_declarator ::= IDENTIFIER LEFT_BRACKET constant_expression RIGHT_BRACKET .




initializer(A) ::= assignment_expression(B) . { A = B; }


declaration_statement(A) ::= declaration(B) . { A = B; }


//statement(A) ::= compound_statement(B). { A = B; } 
statement(A) ::= matched_selection_statement(B). { A = B; }
statement(A) ::= unmatched_selection_statement(B). { A = B; }


simple_statement(A) ::= declaration_statement(B) . { A = B; }
simple_statement(A) ::= expression_statement(B). { A = B; }
//simple_statement(A) ::= matched_selection_statement(B) . { A = B; }
//simple_statement(A) ::= unmatched_selection_statement(B) . { A = B; }
simple_statement(A) ::= switch_statement(B) . { A = B; }
simple_statement(A) ::= case_label(B) . { A = B; }
simple_statement(A) ::= iteration_statement(B) . { A = B; }
simple_statement(A) ::= jump_statement(B) . { A = B; }



compound_statement(A) ::= LEFT_BRACE RIGHT_BRACE . { A = new Node(); }
compound_statement(A) ::= LEFT_BRACE statement_list(B) RIGHT_BRACE . { A = B; }


statement_no_new_scope(A) ::= compound_statement_no_new_scope(B) . { A = B; }
statement_no_new_scope(A) ::= simple_statement(B) . { A = B; }


compound_statement_no_new_scope(A) ::= LEFT_BRACE RIGHT_BRACE. { A = new Node(); }
compound_statement_no_new_scope(A) ::= LEFT_BRACE statement_list(B) RIGHT_BRACE. { A = B; }


statement_list(A) ::= statement(B).  { A = new Node(B); }
statement_list(A) ::= statement_list(B) statement(C). { A = B; if(B) B->addChild(C); } 


expression_statement(A) ::= SEMICOLON . { A = new Node(); } 
expression_statement(A) ::= expression(B) SEMICOLON . { A = B; }


matched_selection_statement(A) ::= IF LEFT_PAREN expression(B) RIGHT_PAREN matched_selection_statement(C) ELSE matched_selection_statement(D) . { A = new SelectionNode(B,C,D); }
matched_selection_statement(A) ::= simple_statement(B) . { A = B; }
matched_selection_statement(A) ::= compound_statement(B) . { A = B; }

unmatched_selection_statement(A) ::= IF LEFT_PAREN expression(B) RIGHT_PAREN statement(C) . { A = new SelectionNode(B,C); }
unmatched_selection_statement(A) ::= IF LEFT_PAREN expression(B) RIGHT_PAREN matched_selection_statement(C) ELSE unmatched_selection_statement(D) . { A = new SelectionNode(B,C,D); }

//selection_rest_statement ::= statement ELSE statement . // TODO: conflict?!
//selection_rest_statement ::= statement .


condition(A) ::= expression(B). { A = B; }
condition(A) ::= fully_specified_type(B) IDENTIFIER(C) EQUAL initializer(D) . { A = new Node(B,state->identifier(C),D); }


switch_statement ::= SWITCH LEFT_PAREN expression RIGHT_PAREN LEFT_BRACE switch_statement_list RIGHT_BRACE .

switch_statement_list ::= .
switch_statement_list ::= statement_list.


case_label(A) ::= CASE expression(B) COLON . { A = new Node(B); }
case_label(A) ::= DEFAULT(B) COLON . { A = new Node(B); }


iteration_statement(A) ::= WHILE LEFT_PAREN condition(B) RIGHT_PAREN statement_no_new_scope(C) . { A = new IterationNode(B,C); }
iteration_statement(A) ::= DO statement(B) WHILE LEFT_PAREN expression(C) RIGHT_PAREN SEMICOLON . { A = new IterationNode(C,B); }
iteration_statement(A) ::= FOR LEFT_PAREN for_init_statement(B) for_rest_statement(C) RIGHT_PAREN statement_no_new_scope(D) . { A = new IterationNode(B,C,D); }

for_init_statement(A) ::= expression_statement(B) . { A = B; }
for_init_statement(A) ::= declaration_statement(B) . { A = B; }


conditionopt(A) ::= condition(B) . { A = B; }
conditionopt(A) ::= . { A = new Node(); }        /* empty */ 



for_rest_statement(A) ::= conditionopt(B) SEMICOLON . { A = B; }
for_rest_statement(A) ::= conditionopt(B) SEMICOLON expression(C) . { A = B; A->addChild(C); }




jump_statement(A) ::= CONTINUE(B) SEMICOLON . { A = new Node(B); }
jump_statement(A) ::= BREAK(B) SEMICOLON . { A = new Node(B); }
jump_statement(A) ::= RETURN SEMICOLON . { A = new Node(); }
jump_statement(A) ::= RETURN expression(C) SEMICOLON . { A = new Node(C); }
jump_statement(A) ::= DISCARD(B) SEMICOLON .  { A = new Node(B); } // Fragment shader only. 



translation_unit(A) ::= external_declaration(B). { A = B; }
translation_unit(A) ::= translation_unit(B) external_declaration(C). { A =  new Node(B); A->addChild(C); }


external_declaration(A) ::= function_definition(B). { A = B; }
external_declaration(A) ::= declaration(B). { A = B; }




function_definition(A) ::= function_prototype(B) compound_statement_no_new_scope(C). { A = B; B->addChild(C); } 






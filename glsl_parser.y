%token_type {Token*}

%default_type { Node* }

%token_prefix GLSL_
%name glslparser


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
//    throw std::runtime_error("Syntax terror!")
    std::cout << "Syntax error!" << std::endl;
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


    Node *result = NULL;

}

//program ::= expression(A).   { result = A; }
//program ::= expression(A).   { result = new Node(A); }
program ::= translation_unit(A).   { result = A; }


variable_identifier(A) ::= IDENTIFIER(B). { A = new IdentifierNode(B); }

primary_expression(A) ::= variable_identifier(B). { A = B; }
primary_expression(A) ::= FLOATCONSTANT(B). { A = new FloatNode(B); }
primary_expression(A) ::= INTCONSTANT(B). { A = new IntNode(B); }
primary_expression(A) ::= UINTCONSTANT(B). { A = new Node(B); }
primary_expression(A) ::= LEFT_PAREN expression(B) RIGHT_PAREN. { A = new Node(B); }


postfix_expression ::= primary_expression .
postfix_expression ::= postfix_expression LEFT_BRACKET integer_expression RIGHT_BRACKET .
postfix_expression ::= function_call .
postfix_expression ::= postfix_expression DOT FIELD_SELECTION .
postfix_expression ::= postfix_expression INC_OP .
postfix_expression ::= postfix_expression DEC_OP .


integer_expression(A) ::= expression(B). { A = B; }

function_call ::= function_call_or_method .
function_call_or_method ::= function_call_generic .
function_call_or_method ::= postfix_expression DOT function_call_generic .

function_call_generic ::= function_call_header_with_parameters RIGHT_PAREN .
function_call_generic ::= function_call_header_no_parameters RIGHT_PAREN .

function_call_header_no_parameters ::= function_call_header VOID .
function_call_header_no_parameters ::= function_call_header .

function_call_header_with_parameters ::= function_call_header assignment_expression .
function_call_header_with_parameters ::= function_call_header_with_parameters COMMA assignment_expression .

function_call_header ::= function_identifier LEFT_PAREN .

function_identifier ::= type_specifier .
function_identifier ::= IDENTIFIER .
function_identifier ::= FIELD_SELECTION .


unary_expression ::= postfix_expression.
unary_expression ::= INC_OP unary_expression . [UNARY]
unary_expression ::= DEC_OP unary_expression . [UNARY]
unary_expression ::= unary_operator unary_expression . [UNARY]


unary_operator ::= PLUS . [UNARY]
unary_operator ::= DASH . [UNARY]
unary_operator ::= BANG . [UNARY]
unary_operator ::= TILDE . [UNARY]


multiplicative_expression ::= unary_expression .
multiplicative_expression ::= multiplicative_expression STAR unary_expression .
multiplicative_expression ::= multiplicative_expression SLASH unary_expression .
multiplicative_expression ::= multiplicative_expression PERCENT unary_expression .


additive_expression ::= multiplicative_expression .
additive_expression ::= additive_expression PLUS multiplicative_expression .
additive_expression ::= additive_expression DASH multiplicative_expression .


shift_expression ::= additive_expression .
shift_expression ::= shift_expression LEFT_OP additive_expression .
shift_expression ::= shift_expression RIGHT_OP additive_expression .


relational_expression ::= shift_expression .
relational_expression ::= relational_expression LEFT_ANGLE shift_expression .
relational_expression ::= relational_expression RIGHT_ANGLE shift_expression .
relational_expression ::= relational_expression LE_OP shift_expression .
relational_expression ::= relational_expression GE_OP shift_expression .


equality_expression ::= relational_expression .
equality_expression ::= equality_expression EQ_OP relational_expression .
equality_expression ::= equality_expression NE_OP relational_expression .

and_expression ::= equality_expression .
and_expression ::= and_expression AMPERSAND equality_expression.

exclusive_or_expression ::= and_expression .
exclusive_or_expression ::= exclusive_or_expression CARET and_expression .

inclusive_or_expression ::= exclusive_or_expression .
inclusive_or_expression ::= inclusive_or_expression VERTICAL_BAR exclusive_or_expression .

logical_and_expression ::= inclusive_or_expression .
logical_and_expression ::= logical_and_expression AND_OP inclusive_or_expression .

logical_xor_expression ::= logical_and_expression .
logical_xor_expression ::= logical_xor_expression XOR_OP logical_and_expression .

logical_or_expression ::= logical_xor_expression .
logical_or_expression ::= logical_or_expression OR_OP logical_xor_expression .


conditional_expression ::= logical_or_expression .
conditional_expression ::= logical_or_expression QUESTION expression COLON assignment_expression .



assignment_expression ::= conditional_expression. 
assignment_expression ::= unary_expression assignment_operator assignment_expression.




assignment_operator(A) ::= EQUAL(B). { A = new Node(B); }
assignment_operator(A) ::= MUL_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= DIV_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= MOD_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= ADD_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= SUB_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= LEFT_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= RIGHT_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= AND_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= XOR_ASSIGN(B). { A = new Node(B); }
assignment_operator(A) ::= OR_ASSIGN(B). { A = new Node(B); }



expression(A) ::= assignment_expression(B). { A = new Node(B); }
expression(A) ::= expression(B) COMMA assignment_expression(C). { A = new Node(new Node(B),C); }


constant_expression ::= conditional_expression.

declaration ::= function_prototype SEMICOLON. 
declaration ::= init_declarator_list SEMICOLON .
declaration ::= PRECISION precision_qualifier type_specifier_no_prec SEMICOLON .
declaration ::= type_qualifier IDENTIFIER LEFT_BRACE struct_declaration_list RIGHT_BRACE SEMICOLON .
declaration ::= type_qualifier SEMICOLON .

function_prototype ::= function_declarator RIGHT_PAREN. 

function_declarator ::= function_header .
function_declarator ::= function_header_with_parameters .

function_header_with_parameters ::= function_header parameter_declaration.
function_header_with_parameters ::= function_header_with_parameters COMMA parameter_declaration.

function_header(A) ::= fully_specified_type(B) IDENTIFIER(C) LEFT_PAREN. { A = new Node(B,new IdentifierNode(C)); }


parameter_declarator ::= type_specifier IDENTIFIER.
parameter_declarator ::= type_specifier IDENTIFIER LEFT_BRACKET constant_expression RIGHT_BRACKET.

parameter_declaration(A) ::= parameter_type_qualifier(B) parameter_qualifier(C) parameter_declarator(D). { A = new ParameterDeclarationNode(B,C,D); }
parameter_declaration(A) ::= parameter_qualifier(B) parameter_declarator(C) . { A = new ParameterDeclarationNode(B,C); }
parameter_declaration(A) ::= parameter_type_qualifier(B) parameter_qualifier(C) parameter_type_specifier(D) . { A = new ParameterDeclarationNode(B,C,D); }
parameter_declaration(A) ::= parameter_qualifier(B) parameter_type_specifier(C) . { A = new ParameterDeclarationNode(B,C); }

parameter_qualifier(A) ::=. { A = new Node(); }
parameter_qualifier(A) ::= IN . { A = new Node(); }
parameter_qualifier(A) ::= OUT . { A = new Node(); }
parameter_qualifier(A) ::= INOUT . { A = new Node(); }


parameter_type_specifier ::= type_specifier .



init_declarator_list ::= single_declaration .
init_declarator_list ::= init_declarator_list COMMA IDENTIFIER .
init_declarator_list ::= init_declarator_list COMMA IDENTIFIER LEFT_BRACKET  RIGHT_BRACKET .
init_declarator_list ::= init_declarator_list COMMA IDENTIFIER LEFT_BRACKET constant_expression RIGHT_BRACKET .
init_declarator_list ::= init_declarator_list COMMA IDENTIFIER LEFT_BRACKET RIGHT_BRACKET EQUAL initializer .
init_declarator_list ::= init_declarator_list COMMA IDENTIFIER LEFT_BRACKET constant_expression RIGHT_BRACKET EQUAL initializer .
init_declarator_list ::= init_declarator_list COMMA IDENTIFIER EQUAL initializer .



single_declaration ::= fully_specified_type .
single_declaration ::= fully_specified_type IDENTIFIER .
single_declaration ::= fully_specified_type IDENTIFIER LEFT_BRACKET  RIGHT_BRACKET .
single_declaration ::= fully_specified_type IDENTIFIER LEFT_BRACKET constant_expression RIGHT_BRACKET .
single_declaration ::= fully_specified_type IDENTIFIER LEFT_BRACKET RIGHT_BRACKET EQUAL initializer .
single_declaration ::= fully_specified_type IDENTIFIER LEFT_BRACKET constant_expression RIGHT_BRACKET EQUAL initializer .
single_declaration ::= fully_specified_type IDENTIFIER EQUAL initializer .
single_declaration ::= INVARIANT IDENTIFIER .  // Vertex only. 


fully_specified_type ::= type_specifier .
fully_specified_type ::= type_qualifier type_specifier .


invariant_qualifier ::= INVARIANT .

interpolation_qualifier ::= SMOOTH .
interpolation_qualifier ::= FLAT. 
interpolation_qualifier ::= NOPERSPECTIVE .


layout_qualifier ::= LAYOUT LEFT_PAREN layout_list RIGHT_PAREN .
layout_list ::= IDENTIFIER .
layout_list ::= layout_list COMMA IDENTIFIER .


parameter_type_qualifier ::= CONST .



type_qualifier ::= storage_qualifier .
type_qualifier ::= layout_qualifier. 
type_qualifier ::= layout_qualifier storage_qualifier .
type_qualifier ::= interpolation_qualifier type_qualifier .
type_qualifier ::= invariant_qualifier type_qualifier .
//type_qualifier ::= invariant_qualifier interpolation_qualifier type_qualifier . // Cannot be reduced?


storage_qualifier ::= CONST .
storage_qualifier ::= ATTRIBUTE .  // Vertex only. 
storage_qualifier ::= VARYING .
storage_qualifier ::= CENTROID VARYING .
storage_qualifier ::= IN .
storage_qualifier ::= OUT .
storage_qualifier ::= CENTROID IN .
storage_qualifier ::= CENTROID OUT .
storage_qualifier ::= UNIFORM .



type_specifier ::= type_specifier_no_prec. 
type_specifier ::= precision_qualifier type_specifier_no_prec.


type_specifier_no_prec ::= type_specifier_nonarray .
type_specifier_no_prec ::= type_specifier_nonarray LEFT_BRACKET RIGHT_BRACKET .
type_specifier_no_prec ::= type_specifier_nonarray LEFT_BRACKET constant_expression RIGHT_BRACKET .


type_specifier_nonarray ::= VOID .
type_specifier_nonarray ::= FLOAT .
type_specifier_nonarray ::= INT .
type_specifier_nonarray ::= UINT .
type_specifier_nonarray ::= BOOL .
type_specifier_nonarray ::= VEC2 .
type_specifier_nonarray ::= VEC3 .
type_specifier_nonarray ::= VEC4 .
type_specifier_nonarray ::= BVEC2 .
type_specifier_nonarray ::= BVEC3 .
type_specifier_nonarray ::= BVEC4 .
type_specifier_nonarray ::= IVEC2 .
type_specifier_nonarray ::= IVEC3 .
type_specifier_nonarray ::= IVEC4 .
type_specifier_nonarray ::= UVEC2 .
type_specifier_nonarray ::= UVEC3 .
type_specifier_nonarray ::= UVEC4 .
type_specifier_nonarray ::= MAT2 .
type_specifier_nonarray ::= MAT3 .
type_specifier_nonarray ::= MAT4 .
type_specifier_nonarray ::= MAT2X2. 
type_specifier_nonarray ::= MAT2X3 .
type_specifier_nonarray ::= MAT2X4 .
type_specifier_nonarray ::= MAT3X2 .
type_specifier_nonarray ::= MAT3X3 .
type_specifier_nonarray ::= MAT3X4 .
type_specifier_nonarray ::= MAT4X2 .
type_specifier_nonarray ::= MAT4X3 .
type_specifier_nonarray ::= MAT4X4 .
type_specifier_nonarray ::= SAMPLER1D .
type_specifier_nonarray ::= SAMPLER2D .
type_specifier_nonarray ::= SAMPLER3D .
type_specifier_nonarray ::= SAMPLERCUBE .
type_specifier_nonarray ::= SAMPLER1DSHADOW .
type_specifier_nonarray ::= SAMPLER2DSHADOW .
type_specifier_nonarray ::= SAMPLERCUBESHADOW. 
type_specifier_nonarray ::= SAMPLER1DARRAY .
type_specifier_nonarray ::= SAMPLER2DARRAY .
type_specifier_nonarray ::= SAMPLER1DARRAYSHADOW .
type_specifier_nonarray ::= SAMPLER2DARRAYSHADOW .
//type_specifier_nonarray ::= SAMPLERCUBESHADOW .
//type_specifier_nonarray ::= SAMPLER1DARRAY .
//type_specifier_nonarray ::= SAMPLER2DARRAY .
//type_specifier_nonarray ::= SAMPLER1DARRAYSHADOW .
//type_specifier_nonarray ::= SAMPLER2DARRAYSHADOW .
type_specifier_nonarray ::= ISAMPLER1D .
type_specifier_nonarray ::= ISAMPLER2D .
type_specifier_nonarray ::= ISAMPLER3D .
type_specifier_nonarray ::= ISAMPLERCUBE. 
type_specifier_nonarray ::= ISAMPLER1DARRAY .
type_specifier_nonarray ::= ISAMPLER2DARRAY .
type_specifier_nonarray ::= USAMPLER1D .
type_specifier_nonarray ::= USAMPLER2D .
type_specifier_nonarray ::= USAMPLER3D .
type_specifier_nonarray ::= USAMPLERCUBE. 
type_specifier_nonarray ::= USAMPLER1DARRAY. 
type_specifier_nonarray ::= USAMPLER2DARRAY .
type_specifier_nonarray ::= struct_specifier .
type_specifier_nonarray ::= TYPE_NAME .


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




initializer ::= assignment_expression .


declaration_statement ::= declaration .

statement ::= compound_statement. 
statement ::= simple_statement. 


simple_statement ::= declaration_statement .
simple_statement ::= expression_statement. 
simple_statement ::= selection_statement .
simple_statement ::= switch_statement .
simple_statement ::= case_label .
simple_statement ::= iteration_statement .
simple_statement ::= jump_statement .



compound_statement ::= LEFT_BRACE RIGHT_BRACE .
compound_statement ::= LEFT_BRACE statement_list RIGHT_BRACE .


statement_no_new_scope ::= compound_statement_no_new_scope .
statement_no_new_scope ::= simple_statement .


compound_statement_no_new_scope ::= LEFT_BRACE RIGHT_BRACE. 
compound_statement_no_new_scope ::= LEFT_BRACE statement_list RIGHT_BRACE.


statement_list ::= statement. 
statement_list(A) ::= statement_list(B) statement(C). { A = new Node(B,C); } 


expression_statement ::= SEMICOLON .
expression_statement ::= expression SEMICOLON .


selection_statement ::= IF LEFT_PAREN expression RIGHT_PAREN selection_rest_statement .

//selection_rest_statement ::= statement ELSE statement . // TODO: conflict?!
selection_rest_statement ::= statement .


condition ::= expression .
condition ::= fully_specified_type IDENTIFIER EQUAL initializer .


switch_statement ::= SWITCH LEFT_PAREN expression RIGHT_PAREN LEFT_BRACE switch_statement_list RIGHT_BRACE .

switch_statement_list ::= .
switch_statement_list ::= statement_list.


case_label ::= CASE expression COLON .
case_label ::= DEFAULT COLON .


iteration_statement ::= WHILE LEFT_PAREN condition RIGHT_PAREN statement_no_new_scope .
iteration_statement ::= DO statement WHILE LEFT_PAREN expression RIGHT_PAREN SEMICOLON .
iteration_statement ::= FOR LEFT_PAREN for_init_statement for_rest_statement RIGHT_PAREN statement_no_new_scope .

for_init_statement ::= expression_statement .
for_init_statement ::= declaration_statement .


conditionopt ::= condition .
conditionopt ::= .        /* empty */ 



for_rest_statement ::= conditionopt SEMICOLON .
for_rest_statement ::= conditionopt SEMICOLON expression .




jump_statement ::= CONTINUE SEMICOLON .
jump_statement ::= BREAK SEMICOLON .
jump_statement ::= RETURN SEMICOLON .
jump_statement ::= RETURN expression SEMICOLON .
jump_statement ::= DISCARD SEMICOLON .  // Fragment shader only. 



translation_unit(A) ::= external_declaration(B). { A = new Node(B); }


external_declaration ::= function_definition. 
external_declaration ::= declaration. 




function_definition(A) ::= function_prototype(B) compound_statement_no_new_scope(C). { A = new Node(B,C); } 






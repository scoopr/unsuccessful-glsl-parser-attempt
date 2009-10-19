

//#define GLSL_ELSE               9999*0
#define GLSL_TOK_TRUE           9998*0
#define GLSL_TOK_FALSE          9997*0
#define GLSL_LOWP               9996*0
#define GLSL_MEDIUMP            9995*0
#define GLSL_HIGHP              9994*0
#define GLSL_ISAMPLER2DRECT     9993*0
#define GLSL_USAMPLER2DRECT     9992*0
#define GLSL_ISAMPLERBUFFER     9991*0
#define GLSL_USAMPLERBUFFER     9990*0
//#define GLSL_PRECISION          9989*0

%%{

    machine glsl;

    action tok_start {
        tok_start = p;
    }

    action tok_ATTRIBUTE { if(emitToken(GLSL_ATTRIBUTE)) { fbreak; } }
    action tok_CONST { if(emitToken(GLSL_CONST)) { fbreak; } }
    action tok_UNIFORM { if(emitToken(GLSL_UNIFORM)) { fbreak; } }
    action tok_VARYING { if(emitToken(GLSL_VARYING)) { fbreak; } }
    action tok_LAYOUT { if(emitToken(GLSL_LAYOUT)) { fbreak; } }
    action tok_CENTROID { if(emitToken(GLSL_CENTROID)) { fbreak; } }
    action tok_FLAT { if(emitToken(GLSL_FLAT)) { fbreak; } }
    action tok_SMOOTH { if(emitToken(GLSL_SMOOTH)) { fbreak; } }
    action tok_NOPERSPECTIVE { if(emitToken(GLSL_NOPERSPECTIVE)) { fbreak; } }
    action tok_BREAK { if(emitToken(GLSL_BREAK)) { fbreak; } }
    action tok_CONTINUE { if(emitToken(GLSL_CONTINUE)) { fbreak; } }
    action tok_DO { if(emitToken(GLSL_DO)) { fbreak; } }
    action tok_FOR { if(emitToken(GLSL_FOR)) { fbreak; } }
    action tok_WHILE { if(emitToken(GLSL_WHILE)) { fbreak; } }
    action tok_SWITCH { if(emitToken(GLSL_SWITCH)) { fbreak; } }
    action tok_CASE { if(emitToken(GLSL_CASE)) { fbreak; } }
    action tok_DEFAULT { if(emitToken(GLSL_DEFAULT)) { fbreak; } }
    action tok_IF { if(emitToken(GLSL_IF)) { fbreak; } }
    action tok_ELSE { if(emitToken(GLSL_ELSE)) { fbreak; } }
    action tok_IN { if(emitToken(GLSL_IN)) { fbreak; } }
    action tok_OUT { if(emitToken(GLSL_OUT)) { fbreak; } }
    action tok_INOUT { if(emitToken(GLSL_INOUT)) { fbreak; } }
    action tok_FLOAT { if(emitToken(GLSL_FLOAT)) { fbreak; } }
    action tok_INT { if(emitToken(GLSL_INT)) { fbreak; } }
    action tok_VOID { if(emitToken(GLSL_VOID)) { fbreak; } }
    action tok_BOOL { if(emitToken(GLSL_BOOL)) { fbreak; } }
    action tok_TOK_TRUE { if(emitToken(GLSL_TOK_TRUE)) { fbreak; } }
    action tok_TOK_FALSE { if(emitToken(GLSL_TOK_FALSE)) { fbreak; } }
    action tok_INVARIANT { if(emitToken(GLSL_INVARIANT)) { fbreak; } }
    action tok_DISCARD { if(emitToken(GLSL_DISCARD)) { fbreak; } }
    action tok_RETURN { if(emitToken(GLSL_RETURN)) { fbreak; } }
    action tok_MAT2 { if(emitToken(GLSL_MAT2)) { fbreak; } }
    action tok_MAT3 { if(emitToken(GLSL_MAT3)) { fbreak; } }
    action tok_MAT4 { if(emitToken(GLSL_MAT4)) { fbreak; } }
    action tok_MAT2X2 { if(emitToken(GLSL_MAT2X2)) { fbreak; } }
    action tok_MAT2X3 { if(emitToken(GLSL_MAT2X3)) { fbreak; } }
    action tok_MAT2X4 { if(emitToken(GLSL_MAT2X4)) { fbreak; } }
    action tok_MAT3X2 { if(emitToken(GLSL_MAT3X2)) { fbreak; } }
    action tok_MAT3X3 { if(emitToken(GLSL_MAT3X3)) { fbreak; } }
    action tok_MAT3X4 { if(emitToken(GLSL_MAT3X4)) { fbreak; } }
    action tok_MAT4X2 { if(emitToken(GLSL_MAT4X2)) { fbreak; } }
    action tok_MAT4X3 { if(emitToken(GLSL_MAT4X3)) { fbreak; } }
    action tok_MAT4X4 { if(emitToken(GLSL_MAT4X4)) { fbreak; } }
    action tok_VEC2 { if(emitToken(GLSL_VEC2)) { fbreak; } }
    action tok_VEC3 { if(emitToken(GLSL_VEC3)) { fbreak; } }
    action tok_VEC4 { if(emitToken(GLSL_VEC4)) { fbreak; } }
    action tok_IVEC2 { if(emitToken(GLSL_IVEC2)) { fbreak; } }
    action tok_IVEC3 { if(emitToken(GLSL_IVEC3)) { fbreak; } }
    action tok_IVEC4 { if(emitToken(GLSL_IVEC4)) { fbreak; } }
    action tok_BVEC2 { if(emitToken(GLSL_BVEC2)) { fbreak; } }
    action tok_BVEC3 { if(emitToken(GLSL_BVEC3)) { fbreak; } }
    action tok_BVEC4 { if(emitToken(GLSL_BVEC4)) { fbreak; } }
    action tok_UINT { if(emitToken(GLSL_UINT)) { fbreak; } }
    action tok_UVEC2 { if(emitToken(GLSL_UVEC2)) { fbreak; } }
    action tok_UVEC3 { if(emitToken(GLSL_UVEC3)) { fbreak; } }
    action tok_UVEC4 { if(emitToken(GLSL_UVEC4)) { fbreak; } }
    action tok_LOWP { if(emitToken(GLSL_LOWP)) { fbreak; } }
    action tok_MEDIUMP { if(emitToken(GLSL_MEDIUMP)) { fbreak; } }
    action tok_HIGHP { if(emitToken(GLSL_HIGHP)) { fbreak; } }
    action tok_PRECISION { if(emitToken(GLSL_PRECISION)) { fbreak; } }
    action tok_SAMPLER1D { if(emitToken(GLSL_SAMPLER1D)) { fbreak; } }
    action tok_SAMPLER2D { if(emitToken(GLSL_SAMPLER2D)) { fbreak; } }
    action tok_SAMPLER3D { if(emitToken(GLSL_SAMPLER3D)) { fbreak; } }
    action tok_SAMPLERCUBE { if(emitToken(GLSL_SAMPLERCUBE)) { fbreak; } }
    action tok_SAMPLER1DSHADOW { if(emitToken(GLSL_SAMPLER1DSHADOW)) { fbreak; } }
    action tok_SAMPLER2DSHADOW { if(emitToken(GLSL_SAMPLER2DSHADOW)) { fbreak; } }
    action tok_SAMPLERCUBESHADOW { if(emitToken(GLSL_SAMPLERCUBESHADOW)) { fbreak; } }
    action tok_SAMPLER1DARRAY { if(emitToken(GLSL_SAMPLER1DARRAY)) { fbreak; } }
    action tok_SAMPLER2DARRAY { if(emitToken(GLSL_SAMPLER2DARRAY)) { fbreak; } }
    action tok_SAMPLER1DARRAYSHADOW { if(emitToken(GLSL_SAMPLER1DARRAYSHADOW)) { fbreak; } }
    action tok_SAMPLER2DARRAYSHADOW { if(emitToken(GLSL_SAMPLER2DARRAYSHADOW)) { fbreak; } }
    action tok_ISAMPLER1D { if(emitToken(GLSL_ISAMPLER1D)) { fbreak; } }
    action tok_ISAMPLER2D { if(emitToken(GLSL_ISAMPLER2D)) { fbreak; } }
    action tok_ISAMPLER3D { if(emitToken(GLSL_ISAMPLER3D)) { fbreak; } }
    action tok_ISAMPLERCUBE { if(emitToken(GLSL_ISAMPLERCUBE)) { fbreak; } }
    action tok_ISAMPLER1DARRAY { if(emitToken(GLSL_ISAMPLER1DARRAY)) { fbreak; } }
    action tok_ISAMPLER2DARRAY { if(emitToken(GLSL_ISAMPLER2DARRAY)) { fbreak; } }
    action tok_USAMPLER1D { if(emitToken(GLSL_USAMPLER1D)) { fbreak; } }
    action tok_USAMPLER2D { if(emitToken(GLSL_USAMPLER2D)) { fbreak; } }
    action tok_USAMPLER3D { if(emitToken(GLSL_USAMPLER3D)) { fbreak; } }
    action tok_USAMPLERCUBE { if(emitToken(GLSL_USAMPLERCUBE)) { fbreak; } }
    action tok_USAMPLER1DARRAY { if(emitToken(GLSL_USAMPLER1DARRAY)) { fbreak; } }
    action tok_USAMPLER2DARRAY { if(emitToken(GLSL_USAMPLER2DARRAY)) { fbreak; } }
    action tok_ISAMPLER2DRECT { if(emitToken(GLSL_ISAMPLER2DRECT)) { fbreak; } }
    action tok_USAMPLER2DRECT { if(emitToken(GLSL_USAMPLER2DRECT)) { fbreak; } }
    action tok_ISAMPLERBUFFER { if(emitToken(GLSL_ISAMPLERBUFFER)) { fbreak; } }
    action tok_USAMPLERBUFFER { if(emitToken(GLSL_USAMPLERBUFFER)) { fbreak; } }
    action tok_STRUCT { if(emitToken(GLSL_STRUCT)) { fbreak; } }
    action tok_LEFT_PAREN { if(emitToken(GLSL_LEFT_PAREN)) { fbreak; } }
    action tok_RIGHT_PAREN { if(emitToken(GLSL_RIGHT_PAREN)) { fbreak; } }
    action tok_PLUS { if(emitToken(GLSL_PLUS)) { fbreak; } }
    action tok_DASH { if(emitToken(GLSL_DASH)) { fbreak; } }
    action tok_BANG { if(emitToken(GLSL_BANG)) { fbreak; } }
    action tok_TILDE { if(emitToken(GLSL_TILDE)) { fbreak; } }
    action tok_EQUAL { if(emitToken(GLSL_EQUAL)) { fbreak; } }
    action tok_MUL_ASSIGN { if(emitToken(GLSL_MUL_ASSIGN)) { fbreak; } }
    action tok_DIV_ASSIGN { if(emitToken(GLSL_DIV_ASSIGN)) { fbreak; } }
    action tok_MOD_ASSIGN { if(emitToken(GLSL_MOD_ASSIGN)) { fbreak; } }
    action tok_ADD_ASSIGN { if(emitToken(GLSL_ADD_ASSIGN)) { fbreak; } }
    action tok_SUB_ASSIGN { if(emitToken(GLSL_SUB_ASSIGN)) { fbreak; } }
    action tok_LEFT_ASSIGN { if(emitToken(GLSL_LEFT_ASSIGN)) { fbreak; } }
    action tok_RIGHT_ASSIGN { if(emitToken(GLSL_RIGHT_ASSIGN)) { fbreak; } }
    action tok_AND_ASSIGN { if(emitToken(GLSL_AND_ASSIGN)) { fbreak; } }
    action tok_XOR_ASSIGN { if(emitToken(GLSL_XOR_ASSIGN)) { fbreak; } }
    action tok_OR_ASSIGN { if(emitToken(GLSL_OR_ASSIGN)) { fbreak; } }
    action tok_LEFT_OP { if(emitToken(GLSL_LEFT_OP)) { fbreak; } }
    action tok_RIGHT_OP { if(emitToken(GLSL_RIGHT_OP)) { fbreak; } }
    action tok_INC_OP { if(emitToken(GLSL_INC_OP)) { fbreak; } }
    action tok_DEC_OP { if(emitToken(GLSL_DEC_OP)) { fbreak; } }
    action tok_LE_OP { if(emitToken(GLSL_LE_OP)) { fbreak; } }
    action tok_GE_OP { if(emitToken(GLSL_GE_OP)) { fbreak; } }
    action tok_EQ_OP { if(emitToken(GLSL_EQ_OP)) { fbreak; } }
    action tok_NE_OP { if(emitToken(GLSL_NE_OP)) { fbreak; } }
    action tok_AND_OP { if(emitToken(GLSL_AND_OP)) { fbreak; } }
    action tok_OR_OP { if(emitToken(GLSL_OR_OP)) { fbreak; } }
    action tok_XOR_OP { if(emitToken(GLSL_XOR_OP)) { fbreak; } }
    action tok_ASSIGNMENT_OPERATOR { if(emitToken(GLSL_ASSIGNMENT_OPERATOR)) { fbreak; } }
    action tok_UNARY_OPERATOR { if(emitToken(GLSL_UNARY_OPERATOR)) { fbreak; } }
    action tok_PARENS { if(emitToken(GLSL_PARENS)) { fbreak; } }
    action tok_STAR { if(emitToken(GLSL_STAR)) { fbreak; } }
    action tok_SLASH { if(emitToken(GLSL_SLASH)) { fbreak; } }
    action tok_HIGH_PRECISION { if(emitToken(GLSL_HIGH_PRECISION)) { fbreak; } }
    action tok_MEDIUM_PRECISION { if(emitToken(GLSL_MEDIUM_PRECISION)) { fbreak; } }
    action tok_LOW_PRECISION { if(emitToken(GLSL_LOW_PRECISION)) { fbreak; } }
    action tok_LEFT_ANGLE { if(emitToken(GLSL_LEFT_ANGLE)) { fbreak; } }
    action tok_RIGHT_ANGLE { if(emitToken(GLSL_RIGHT_ANGLE)) { fbreak; } }
    action tok_VERTICAL_BAR { if(emitToken(GLSL_VERTICAL_BAR)) { fbreak; } }
    action tok_CARET { if(emitToken(GLSL_CARET)) { fbreak; } }
    action tok_AMPERSAND { if(emitToken(GLSL_AMPERSAND)) { fbreak; } }
    action tok_QUESTION { if(emitToken(GLSL_QUESTION)) { fbreak; } }
    action tok_LEFT_BRACKET { if(emitToken(GLSL_LEFT_BRACKET)) { fbreak; } }
    action tok_RIGHT_BRACKET { if(emitToken(GLSL_RIGHT_BRACKET)) { fbreak; } }
    action tok_LEFT_BRACE { if(emitToken(GLSL_LEFT_BRACE)) { fbreak; } }
    action tok_RIGHT_BRACE { if(emitToken(GLSL_RIGHT_BRACE)) { fbreak; } }
    action tok_DOT { if(emitToken(GLSL_DOT)) { fbreak; } }
    action tok_COMMA { if(emitToken(GLSL_COMMA)) { fbreak; } }
    action tok_SEMICOLON { if(emitToken(GLSL_SEMICOLON)) { fbreak; } }
    
    action tok_FLOATCONSTANT {
        if(emitToken(GLSL_FLOATCONSTANT)) { fbreak; }
    }

    action tok_INTCONSTANT {
        if(emitToken(GLSL_INTCONSTANT)) { fbreak; }
    }

    action tok_UINTCONSTANT {
        if(emitToken(GLSL_UINTCONSTANT)) { fbreak; }
    }

    action tok_IDENTIFIER {
        if(emitToken(GLSL_IDENTIFIER)) { fbreak; }
    }


    # action tok_KEYWORD {
    #     if(tok_start) {
    #         column+=tokenLen(tok_start, p);
    #         emitToken(tc, GLSL_NA, tok_start, p);
    #         tok_start = NULL;
    #     }
    # }

    # action tok_OPERATOR {
    #     if(tok_start) {
    #         column+=tokenLen(tok_start, p);
    #         emitToken(tc, GLSL_NA, tok_start, p);
    #         tok_start = NULL;
    #     }
    # }

    action column {
        tc.column+=1;
    }
    
    action tab_column {
        tc.column+=4; // huh?
    }
    
    action line {
        tc.column=1;
        tc.line+=1;
    }

    include glsl "glsl_tok.rl";




}%%



#include <stdio.h>
#include <stdlib.h>

#include "glsl.h"

#include <iostream>
#include <string>

#include "ParserState.h"

%% write data;


class TokenizerContext {
public:
    TokenizerContext() : line(1), column(1), parser(NULL), tok_start(NULL) {}
    std::string filename;
    int line;
    int column;
    void *parser;
    
    char *tok_start;

    char *p; 
    char *pe;

    ParserState ps;


    size_t tokenLen() {
        return p +1- tok_start;
    }

    bool emitToken(int id) {
        if(tok_start && tokenLen() > 0) {
            TokenizerContext& tc = *this;
            Token *t = new Token(id, std::string(tok_start, tokenLen()), tc.filename, tc.line, tc.column);
//            std::cout << "Token accepted : " << *t << std::endl;            
            glslparser(tc.parser, id, t, &ps);
            column += tokenLen();
            tok_start = NULL;
            if(ps.syntax_error) { /*p = pe; */return true;}// eww..
        }
        return false;
    }




    Node* glsl_parse(const std::string& filename) {
        int cs;
    //    char *begin = p;
        column = 1, line = 1;
        char *ts;
        char *te;
        int act;

        char *eof = pe;

        tok_start = NULL;
//        char *tok_start = NULL;

        TokenizerContext& tc = *this;
        tc.filename = filename;
        tc.parser = parser;

//        glslparserTrace(stdout, "-> ");

        %% write init;
        %% write exec;

        
        glslparser(tc.parser, 0, 0, &ps);

        if( cs >= glsl_first_final ) {
            printf("Matched\n");
        } else if(cs == glsl_error ){
            printf("Parse error at line %d, column %d\n", line, column);
        } else {
            printf("stopped at %d, %d\n", line, column );
        }
        
        if(ps.syntax_error) {
            std::cout << "Syntax error .." << std::endl;
        }

        return ps.result;
    }




};

Node* glsl_parse(void* parser, char *p, char *pe, const std::string& filename) {
    TokenizerContext tc;
    tc.parser = parser;
    tc.p = p;
    tc.pe = pe;
    return tc.glsl_parse(filename);
}

#include <cstring>
Node* glsl_parseString(const char* str) {
    void* pglslparser = glslparserAlloc (malloc);
    char* p = const_cast<char*>(str);
    char* pe = const_cast<char*>(str) + strlen(str);
    
    Node *tree = glsl_parse(pglslparser, p, pe, "(eval)");
    glslparserFree(pglslparser, free );

    return tree;
}

#include <stdexcept>
Node* glsl_parseFile(const char* fn) {
    FILE *f = fopen(fn, "r");
    if(!f) { throw std::runtime_error("Could not open file"); }
    fseek(f, 0, SEEK_END);

    off_t size = ftello(f);
    fseek(f, 0, SEEK_SET);


    char *p = static_cast<char*>(malloc(size));
    fread(p,size,1,f);
    char *pe = p + size;
    fclose(f);

    void* pglslparser = glslparserAlloc (malloc);

    Node *tree = glsl_parse(pglslparser, p, pe, fn);

    glslparserFree(pglslparser, free );

    free(p);
    return tree;
}





#define GLSL_ELSE               9999*0
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

    action tok_ATTRIBUTE { emitToken(GLSL_ATTRIBUTE); }
    action tok_CONST { emitToken(GLSL_CONST); }
    action tok_UNIFORM { emitToken(GLSL_UNIFORM); }
    action tok_VARYING { emitToken(GLSL_VARYING); }
    action tok_LAYOUT { emitToken(GLSL_LAYOUT); }
    action tok_CENTROID { emitToken(GLSL_CENTROID); }
    action tok_FLAT { emitToken(GLSL_FLAT); }
    action tok_SMOOTH { emitToken(GLSL_SMOOTH); }
    action tok_NOPERSPECTIVE { emitToken(GLSL_NOPERSPECTIVE); }
    action tok_BREAK { emitToken(GLSL_BREAK); }
    action tok_CONTINUE { emitToken(GLSL_CONTINUE); }
    action tok_DO { emitToken(GLSL_DO); }
    action tok_FOR { emitToken(GLSL_FOR); }
    action tok_WHILE { emitToken(GLSL_WHILE); }
    action tok_SWITCH { emitToken(GLSL_SWITCH); }
    action tok_CASE { emitToken(GLSL_CASE); }
    action tok_DEFAULT { emitToken(GLSL_DEFAULT); }
    action tok_IF { emitToken(GLSL_IF); }
    action tok_ELSE { emitToken(GLSL_ELSE); }
    action tok_IN { emitToken(GLSL_IN); }
    action tok_OUT { emitToken(GLSL_OUT); }
    action tok_INOUT { emitToken(GLSL_INOUT); }
    action tok_FLOAT { emitToken(GLSL_FLOAT); }
    action tok_INT { emitToken(GLSL_INT); }
    action tok_VOID { emitToken(GLSL_VOID); }
    action tok_BOOL { emitToken(GLSL_BOOL); }
    action tok_TOK_TRUE { emitToken(GLSL_TOK_TRUE); }
    action tok_TOK_FALSE { emitToken(GLSL_TOK_FALSE); }
    action tok_INVARIANT { emitToken(GLSL_INVARIANT); }
    action tok_DISCARD { emitToken(GLSL_DISCARD); }
    action tok_RETURN { emitToken(GLSL_RETURN); }
    action tok_MAT2 { emitToken(GLSL_MAT2); }
    action tok_MAT3 { emitToken(GLSL_MAT3); }
    action tok_MAT4 { emitToken(GLSL_MAT4); }
    action tok_MAT2X2 { emitToken(GLSL_MAT2X2); }
    action tok_MAT2X3 { emitToken(GLSL_MAT2X3); }
    action tok_MAT2X4 { emitToken(GLSL_MAT2X4); }
    action tok_MAT3X2 { emitToken(GLSL_MAT3X2); }
    action tok_MAT3X3 { emitToken(GLSL_MAT3X3); }
    action tok_MAT3X4 { emitToken(GLSL_MAT3X4); }
    action tok_MAT4X2 { emitToken(GLSL_MAT4X2); }
    action tok_MAT4X3 { emitToken(GLSL_MAT4X3); }
    action tok_MAT4X4 { emitToken(GLSL_MAT4X4); }
    action tok_VEC2 { emitToken(GLSL_VEC2); }
    action tok_VEC3 { emitToken(GLSL_VEC3); }
    action tok_VEC4 { emitToken(GLSL_VEC4); }
    action tok_IVEC2 { emitToken(GLSL_IVEC2); }
    action tok_IVEC3 { emitToken(GLSL_IVEC3); }
    action tok_IVEC4 { emitToken(GLSL_IVEC4); }
    action tok_BVEC2 { emitToken(GLSL_BVEC2); }
    action tok_BVEC3 { emitToken(GLSL_BVEC3); }
    action tok_BVEC4 { emitToken(GLSL_BVEC4); }
    action tok_UINT { emitToken(GLSL_UINT); }
    action tok_UVEC2 { emitToken(GLSL_UVEC2); }
    action tok_UVEC3 { emitToken(GLSL_UVEC3); }
    action tok_UVEC4 { emitToken(GLSL_UVEC4); }
    action tok_LOWP { emitToken(GLSL_LOWP); }
    action tok_MEDIUMP { emitToken(GLSL_MEDIUMP); }
    action tok_HIGHP { emitToken(GLSL_HIGHP); }
    action tok_PRECISION { emitToken(GLSL_PRECISION); }
    action tok_SAMPLER1D { emitToken(GLSL_SAMPLER1D); }
    action tok_SAMPLER2D { emitToken(GLSL_SAMPLER2D); }
    action tok_SAMPLER3D { emitToken(GLSL_SAMPLER3D); }
    action tok_SAMPLERCUBE { emitToken(GLSL_SAMPLERCUBE); }
    action tok_SAMPLER1DSHADOW { emitToken(GLSL_SAMPLER1DSHADOW); }
    action tok_SAMPLER2DSHADOW { emitToken(GLSL_SAMPLER2DSHADOW); }
    action tok_SAMPLERCUBESHADOW { emitToken(GLSL_SAMPLERCUBESHADOW); }
    action tok_SAMPLER1DARRAY { emitToken(GLSL_SAMPLER1DARRAY); }
    action tok_SAMPLER2DARRAY { emitToken(GLSL_SAMPLER2DARRAY); }
    action tok_SAMPLER1DARRAYSHADOW { emitToken(GLSL_SAMPLER1DARRAYSHADOW); }
    action tok_SAMPLER2DARRAYSHADOW { emitToken(GLSL_SAMPLER2DARRAYSHADOW); }
    action tok_ISAMPLER1D { emitToken(GLSL_ISAMPLER1D); }
    action tok_ISAMPLER2D { emitToken(GLSL_ISAMPLER2D); }
    action tok_ISAMPLER3D { emitToken(GLSL_ISAMPLER3D); }
    action tok_ISAMPLERCUBE { emitToken(GLSL_ISAMPLERCUBE); }
    action tok_ISAMPLER1DARRAY { emitToken(GLSL_ISAMPLER1DARRAY); }
    action tok_ISAMPLER2DARRAY { emitToken(GLSL_ISAMPLER2DARRAY); }
    action tok_USAMPLER1D { emitToken(GLSL_USAMPLER1D); }
    action tok_USAMPLER2D { emitToken(GLSL_USAMPLER2D); }
    action tok_USAMPLER3D { emitToken(GLSL_USAMPLER3D); }
    action tok_USAMPLERCUBE { emitToken(GLSL_USAMPLERCUBE); }
    action tok_USAMPLER1DARRAY { emitToken(GLSL_USAMPLER1DARRAY); }
    action tok_USAMPLER2DARRAY { emitToken(GLSL_USAMPLER2DARRAY); }
    action tok_ISAMPLER2DRECT { emitToken(GLSL_ISAMPLER2DRECT); }
    action tok_USAMPLER2DRECT { emitToken(GLSL_USAMPLER2DRECT); }
    action tok_ISAMPLERBUFFER { emitToken(GLSL_ISAMPLERBUFFER); }
    action tok_USAMPLERBUFFER { emitToken(GLSL_USAMPLERBUFFER); }
    action tok_STRUCT { emitToken(GLSL_STRUCT); }
    action tok_LEFT_PAREN { emitToken(GLSL_LEFT_PAREN); }
    action tok_RIGHT_PAREN { emitToken(GLSL_RIGHT_PAREN); }
    action tok_PLUS { emitToken(GLSL_PLUS); }
    action tok_DASH { emitToken(GLSL_DASH); }
    action tok_BANG { emitToken(GLSL_BANG); }
    action tok_TILDE { emitToken(GLSL_TILDE); }
    action tok_EQUAL { emitToken(GLSL_EQUAL); }
    action tok_MUL_ASSIGN { emitToken(GLSL_MUL_ASSIGN); }
    action tok_DIV_ASSIGN { emitToken(GLSL_DIV_ASSIGN); }
    action tok_MOD_ASSIGN { emitToken(GLSL_MOD_ASSIGN); }
    action tok_ADD_ASSIGN { emitToken(GLSL_ADD_ASSIGN); }
    action tok_SUB_ASSIGN { emitToken(GLSL_SUB_ASSIGN); }
    action tok_LEFT_ASSIGN { emitToken(GLSL_LEFT_ASSIGN); }
    action tok_RIGHT_ASSIGN { emitToken(GLSL_RIGHT_ASSIGN); }
    action tok_AND_ASSIGN { emitToken(GLSL_AND_ASSIGN); }
    action tok_XOR_ASSIGN { emitToken(GLSL_XOR_ASSIGN); }
    action tok_OR_ASSIGN { emitToken(GLSL_OR_ASSIGN); }
    action tok_LEFT_OP { emitToken(GLSL_LEFT_OP); }
    action tok_RIGHT_OP { emitToken(GLSL_RIGHT_OP); }
    action tok_INC_OP { emitToken(GLSL_INC_OP); }
    action tok_DEC_OP { emitToken(GLSL_DEC_OP); }
    action tok_LE_OP { emitToken(GLSL_LE_OP); }
    action tok_GE_OP { emitToken(GLSL_GE_OP); }
    action tok_EQ_OP { emitToken(GLSL_EQ_OP); }
    action tok_NE_OP { emitToken(GLSL_NE_OP); }
    action tok_AND_OP { emitToken(GLSL_AND_OP); }
    action tok_OR_OP { emitToken(GLSL_OR_OP); }
    action tok_XOR_OP { emitToken(GLSL_XOR_OP); }
    action tok_ASSIGNMENT_OPERATOR { emitToken(GLSL_ASSIGNMENT_OPERATOR); }
    action tok_UNARY_OPERATOR { emitToken(GLSL_UNARY_OPERATOR); }
    action tok_PARENS { emitToken(GLSL_PARENS); }
    action tok_STAR { emitToken(GLSL_STAR); }
    action tok_SLASH { emitToken(GLSL_SLASH); }
    action tok_HIGH_PRECISION { emitToken(GLSL_HIGH_PRECISION); }
    action tok_MEDIUM_PRECISION { emitToken(GLSL_MEDIUM_PRECISION); }
    action tok_LOW_PRECISION { emitToken(GLSL_LOW_PRECISION); }
    action tok_LEFT_ANGLE { emitToken(GLSL_LEFT_ANGLE); }
    action tok_RIGHT_ANGLE { emitToken(GLSL_RIGHT_ANGLE); }
    action tok_VERTICAL_BAR { emitToken(GLSL_VERTICAL_BAR); }
    action tok_CARET { emitToken(GLSL_CARET); }
    action tok_AMPERSAND { emitToken(GLSL_AMPERSAND); }
    action tok_QUESTION { emitToken(GLSL_QUESTION); }
    action tok_LEFT_BRACKET { emitToken(GLSL_LEFT_BRACKET); }
    action tok_RIGHT_BRACKET { emitToken(GLSL_RIGHT_BRACKET); }
    action tok_LEFT_BRACE { emitToken(GLSL_LEFT_BRACE); }
    action tok_RIGHT_BRACE { emitToken(GLSL_RIGHT_BRACE); }
    action tok_DOT { emitToken(GLSL_DOT); }
    action tok_COMMA { emitToken(GLSL_COMMA); }
    action tok_SEMICOLON { emitToken(GLSL_SEMICOLON); }
    
    action tok_FLOATCONSTANT {
        emitToken(GLSL_FLOATCONSTANT);
    }

    action tok_INTCONSTANT {
        emitToken(GLSL_INTCONSTANT);
    }

    action tok_UINTCONSTANT {
        emitToken(GLSL_UINTCONSTANT);
    }

    action tok_IDENTIFIER {
        emitToken(GLSL_IDENTIFIER);
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

%% write data;

extern Node* result;
extern bool syntax_error;


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



    size_t tokenLen() {
        return p +1- tok_start;
    }

    void emitToken(int id) {
        if(tok_start) {
            TokenizerContext& tc = *this;
            Token *t = new Token(id, std::string(tok_start, tokenLen()), tc.filename, tc.line, tc.column);
            std::cout << "Token accepted : " << *t << std::endl;
            glslparser(tc.parser, id, t);
            column += tokenLen();
            tok_start = NULL;
            if(syntax_error) p = pe; // eww..
        }
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

        glslparserTrace(stdout, "-> ");

        %% write init;
        %% write exec;

        glslparser(tc.parser, 0, 0);

        if( cs >= glsl_first_final ) {
            printf("Matched\n");
        } else if(cs == glsl_error ){
            printf("Parse error at line %d, column %d\n", line, column);
        } else {
            printf("stopped at %d, %d\n", line, column );
        }
        
        if(syntax_error) {
            std::cout << "Syntax error .." << std::endl;
        }

        return result;
    }




};

Node* glsl_parse(void* parser, char *p, char *pe, const std::string& filename) {
    TokenizerContext tc;
    tc.parser = parser;
    tc.p = p;
    tc.pe = pe;
    return tc.glsl_parse(filename);
}


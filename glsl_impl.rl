
enum tokens {
    
    ATTRIBUTE,CONST,UNIFORM,VARYING,LAYOUT,CENTROID,FLAT,SMOOTH,NOPERSPECTIVE,BREAK,CONTINUE,DO,FOR,WHILE,SWITCH,CASE,DEFAULT,IF,ELSE,IN,OUT,INOUT,FLOAT,INT,VOID,BOOL,TOK_TRUE,TOK_FALSE,INVARIANT,DISCARD,RETURN,MAT2,MAT3,MAT4,MAT2X2,MAT2X3,MAT2X4,MAT3X2,MAT3X3,MAT3X4,MAT4X2,MAT4X3,MAT4X4,VEC2,VEC3,VEC4,IVEC2,IVEC3,IVEC4,BVEC2,BVEC3,BVEC4,UINT,UVEC2,UVEC3,UVEC4,LOWP,MEDIUMP,HIGHP,PRECISION,SAMPLER1D,SAMPLER2D,SAMPLER3D,SAMPLERCUBE,SAMPLER1DSHADOW,SAMPLER2DSHADOW,SAMPLERCUBESHADOW,SAMPLER1DARRAY,SAMPLER2DARRAY,SAMPLER1DARRAYSHADOW,SAMPLER2DARRAYSHADOW,ISAMPLER1D,ISAMPLER2D,ISAMPLER3D,ISAMPLERCUBE,ISAMPLER1DARRAY,ISAMPLER2DARRAY,USAMPLER1D,USAMPLER2D,USAMPLER3D,USAMPLERCUBE,USAMPLER1DARRAY,USAMPLER2DARRAY,SAMPLER2DRECT,SAMPLER2DRECTSHADOW,ISAMPLER2DRECT,USAMPLER2DRECT,SAMPLERBUFFER,ISAMPLERBUFFER,USAMPLERBUFFER,STRUCT
};



%%{

    machine glsl;

    action tok_start {
        tok_start = p;
    }

    action tok_ATTRIBUTE {
        token(parser, ATTRIBUTE);
    }
    action tok_CONST {
        token(parser, CONST);
    }
    action tok_UNIFORM {
        token(parser, UNIFORM);
    }
    action tok_VARYING {
        token(parser, VARYING);
    }
    action tok_LAYOUT {
        token(parser, LAYOUT);
    }
    action tok_CENTROID {
        token(parser, CENTROID);
    }
    action tok_FLAT {
        token(parser, FLAT);
    }
    action tok_SMOOTH {
        token(parser, SMOOTH);
    }
    action tok_NOPERSPECTIVE {
        token(parser, NOPERSPECTIVE);
    }
    action tok_BREAK {
        token(parser, BREAK);
    }
    action tok_CONTINUE {
        token(parser, CONTINUE);
    }
    action tok_DO {
        token(parser, DO);
    }
    action tok_FOR {
        token(parser, FOR);
    }
    action tok_WHILE {
        token(parser, WHILE);
    }
    action tok_SWITCH {
        token(parser, SWITCH);
    }
    action tok_CASE {
        token(parser, CASE);
    }
    action tok_DEFAULT {
        token(parser, DEFAULT);
    }
    action tok_IF {
        token(parser, IF);
    }
    action tok_ELSE {
        token(parser, ELSE);
    }
    action tok_IN {
        token(parser, IN);
    }
    action tok_OUT {
        token(parser, OUT);
    }
    action tok_INOUT {
        token(parser, INOUT);
    }
    action tok_FLOAT {
        token(parser, FLOAT);
    }
    action tok_INT {
        token(parser, INT);
    }
    action tok_VOID {
        token(parser, VOID);
    }
    action tok_BOOL {
        token(parser, BOOL);
    }
    action tok_TRUE {
        token(parser, TOK_TRUE);
    }
    action tok_FALSE {
        token(parser, TOK_FALSE);
    }
    action tok_INVARIANT {
        token(parser, INVARIANT);
    }
    action tok_DISCARD {
        token(parser, DISCARD);
    }
    action tok_RETURN {
        token(parser, RETURN);
    }
    action tok_MAT2 {
        token(parser, MAT2);
    }
    action tok_MAT3 {
        token(parser, MAT3);
    }
    action tok_MAT4 {
        token(parser, MAT4);
    }
    action tok_MAT2X2 {
        token(parser, MAT2X2);
    }
    action tok_MAT2X3 {
        token(parser, MAT2X3);
    }
    action tok_MAT2X4 {
        token(parser, MAT2X4);
    }
    action tok_MAT3X2 {
        token(parser, MAT3X2);
    }
    action tok_MAT3X3 {
        token(parser, MAT3X3);
    }
    action tok_MAT3X4 {
        token(parser, MAT3X4);
    }
    action tok_MAT4X2 {
        token(parser, MAT4X2);
    }
    action tok_MAT4X3 {
        token(parser, MAT4X3);
    }
    action tok_MAT4X4 {
        token(parser, MAT4X4);
    }
    action tok_VEC2 {
        token(parser, VEC2);
    }
    action tok_VEC3 {
        token(parser, VEC3);
    }
    action tok_VEC4 {
        token(parser, VEC4);
    }
    action tok_IVEC2 {
        token(parser, IVEC2);
    }
    action tok_IVEC3 {
        token(parser, IVEC3);
    }
    action tok_IVEC4 {
        token(parser, IVEC4);
    }
    action tok_BVEC2 {
        token(parser, BVEC2);
    }
    action tok_BVEC3 {
        token(parser, BVEC3);
    }
    action tok_BVEC4 {
        token(parser, BVEC4);
    }
    action tok_UINT {
        token(parser, UINT);
    }
    action tok_UVEC2 {
        token(parser, UVEC2);
    }
    action tok_UVEC3 {
        token(parser, UVEC3);
    }
    action tok_UVEC4 {
        token(parser, UVEC4);
    }
    action tok_LOWP {
        token(parser, LOWP);
    }
    action tok_MEDIUMP {
        token(parser, MEDIUMP);
    }
    action tok_HIGHP {
        token(parser, HIGHP);
    }
    action tok_PRECISION {
        token(parser, PRECISION);
    }
    action tok_SAMPLER1D {
        token(parser, SAMPLER1D);
    }
    action tok_SAMPLER2D {
        token(parser, SAMPLER2D);
    }
    action tok_SAMPLER3D {
        token(parser, SAMPLER3D);
    }
    action tok_SAMPLERCUBE {
        token(parser, SAMPLERCUBE);
    }
    action tok_SAMPLER1DSHADOW {
        token(parser, SAMPLER1DSHADOW);
    }
    action tok_SAMPLER2DSHADOW {
        token(parser, SAMPLER2DSHADOW);
    }
    action tok_SAMPLERCUBESHADOW {
        token(parser, SAMPLERCUBESHADOW);
    }
    action tok_SAMPLER1DARRAY {
        token(parser, SAMPLER1DARRAY);
    }
    action tok_SAMPLER2DARRAY {
        token(parser, SAMPLER2DARRAY);
    }
    action tok_SAMPLER1DARRAYSHADOW {
        token(parser, SAMPLER1DARRAYSHADOW);
    }
    action tok_SAMPLER2DARRAYSHADOW {
        token(parser, SAMPLER2DARRAYSHADOW);
    }
    action tok_ISAMPLER1D {
        token(parser, ISAMPLER1D);
    }
    action tok_ISAMPLER2D {
        token(parser, ISAMPLER2D);
    }
    action tok_ISAMPLER3D {
        token(parser, ISAMPLER3D);
    }
    action tok_ISAMPLERCUBE {
        token(parser, ISAMPLERCUBE);
    }
    action tok_ISAMPLER1DARRAY {
        token(parser, ISAMPLER1DARRAY);
    }
    action tok_ISAMPLER2DARRAY {
        token(parser, ISAMPLER2DARRAY);
    }
    action tok_USAMPLER1D {
        token(parser, USAMPLER1D);
    }
    action tok_USAMPLER2D {
        token(parser, USAMPLER2D);
    }
    action tok_USAMPLER3D {
        token(parser, USAMPLER3D);
    }
    action tok_USAMPLERCUBE {
        token(parser, USAMPLERCUBE);
    }
    action tok_USAMPLER1DARRAY {
        token(parser, USAMPLER1DARRAY);
    }
    action tok_USAMPLER2DARRAY {
        token(parser, USAMPLER2DARRAY);
    }
    action tok_SAMPLER2DRECT {
        token(parser, SAMPLER2DRECT);
    }
    action tok_SAMPLER2DRECTSHADOW {
        token(parser, SAMPLER2DRECTSHADOW);
    }
    action tok_ISAMPLER2DRECT {
        token(parser, ISAMPLER2DRECT);
    }
    action tok_USAMPLER2DRECT {
        token(parser, USAMPLER2DRECT);
    }
    action tok_SAMPLERBUFFER {
        token(parser, SAMPLERBUFFER);
    }
    action tok_ISAMPLERBUFFER {
        token(parser, ISAMPLERBUFFER);
    }
    action tok_USAMPLERBUFFER {
        token(parser, USAMPLERBUFFER);
    }
    action tok_STRUCT {
        token(parser, STRUCT);
    }


    action tok_FLOATCONSTANT {
        if(tok_start) {
            column+=tokenLen(tok_start, p);
            emitToken(tc, GLSL_FLOATCONSTANT, tok_start, p);
            tok_start = NULL;
        }
    }

    action tok_INTCONSTANT {
        if(tok_start) {
            column+=tokenLen(tok_start, p);
            emitToken(tc, GLSL_INTCONSTANT, tok_start, p);
            tok_start = NULL;
        }
    }

    action tok_UINTCONSTANT {
        if(tok_start) {
            column+=tokenLen(tok_start, p);
            emitToken(tc, GLSL_UINTCONSTANT, tok_start, p);
            tok_start = NULL;
        }
    }

    action tok_IDENTIFIER {
        if(tok_start) {
            column+=tokenLen(tok_start, p);
            emitToken(tc, GLSL_IDENTIFIER, tok_start, p);
            tok_start = NULL;
        }
    }

    action tok_KEYWORD {
        if(tok_start) {
            column+=tokenLen(tok_start, p);
            emitToken(tc, GLSL_NA, tok_start, p);
            tok_start = NULL;
        }
    }

    action tok_OPERATOR {
        if(tok_start) {
            column+=tokenLen(tok_start, p);
            emitToken(tc, GLSL_NA, tok_start, p);
            tok_start = NULL;
        }
    }

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

#define GLSL_NA 999

#include <stdio.h>
#include <stdlib.h>

#include "glsl.h"

#include <iostream>
#include <string>

class TokenizerContext {
public:
    TokenizerContext() : line(1), column(1), parser(NULL) {}
    std::string filename;
    int line;
    int column;
    void *parser;
};



size_t tokenLen(char *p, char *pe) {
    return pe+1 - p;
}

void emitToken(TokenizerContext& tc, int id, char *p, char *pe) {

    glslparser(tc.parser, id, new Token(id, std::string(p, tokenLen(p, pe)), tc.filename, tc.line, tc.column));
}


void printToken(char * , char * , char * ) {
//    printf("%s value: '", type);
//    while(p != pe+1) {
//        fputc(*p, stdout);
//        ++p;
//    }

//    printf("'\n");
}

void token(void*, int ) {
//    printf("Token %d\n", t);
}



%% write data;
extern Node* result;

Node* glsl_parse(void* parser, char *p, char *pe, const std::string& filename) {
    int column = 1, line =1;
    int cs;
//    char *begin = p;

    char *ts;
    char *te;
    int act;

    char *eof = pe;


    char *tok_start = NULL;

    TokenizerContext tc;
    tc.filename = filename;
    tc.parser = parser;
    
    %% write init;
    %% write exec;

    if( cs >= glsl_first_final ) {
        printf("Matched\n");
    } else if(cs == glsl_error ){
        printf("Parse error at line %d, column %d\n", line, column);
    } else {
        printf("stopped at %d, %d\n", line, column );
    }

    return result;
}




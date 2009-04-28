%%{

    machine glsl;

    # keywords
    ATTRIBUTE = "attribute" % tok_ATTRIBUTE;
    CONST = "const" % tok_CONST;
    UNIFORM = "uniform" % tok_UNIFORM;
    VARYING = "varying" % tok_VARYING;
    LAYOUT = "layout" % tok_LAYOUT;
    CENTROID = "centroid" % tok_CENTROID;
    FLAT = "flat" % tok_FLAT;
    SMOOTH = "smooth" % tok_SMOOTH;
    NOPERSPECTIVE = "noperspective" % tok_NOPERSPECTIVE;
    BREAK = "break" % tok_BREAK;
    CONTINUE = "continue" % tok_CONTINUE;
    DO = "do" % tok_DO;
    FOR = "for" % tok_FOR;
    WHILE = "while" % tok_WHILE;
    SWITCH = "switch" % tok_SWITCH;
    CASE = "case" % tok_CASE;
    DEFAULT = "default" % tok_DEFAULT;
    IF = "if" % tok_IF;
    ELSE = "else" % tok_ELSE;
    IN = "in" % tok_IN;
    OUT = "out" % tok_OUT;
    INOUT = "inout" % tok_INOUT;
    FLOAT = "float" % tok_FLOAT;
    INT = "int" % tok_INT;
    VOID = "void" % tok_VOID;
    BOOL = "bool" % tok_BOOL;
    TOK_TRUE = "true" % tok_TRUE;
    TOK_FALSE = "false" % tok_FALSE;
    INVARIANT = "invariant" % tok_INVARIANT;
    DISCARD = "discard" % tok_DISCARD;
    RETURN = "return" % tok_RETURN;
    MAT2 = "mat2" % tok_MAT2;
    MAT3 = "mat3" % tok_MAT3;
    MAT4 = "mat4" % tok_MAT4;
    MAT2X2 = "mat2x2" % tok_MAT2X2;
    MAT2X3 = "mat2x3" % tok_MAT2X3;
    MAT2X4 = "mat2x4" % tok_MAT2X4;
    MAT3X2 = "mat3x2" % tok_MAT3X2;
    MAT3X3 = "mat3x3" % tok_MAT3X3;
    MAT3X4 = "mat3x4" % tok_MAT3X4;
    MAT4X2 = "mat4x2" % tok_MAT4X2;
    MAT4X3 = "mat4x3" % tok_MAT4X3;
    MAT4X4 = "mat4x4" % tok_MAT4X4;
    VEC2 = "vec2" % tok_VEC2;
    VEC3 = "vec3" % tok_VEC3;
    VEC4 = "vec4" % tok_VEC4;
    IVEC2 = "ivec2" % tok_IVEC2;
    IVEC3 = "ivec3" % tok_IVEC3;
    IVEC4 = "ivec4" % tok_IVEC4;
    BVEC2 = "bvec2" % tok_BVEC2;
    BVEC3 = "bvec3" % tok_BVEC3;
    BVEC4 = "bvec4" % tok_BVEC4;
    UINT = "uint" % tok_UINT;
    UVEC2 = "uvec2" % tok_UVEC2;
    UVEC3 = "uvec3" % tok_UVEC3;
    UVEC4 = "uvec4" % tok_UVEC4;
    LOWP = "lowp" % tok_LOWP;
    MEDIUMP = "mediump" % tok_MEDIUMP;
    HIGHP = "highp" % tok_HIGHP;
    PRECISION = "precision" % tok_PRECISION;
    SAMPLER1D = "sampler1D" % tok_SAMPLER1D;
    SAMPLER2D = "sampler2D" % tok_SAMPLER2D;
    SAMPLER3D = "sampler3D" % tok_SAMPLER3D;
    SAMPLERCUBE = "samplerCube" % tok_SAMPLERCUBE;
    SAMPLER1DSHADOW = "sampler1DShadow" % tok_SAMPLER1DSHADOW;
    SAMPLER2DSHADOW = "sampler2DShadow" % tok_SAMPLER2DSHADOW;
    SAMPLERCUBESHADOW = "samplerCubeShadow" % tok_SAMPLERCUBESHADOW;
    SAMPLER1DARRAY = "sampler1DArray" % tok_SAMPLER1DARRAY;
    SAMPLER2DARRAY = "sampler2DArray" % tok_SAMPLER2DARRAY;
    SAMPLER1DARRAYSHADOW = "sampler1DArrayShadow" % tok_SAMPLER1DARRAYSHADOW;
    SAMPLER2DARRAYSHADOW = "sampler2DArrayShadow" % tok_SAMPLER2DARRAYSHADOW;
    ISAMPLER1D = "isampler1D" % tok_ISAMPLER1D;
    ISAMPLER2D = "isampler2D" % tok_ISAMPLER2D;
    ISAMPLER3D = "isampler3D" % tok_ISAMPLER3D;
    ISAMPLERCUBE = "isamplerCube" % tok_ISAMPLERCUBE;
    ISAMPLER1DARRAY = "isampler1DArray" % tok_ISAMPLER1DARRAY;
    ISAMPLER2DARRAY = "isampler2DArray" % tok_ISAMPLER2DARRAY;
    USAMPLER1D = "usampler1D" % tok_USAMPLER1D;
    USAMPLER2D = "usampler2D" % tok_USAMPLER2D;
    USAMPLER3D = "usampler3D" % tok_USAMPLER3D;
    USAMPLERCUBE = "usamplerCube" % tok_USAMPLERCUBE;
    USAMPLER1DARRAY = "usampler1DArray" % tok_USAMPLER1DARRAY;
    USAMPLER2DARRAY = "usampler2DArray" % tok_USAMPLER2DARRAY;
    SAMPLER2DRECT = "sampler2DRect" % tok_SAMPLER2DRECT;
    SAMPLER2DRECTSHADOW = "sampler2DRectShadow" % tok_SAMPLER2DRECTSHADOW;
    ISAMPLER2DRECT = "isampler2DRect" % tok_ISAMPLER2DRECT;
    USAMPLER2DRECT = "usampler2DRect" % tok_USAMPLER2DRECT;
    SAMPLERBUFFER = "samplerBuffer" % tok_SAMPLERBUFFER;
    ISAMPLERBUFFER = "isamplerBuffer" % tok_ISAMPLERBUFFER;
    USAMPLERBUFFER = "usamplerBuffer" % tok_USAMPLERBUFFER;
    STRUCT = "struct" % tok_STRUCT;

    # reserved keywords
      COMMON = "common";
      PARTITION = "partition";
      ACTIVE = "active";
      ASM = "asm";
      CLASS = "class";
      UNION = "union";
      ENUM = "enum";
      TYPEDEF = "typedef";
      TEMPLATE = "template";
      THIS = "this";
      PACKED = "packed";
      GOTO = "goto";
      INLINE = "inline";
      NOINLINE = "noinline";
      VOLATILE = "volatile";
      PUBLIC = "public";
      STATIC = "static";
      EXTERN = "extern";
      EXTERNAL = "external";
      INTERFACE = "interface";
      LONG = "long";
      SHORT = "short";
      DOUBLE = "double";
      HALF = "half";
      FIXED = "fixed";
      UNSIGNED = "unsigned";
      SUPERP = "superp";
      INPUT = "input";
      OUTPUT = "output";
      HVEC2 = "hvec2";
      HVEC3 = "hvec3";
      HVEC4 = "hvec4";
      DVEC2 = "dvec2";
      DVEC3 = "dvec3";
      DVEC4 = "dvec4";
      FVEC2 = "fvec2";
      FVEC3 = "fvec3";
      FVEC4 = "fvec4";
      SAMPLER3DRECT = "sampler3DRect";
      FILTER = "filter";
      IMAGE1D = "image1D";
      IMAGE2D = "image2D";
      IMAGE3D = "image3D";
      IMAGECUBE = "imageCube";
      IIMAGE1D = "iimage1D";
      IIMAGE2D = "iimage2D";
      IIMAGE3D = "iimage3D";
      IIMAGECUBE = "iimageCube";
      UIMAGE1D = "uimage1D";
      UIMAGE2D = "uimage2D";
      UIMAGE3D = "uimage3D";
      UIMAGECUBE = "uimageCube";
      IMAGE1DARRAY = "image1DArray";
      IMAGE2DARRAY = "image2DArray";
      IIMAGE1DARRAY = "iimage1DArray";
      IIMAGE2DARRAY = "iimage2DArray";
      UIMAGE1DARRAY = "uimage1DArray";
      UIMAGE2DARRAY = "uimage2DArray";
      IMAGE1DSHADOW = "image1DShadow";
      IMAGE2DSHADOW = "image2DShadow";
      IMAGE1DARRAYSHADOW = "image1DArrayShadow";
      IMAGE2DARRAYSHADOW = "image2DArrayShadow";
      IMAGEBUFFER = "imageBuffer";
      IIMAGEBUFFER = "iimageBuffer";
      UIMAGEBUFFER = "uimageBuffer";
      SIZEOF = "sizeof";
      CAST = "cast";
      NAMESPACE = "namespace";
      USING = "using";
      ROW_MAJOR = "row_major";


    RESERVED_KEYWORDS =   COMMON | PARTITION | ACTIVE | ASM | CLASS | UNION | ENUM | TYPEDEF | TEMPLATE | THIS | PACKED | GOTO | INLINE |
      NOINLINE | VOLATILE | PUBLIC | STATIC | EXTERN | EXTERNAL | INTERFACE | LONG | SHORT | DOUBLE | HALF | FIXED |
      UNSIGNED | SUPERP | INPUT | OUTPUT | HVEC2 | HVEC3 | HVEC4 | DVEC2 | DVEC3 | DVEC4 | FVEC2 | FVEC3 | FVEC4 |
      SAMPLER2DRECT | SAMPLER3DRECT | SAMPLER2DRECTSHADOW | SAMPLERBUFFER | FILTER | IMAGE1D | IMAGE2D | IMAGE3D |
      IMAGECUBE | IIMAGE1D | IIMAGE2D | IIMAGE3D | IIMAGECUBE | UIMAGE1D | UIMAGE2D | UIMAGE3D | UIMAGECUBE |
      IMAGE1DARRAY | IMAGE2DARRAY | IIMAGE1DARRAY | IIMAGE2DARRAY | UIMAGE1DARRAY | UIMAGE2DARRAY | IMAGE1DSHADOW |
      IMAGE2DSHADOW | IMAGE1DARRAYSHADOW | IMAGE2DARRAYSHADOW | IMAGEBUFFER | IIMAGEBUFFER | UIMAGEBUFFER | SIZEOF | CAST
      | NAMESPACE | USING | ROW_MAJOR ;




    KEYWORD = ATTRIBUTE | CONST | UNIFORM | VARYING | LAYOUT | CENTROID | FLAT | SMOOTH | NOPERSPECTIVE | BREAK | CONTINUE | DO |
    FOR | WHILE | SWITCH | CASE | DEFAULT | IF | ELSE | IN | OUT | INOUT | FLOAT | INT | VOID | BOOL | TOK_TRUE | TOK_FALSE |
    INVARIANT | DISCARD | RETURN | MAT2 | MAT3 | MAT4 | MAT2X2 | MAT2X3 | MAT2X4 | MAT3X2 | MAT3X3 | MAT3X4 | MAT4X2 |
    MAT4X3 | MAT4X4 | VEC2 | VEC3 | VEC4 | IVEC2 | IVEC3 | IVEC4 | BVEC2 | BVEC3 | BVEC4 | UINT | UVEC2 | UVEC3 | UVEC4
    | LOWP | MEDIUMP | HIGHP | PRECISION | SAMPLER1D | SAMPLER2D | SAMPLER3D | SAMPLERCUBE | SAMPLER1DSHADOW |
    SAMPLER2DSHADOW | SAMPLERCUBESHADOW | SAMPLER1DARRAY | SAMPLER2DARRAY | SAMPLER1DARRAYSHADOW | SAMPLER2DARRAYSHADOW
    | ISAMPLER1D | ISAMPLER2D | ISAMPLER3D | ISAMPLERCUBE | ISAMPLER1DARRAY | ISAMPLER2DARRAY | USAMPLER1D | USAMPLER2D
    | USAMPLER3D | USAMPLERCUBE | USAMPLER1DARRAY | USAMPLER2DARRAY  | 
    ISAMPLER2DRECT | USAMPLER2DRECT  | ISAMPLERBUFFER | USAMPLERBUFFER | STRUCT;


    nondigit = alpha | "_";
    

    IDENTIFIER = nondigit (nondigit | digit)*;

    TYPE_NAME = any;
    
    
    octal_digit = [01234567];
    nonzero_digit = [123456789];
    integer_suffix = ("u" | "U");
    decimal = "0" | (nonzero_digit digit*);
    octal = "0" octal_digit+;
    hexadecimal = "0" [xX] xdigit+;


    float_suffix = [fF];
    sign = ("+" | "-");
    exponent_part = [eE] sign? digit+;
    fraction = (digit+ "." digit+) | ("." digit+) | (digit+ ".");
        
    FLOATCONSTANT = ((fraction exponent_part? float_suffix?) | (digit+ exponent_part? float_suffix) ) ;
    INTCONSTANT = ((decimal | octal | hexadecimal) integer_suffix?) ;
    UINTCONSTANT = INTCONSTANT; ## ?
    BOOLCONSTANT = TOK_TRUE | TOK_FALSE; 

    LEFT_OP  = "<<"; #?
    RIGHT_OP  = ">>"; #?
    
    INC_OP  = "++";
    DEC_OP  = "--";
    LE_OP  = "<";
    GE_OP  = ">";
    EQ_OP  = "==";
    NE_OP  = "!=";    
    AND_OP = "&";
    OR_OP = "|";
    XOR_OP = "^";
    MUL_ASSIGN = "*=";
    DIV_ASSIGN = "/=";
    ADD_ASSIGN = "+=";
    MOD_ASSIGN      = "%=";
    LEFT_ASSIGN = "<<=";
    RIGHT_ASSIGN = ">>=";
    AND_ASSIGN = "&=";
    XOR_ASSIGN = "^=";
    OR_ASSIGN = "|=";
    SUB_ASSIGN      = "-=";

    LEFT_PAREN = "(";
    RIGHT_PAREN = ")";
    LEFT_BRACKET = "[";
    RIGHT_BRACKET = "]";
    LEFT_BRACE = "{";
    RIGHT_BRACE = "}";
    DOT = ".";

    COMMA = ",";
    COLON = ":";
    EQUAL = "=";
    SEMICOLON = ";";
    BANG = "!";
    DASH = "-";
    TILDE = "~";
    PLUS = "+";
    STAR = "*";
    SLASH = "/";
    PERCENT = "%";

    LEFT_ANGLE = "<";
    RIGHT_ANGLE = ">";
    VERTICAL_BAR = "|";
    CARET = "^";
    AMPERSAND = "&";
    QUESTION = "?";


    PARENS = LEFT_PAREN | RIGHT_PAREN;

    UNARY_OPERATOR=
            PLUS |
            DASH |
            BANG |
            TILDE ;

    ASSIGNMENT_OPERATOR=
            EQUAL        | 
            MUL_ASSIGN   |
            DIV_ASSIGN   |
            MOD_ASSIGN   |
            ADD_ASSIGN   |
            SUB_ASSIGN   |
            LEFT_ASSIGN  |
            RIGHT_ASSIGN |
            AND_ASSIGN   |
            XOR_ASSIGN   |
            OR_ASSIGN ;


    OPERATOR = LEFT_OP | RIGHT_OP | INC_OP | DEC_OP | LE_OP | GE_OP | EQ_OP | NE_OP | AND_OP | OR_OP | XOR_OP | 
      ASSIGNMENT_OPERATOR | UNARY_OPERATOR | PARENS | STAR | PLUS | DASH | SLASH;
    
    
    HIGH_PRECISION = "higp";
    MEDIUM_PRECISION = "mediump";
    LOW_PRECISION = "lowp";

    LINE_COMMENT = "//" (any* - (any* "\n" any*) $ column) ("\n" $ line);
    BLOCK_COMMENT = "/*" (((any - "\n")| "\n" $ line)* - (any* "*/" any*) $ column) "*/" $ column;


    PRECISION_QUALIFIER = HIGH_PRECISION | MEDIUM_PRECISION | LOW_PRECISION;
    PARAMETER_QUALIFIERS = IN | OUT | INOUT;
    PARAMETER_TYPE_QUALIFIERS = CONST;
    QUALIFIERS = PRECISION_QUALIFIER | PARAMETER_QUALIFIERS | PARAMETER_TYPE_QUALIFIERS;

    IMMEDIATES = FLOATCONSTANT | INTCONSTANT ;

    LINE = "\n" $ line;
    ws=([ \r] $ column)* | ([\t] $ tab_column)*;



    main := |*
 
 
        KEYWORD > tok_start => tok_KEYWORD;
        IDENTIFIER > tok_start => tok_IDENTIFIER;
        FLOATCONSTANT > tok_start => tok_FLOATCONSTANT;
        INTCONSTANT > tok_start => tok_INTCONSTANT;
        OPERATOR > tok_start => tok_OPERATOR; 
        SEMICOLON $ column; LEFT_BRACE $ column; RIGHT_BRACE $ column ;
        COMMA $ column;
        LEFT_BRACKET $ column; RIGHT_BRACKET $ column;
        LINE_COMMENT $ column; BLOCK_COMMENT $ column;
        DOT $ column;
        ws;
        LINE;

        *| ;



}%%


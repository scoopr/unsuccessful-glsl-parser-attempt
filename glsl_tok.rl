%%{

    machine glsl;

    # keywords
    ATTRIBUTE = "attribute" ;
    CONST = "const" ;
    UNIFORM = "uniform" ;
    VARYING = "varying" ;
    LAYOUT = "layout" ;
    CENTROID = "centroid" ;
    FLAT = "flat" ;
    SMOOTH = "smooth" ;
    NOPERSPECTIVE = "noperspective" ;
    BREAK = "break" ;
    CONTINUE = "continue" ;
    DO = "do" ;
    FOR = "for" ;
    WHILE = "while" ;
    SWITCH = "switch" ;
    CASE = "case" ;
    DEFAULT = "default" ;
    IF = "if" ;
    ELSE = "else" ;
    IN = "in" ;
    OUT = "out" ;
    INOUT = "inout" ;
    FLOAT = "float" ;
    INT = "int" ;
    VOID = "void" ;
    BOOL = "bool" ;
    TOK_TRUE = "true" ;
    TOK_FALSE = "false" ;
    INVARIANT = "invariant" ;
    DISCARD = "discard" ;
    RETURN = "return" ;
    MAT2 = "mat2" ;
    MAT3 = "mat3" ;
    MAT4 = "mat4" ;
    MAT2X2 = "mat2x2" ;
    MAT2X3 = "mat2x3" ;
    MAT2X4 = "mat2x4" ;
    MAT3X2 = "mat3x2" ;
    MAT3X3 = "mat3x3" ;
    MAT3X4 = "mat3x4" ;
    MAT4X2 = "mat4x2" ;
    MAT4X3 = "mat4x3" ;
    MAT4X4 = "mat4x4" ;
    VEC2 = "vec2" ;
    VEC3 = "vec3" ;
    VEC4 = "vec4" ;
    IVEC2 = "ivec2" ;
    IVEC3 = "ivec3" ;
    IVEC4 = "ivec4" ;
    BVEC2 = "bvec2" ;
    BVEC3 = "bvec3" ;
    BVEC4 = "bvec4" ;
    UINT = "uint" ;
    UVEC2 = "uvec2" ;
    UVEC3 = "uvec3" ;
    UVEC4 = "uvec4" ;
    # LOWP = "lowp" ;
    # MEDIUMP = "mediump" ;
    # HIGHP = "highp" ;
    PRECISION = "precision" ;
    SAMPLER1D = "sampler1D" ;
    SAMPLER2D = "sampler2D" ;
    SAMPLER3D = "sampler3D" ;
    SAMPLERCUBE = "samplerCube" ;
    SAMPLER1DSHADOW = "sampler1DShadow" ;
    SAMPLER2DSHADOW = "sampler2DShadow" ;
    SAMPLERCUBESHADOW = "samplerCubeShadow" ;
    SAMPLER1DARRAY = "sampler1DArray" ;
    SAMPLER2DARRAY = "sampler2DArray" ;
    SAMPLER1DARRAYSHADOW = "sampler1DArrayShadow" ;
    SAMPLER2DARRAYSHADOW = "sampler2DArrayShadow" ;
    ISAMPLER1D = "isampler1D" ;
    ISAMPLER2D = "isampler2D" ;
    ISAMPLER3D = "isampler3D" ;
    ISAMPLERCUBE = "isamplerCube" ;
    ISAMPLER1DARRAY = "isampler1DArray" ;
    ISAMPLER2DARRAY = "isampler2DArray" ;
    USAMPLER1D = "usampler1D" ;
    USAMPLER2D = "usampler2D" ;
    USAMPLER3D = "usampler3D" ;
    USAMPLERCUBE = "usamplerCube" ;
    USAMPLER1DARRAY = "usampler1DArray" ;
    USAMPLER2DARRAY = "usampler2DArray" ;
    SAMPLER2DRECT = "sampler2DRect" ;
    SAMPLER2DRECTSHADOW = "sampler2DRectShadow" ;
    ISAMPLER2DRECT = "isampler2DRect" ;
    USAMPLER2DRECT = "usampler2DRect" ;
    SAMPLERBUFFER = "samplerBuffer" ;
    ISAMPLERBUFFER = "isamplerBuffer" ;
    USAMPLERBUFFER = "usamplerBuffer" ;
    STRUCT = "struct" ;

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



#/*LOWP | MEDIUMP | HIGHP |*/
    KEYWORD = ATTRIBUTE | CONST | UNIFORM | VARYING | LAYOUT | CENTROID | FLAT | SMOOTH | NOPERSPECTIVE | BREAK | CONTINUE | DO |
    FOR | WHILE | SWITCH | CASE | DEFAULT | IF | ELSE | IN | OUT | INOUT | FLOAT | INT | VOID | BOOL | TOK_TRUE | TOK_FALSE |
    INVARIANT | DISCARD | RETURN | MAT2 | MAT3 | MAT4 | MAT2X2 | MAT2X3 | MAT2X4 | MAT3X2 | MAT3X3 | MAT3X4 | MAT4X2 |
    MAT4X3 | MAT4X4 | VEC2 | VEC3 | VEC4 | IVEC2 | IVEC3 | IVEC4 | BVEC2 | BVEC3 | BVEC4 | UINT | UVEC2 | UVEC3 | UVEC4
    |  PRECISION | SAMPLER1D | SAMPLER2D | SAMPLER3D | SAMPLERCUBE | SAMPLER1DSHADOW |
    SAMPLER2DSHADOW | SAMPLERCUBESHADOW | SAMPLER1DARRAY | SAMPLER2DARRAY | SAMPLER1DARRAYSHADOW | SAMPLER2DARRAYSHADOW
    | ISAMPLER1D | ISAMPLER2D | ISAMPLER3D | ISAMPLERCUBE | ISAMPLER1DARRAY | ISAMPLER2DARRAY | USAMPLER1D | USAMPLER2D
    | USAMPLER3D | USAMPLERCUBE | USAMPLER1DARRAY | USAMPLER2DARRAY  | 
    ISAMPLER2DRECT | USAMPLER2DRECT  | ISAMPLERBUFFER | USAMPLERBUFFER | STRUCT;


    nondigit = alpha | "_";
    

    IDENTIFIER = nondigit (nondigit | digit)*;

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
 
 
#        KEYWORD > tok_start => tok_KEYWORD;
        #OPERATOR ;#> tok_start;# => tok_OPERATOR; 

        ATTRIBUTE   > tok_start => tok_ATTRIBUTE   ;
        CONST   > tok_start => tok_CONST   ;
        UNIFORM   > tok_start => tok_UNIFORM   ;
        VARYING   > tok_start => tok_VARYING   ;
        LAYOUT   > tok_start => tok_LAYOUT   ;
        CENTROID   > tok_start => tok_CENTROID   ;
        FLAT   > tok_start => tok_FLAT   ;
        SMOOTH   > tok_start => tok_SMOOTH   ;
        NOPERSPECTIVE   > tok_start => tok_NOPERSPECTIVE   ;
        BREAK   > tok_start => tok_BREAK   ;
        CONTINUE   > tok_start => tok_CONTINUE   ;
        DO   > tok_start => tok_DO   ;
        FOR   > tok_start => tok_FOR   ;
        WHILE   > tok_start => tok_WHILE   ;
        SWITCH   > tok_start => tok_SWITCH   ;
        CASE   > tok_start => tok_CASE   ;
        DEFAULT   > tok_start => tok_DEFAULT   ;
        IF   > tok_start => tok_IF   ;
        ELSE   > tok_start => tok_ELSE   ;
        IN   > tok_start => tok_IN   ;
        OUT   > tok_start => tok_OUT   ;
        INOUT   > tok_start => tok_INOUT   ;
        FLOAT   > tok_start => tok_FLOAT   ;
        INT   > tok_start => tok_INT   ;
        VOID   > tok_start => tok_VOID   ;
        BOOL   > tok_start => tok_BOOL   ;
        TOK_TRUE   > tok_start => tok_TOK_TRUE   ;
        TOK_FALSE   > tok_start => tok_TOK_FALSE   ;
        INVARIANT   > tok_start => tok_INVARIANT   ;
        DISCARD   > tok_start => tok_DISCARD   ;
        RETURN   > tok_start => tok_RETURN   ;
        MAT2   > tok_start => tok_MAT2   ;
        MAT3   > tok_start => tok_MAT3   ;
        MAT4   > tok_start => tok_MAT4   ;
        MAT2X2   > tok_start => tok_MAT2X2   ;
        MAT2X3   > tok_start => tok_MAT2X3   ;
        MAT2X4   > tok_start => tok_MAT2X4   ;
        MAT3X2   > tok_start => tok_MAT3X2   ;
        MAT3X3   > tok_start => tok_MAT3X3   ;
        MAT3X4   > tok_start => tok_MAT3X4   ;
        MAT4X2   > tok_start => tok_MAT4X2   ;
        MAT4X3   > tok_start => tok_MAT4X3   ;
        MAT4X4   > tok_start => tok_MAT4X4   ;
        VEC2   > tok_start => tok_VEC2   ;
        VEC3   > tok_start => tok_VEC3   ;
        VEC4   > tok_start => tok_VEC4   ;
        IVEC2   > tok_start => tok_IVEC2   ;
        IVEC3   > tok_start => tok_IVEC3   ;
        IVEC4   > tok_start => tok_IVEC4   ;
        BVEC2   > tok_start => tok_BVEC2   ;
        BVEC3   > tok_start => tok_BVEC3   ;
        BVEC4   > tok_start => tok_BVEC4   ;
        UINT   > tok_start => tok_UINT   ;
        UVEC2   > tok_start => tok_UVEC2   ;
        UVEC3   > tok_start => tok_UVEC3   ;
        UVEC4   > tok_start => tok_UVEC4   ;
        # LOWP   > tok_start => tok_LOWP   ;
        # MEDIUMP   > tok_start => tok_MEDIUMP   ;
        # HIGHP   > tok_start => tok_HIGHP   ;
        PRECISION   > tok_start => tok_PRECISION   ;
        SAMPLER1D   > tok_start => tok_SAMPLER1D   ;
        SAMPLER2D   > tok_start => tok_SAMPLER2D   ;
        SAMPLER3D   > tok_start => tok_SAMPLER3D   ;
        SAMPLERCUBE   > tok_start => tok_SAMPLERCUBE   ;
        SAMPLER1DSHADOW   > tok_start => tok_SAMPLER1DSHADOW   ;
        SAMPLER2DSHADOW   > tok_start => tok_SAMPLER2DSHADOW   ;
        SAMPLERCUBESHADOW   > tok_start => tok_SAMPLERCUBESHADOW   ;
        SAMPLER1DARRAY   > tok_start => tok_SAMPLER1DARRAY   ;
        SAMPLER2DARRAY   > tok_start => tok_SAMPLER2DARRAY   ;
        SAMPLER1DARRAYSHADOW   > tok_start => tok_SAMPLER1DARRAYSHADOW   ;
        SAMPLER2DARRAYSHADOW   > tok_start => tok_SAMPLER2DARRAYSHADOW   ;
        ISAMPLER1D   > tok_start => tok_ISAMPLER1D   ;
        ISAMPLER2D   > tok_start => tok_ISAMPLER2D   ;
        ISAMPLER3D   > tok_start => tok_ISAMPLER3D   ;
        ISAMPLERCUBE   > tok_start => tok_ISAMPLERCUBE   ;
        ISAMPLER1DARRAY   > tok_start => tok_ISAMPLER1DARRAY   ;
        ISAMPLER2DARRAY   > tok_start => tok_ISAMPLER2DARRAY   ;
        USAMPLER1D   > tok_start => tok_USAMPLER1D   ;
        USAMPLER2D   > tok_start => tok_USAMPLER2D   ;
        USAMPLER3D   > tok_start => tok_USAMPLER3D   ;
        USAMPLERCUBE   > tok_start => tok_USAMPLERCUBE   ;
        USAMPLER1DARRAY   > tok_start => tok_USAMPLER1DARRAY   ;
        USAMPLER2DARRAY   > tok_start => tok_USAMPLER2DARRAY   ;
        ISAMPLER2DRECT   > tok_start => tok_ISAMPLER2DRECT   ;
        USAMPLER2DRECT   > tok_start => tok_USAMPLER2DRECT   ;
        ISAMPLERBUFFER   > tok_start => tok_ISAMPLERBUFFER   ;
        USAMPLERBUFFER   > tok_start => tok_USAMPLERBUFFER   ;
        STRUCT   > tok_start => tok_STRUCT   ;
        LEFT_PAREN   > tok_start => tok_LEFT_PAREN   ;
        RIGHT_PAREN   > tok_start => tok_RIGHT_PAREN   ;

        IDENTIFIER > tok_start => tok_IDENTIFIER;

        INTCONSTANT > tok_start => tok_INTCONSTANT;
        FLOATCONSTANT > tok_start => tok_FLOATCONSTANT;



        PLUS   > tok_start => tok_PLUS   ;
        DASH   > tok_start => tok_DASH   ;
        BANG   > tok_start => tok_BANG   ;
        TILDE   > tok_start => tok_TILDE   ;
        EQUAL   > tok_start => tok_EQUAL   ;
        MUL_ASSIGN   > tok_start => tok_MUL_ASSIGN   ;
        DIV_ASSIGN   > tok_start => tok_DIV_ASSIGN   ;
        MOD_ASSIGN   > tok_start => tok_MOD_ASSIGN   ;
        ADD_ASSIGN   > tok_start => tok_ADD_ASSIGN   ;
        SUB_ASSIGN   > tok_start => tok_SUB_ASSIGN   ;
        LEFT_ASSIGN   > tok_start => tok_LEFT_ASSIGN   ;
        RIGHT_ASSIGN   > tok_start => tok_RIGHT_ASSIGN   ;
        AND_ASSIGN   > tok_start => tok_AND_ASSIGN   ;
        XOR_ASSIGN   > tok_start => tok_XOR_ASSIGN   ;
        OR_ASSIGN   > tok_start => tok_OR_ASSIGN   ;
        LEFT_OP   > tok_start => tok_LEFT_OP   ;
        RIGHT_OP   > tok_start => tok_RIGHT_OP   ;
        INC_OP   > tok_start => tok_INC_OP   ;
        DEC_OP   > tok_start => tok_DEC_OP   ;
        LE_OP   > tok_start => tok_LE_OP   ;
        GE_OP   > tok_start => tok_GE_OP   ;
        EQ_OP   > tok_start => tok_EQ_OP   ;
        NE_OP   > tok_start => tok_NE_OP   ;
        AND_OP   > tok_start => tok_AND_OP   ;
        OR_OP   > tok_start => tok_OR_OP   ;
        XOR_OP   > tok_start => tok_XOR_OP   ;
        ASSIGNMENT_OPERATOR   > tok_start => tok_ASSIGNMENT_OPERATOR   ;
        UNARY_OPERATOR   > tok_start => tok_UNARY_OPERATOR   ;
        PARENS   > tok_start => tok_PARENS   ;
        STAR   > tok_start => tok_STAR   ;
        SLASH   > tok_start => tok_SLASH   ;
        HIGH_PRECISION   > tok_start => tok_HIGH_PRECISION   ;
        MEDIUM_PRECISION   > tok_start => tok_MEDIUM_PRECISION   ;
        LOW_PRECISION   > tok_start => tok_LOW_PRECISION   ;
        LEFT_ANGLE   > tok_start => tok_LEFT_ANGLE   ;
        RIGHT_ANGLE   > tok_start => tok_RIGHT_ANGLE   ;
        VERTICAL_BAR   > tok_start => tok_VERTICAL_BAR   ;
        CARET   > tok_start => tok_CARET   ;
        AMPERSAND   > tok_start => tok_AMPERSAND   ;
        QUESTION   > tok_start => tok_QUESTION   ;
        LEFT_BRACKET   > tok_start => tok_LEFT_BRACKET   ;
        RIGHT_BRACKET   > tok_start => tok_RIGHT_BRACKET   ;
        DOT   > tok_start => tok_DOT   ;


        COMMA   > tok_start => tok_COMMA   ;
        SEMICOLON   > tok_start => tok_SEMICOLON   ;

        LEFT_BRACE   > tok_start => tok_LEFT_BRACE   ;
        RIGHT_BRACE   > tok_start => tok_RIGHT_BRACE   ;


        ws ;
        LINE;

        LINE_COMMENT;
        BLOCK_COMMENT;

        *| ;



}%%



.SUFFIXES: 
.SUFFIXES: .cpp .rl .y .o .h .frag .vert .fout .vout
.PHONY: glsl_examples clean all
.PRECIOUS: %.cpp %.h
.SECONDARY: glsl_parser.cpp glsl_parser.h

RAGEL=ragel
LEMON=lemon

TARGET=glsl_examples

CXXFLAGS += -ggdb -Wall -Wextra  -pedantic
LDFLAGS +=

SRCS = $(wildcard *.cpp) 
OBJS = $(SRCS:.cpp=.o) glsl_impl.o glsl_parser.o
SPEC_SRC = $(wildcard spec/*)
SPEC_OBJ = $(SPEC_SRC:.cpp=.o)

EXAMPLES = $(wildcard examples/*)
RESULT_IM = $(EXAMPLES:.frag=.fout)
RESULT = $(RESULT_IM:.vert=.vout)


all: $(TARGET)

%.fout: %.frag
	@echo Testing $< .. 
	@./glsl $< > $@
	@touch $@

%.vout: %.vert
	@echo Testing $< .. 
	@./glsl $< > $@
	@touch $@

%.cpp: %.rl
	@echo GEN TOK $<
	@$(RAGEL) -C $< -o $@


glsl: $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $@

%.cpp: %.y
	@echo GEN PARSER $<
	$(LEMON) $<
	mv $(subst .y,.c,$<) $@

glsl_examples: glsl $(RESULT)

$(EXAMPLES): glsl

depend:
	@echo DEP
	@makedepend -Y -- $(CXXFLAGS) -- $(SRCS) $(SPEC_SRC)  > /dev/null 2>&1 
	@$(RM) Makefile.bak

glsl_parser.h: glsl_parser.o
glsl_impl.o: glsl.h Node.h Token.h
glsl_impl.cpp: glsl_tok.rl
glsl.h: glsl_parser.h

glsl_parser.o: CXXFLAGS+=-Wno-unused -Wno-sign-compare

clean:
	$(RM) $(OBJS) $(GLSL_OBJS) glsl_impl.cpp glsl $(TARGET)  glsl_parser.cpp glsl_parser.h glsl_parser.out $(RESULT)


# DO NOT DELETE

Node.o: Node.h Token.h
ParserState.o: ParserState.h Node.h Token.h
Token.o: Token.h
glsl_impl.o: glsl.h glsl_parser.h Token.h Node.h ParserState.h
glsl_parser.o: Token.h glsl.h glsl_parser.h Node.h ParserState.h
main.o: glsl.h glsl_parser.h Token.h Node.h
spec/spec.o: spec/spec.h
spec/spec_main.o: spec/spec.h

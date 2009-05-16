
.SUFFIXES: 
.SUFFIXES: .cpp .rl .y .o .frag .vert .fout .vout
.PHONY: glsl_examples clean all
.PRECIOUS: %.cpp

RAGEL=ragel
LEMON=lemon

TARGET=glsl_examples

CXXFLAGS += -Wall -Wextra 
LDFLAGS +=

SRCS = main.cpp Token.cpp
OBJS = $(SRCS:.cpp=.o) glsl_impl.o glsl_parser.o


EXAMPLES = $(wildcard examples/*)
RESULT_IM = $(EXAMPLES:.frag=.fout)
RESULT = $(RESULT_IM:.vert=.vout)


all: $(TARGET)

.frag.fout:
	@echo Testing $< .. 
	@./glsl $<
	@touch $@

.vert.vout:
	@echo Testing $< .. 
	@./glsl $<
	@touch $@

.rl.cpp:
	@echo GEN TOK $<
	@$(RAGEL) -C $< -o $@


glsl: $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $@

.y.cpp:
	@echo GEN PARSER $<
	$(LEMON) $<
	mv $(subst .y,.c,$<) $@

glsl_examples: glsl 
	./glsl examples/ary.vert

$(EXAMPLES): glsl


main.o: glsl_parser.o
main.o: glsl.h Node.h Token.h
Token.o: glsl.h Node.h Token.h
Node.o: glsl.h Node.h Token.h
glsl_impl.o: glsl.h Node.h Token.h
glsl_parser.o: glsl.h Node.h Token.h
glsl.h: Token.h Node.h

glsl_impl.cpp: glsl_tok.rl

glsl_parser.o: CXXFLAGS+=-Wno-unused -Wno-sign-compare

clean:
	$(RM) $(OBJS) $(GLSL_OBJS) glsl_impl.cpp glsl $(TARGET)  glsl_parser.cpp glsl_parser.h glsl_parser.out $(RESULT)


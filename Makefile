
.SUFFIXES: 
.SUFFIXES: .cpp .rl .y .o .frag .vert .fout .vout
.PHONY: glsl_examples clean all
.PRECIOUS: %.cpp

RAGEL=ragel
LEMON=lemon

TARGET=glsl_examples

CXXFLAGS += -Wall -Wextra 
LDFLAGS +=

SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o) lang_parser.o lang_impl.o 

GLSL_OBJS = glsl_impl.o

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


glsl: $(GLSL_OBJS)
	$(CXX) $(LDFLAGS) $(GLSL_OBJS) -o $@

.y.cpp:
	@echo GEN PARSER $<
	$(LEMON) $<
	mv $(subst .y,.c,$<) $@

glsl_examples: glsl $(RESULT)

$(EXAMPLES): glsl

test: $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $@

main.o: lang_parser.o
main.o: lang.h

glsl_impl.cpp: glsl_tok.rl

lang_parser.o: CXXFLAGS+=-Wno-unused -Wno-sign-compare

clean:
	$(RM) $(OBJS) $(GLSL_OBJS) glsl_impl.cpp $(TARGET) lang_impl.cpp lang_parser.cpp lang_parser.h lang_parser.out $(RESULT)


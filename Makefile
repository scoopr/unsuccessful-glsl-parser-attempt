
.SUFFIXES: 
.SUFFIXES: .cpp .rl .y .o .h .frag .vert .fout .vout
.PHONY: glsl_examples clean all
.PRECIOUS: %.cpp %.h
.SECONDARY: libglsl/glsl_parser.cpp libglsl/glsl_parser.h

RAGEL=ragel
LEMON=lemon

TARGET=glsl_examples
ARCH=
CXXFLAGS += -ggdb -Wall -Wextra  -pedantic $(ARCH)
LDFLAGS += $(ARCH)

MAIN_SRCS = main.cpp
MAIN_OBJS = main.o
GLSL_SRCS = $(wildcard libglsl/*.cpp) 
GLSL_OBJS = libglsl/Node.o libglsl/ParserState.o libglsl/Token.o libglsl/glsl_impl.o libglsl/glsl_parser.o
SPEC_SRCS = $(wildcard spec/*.cpp)
SPEC_OBJS = $(SPEC_SRCS:.cpp=.o)

EXAMPLES = $(wildcard examples/*)
RESULT_IM = $(EXAMPLES:.frag=.fout)
RESULT = $(RESULT_IM:.vert=.vout)


all: spec glsl
# $(TARGET)

spec: specsuite
	./specsuite

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


glsl: $(MAIN_OBJS) $(GLSL_OBJS)
	$(CXX) $(LDFLAGS) $(MAIN_OBJS) $(GLSL_OBJS) -o $@

%.cpp: %.y
	@echo GEN PARSER $<
	@$(LEMON) $<
	mv $(subst .y,.c,$<) $@

glsl_examples: glsl $(RESULT)

specsuite: $(SPEC_OBJS) $(GLSL_OBJS)
	$(CXX) $(LDFLAGS) $(SPEC_OBJS) $(GLSL_OBJS) -o $@


$(EXAMPLES): glsl

depend: clean
	@echo DEP
	@makedepend -Y -- $(CXXFLAGS) -- $(MAIN_SRCS) $(GLSL_SRCS) $(SPEC_SRCS)  > /dev/null 2>&1 
	@$(RM) Makefile.bak

libglsl/glsl_parser.h: libglsl/glsl_parser.o
libglsl/glsl_parser.o: libglsl/glsl_parser.y
libglsl/glsl_impl.o: libglsl/glsl.h libglsl/Node.h libglsl/Token.h
libglsl/glsl_impl.cpp: libglsl/glsl_tok.rl
libglsl/glsl.h: libglsl/glsl_parser.h

libglsl/glsl_parser.o: CXXFLAGS+=-Wno-unused -Wno-sign-compare

clean:
	$(RM) $(MAIN_OBJS) $(GLSL_OBJS) $(SPEC_OBJS) libglsl/glsl_impl.cpp glsl specsuite  libglsl/glsl_parser.cpp libglsl/glsl_parser.h libglsl/glsl_parser.out $(RESULT)


# DO NOT DELETE

main.o: libglsl/glsl.h libglsl/Token.h libglsl/Node.h
libglsl/Node.o: libglsl/Node.h libglsl/Token.h
libglsl/ParserState.o: libglsl/ParserState.h libglsl/Node.h libglsl/Token.h
libglsl/Token.o: libglsl/Token.h
spec/glsl_spec.o: spec/spec_helper.h spec/spec.h libglsl/glsl.h
spec/glsl_spec.o: libglsl/Token.h libglsl/Node.h
spec/spec.o: spec/spec.h
spec/spec_main.o: spec/spec.h

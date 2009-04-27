

RAGEL=ragel
LEMON=lemon

TARGET=test

CXXFLAGS += -Wall -Wextra
LDFLAGS +=

SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o) lang_parser.o lang_impl.o 


all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $(TARGET)


lang_parser.h lang_parser.c: lang_parser.y
	$(LEMON) lang_parser.y

lang_impl.cpp: lang_impl.rl
	$(RAGEL) -C lang_impl.rl -o lang_impl.cpp

lang_parser.o: lang_parser.c
lang.h: lang_parser.h
main.o: lang.h

clean:
	$(RM) $(OBJS) $(TARGET) lang_impl.cpp lang_parser.c lang_parser.h lang_parser.out


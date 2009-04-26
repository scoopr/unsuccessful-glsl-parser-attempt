

RAGEL=ragel

TARGET=test

CXXFLAGS += -Wall -Wextra
LDFLAGS +=

SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o) lang_impl.o


all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $(TARGET)


lang_impl.cpp: lang_impl.rl
	$(RAGEL) -C lang_impl.rl -o lang_impl.cpp



clean:
	$(RM) $(OBJS) $(TARGET) lang_impl.cpp


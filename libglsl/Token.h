#ifndef LANG_TOKEN_H
#define LANG_TOKEN_H

#include <string>
#include <ostream>

class Token {
public:
    
    
    Token(int id_, std::string str_, std::string file_, int line_, int column_) : 
      id(id_), string(str_), file(file_), line(line_), column(column_) {}
    
    
    Token(const std::string& str) : id(-1), string(str), file("-"), line(0), column(0) {}
    
    int id;
    std::string string;
    std::string file;
    int line;
    int column;

};


std::ostream& operator<<(std::ostream& os, const Token& token);


#endif

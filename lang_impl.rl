
#include <iostream>

%%{


    machine lang;


    action hello {
        std::cout << "Hello!" << std::endl;
    }


    include lang "lang.rl";





}%%


%% write data;




void foo() {
    
    char *p;
    int cs;
    char *pe;
    
    %% write init;
    %% write exec;


}



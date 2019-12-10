//
//  main.cpp
//  numeric-expressions
//
//  Created by Luis Sandoval on 12/10/19.
//  Copyright © 2019 Luis Sandoval. All rights reserved.
//
#include <stdio.h>
#include <iostream>

extern FILE* yyin;
extern int yyparse();
extern float resultado;

bool parse(const char *fname) {
    yyin = fopen(fname,"r");
    int x = yyparse();
    fclose(yyin);
    
    return x == 0;
}

int main(int argc, const char * argv[]) {
    if (parse("prueba.txt")) {
        printf("Resultado: %f\n", resultado);
    } else {
        printf("Not ok\n");
    }
    
    return 0;
}

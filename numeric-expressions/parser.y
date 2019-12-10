%{
// hello
// bison -d parser.y -o parser.cpp
#include <cstdio>

extern int contador;
extern int yylex();

int yyerror(char *);

float resultado = 0.0;

%}

%union {
    float val;
}

%token <val> NUM

%type <val> exp term fact // expresiones aritmeticas

%%

begin: exp { resultado = $1; };

exp:
    exp '+' term { $$ = $1 + $3; }
    | exp '-' term { $$ = $1 - $3; }
    | term { $$ = $1; };

term:
    term '*' fact { $$ = $1 * $3; }
    | term '/' fact { $$ = $1 / $3; }
    | fact { $$ = $1; };

fact:
    '(' exp ')' { $$ = $2; }
    | '-' fact { $$ = - $2; }
    | NUM { $$ = $1; };

%%

int yyerror(char *mssg) {
    printf("[%i] %s\n", contador, mssg);
    return 0;
}

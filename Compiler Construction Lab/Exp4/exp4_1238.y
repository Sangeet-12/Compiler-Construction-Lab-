%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER

%%
input:
      expr '\n'  { printf("Valid expression\n"); exit(0); }
    ;

expr:
      expr '+' term
    | expr '-' term
    | term
    ;

term:
      term '*' factor
    | term '/' factor
    | factor
    ;

factor:
      NUMBER
    | '(' expr ')'
    ;
%%

int yyerror(const char *s) {
    printf("Invalid expression\n");
    return 0;
}

int main() {
    printf("Name: Sangeet Harne | PRN: 24070521238\n");
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}

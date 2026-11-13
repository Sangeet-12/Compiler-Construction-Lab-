%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
input:
      expr '\n'  { printf("Valid expression\n"); exit(0); }
    ;

expr:
      NUMBER
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
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

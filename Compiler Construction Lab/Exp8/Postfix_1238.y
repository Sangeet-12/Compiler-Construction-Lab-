%{
#include <stdio.h>
int yylex(void);
void yyerror(char *s);
%}

%token NUMBER

%%
session:
    session expr '\n' { printf("Result: %d\n", $2); }
    | /* empty */
    ;

expr:
    NUMBER          { $$ = $1; }
    | expr expr '+' { $$ = $1 + $2; }
    | expr expr '-' { $$ = $1 - $2; }
    | expr expr '*' { $$ = $1 * $2; }
    | expr expr '/' { $$ = $1 / $2; }
    ;
%%

void yyerror(char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Name: Sangeet Harne | PRN: 24070521238\n");
    printf("Enter postfix expression:\n");
    yyparse();
    return 0;
}

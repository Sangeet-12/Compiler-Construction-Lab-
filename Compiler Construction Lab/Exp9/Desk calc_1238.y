%{
#include <stdio.h>
int yylex(void);
void yyerror(char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
session:
    session expr '\n' { printf("Result: %d\n", $2); }
    | session error '\n' { printf("Invalid syntax. Error recovered. Enter next expression:\n"); yyerrok; }
    | /* empty */
    ;

expr:
    NUMBER          { $$ = $1; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { 
        if ($3 == 0) { 
            yyerror("Divide by zero"); 
            $$ = 0; 
        } else { 
            $$ = $1 / $3; 
        } 
    }
    | '(' expr ')'  { $$ = $2; }
    ;
%%

void yyerror(char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Name: Sangeet Harne | PRN: 24070521238\n");
    printf("Enter expression:\n");
    yyparse();
    return 0;
}

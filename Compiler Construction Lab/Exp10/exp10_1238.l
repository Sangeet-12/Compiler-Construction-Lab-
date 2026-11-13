%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char *s);
%}

%token FOR ID NUM RELOP UOP

%%
start: FOR '(' init ';' cond ';' inc ')' '{' body '}' { printf("\nResult: Valid 'for' loop syntax!\n"); exit(0); }
     | FOR '(' init ';' cond ';' inc ')' stmt         { printf("\nResult: Valid 'for' loop syntax!\n"); exit(0); }
     ;

init: ID '=' expr
    | /* empty */
    ;

cond: expr RELOP expr
    | /* empty */
    ;

inc: ID UOP
   | UOP ID
   | ID '=' expr
   | /* empty */
   ;

expr: ID
    | NUM
    ;

body: body stmt
    | /* empty */
    ;

stmt: ID '=' expr ';'
    | ID UOP ';'
    ;
%%

void yyerror(char *s) {
    printf("\nResult: Invalid 'for' loop syntax!\n");
}

int main() {
    printf("Name: Sangeet Harne | PRN: 24070521238\n");
    printf("Enter a 'for' loop statement:\n");
    yyparse();
    return 0;
}

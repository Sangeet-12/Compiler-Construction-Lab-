%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+  { printf("%X", atoi(yytext)); }
.|\n    { printf("%c", yytext[0]); }
%%

int yywrap() { 
    return 1; 
}

int main() {
    printf("Name: Sangeet Harne | PRN: 24070521238\n");
    printf("Reading from input.txt...\n");
    
    yyin = fopen("input.txt", "r");
    if(!yyin) {
        printf("Error: input.txt not found!\n");
        return 1;
    }
    
    yylex();
    fclose(yyin);
    return 0;
}

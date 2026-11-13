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
    printf("Enter decimal numbers (Press Ctrl+D to stop):\n");
    yylex();
    return 0;
}

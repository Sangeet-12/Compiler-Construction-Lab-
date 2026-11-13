%{
#include <stdio.h>
%}

%%
.*com\n     { printf("Accepted - Ends with 'com': %s", yytext); }
.*\n        { printf("Rejected: %s", yytext); }
.           { /* Ignore */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Name: Sangeet Harne | PRN: 24070521238\n");
    printf("Enter lines (Press Ctrl+D to stop):\n");
    yylex();
    return 0;
}

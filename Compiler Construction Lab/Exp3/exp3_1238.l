%{
#include <stdio.h>
int count = 0;
%}

%%
[aA][a-zA-Z0-9_]*  { count++; }
[a-zA-Z0-9_]+      { /* Ignore all other words */ }
[ \t\n]+           { /* Ignore spaces and newlines */ }
.                  { /* Ignore punctuation and symbols */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Name: Sangeet Harne | PRN: 24070521238\n");
    printf("Enter text (Press Ctrl+D to stop):\n");
    yylex();
    printf("\nTotal words starting with 'A' or 'a': %d\n", count);
    return 0;
}

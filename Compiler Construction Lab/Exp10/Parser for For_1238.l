%{
#include "y.tab.h"
%}

%%
"for"                       { return FOR; }
[a-zA-Z_][a-zA-Z0-9_]*      { return ID; }
[0-9]+                      { return NUM; }
"<="|">="|"=="|"!="|"<"|">" { return RELOP; }
"++"|"--"                   { return UOP; }
[ \t\n]+                    { /* ignore spaces and newlines */ }
.                           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}

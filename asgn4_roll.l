This Flex file defines the lexical rules for tinyC. You can modify the rules or add more tokens as required by your specification.

%{
#include "y.tab.h"
%}

%%
// Token definitions
"("          { return '('; }
")"          { return ')'; }
"{"          { return '{'; }
"}"          { return '}'; }
"["          { return '['; }
"]"          { return ']'; }
"+"          { return '+'; }
"-"          { return '-'; }
""          { return ''; }
"/"          { return '/'; }
"=="         { return EQUAL; }
"!="         { return NOTEQUAL; }
"<="         { return LESSEQUAL; }
">="         { return GREATEQUAL; }
"<"          { return '<'; }
">"          { return '>'; }
"="          { return '='; }
";"          { return ';'; }
","          { return ','; }
[0-9]+       { yylval.int_val = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str_val = strdup(yytext); return IDENTIFIER; }
[ \t\n]+     ; // Ignore whitespace
.            { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%option noyywrap

%%
"int"       { return INT; }
"float"     { return FLOAT; }
"char"      { return CHAR; }

[a-zA-Z_][a-zA-Z0-9_]*  { 
    yylval.str = strdup(yytext); 
    return ID; 
}

","         { return COMMA; }
";"         { return SEMICOLON; }

[ \t\n]+    ; // ignore whitespace

.           { printf("Invalid character: %s\n", yytext); }

%%

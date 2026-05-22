%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
"while"     { return WHILE; }
"||"        { return OR; }
"&&"        { return AND; }
"!"         { return NOT; }
"TRUE"      { return TRUE_VAL; }
"FALSE"     { return FALSE_VAL; }
[a-zA-Z]+   { yylval.str = strdup(yytext); return ID; }
[0-9]+      { yylval.str = strdup(yytext); return NUM; }
">="        { yylval.str = strdup(yytext); return RELOP; }
"+"         { return '+'; }
"/"         { return '/'; }
"="         { return '='; }
";"         { return ';'; }
"{"         { return '{'; }
"}"         { return '}'; }
[ \t\n\r]   ; /* Skip all whitespace and carriage returns */
.           { return yytext[0]; }
%%

int yywrap() { return 1; }

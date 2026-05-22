%option noyywrap
%{
#include "y.tab.h"
#include<stdio.h>
extern char *yytext;
%}

ws [ \t\n]+
letter [A-Za-z_]
digit  [0-9]
id {letter}({letter}|{digit})*
%%
{ws}        {;/* No action */}
"int"       { return INT;}
{id}        { return ID;}
";"         { return ';';}
","         { return ',';}
.           { printf(" Unrecognized character %s\n", yytext);}
%%

%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*

%%

{DIGIT}+"."{DIGIT}+ { yylval.fval = atof(yytext); return REAL; }
{DIGIT}+ { yylval.fval = atof(yytext); return INT; }

{ID} { yylval.str = strdup(yytext); return ID; }

"+" return PLUS;
"-" return MINUS;
"*" return MUL;
"/" return DIV;

"<" return LT;
"<=" return LE;
"==" return EQ;
"!=" return NE;
"&&" return AND;
"||" return OR;

"=" return ASSIGN;
";" return ';';

[ \t\n] ;

. return yytext[0];

%%

int yywrap()
{
return 1;
}

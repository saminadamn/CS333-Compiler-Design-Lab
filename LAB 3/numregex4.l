%option noyywrap
%{
#include <stdio.h>
%}
ws [ \t\n]+
digit [0-9]
hexdigit [0-9a-fA-F]
%%
{ws} ;
0[xX]{hexdigit}+ { printf("HEXADECIMAL NUMBER : %s\n", yytext); }
0[bB][01]+ { printf("BITSTRING : %s\n", yytext); }
{digit}+\.{digit}+([eE][+-]?{digit}+)? { printf("REAL NUMBER : %s\n", yytext); }
{digit}+[eE][+-]?{digit}+ { printf("REAL NUMBER WITH EXPONENT : %s\n", yytext); }
0[0-7]+ { printf("OCTAL NUMBER : %s\n", yytext); }
{digit}+ { printf("DECIMAL NUMBER : %s\n", yytext); }
\'([^\\\n]|(\\.))\' { printf("CHARACTER LITERAL : %s\n", yytext); }
,|; { printf("DELIMITER : %s\n", yytext); }
. ;
%%

int main()
{
    while (yylex());
    return 0;
}

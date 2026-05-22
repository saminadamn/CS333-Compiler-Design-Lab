%option noyywrap
%{
#include <stdio.h>
%}

ws [ \t\n]+
digit  [0-9]
octalnum 0[0-7]+
number {digit}+
delimiter ,|;

%%

{ws} { /*ignore it*/}
{octalnum}   {printf("OCTAL NUMBER: %s\n", yytext);}
{number}     {printf("DECIMAL NUMBER: %s\n", yytext); }
{delimiter}  {printf("DELIMITER: %s\n", yytext); }

%%
int main()
{ while(yylex());
  return 0;
}

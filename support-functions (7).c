%option noyywrap 
%{
#include <stdlib.h>  
#include <string.h>
void yyerror(char*);
#include "y.tab.h"
%}
ws [ \t\n]+
letter [A-Za-z]
digit  [0-9]
id {letter}({letter}|{digit})*
relop ">"|"!="

%%
{ws}        ;
"if"        {return IF;}
"then"      {return THEN;}
"else"      {return ELSE;}
"TRUE"      {return 'T';}
"FALSE"     {return 'F';}
{id}        {yylval.name=(char*)malloc(strlen(yytext)+1); strcpy(yylval.name, yytext); return ID;}
";"         {return ';';}
"="         {return '=';}
"*"         {return '*';}
"+"         {return '+';}
{relop}     {yylval.relopname = (char*)malloc(strlen(yytext)+1); strcpy(yylval.relopname, yytext); return RELOP;}
"&&"        {return AND;}
"||"        {return OR;}
"!"         {return NOT;}
"("         {return '(';}
")"         {return ')';}
.           {printf("Unrecognized Character : %s \n", yytext);}
%%

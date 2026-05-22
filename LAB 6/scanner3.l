/* lex script to recognize unsigned integers and a few operators  */
%option noyywrap 
%{
#include <stdlib.h>  
void yyerror(char*);
#include "y.tab.h"
%}
ws [ \t\n]+
digit  [0-9]
real ({digit}+\.{digit}+)|({digit}*\.{digit}+)
num {digit}+
id [a-zA-Z][a-zA-Z0-9]
%%
{ws}        ;
{num}       {yylval.intval=atoi(yytext);return INT;}
{real}      {yylval.realval=atof(yytext);return REAL;}
{id}        {yylval.id=strdup(yytext); return ID;}
"||"        {return OR;}
"&&"        {return AND;}
"=="        {return EQ;}
"!="        {return NE;}
"="         {return ASSIGN;}
"<="        {return LE;}
"<"         {return '<';}
"+"         {return '+';}

"-"         {return '-';}
"*"         {return '*';}
"/"         {return '/';}
"%"         {return '%';}
.           {printf("Unrecognized Character : %s \n", yytext);}
%%

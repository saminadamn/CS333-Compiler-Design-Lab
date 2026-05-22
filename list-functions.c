%option noyywrap 
%{
#include <stdlib.h>  
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
"TRUE"      {return 'T';}
"FALSE"     {return 'F';}
{id}        {yylval.name=(char*)malloc(sizeof(yytext)); 
             strcpy(yylval.name, yytext); return ID;}
";"         {return ';';}
"*"         {return '*';}
"+"         {return '+';}
{relop}     {yylval.relopname = (char*)malloc(sizeof(yytext));
             strcpy(yylval.relopname, yytext); return RELOP;}
"&&"        {return AND;}
"||"        {return OR;}
"!"         {return NOT;}
"("         {return '(';}
")"         {return ')';}
.           {printf("Unrecognized Character : %s \n", yytext);}
%%


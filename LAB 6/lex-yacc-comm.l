%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}
ws [ \t\n]+
letter [A-Za-z]
digit  [0-9]
id {letter}({letter}|{digit})*

%%

{ws}        {;/* No action */}
"T1"         {yylval.attr2.fval=10.5; yylval.attr2.type=0; 
               return T1;}
"T2"         {yylval.attr2.fval=101; yylval.attr2.type=1;            
              return T2;}
","          {return ',';}

%%




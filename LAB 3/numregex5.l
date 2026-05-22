%option noyywrap

%{
#include <stdio.h>
%}
letter [a-zA-Z_]
digit [0-9]
id {letter}({letter}|{digit})*

%%
[ \t\n]+ {;}
"//".*                  { printf("SINGLE LINE COMMENT\n"); }
"int"|"float"|"char"|"return"|"if"|"else"|"while"|"for"       { printf("KEYWORD : %s\n", yytext); }
\"([^\\\"\n]|(\\.))*\"       { printf("STRING LITERAL : %s\n", yytext); }
"=="|"!="|"<="|">="|"="|"+"|"-"|"*"|"/"   { printf("OPERATOR : %s\n", yytext); }
{digit}+                 { printf("NUMBER : %s\n", yytext); } 
{id}                     { printf("IDENTIFIER : %s\n", yytext); }
";"|","|"("|")"|"{"|"}" { printf("DELIMITER : %s\n", yytext); }
%%

int main()
{
    while (yylex());
    return 0;
}

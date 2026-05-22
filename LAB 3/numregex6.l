%option noyywrap

%{
#include <stdio.h>
%}

/* Definitions */
letter [a-zA-Z_]
digit [0-9]
id {letter}({letter}|{digit})*

%%
/* Single-line comment */
"//".*                  
        { printf("SINGLE LINE COMMENT\n"); }

/* Keywords */
"int"|"float"|"char"|"return"|"if"|"else"|"while"|"for"  
        { printf("KEYWORD : %s\n", yytext); }

/* String literal */
\"([^\\\"\n]|(\\.))*\"    
        { printf("STRING LITERAL : %s\n", yytext); }

/* Operators */
"=="|"!="|"<="|">="|"="|"+"|"-"|"*"|"/"  
        { printf("OPERATOR : %s\n", yytext); }

/* Numbers */
{digit}+                 
        { printf("NUMBER : %s\n", yytext); }

/* Identifiers */
{id}                     
        { printf("IDENTIFIER : %s\n", yytext); }

/* Delimiters */
";"|","|"("|")"|"{"|"}"  
        { printf("DELIMITER : %s\n", yytext); }

/* Ignore whitespace */
[ \t\n]+ ;

/* Ignore other characters */
. ;
%%

int main()
{
    while (yylex());
    return 0;
}


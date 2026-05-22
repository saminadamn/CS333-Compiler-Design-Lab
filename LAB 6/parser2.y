%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(char *s);
int yylex();
%}

%union
{
 float fval;
 char *str;
}

%token <fval> INT REAL
%token <str> ID

%token PLUS MINUS MUL DIV
%token LT LE EQ NE AND OR
%token ASSIGN

%type <fval> E

%%

S : ID ASSIGN E ';'
{
 printf("Value of %s is %f\n",$1,$3);
}
;

E : E PLUS E
{
 printf("value of %f + %f is %f\n",$1,$3,$1+$3);
 $$ = $1+$3;
}

| E MINUS E
{
 printf("value of %f - %f is %f\n",$1,$3,$1-$3);
 $$ = $1-$3;
}

| E MUL E
{
 printf("value of %f * %f is %f\n",$1,$3,$1*$3);
 $$ = $1*$3;
}

| E DIV E
{
 printf("value of %f / %f is %f\n",$1,$3,$1/$3);
 $$ = $1/$3;
}

| INT
{
 printf("Value is : %f\n",$1);
 $$ = $1;
}

| REAL
{
 printf("Value is : %f\n",$1);
 $$ = $1;
}

;

%%

void yyerror(char *s)
{
 printf("Error\n");
}

int main()
{
 printf("Enter assignment expression:\n");
 yyparse();
 return 0;
}

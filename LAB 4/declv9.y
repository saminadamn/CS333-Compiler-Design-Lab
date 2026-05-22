
%{
#include <stdio.h>
#include <string.h>

/* store identifiers */
char ids[100][50];
int count = 0;

/* store data type */
char dtype[20];

int yylex();
void yyerror(const char *s);

/* from lex */
extern char *yytext;
%}

/* tokens */
%token INT FLOAT ID

/* new start symbol for multiple declarations */
%start program

%%

/* -------- program allows many declarations -------- */
program : program decl
        | decl
        ;

/* -------- declaration -------- */
decl : type list ';'
{
    int i;
    for(i=0;i<count;i++)
        printf("%s : %s\n", ids[i], dtype);

    count = 0; /* reset for next statement */
}
;

/* -------- type -------- */
type : INT
{
    strcpy(dtype,"int");
}
| FLOAT
{
    strcpy(dtype,"float");
}
;

/* -------- identifier list -------- */
list : list ',' ID
{
    strcpy(ids[count++], yytext);
}
| ID
{
    strcpy(ids[count++], yytext);
}
;

%%

/* error function */
void yyerror(const char *s)
{
    printf("Syntax Error\n");
}

/* main function */
int main()
{
    yyparse();
    return 0;
}

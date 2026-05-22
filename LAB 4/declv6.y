%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token INT FLOAT ID

%%

decl : type list ';'
{
    printf("Successful Parse\n");
}
;

type : INT
{
    printf("Seen INT\n");
}
| FLOAT
{
    printf("Seen FLOAT\n");
}
;

list : list ',' ID
{
    printf("Seen another identifier\n");
}
| ID
{
    printf("Seen first identifier\n");
}
;

%%

void yyerror(const char *s)
{
    printf("Syntax Error\n");
}

int main()
{
    yyparse();
    return 0;
}

%{
#include <stdio.h>
#include <string.h>

char ids[100][50];
int count = 0;
char current_type[20];

int yylex();
void yyerror(const char *s);

extern char *yytext;
%}

%token INT FLOAT ID

%%

S : S decl
  | decl
  ;

decl : type list ';'
{
    for(int i=0;i<count;i++)
        printf("%s : %s\n", ids[i], current_type);

    count = 0;
}
;

type : INT
{
    strcpy(current_type,"int");
}
| FLOAT
{
    strcpy(current_type,"float");
}
;

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

void yyerror(const char *s)
{
    printf("Syntax Error\n");
}

int main()
{
    yyparse();
    return 0;
}

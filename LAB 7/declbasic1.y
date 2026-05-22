%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab-basic-functions.c"  // include your symbol table functions

void yyerror(const char *s);
int yylex();

/* Current type and size for declarations */
char curr_type[10];
int curr_size;

%}

%union {
    char *str;
}

%token <str> ID
%token INT FLOAT CHAR
%token COMMA SEMICOLON

%%

/* Grammar for declaration list (G1 style) */
dlist : dlist D
      | D
      ;

D : T idlist SEMICOLON
    ;

idlist : idlist COMMA ID
        {
            insert(symtab, $3, curr_type, curr_size);
        }
       | ID
        {
            insert(symtab, $1, curr_type, curr_size);
        }
       ;

T : INT
    {
        strcpy(curr_type, "int");
        curr_size = 4;
    }
  | FLOAT
    {
        strcpy(curr_type, "float");
        curr_size = 4;
    }
  | CHAR
    {
        strcpy(curr_type, "char");
        curr_size = 1;
    }
  ;

%%

/* Error handler */
void yyerror(const char *s) {
    printf("Parse error: %s\n", s);
}

/* Main function */
int main() {
    printf("Enter declarations (Ctrl+D to end input):\n");
    initialize(symtab, 50);
    yyparse();
    display(symtab);
    return 0;
}

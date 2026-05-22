%{
#include <stdio.h>
#include <string.h>

/* array to store identifiers */
char ids[100][50];
int count = 0;

/* store type of declaration */
char current_type[20];

/* required yacc functions */
int yylex();
void yyerror(const char *s);

/* to access identifier string from lex */
extern char *yytext;

%}

/* ---------- TOKENS FROM LEX ---------- */
%token INT FLOAT ID

%%

/* ======================================================
   Start symbol modified to support multiple declarations
   (Extension for P3/P4)
   ====================================================== */

S : S decl
  | decl
  ;

/* ======================================================
   Declaration Rule
   Earlier (P2): Only printed rule usage
   Now (P3): prints variable and its type
   ====================================================== */

decl : type list ';'
{
    int i;
    for(i=0;i<count;i++)
    {
        printf("%s : %s\n", ids[i], current_type);
    }
    count = 0; /* reset for next declaration */
}
;

/* ======================================================
   Type Rule
   Earlier (P2): only recognized INT
   Now: store actual data type
   ====================================================== */

type : INT
{
    strcpy(current_type,"int");
}
| FLOAT
{
    strcpy(current_type,"float");
}
;

/* ======================================================
   Identifier List Rule
   Earlier: only syntax checking
   Now: store identifiers
   ====================================================== */

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

/* ---------- ERROR HANDLING ---------- */

void yyerror(const char *s)
{
    printf("Syntax Error\n");
}

/* ---------- MAIN FUNCTION ---------- */

int main()
{
    yyparse();
    return 0;
}

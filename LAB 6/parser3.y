%{
#include <stdio.h>
#include <math.h>
int yylex(void);
void yyerror(char *);
%}

%union {
    int intval;
    float realval;
    char *id;
}

%left OR
%left AND
%left EQ NE
%left '<' LE '>'
%left '+' '-'
%left '*' '/'
%token <id> ID
%token ASSIGN
%token <intval> INT
%token <realval> REAL
%type <realval> E
%%
S: ID ASSIGN E';'
 {printf("Value of %s %f\n", $1, $3);}
E: E '+' E    { $$ = $1 + $3; printf("%f + %f = %f\n",$1,$3,$$); }
 | E '-' E    { $$ = $1 - $3; printf("%f - %f = %f\n",$1,$3,$$); }
 | E '*' E    { $$ = $1 * $3; printf("%f * %f = %f\n",$1,$3,$$); }
 | E '/' E    { $$ = $1 / $3; printf("%f / %f = %f\n",$1,$3,$$); }
 | E '<' E    { $$ = $1 < $3; printf("%f < %f = %f\n",$1,$3,$$); }
 | E LE E     { $$ = $1 <= $3; printf("%f <= %f = %f\n",$1,$3,$$); }
 | E EQ E     { $$ = $1 == $3; printf("%f == %f = %f\n",$1,$3,$$); }
 | E NE E     { $$ = $1 != $3; printf("%f != %f = %f\n",$1,$3,$$); }
 | E AND E    { $$ = $1 && $3; printf("%f && %f = %f\n",$1,$3,$$); }
 | E OR E     { $$ = $1 || $3; printf("%f || %f = %f\n",$1,$3,$$); }
 | '(' E ')'  { $$ = $2; }
 | INT        { $$ = (float)$1; printf("Value: %f\n", $$); }
 | REAL       { $$ = $1; printf("Value: %f\n", $$); }
 ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}

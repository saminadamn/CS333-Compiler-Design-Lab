%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
/* YACC Declarations */
%union
{ int intval;
  float realval;
}

%left '+' '-'
%left '*' '/' '%'
%token <intval> INT 
%token <realval> REAL
%type  <realval> E
%%

E: E '*' E {$$ = $1*$3; printf(" value of %f * %f is %f \n",$1, $3, $$);  } 
   | E '/' E  {$$ = $1/$3; printf(" value of %f / %f is %f \n",$1, $3, $$);  }
   | E '+' E  {$$ = $1 + $3; printf(" value of %f + %f is %f \n",$1, $3, $$);  }
   | E '-' E  {$$ = $1 - $3; printf(" value of %f - %f is %f \n",$1, $3, $$);  }
   | REAL    {$$ = $1; printf(" Value is : %f \n", $$);}
   | INT     {$$ = $1; printf(" Value is : %f \n", $$);}
   ;
%%

void yyerror (char* mess)
{ fprintf(stderr, "%s\n", mess); }
int main() { yyparse(); return 0; }

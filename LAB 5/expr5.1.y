%{
#include <stdio.h>
int yylex();
void yyerror(char *);
%}

%token NUM

%%
E: E '+' T {$$ = $1 + $3; printf(" Value of %d + %d is %d \n", $1, $3,$$);} 
   | T
   ;
T:  T '%' F  {$$ = $1 % $3; printf(" %d mod %d is %d \n",$1, $3, $$ ); }
   | F     
   ;
F: NUM     {printf(" Number is %d \n", $1);}
   ;
%%

void yyerror (char* mess)
{ fprintf(stderr, "%s\n", mess); }

int main()
{ // yydebug = 1; 
  yyparse(); 
  return 0;
}

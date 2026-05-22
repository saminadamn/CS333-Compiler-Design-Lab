/*C declarations*/
%{ #include <stdio.h>
   #include "y.tab.h"
   int yylex(void);
   void yyerror(char*);
%}

/* YACC Declarations */
%union
{ 
  struct X 
  { float fval;
    short type;
  } attr2;
  struct Y
  { int ival;
    short type;
    int count;
  } attr3; 
}
%token <attr2> T1 T2
%type <attr2> Y 
%type <attr3> S
%%

S :   S ',' Y { $$.ival = $3.fval;$$.type = $3.type; ++$$.count;
           printf("ival = %d type = %d count = %d \n", $$.ival, $$.type,$$.count);}
     | Y { $$.ival = $1.fval;$$.type = $1.type; $$.count = 1;           
           printf("ival = %d type = %d count = %d \n", $$.ival, $$.type,$$.count);}
Y :   T1  {$$.fval = $1.fval;$$.type = $1.type;
           printf("fval = %f type = %d \n", $$.fval, $$.type);}
     | T2 {$$.fval = $1.fval;$$.type = $1.type;           
           printf("fval = %f type = %d \n", $$.fval, $$.type);}
     ;

%%
void yyerror(char *s)
{printf(" %s  syntax error \n", s);}
    
int main (){ yyparse (); return 0; }

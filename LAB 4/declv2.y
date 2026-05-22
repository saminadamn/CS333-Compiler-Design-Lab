/*C declarations*/
%{ #include <stdio.h>
   int yylex(void);
   void yyerror(char *);
   extern int yychar;
%}

/* YACC Declarations */

%token INT ID 
     
/* Grammar follows */
%%

decl:    type list ';'  {printf("Rule 1 used : Successful Parse \n");}
         ;
type:    INT            {printf("Rule 2 used : SEEN INT \n");}
         ;
list :   list ',' ID   {printf("Rule 3 used: Seen another Identifier \n");}
         | ID          {printf("Rule 4 used :seen First Identifier \n");}
         ;
         ;

%%
void yyerror(char *s)
{printf(" %s  near symbol %c \n", s, (char)yychar);}
int main ()
{  yyparse (); 
   return 0;
}

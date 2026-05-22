/*C declarations*/
%{ #include <stdio.h>
   int yylex(void);
   void yyerror(char *);
   extern int yychar;
%}

/* YACC Declarations - NOT USED IN THIS SCRiPT*/

/* Grammar follows */
%%
decl:    type list ';'  {printf("Rule 1 used : Successful Parse \n");}
         ;
type:    'i'         {printf("Rule 2 used : seen int\n");}
         |'f'        {printf("Rule 3 used : seen float \n");}
         ;
list :   list ',' V   {printf("Rule 4 used : Seen 1 more Identifier \n");}
         | V          {printf("Rule 5 used : Seen First Identifier \n");}
         ;
V    :   'a'          {printf("Rule 6 used : seen Identifier a\n");}
         |'b'         {printf("Rule 7 used : seen Identifier b\n");}
         ;
        ; 

%%
void yyerror(char *s)
{printf(" %s near symbol %c \n", s, (char)yychar); }
int main ()
{  yyparse (); 
   return 0;
}

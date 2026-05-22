 /*C declarations*/
%{ #include <stdio.h>
   #include <string.h>
   extern int yylineno, yychar;
   void yyerror(char *);
   int yylex();
%}

/* YACC Declarations */

%union
{ 
  char* name;
  struct 
  { char * type;
    int width;
  } typeattr; 
}
%token <name> ID 
%token <typeattr> INT FLOAT
%type <typeattr> type decl

%%

dlist : dlist decl ';' { }
      | decl ';'       { }  
      ;
decl  : type ID {$$.type=$1.type; $$.width = $1.width; 
             printf("Identifier : %s type : %s width : %d bytes \n", $2, 
                     $1.type, $1.width);
                 }
      | decl ',' ID 
           { }
      ;
type  : INT {$$.type=$1.type; $$.width = $1.width;}
      | FLOAT{$$.type=$1.type; $$.width = $1.width;}
      ;

%%
void yyerror(char *s)
     {printf(" %s  line number : %d near symbol %c  \n", s, yylineno, (char) yychar); }
    
int main ()
{  // yydebug = 1;
   yyparse (); 
}

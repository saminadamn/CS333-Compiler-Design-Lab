%option noyywrap
%{
  // no C code is placed here
%}
  
ws [ \t\n]+                           
digit  [0-9]
octalnum 0[0-7]+
number {digit}+
delimiter ,|;
				 
%%

{ws}         { }
{octalnum}   { }
{number}     { }
{delimiter}  { }

%%
int main()
{ while(yylex()); 
  return 0;
}

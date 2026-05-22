%option noyywrap
%{
// Not used here 
%}
ws [ \t\n]+
%%
{ws}        {;/* No action */}
"f"         {return 'f';}
"i"         {return 'i';}
a           {return 'a';}
b           {return 'b';}
";"         {return ';';}
","         {return ',';;}
.           {printf(" Unrecognized character %s\n", yytext);}
%%

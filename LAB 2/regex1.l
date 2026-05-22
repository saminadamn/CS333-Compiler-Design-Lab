%option noyywrap
%%
b*c+  {printf("Token 1 found \n");}
a*b  {printf("Token 2 found \n");}
%%
int main()
{ yylex();
}


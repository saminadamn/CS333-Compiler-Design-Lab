%option noyywrap
%%
b*c+  {printf("Token 1 found \n"); return 1;}
a*b  {printf("Token 2 found \n");return 2;}
%%
int main()
{ yylex(); }


%option noyywrap
%%
b*c+    {printf("Token 1: lexeme : %s\n",yytext); }
a*b     {printf("Token 2: lexeme : %s\n",yytext); }
[a-zA-Z] {printf("Character %s is not recognized\n", yytext); }
[\n\t]+;
.      ;
%%
int main()
{       while(yylex());
        return 0;
}

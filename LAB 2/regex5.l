%{
#include <stdio.h>

int lexeme_no = 0;
int token1_count = 0;
int token2_count = 0;
%}

%%
b*c+ {
          lexeme_no++;
          token1_count++;
          printf("Token 1 : %s lexeme : %d\n", yytext, lexeme_no);
       }

a*b {
          lexeme_no++;
          token2_count++;
          printf("Token 2 : %s lexeme : %d\n", yytext, lexeme_no);
       }

[a-zA-Z] {
          printf("Character %s not recognized\n", yytext);
       }

[ \t\n]+ ;
. {
      printf("Character %s not recognized\n", yytext);
  }
%%

int yywrap() {
    return 1;
}

int main() {
    while (yylex());
    printf("Total Lexemes found : %d\n", lexeme_no);
    printf("Token 1 count = %d\n", token1_count);
    printf("Token 2 count = %d\n", token2_count);
    return 0;
}

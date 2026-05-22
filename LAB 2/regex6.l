%{
#include <stdio.h>

int line_no = 1;
FILE *out;
%}

%%
.*\n {
fprintf(out, "%d %s", line_no, yytext);
line_no++;
}

.* {
fprintf(out, "%d %s\n", line_no, yytext);
}
%%

int yywrap() {
return 1;
}

int main() {
out = fopen("output6.txt", "w");
yylex();
fclose(out);
return 0;
}

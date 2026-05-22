%{
#include "y.tab.h"
#include <stdio.h>
%}

letter [a-zA-Z]
digit [0-9]
id {letter}({letter}|{digit})*

%%

int { return INT; }
float { return FLOAT; }

{id} { return ID; }

"," { return ','; }
";" { return ';'; }

[ \t\n] { }

. { printf("Invalid character\n"); }

%%

int yywrap()
{
    return 1;
}


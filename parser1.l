%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern int yylex();
void yyerror(const char *s);

int nextstat = 70;

typedef struct list {
    int label;
    struct list *next;
} node;

node* makelist(int label) {
    node* temp = (node*)malloc(sizeof(node));
    temp->label = label;
    temp->next = NULL;
    return temp;
}

node* merge(node* l1, node* l2) {
    if(!l1) return l2;
    if(!l2) return l1;
    node* temp = l1;
    while(temp->next) temp = temp->next;
    temp->next = l2;
    return l1;
}

void backpatch(node* l, int label) {
    if (l == NULL) return;
    node* temp = l;
    printf("Backpatch : Resolve targets in ");
    while(temp) {
        printf("%d%s", temp->label, temp->next ? ", " : "");
        temp = temp->next;
    }
    printf(" With the label : %d\n", label);
}

char* gen_temp() {
    static int count = 1;
    char* s = (char*)malloc(10);
    sprintf(s, "t%d", count++);
    return s;
}
%}

%union {
    char* str;
    struct {
        struct list *truelist;
        struct list *falselist;
        struct list *nextlist;
        char* place;
        int stat;
    } info;
}

%token <str> ID NUM RELOP
%token WHILE OR AND NOT TRUE_VAL FALSE_VAL
%type <info> B E S Sl M

%right '='
%left OR
%left AND
%left RELOP
%left '+'
%left '/'
%right NOT

%%

/* The '?' logic: handles cases with or without the leading 70 */
Start : NUM S 
      | S ;

S : WHILE M B '{' M Sl '}' {
    backpatch($3.truelist, $5.stat); 
    backpatch($6.nextlist, $2.stat);
    printf("%d: goto %d\n", nextstat++, $2.stat);
    
    printf(" Truelist after processing: ");
    node* t = $3.truelist;
    while(t){ printf("%d%s", t->label, t->next?", ":""); t=t->next; }
    printf("\n Falselist after processing: ");
    node* f = $3.falselist;
    while(f){ printf("%d%s", f->label, f->next?", ":""); f=f->next; }
    printf("\n");
}
| ID '=' E ';' {
    printf("%d: %s := %s\n", nextstat++, $1, $3.place);
    $$.nextlist = NULL;
}
;

Sl : Sl M S {
    backpatch($1.nextlist, $2.stat);
    $$.nextlist = $3.nextlist;
}
| S {
    $$.nextlist = $1.nextlist;
}
;

B : B OR M B {
    backpatch($1.falselist, $3.stat);
    $$.truelist = merge($1.truelist, $4.truelist);
    $$.falselist = $4.falselist;
}
| B AND M B {
    backpatch($1.truelist, $3.stat);
    $$.falselist = merge($1.falselist, $4.falselist);
    $$.truelist = $4.truelist;
}
| NOT B {
    $$.truelist = $2.falselist;
    $$.falselist = $2.truelist;
}
| TRUE_VAL {
    $$.truelist = makelist(nextstat);
    printf("%d: goto ___\n", nextstat++);
}
| E RELOP E {
    $$.truelist = makelist(nextstat);
    $$.falselist = makelist(nextstat + 1);
    printf("%d: if %s %s %s goto ___\n", nextstat, $1.place, $2, $3.place);
    nextstat++;
    printf("%d: goto ___\n", nextstat++);
}
| ID {
    $$.truelist = makelist(nextstat);
    $$.falselist = makelist(nextstat + 1);
    printf("%d: if %s goto ___\n", nextstat, $1);
    nextstat++;
    printf("%d: goto ___\n", nextstat++);
}
;

M : { $$.stat = nextstat; } ;

E : E '+' E {
    $$.place = gen_temp();
    printf("%d: %s := %s + %s\n", nextstat++, $$.place, $1.place, $3.place);
}
| E '/' E {
    $$.place = gen_temp();
    printf("%d: %s := %s / %s\n", nextstat++, $$.place, $1.place, $3.place);
}
| ID { $$.place = $1; }
| NUM { $$.place = $1; }
;

%%

void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }

int main() {
    yyparse();
    return 0;
}

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab-basics.c"

void yyerror(const char *s);
int yylex();

/* Current type info */
char curr_type[10];
int curr_size;

/* Linked list node for identifiers */
struct idlist {
    char* name;
    struct idlist* next;
};

/* Create new list node */
struct idlist* create_node(char* id) {
    struct idlist* node = (struct idlist*)malloc(sizeof(struct idlist));
    node->name = strdup(id);
    node->next = NULL;
    return node;
}

/* Append node at end */
struct idlist* append_node(struct idlist* head, char* id) {
    struct idlist* node = create_node(id);
    if (!head) return node;
    struct idlist* temp = head;
    while (temp->next) temp = temp->next;
    temp->next = node;
    return head;
}

/* Convert list to array */
char** list_to_array(struct idlist* head, int* n) {
    int count = 0;
    struct idlist* temp = head;
    while (temp) { count++; temp = temp->next; }

    char** arr = (char**)malloc(sizeof(char*) * count);
    temp = head;
    int i = 0;
    while (temp) {
        arr[i++] = temp->name;
        temp = temp->next;
    }
    *n = count;
    return arr;
}

%}

%union {
    char* str;
    struct idlist* list;
}

%token <str> ID
%token INT FLOAT CHAR
%token COMMA SEMICOLON

%type <list> idlist

%%

dlist : dlist D
      | D
      ;

D : T idlist SEMICOLON
    {
        int n;
        char** arr = list_to_array($2, &n);
        append_list(arr, n, curr_type, curr_size);
    }
    ;

idlist : idlist COMMA ID
       {
           $$ = append_node($1, $3);
       }
       | ID
       {
           $$ = create_node($1);
       }
       ;

T : INT
    {
        strcpy(curr_type, "int");
        curr_size = 4;
    }
  | FLOAT
    {
        strcpy(curr_type, "float");
        curr_size = 4;
    }
  | CHAR
    {
        strcpy(curr_type, "char");
        curr_size = 1;
    }
  ;

%%

/* Error handler */
void yyerror(const char *s) {
    printf("Parse error: %s\n", s);
}

/* Main function */
int main() {
    printf("Enter declarations (Ctrl+D to end input):\n");
    initialize(symtab, 50);
    yyparse();
    display(symtab);
    return 0;
}

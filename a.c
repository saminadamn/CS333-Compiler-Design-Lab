%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>


struct node {
    unsigned short num;
    struct node * next;
};


void makelist(struct node ** list, short elm);
void merge(struct node ** newlist, struct node *list1, struct node *list2);
void display(FILE* fptr, struct node * list);
void print(struct node * list);
char *gentemp(char *newtemp);


extern int yylex();
void yyerror(char* s);

int nextinstr;
FILE *out_file;
void backpatch(FILE* fptr, struct node* list, int label) {
    if (list == NULL) return;
    struct node* p = list;
    
    printf("Backpatch : Resolve targets in ");
    fprintf(fptr, "Backpatch : Resolve targets in ");
    
    while(p != NULL) {
        printf("%hd", p->num);
        fprintf(fptr, "%hd", p->num);
        if (p->next != NULL) {
            printf(", ");
            fprintf(fptr, ", ");
        }
        p = p->next;
    }
    
    printf(", With label : %d\n", label);
    fprintf(fptr, ", With label : %d\n", label);
}
%}

%union {
    char* name;
    char* relopname;
    struct {
        struct node* truelist;
        struct node* falselist;
    } bexpr;
    struct {
        char* place;
    } expr;
    int instr;
}

%token <name> ID
%token <relopname> RELOP
%token AND OR NOT

%left RELOP    /* Precedence 6 */
%left AND      /* Precedence 7 */
%right NOT     /* Precedence 8 */
%left OR       /* Precedence 9 */
%left '*'      /* Precedence 10 */
%left '+'      /* Precedence 11 */

%type <bexpr> B
%type <expr> E
%type <instr> M

%%

S   : B {
        printf("Truelist after processing ");
        fprintf(out_file, "Truelist after processing ");
        print($1.truelist);
        display(out_file, $1.truelist);
        
        printf("\nFalselist after processing ");
        fprintf(out_file, "\nFalselist after processing ");
        print($1.falselist);
        display(out_file, $1.falselist);
        
        printf("\n");
        fprintf(out_file, "\n");
      }
    ;

B   : B OR M B {
        backpatch(out_file, $1.falselist, $3);
        merge(&($$.truelist), $1.truelist, $4.truelist);
        $$.falselist = $4.falselist;
      }
    | B AND M B {
        backpatch(out_file, $1.truelist, $3);
        $$.truelist = $4.truelist;
        merge(&($$.falselist), $1.falselist, $4.falselist);
      }
    | NOT B {
        $$.truelist = $2.falselist;
        $$.falselist = $2.truelist;
      }
    | '(' B ')' {
        $$.truelist = $2.truelist;
        $$.falselist = $2.falselist;
      }
    | E RELOP E {
        makelist(&($$.truelist), nextinstr);
        makelist(&($$.falselist), nextinstr + 1);
        printf("%d: if %s%s%s goto __\n", nextinstr, $1.place, $2, $3.place);
        fprintf(out_file, "%d: if %s%s%s goto __\n", nextinstr, $1.place, $2, $3.place);
        nextinstr++;
        
        printf("%d: goto __\n", nextinstr);
        fprintf(out_file, "%d: goto __\n", nextinstr);
        nextinstr++;
      }
    | ID {
        makelist(&($$.truelist), nextinstr);
        makelist(&($$.falselist), nextinstr + 1);
        
        printf("%d: if %s goto __\n", nextinstr, $1);
        fprintf(out_file, "%d: if %s goto __\n", nextinstr, $1);
        nextinstr++;
        
        printf("%d: goto __\n", nextinstr);
        fprintf(out_file, "%d: goto __\n", nextinstr);
        nextinstr++;
      }
    | 'T' {
        makelist(&($$.truelist), nextinstr);
        $$.falselist = NULL; 
        printf("%d: goto __\n", nextinstr);
        fprintf(out_file, "%d: goto __\n", nextinstr);
        nextinstr++;
      }
    | 'F' {
        $$.truelist = NULL; 
        makelist(&($$.falselist), nextinstr);
        printf("%d: goto __\n", nextinstr);
        fprintf(out_file, "%d: goto __\n", nextinstr);
        nextinstr++;
      }
    ;

M   : /* empty */ {
        $$ = nextinstr;
      }
    ;

E   : E '+' E {
        $$.place = (char*)malloc(20);
        gentemp($$.place);
        printf("%d: %s := %s + %s\n", nextinstr, $$.place, $1.place, $3.place);
        fprintf(out_file, "%d: %s := %s + %s\n", nextinstr, $$.place, $1.place, $3.place);
        nextinstr++;
      }
    | E '*' E {
        $$.place = (char*)malloc(20);
        gentemp($$.place);
        printf("%d: %s := %s * %s\n", nextinstr, $$.place, $1.place, $3.place);
        fprintf(out_file, "%d: %s := %s * %s\n", nextinstr, $$.place, $1.place, $3.place);
        nextinstr++;
      }
    | ID {
        $$.place = $1;
      }
    ;

%%

void yyerror(char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {

    out_file = fopen("output.txt", "w");
    if (!out_file) {
        perror("Failed to create output.txt");
        return 1;
    }
    
   
    if (scanf("%d", &nextinstr) != 1) {
        fprintf(stderr, "Error reading start label number.\n");
        return 1;
    }
  
    yyparse();
    
    fclose(out_file);
    return 0;
}

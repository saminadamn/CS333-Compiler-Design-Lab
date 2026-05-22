//  This contains a main() to test the symbol table in symtab-functions.c
  #include "list-functions.c"
 
  int main (int argc, char* argv[])
  { struct node *mylist = 0;
    int count = 0;
    FILE *fin = fopen(argv[1],"r");
    char name[20];
    while ( fscanf(fin, "%s", name) != EOF)
    { char* symbol = (char*) malloc(sizeof(name));
      strcpy(symbol, name); printf("%s \n", symbol);
      if (isempty(mylist)) append(&mylist, name);
      else
      { if (find(mylist, symbol) == false) { append(&mylist, name); }
       else
       { // symbol exists - denote error
        printf(" Duplicate Error : Input Symbol %s exists \n", name);
       }
      }
    } 
    printf(" Entries in the List \n");
    display(mylist);
    return 0;
  }

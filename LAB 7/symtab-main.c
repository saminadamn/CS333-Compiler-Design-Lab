//  This contains a main() to test the symbol table in symtab-functions.c
  #include "symtab-basic-functions.c"
 
  int main (int argc, char* argv[])
  { int size = 50;
    struct element stab[size];
    initialize(stab, size);
    char *ptr =(char*)malloc(sizeof("Global")); ptr = stab[0].name;
    strcpy(ptr, "Global"); 
    // initialize(stab, size);
    FILE *fin = fopen(argv[1],"r");
    char name[20];
    int count = 0, index = -1;
    while ( fscanf(fin, "%s", name) != EOF)
    { char* symbol = (char*) malloc(sizeof(name));
      strcpy(symbol, name);
      index = find(symbol, stab);
      if (index == -1) // name does not exist in table insert
      { append(stab, name); }
      else
      { // symbol exists - denote error
        printf(" Duplicate Error : Input Symbol %s exists at index %d with name : %s \n",
                 name, index, stab[index].name);
      }
    } 
    printf(" Total no. of entries %d lastindex %d \n", lastindex+1, lastindex);
    display(stab);
    return 0;
  }

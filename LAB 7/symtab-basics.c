#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

struct element {
    char name[20];
    char type[10];
    int size;
    int offset;
};

struct element symtab[50];
int lastindex = 0;
int offset = 0;

void initialize(struct element symtab[], int size) {
    for (int i = 0; i < size; i++) {
        strcpy(symtab[i].name, "");
        strcpy(symtab[i].type, "");
        symtab[i].size = 0;
        symtab[i].offset = 0;
    }
    lastindex = 0;
    offset = 0;
}

/* Find an identifier in symbol table */
int find(char* id) {
    for (int i = 1; i <= lastindex; i++)
        if (strcmp(symtab[i].name, id) == 0)
            return i;
    return -1;
}

/* Insert single identifier (same as P3) */
void insert(char* name, char* type, int size) {
    int idx = find(name);
    if (idx != -1) {
        if (strcmp(symtab[idx].type, type) == 0)
            printf("Error: redeclaration of '%s' at index [%d]\n", name, idx);
        else
            printf("Error: conflicting types for '%s' as '%s'\n", name, type);
        return;
    }

    lastindex++;
    strcpy(symtab[lastindex].name, name);
    strcpy(symtab[lastindex].type, type);
    symtab[lastindex].size = size;
    symtab[lastindex].offset = offset;

    offset += size;
}

/* Append a list of identifiers */
void append_list(char** list, int n, char* type, int size) {
    for (int i = 0; i < n; i++) {
        insert(list[i], type, size);
    }
}

/* Display symbol table */
void display() {
    printf("\nIndex[0] GST- Total size %d, Entries %d\n", offset, lastindex);
    for (int i = 1; i <= lastindex; i++)
        printf("Index [%d]  %-10s  %-5s  %2d  %2d\n",
               i, symtab[i].name, symtab[i].type, symtab[i].size, symtab[i].offset);
}

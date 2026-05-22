#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

/* Symbol table element structure */
struct element {
    char name[20];   // identifier name
    char type[10];   // data type: int, float, char
    int size;        // size in bytes
    int offset;      // memory offset
};

/* Symbol table and global variables */
struct element symtab[50];
int lastindex;   // last used index in symbol table
int offset;      // next free offset in bytes

/* Initialize symbol table */
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

/* Check if symbol table is empty */
bool isempty(struct element table[]) {
    return (lastindex == 0);
}

/* Return number of entries in symbol table */
int length(struct element table[]) {
    return lastindex;
}

/* Find identifier in symbol table; return index or -1 */
int find(char* id, struct element symtab[]) {
    for (int i = 1; i <= lastindex; i++) {
        if (strcmp(id, symtab[i].name) == 0)
            return i;
    }
    return -1;
}

/* Append a new identifier (basic version without type checks) */
void append(struct element stab[], char *id) {
    if (lastindex >= 49) {
        printf("Symbol table overflow\n");
        return;
    }
    lastindex++;
    strcpy(stab[lastindex].name, id);
    strcpy(stab[lastindex].type, ""); // type unknown initially
    stab[lastindex].size = 0;
    stab[lastindex].offset = 0;
}

/* Insert identifier with semantic checks (type + size + offset) */
void insert(struct element stab[], char *id, char *type, int size) {
    int idx = find(id, stab);

    if (idx != -1) {
        if (strcmp(stab[idx].type, type) == 0) {
            printf("Error: redeclaration of '%s' at index [%d]\n", id, idx);
        } else {
            printf("Error: conflicting types for '%s' as '%s'\n", id, type);
            printf("previous declaration of '%s' with type '%s' at index [%d]\n",
                   id, stab[idx].type, idx);
        }
        return;
    }

    if (lastindex >= 49) {
        printf("Symbol table overflow\n");
        return;
    }

    lastindex++;
    strcpy(stab[lastindex].name, id);
    strcpy(stab[lastindex].type, type);
    stab[lastindex].size = size;
    stab[lastindex].offset = offset;

    offset += size;
}

/* Display the full symbol table */
void display(struct element stab[]) {
    printf("\nIndex[0] GST - Total size %d, Entries %d\n", offset, lastindex);
    for (int i = 1; i <= lastindex; i++) {
        printf("Index [%d]  %-10s  %-5s  %2d  %2d\n",
               i,
               stab[i].name,
               stab[i].type,
               stab[i].size,
               stab[i].offset);
    }
}

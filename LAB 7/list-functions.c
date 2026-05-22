  #include <stdio.h>
  #include <string.h>
  #include <stdlib.h>
  #include <stdbool.h>

  // working with a linked list

  struct node 
  { char name[20];
    struct node * next;
  };
  // list of functions
  // isempty(list) - returns rtue if list is empty false otherwise

  bool isempty ( struct node * list )
  { if ( list == 0 ) return true; else return false; }

  // length(list) - returns the number of elements in list

  int length ( struct node * list )
  { struct node * p = list;
    int count = 0;
    while ( p != 0 ) { count ++; p = p->next; };
    return count;
  }

  bool  find ( struct node * list, char* elm )
  { struct node *p = list;
    bool found = false;
    while ( p != 0 )
    {    // not found, so move to next node
       if ( strcmp(p->name, elm) == 0) 
            { found = true; break;};
        p = p->next;
    };
    return (found);
  }

  // append function to insert an element at the end of a list

  void append ( struct node ** list, char *elm )
  {
    // find the last node of list; empty list is easy to handle
    struct node * p = (struct node*) malloc(sizeof(struct node));
    strcpy(p->name, elm);
    p->next = 0;
    if ( *list == 0 ) *list = p;
    else
    {  struct node * curr = *list;
       struct node * prev = *list;
       while ( curr != 0 )
      {   prev = curr;
          curr = curr->next;
      };
      prev->next = p;
    };
    return ;
  }

  void insert ( struct node ** list, char *elm )
  {
    // insert at head of list
    struct node * p = (struct node*) malloc ( sizeof ( struct node ));
    strcpy ( p->name, elm ) ;
    p->next = *list;
    *list = p;
    return;
  }

  // a function to display a linked list

  void display ( struct node * list )
  { struct node * p = list;
    for ( int i = 1 ; i <= length(list) ; i++ )
    { printf(" element no %d is %s \n", i, (char *)p->name);
      p = p->next;
    };
  }

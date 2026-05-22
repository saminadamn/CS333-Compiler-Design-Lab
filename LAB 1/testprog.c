#include<stdio.h>
#include <stdlib.h>
int a[50000], b[50000];

int main()
{ 
  for ( int k = 0;  k < 100; k++) 
  { for (int i = 0 ; i < 10000; i++)
    { a[i] = 5*i;
      for (int j = 0; j < 10000; j++)
       { b[j] =  j*j;}
      a[i] = a[i]+ b[i];
    }
  }
   
  int index1, index2;
  index1 = rand()%10000;
  index2 = rand()%10000;
  printf(" %d %d %d %d \n", index1, a[index1], index2, b[index2]); 
  return 0;
}

#include <stdio.h>
int main()
{ // sample C program for testing lexical analyser
  int i = 100;
  long sum = 1234567890123;
  char ch1 = 'a', ch2 = '$'; // inline declaration
  char str[40] = "Lexical Analysis";
  sum = i + 02345175 + 0xabcdef;
  for (int j = 0; j < 25; j++) 
  {sum = i + j + 012 + 0X10; 
   if (j%5 == 0)
      printf(" sum = %ld \n", sum);
  }
  return 0;
}

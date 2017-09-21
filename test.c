#include <stdio.h>
#include "y.tab.h"

main ()
{
  int token;
  extern char *yytext;

  while ((tok = yylex()) != 0) {
    printf ("The Token Number is: %d\t The String is: %s\n", token, yytext);
    }
  printf ("%d\t<eof>\n", tok);
}

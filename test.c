#include <stdio.h>
#include "y.tab.h"

main ()
{
  int tok;
  extern char *yytext;

  while ((tok = yylex()) != 0) {
    printf ("Token#: %d\t String: %s\n", tok, yytext);
    }
  printf ("%d\t<eof>\n", tok);
}

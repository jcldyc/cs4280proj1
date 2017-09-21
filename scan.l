%{
	#include <stdio.h>
	#include "y.tab.h"
	int line_num = 0;
%}
L	[A-Za-z]
D	[0-9]
%%

/* checks for a white space here */
[ \t]+ ; 
/* This increments the the line number */
[\n] line_num++;
WHILE { return While; }
DO { return Do; }
IF {return If;}
ELSE {return Else;}
END {reutrn End;}

var {return Var;}
int {return Int;}
real {return Real;}
boolean {return Boolean;}
record {return Record;}
bind {return Bind;}
to {return To;}
assert {return Assert;}
begin {return Begin;}
loop {return Loop;}
exit {return Exit;}
when {return When;}
then {return Then;}
elsif {return Elsif;}

put {return Put;}
or {return Or;}
and {return And;}
not {return Not;}
not"=" {return NotEqual;}
div {return Div;}
mod {return Mod;}


":" {return Colon;}
":=" {return Definition;}
"<" {return LessThan;}
">" {return GreaterThan;}
">=" {return GreaterThanEq;}
"<=" {return LessThanEq;}
"." {return Period;}
"," {return Comma;}






{L}({L}|{D}|_)* {return Identifier;}
{D}+ {return IntConst;}
{D}*\.{D}* {return FloatingPoint;}
[+-]?{D}*\.?{D}*{L}[+-]?{D} {return FloatExponent;}

"=" { return Assign; }
"+" { return Plus; }
"-" { return Minus; }
"*" { return Star; }
"/" { return Slash; }
";" { return Semicolon; }
"(" { return LPar; }
")" { return RPar; }
. { yyerror ("Evil Character!"); }

%%
int yywrap (void) {return 1;}
int yyerror (char *s)
{
	fprintf (stderr, "Error: %s at token %s, in line %d\n", s ,yytext, line_num);
}
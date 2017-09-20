%{
	#include <stdio.h>
	#include "y.tab.h"
	int line_no = 0;
%}
L	[A-Za-z]
D	[0-9]
%%
[ \t]+ ; /* skip white space */
[\n] line_no++; /* count lines */
while { return While; }
do { return Do; }








var {return Var;}
int {return Int;}
real {return Real;}
boolean {return Boolean;}
record {return Record;}
end {return End;}
bind {return Bind;}
to {return To;}
assert {return Assert;}
begin {return Begin;}
loop {return Loop;}
exit {return Exit;}
when {return When;}
if {return If;}
then {return Then;}
elsif {return Elsif;}
else {return Else;}
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






{L}({L}|{D}|_)+ {return Identifier;}
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
. { yyerror ("Unrecognized Character"); }

%%
int yywrap (void) {return 1;}
int yyerror (char *s)
{
	fprintf (stderr, "%s in line %d, token %s\n", s, line_no, yytext);
}
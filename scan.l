%{
	#include <stdio.h>
	#include "y.tab.h"
	int line_num = 0;
%}
L	[A-Za-z]
D	[0-9]
%%


[ \t]+ ; 

[\n] line_num++;
WHILE { return while; }
DO { return do; }

VAR {return Var;}
INT {return Int;}
REAL {return Real;}
BOOLEAN {return Boolean;}
RECORD {return Record;}
BIND {return Bind;}
TO {return To;}
ASSERT {return Assert;}
BEGIN {return Begin;}
LOOP {return Loop;}
EXIT {return Exit;}
WHEN {return When;}
THEN {return Then;}
ELSIF {return Elsif;}
ELSE {return Else;
PUT {return Put;}
OR {return Or;}
AND {return And;}
NOT {return Not;}
NOT"=" {return NotEqual;}
DIV {return Div;}
MOD {return Mod;}
":" {return Colon;}
":=" {return Def;}
"<" {return LesserThan;}
">" {return GreaterThan;}
">=" {return GreaterThanOrEqual;}
"<=" {return LeeserThanOrEqual;}
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
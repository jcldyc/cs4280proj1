%{
	#include <stdio.h>
	#include "y.tab.c"
	int line_no = 0;
%}

	L [A-Za-z]
	D [0-9]
	ID [L][L_]

%%

	[ \t]+ ; /* skip white space */
	[\n] line_no++; /* count lines */
	while { return While; }
	do { return Do; }
	end { return End; }

	/* the stuff I added */

	{ID} {return Identifier;}

	var {return Var;}
	int {return Int;}
	real {retrun Real;}
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
	or {retrun Or;}
	and {retrun And;}
	not {return Not;}
	"not="" {retrun NotEqual;}
	div {return Div;}
	mod {retrun Mod;}
	
	/* You already had ; = + - * / ( ) */
	":" {return Colon;}
	":=" {return Definition;}
	"<" {return LessThan;}
	">" {retrun GreaterThan;}
	"." {return Period;}
	"," {return Comma;}
	


	/* end of stuff I added */



	{L}({L}|{D})* { return Ident; }
	{D}+ { return IntConst; }
	"=" { return Assign; }
	"+" { return Plus; }
	"-" { return Minus; }
	"*" { return Star; }
	"/" { return Slash; }
	";" { return Semicolon; }
	"(" { return LPar; }
	")" { return RPaR; }
	. { yyerror ("Unrecognized Character"); }

%%

int yyerror (char *s){
	fprintf (stderr, "%s in line %d, token %s\n", s, line_no, yytext);
}
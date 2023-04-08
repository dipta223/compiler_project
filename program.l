%{
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include "program.tab.h"

%}
letter [a-zA-Z]+
ID [a-zA-Z][a-zA-Z0-9]*
al [a-zA-Z0-9]+

%%

["<"]{letter}["."]{letter}[">"] {return HEADER;}
[0-9]+ {yylval.number=atoi(yytext);
  		return NUM;}
[0-9]*"."[0-9]+  {yylval.number=atoi(yytext);
  		return NUM;}

"gcd" {return GCD;}
"factorial" { return FACTORIAL;}
"prime" {return PRIME;}
"show" { return SHOW; }
"read" {return INPUT; }
"if"  {return IF;}
"else" {return ELSE;}
"elif" {return ELIF;}
"to" {return TO;}
"for" {return FOR;}
"while" {return WHILE;}
"do" {return DO;}

"float" {return FLOAT;}
"int" {return INT;}
"double" {return DOUBLE;}
"char" {return CHAR;}
"void" {return VD;}
"++"   {return UP;}
"--"    {return UM;}
"eq"    {return EQ;}
"nq"    {return NQ;}
"ln"    {return LN;}
"sin"    {return SIN;}
"cos"    {return COS;}
"tan"    {return TAN;}
"add"    {return PLUS;}
"sub"    {return MIN;}
"mul"    {return MUL;}
"div"    {return DIV;}
"ge"    {return GE;}
"gt"    {return GT;}
"lt"    {return LT;}
"le"    {return LE;}
"and"    {return AND;}
"or"    {return OR;}
"not"    {return NOT;}
"int main()" {return MAIN;}
"switch"  {return SWITCH;}
"def"   {return DEFAULT;}
"case"   {return CASE;}
"comsec" { return TUT;}
"funcall" { return FUNC;}
"rtn" {return RET;}
{ID} {
	 yylval.string = strdup(yytext);
         return VAR;} 
["$"]{al} {yylval.string = strdup(yytext);
         return STR; }
 ["#"]{al} {yylval.string = strdup(yytext);
         return STRNG; }


[-+/*<>=,();{}:~$@^!] {yylval.string=yytext[0];
		return *yytext;}


[ \t\n]*  ;

%%
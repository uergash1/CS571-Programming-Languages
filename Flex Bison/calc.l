%{
	#include <stdio.h>
	#include "calc.tab.h"
%}

float ([0-9]+[\.][0-9]+)
/* id ([a-z]([a-z]|[A-Z]|[0-9])*) */
id [a-z][a-zA-Z0-9]*

%%

";"				{return TOK_SEMICOL;}
"float"				{return TOK_FLOAT;}
"main"				{return TOK_MAIN;}
"print"				{return TOK_PRINT;}
{float}				{sscanf(yytext, "%f", &(yylval.float_val)); return TOK_NUM;}
{id}+				{
					strcpy(yylval.id.name, yytext);
					yylval.id.value=(float)0;
					yylval.id.b=0;
					return TOK_ID;
				}
"="				{return TOK_EQUAL;}
"*"				{return TOK_MUL;}
"-"				{return TOK_SUB;}
"{"				{return TOK_OPAR;}
"}"				{return TOK_CPAR;}
"("				{return TOK_OBRAC;}
")"				{return TOK_CBRAC;}
[ \n]				{yylineno++;}
[ \t]+				{}			
.                               {printf("Lexical analysis error: %s\n", yytext);}

%%

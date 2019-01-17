%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int position = 0;
int block = 0;

void print(char *name);
void update (char *name, float val);
void place (int a, char *name, float val);
int search (char *name);
int searchb (int a);

%}

%token TOK_NUM TOK_PRINT TOK_EQUAL TOK_MUL TOK_SUB TOK_OPAR TOK_CPAR TOK_OBRAC TOK_CBRAC TOK_SEMICOL TOK_FLOAT TOK_ID TOK_MAIN

%union{
        float float_val;
	struct symbol id;
}

%code requires {
	struct symbol
	{
		char name[100];
		float value;
		int b;
	};
}

%code {
	struct symbol s[10000];	
}

%type <float_val> E TOK_NUM
%type <id> TOK_ID

%left TOK_SUB
%left TOK_MUL

%%

Prog:	
	 TOK_MAIN TOK_OBRAC TOK_CBRAC TOK_OPAR Stmts TOK_CPAR
;

Stmts: 
	Stmt TOK_SEMICOL Stmts
	| 
;

Stmt:
	TOK_FLOAT TOK_ID
	{
		place(position, $2.name, $2.value);
	}
	| TOK_ID TOK_EQUAL E
	{
		update($1.name, $3);		
	}
	| TOK_PRINT TOK_ID
	{
		print($2.name);
	}
	| opar Stmts cpar
	{
		
	}
	| TOK_OPAR TOK_CPAR
;

opar:
	TOK_OPAR
	{
		block++;
	}
;

cpar:
	TOK_CPAR
	{
		position = searchb(block);
		block--;
	}
;

E:
	TOK_NUM
	| TOK_ID
	{
		int index = search($1.name);
		$$ = s[index].value;
	}
	| E TOK_SUB E
	{
		$$ = $1 - $3;
	}
	| E TOK_MUL E
	{
		$$ = $1 * $3;
	}
	| TOK_OBRAC E TOK_CBRAC
	{
		$$ = $2;
	}
	| TOK_SUB TOK_NUM
	{
		$$ = -$2;
	}
;


%%


void place(int pos, char *name, float val)
{
	strcpy(s[pos].name, name);
	s[pos].value = val;
	s[pos].b = block;
	position++;
	return;
}


void update(char *name, float val)
{
	int x = search(name);
	if(x!=-1)
	{
		s[x].value = val;
	}
	return;
}

int search(char *name)
{	
	int r = -1;
	int found = 0;
	for(int x = position; x >= 0; x--)
	{
		if(strcmp(name,s[x].name)==0)
		{
			return x;
		}
	}
	return r;
}

void print(char *name)
{
	int x = search(name);
	if(x!=-1)
	{
		printf("%f\n",s[x].value);
	}
	else
	{
		printf("404");
	}
	return;
}

int searchb(int b)
{
	for(int i = position-1; i >= 0; i--)
	{
		if(s[i].b != b)
		{
			//printf("In search position = %i\n",i);
			return i;
		}
	}
}


int yyerror(char *s)
{
	extern yylineno;
	printf("Parsing error: line %d\n",yylineno);
	return 0;
}

int main()
{
	yyparse();
	position = 0;
	block = 0;
	return 0;
}

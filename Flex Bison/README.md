Specifications
==============

Syntax is defined below.

	Prog -> main(){Stmts}
	Stmts -> ε | Stmt; Stmts
	Stmt -> float Id| Id = E | print Id |{Stmts}
	E -> Float | Id | E - E | E * E| (-Float)
	Float -> digit+ . digit+

Stmts is a sequence of statements. float Id is variable declaration. A new variable gets 0.0 as its initial value.

Id is an identifier, which starts with a lower-case letters followed by a sequence of 0 or more (lower case or capital) letters or digits. For example, x, x1, xy, xY are identifiers, but 1x and Ax are not.

Expression E is a floating point (Float), an identifier, or an infix arithmetic expression with operators "-" (subtraction) and “*” (multiplication) only. These two operators are left associative (e.g., 1 - 2 - 3 is equivalent to (1 - 2) - 3). Your program should support both positive and negative floating points (e.g. 0.4, 5.0, (-6.4)).

Id = E assigns the value of an expression E to the variable Id. print Id outputs the value of Id.

If an input does not match any token, output “lexical analysis error: <input>”, where <input> is the input.

If there is any syntax error, you are expected to interpret the program until the statement where you find the error. Also, your error message must contain the line number where the error was found.

Block is a sequence of statements that are grouped together using "{" and "}". This is similar to what goes on in C/C++ and Java. The block construct is used to operate on local variables that may have same names as variables used in enclosing blocks. Blocks may be nested to arbitrary depth (i.e., any statement within a block can itself be a block). Static scoping mechanism (the scoping mechanism used in C) should be used.

Tokens may be separated by any number of white spaces, tabs, or new lines.

Usage
-----

	flex –l calc.l
	bison -dv calc.y
	gcc -o calc calc.tab.c lex.yy.c –lfl
	Execution (example):.
	./calc < input
	
Where input is the name of the input file
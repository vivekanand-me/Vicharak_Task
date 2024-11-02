This Makefile compiles the Flex and Bison specifications, generating the necessary files and linking them into an executable.

# Makefile for the parser

all: parser

parser: asgn4_roll.l asgn4_roll.y
	bison -d asgn4_roll.y
	flex asgn4_roll.l
	gcc -o parser asgn4_roll.tab.c lex.yy.c -lfl

clean:
	rm -f parser asgn4_roll.tab.c asgn4_roll.tab.h lex.yy.c
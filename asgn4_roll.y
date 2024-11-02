This Bison file contains the grammar and parsing rules for the tinyC subset. You can expand the grammar to cover more complex constructs or introduce new rules to enhance it.

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int int_val;
    char* str_val;
}

%token <int_val> NUMBER
%token <str_val> IDENTIFIER
%token EQUAL NOTEQUAL LESSEQUAL GREATEQUAL

%type <int_val> expression

%%
// Grammar rules
program:
    external_declarations
    ;

external_declarations:
    external_declaration
    | external_declarations external_declaration
    ;

external_declaration:
    function_definition
    | declaration
    ;

function_definition:
    IDENTIFIER '(' ')' compound_statement
    ;

declaration:
    IDENTIFIER ';'
    ;

compound_statement:
    '{' statement_list '}'
    ;

statement_list:
    statement
    | statement_list statement
    ;

statement:
    expression_statement
    | declaration
    ;

expression_statement:
    expression ';'
    ;

expression:
    expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | NUMBER
    | IDENTIFIER
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Starting parser...\n");
    return yyparse();
}

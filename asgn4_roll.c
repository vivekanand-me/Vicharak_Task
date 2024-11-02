#include <stdio.h>

extern int yyparse();

int main() {
    printf("Parsing tinyC input...\n");
    yyparse();
    return 0;
}

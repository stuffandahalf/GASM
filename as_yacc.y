%token DECNUM HEXNUM IDENTIFIER
%token POUND COLON PERCENT PERIOD COMMA
%token LDA

%start program

%{
#include <stdio.h>

#define YYSTYPE char *

extern int line_num;
extern int yylex();

void yyerror(const char *str) {
    fprintf(stderr, "error: %s on line number %d\n", str, line_num);
}
%}

%%
program : program statement
        | statement
        ;

statement : label
          | instruction
          ;

label : IDENTIFIER COLON { printf("%s\n", $$); }
      ;

instruction : LDA
            ;

%%

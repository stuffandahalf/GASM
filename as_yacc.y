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

enum addr_mode {
    Inherent,
    Immediate,
    Direct,
    Indirect,
    Extended
};

typedef struct {
    enum addr_mode mode;
    int value;
} Argument;

%}

%%
program : program statement
        | statement
        ;

statement : label
          | instruction
          ;

label : IDENTIFIER COLON
      ;

immediate : POUND DECNUM
          | POUND HEXNUM
          ;

indexed :
        ;

direct_or_indexed : DECNUM
                  | HEXNUM
                  ;

instruction : instruction_lda
            ;

instruction_lda : LDA immediate
                | LDA
                ;

%%

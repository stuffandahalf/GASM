%token DECNUM HEXNUM IDENTIFIER
%token POUND COLON PERCENT PERIOD COMMA
%token LDA ADDA
%token RMB

%start program

%{
#include <stdio.h>
#include <stdint.h>
#include "as.h"

#define YYSTYPE char *

extern int line_num;
extern int yylex();

uint16_t address = 0;

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
            | instruction_adda
            ;

instruction_lda : LDA immediate             { printf("%d\n", LDA); }
                | LDA direct_or_indexed
                ;

instruction_adda : ADDA immediate
                 | ADDA direct_or_indexed
                 ;

%%

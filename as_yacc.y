%token DECNUM HEXNUM IDENTIFIER
%token OPENBRACKET CLOSEBRACKET
%token POUND COLON PERCENT PERIOD COMMA
%token ABX
%token ADCA ADCB
%token LDA ADDA
%token RMB

%start program

%union {
    int ivalue;
    char *svalue;
}

%{
#include <stdio.h>
#include "as.h"

//#ifndef YYSTYPE
//#define YYSTYPE char *
//#define YYSTYPE int;
//#endif

//#define YYSTYPE int

extern int line_num;
extern YYSTYPE yylval;
extern int yylex();

uint16_t address = 0;

void yyerror(const char *str) {
    fprintf(stderr, "error: %s on line number %d\n", str, line_num);
}

void emit(Instruction inst);

%}

%%
program : program statement
        | statement
        ;

statement : label
          | instruction { /*emit($1);*/ }
          ;

label : IDENTIFIER COLON { printf("%s\n", $<svalue>1); }
      ;

immediate : POUND DECNUM { $<ivalue>$ = yylval.ivalue; }
          | POUND HEXNUM { $<ivalue>$ = yylval.ivalue; }
          ;

indexed : OPENBRACKET DECNUM CLOSEBRACKET
        | OPENBRACKET HEXNUM CLOSEBRACKET
        ;

direct_or_indexed : DECNUM
                  | HEXNUM
                  ;

instruction : instruction_abx
            | instruction_adca
            | instruction_lda
            | instruction_adda
            ;

instruction_abx : ABX
                {
                    printf("ABX: %X\n", 0x3A);
                }
                ;

instruction_adca : ADCA immediate
                 {
                     printf("ADCA %d\n", $<ivalue>2);
                 }

instruction_lda : LDA immediate
                {
                    printf("%d\n", $<ivalue>2);
                }
                | LDA direct_or_indexed
                ;

instruction_adda : ADDA immediate
                 | ADDA direct_or_indexed
                 ;

%%

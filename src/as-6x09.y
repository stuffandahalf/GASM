%token D H

%token ORG EQU

%token ABX
%token ADCA ADCB ADCD ADCR
%token ADDA ADDB ADDE ADDF ADDD ADDW ADDR
%token AIM
%token ANDA ANDB ANDCC ANDD ANDR
%token ASLA ASLB ASL ASLD
%token ASRA ASRB ASR ASRD
%token BAND

%%

abx_inherent
    : ABX
    ;

adc_immediate
    : ADCA immediate
    ; 

immediate
    : '#' D
    | '#' hex
    ;

hex
    : '$' H
    ;

%%

#include <stdio.h>

extern char *yytext;
extern int column;

void yyerror(char const *s) {
    fflush(stdout);
    printf("\n%*s\n%*s\n", column, "^", column, s);
}

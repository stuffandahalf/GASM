%token DECNUM HEXNUM IDENTIFIER
%token OPENBRACKET CLOSEBRACKET
%token POUND COLON PERCENT PERIOD COMMA

%token ABX
%token ADCA ADCB ADCD ADCR
%token ADDA ADDB ADDE ADDF
%token ADDD ADDW ADDR
%token AIM
%token ANDA ANDB ANDCC ANDD ANDR
%token ASLA ASLB ASL ASLD
%token ASRA ASRB ASR ASRD
%token BAND
%token BCC BCS BEOR BEQ BGE BGT
%token BHI BHS BIAND BIEOR BIOR
%token BITA BITB BITD BITMD
%token BLE BLO BLS BLT BMI BNE
%token BOR BPL BRA BRN BSR
%token BVC BVS
%token CLRA CLRB CLRD CLRE CLRF CLRW
%token CLR
%token CMPA CMPB CMPE CMPF
%token CMPD CMPS CMPU CMPW CMPX CMPY
%token CMPR
%token COMA COMB COMD COME COMF COMW
%token COM
%token CWAI
%token DAA
%token DECA DECB DECD DECE DECF DECW
%token DEC
%token DIVD
%token DIVQ
%token EIM
%token EORA EORB EORD EORR
%token EXG
%token INCA INCB INCD INCE INCF INCW
%token INC
%token JMP JSR
%token LBCC LBCS LBEQ LBGE LBGT LBHI
%token LBHS LBLE LBLO LBLS LBLT LBMI
%token LBNE LBPL LBRA LBRN LBSR LBVC
%token LBVS
%token LDA LDB LDE LDF
%token LDD LDS LDU LDW LDX LDY
%token LDBT LDMD LDQ
%token LEAS LEAU LEAX LEAY
%token LSLA LSLB LSL LSLD
%token LSRA LSRB LSR LSRD LSRW
%token MUL MULD
%token NEGA NEGB NEGD NEG
%token NOP
%token OIM
%token ORA ORB ORCC ORD ORR
%token PSHS PSHU PSHSW PSHUW
%token PULS PULU PULSW PULUW
%token ROLA ROLB ROL ROLD ROLW
%token RORA RORB ROR RORD RORW
%token RTI RTS
%token SBCA SBCB SBCD SBCR
%token SEX SEXW
%token STA STB STE STF
%token STD STS STU STW STX STY
%token STBT STQ
%token SUBA SUBB SUBE SUBF
%token SUBD SUBW SUBR
%token SWI SWI2 SWI3
%token SYNC
%token TFM TFR
%token TIM
%token TSTA TSTB TSTD TSTE TSTF TSTW
%token TST


%token RMB

%start program

%union {
    int ivalue;
    char *svalue;
}

%{
#include <stdio.h>
#include "as.h"

extern int line_num;
extern YYSTYPE yylval;
extern int yylex();

extern FILE *out_file;

uint16_t address = 0;
int yydebug = 1;

void yyerror(const char *str) {
    fprintf(stderr, "error: %s on line number %d\n", str, line_num);
    remove(out_fname);
}

void emit(Instruction inst);

%}

%%
program : program statement
        | statement
        ;

statement : label
          | instruction { /*emit($1);*/ }
          | 
          ;

/*label : absolute_label
      | relative_label
      ;*/

label : IDENTIFIER COLON { $<svalue>$ = $<svalue>1; printf("%s\n", $<svalue>1); }
      ;

relative_label : PERIOD IDENTIFIER COLON { $<svalue>$ = $<svalue>2; }
               ;

immediate : POUND DECNUM { $<ivalue>$ = yylval.ivalue; }
          | POUND HEXNUM { $<ivalue>$ = yylval.ivalue; }
          ;

indexed : OPENBRACKET DECNUM CLOSEBRACKET
        | OPENBRACKET HEXNUM CLOSEBRACKET
        ;

direct_or_extended : DECNUM
                   | HEXNUM
                   ;

instruction : instruction_abx
            | instruction_adca
            | instruction_adda
            | instruction_lda
            | instruction_sta
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
                | LDA direct_or_extended
                ;

instruction_adda : ADDA immediate
                 | ADDA direct_or_extended
                 ;

instruction_sta : STA direct_or_extended
                ;
%%

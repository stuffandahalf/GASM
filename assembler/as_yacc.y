%token DECNUM HEXNUM IDENTIFIER LABEL
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


%token EQU
%token FDB
%token RMB

%start program

%union {
    int ivalue;
    char *svalue;
}

%{
#include <stdio.h>
#include <string.h>
#include <stdint.h>

extern int line_num;
extern YYSTYPE yylval;
extern int yylex();

//extern FILE *out_file;

uint16_t address = 0;
int yydebug = 1;

void yyerror(const char *str) {
    fprintf(stderr, "error: %s on line number %d\n", str, line_num);
    //remove(out_fname);
}

//void write_bytes(uint8_t *bytes, size_t num);

//label_t *find_label(char *id);

%}

%%
program : program statement
        | statement
        ;

statement : LABEL
          | instruction { /*emit($1);*/ }
          |
          ;

/*label : absolute_label
      | relative_label
      ;*/

//label : IDENTIFIER COLON
      //{
          //puts("label");
          ////$<svalue>$ = strdup($<svalue>1);
          //printf("%s\n", $<svalue>$);
          //$<svalue>$ = $<svalue>1;
          //printf("%s\t%s\n", $<svalue>1, $<svalue>2);
          ///*for (char *c = $<svalue>1; *c != '\0'; c++) {
              //if (*c == ':') {
                  //*c = '\0';
                  //break;
              //}
          //}*/
          ////llappend(labels, newLabel(strdup($<svalue>1), address));
          ////resolve_reference();
      //}
      ///*| PERIOD IDENTIFIER COLON {$<svalue>$ = $<svalue>2; printf("%s\n", $<svalue>2; }*/
      //;

immediate : POUND DECNUM { $<ivalue>$ = yylval.ivalue; }
          | POUND HEXNUM { $<ivalue>$ = yylval.ivalue; }
          ;

direct : DECNUM
       | HEXNUM
       ;

indexed : OPENBRACKET DECNUM CLOSEBRACKET
        | OPENBRACKET HEXNUM CLOSEBRACKET
        | OPENBRACKET IDENTIFIER CLOSEBRACKET
        {

        }
        ;

extended : DECNUM
         | HEXNUM
         ;

instruction : instruction_abx
            | instruction_adca
            | instruction_adcb
            /*| instruction_adcr*/
            | instruction_adcd
            | instruction_adda
            | instruction_addb
            | instruction_adde
            | instruction_addf
            | instruction_addd
            | instruction_addw
            | instruction_addr
            /*| instruction_aim*/
            | instruction_anda
            | instruction_andb
            | instruction_andcc
            | instruction_andd
            | instruction_andr
            | instruction_asla
            | instruction_aslb
            /*| instruction_asl*/
            | instruction_asld
            | instruction_asra
            | instruction_asrb
            /*| instruction_asr*/
            | instruction_asrd
            | instruction_band

            | instruction_inca
            | instruction_incb
            | instruction_incd
            | instruction_ince
            | instruction_incf
            | instruction_incw
            | instruction_lda
            | instruction_ldb
            | instruction_lde
            | instruction_ldf
            /*| instruction_sta*/
            ;

instruction_abx : ABX
                {
                    printf("ABX: %X\n", 0x3A);
                    //uint8_t opcode[] = { 0x3A };
                    //write_bytes(opcode, sizeof(opcode));
                }
                ;

instruction_adca : ADCA immediate
                 {
                     printf("ADCA %X\n", $<ivalue>2);
                     uint8_t opcode[] = { 0x89, $<ivalue>2 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(opcode, sizeof(imm_value));
                 }
                 ;

instruction_adcb : ADCB immediate
                 {
                     uint8_t opcode[] = { 0xC9 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_adcd : ADCD immediate
                 {
                     uint8_t opcode[] = { 0x10, 0x89 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF, $<ivalue>2 >> 8 };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_adcr : ADCR immediate
                 {
                     uint8_t opcode[] = { 0x10, 0x31 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_adda : ADDA immediate
                 {
                     uint8_t opcode[] = { 0x8B };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_addb : ADDB immediate
                 {
                     uint8_t opcode[] = { 0xCB };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_adde : ADDE immediate
                 {
                     uint8_t opcode[] = { 0x11, 0x8B };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_addf : ADDF immediate
                 {
                     uint8_t opcode[] = { 0x11, 0xCB };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_addd : ADDD immediate
                 {
                     uint8_t opcode[] = { 0xC3 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF, $<ivalue>2 >> 8 };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_addw : ADDW immediate
                 {
                     uint8_t opcode[] = { 0x10, 0x8B };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF, $<ivalue>2 >> 8 };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_addr : ADDR immediate
                 {
                     uint8_t opcode[] = { 0x10, 0x30 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

/*instruction_aim : AIM direct
                | AIM indexed
                | AIM extended
                ;*/

instruction_anda : ANDA immediate
                 {
                     uint8_t opcode[] = { 0x84 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_andb : ANDB immediate
                 {
                     uint8_t opcode[] = { 0xC4 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_andcc : ANDCC immediate
                  {
                      uint8_t opcode[] = { 0x1C };
                      //write_bytes(opcode, sizeof(opcode));

                      uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                      //write_bytes(imm_value, sizeof(imm_value));
                  }
                  ;

instruction_andd : ANDD immediate
                 {
                     uint8_t opcode[] = { 0x10, 0x84 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF, $<ivalue>2 >> 8 };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_andr : ANDR immediate
                 {
                     uint8_t opcode[] = { 0x10, 0x34 };
                     //write_bytes(opcode, sizeof(opcode));

                     uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                     //write_bytes(imm_value, sizeof(imm_value));
                 }
                 ;

instruction_asla : ASLA
                 {
                     uint8_t opcode[] = { 0x48 };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_aslb : ASLB
                 {
                     uint8_t opcode[] = { 0x58 };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

/*instruction_asl : ASL direct
                | ASL indexed
                | ASR extended
                ;*/

instruction_asld : ASLD
                 {
                     uint8_t opcode[] = { 0x10, 0x48 };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_asra : ASRA
                 {
                     uint8_t opcode[] = { 0x47 };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_asrb : ASRB
                 {
                     uint8_t opcode[] = { 0x57 };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

/*instruction_asr : ASR direct
                | ASR indexed
                | ASR extended
                ;*/

instruction_asrd : ASRD
                 {
                     uint8_t opcode[] = { 0x10, 0x47 };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_band : BAND direct
                 {
                     uint8_t opcode[] = { 0x11, 0x30 };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_bcc : BCC IDENTIFIER
                | BCC DECNUM
                | BCC HEXNUM
                {
                    uint8_t opcode[] = { 0x24 };
                    //write_bytes(opcode, sizeof(opcode));

                    //uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                    ////write_bytes(imm_value, sizeof(imm_value));
                    int address_diff = $<ivalue>2 - address + 1;
                    if (address_diff > INT8_MAX || address_diff < INT8_MIN) {
                        fprintf(stderr, "Address out of range of BCC");
                        yyerror();
                    }
                    uint8_t diff[] = { (uint8_t)address_diff };
                    //write_bytes(imm_value);

                }
                ;

/* COMPLETE */

instruction_inca : INCA
                 {
                     uint8_t opcode[] = { 0x4C };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_incb : INCB
                 {
                     uint8_t opcode[] = { 0x5C };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_incd : INCD
                 {
                     uint8_t opcode[] = { 0x10, 0x4C };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_ince : INCE
                 {
                     uint8_t opcode[] = { 0x11, 0x4C };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_incf : INCF
                 {
                     uint8_t opcode[] = { 0x11, 0x5C };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_incw : INCW
                 {
                     uint8_t opcode[] = { 0x10, 0x5C };
                     //write_bytes(opcode, sizeof(opcode));
                 }
                 ;

instruction_lda : LDA immediate
                {
                    //printf("%d\n", $<ivalue>2);
                    uint8_t opcode[] = { 0x86 };
                    //write_bytes(opcode, sizeof(opcode));

                    uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                    //write_bytes(imm_value, sizeof(imm_value));
                }
                /*| LDA direct
                | LDA indexed
                | LDA extended*/
                ;

instruction_ldb : LDB immediate
                {
                    uint8_t opcode[] = { 0xC6 };
                    //write_bytes(opcode, sizeof(opcode));

                    uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                    //write_bytes(imm_value, sizeof(imm_value));
                }
                ;

instruction_lde : LDE immediate
                {
                    uint8_t opcode[] = { 0x11, 0x86 };
                    //write_bytes(opcode, sizeof(opcode));

                    uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                    //write_bytes(imm_value, sizeof(imm_value));
                }
                ;

instruction_ldf : LDF immediate
                {
                    uint8_t opcode[] = { 0x11, 0xC6 };
                    //write_bytes(opcode, sizeof(opcode));

                    uint8_t imm_value[] = { $<ivalue>2 & 0xFF };
                    //write_bytes(imm_value, sizeof(imm_value));
                }
                ;

/*instruction_sta : STA direct
                | STA indexed
                | STA extended
                ;*/
%%

/*void write_bytes(uint8_t *bytes, size_t num){
    extern FILE *out_file;

    fwrite(bytes, num, sizeof(uint8_t), out_file);
    address += num;
}*/

/*label_t *find_label(char *id) {
    for (int i = 0; i < labels->size; i++) {
        label_t *label = llat(labels, i);
        if (!strcmp(id, label->id)) {
            return label;
        }
    }
    return NULL;
}*/

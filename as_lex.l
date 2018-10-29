%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

#define dprint(str) { \
    if (yydebug) { \
        puts(str); \
    } \
}

extern int yydebug;
extern char *arch;
extern YYSTYPE yylval;

#define arch_instruction(selected_arch, instruction) if (!strcmp(arch, ((char *)selected_arch))) return instruction

int line_num = 1;

int yywrap() {
    puts("yywrap is called");
    //exit(0);
    return 1;
}

%}

%option caseless
/*%option noyywrap*/
/*%option nodefault*/
/*%option stack*/

%%

"["                 { dprint("OPENBRACKET"); return OPENBRACKET; }
"]"                 { dprint("CLOSEBRACKET"); return CLOSEBRACKET; }

#                   { dprint("POUND"); return POUND; }
:                   { dprint("COLON"); return COLON; }
"%"                 { dprint("PERCENT"); return PERCENT; }
"."                 { dprint("PERIOD"); return PERIOD; }
","                 { dprint("COMMA"); return COMMA; }

"ABX"               { dprint("ABX"); return ABX; }

"ADCA"              { dprint("ADCA"); return ADCA; }
"ADCB"              { dprint("ADCB"); return ADCB; }
"ADCD"              { dprint("ADCD"); arch_instruction("6309", ADCD); }
"ADCR"              { dprint("ADCR"); arch_instruction("6309", ADCR); }

"ADDA"              { dprint("ADDA"); return ADDA; }
"ADDB"              { dprint("ADDB"); return ADDB; }
"ADDE"              { dprint("ADDE"); arch_instruction("6309", ADDE); }
"ADDF"              { dprint("ADDF"); arch_instruction("6309", ADDF); }
"ADDD"              { dprint("ADDD"); return ADDD; }
"ADDW"              { dprint("ADDW"); arch_instruction("6309", ADDW); }
"ADDR"              { dprint("ADDR"); arch_instruction("6309", ADDR); }

"AIM"               { dprint("AIM"); return AIM; }

"ANDA"              { dprint("ANDA"); return ANDA; }
"ANDB"              { dprint("ANDB"); return ANDB; }
"ANDCC"             { dprint("ANDCC"); return ANDCC; }
"ANDD"              { dprint("ANDD"); arch_instruction("6309", ANDD); }
"ANDR"              { dprint("ANDR"); arch_instruction("6309", ANDR); }

"ASLA"              { dprint("ASLA"); return ASLA; }
"ASLB"              { dprint("ASLB"); return ASLB; }
"ASL"               { dprint("ASL"); return ASL; }
"ASLD"              { dprint("ASLD"); arch_instruction("6309", ASLD); }

"ASRA"              { dprint("ASRA"); return ASRA; }
"ASRB"              { dprint("ASRB"); return ASRB; }
"ASR"               { dprint("ASR"); return ASR; }
"ASRD"              { dprint("ASRF"); arch_instruction("6309", ASRD); }

"BAND"              { dprint("BAND"); arch_instruction("6309", BAND); }

"BCC"               { dprint("BCC"); return BCC; }
"BCS"               { dprint("BCS"); return BCS; }
"BEOR"              { dprint("BEOR"); arch_instruction("6309", BEOR); }
"BEQ"               { dprint("BEQ"); return BEQ; }
"BGE"               { dprint("BGE"); return BGE; }
"BGT"               { dprint("BGT"); return BGT; }
"BHI"               { dprint("BHI"); return BHI; }
"BHS"               { dprint("BHS"); return BHS; }

"BIAND"             { dprint("BIAND"); arch_instruction("6309", BIAND); }
"BIEOR"             { dprint("BIEOR"); arch_instruction("6309", BIEOR); }
"BIOR"              { dprint("BIOR"); arch_instruction("6309", BIOR); }

"BITA"              { dprint("BITA"); return BITA; }
"BITB"              { dprint("BITB"); return BITB; }
"BITD"              { dprint("BITD"); arch_instruction("6309", BITD); }
"BITMD"             { dprint("BITMD"); arch_instruction("6309", BITMD); }

"BLE"               { dprint("BLE"); return BLE; }
"BLO"               { dprint("BLO"); return BLO; }
"BLS"               { dprint("BLS"); return BLS; }
"BLT"               { dprint("BLT"); return BLT; }
"BMI"               { dprint("BMI"); return BMI; }
"BNE"               { dprint("BNE"); return BNE; }

"BOR"               { dprint("BOR"); arch_instruction("6309", BOR); }

"BPL"               { dprint("BPL"); return BPL; }
"BRA"               { dprint("BRA"); return BRA; }
"BRN"               { dprint("BRN"); return BRN; }
"BSR"               { dprint("BSR"); return BSR; }
"BVC"               { dprint("BVC"); return BVC; }
"BVS"               { dprint("BVS"); return BVS; }

"CLRA"              { dprint("CLRA"); return CLRA; }
"CLRB"              { dprint("CLRB"); return CLRB; }
"CLRD"              { dprint("CLRD"); arch_instruction("6309", CLRD); }
"CLRE"              { dprint("CLRE"); arch_instruction("6309", CLRE); }
"CLRF"              { dprint("CLRF"); arch_instruction("6309", CLRF); }
"CLRW"              { dprint("CLRW"); arch_instruction("6309", CLRW); }
"CLR"               { dprint("CLR"); return CLR; }

"CMPA"              { dprint("CMPA"); return CMPA; }
"CMPB"              { dprint("CMPB"); return CMPB; }
"CMPE"              { dprint("CMPE"); arch_instruction("6309", CMPE); }
"CMPF"              { dprint("CMPF"); arch_instruction("6309", CMPF); }
"CMPD"              { dprint("CMPD"); return CMPD; }
"CMPS"              { dprint("CMPS"); return CMPS; }
"CMPU"              { dprint("CMPU"); return CMPU; }
"CMPW"              { dprint("CMPW"); arch_instruction("6309", CMPW); }
"CMPX"              { dprint("CMPX"); return CMPX; }
"CMPY"              { dprint("CMPY"); return CMPY; }
"CMPR"              { dprint("CMPR"); arch_instruction("6309", CMPR); }

"COMA"              { dprint("COMA"); return COMA; }
"COMB"              { dprint("COMB"); return COMB; }
"COMD"              { dprint("COMD"); arch_instruction("6309", COMD); }
"COME"              { dprint("COME"); arch_instruction("6309", COME); }
"COMF"              { dprint("COMF"); arch_instruction("6309", COMF); }
"COMW"              { dprint("COMW"); arch_instruction("6309", COMW); }
"COM"               { dprint("COM"); return COM; }

"CWAI"              { dprint("CWAI"); return CWAI; }

"DAA"               { dprint("DAA"); return DAA; }

"DECA"              { dprint("DECA"); return DECA; }
"DECB"              { dprint("DECB"); return DECB; }
"DECD"              { dprint("DECD"); arch_instruction("6309", DECD); }
"DECE"              { dprint("DECE"); arch_instruction("6309", DECE); }
"DECF"              { dprint("DECF"); arch_instruction("6309", DECF); }
"DECW"              { dprint("DECW"); arch_instruction("6309", DECW); }
"DEC"               { dprint("DEC"); return DEC; }

"DIVD"              { dprint("DIVD"); arch_instruction("6309", DIVD); }
"DIVQ"              { dprint("DIVQ"); arch_instruction("6309", DIVQ); }

"EIM"               { dprint("EIM"); arch_instruction("6309", EIM); }

"EORA"              { dprint("EORA"); return EORA; }
"EORB"              { dprint("EORB"); return EORB; }
"EORD"              { dprint("EORD"); arch_instruction("6309", EORD); }
"EORR"              { dprint("EORR"); arch_instruction("6309", EORR); }

"EXG"               { dprint("EXG"); return EXG; }

"INCA"              { dprint("INCA"); return INCA; }
"INCB"              { dprint("INCB"); return INCB; }
"INCD"              { dprint("INCD"); arch_instruction("6309", INCD); }
"INCE"              { dprint("INCE"); arch_instruction("6309", INCE); }
"INCF"              { dprint("INCF"); arch_instruction("6309", INCF); }
"INCW"              { dprint("INCW"); arch_instruction("6309", INCW); }
"INC"               { dprint("INC"); return INC; }

"JMP"               { dprint("JMP"); return JMP; }
"JSR"               { dprint("JSR"); return JSR; }

"LBCC"              { dprint("LBCC"); return LBCC; }
"LBCS"              { dprint("LBCS"); return LBCS; }
"LBEQ"              { dprint("LBEQ"); return LBEQ; }
"LBGE"              { dprint("LBGE"); return LBGE; }
"LBGT"              { dprint("LBGT"); return LBGT; }
"LBHI"              { dprint("LBHI"); return LBHI; }
"LBHS"              { dprint("LBHS"); return LBHS; }
"LBLE"              { dprint("LBLE"); return LBLE; }
"LBLO"              { dprint("LBLO"); return LBLO; }
"LBLS"              { dprint("LBLS"); return LBLS; }
"LBLT"              { dprint("LBLT"); return LBLT; }
"LBMI"              { dprint("LBMI"); return LBMI; }
"LBNE"              { dprint("LBNE"); return LBNE; }
"LBPL"              { dprint("LBPL"); return LBPL; }
"LBRA"              { dprint("LBRA"); return LBRA; }
"LBRN"              { dprint("LBRN"); return LBRN; }
"LBSR"              { dprint("LBSR"); return LBSR; }
"LBVC"              { dprint("LBVC"); return LBVC; }
"LBVS"              { dprint("LBVS"); return LBVS; }

"LDA"               { dprint("LDA"); return LDA; }
"LDB"               { dprint("LDB"); return LDB; }
"LDE"               { dprint("LDE"); arch_instruction("6309", LDE); }
"LDF"               { dprint("LDF"); arch_instruction("6309", LDF); }
"LDD"               { dprint("LDD"); return LDD; }
"LDS"               { dprint("LDS"); return LDS; }
"LDU"               { dprint("LDU"); return LDU; }
"LDW"               { dprint("LDW"); arch_instruction("6309", LDW); }
"LDX"               { dprint("LDX"); return LDX; }
"LDY"               { dprint("LDY"); return LDY; }
"LDBT"              { dprint("LDBT"); arch_instruction("6309", LDBT); }
"LDMD"              { dprint("LDMD"); arch_instruction("6309", LDMD); }
"LDQ"               { dprint("LDQ"); arch_instruction("6309", LDQ); }

"LEAS"              { dprint("LEAS"); return LEAS; }
"LEAU"              { dprint("LEAU"); return LEAU; }
"LEAX"              { dprint("LEAX"); return LEAX; }
"LEAY"              { dprint("LEAY"); return LEAY; }

"LSLA"              { dprint("LSLA"); return LSLA; }
"LSLB"              { dprint("LSLB"); return LSLB; }
"LSL"               { dprint("LSL"); return LSL; }
"LSLD"              { dprint("LSLD"); arch_instruction("6309", LSLD); }

"LSRA"              { dprint("LSRA"); return LSRA; }
"LSRB"              { dprint("LSRB"); return LSRB; }
"LSR"               { dprint("LSR"); return LSR; }
"LSRD"              { dprint("LSRD"); arch_instruction("6309", LSRD); }
"LSRW"              { dprint("LSRW"); arch_instruction("6309", LSRW); }

"MUL"               { dprint("MUL"); return MUL; }
"MULD"              { dprint("MULD"); arch_instruction("6309", MULD); }

"NEGA"              { dprint("NEGA"); return NEGA; }
"NEGB"              { dprint("NEGB"); return NEGB; }
"NEGD"              { dprint("NEGD"); arch_instruction("6309", NEGD); }
"NEG"               { dprint("NEG"); return NEG; }

"NOP"               { dprint("NOP"); return NOP; }

"OIM"               { dprint("OIM"); arch_instruction("6309", OIM); }

"ORA"               { dprint("ORA"); return ORA; }
"ORB"               { dprint("ORB"); return ORB; }
"ORCC"              { dprint("ORCC"); return ORCC; }
"ORD"               { dprint("ORD"); arch_instruction("6309", ORD); }
"ORR"               { dprint("ORR"); arch_instruction("6309", ORR); }

"PSHS"              { dprint("PSHS"); return PSHS; }
"PSHU"              { dprint("PSHU"); return PSHU; }
"PSHSW"             { dprint("PSHSW"); arch_instruction("6309", PSHSW); }
"PSHUW"             { dprint("PSHUW"); arch_instruction("6309", PSHUW); }

"PULS"              { dprint("PULS"); return PULS; }
"PULU"              { dprint("PULU"); return PULU; }
"PULSW"             { dprint("PULSW"); arch_instruction("6309", PULSW); }
"PULUW"             { dprint("PULUW"); arch_instruction("6309", PULUW); }

"ROLA"              { dprint("ROLA"); return ROLA; }
"ROLB"              { dprint("ROLB"); return ROLB; }
"ROL"               { dprint("ROL"); return ROL; }
"ROLD"              { dprint("ROLD"); arch_instruction("6309", ROLD); }
"ROLW"              { dprint("ROLW"); arch_instruction("6309", ROLW); }

"RORA"              { dprint("RORA"); return RORA; }
"RORB"              { dprint("RORB"); return RORB; }
"ROR"               { dprint("ROR"); return ROR; }
"RORD"              { dprint("RORD"); arch_instruction("6309", RORD); }
"RORW"              { dprint("RORW"); arch_instruction("6309", RORW); }

"RTI"               { dprint("RTI"); return RTI; }
"RTS"               { dprint("RTS"); return RTS; }

"SBCA"              { dprint("SBCA"); return SBCA; }
"SBCB"              { dprint("SBCB"); return SBCB; }
"SBCD"              { dprint("SBCD"); arch_instruction("6309", SBCD); }
"SBCR"              { dprint("SBCR"); arch_instruction("6309", SBCR); }

"SEX"               { dprint("SEX"); return SEX; }
"SEXW"              { dprint("SEXW"); arch_instruction("6309", SEXW); }

"STA"               { dprint("STA"); return STA; }
"STB"               { dprint("STB"); return STB; }
"STE"               { dprint("STE"); arch_instruction("6309", STE); }
"STF"               { dprint("STF"); arch_instruction("6309", STF); }
"STD"               { dprint("STD"); return STD; }
"STS"               { dprint("STS"); return STS; }
"STU"               { dprint("STU"); return STU; }
"STW"               { dprint("STW"); arch_instruction("6309", STW); }
"STX"               { dprint("STX"); return STX; }
"STY"               { dprint("STY"); return STY; }
"STBT"              { dprint("STBT"); arch_instruction("6309", STBT); }
"STQ"               { dprint("STQ"); arch_instruction("6309", STQ); }

"SUBA"              { dprint("SUBA"); return SUBA; }
"SUBB"              { dprint("SUBB"); return SUBB; }
"SUBE"              { dprint("SUBE"); arch_instruction("6309", SUBE); }
"SUBF"              { dprint("SUBF"); arch_instruction("6309", SUBF); }
"SUBD"              { dprint("SUBD"); return SUBD; }
"SUBW"              { dprint("SUBW"); arch_instruction("6309", SUBW); }
"SUBR"              { dprint("SUBR"); arch_instruction("6309", SUBR); }

"SWI"               { dprint("SWI"); return SWI; }
"SWI2"              { dprint("SWI2"); return SWI2; }
"SWI3"              { dprint("SWI3"); return SWI3; }

"SYNC"              { dprint("SYNC"); return SYNC; }

"TFM"               { dprint("TFM"); arch_instruction("6309", TFM); }
"TFR"               { dprint("TFR"); return TFR; }

"TIM"               { dprint("TIM"); arch_instruction("6309", TIM); }

"TSTA"              { dprint("TSTA"); return TSTA; }
"TSTB"              { dprint("TSTB"); return TSTB; }
"TSTD"              { dprint("TSTD"); arch_instruction("6309", TSTD); }
"TSTE"              { dprint("TSTE"); arch_instruction("6309", TSTE); }
"TSTF"              { dprint("TSTF"); arch_instruction("6309", TSTF); }
"TSTW"              { dprint("TSTW"); arch_instruction("6309", TSTW); }
"TST"               { dprint("TST"); return TST; }


"EQU"               { dprint("EQU"); return EQU; }
"FDB"               { dprint("FDB"); return FDB; }
"RMB"               { dprint("RMB"); return RMB; }

-?[0-9]+            {
    dprint("DECNUM");
    yylval.ivalue = atoi(yytext);
    printf("%X\n", yylval.ivalue);
    printf("%X\n", (uint8_t)yylval.ivalue);
    return DECNUM;
}
($|0x)[0-9A-F]+     {
    dprint("HEXNUM");
    (yytext[0] == '$') ? (yytext++) : (yytext += 2);
    yylval.ivalue = (int)strtol(yytext, NULL, 16);
    printf("%d\n", yylval.ivalue);
    return HEXNUM;
}
[_A-Z][_A-Z0-9]*:   { dprint("LABEL"); yylval.svalue = yytext; yylval.svalue[strlen(yytext) - 1] = '\0'; return LABEL; }
[_A-Z][_A-Z0-9]*    { dprint("IDENTIFIER"); yylval.svalue = yytext; return IDENTIFIER; }

";".*               { dprint("COMMENT"); }

[ \t    ]+
\n                  { line_num++; }
.

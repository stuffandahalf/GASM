%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

#define dprint(str) { \
    if (yydebug) { \
        puts(str); \
    } \
}

extern int yydebug;
extern char *arch;
extern YYSTYPE yylval;

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

%start _6309

%%

"["                 { dprint("OPENBRACKET"); printf("%d\n", _6309); return OPENBRACKET; }
"]"                 { dprint("CLOSEBRACKET"); return CLOSEBRACKET; }

#                   { dprint("POUND"); return POUND; }
:                   { dprint("COLON"); return COLON; }
"%"                 { dprint("PERCENT"); return PERCENT; }
"."                 { dprint("PERIOD"); return PERIOD; }
","                 { dprint("COMMA"); return COMMA; }

"ABX"               { dprint("ABX"); return ABX; }

"ADCA"              { dprint("ADCA"); return ADCA; }
"ADCB"              { dprint("ADCB"); return ADCB; }
<_6309>"ADCD"       { dprint("ADCD"); return ADCD; }
<_6309>"ADCR"       { dprint("ADCR"); return ADCR; }

"ADDA"              { dprint("ADDA"); return ADDA; }
"ADDB"              { dprint("ADDB"); return ADDB; }
<_6309>"ADDE"       { dprint("ADDE"); return ADDE; }
<_6309>"ADDF"       { dprint("ADDF"); return ADDF; }
"ADDD"              { dprint("ADDD"); return ADDD; }
<_6309>"ADDW"       { dprint("ADDW"); return ADDW; }
<_6309>"ADDR"       { dprint("ADDR"); return ADDR; }

"AIM"               { dprint("AIM"); return AIM; }

"ANDA"              { dprint("ANDA"); return ANDA; }
"ANDB"              { dprint("ANDB"); return ANDB; }
"ANDCC"             { dprint("ANDCC"); return ANDCC; }
<_6309>"ANDD"       { dprint("ANDD"); return ANDD; }
<_6309>"ANDR"       { dprint("ANDR"); return ANDR; }

"ASLA"              { dprint("ASLA"); return ASLA; }
"ASLB"              { dprint("ASLB"); return ASLB; }
"ASL"               { dprint("ASL"); return ASL; }
<_6309>"ASLD"       { dprint("ASLD"); return ASLD; }

"ASRA"              { dprint("ASRA"); return ASRA; }
"ASRB"              { dprint("ASRB"); return ASRB; }
"ASR"               { dprint("ASR"); return ASR; }
<_6309>"ASRD"       { dprint("ASRF"); return ASRD; }

<_6309>"BAND"       { dprint("BAND"); return BAND; }

"BCC"               { dprint("BCC"); return BCC; }
"BCS"               { dprint("BCS"); return BCS; }
<_6309>"BEOR"       { dprint("BEOR"); return BEOR; }
"BEQ"               { dprint("BEQ"); return BEQ; }
"BGE"               { dprint("BGE"); return BGE; }
"BGT"               { dprint("BGT"); return BGT; }
"BHI"               { dprint("BHI"); return BHI; }
"BHS"               { dprint("BHS"); return BHS; }

<_6309>"BIAND"      { dprint("BIAND"); return BIAND; }
<_6309>"BIEOR"      { dprint("BIEOR"); return BIEOR; }
<_6309>"BIOR"       { dprint("BIOR"); return BIOR; }

"BITA"              { dprint("BITA"); return BITA; }
"BITB"              { dprint("BITB"); return BITB; }
<_6309>"BITD"       { dprint("BITD"); return BITD; }
<_6309>"BITMD"      { dprint("BITMD"); return BITMD; }

"BLE"               { dprint("BLE"); return BLE; }
"BLO"               { dprint("BLO"); return BLO; }
"BLS"               { dprint("BLS"); return BLS; }
"BLT"               { dprint("BLT"); return BLT; }
"BMI"               { dprint("BMI"); return BMI; }
"BNE"               { dprint("BNE"); return BNE; }

<_6309>"BOR"        { dprint("BOR"); return BOR; }

"BPL"               { dprint("BPL"); return BPL; }
"BRA"               { dprint("BRA"); return BRA; }
"BRN"               { dprint("BRN"); return BRN; }
"BSR"               { dprint("BSR"); return BSR; }
"BVC"               { dprint("BVC"); return BVC; }
"BVS"               { dprint("BVS"); return BVS; }

"CLRA"              { dprint("CLRA"); return CLRA; }
"CLRB"              { dprint("CLRB"); return CLRB; }
<_6309>"CLRD"       { dprint("CLRD"); return CLRD; }
<_6309>"CLRE"       { dprint("CLRE"); return CLRE; }
<_6309>"CLRF"       { dprint("CLRF"); return CLRF; }
<_6309>"CLRW"       { dprint("CLRW"); return CLRW; }
"CLR"               { dprint("CLR"); return CLR; }

"CMPA"              { dprint("CMPA"); return CMPA; }
"CMPB"              { dprint("CMPB"); return CMPB; }
<_6309>"CMPE"       { dprint("CMPE"); return CMPE; }
<_6309>"CMPF"       { dprint("CMPF"); return CMPF; }
"CMPD"              { dprint("CMPD"); return CMPD; }
"CMPS"              { dprint("CMPS"); return CMPS; }
"CMPU"              { dprint("CMPU"); return CMPU; }
<_6309>"CMPW"       { dprint("CMPW"); return CMPW; }
"CMPX"              { dprint("CMPX"); return CMPX; }
"CMPY"              { dprint("CMPY"); return CMPY; }
<_6309>"CMPR"       { dprint("CMPR"); return CMPR; }

"COMA"              { dprint("COMA"); return COMA; }
"COMB"              { dprint("COMB"); return COMB; }
<_6309>"COMD"       { dprint("COMD"); return COMD; }
<_6309>"COME"       { dprint("COME"); return COME; }
<_6309>"COMF"       { dprint("COMF"); return COMF; }
<_6309>"COMW"       { dprint("COMW"); return COMW; }
"COM"               { dprint("COM"); return COM; }

"CWAI"              { dprint("CWAI"); return CWAI; }

"DAA"               { dprint("DAA"); return DAA; }

"DECA"              { dprint("DECA"); return DECA; }
"DECB"              { dprint("DECB"); return DECB; }
<_6309>"DECD"       { dprint("DECD"); return DECD; }
<_6309>"DECE"       { dprint("DECE"); return DECE; }
<_6309>"DECF"       { dprint("DECF"); return DECF; }
<_6309>"DECW"       { dprint("DECW"); return DECW; }
"DEC"               { dprint("DEC"); return DEC; }

<_6309>"DIVD"       { dprint("DIVD"); return DIVD; }
<_6309>"DIVQ"       { dprint("DIVQ"); return DIVQ; }

<_6309>"EIM"        { dprint("EIM"); return EIM; }

"EORA"              { dprint("EORA"); return EORA; }
"EORB"              { dprint("EORB"); return EORB; }
<_6309>"EORD"       { dprint("EORD"); return EORD; }
<_6309>"EORR"       { dprint("EORR"); return EORR; }

"EXG"               { dprint("EXG"); return EXG; }

"INCA"              { dprint("INCA"); return INCA; }
"INCB"              { dprint("INCB"); return INCB; }
<_6309>"INCD"       { dprint("INCD"); return INCD; }
<_6309>"INCE"       { dprint("INCE"); return INCE; }
<_6309>"INCF"       { dprint("INCF"); return INCF; }
<_6309>"INCW"       { dprint("INCW"); return INCW; }
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
<_6309>"LDE"        { dprint("LDE"); return LDE; }
<_6309>"LDF"        { dprint("LDF"); return LDF; }
"LDD"               { dprint("LDD"); return LDD; }
"LDS"               { dprint("LDS"); return LDS; }
"LDU"               { dprint("LDU"); return LDU; }
<_6309>"LDW"        { dprint("LDW"); return LDW; }
"LDX"               { dprint("LDX"); return LDX; }
"LDY"               { dprint("LDY"); return LDY; }
<_6309>"LDBT"       { dprint("LDBT"); return LDBT; }
<_6309>"LDMD"       { dprint("LDMD"); return LDMD; }
<_6309>"LDQ"        { dprint("LDQ"); return LDQ; }

"LEAS"              { dprint("LEAS"); return LEAS; }
"LEAU"              { dprint("LEAU"); return LEAU; }
"LEAX"              { dprint("LEAX"); return LEAX; }
"LEAY"              { dprint("LEAY"); return LEAY; }

"LSLA"              { dprint("LSLA"); return LSLA; }
"LSLB"              { dprint("LSLB"); return LSLB; }
"LSL"               { dprint("LSL"); return LSL; }
<_6309>"LSLD"       { dprint("LSLD"); return LSLD; }

"LSRA"              { dprint("LSRA"); return LSRA; }
"LSRB"              { dprint("LSRB"); return LSRB; }
"LSR"               { dprint("LSR"); return LSR; }
<_6309>"LSRD"       { dprint("LSRD"); return LSRD; }
<_6309>"LSRW"       { dprint("LSRW"); return LSRW; }

"MUL"               { dprint("MUL"); return MUL; }
<_6309>"MULD"       { dprint("MULD"); return MULD; }

"NEGA"              { dprint("NEGA"); return NEGA; }
"NEGB"              { dprint("NEGB"); return NEGB; }
<_6309>"NEGD"       { dprint("NEGD"); return NEGD; }
"NEG"               { dprint("NEG"); return NEG; }

"NOP"               { dprint("NOP"); return NOP; }

<_6309>"OIM"        { dprint("OIM"); return OIM; }

"ORA"               { dprint("ORA"); return ORA; }
"ORB"               { dprint("ORB"); return ORB; }
"ORCC"              { dprint("ORCC"); return ORCC; }
<_6309>"ORD"        { dprint("ORD"); return ORD; }
<_6309>"ORR"        { dprint("ORR"); return ORR; }

"PSHS"              { dprint("PSHS"); return PSHS; }
"PSHU"              { dprint("PSHU"); return PSHU; }
<_6309>"PSHSW"      { dprint("PSHSW"); return PSHSW; }
<_6309>"PSHUW"      { dprint("PSHUW"); return PSHUW; }

"PULS"              { dprint("PULS"); return PULS; }
"PULU"              { dprint("PULU"); return PULU; }
<_6309>"PULSW"      { dprint("PULSW"); return PULSW; }
<_6309>"PULUW"      { dprint("PULUW"); return PULUW; }

"ROLA"              { dprint("ROLA"); return ROLA; }
"ROLB"              { dprint("ROLB"); return ROLB; }
"ROL"               { dprint("ROL"); return ROL; }
<_6309>"ROLD"       { dprint("ROLD"); return ROLD; }
<_6309>"ROLW"       { dprint("ROLW"); return ROLW; }

"RORA"              { dprint("RORA"); return RORA; }
"RORB"              { dprint("RORB"); return RORB; }
"ROR"               { dprint("ROR"); return ROR; }
<_6309>"RORD"       { dprint("RORD"); return RORD; }
<_6309>"RORW"       { dprint("RORW"); return RORW; }

"RTI"               { dprint("RTI"); return RTI; }
"RTS"               { dprint("RTS"); return RTS; }

"SBCA"              { dprint("SBCA"); return SBCA; }
"SBCB"              { dprint("SBCB"); return SBCB; }
<_6309>"SBCD"       { dprint("SBCD"); return SBCD; }
<_6309>"SBCR"       { dprint("SBCR"); return SBCR; }

"SEX"               { dprint("SEX"); return SEX; }
<_6309>"SEXW"       { dprint("SEXW"); return SEXW; }

"STA"               { dprint("STA"); return STA; }
"STB"               { dprint("STB"); return STB; }
<_6309>"STE"        { dprint("STE"); return STE; }
<_6309>"STF"        { dprint("STF"); return STF; }
"STD"               { dprint("STD"); return STD; }
"STS"               { dprint("STS"); return STS; }
"STU"               { dprint("STU"); return STU; }
<_6309>"STW"        { dprint("STW"); return STW; }
"STX"               { dprint("STX"); return STX; }
"STY"               { dprint("STY"); return STY; }
<_6309>"STBT"       { dprint("STBT"); return STBT; }
<_6309>"STQ"        { dprint("STQ"); return STQ; }

"SUBA"              { dprint("SUBA"); return SUBA; }
"SUBB"              { dprint("SUBB"); return SUBB; }
<_6309>"SUBE"       { dprint("SUBE"); return SUBE; }
<_6309>"SUBF"       { dprint("SUBF"); return SUBF; }
"SUBD"              { dprint("SUBD"); return SUBD; }
<_6309>"SUBW"       { dprint("SUBW"); return SUBW; }
<_6309>"SUBR"       { dprint("SUBR"); return SUBR; }

"SWI"               { dprint("SWI"); return SWI; }
"SWI2"              { dprint("SWI2"); return SWI2; }
"SWI3"              { dprint("SWI3"); return SWI3; }

"SYNC"              { dprint("SYNC"); return SYNC; }

<_6309>"TFM"        { dprint("TFM"); return TFM; }
"TFR"               { dprint("TFR"); return TFR; }

<_6309>"TIM"        { dprint("TIM"); return TIM; }

"TSTA"              { dprint("TSTA"); return TSTA; }
"TSTB"              { dprint("TSTB"); return TSTB; }
<_6309>"TSTD"       { dprint("TSTD"); return TSTD; }
<_6309>"TSTE"       { dprint("TSTE"); return TSTE; }
<_6309>"TSTF"       { dprint("TSTF"); return TSTF; }
<_6309>"TSTW"       { dprint("TSTW"); return TSTW; }
"TST"               { dprint("TST"); return TST; }


"RMB"               { dprint("RMB"); return RMB; }


[0-9]+              { dprint("DECNUM"); yylval.ivalue = atoi(yytext); return DECNUM; }
($|0x)[0-9A-F]+     {
    dprint("HEXNUM");
    (yytext[0] == '$') ? (yytext++) : (yytext += 2);
    yylval.ivalue = (int)strtol(yytext, NULL, 16);
    return HEXNUM;
}
[_A-Z][_A-Z0-9]*    { dprint("IDENTIFIER"); yylval.svalue = yytext; return IDENTIFIER; }

";".*               { dprint("COMMENT"); }

[ \t    ]+
\n                  { line_num++; }
.

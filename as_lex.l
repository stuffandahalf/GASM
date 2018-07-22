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
"ADCD"              { dprint("ADCD"); if (!strcmp(arch, "6309")) return ADCD; }
"ADCR"              { dprint("ADCR"); if (!strcmp(arch, "6309")) return ADCR; }

"ADDA"              { dprint("ADDA"); return ADDA; }
"ADDB"              { dprint("ADDB"); return ADDB; }
"ADDE"              { dprint("ADDE"); if (!strcmp(arch, "6309")) return ADDE; }
"ADDF"              { dprint("ADDF"); if (!strcmp(arch, "6309")) return ADDF; }
"ADDD"              { dprint("ADDD"); return ADDD; }
"ADDW"              { dprint("ADDW"); if (!strcmp(arch, "6309")) return ADDW; }
"ADDR"              { dprint("ADDR"); if (!strcmp(arch, "6309")) return ADDR; }

"AIM"               { dprint("AIM"); return AIM; }

"ANDA"              { dprint("ANDA"); return ANDA; }
"ANDB"              { dprint("ANDB"); return ANDB; }
"ANDCC"             { dprint("ANDCC"); return ANDCC; }
"ANDD"              { dprint("ANDD"); if (!strcmp(arch, "6309")) return ANDD; }
"ANDR"              { dprint("ANDR"); if (!strcmp(arch, "6309")) return ANDR; }

"ASLA"              { dprint("ASLA"); return ASLA; }
"ASLB"              { dprint("ASLB"); return ASLB; }
"ASL"               { dprint("ASL"); return ASL; }
"ASLD"              { dprint("ASLD"); if (!strcmp(arch, "6309")) return ASLD; }

"ASRA"              { dprint("ASRA"); return ASRA; }
"ASRB"              { dprint("ASRB"); return ASRB; }
"ASR"               { dprint("ASR"); return ASR; }
"ASRD"              { dprint("ASRF"); if (!strcmp(arch, "6309")) return ASRD; }

"BAND"              { dprint("BAND"); if (!strcmp(arch, "6309")) return BAND; }

"BCC"               { dprint("BCC"); return BCC; }
"BCS"               { dprint("BCS"); return BCS; }
"BEOR"              { dprint("BEOR"); if (!strcmp(arch, "6309")) return BEOR; }
"BEQ"               { dprint("BEQ"); return BEQ; }
"BGE"               { dprint("BGE"); return BGE; }
"BGT"               { dprint("BGT"); return BGT; }
"BHI"               { dprint("BHI"); return BHI; }
"BHS"               { dprint("BHS"); return BHS; }

"BIAND"             { dprint("BIAND"); if (!strcmp(arch, "6309")) return BIAND; }
"BIEOR"             { dprint("BIEOR"); if (!strcmp(arch, "6309")) return BIEOR; }
"BIOR"              { dprint("BIOR"); if (!strcmp(arch, "6309")) return BIOR; }

"BITA"              { dprint("BITA"); return BITA; }
"BITB"              { dprint("BITB"); return BITB; }
"BITD"              { dprint("BITD"); if (!strcmp(arch, "6309")) return BITD; }
"BITMD"             { dprint("BITMD"); if (!strcmp(arch, "6309")) return BITMD; }

"BLE"               { dprint("BLE"); return BLE; }
"BLO"               { dprint("BLO"); return BLO; }
"BLS"               { dprint("BLS"); return BLS; }
"BLT"               { dprint("BLT"); return BLT; }
"BMI"               { dprint("BMI"); return BMI; }
"BNE"               { dprint("BNE"); return BNE; }

"BOR"               { dprint("BOR"); if (!strcmp(arch, "6309")) return BOR; }

"BPL"               { dprint("BPL"); return BPL; }
"BRA"               { dprint("BRA"); return BRA; }
"BRN"               { dprint("BRN"); return BRN; }
"BSR"               { dprint("BSR"); return BSR; }
"BVC"               { dprint("BVC"); return BVC; }
"BVS"               { dprint("BVS"); return BVS; }

"CLRA"              { dprint("CLRA"); return CLRA; }
"CLRB"              { dprint("CLRB"); return CLRB; }
"CLRD"              { dprint("CLRD"); if (!strcmp(arch, "6309")) return CLRD; }
"CLRE"              { dprint("CLRE"); if (!strcmp(arch, "6309")) return CLRE; }
"CLRF"              { dprint("CLRF"); if (!strcmp(arch, "6309")) return CLRF; }
"CLRW"              { dprint("CLRW"); if (!strcmp(arch, "6309")) return CLRW; }
"CLR"               { dprint("CLR"); return CLR; }

"CMPA"              { dprint("CMPA"); return CMPA; }
"CMPB"              { dprint("CMPB"); return CMPB; }
"CMPE"              { dprint("CMPE"); if (!strcmp(arch, "6309")) return CMPE; }
"CMPF"              { dprint("CMPF"); if (!strcmp(arch, "6309")) return CMPF; }
"CMPD"              { dprint("CMPD"); return CMPD; }
"CMPS"              { dprint("CMPS"); return CMPS; }
"CMPU"              { dprint("CMPU"); return CMPU; }
"CMPW"              { dprint("CMPW"); if (!strcmp(arch, "6309")) return CMPW; }
"CMPX"              { dprint("CMPX"); return CMPX; }
"CMPY"              { dprint("CMPY"); return CMPY; }
"CMPR"              { dprint("CMPR"); if (!strcmp(arch, "6309")) return CMPR; }

"COMA"              { dprint("COMA"); return COMA; }
"COMB"              { dprint("COMB"); return COMB; }
"COMD"              { dprint("COMD"); if (!strcmp(arch, "6309")) return COMD; }
"COME"              { dprint("COME"); if (!strcmp(arch, "6309")) return COME; }
"COMF"              { dprint("COMF"); if (!strcmp(arch, "6309")) return COMF; }
"COMW"              { dprint("COMW"); if (!strcmp(arch, "6309")) return COMW; }
"COM"               { dprint("COM"); return COM; }

"CWAI"              { dprint("CWAI"); return CWAI; }

"DAA"               { dprint("DAA"); return DAA; }

"DECA"              { dprint("DECA"); return DECA; }
"DECB"              { dprint("DECB"); return DECB; }
"DECD"              { dprint("DECD"); if (!strcmp(arch, "6309")) return DECD; }
"DECE"              { dprint("DECE"); if (!strcmp(arch, "6309")) return DECE; }
"DECF"              { dprint("DECF"); if (!strcmp(arch, "6309")) return DECF; }
"DECW"              { dprint("DECW"); if (!strcmp(arch, "6309")) return DECW; }
"DEC"               { dprint("DEC"); return DEC; }

"DIVD"              { dprint("DIVD"); if (!strcmp(arch, "6309")) return DIVD; }
"DIVQ"              { dprint("DIVQ"); if (!strcmp(arch, "6309")) return DIVQ; }

"EIM"               { dprint("EIM"); if (!strcmp(arch, "6309")) return EIM; }

"EORA"              { dprint("EORA"); return EORA; }
"EORB"              { dprint("EORB"); return EORB; }
"EORD"              { dprint("EORD"); if (!strcmp(arch, "6309")) return EORD; }
"EORR"              { dprint("EORR"); if (!strcmp(arch, "6309")) return EORR; }

"EXG"               { dprint("EXG"); return EXG; }

"INCA"              { dprint("INCA"); return INCA; }
"INCB"              { dprint("INCB"); return INCB; }
"INCD"              { dprint("INCD"); if (!strcmp(arch, "6309")) return INCD; }
"INCE"              { dprint("INCE"); if (!strcmp(arch, "6309")) return INCE; }
"INCF"              { dprint("INCF"); if (!strcmp(arch, "6309")) return INCF; }
"INCW"              { dprint("INCW"); if (!strcmp(arch, "6309")) return INCW; }
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
"LDE"               { dprint("LDE"); if (!strcmp(arch, "6309")) return LDE; }
"LDF"               { dprint("LDF"); if (!strcmp(arch, "6309")) return LDF; }
"LDD"               { dprint("LDD"); return LDD; }
"LDS"               { dprint("LDS"); return LDS; }
"LDU"               { dprint("LDU"); return LDU; }
"LDW"               { dprint("LDW"); if (!strcmp(arch, "6309")) return LDW; }
"LDX"               { dprint("LDX"); return LDX; }
"LDY"               { dprint("LDY"); return LDY; }
"LDBT"              { dprint("LDBT"); if (!strcmp(arch, "6309")) return LDBT; }
"LDMD"              { dprint("LDMD"); if (!strcmp(arch, "6309")) return LDMD; }
"LDQ"               { dprint("LDQ"); if (!strcmp(arch, "6309")) return LDQ; }

"LEAS"              { dprint("LEAS"); return LEAS; }
"LEAU"              { dprint("LEAU"); return LEAU; }
"LEAX"              { dprint("LEAX"); return LEAX; }
"LEAY"              { dprint("LEAY"); return LEAY; }

"LSLA"              { dprint("LSLA"); return LSLA; }
"LSLB"              { dprint("LSLB"); return LSLB; }
"LSL"               { dprint("LSL"); return LSL; }
"LSLD"              { dprint("LSLD"); if (!strcmp(arch, "6309")) return LSLD; }

"LSRA"              { dprint("LSRA"); return LSRA; }
"LSRB"              { dprint("LSRB"); return LSRB; }
"LSR"               { dprint("LSR"); return LSR; }
"LSRD"              { dprint("LSRD"); if (!strcmp(arch, "6309")) return LSRD; }
"LSRW"              { dprint("LSRW"); if (!strcmp(arch, "6309")) return LSRW; }

"MUL"               { dprint("MUL"); return MUL; }
"MULD"              { dprint("MULD"); if (!strcmp(arch, "6309")) return MULD; }

"NEGA"              { dprint("NEGA"); return NEGA; }
"NEGB"              { dprint("NEGB"); return NEGB; }
"NEGD"              { dprint("NEGD"); if (!strcmp(arch, "6309")) return NEGD; }
"NEG"               { dprint("NEG"); return NEG; }

"NOP"               { dprint("NOP"); return NOP; }

"OIM"               { dprint("OIM"); if (!strcmp(arch, "6309")) return OIM; }

"ORA"               { dprint("ORA"); return ORA; }
"ORB"               { dprint("ORB"); return ORB; }
"ORCC"              { dprint("ORCC"); return ORCC; }
"ORD"               { dprint("ORD"); if (!strcmp(arch, "6309")) return ORD; }
"ORR"               { dprint("ORR"); if (!strcmp(arch, "6309")) return ORR; }

"PSHS"              { dprint("PSHS"); return PSHS; }
"PSHU"              { dprint("PSHU"); return PSHU; }
"PSHSW"             { dprint("PSHSW"); if (!strcmp(arch, "6309")) return PSHSW; }
"PSHUW"             { dprint("PSHUW"); if (!strcmp(arch, "6309")) return PSHUW; }

"PULS"              { dprint("PULS"); return PULS; }
"PULU"              { dprint("PULU"); return PULU; }
"PULSW"             { dprint("PULSW"); if (!strcmp(arch, "6309")) return PULSW; }
"PULUW"             { dprint("PULUW"); if (!strcmp(arch, "6309")) return PULUW; }

"ROLA"              { dprint("ROLA"); return ROLA; }
"ROLB"              { dprint("ROLB"); return ROLB; }
"ROL"               { dprint("ROL"); return ROL; }
"ROLD"              { dprint("ROLD"); if (!strcmp(arch, "6309")) return ROLD; }
"ROLW"              { dprint("ROLW"); if (!strcmp(arch, "6309")) return ROLW; }

"RORA"              { dprint("RORA"); return RORA; }
"RORB"              { dprint("RORB"); return RORB; }
"ROR"               { dprint("ROR"); return ROR; }
"RORD"              { dprint("RORD"); if (!strcmp(arch, "6309")) return RORD; }
"RORW"              { dprint("RORW"); if (!strcmp(arch, "6309")) return RORW; }

"RTI"               { dprint("RTI"); return RTI; }
"RTS"               { dprint("RTS"); return RTS; }

"SBCA"              { dprint("SBCA"); return SBCA; }
"SBCB"              { dprint("SBCB"); return SBCB; }
"SBCD"              { dprint("SBCD"); if (!strcmp(arch, "6309")) return SBCD; }
"SBCR"              { dprint("SBCR"); if (!strcmp(arch, "6309")) return SBCR; }

"SEX"               { dprint("SEX"); return SEX; }
"SEXW"              { dprint("SEXW"); if (!strcmp(arch, "6309")) return SEXW; }

"STA"               { dprint("STA"); return STA; }
"STB"               { dprint("STB"); return STB; }
"STE"               { dprint("STE"); if (!strcmp(arch, "6309")) return STE; }
"STF"               { dprint("STF"); if (!strcmp(arch, "6309")) return STF; }
"STD"               { dprint("STD"); return STD; }
"STS"               { dprint("STS"); return STS; }
"STU"               { dprint("STU"); return STU; }
"STW"               { dprint("STW"); if (!strcmp(arch, "6309")) return STW; }
"STX"               { dprint("STX"); return STX; }
"STY"               { dprint("STY"); return STY; }
"STBT"              { dprint("STBT"); if (!strcmp(arch, "6309")) return STBT; }
"STQ"               { dprint("STQ"); if (!strcmp(arch, "6309")) return STQ; }

"SUBA"              { dprint("SUBA"); return SUBA; }
"SUBB"              { dprint("SUBB"); return SUBB; }
"SUBE"              { dprint("SUBE"); if (!strcmp(arch, "6309")) return SUBE; }
"SUBF"              { dprint("SUBF"); if (!strcmp(arch, "6309")) return SUBF; }
"SUBD"              { dprint("SUBD"); return SUBD; }
"SUBW"              { dprint("SUBW"); if (!strcmp(arch, "6309")) return SUBW; }
"SUBR"              { dprint("SUBR"); if (!strcmp(arch, "6309")) return SUBR; }

"SWI"               { dprint("SWI"); return SWI; }
"SWI2"              { dprint("SWI2"); return SWI2; }
"SWI3"              { dprint("SWI3"); return SWI3; }

"SYNC"              { dprint("SYNC"); return SYNC; }

"TFM"               { dprint("TFM"); if (!strcmp(arch, "6309")) return TFM; }
"TFR"               { dprint("TFR"); return TFR; }

"TIM"               { dprint("TIM"); if (!strcmp(arch, "6309")) return TIM; }

"TSTA"              { dprint("TSTA"); return TSTA; }
"TSTB"              { dprint("TSTB"); return TSTB; }
"TSTD"              { dprint("TSTD"); if (!strcmp(arch, "6309")) return TSTD; }
"TSTE"              { dprint("TSTE"); if (!strcmp(arch, "6309")) return TSTE; }
"TSTF"              { dprint("TSTF"); if (!strcmp(arch, "6309")) return TSTF; }
"TSTW"              { dprint("TSTW"); if (!strcmp(arch, "6309")) return TSTW; }
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
[_A-Z][_A-Z0-9]*    { dprint("IDENTIFIER"); yylval.svalue = yytext; return IDENTIFIER; }

";".*               { dprint("COMMENT"); }

[ \t    ]+
\n                  { line_num++; }
.

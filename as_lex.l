%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

const short DEBUG = 1;

#define dprint(str) { \
    if (DEBUG) { \
        puts(str); \
    } \
}

#define instr_6309(instruction) { \
    if (!strcmp("6309", arch)) { \
        return (instruction); \
    } \
}

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
%{
//%option noyywrap
%}

%start _6309

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
"ADCD"              { dprint("ADCD"); return ADCD; }
<_6309>"ADCR"       { dprint("ADCR"); return ADCR; }

"LDA"               { dprint("LDA"); return LDA; }
"ADDA"              { dprint("ADDA"); return ADDA; }
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


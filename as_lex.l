%{
#include <stdio.h>
#include "y.tab.h"

const short DEBUG = 0;

#define dprint(str) { \
    if (DEBUG) { \
        puts(str); \
    } \
}

extern int yylval;

int line_num = 1;
%}

%option caseless
%option noyywrap

%%

#                   { dprint("POUND"); return POUND; }
:                   { dprint("COLON"); return COLON; }
"%"                 { dprint("PERCENT"); return PERCENT; }
"."                 { dprint("PERIOD"); return PERIOD; }
","                 { dprint("COMMA"); return COMMA; }

"LDA"               { dprint("LDA"); return LDA; }
"ADDA"              { dprint("ADDA"); return ADDA; }
"RMB"               { dprint("RMB"); return RMB; }

[0-9]+              { dprint("DECNUM"); return DECNUM; }
($|0x)[0-9A-F]+     { dprint("HEXNUM"); return HEXNUM; }
[_A-Z][_A-Z0-9]*    { dprint("IDENTIFIER"); return IDENTIFIER; }

";".*               { dprint("COMMENT"); }

[ \t]+
\n                  { line_num++; }
.

%%


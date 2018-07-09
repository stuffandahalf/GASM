%{
#include <stdio.h>
#include "y.tab.h"

const short DEBUG = 1;

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

[0-9]+              { dprint("DECNUM"); return DECNUM; }
($|0x)[0-9A-F]+     { dprint("HEXNUM"); return HEXNUM; }
[_A-Z][_A-Z0-9]*    { dprint("IDENTIFIER"); return IDENTIFIER; }

";".*               { dprint("COMMENT"); }

[ \t]+
\n                  { line_num++; }
.

%%

int main(int argc, char **argv) {
    argc--; argv++;

    FILE *fd;

    if (argc) {
        if (!(fd = fopen(argv[0], "r"))) {
            perror("Error: ");
            return 1;
        }
        yyset_in(fd);
    }
    yyparse();
    //yylex();
    fclose(fd);
    return 0;
}

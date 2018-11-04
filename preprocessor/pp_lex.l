%{
#include <stdio.h>
#include "y.tab.h"

unsigned int line_num = 1;

%}

%%

"%"                     { return PERCENT; }
"INCLUDE"               { return INCLUDE; }
"DEFINE"                { return DEFINE; }
"MACRO"                 { return MACRO; }
"END"                   { return END; }
[_a-zA-Z][_a-zA-Z0-9]*  { return IDENTIFIER; }
";".*\n                 { return COMMENT; }
\n                      { line_num++; }

.*                      { printf("%s\n", yylval); }

%%

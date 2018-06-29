D           [0-9]
L           [a-zA-Z_]
H           [a-fA-F0-9]


%{
#include <stdio.h>
#include "y.tab.h"

void count();

%}

%option caseless

%%
".ORG"      { return(ORG); }
".EQU"      { return(EQU); }

"ABX"       { return(ABX); }

"ADCA"      { return(ADCA); }
"ADCB"      { return(ADCB); }
"ADCD"      { return(ADCD); }
"ADCR"      { return(ADCR); }

"ADDA"      { return(ADDA); }
"ADDB"      { return(ADDB); }
"ADDE"      { return(ADDE); }
"ADDF"      { return(ADDF); }
"ADDD"      { return(ADDD); }
"ADDW"      { return(ADDW); }
"ADDR"      { return(ADDR); }

"AIM"       { return(AIM); }

"ANDA"      { return(ANDA); }
"ANDB"      { return(ANDB); }
"ANDCC"     { return(ANDCC); }
"ANDD"      { return(ANDD); }
"ANDR"      { return(ANDR); }

"ASLA"      { return(ASLA); }
"ASLB"      { return(ASLB); }
"ASL"       { return(ASL); }
"ASLD"      { return(ASLD); }

"ASRA"      { return(ASRA); }
"ASRB"      { return(ASRB); }
"ASR"       { return(ASR); }
"ASRD"      { return(ASRD); }

"BAND"      { return(BAND); }

%%

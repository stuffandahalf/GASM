%token MACRO
%token DEFINE
%token END
%token INCLUDE
%token IDENTIFIER
%token PERCENT
%token COMMENT

%union {
    char *svalue;
}

%{
#include <stdio.h>

extern int line_num;
extern YYSTYPE yylval;
extern int yylex();

void yyerror(const char *str) {
    fprintf(stderr, "error: %s on line number %d\n", str, line_num);
    //remove(out_fname);
}
%}

%%

program: program statement
       | statement
       ;

statement: include
         /*| struct*/
         /*| macro*/
         ;

include: PERCENT INCLUDE IDENTIFIER
         {
             puts("Hi");
             //char *fname = $2
             FILE *fptr = fopen($<svalue>2, "r");
             
             char c = fgetc(fptr); 
             while (c != EOF) 
             { 
                 printf ("%c", c); 
                 c = fgetc(fptr); 
             } 
         }

%%

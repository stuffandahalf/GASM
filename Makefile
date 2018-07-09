CC=cc
CFLAGS=-s
LEX=lex
LEXFLAGS=
YACC=yacc
YACCFLAGS=-d

as-6x09: main.c lex.yy.c y.tab.c y.tab.h elf.c elf.h
	$(CC) -o $@ main.c lex.yy.c y.tab.c elf.c

lex.yy.c: as_lex.l
	$(LEX) $(LEXFLAGS) $<

y.tab.c y.tab.h: as_yacc.y
	$(YACC) -o y.tab.c $(YACCFLAGS) $<

.PHONY: run
run: as-6x09
	./$<

.PHONY: debug
debug: as-6x09
	valgrind ./$<

.PHONY: clean
clean:
	rm -f y.tab.*
	rm -f lex.yy.c
	rm -f as-6x09

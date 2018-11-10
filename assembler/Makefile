CC=cc
CFLAGS=-s
LEX=lex
LEXFLAGS=
YACC=yacc
YACCFLAGS=-d #--debug --verbose

#OBJS = elf.o linkedlist.o label.o
OBJS = 

%.o: %.c %.h
	$(CC) -c $<

as-6x09: main.c lex.yy.c y.tab.c y.tab.h $(OBJS)
	$(CC) -o $@ main.c lex.yy.c y.tab.c $(OBJS)

lex.yy.c: as_lex.l
	$(LEX) $(LEXFLAGS) $<

y.tab.c y.tab.h: as_yacc.y
	$(YACC) -o y.tab.c $(YACCFLAGS) $<

.PHONY: run
run: as-6x09
	./$<

.PHONY: debug
debug: as-6x09
	valgrind --leak-check=full --track-origins=yes ./$<

.PHONY: dump
dump: as-6x09
	./as-6x09 < test1.S
	hexdump -v -e '/1 "%02x\n"' a.out

.PHONY: clean
clean:
	rm -f y.tab.*
	rm -f lex.yy.c
	rm -f as-6x09
	rm -f a.out
	rm -f y.output
	rm -f *.o
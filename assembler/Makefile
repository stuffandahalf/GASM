#ifndef TARGET
#$(error TARGET is not set)
#endif

CC=cc
CFLAGS=
LEX=lex
LEXFLAGS=
YACC=yacc
YACCFLAGS=-d #--debug --verbose

ISA_DIR=isa

TARGET_DIR=$(ISA_DIR)/$(TARGET)
BUILD_DIR=build
DIST_DIR=dist

#OBJS = elf.o linkedlist.o label.o
#_LEXER_OBJS=lex.yy.c y.tab.c y.tab.h
#_OBJS=main.o $(_LEXER_OBJS)
#OBJS=$(patsubst %,$(BUILD_DIR)/%,$(_OBJS))

_PARSER_OUTFILES=lex.yy.c y.tab.c y.tab.h
_PARSER_OBJS=$(patsubst %.c,%.o,$(filter-out %.h,$(_PARSER_OUTFILES)))
_OBJS=main.o $(_PARSER_OBJS)
OBJS=$(patsubst %,$(BUILD_DIR)/%,$(_OBJS))

%.o: %.c %.h
	$(CC) -c $< -o %@
	
%.o: %.c
	$(CC) -c $< -o $@

.PHONY: all
all: $(DIST_DIR)/as-$(TARGET)

$(DIST_DIR)/as-$(TARGET): $(BUILD_DIR) $(OBJS) $(DIST_DIR)
	$(CC) -o $@ $(OBJS)

$(BUILD_DIR)/main.o: main.c $(TARGET_DIR)/arch.h
	$(CC) -c -include $(TARGET_DIR)/arch.h $< -o $@

$(BUILD_DIR)/lex.yy.c: $(TARGET_DIR)/as_lex.l
	$(LEX) -o $@ $(LEXFLAGS) $<

$(BUILD_DIR)/lex.yy.o: $(BUILD_DIR)/lex.yy.c $(BUILD_DIR)/y.tab.h
	$(CC) -c -o $@ $(CFLAGS) $< -ll

$(BUILD_DIR)/y.tab.c $(BUILD_DIR)/y.tab.h: $(TARGET_DIR)/as_yacc.y
	$(YACC) -o $(BUILD_DIR)/y.tab.c $(YACCFLAGS) $<

$(BUILD_DIR)/y.tab.o: $(BUILD_DIR)/y.tab.c
	$(CC) -c -o $@ $(CFLAGS) $<

$(DIST_DIR):
	mkdir $(DIST_DIR)
	
$(BUILD_DIR):
	mkdir $(BUILD_DIR)

.PHONY: run
run: $(DIST_DIR)/as-$(TARGET)
	$<

.PHONY: debug
debug: $(DIST_DIR)/as-$(TARGET)
	valgrind --leak-check=full --track-origins=yes $<

.PHONY: dump
dump: $(DIST_DIR)/as-$(TARGET)
	$< < test1.S
	hexdump -v -e '/1 "%02x\n"' a.out

.PHONY: clean
clean:
	rm -rf build
	rm -rf dist

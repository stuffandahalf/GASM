CC=cc
CFLAGS=-s
LEX=lex
LEXFLAGS=
YACC=yacc
YACCFLAGS=-d #--debug --verbose

BUILD_DIR=build
DIST_DIR=dist

_LEXER_OBJS=lex.yy.c y.tab.c y.tab.h
_OBJS=main.o $(_LEXER_OBJS)
OBJS=$(patsubst %, $(BUILD_DIR)/%, $(_OBJS))

$(BUILD_DIR)/%.o: %.c %.h
	$(CC) -c $(CFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

.PHONY: all
all: $(DIST_DIR)/as-pp

test:
	echo $(OBJS)

$(DIST_DIR)/as-pp: $(BUILD_DIR) $(OBJS) $(DIST_DIR)
	$(CC) -o $@ $(OBJS)

$(BUILD_DIR)/lex.yy.c: pp_lex.l
	$(LEX) -o $@ $(LEXFLAGS) $<

$(BUILD_DIR)/y.tab.c $(BUILD_DIR)/y.tab.h: pp_yacc.y
	$(YACC) -o $(BUILD_DIR)/y.tab.c $(YACCFLAGS) $<

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(DIST_DIR):
	mkdir $(DIST_DIR)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(DIST_DIR)

LEX = lex
YACC = yacc
CC = cc

CFLAGS = -c

SOURCE_DIR = src
BUILD_DIR = build
DIST_DIR = dist

_OBJS = as-6x09.o lex.yy.o y.tab.o
OBJS = $(patsubst %, $(BUILD_DIR)/%, $(_OBJS))

all: $(DIST_DIR)/as-6x09

.PHONY: run
run: $(DIST_DIR)/as-6x09
	$<

$(DIST_DIR)/as-6x09: $(OBJS)
	$(CC) -o $@ $<

$(BUILD_DIR)/lex.yy.c: $(SOURCE_DIR)/as-6x09.l
	$(LEX) -o $@ $<
	
$(BUILD_DIR)/y.tab.c $(BUILD_DIR)/y.tab.h: $(SOURCE_DIR)/as-6x09.y
	$(YACC) -d -o $(BUILD_DIR)/y.tab.c $<
	
$(BUILD_DIR)/as-6x09.o: $(SOURCE_DIR)/as-6x09.c
	$(CC) $(CFLAGS) -o $@ $<

$(BUILD_DIR)/lex.yy.o: $(BUILD_DIR)/lex.yy.c $(BUILD_DIR)/y.tab.h
	$(CC) $(CFLAGS) -o $@ $<

$(BUILD_DIR)/y.tab.o: $(BUILD_DIR)/y.tab.c
	$(CC) $(CFLAGS) -o $@ $<

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(DIST_DIR):
	mkdir $(DIST_DIR)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(DIST_DIR)

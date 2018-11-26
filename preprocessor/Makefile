CC=cc
CFLAGS=-s
LEX=lex
LEXFLAGS=
YACC=yacc
YACCFLAGS=-d #--debug --verbose


BUILD_DIR=build
DIST_DIR=dist

_OBJS=
OBJS=$(patsubst %, $(BUILD_DIR)/%, $(_OBJS))

$(BUILD_DIR)/%.o: %.c %.h
	$(CC) $(CFLAGS) -o $@

.PHONY: all
all: $(DIST_DIR)/as-pp

$(DIST_DIR)/as-pp: $(BUILD_DIR) $(OBJS) $(DIST_DIR)
	$(CC) -o $@ $(OBJS)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(DIST_DIR):
	mkdir $(DIST_DIR)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(DIST_DIR)

#ifndef AS_H
#define AS_H

#include <stdio.h>
#include <stdint.h>

enum addr_mode {
    Inherent,
    Immediate,
    Direct,
    Indirect,
    Extended
};

typedef struct {
    enum addr_mode mode;
    int value;
} Argument;

typedef struct {
    uint16_t opcode;
    Argument arg;
} Instruction;

char *arch;
char *out_fname;
FILE *out_file;

#endif

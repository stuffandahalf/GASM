#ifndef AS_H
#define AS_H

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

#endif

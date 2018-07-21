#ifndef LABEL_H
#define LABEL_H

#include <stdint.h>
#include <stdlib.h>

typedef struct label {
    char *id;
    uint16_t address;
} label_t;

label_t *newLabel(char *id, uint16_t address);
void freeLabel(label_t *label);

#endif

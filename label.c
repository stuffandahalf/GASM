#include "label.h"

label_t *newLabel(char *id, uint16_t address) {
    label_t *l = (label_t *)malloc(sizeof(label_t));
    l->id = id;
    l->address = address;
    return l;
}

void freeLabel(label_t *l) {
    free(l);
}

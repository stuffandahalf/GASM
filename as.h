#ifndef AS_H
#define AS_H

#include <stdio.h>
#include <stdint.h>
#include "linkedlist.h"
#include "label.h"

char *arch;
char *out_fname;
char *format;
FILE *out_file;
LinkedList *labels;

#endif

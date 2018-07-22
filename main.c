#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <getopt.h>
#include "as.h"
#include "y.tab.h"

extern int yy_push_state(int new_state);

#define ARCH_NUM 2
char *architectures[] = {
    "6809",
    "6309"
};

bool supported_arch(const char *string);
void freeLabels(LinkedList *labels);

int main(int argc, char **argv) {
    arch = "6809";
    out_fname = "a.out";
    labels = newLinkedList();

    struct option longopts[] = {
        {"arch", required_argument, NULL, 'm'},
        {0, 0, 0, 0}
    };

    int c;
    while ((c = getopt_long(argc, argv, "m:o:", longopts, NULL)) != -1) {
        switch (c) {
        case 'm':
            if (supported_arch(optarg)) {
                arch = optarg;
            }
            else {
                fprintf(stderr, "Unsupported architecture \"%s\"\n", optarg);
                return 1;
            }
            break;
        case 'o':
            out_fname = optarg;
            printf("%s\n", out_fname);
            extern FILE *yyin;
        case 0:
            break;
        }
    }

    while (optind < argc) {
        extern FILE *yyin;
        yyin = fopen(argv[optind++], "r");
    }


    printf("Chosen architecture is: %s\n", arch);
    printf("Output file is: %s\n", out_fname);

    out_file = fopen(out_fname, "wb");

    //yylex();
    yyparse();

    for (size_t i = 0; i < labels->size; i++) {
        label_t *l = /*(label_t *)*/llat(labels, i);
        printf("%s\t%d\n", l->id, l->address);
    }
    freeLabels(labels);
    labels = NULL;
    return 0;
}

bool supported_arch(const char *string) {
    for (uint8_t i = 0; i < ARCH_NUM; i++) {
        if (!strcmp(string, architectures[i])) {
            return true;
        }
    }
    return false;
}

void freeLabels(LinkedList *labels) {
    for (size_t i = 0; i < labels->size; i++) {
        freeLabel(llpop(labels));
    }
}

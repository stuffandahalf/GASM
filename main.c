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

/* Architecture states */
#define _6809 0
#define _6309 1

bool supported_arch(const char *string);
int find_state(char *arch);

int main(int argc, char **argv) {
    arch = "6809";
    out_fname = "a.out";

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
                yy_push_state(find_state(arch));
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
//        printf("%s\n", argv[optind++]);
        extern FILE *yyin;
        yyin = fopen(argv[optind++], "r");
    }


    printf("Chosen architecture is: %s\n", arch);
    printf("Output file is: %s\n", out_fname);

    /*if (!strcmp("6309", arch)) {
        BEGIN(_6309);
    }*/
    out_file = fopen(out_fname, "wb");

    //yylex();
    yyparse();
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

int find_state(char *arch) {
    if (!strcmp("6809", arch)) {
        return _6809;
    }
    else if (!strcmp("6309", arch)) {
        return _6309;
    }
    else {
        return -1;
    }
}

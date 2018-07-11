#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include "as.h"
#include "y.tab.h"

typedef enum {
    false,
    true
} bool;

#define ARCH_NUM 2
char *architectures[] = {
    "6809",
    "6309"
};

bool supported_arch(char *string);

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
            }
            else {
                fprintf(stderr, "Unsupported architecture \"%s\"\n", optarg);
                return 1;
            }
            break;
        case 'o':
            out_fname = optarg;
            printf("%s\n", out_fname);
        case 0:
            break;
        }
    }
        /*else {
            printf("%s\n", argv[optind++]);
            //optind++;
        }
    }*/
    
    while (optind < argc) {
        printf("%s\n", argv[optind++]);
    }
    
    printf("Chosen architecture is: %s\n", arch);

    yyparse();
    return 0;
}

bool supported_arch(char *string) {
    for (size_t i = 0; i < ARCH_NUM; i++) {
        if (!strcmp(string, architectures[i])) {
            return true;
        }
    }
    return false;
}

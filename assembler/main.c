#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <getopt.h>
//#include "linkedlist.h"
//#include "as.h"
//#include "elf.h"
#include "y.tab.h"


char *arch;
char *out_fname;
char *format;
FILE *out_file;


#define ARCH_NUM 2
const char *architectures[] = {
    "6809",
    "6309"
};

bool supported_arch(const char *string);
//void free_labels(LinkedList *labels);

int main(int argc, char **argv) {
    char *arch = "6809";
    char *out_fname = "a.out";
    struct label *label_head = NULL;

    struct option longopts[] = {
        {"arch", required_argument, NULL, 'm'},
        {"format", required_argument, NULL, 'f'},
        {0, 0, 0, 0}
    };

    int c;
    while ((c = getopt_long(argc, argv, "m:o:f:", longopts, NULL)) != -1) {
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
            break;
        case 'f':
            format = optarg;
            break;
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
    printf("Output format is: %s\n", format);

    //out_file = fopen(out_fname, "wb");

    //uint8_t elf[] = { 0x7F, 0x45, 0x4C, 0x46 };
    //fwrite(elf, sizeof(uint8_t), sizeof(elf), out_file);

    /*uint16_t e_machine = EM_NONE;
    if (!strcmp("6809", arch)) {
        e_machine = EM_6809;
    }
    else if (!strcmp("6309", arch)) {
        e_machine = EM_6309;
    }

    ELF32_Ehdr *elf_header = new_ELF32_Ehdr(e_machine);
    ELF32_Shdr *shstrtab = new_ELF32_Shdr();

    shstrtab->name = 1;
    shstrtab->sh_type = SHT_SYMTAB;
    shstrtab->*/


    //yylex();
    yyparse();

    //for (size_t i = 0; i < labels->size; i++) {
        //label_t *l = /*(label_t *)*/llat(labels, i);
        //printf("%s\t%d\n", l->id, l->address);
    //}
    //free_labels(labels);
    //labels = NULL;
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

/*void free_labels(LinkedList *labels) {
    for (size_t i = 0; i < labels->size; i++) {
        freeLabel(llpop(labels));
    }
    free(labels);
}*/

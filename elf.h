#ifndef _ELF_H
#define _ELF_H

#include <stdlib.h>
#include <stdint.h>

#define ELF_NIDENT 16

enum ELF_Ident {
    EI_MAG0,
    EI_MAG1,
    EI_MAG2,
    EI_MAG3,
    EI_CLASS,
    EI_DATA,
    EI_VERSION,
    EI_OSABI,
    EI_ABIVERSION,
    EI_PAD
};

typedef struct {
    uint8_t e_ident[ELF_NIDENT];
    uint16_t e_type;
    uint16_t e_machine;
    uint32_t e_version;
    uint16_t e_entry;
    uint16_t e_phoff;
    uint16_t e_shoff;
    uint32_t e_flags;
    uint16_t e_ehsize;
    uint16_t e_phentsize;
    uint16_t e_phnum;
    uint16_t e_shentsize;
    uint16_t e_shstrndx;
} ELF16_Header;

ELF16_Header *new_ELF16_Header(char *arch);

#endif

#ifndef _ELF_H
#define _ELF_H

#include <stdlib.h>
#include <stdint.h>

extern char *arch;

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

enum ELF_OSABI {
    GANOS_6809 = 140,
    GANOS_6309 = 141
};

enum ELF_Type {
    ET_NONE = 0x00,
    ET_REL  = 0x01,
    ET_EXEC = 0x02,
    ET_DYN  = 0x03,
    ET_CORE = 0x04,
    ET_LOOS = 0xFE00,
    ET_HIOS = 0xFEFF,
    ET_LOPROC = 0xFF00,
    ET_HIPROC = 0xFFFF
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

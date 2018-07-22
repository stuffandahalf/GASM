#include "elf.h"

ELF32_Header *new_ELF32_HEADER(char *arch) {
    ELF32_Header *hdr = malloc(sizeof(ELF32_Header));

    hdr->e_ident[EI_MAG0] = 0x7F;
    hdr->e_ident[EI_MAG1] = 'E';
    hdr->e_ident[EI_MAG2] = 'L';
    hdr->e_ident[EI_MAG3] = 'F';

    hdr->e_ident[EI_CLASS] = ELFCLASS32;

    hdr->e_ident[EI_DATA] = 2;
    hdr->e_ident[EI_VERSION] = 1;
    hdr->e_ident[EI_OSABI] = GANOS_6809;

    hdr->e_ident[EI_ABIVERSION] = 1;
    hdr->e_type = 0x0001;

    return hdr;
}

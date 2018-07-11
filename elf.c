#include "elf.h"

ELF16_Header *new_ELF16_HEADER(char *arch) {
    ELF16_Header *hdr = malloc(sizeof(ELF16_Header));
    
    hdr->e_ident[EI_MAG0] = 0x7F;
    hdr->e_ident[EI_MAG1] = 'E';
    hdr->e_ident[EI_MAG2] = 'L';
    hdr->e_ident[EI_MAG3] = 'F';

    hdr->e_ident[EI_CLASS] = 0;   // class == 0 means 16-bit
    
    hdr->e_ident[EI_DATA] = 2;
    hdr->e_ident[EI_VERSION] = 1;
    hdr->e_ident[EI_OSABI] = GANOS_6809;
    
    hdr->e_ident[EI_ABIVERSION] = 1;
    hdr->e_type = 0x0001;
        
    return hdr;
}

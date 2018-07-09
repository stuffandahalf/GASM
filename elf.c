#include "elf.h"

ELF16_Header *new_ELF16_HEADER(char *arch) {
    ELF16_Header *elf_head = malloc(sizeof(ELF16_Header));
    
    elf_head->e_ident[EI_MAG0] = 0x7F;
    elf_head->e_ident[EI_MAG1] = 'E';
    elf_head->e_ident[EI_MAG2] = 'L';
    elf_head->e_ident[EI_MAG3] = 'F';

    elf_head->e_ident[EI_CLASS] = 0;   // class == 0 means 16-bit

    //*elf_head->e_ident[EI_DATA]

    return elf_head;
}

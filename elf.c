#include "elf.h"

ELF32_Ehdr *new_ELF32_Ehdr(uint16_t e_machine) {
    ELF32_Ehdr *hdr = malloc(sizeof(ELF32_Ehdr));

    hdr->e_ident[EI_MAG0] = 0x7F;
    hdr->e_ident[EI_MAG1] = 'E';
    hdr->e_ident[EI_MAG2] = 'L';
    hdr->e_ident[EI_MAG3] = 'F';

    hdr->e_ident[EI_CLASS] = ELFCLASS32;

    hdr->e_ident[EI_DATA] = ELFDATA_BE;
    hdr->e_ident[EI_VERSION] = 1;
    hdr->e_ident[EI_OSABI] = ELFOSABI_SYSTEMV;
    //hdr->e_ident[EI_ABIVERSION] = 0;      // Unused for System V
    
    hdr->e_type = ET_REL;
    hdr->e_machine = e_machine;
    hdr->e_version = 1;
    hdr->e_entry = 0;
    //hdr->e_phoff = 0x34;
    hdr->e_phoff = 0;
    hdr->e_shoff = 0;
    hdr->e_flags = 0;
    hdr->e_ehsize = sizeof(ELF32_Ehdr);
    hdr->e_phentsize = 0;
    hdr->e_phnum = 0;
    hdr->e_shentsize = sizeof(ELF32_Shdr);
    hdr->e_shnum = 0;
    hdr->e_shstrndx = 0;

    return hdr;
}

void write_ELF32_Ehdr(ELF32_Ehdr *hdr, FILE *out_file) {
    fwrite(hdr->e_ident, sizeof(uint8_t), EI_NIDENT, out_file);

    write_bytes(hdr->e_type, out_file);
    write_bytes(hdr->e_machine, out_file);
    write_bytes(hdr->e_version, out_file);
    write_bytes(hdr->e_entry, out_file);
    write_bytes(hdr->e_phoff, out_file);

    /* Only works on big endian machines */
    /*uint8_t *hdr_bytes = (uint8_t *)hdr;
    for (int i = 0; i < sizeof(ELF32_Header); i++) {
        uint8_t byte = *(hdr_bytes + sizeof(uint8_t) * i);
        fwrite(&byte, sizeof(uint8_t), 1, out_file);
    }*/
}

ELF32_Shdr *new_ELF32_Shdr() {
    ELF32_Shdr *s_hdr = malloc(sizeof(ELF32_Shdr));

    return s_hdr;
}

void write_ELF32_Shdr(ELF32_Shdr *s_hdr, FILE *out_file) {
    
}

ELF32_Phdr *new_ELF32_Phdr() {
    ELF32_Phdr *p_hdr = malloc(sizeof(ELF32_Phdr));

    return p_hdr;
}

void write_ELF32_Phdr(ELF32_Phdr *p_hdr, FILE *out_file) {

}

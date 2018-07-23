#include "elf.h"

ELF32_Header *new_ELF32_Header(uint16_t e_machine) {
    ELF32_Header *hdr = malloc(sizeof(ELF32_Header));

    hdr->e_ident[EI_MAG0] = 0x7F;
    hdr->e_ident[EI_MAG1] = 'E';
    hdr->e_ident[EI_MAG2] = 'L';
    hdr->e_ident[EI_MAG3] = 'F';

    hdr->e_ident[EI_CLASS] = ELFCLASS32;

    hdr->e_ident[EI_DATA] = ELFDATA_BE;
    hdr->e_ident[EI_VERSION] = 1;
    hdr->e_ident[EI_OSABI] = ABI_SYSTEMV;

    //hdr->e_ident[EI_ABIVERSION] = 1;      // Unused for System V
    hdr->e_type = ET_REL;
    hdr->e_machine = e_machine;
    hdr->e_version = 1;
    hdr->e_entry = 0;
    hdr->e_phoff = 0x34;

    hdr->e_ehsize = 52;

    return hdr;
}

void write_elf32_header(ELF32_Header *hdr, FILE *out_file) {
    /* Write identification */
    fwrite(hdr->e_ident, sizeof(uint8_t), ELF_NIDENT, out_file);

    ///* Write file type */
    //for (int i = sizeof(hdr->e_type) - 1; i >= 0; i--) {
        //uint8_t byte = (hdr->e_type >> (8 * i)) & 0xFF;
        //fwrite(&byte, sizeof(uint8_t), 1, out_file);
    //}

    ///* Write machine ISA */
    //for (int i = sizeof(hdr->e_machine) - 1; i >= 0; i--) {
        //uint8_t byte = (hdr->e_machine >> (8 * i)) & 0xFF;
        //fwrite(&byte, sizeof(uint8_t), 1, out_file);
    //}

    ///* Write ELF Version */
    //for (int i = sizeof(hdr->e_version) - 1; i >= 0; i--) {
        //uint8_t byte = (hdr->e_version >> (8 * i)) & 0xFF;
        //fwrite(&byte, sizeof(uint8_t), 1, out_file);
    //}

    ///* Write entry point */
    //for (int i = sizeof(hdr->e_entry) - 1; i >= 0; i--) {
        //uint8_t byte = (hdr->e_entry >> (8 * i)) & 0xFF;
        //fwrite(&byte, sizeof(uint8_t), 1, out_file);
    //}

    ///* Write program header offset */
    //for (int i = sizeof(hdr->phoff) - 1; i >= 0; i--) {
        //uint8_t byte = (hdr->phoff >> (8 * i)) & 0xFF;
        //fwrite(&byte, sizeof(uint8_t), 1, out_file);
    //}

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

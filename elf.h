#ifndef _ELF_H
#define _ELF_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern char *arch;

#define write_bytes(integer, out_file) { \
    for (int _i = sizeof(integer) - 1; _i >= 0; _i--) { \
        uint8_t byte = (integer >> (8 * _i)) & 0xFF; \
        fwrite(&byte, sizeof(uint8_t), 1, (out_file)); \
    } \
}

#define EI_NIDENT 16

typedef struct {
    uint8_t e_ident[EI_NIDENT];
    uint16_t e_type;
    uint16_t e_machine;
    uint32_t e_version;
    uint32_t e_entry;
    uint32_t e_phoff;
    uint32_t e_shoff;
    uint32_t e_flags;
    uint16_t e_ehsize;
    uint16_t e_phentsize;
    uint16_t e_phnum;
    uint16_t e_shentsize;
    uint16_t e_shnum;
    uint16_t e_shstrndx;
} ELF32_Ehdr;

/* e_ident indeces */
#define EI_MAG0         0
#define EI_MAG1         1
#define EI_MAG2         2
#define EI_MAG3         3
#define EI_CLASS        4
#define EI_DATA         5
#define EI_VERSION      6
#define EI_OSABI        7
#define EI_ABIVERSION   8
#define EI_PAD          9

/* File classes */
#define ELFCLASSNONE    0   // Invalid class
#define ELFCLASS32      1   // 32-bit
#define ELFCLASS64      2   // 64-bit

/* Data encoding byte */
#define ELFDATANONE     0   // Invalud data encoding
#define ELFDATA_LE      1   // 2's compliment, little endian
#define ELFDATA_BE      2   // 2's compliment, big endian
#define ELFDATANUM      3

/* OS ABI Identification */
#define ELFOSABI_NONE       0
#define ELFOSABI_SYSTEMV    0
#define ELFOSABI_HPUX		1	/* HP-UX */
#define ELFOSABI_NETBSD		2	/* NetBSD.  */
#define ELFOSABI_GNU		3	/* Object uses GNU ELF extensions.  */
#define ELFOSABI_LINUX		ELFOSABI_GNU /* Compatibility alias.  */
#define ELFOSABI_SOLARIS	6	/* Sun Solaris.  */
#define ELFOSABI_AIX		7	/* IBM AIX.  */
#define ELFOSABI_IRIX		8	/* SGI Irix.  */
#define ELFOSABI_FREEBSD	9	/* FreeBSD.  */
#define ELFOSABI_TRU64		10	/* Compaq TRU64 UNIX.  */
#define ELFOSABI_MODESTO	11	/* Novell Modesto.  */
#define ELFOSABI_OPENBSD	12	/* OpenBSD.  */
#define ELFOSABI_ARM_AEABI	64	/* ARM EABI */
#define ELFOSABI_ARM		97	/* ARM */
#define ELFOSABI_GANOS      0x6C
#define ELFOSABI_STANDALONE	255	/* Standalone (embedded) application */

/* Legal values for e_type (object file type) */
#define ET_NONE             0x00
#define ET_REL              0x01
#define ET_EXEC             0x02
#define ET_DYN              0x03
#define ET_CORE             0x04
#define ET_NUM              0x05
#define ET_LOOS             0xFE00
#define ET_HIOS             0xFEFF
#define ET_LOPROC           0xFF00
#define ET_HIPROC           0xFFFF

ELF32_Ehdr *new_ELF32_Ehdr(uint16_t e_machine);
void write_ELF32_Ehdr(ELF32_Ehdr *hdr, FILE *out_file);

#include "elf_machines.h"

typedef struct {
    uint32_t p_type;
    uint32_t p_offset;
    uint32_t p_vaddr;
    uint32_t p_paddr;
    uint32_t p_filesz;
    uint32_t p_flags;
    uint32_t p_aling;
} ELF32_Phdr;

ELF32_Phdr *new_ELF32_Phdr();
void write_ELF32_Phdr(ELF32_Phdr *p_hdr, FILE *out_file);

#endif

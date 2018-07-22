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
    uint32_t e_entry;
    uint32_t e_phoff;
    uint32_t e_shoff;
    uint32_t e_flags;
    uint16_t e_ehsize;
    uint16_t e_phentsize;
    uint16_t e_phnum;
    uint16_t e_shentsize;
    uint16_t e_shstrndx;
} ELF32_Header;

ELF32_Header *new_ELF32_Header(char *arch);

#define ELFCLASSNONE    0   // Invalid class
#define ELFCLASS32      1   // 32-bit
#define ELFCLASS64      2   // 64-bit

/* e_machine table from http://www.sco.com/developers/gabi/2000-07-17/ch4.eheader.html */
#define EM_NONE         0   // No machine
#define EM_M32          1   // AT&T WE 32100
#define EM_SPARC        2   // SPARC
#define EM_386          3   // Intel 80386
#define EM_68K          4   // Motorola 68000
#define EM_88K          5   // Motorola 88000
//#define RESERVED        6   // Reserved for future use
#define EM_860          7   // Intel 80860
#define EM_MIPS         8   // MIPS I Architecture
#define EM_S370         9   // IBM System/370 Processor
#define EM_MIPS_RS3_LE  10  // MIPS RS3000 Little-endian
//#define RESERVED        11-14   // Reserved for future use
#define EM_PARISC       15  // Hewlett-Packard PA-RISC
//#define RESERVED        16	Reserved for future use
#define EM_VPP500       17  // Fujitsu VPP500
#define EM_SPARC32PLUS  18  // Enhanced instruction set SPARC
#define EM_960          19  // Intel 80960
#define EM_PPC          20  // PowerPC
#define EM_PPC64        21  // 64-bit PowerPC
//#define RESERVED        22-35   // Reserved for future use
#define EM_V800	        36  // NEC V800
#define EM_FR20         37  // Fujitsu FR20
#define EM_RH32         38  // TRW RH-32
#define EM_RCE          39  // Motorola RCE
#define EM_ARM          40  // Advanced RISC Machines ARM
#define EM_ALPHA        41  // Digital Alpha
#define EM_SH           42  // Hitachi SH
#define EM_SPARCV9      43	// SPARC Version 9
#define EM_TRICORE      44  // Siemens Tricore embedded processor
#define EM_ARC          45	// Argonaut RISC Core, Argonaut Technologies Inc.
#define EM_H8_300       46	// Hitachi H8/300
#define EM_H8_300H      47	// Hitachi H8/300H
#define EM_H8S          48	// Hitachi H8S
#define EM_H8_500       49	// Hitachi H8/500
#define EM_IA_64        50	// Intel IA-64 processor architecture
#define EM_MIPS_X       51	// Stanford MIPS-X
#define EM_COLDFIRE     52	// Motorola ColdFire
#define EM_68HC12       53	// Motorola M68HC12
#define EM_MMA          54	// Fujitsu MMA Multimedia Accelerator
#define EM_PCP          55	// Siemens PCP
#define EM_NCPU         56	// Sony nCPU embedded RISC processor
#define EM_NDR1         57  // Denso NDR1 microprocessor
#define EM_STARCORE     58  // Motorola Star*Core processor
#define EM_ME16         59  // Toyota ME16 processor
#define EM_ST100        60  // STMicroelectronics ST100 processor
#define EM_TINYJ        61  // Advanced Logic Corp. TinyJ embedded processor family
//#define Reserved        62-65   // Reserved for future use
#define EM_FX66         66  // Siemens FX66 microcontroller
#define EM_ST9PLUS      67  // STMicroelectronics ST9+ 8/16 bit microcontroller
#define EM_ST7          68  // STMicroelectronics ST7 8-bit microcontroller
#define EM_68HC16       69  // Motorola MC68HC16 Microcontroller
#define EM_68HC11       70  // Motorola MC68HC11 Microcontroller
#define EM_68HC08       71  // Motorola MC68HC08 Microcontroller
#define EM_68HC05       72  // Motorola MC68HC05 Microcontroller
#define EM_SVX          73  // Silicon Graphics SVx
#define EM_ST19         74  // STMicroelectronics ST19 8-bit microcontroller
#define EM_VAX          75  // Digital VAX
#define EM_CRIS         76  // Axis Communications 32-bit embedded processor
#define EM_JAVELIN      77  // Infineon Technologies 32-bit embedded processor
#define EM_FIREPATH     78  // Element 14 64-bit DSP Processor
#define EM_ZSP          79  // LSI Logic 16-bit DSP Processor
#define EM_MMIX         80  // Donald Knuth's educational 64-bit processor
#define EM_HUANY        81	// Harvard University machine-independent object files
#define EM_PRISM        82	// SiTera Prism

#endif

#ifndef _ELF_H
#define _ELF_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern char *arch;

#define ELF_NIDENT 16

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

#define ELFCLASSNONE    0   // Invalid class
#define ELFCLASS32      1   // 32-bit
#define ELFCLASS64      2   // 64-bit

#define ELFDATA_LE      1   // Little endian
#define ELFDATA_BE      2   // Big endian

#define ABI_SYSTEMV     0
#define ABI_GANOS       0x6C

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

ELF32_Header *new_ELF32_Header(uint16_t e_machine);
#define write_bytes(integer, out_file) { \
    for (int _i = sizeof(integer) - 1; _i >= 0; _i--) { \
        uint8_t byte = (integer >> (8 * _i)) & 0xFF; \
        fwrite(&byte, sizeof(uint8_t), 1, (out_file)); \
    } \
}
void write_elf32_header(ELF32_Header *hdr, FILE *out_file);

/* e_machine table from http://www.sco.com/developers/gabi/2000-07-17/ch4.eheader.html */
#define EM_NONE             0   // No machine
#define EM_M32              1   // AT&T WE 32100
#define EM_SPARC            2   // SPARC
#define EM_386              3   // Intel 80386
#define EM_68K              4   // Motorola 68000
#define EM_88K              5   // Motorola 88000
#define EM_486              6   // Intel 80486
#define EM_860              7   // Intel 80860
#define EM_MIPS             8   // MIPS I Architecture
#define EM_S370             9   // IBM System/370 Processor
#define EM_MIPS_RS3_LE      10  // MIPS RS3000 Little-endian
#define EM_MIPS_RS6_LE      11  // MIPS RS6000 Little-endian
//#define RESERVED          12-14   // Reserved for future use
#define EM_PARISC           15  // Hewlett-Packard PA-RISC
#define EM_NCUBE            16	// nCube
#define EM_VPP500           17  // Fujitsu VPP500
#define EM_SPARC32PLUS      18  // Enhanced instruction set SPARC
#define EM_960              19  // Intel 80960
#define EM_PPC              20  // PowerPC
#define EM_PPC64            21  // 64-bit PowerPC
#define EM_S390             22  // IBM System/390 Processor
#define EM_CELLSPU          23  // Cell SPU
#define EM_CISCO_SVIP       24  // Cisco SVIP
#define EM_CISCO7200        25  // Cisco 7200
//#define RESERVED          26-35   // Reserved for future use
#define EM_V800	            36  // NEC V800
#define EM_FR20             37  // Fujitsu FR20
#define EM_RH32             38  // TRW RH-32
#define EM_RCE              39  // Motorola RCE
#define EM_ARM              40  // Advanced RISC Machines ARM
#define EM_ALPHA            41  // Digital Alpha
#define EM_SH               42  // Hitachi SH
#define EM_SPARCV9          43	// SPARC Version 9
#define EM_TRICORE          44  // Siemens Tricore embedded processor
#define EM_ARC              45	// Argonaut RISC Core, Argonaut Technologies Inc.
#define EM_H8_300           46	// Hitachi H8/300
#define EM_H8_300H          47	// Hitachi H8/300H
#define EM_H8S              48	// Hitachi H8S
#define EM_H8_500           49	// Hitachi H8/500
#define EM_IA_64            50	// Intel IA-64 processor architecture
#define EM_MIPS_X           51	// Stanford MIPS-X
#define EM_COLDFIRE         52	// Motorola ColdFire
#define EM_68HC12           53	// Motorola M68HC12
#define EM_MMA              54	// Fujitsu MMA Multimedia Accelerator
#define EM_PCP              55	// Siemens PCP
#define EM_NCPU             56	// Sony nCPU embedded RISC processor
#define EM_NDR1             57  // Denso NDR1 microprocessor
#define EM_STARCORE         58  // Motorola Star*Core processor
#define EM_ME16             59  // Toyota ME16 processor
#define EM_ST100            60  // STMicroelectronics ST100 processor
#define EM_TINYJ            61  // Advanced Logic Corp. TinyJ embedded processor family
#define EM_X86_64           62  // x86-64
// Reserved                 61-65   // Reserved for future use
#define EM_FX66             66  // Siemens FX66 microcontroller
#define EM_ST9PLUS          67  // STMicroelectronics ST9+ 8/16 bit microcontroller
#define EM_ST7              68  // STMicroelectronics ST7 8-bit microcontroller
#define EM_68HC16           69  // Motorola MC68HC16 Microcontroller
#define EM_68HC11           70  // Motorola MC68HC11 Microcontroller
#define EM_68HC08           71  // Motorola MC68HC08 Microcontroller
#define EM_68HC05           72  // Motorola MC68HC05 Microcontroller
#define EM_SVX              73  // Silicon Graphics SVx
#define EM_ST19             74  // STMicroelectronics ST19 8-bit microcontroller
#define EM_VAX              75  // Digital VAX
#define EM_CRIS             76  // Axis Communications 32-bit embedded processor
#define EM_JAVELIN          77  // Infineon Technologies 32-bit embedded processor
#define EM_FIREPATH         78  // Element 14 64-bit DSP Processor
#define EM_ZSP              79  // LSI Logic 16-bit DSP Processor
#define EM_MMIX             80  // Donald Knuth's educational 64-bit processor
#define EM_HUANY            81	// Harvard University machine-independent object files
#define EM_PRISM            82	// SiTera Prism
#define EM_AVR              83  // Atmel AVR 8-bit microcontroller
#define EM_FR30             84  // Fujitsu FR30
#define EM_D10V             85  // Mitsubishi D10V
#define EM_D30V             86  // Mitsubishi D30V
#define EM_V850             87  // NEC v850
#define EM_M32R             88  // Mitsubishi M32R
#define EM_MN10300          89  // Matsushita MN10300
#define EM_MN10200          90  // Matsushita MN10200
#define EM_PJ               91  // picoJava
#define EM_OPENRISC         92  // OpenRISC 32-bit embedded processor
#define EM_ARC_COMPACT      93  // ARC International ARCompact processor (old spelling/synonym: EM_ARC_A5)
#define EM_XTENSA           94  // Tensilica Xtensa Architecture
#define EM_VIDEOCORE        95	// Alphamosaic VideoCore processor
#define EM_TMM_GPP          96  // Thompson Multimedia General Purpose Processor
#define EM_NS32K            97  // National Semiconductor 32000 series
#define EM_TPC              98	// Tenor Network TPC processor
#define EM_SNP1K            99	// Trebia SNP 1000 processor
#define EM_ST200            100	// STMicroelectronics (www.st.com) ST200 microcontroller
#define EM_IP2K             101	// Ubicom IP2xxx microcontroller family
#define EM_MAX              102	// MAX Processor
#define EM_CR               103	// National Semiconductor CompactRISC microprocessor
#define EM_F2MC16           104	// Fujitsu F2MC16
#define EM_MSP430           105	// Texas Instruments embedded microcontroller msp430
#define EM_BLACKFIN         106	// Analog Devices Blackfin (DSP) processor
#define EM_SE_C33           107	// S1C33 Family of Seiko Epson processors
#define EM_SEP              108 // Sharp embedded microprocessor
#define EM_ARCA             109 // Arca RISC Microprocessor
#define EM_UNICORE          110 // Microprocessor series from PKU-Unity Ltd. and MPRC of Peking University
#define EM_EXCESS           111 // eXcess: 16/32/64-bit configurable embedded CPU
#define EM_DXP              112 // Icera Semiconductor Inc. Deep Execution Processor
#define EM_ALTERA_NIOS2	    113	// Altera Nios II soft-core processor
#define EM_CRX              114 // National Semiconductor CompactRISC CRX microprocessor
#define EM_XGATE            115 // Motorola XGATE embedded processor
#define EM_C166             116 // Infineon C16x/XC16x processor
#define EM_M16C             117 // Renesas M16C series microprocessors
#define EM_DSPIC30F         118 // Microchip Technology dsPIC30F Digital Signal Controller
#define EM_CE               119 // Freescale Communication Engine RISC core
#define EM_M32C             120 // Renesas M32C series microprocessors
// reserved                 121-130	Reserved for future use
#define EM_TSK3000          131 // Altium TSK3000 core
#define EM_RS08             132	// Freescale RS08 embedded processor
#define EM_SHARC            133 // Analog Devices SHARC family of 32-bit DSP processors
#define EM_ECOG2            134 // Cyan Technology eCOG2 microprocessor
#define EM_SCORE7           135 // Sunplus S+core7 RISC processor
#define EM_DSP24            136 // New Japan Radio (NJR) 24-bit DSP Processor
#define EM_VIDEOCORE3       137	// Broadcom VideoCore III processor
#define EM_LATTICEMICO32    138 //RISC processor for Lattice FPGA architecture
#define EM_SE_C17           139 // Seiko Epson C17 family
#define EM_TI_C6000         140 // The Texas Instruments TMS320C6000 DSP family
#define EM_TI_C2000         141 // The Texas Instruments TMS320C2000 DSP family
#define EM_TI_C5500         142 // The Texas Instruments TMS320C55x DSP family
#define EM_TI_ARP32         143 // Texas Instruments Application Specific RISC Processor, 32bit fetch
#define EM_TI_PRU           144 // Texas Instruments Programmable Realtime Unit
// reserved	                145-159	Reserved for future use
#define EM_MMDSP_PLUS       160 //
// reserved	                145-159	Reserved for future use
#define EM_MMDSP_PLUS       160 // STMicroelectronics 64bit VLIW Data Signal Processor
#define EM_CYPRESS_M8C      161 // Cypress M8C microprocessor
#define EM_R32C	            162 // Renesas R32C series microprocessors
#define EM_TRIMEDIA         163	// NXP Semiconductors TriMedia architecture family
#define EM_QDSP6            164 // QUALCOMM DSP6 Processor
#define EM_8051             165 // Intel 8051 and variants
#define EM_STXP7X           166 // STMicroelectronics STxP7x family of configurable and extensible RISC processors
#define EM_NDS32            167 // Andes Technology compact code size embedded RISC processor family
#define EM_ECOG1            168 // Cyan Technology eCOG1X family
#define EM_ECOG1X           168 // Cyan Technology eCOG1X family
#define EM_MAXQ30           169 // Dallas Semiconductor MAXQ30 Core Micro-controllers
#define EM_XIMO16           170 // New Japan Radio (NJR) 16-bit DSP Processor
#define EM_MANIK            171 // M2000 Reconfigurable RISC Microprocessor
#define EM_CRAYNV2          172 // Cray Inc. NV2 vector architecture
#define EM_RX               173 // Renesas RX family
#define EM_METAG            174 // Imagination Technologies META processor architecture
#define EM_MCST_ELBRUS      175 // MCST Elbrus general purpose hardware architecture
#define EM_ECOG16           176 // Cyan Technology eCOG16 family
#define EM_CR16             177 // National Semiconductor CompactRISC CR16 16-bit microprocessor
#define EM_ETPU             178 // Freescale Extended Time Processing Unit
#define EM_SLE9X            179 // Infineon Technologies SLE9X core
#define EM_L10M             180 // Intel L10M
#define EM_K10M             181 // Intel K10M
// reserved                 182	Reserved for future Intel use
#define EM_AARCH64          183 // ARM 64-bit architecture (AARCH64)
// reserved                 184	Reserved for future ARM use
#define EM_AVR32            185 // Atmel Corporation 32-bit microprocessor family
#define EM_STM8             186 // STMicroeletronics STM8 8-bit microcontroller
#define EM_TILE64           187 // Tilera TILE64 multicore architecture family
#define EM_TILEPRO          188 // Tilera TILEPro multicore architecture family
#define EM_MICROBLAZE       189 // Xilinx MicroBlaze 32-bit RISC soft processor core
#define EM_CUDA             190 // NVIDIA CUDA architecture
#define EM_TILEGX           191 // Tilera TILE-Gx multicore architecture family
#define EM_CLOUDSHIELD      192 // CloudShield architecture family
#define EM_COREA_1ST        193 // KIPO-KAIST Core-A 1st generation processor family
#define EM_COREA_2ND        194 // KIPO-KAIST Core-A 2nd generation processor family
#define EM_ARC_COMPACT2     195 // Synopsys ARCompact V2
#define EM_OPEN8            196 // Open8 8-bit RISC soft processor core
#define EM_RL78             197 // Renesas RL78 family
#define EM_VIDEOCORE5       198 // Broadcom VideoCore V processor
#define EM_78KOR            199 // Renesas 78KOR family
#define EM_56800EX          200 // Freescale 56800EX Digital Signal Controller (DSC)
#define EM_BA1              201 // Beyond BA1 CPU architecture
#define EM_BA2              202 // Beyond BA2 CPU architecture
#define EM_XCORE            203 // XMOS xCORE processor family
#define EM_MCHP_PIC         204 // Microchip 8-bit PIC(r) family
#define EM_INTEL205         205 // Reserved by Intel
#define EM_INTEL206         206 // Reserved by Intel
#define EM_INTEL207         207 // Reserved by Intel
#define EM_INTEL208         208 // Reserved by Intel
#define EM_INTEL209         209 // Reserved by Intel
#define EM_KM32             210 // KM211 KM32 32-bit processor
#define EM_KMX32            211	// KM211 KMX32 32-bit processor
#define EM_KMX16            212	// KM211 KMX16 16-bit processor
#define EM_KMX8             213 // KM211 KMX8 8-bit processor
#define EM_KVARC            214	// KM211 KVARC processor
#define EM_CDP              215 // Paneve CDP architecture family
#define EM_COGE             216 // Cognitive Smart Memory Processor
#define EM_COOL             217 // Bluechip Systems CoolEngine
#define EM_NORC             218 // Nanoradio Optimized RISC
#define EM_CSR_KALIMBA      219	// CSR Kalimba architecture family
#define EM_Z80              220 // Zilog Z80
#define EM_VISIUM           221	// Controls and Data Services VISIUMcore processor
#define EM_FT32             222 // FTDI Chip FT32 high performance 32-bit RISC architecture
#define EM_MOXIE            223	// Moxie processor family
#define EM_AMDGPU           224	// AMD GPU architecture
// Reserved                 225 - 242 reserved for future use
#define EM_6809             225 // Motorola 6809
#define EM_6309             226 // Hitachi 6309
#define EM_RISCV            243	// RISC-V


#endif

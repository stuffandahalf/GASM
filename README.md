# GASM
Greg's retargettable assembler

## Dependencies
- GMake
- Lex
- YACC
- CC

## To Build
`gmake TARGET=${YOUR_TARGET}`
where YOUR_TARGET is the target you wish to build for

## To Retarget
Create a new directory in the isa folder called the name of your new architecture(s).
In this folder, create your lexer and parser. Additionally create a c header file called arch.h with the following macros.

* DEFAULT_ARCH : The default architecture to be used.
* NUM_ARCH : The number of architectures supported by this assembler
* SUPPORTED_ARCH: A C array containing the names of the supported architectures

Refer to the included 6x09 folder for a working example.

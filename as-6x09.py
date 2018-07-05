#!/usr/bin/env python
# -*- coding: utf-8 -*-

#from asm_parser import ASM_Parser

import as_lex
import as_yacc

def main(args):
    #parser = ASM_Parser()
    #parser.run()
    
    while True:
        try:
            s = raw_input('Assemble > ')
        except EOFError:
            break
        if not s:
            continue
        as_yacc.asm_parser.parse(s)
    
    return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))

#!/usr/bin/env python
# -*- coding: utf-8 -*-

#from asm_parser import ASM_Parser

import as_lex
import as_yacc

import argparse

def main(args):
    #parser = ASM_Parser()
    #parser.run()

    # while True:
    #     try:
    #         #s = raw_input('Assemble > ')
    #         s = raw_input()
    #     except EOFError:
    #         break
    #     if not s:
    #         continue
    #     as_yacc.asm_parser.parse(s)
    
    arg_parser = argparse.ArgumentParser(description='6x09 family assembler.')
    arg_parser.add_argument('fname', metavar='FILE', type=str, nargs='?', help='The file to assemble.')
    arg_parser.add_argument('-m', '--arch', type=str, metavar='arch', default='6809', help='The architecture for which to assemble.')

    args = vars(arg_parser.parse_args())
    print args
    #if len(args) > 1:
    
    src = None
    if args['fname'] == None:
        src = sys.stdin.read()
    else:
        f = open(args['fname'])
        src = f.read()
    print src
    #f = open(args['fname'])
    #print f.read()
    
    return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))

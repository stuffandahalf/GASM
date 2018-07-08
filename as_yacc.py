import ply.yacc as yacc
import as_lex

from as_lib import *

starting_address = 0x0

tokens = as_lex.tokens
start = 'program'

def p_program(p):
    '''
    program : program statement
            | statement
    '''


def p_statement(p):
    '''
    statement : label
              | instruction
    '''
    print p.__dict__
    print '\n'


def p_label(p):
    '''
    label : IDENTIFIER COLON
    '''

def p_immediate(p):
    '''
    immediate : POUND HEXNUM
              | POUND DECNUM
    '''
    #print(p[2])
    p[0] = Value(Addressing_Modes.Immediate, str_to_int(p[2]))

    #print(p[0])

def p_indexed(p):
    '''
    indexed :
    '''

def p_direct_or_extended(p):
    '''
    direct_or_extended : DECNUM
                       | HEXNUM
    '''
    p[0] = str_to_int(p[1])
    if p[0] > 0xFF:
        p[0] = Value(Addressing_Modes.Extended, p[0])
    else:
        p[0] = Value(Addressing_Modes.Direct, p[0])
    print p[0]

def p_instruction_lda(p):
    '''
    instruction_lda : LDA immediate
                    | LDA direct_or_extended
    '''
    print p[2]

def p_instruction_adda(p):
    '''
    instruction_adda : ADDA immediate
                     | ADDA direct_or_extended
    '''
    print p.__dict__

def p_instruction_sta(p):
    '''
    instruction_sta : STA direct_or_extended
    '''

def p_value(p):
    '''
    value : immediate
    '''
    '''
          | direct
          | indirect
          | extended
    '''
    print p.__dict__


def p_instruction(p):
    '''
    instruction : instruction_lda
                | instruction_adda
                | instruction_sta
    '''


def p_error(p):
    if p:
        print("Syntax error at '%s'" % p.value)
    else:
        print("Syntax error at EOF")


asm_parser = yacc.yacc()

def parse(data, debug=0):
    asm_parser.error = 0
    p = asm_parser.parse(data, debug=debug)
    if asm_parser.error:
        return None
    return p

import ply.yacc as yacc
import as_lex

tokens = as_lex.tokens

start = 'program'

def p_program(p):
    '''
    program : program statement
            | statement
    '''


def p_statement(p):
    '''
    statement : label instruction value
    '''
    print p.__dict__
    print '\n'


def p_label(p):
    '''
    label : IDENTIFIER COLON
          |
    '''


def p_instruction(p):
    '''
    instruction : LDA
                | ADDA
                | STA
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


def p_immediate(p):
    '''
    immediate : POUND HEXNUM
              | POUND DECNUM
    '''
    #print(p[2])
    if p[2].startswith('$'):
        p[0] = int(p[2][1:], 16)
    elif p[2].startswith('0x'):
        p[0] = int(p[2][2:], 16)
    else:
        p[0] = int(p[2])
    #print(p[0])


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

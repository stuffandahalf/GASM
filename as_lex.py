import ply.lex as lex
import re

reserved = {
    #':': 'COLON',
    #'%': 'PERCENT',
    'lda': 'LDA',
    'adda': 'ADDA',
    'sta': 'STA',
    'rmb': 'RMB'
    #'include': 'INCLUDE'
}

tokens = (
    'POUND',
    'COLON',
    'PERCENT',
    'PERIOD',
    'COMMA',
    'DECNUM',
    'HEXNUM',
    'COMMENT',
    'IDENTIFIER'
    #'LDA'
    #'ADDA',
    #'STA',
    #'RMB'
) + tuple(reserved.values())


t_POUND = r'\#'
t_COLON = r'\:'
t_PERCENT = r'\%'
t_PERIOD = r'\.'
t_COMMA = r'\,'

t_DECNUM = r'[0-9]+'
t_HEXNUM = r'(\$|0x)[0-9A-Fa-f]+'

t_ignore = r' 	'#\r\f\v'

def t_COMMENT(t):
    r'\;.*'
    pass
#    t.lexer.lineno += t.value.count('\n')
    #return t

def t_IDENTIFIER(t):
    r'[a-zA-Z_][a-zA-Z0-9_]*'
    t.type = reserved.get(t.value, 'IDENTIFIER')
    return t


def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)
    pass


def t_error(t):
    print('Illegal character \'%s\'' % t.value[0])
    t.lexer.skip(1)


lex.lex(debug=0, reflags=re.IGNORECASE)

def test(data):
    lex.input(data)
    while True:
        tok = lex.token()
        if not tok:
            break
        print(tok)

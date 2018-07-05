import ply.lex as lex

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
    'DECNUM',
    'HEXNUM',
    'IDENTIFIER'
    #'LDA'
    #'ADDA',
    #'STA',
    #'RMB'
) + tuple(reserved.values())

t_POUND         = r'\#'
t_COLON         = r'\:'
t_PERCENT       = r'\%'
t_PERIOD        = r'\.'

t_DECNUM        = r'[0-9]+'
t_HEXNUM        = r'(\$|0x)[0-9A-Fa-f]+'

t_ignore        = r' \t'

def t_IDENTIFIER(t):
    r'[a-zA-Z_][a-zA-Z0-9_]*'
    t.type = reserved.get(t.value, 'IDENTIFIER')
    return t

def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)
    
def t_error(t):
    print('Illegal character \'%s\'' % t.value[0])
    t.lexer.skip(1)

'''    
def test(data):
    lexer.input(data)
    while True:
        tok = lexer.token()
        if not tok:
            break
        print(tok)
'''

lex.lex(debug=1)

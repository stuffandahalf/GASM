import ply.lex as lex
import re

class ASMLexer(object):
    
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
    
    t_POUND     = r'\#'
    t_COLON     = r'\:'
    t_PERCENT   = r'\%'
    t_PERIOD    = r'\.'
    t_DECNUM    = r'[0-9]+'
    t_HEXNUM    = r'(\$|0x)[0-9a-f]+'
    
    
    #t_LDA       = r'[lL][dD][aA]'
    #t_ADDA      = r'adda'
    #t_STA       = r'sta'
    #t_RMB       = r'rmb'

    def t_IDENTIFIER(self, t):
        r'[a-zA-Z_][a-zA-Z_0-9]*'
        t.type = self.reserved.get(t.value, 'IDENTIFIER')    # Check for reserved words
        return t

    def t_newline(self,t):
        r'\n+'
        t.lexer.lineno += len(t.value)
        
    t_ignore        = r' \t'
    
    def t_error(self,t):
        print("Illegal character '%s'" % t.value[0])
        t.lexer.skip(1)

    def build(self, **kwargs):
        self.lexer = lex.lex(module = self, **kwargs)
        
    # Test it output
    def test(self, data):
        self.lexer.input(data)
        while True:
            tok = self.lexer.token()
            if not tok:
                break
            print(tok)
             
l = ASMLexer()
l.build()
l.test("start: lda #$5\n.loop: adda 0x5")
#l.test(".loop: adda 0x5")

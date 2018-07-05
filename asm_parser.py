import ply.lex as lex
import ply.yacc as yacc
import re

class Parser(object):
    """
    Base class for a lexer/parser that has the rules defined as methods
    """
    tokens = ()
    precedence = ()

    def __init__(self, **kw):
        self.debug = kw.get('debug', 0)
        self.names = {}
        try:
            modname = os.path.split(os.path.splitext(__file__)[0])[1] + "_" + self.__class__.__name__
        except:
            modname = "parser" + "_" + self.__class__.__name__
        self.debugfile = modname + ".dbg"
        self.tabmodule = modname + "_" + "parsetab"
        # print self.debugfile, self.tabmodule

        # Build the lexer and parser
        self.lexer = lex.lex(module=self, debug=self.debug)
        yacc.yacc(module=self,
                  debug=self.debug,
                  debugfile=self.debugfile,
                  tabmodule=self.tabmodule)

    def run(self):
        while 1:
            try:
                s = raw_input('assemble > ')
            except EOFError:
                break
            if not s:
                continue
            yacc.parse(s)

class ASMParser(Parser):
    
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
    t_HEXNUM    = r'(\$|0x)[0-9a-fA-F]+'
    
    
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

    #def build(self, **kwargs):
    #    self.lexer = lex.lex(module = self, **kwargs)
        
    # Test it output
    def test(self, data):
        self.lexer.input(data)
        while True:
            tok = self.lexer.token()
            if not tok:
                break
            print(tok)
    
    
    def p_immediate(self, p):
        '''
        immediate : POUND HEXNUM
                  | POUND DECNUM
        '''
        print p[2]
        if p[2].startswith('$'):
            p[0] = int(p[2][1:], 16)
        elif p[2].startswith('0x'):
            p[0] = int(p[2][2:], 16)
        else:
            p[0] = int(p[2])
        print p[0]
    
    def p_error(self, p):
        if p:
            print("Syntax error at '%s'" % p.value)
        else:
            print("Syntax error at EOF")
             
#l = ASMParser()
#l.test("start: lda #$5\n.loop: adda 0x5")

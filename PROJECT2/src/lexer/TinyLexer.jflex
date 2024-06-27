package lexer; 

import parser.sym; 
%%

%cup
%class TinyLexer
%unicode
%type java_cup.runtime.Symbol
%line
%column
%{
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline + 1, yycolumn + 1, value);
    }
%}

%%

IF          "if"                             { return symbol(sym.IF, yytext()); }
THEN        "then"                           { return symbol(sym.THEN, yytext()); }
ELSE        "else"                           { return symbol(sym.ELSE, yytext()); }
END         "end"                            { return symbol(sym.END, yytext()); }
REPEAT      "repeat"                         { return symbol(sym.REPEAT, yytext()); }
UNTIL       "until"                          { return symbol(sym.UNTIL, yytext()); }
READ        "read"                           { return symbol(sym.READ, yytext()); }
WRITE       "write"                          { return symbol(sym.WRITE, yytext()); }

ID          [a-zA-Z][a-zA-Z0-9]*             { return symbol(sym.ID, yytext()); }
NUM         [0-9]+                           { return symbol(sym.NUM, yytext()); }

ASSIGN      ":="                             { return symbol(sym.ASSIGN, yytext()); }
SEMICOLON   ";"                              { return symbol(sym.SEMICOLON, yytext()); }
LPAREN      "\("                             { return symbol(sym.LPAREN, yytext()); }
RPAREN      "\)"                             { return symbol(sym.RPAREN, yytext()); }
PLUS        "\+"                             { return symbol(sym.PLUS, yytext()); }
MINUS       "-"                              { return symbol(sym.MINUS, yytext()); }
TIMES       "\*"                             { return symbol(sym.TIMES, yytext()); }
OVER        "/"                              { return symbol(sym.OVER, yytext()); }

EQ          "="                              { return symbol(sym.EQ, yytext()); }
LT          "<"                              { return symbol(sym.LT, yytext()); }
GT          ">"                              { return symbol(sym.GT, yytext()); }
LE          "<="                             { return symbol(sym.LE, yytext()); }
GE          ">="                             { return symbol(sym.GE, yytext()); }
NE          "!="                             { return symbol(sym.NE, yytext()); }

WHITESPACE  [ \t\n\r]+                       { /* Ignore whitespace */ }
.           { throw new Error("Illegal character: " + yytext()); }
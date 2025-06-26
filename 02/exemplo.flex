/* Definição: seção para código do usuário. */

import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

"if"            { return new Symbol(sym.IF); }
"else"          { return new Symbol(sym.ELSE); }
"["             { return new Symbol(sym.ACOLCH); }
"]"             { return new Symbol(sym.FCOLCH); }
"("             { return new Symbol(sym.APARENT); }
")"             { return new Symbol(sym.FPARENT); }
";"             { return new Symbol(sym.PTVIRG); }
"="             { return new Symbol(sym.IGUAL); }
"<"             { return new Symbol(sym.MENOR); }
[a-zA-Z_][a-zA-Z0-9_]* { return new Symbol(sym.ID, yytext()); }
{inteiro}                { return new Symbol(sym.INTEIRO, Integer.valueOf(yytext())); }
[ \t\r\n]+            { /* ignora */ }
.                     { System.err.println("Caractere inválido: " + yytext()); }
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

"do"            { return new Symbol(sym.DO); }
"out"           { return new Symbol(sym.OUT); }
"["             { return new Symbol(sym.ABRECOLCHETE); }
"]"             { return new Symbol(sym.FECHACOLCHETE); }
"("             { return new Symbol(sym.ABREPARENTESE); }
")"             { return new Symbol(sym.FECHAPARENTESE); }
";"             { return new Symbol(sym.PONTOVIRG); }
"="             { return new Symbol(sym.IGUAL); }
"<"             { return new Symbol(sym.MENORQUE); }
"++"            { return new Symbol(sym.INCREMENTO); }
[a-zA-Z_][a-zA-Z0-9_]* { return new Symbol(sym.ID, yytext()); }
[0-9]+                { return new Symbol(sym.INTEIRO, Integer.valueOf(yytext())); }
[ \t\r\n]+            { /* ignora */ }
.                     { System.err.println("Caractere inválido: " + yytext()); }
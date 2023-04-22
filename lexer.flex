
package codigo;         
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
float= [-0-9][0-9]*|
double= [-0-9][0-9]*|
int= [-0-9][0-9]*|
long= [-0-9][0-9]*|
short= [-0-9][0-9]*|
string|
boolean|
if|
if-else|
if-if else|
if-if else-else|
switch|
switch-switch|
for|
do while|
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"^" {return Potencia;}
"()" {return Parentesis;}
">" {return Mayor que;}
"≥" {return Mayor o igual que;}
"<" {return Manor que;}
"=" {return Igual;}
"≠" {return Diferente;}
"y" {return Y;}
"o" {return O;}
"negacion" {return Negacion ;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}

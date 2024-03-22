%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
    extern void yyerror(const char *s);  
%}

%option noyywrap
%option yylineno
alpha [a-zA-Z_]
digit [0-9]

%%
"int"                       { return INT; }
"char"                      { return CHAR; }
"float"                     { return FLOAT; }
"double"                    { return DOUBLE; }
"while"                     { return WHILE; }
"for"	                    { return FOR; }
"do"                        { return DO; }
"if"	                    { return IF; }
"switch"                    {return SWITCH;}
"case"                      {return CASE;}
"break"                     {return BREAK;}
"default"                   {return DEFAULT;}
"else"	                    { return ELSE; }
^"#include"[ ]*<.+\.h>      { return INCLUDE; }
"main()"                    { return MAIN; }
"true"                      { return TRUE; }
"false"                     { return FALSE; }
"return"                    { return RETURN; }
"-"                         { return SUBTRAC; }
[-]?{digit}+[.]?{digit}*    { return NUMBER; }
{alpha}({alpha}|{digit})*   { return ID; }
[']{alpha}[']               { return STRLITERAL; }
["]{alpha}["]               { return STRLITERAL; }
"++"                        { return INC; }
"--"                        { return DEC; }
"<="                        { return LESSEREQ; }
">="                        { return GREATEREQ; }
"=="                        { return EQCOMP; }
"!="                        { return NOTEQ; }
">"	                        { return GREATER; }
"<"	                        { return LESSER; }
"&&"	                    { return ANDAND; }
"||"	                    { return OROR; }
"+"                         { return ADD; }
"="                         { return EQ; }
"/"                         { return DIVIDE; }
"*"                         { return MULTIPLY; }
\/\/.*                      { ; }
\/\*(.*\n)*.*\*\/           { ; } 
[ \t]*                      { ; }
[\n]                        { ; }
"("                         { return LP; }
")"                         { return RP; }
"{"                         { return LB; }
"}"                         { return RB; }
"["                         { return LS; }
"]"                         { return RS; }
","                         { return COM; }
":"                         { return COL; }
";"                         { return DLT; }
.                           { yyerror("Unrecognised Token"); return *yytext;}
%%

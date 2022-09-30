/*
Compilador de C--
Universidade de Brasília
Departamento de Ciência da Computação
Compiladores - CIC000 - 2022/1 A
Prof. Dr. Germana
Desenvolvido por
	Bruno Sanguinetti Regadas de Barros - 18/0046063
	Caio Bernardon N. K. Massucato - 16/0115001
    Caroline Ferreira Pinto - 16/0067766
*/


/* 
    Permite retirar as chamadas ao yywrap e main 
    Veja: https://www.ime.usp.br/~kon/MAC211/2002/lista/msg00071.html
*/
%option noyywrap

/* Declarações */
%{
#include <stdio.h>
void getToken(void);
%}


/* Definicoes e Regex 
   comment está zoado
*/
digit       [0-9]
number      {digit}+
letter      [a-zA-Z]
identifier  {letter}+
newline     [\n]
whitespace  [ ]
whitespaces {whitespace}+
comment ["(/*")([^*/)])*("*/)]"{1}


/* 
    Dúvida whitespace, como contabilizar? 
    É pra ser assim mesmo?
*/
%%
"if"              {getToken();}
"else"            {getToken();}
"="               {getToken();}
"<"               {getToken();}
">"               {getToken();}
"<="              {getToken();}
">="              {getToken();}
"+"               {getToken();}
"-"               {getToken();}
"*"               {getToken();}
"/"               {getToken();}
"("               {getToken();}
")"               {getToken();}
";"               {getToken();}
{number}          {getToken();}
{identifier}      {getToken();}
{whitespace}      {getToken();}
{whitespaces}     {getToken();}
{comment}         {getToken();}
%%

/* Funcao de Teste */
void getToken(void)
{ 
    printf("INPUT\n");
}
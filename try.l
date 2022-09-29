%{
#include <stdio.h>
%}


keyword IF|ELSE|WHILE|INT|VOID|RETURN

sum [+]
sub [-]
mul [*]
div [/]
assig [:][=]
lesserEqual [<=]
lesser [<]
greater [>]


digit       [0-9]
letter      [a-zA-Z]
id          {letter}+
intcon      {digit}+

whitespace  [\t]+
newline     [\n]+


charcon     {letter}+
stringcon   {charcon}+

%%
{keyword} {fprintf(yyout,"[keyword: %s]\n",yytext);}
{sum} {fprintf(yyout,"[sum: %s]\n",yytext);}
{sub} {fprintf(yyout,"[sub: %s]\n",yytext);}
{mul} {fprintf(yyout,"[mul: %s]\n",yytext);}
{div} {fprintf(yyout,"[div: %s]\n",yytext);}
{assig} {fprintf(yyout,"[assig: %s]\n",yytext);}
{lesser} {fprintf(yyout,"[lesser: %s]\n",yytext);}
{greater} {fprintf(yyout,"[greater: %s]\n",yytext);}
{lesserEqual} {fprintf(yyout,"[lesserEqual: %s]\n",yytext);}
{intcon} {fprintf(yyout,"[intcon: %s]\n",yytext);}
{id} {fprintf(yyout,"[id: %s]\n",yytext);}
{whitespace} {fprintf(yyout,"[whitespace: %s]\n",yytext);}
{newline} {fprintf(yyout,"[newline: %s]\n",yytext);}
%%

int yywrap ();

main(argc, argv)
 int argc;
 char **argv;
    {
	++argv; --argc;
	if(argc > 0)
		yyin = fopen(argv[0],"rt");
	else
		yyin = stdin; 
	if(argc > 1)
		yyout = fopen(argv[1],"wt");
	else
		yyout = stdout;
	yylex();
	fclose(yyin);
	fclose(yyout);
    }

int yywrap() {
	return 1;
}
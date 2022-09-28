/* 
    Aprendendo a usar o flex
*/

%{
/* need this for the call to getlogin() below */
#include <unistd.h>
%}

/* 
    Aqui começa as regras
    regra/padra -> acao

    username -> printf() 
*/
%%
username	printf("%s\n", getlogin());
%%

main()
{
  yylex();
}

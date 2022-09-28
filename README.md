## Aprendo Flex

```
%{
#include <unistd.h>
%}

%%
username	printf("%s\n", getlogin());
%%

main()
{
  yylex();
}
```

Adiciona no `YY_RULE_SETUP` a regra para a pattern username
no lex.yy.c

```#line 6 "try.l"
    printf("%s\n", getlogin());
	YY_BREAK
```

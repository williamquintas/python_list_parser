
%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
#include <stdio.h>
%}


%%

"[" {
  return CHAVE_ABRINDO;
}

"]" {
  return CHAVE_FECHANDO;
}

"," {
  return VIRGULA;
}

\"*[a-zA-Z0-9]+\"* {
  return ELEMENTO;
}

\n {
  return EOL;
}

[ \t] ;

%%

int yywrap() {
  return 1;
}

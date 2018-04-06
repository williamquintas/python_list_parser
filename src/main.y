

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int a = 0, erro=0;
%}

%token EOL CHAVE_ABRINDO CHAVE_FECHANDO VIRGULA ELEMENTO

%%

PROGRAMA:
  PROGRAMA LISTA EOL {
    if(erro == 0) printf("OK\n");
    else printf("ERRO\n");
  }
  |
  ;

LISTA:
  CHAVE_ABRINDO CHAVE_FECHANDO
  | CHAVE_ABRINDO LISTA CHAVE_FECHANDO;
  | CHAVE_ABRINDO ELEMENTOS CHAVE_FECHANDO;
  | CHAVE_ABRINDO ELEMENTOS {
    erro = 1;
  }

ELEMENTOS:
  ELEMENTO
  | ELEMENTO VIRGULA ELEMENTOS
  | ELEMENTO VIRGULA LISTA
  | ELEMENTO ELEMENTOS {
    erro = 1;
  }
  ;

%%

void yyerror(char *s) {
  fprintf(stderr, "Erro: %s\n", s);
}

int main() {
  yyparse();
  return 0;

}



%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token inteiro palavra string virgula abre fecha EOL

%%

linha:
   cadeia EOL { printf("OK\n");
                exit(1);} ;

atomo:
   inteiro;
   | palavra;
   | string;
   | lista;

cadeia:
   atomo;
   | ;
   | atomo virgula cadeia;

lista:
   abre cadeia fecha;



%%

void yyerror(char *s) {
    printf("ERRO\n");
/*    fprintf(stderr, "%s\n", s);*/
}

int main() {
  yyparse();
    return 0;

}

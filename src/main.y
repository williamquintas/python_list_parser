

%{
#include <stdio.h>
void yyerror(char *c);
int yylex(void);
%}


%%

S:
 |
 ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
  yyparse();
    return 0;

}

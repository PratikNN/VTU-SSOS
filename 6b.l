%{
#include"y.tab.h"
extern yylval;
%}
%%
[+\-\*\/\=\<\>] {printf("operator%s",yytext); return OP;}
[0-9]+ {yylval=atoi(yytext); printf("\ndigit %d",yylval); return DIGIT;}
[a-zA-Z0-9]+ {printf("\nidentifier%s",yytext); return ID;}

int|float|char|double|bool|void|if|else|while|for|do {printf("keyword :%s",yytext); return KEY;}
.;
%%


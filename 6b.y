%{
#include<stdio.h>
#include<stdlib.h>
int op=0,id=0,key=0,dig=0;
%}
%token ID OP KEY DIGIT
%%
input:DIGIT input{dig++;}
|KEY input{key++;}
|OP input{op++;}
|ID input{id++;}
|ID {id++;}
|OP {op++;}
|KEY {key++;}
|DIGIT {dig++;}
;
%%
#include<stdio.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
int main()
{
FILE *myfile=fopen("sam_input.c","r");
if(!myfile)
{
printf("file error");
return -1;
}

yyin=myfile;
do
{
yyparse();
}while(!feof(yyin));
printf("id:%d,op:%d,dig:%d,key:%d",id,op,dig,key);
return 0;
}
int yyerror()
{
printf("error");
exit(0);
}

int yywrap(void)
{
return 1;
}

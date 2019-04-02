%{
#include<stdio.h>
int v=0,flag=0,id=0,op=0;
%}
%%
[a-zA-Z]+[0-9a-zA-Z]* {id++; printf("\nidentifier:"); ECHO;}
[\+\-\*\/\=] {op++; printf("\noperator:"); ECHO;}

"(" {v++;}
")" {v--;}
";" {flag=1;}
. {;}
%%
int main(void)
{
printf("enter an expression\n");
yylex();
if((id==op+1)&&v==0&&flag==0)
printf("valid expression");
else
printf("invalid expression");
printf("operator count is:%d\n",op);
printf("identifiers count%d\n",id);
return 0;
}
int yywrap(void)
{
return 1;
}

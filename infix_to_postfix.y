%{#include<stdio.h>
#include<ctype.h>
%}
%token num
%left '+''-'
%left '*' '/'
%%
s:e'\n'{}
e:e'+'e{printf("+");}
|e'-'e{printf("-");}
|e'/'e{printf("/");}
|e'*'e{printf("*");}
|num1{printf("%d ",$1);}
num1:num1 num {$$=$1*10+$2;}
|num
;
%%
yylex()
{
 int c;
 c=getchar();
if(isdigit(c))
{ yylval=c-'0';
 return num;
}return c;
}
int main()
{
 yyparse();
return 1;
}
int yyerror()
{
return 1;
}
int yywrap()
{
 return 1;
}

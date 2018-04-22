%{
#include<stdio.h>
#include<ctype.h>
%}
%token num
%left '+''-'
%left '*''/'
%right '^'
%%
s:e'\n'{printf("%d",$1);}
e:    e '+' e{$$=$1+$3;}
 |e '-' e{$$=$1-$3;}
 |e '*' e{$$=$1*$3;}
 |e '/' e{$$=$1/$3;}
 |e '^' e {
  int i,j=$1;
  for(i=1;i<$3;i++)
  {
  j=j*$1;
  $$=j;
  }
  }
 |'('e')'{$$=$2;}
 |num1;
num1:num1 num{$$ = $1*10 + $2;}
 |num
 ;
%%
yylex()
{
int c;
c=getchar();
if(isdigit(c))
{
yylval=c-'0';
return num;
}
return c;
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

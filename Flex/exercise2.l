%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

%}


VAR var
VariableNames trophies|wins|tickets|team|winner
IntegerType integer96
RealType    real96
CharType    char96
BooleanType boolean96
AssignmentSymbol :
Digit [3-9]|0|1
Separating 2
SeparatingSymbol ,
Boolean true|false
Char [a-z][a-z0-9]*
Unrecognized  .

%%

{VAR} { printf("Definintion of variables:%s\n",yytext); }
{VariableNames} {printf("Variables:%s\n",yytext);}
{IntegerType} {printf("Integer Type:%s\n",yytext);}   
{RealType} {printf("Real Type:%s\n",yytext);}
{CharType} {printf("Char Type:%s\n",yytext);}
{BooleanType} {printf("Boolean Type:%s\n",yytext);}             
{AssignmentSymbol} {printf("Assignment symbol:%s\n",yytext);}
{Digit}+ {printf("Integer96:%s\n",yytext);}
{Digit}+"."{Digit}* {printf("Real96:%s\n",yytext);}
{Separating} {printf("Separating Number:%s\n",yytext);}
{SeparatingSymbol} {printf("Separating Symbol:%s\n",yytext);}
{Boolean} {printf("Boolean:%s\n",yytext);}
{Char} {printf("Char:%s\n",yytext);}

"+"|"-"|"*"|"/"   printf( "Operator: %s\n", yytext );  

[ \t\n]+	     /* Mhn ypologizeis to keno */

{Unrecognized} {printf("Unrecognized:%s\n",yytext);}
%%

int yywrap(){};
int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;   
}

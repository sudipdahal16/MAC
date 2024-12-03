%{
#include <stdio.h>
#include <string.h>
%}

/* Regular Definitions */
digit       [0-9]
letter      [a-zA-Z]
identifier  ({letter}({letter}|{digit})*)
number      ({digit}+)
ws          [ \t\n]

%%

{ws}+          /* Ignore whitespace */
"if"           { printf("IF\n"); }
"else"         { printf("ELSE\n"); }
"while"        { printf("WHILE\n"); }
"for"          { printf("FOR\n"); }
"int"          { printf("INT\n"); }
"float"        { printf("FLOAT\n"); }
"char"         { printf("CHAR\n"); }
"return"       { printf("RETURN\n"); }
{identifier}   { printf("IDENTIFIER: %s\n", yytext); }
{number}       { printf("NUMBER: %s\n", yytext); }
"+"            { printf("PLUS\n"); }
"-"            { printf("MINUS\n"); }
"*"            { printf("TIMES\n"); }
"/"            { printf("DIVIDE\n"); }
"=="           { printf("EQUAL\n"); }
"="            { printf("ASSIGN\n"); }
"!="           { printf("NOT_EQUAL\n"); }
"<"            { printf("LESS_THAN\n"); }
"<="           { printf("LESS_THAN_EQUAL\n"); }
">"            { printf("GREATER_THAN\n"); }
">="           { printf("GREATER_THAN_EQUAL\n"); }
"{"            { printf("LEFT_BRACE\n"); }
"}"            { printf("RIGHT_BRACE\n"); }
"("            { printf("LEFT_PAREN\n"); }
")"            { printf("RIGHT_PAREN\n"); }
";"            { printf("SEMICOLON\n"); }
","            { printf("COMMA\n"); }

.              { printf("UNRECOGNIZED: %s\n", yytext); }

%%

/* Main Function */
int main() {
    FILE *input = fopen("fibonacci.c", "r");  // Open file explicitly
    if (!input) {
        fprintf(stderr, "Error opening file\n");
        return 1;
    }
    yyin = input;
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}

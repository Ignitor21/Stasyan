%{
  #include <iostream>
  #include <string>
  #include <limits>
%}


%option c++ noyywrap nounput noinput batch

WS       [ \n\f\r\t\v]
ID       [a-z][a-zA-Z_0-9]*
TYPEID   [A-Z][a-zA-Z_0-9]*
NUMBER   (0|[1-9][0-9]*)
STRING   ["][^\0]*["]
COMMENT  [-][-].*

ELSE     [eE][Ll][Ss][Ee]
IF       [iI][fF]
LOOP     [lL][oO][oO][pP]
THEN     [tT][hH][eE][nN]
WHILE    [wW][hH][iI][lL][eE]
NOT      [nN][oO][tT]
PRINT    [pP][rR][iI][nN][tT]
PRINTLN  [pP][rR][iI][nN][tT][lL][nN]

TRUE     [T][rR][uU][eE]
FALSE    [F][aA][lL][sS][eE]

%%

{WS}+      {} 

"-"        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "MINUS"         << "\n"; }
"+"        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "PLUS"          << "\n"; }
"*"        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "MUL"           << "\n"; }
"/"        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "DIV"           << "\n"; }
"%"        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "MOD"           << "\n"; }
"("        { std::cout << "Token type: " << "ARITH SYNTAX, " << "Value: " << "LPAREN"        << "\n"; }
")"        { std::cout << "Token type: " << "ARITH SYNTAX, " << "Value: " << "RPAREN"        << "\n"; }
"="        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "ASSIGN"        << "\n"; }    
     
{ELSE}     { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{IF}       { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{LOOP}     { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{THEN}     { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{WHILE}    { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{NOT}      { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{PRINT}    { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{PRINTLN}  { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
 
{TRUE}     { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
{FALSE}    { std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n"; }    
 
"<"        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "LESS"          << "\n"; }
">"        { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "GREATER"       << "\n"; }
"=="       { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "EQUAL"         << "\n"; }
"!="       { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "NOT EQUAL"     << "\n"; }
"<="       { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "LESS EQUAL"    << "\n"; }
">="       { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "GREATER EQUAL" << "\n"; }
"&&"       { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "AND"           << "\n"; }
"||"       { std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "OR"            << "\n"; }
 
{NUMBER}   { std::cout << "Token type: " << "NUMBER,       " << "Value: " << yytext          << "\n"; }
{ID}       { std::cout << "Token type: " << "ID,           " << "Value: " << yytext          << "\n"; }
{COMMENT}  { std::cout << "Token type: " << "COMMENT,      " << "Value: " << yytext          << "\n"; }
{STRING}   { std::cout << "Token type: " << "STRING,       " << "Value: " << yytext          << "\n"; }
{TYPEID}   { std::cout << "Token type: " << "TYPE ID,      " << "Value: " << yytext          << "\n"; }
.          { std::cout << "Token type: " << "UNKNOWN,      " << "\n";                                   }

%%

int main()
{
    FlexLexer* lexer = new yyFlexLexer;
    while(lexer->yylex() != 0);
    delete lexer;
    return 0;
}

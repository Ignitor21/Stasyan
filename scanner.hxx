#pragma once

#include <iostream>
#include <string>
#include <fstream>

#if !defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

class scanner;

#undef YY_DECL
#define YY_DECL int scanner::yylex()


class scanner final : public yyFlexLexer
{
public:

int yylex();

int scan_begin(const std::string& file)
{
    std::ifstream input{file};

    if (!input.is_open())
    {
        std::cerr << "Can't open file " << file << "\n";
        return -1;
    }

    switch_streams(input, yyout);
    while(yylex() != 0);
    return 0;
}

void make_MINUS()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "MINUS"         << "\n";
}

void make_PLUS()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "PLUS"          << "\n";
}

void make_MUL()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "MUL"           << "\n"; 
}
void make_DIV()
{ 
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "DIV"           << "\n";
}

void make_MOD()
{ 
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "MOD"           << "\n"; 
} 

void make_LPAREN()
{
    std::cout << "Token type: " << "ARITH SYNTAX, " << "Value: " << "LPAREN"        << "\n";
}

void make_RPAREN()
{
    std::cout << "Token type: " << "ARITH SYNTAX, " << "Value: " << "RPAREN"        << "\n";
}

void make_ASSIGN()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "ASSIGN"        << "\n";
}

void make_ELSE()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}       

void make_IF()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_LOOP()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}   

void make_THEN()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_WHILE()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_NOT()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_PRINT()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_PRINTLN()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_TRUE()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_FALSE()
{
    std::cout << "Token type: " << "KEYWORD,      " << "Value: " << yytext          << "\n";
}  

void make_LESS()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "LESS"          << "\n";
}

void make_GREATER()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "GREATER"          << "\n";
}

void make_EQUAL()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "EQUAL"          << "\n";
}

void make_NOT_EQUAL()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "NOT EQUAL"          << "\n";
}

void make_LESS_EQUAL()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "LESS EQUAL"          << "\n";
}

void make_GREATER_EQUAL()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "GREATER EQUAL"          << "\n";
}

void make_AND()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "AND"          << "\n";
}

void make_OR()
{
    std::cout << "Token type: " << "OPERATOR,     " << "Value: " << "OR"          << "\n";
}

void make_NUMBER()
{
    std::cout << "Token type: " << "NUMBER,       " << "Value: " << yytext          << "\n";
}

void make_ID()
{ 
    std::cout << "Token type: " << "ID,           " << "Value: " << yytext          << "\n";
}

void make_COMMENT()
{
    std::cout << "Token type: " << "COMMENT,      " << "Value: " << yytext          << "\n";
}

void make_STRING()
{
    std::cout << "Token type: " << "STRING,       " << "Value: " << yytext          << "\n";
}

void make_TYPEID()
{
    std::cout << "Token type: " << "TYPE ID,      " << "Value: " << yytext          << "\n";
}

void make_UNKNOWN()
{
    std::cout << "Token type: " << "UNKNOWN       "                                 << "\n";
}

};

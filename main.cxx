#include <iostream>
#include <FlexLexer.h>
#include "scanner.hxx"

int main (int argc, char *argv[])
{
    if (argc < 2)
    {
        std::cerr << "Missing argument - name of file\n";
        return -1;
    }
    else if (argc > 2)
    {
        std::cerr << "Too many arguments\n";
        return -1;
    }

    scanner lexer{};
    return lexer.scan_begin(argv[1]);
}

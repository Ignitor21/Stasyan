%{
  #include <iostream>
  #include <string>
  #include <limits>
  #include "scanner.hxx"

  int comment_counter = 0;
%}

%option c++ noyywrap nounput noinput batch
%option yyclass="scanner"

WS       [ \n\f\r\t\v]
ID       [a-z][a-zA-Z_0-9]*
TYPEID   [A-Z][a-zA-Z_0-9]*
NUMBER   (0|[1-9][0-9]*)
STRING   ["][^\0<<EOF>>]*["]

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

%x       COMMENT
%x       MUL_LINE_COMMENT

%%

{WS}+      /* empty */

"-"        make_MINUS(); 
"+"        make_PLUS();    
"*"        make_MUL();     
"/"        make_DIV();     
"%"        make_MOD();
"("        make_LPAREN();
")"        make_RPAREN();
"="        make_ASSIGN();

{ELSE}     make_ELSE();        
{IF}       make_IF();        
{LOOP}     make_LOOP();        
{THEN}     make_THEN();        
{WHILE}    make_WHILE();       
{NOT}      make_NOT();        
{PRINT}    make_PRINT();       
{PRINTLN}  make_PRINTLN();    
 
{TRUE}     make_TRUE();              
{FALSE}    make_FALSE();

"<"        make_LESS();          
">"        make_GREATER();       
"=="       make_EQUAL();         
"!="       make_NOT_EQUAL();     
"<="       make_LESS_EQUAL();    
">="       make_GREATER_EQUAL(); 
"&&"       make_AND();           
"||"       make_OR();

{NUMBER}   make_NUMBER();       
{ID}       make_ID();          
{STRING}   make_STRING();       
{TYPEID}   make_TYPEID();

"--"       BEGIN(COMMENT);

<COMMENT>
{
    [^<<EOF>>\n]* /* empty */
    [\n<<EOF>>]   BEGIN(INITIAL);
}

"/*"              ++comment_counter; BEGIN(MUL_LINE_COMMENT);

<MUL_LINE_COMMENT>
{
    "/*"        ++comment_counter;
    "*/"        --comment_counter; if(comment_counter == 0) BEGIN(INITIAL);
    [^<<EOF>>]* /* empty */
    <<EOF>>     LexerError("Error: EOF inside of comment");
}

.          LexerError("Error: unknown character");

%%


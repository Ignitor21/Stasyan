%{
  #include <iostream>
  #include <string>
  #include <limits>
  #include "scanner.hxx"
%}

%option c++ noyywrap nounput noinput batch
%option yyclass="scanner"

WS       [ \n\f\r\t\v]
ID       [a-z][a-zA-Z_0-9]*
TYPEID   [A-Z][a-zA-Z_0-9]*
NUMBER   (0|[1-9][0-9]*)
STRING   ["][^\0]*["]
COMMENT  [-][-][^\n]*[\n<<EOF>>]

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
{COMMENT}  make_COMMENT();      
{STRING}   make_STRING();       
{TYPEID}   make_TYPEID();       
.          make_UNKNOWN();      

%%


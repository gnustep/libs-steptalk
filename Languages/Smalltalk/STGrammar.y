/**
    STGrammar.y
    StepTalk grammar
   
    Copyright (c) 2000 Stefan Urbanek
   
    This file is part of the StepTalk project.
  
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  
 */

%lex-param {void *context}
%parse-param {void *context}
%{

    #define YYSTYPE id
    #define YYLTYPE int
    #undef YYDEBUG
    
    #import <Foundation/NSException.h>
    #import "STCompiler.h"
    #import "STCompilerUtils.h"
    #import "STSourceReader.h"
    #import "Externs.h"
    
    #import <StepTalk/STExterns.h>


/* extern int STCerror(const char *str);
   extern int STClex (YYSTYPE *lvalp, void *context);
*/
    #define YYERROR_VERBOSE

    #define CONTEXT ((STParserContext *)context)
    #define COMPILER (CONTEXT->compiler)
    #define READER   (CONTEXT->reader)
    #define RESULT   (CONTEXT->result)

    int STClex (YYSTYPE *lvalp, void *context);
    int STCerror(void *context, const char *str);
%}

%define api.pure true

/* BISON declarations */

%token TK_SEPARATOR TK_BAR TK_ASSIGNMENT
%token TK_LPAREN TK_RPAREN TK_BLOCK_OPEN TK_BLOCK_CLOSE
%token TK_LCURLY TK_RCURLY TK_ARRAY_OPEN
%token TK_DOT TK_COLON TK_SEMICOLON TK_RETURN
%token TK_IDENTIFIER TK_BINARY_SELECTOR TK_KEYWORD
%token TK_INTNUMBER TK_REALNUMBER TK_SYMBOL TK_STRING TK_CHARACTER

/* The following declarations are needed to resolve the shift-reduce
 * conflict for prefix TK_BLOCK_OPEN TK_BAR with an identifier as, lookahead
 * token. This could mark either the start of a script source or the start of
 * a parameterless block with one or more temporaries. The default resolution
 * is to shift the identifier and thus commit to the parameterless block parse,
 * while our intention is to reduce the prefix via the script_open rule.
 *
 * FIXME Chose a different prefix to mark the beginning of a script source.
 */
%precedence TK_IDENTIFIER
%precedence "script_open"

/* Grammar */

%%
source:  plain_code         {
                                [COMPILER compileMethod:$1];
                            }
        
    /* FIXME: this is a hack */
    |   TK_SEPARATOR TK_SEPARATOR method              
                            {
                                [COMPILER compileMethod:$3];
                            }
                            
    |   script_open
            methods 
        TK_BLOCK_CLOSE      
;

script_open: TK_BLOCK_OPEN TK_BAR %prec "script_open"
                            {
                                [COMPILER beginScript];
                            }
;

plain_code: statements
                            {
                                $$ =  [STCMethod methodWithPattern:nil
                                /**/                    statements:$1];
                            }
    | temporaries statements
                            {
                                [$2 setTemporaries:$1];
                                $$ =  [STCMethod methodWithPattern:nil
                                /**/                    statements:$2];
                            }
;

methods:
      block_var_list
                            {
                                [COMPILER setReceiverVariables:$1];
                            }
      method_list
                            
    | method_list
;

method_list: method
                            {
                                [COMPILER compileMethod:$1];
                            }
    | method_list TK_SEPARATOR method
                            {
                                [COMPILER compileMethod:$3];
                            }
;

method: message_pattern statements
                            {
                                $$ =  [STCMethod methodWithPattern:$1
                                /**/                    statements:$2];
                            }
    | message_pattern temporaries statements
                            {
                                [$3 setTemporaries:$2];
                                $$ =  [STCMethod methodWithPattern:$1
                                /**/                    statements:$3];
                            }
;

message_pattern:
    unary_selector
                            {
                                $$ = [STCMessage message];
                                [$$ addKeyword:$1 object:nil];
                            }
    | binary_selector variable_name
                            {
                                $$ = [STCMessage message];
                                [$$ addKeyword:$1 object:$2];
                            }
    | keyword_list
;

keyword_list: keyword variable_name
                            {
                                $$ = [STCMessage message];
                                [$$ addKeyword:$1 object:$2];
                            }
    | keyword_list keyword variable_name
                            {
                                [$1 addKeyword:$2 object:$3];
                                $$ = $1;
                            }
;

temporaries: TK_BAR TK_BAR
                            {
                                $$ = [NSMutableArray array];
                            }
    | TK_BAR variable_list TK_BAR
                            {
                                $$ = $2;
                            }
;

variable_list: variable_name
                            { 
                                $$ = [NSMutableArray array];
                                [$$ addObject:$1]; 
                            }
    | variable_list variable_name
                            { 
                                $$ = $1; 
                                [$$ addObject:$2]; 
                            }
;

block: TK_BLOCK_OPEN statements TK_BLOCK_CLOSE
                            {
                                $$ = [STCBlock block];
                                [$$ setStatements:$2];
                            }
    | TK_BLOCK_OPEN temporaries statements TK_BLOCK_CLOSE
                            {
                                [$3 setTemporaries:$2];
                                $$ = [STCBlock block];
                                [$$ setStatements:$3];
                            }
    | TK_BLOCK_OPEN block_var_list TK_BAR statements TK_BLOCK_CLOSE
                            {
                                $$ = [STCBlock block];
                                [$$ setArguments:$2];
                                [$$ setStatements:$4];
                            }
    | TK_BLOCK_OPEN block_var_list TK_BAR temporaries statements TK_BLOCK_CLOSE
                            {
                                [$5 setTemporaries:$4];
                                $$ = [STCBlock block];
                                [$$ setArguments:$2];
                                [$$ setStatements:$5];
                            }
;
block_var_list: TK_COLON variable_name
                            { 
                                $$ = [NSMutableArray array];
                                [$$ addObject:$2]; 
                            }
    | block_var_list TK_COLON variable_name
                            { 
                                $$ = $1; 
                                [$$ addObject:$3]; 
                            }
;
statements: /* nothing */   { $$ = [STCStatements statements]; }
    | TK_RETURN expression
                            { 
                                $$ = [STCStatements statements];
                                [$$ setReturnExpression:$2];
                            }
    | expressions
                            { 
                                $$ = [STCStatements statements];
                                [$$ setExpressions:$1];
                            }

    | expressions TK_DOT
                            { 
                                $$ = [STCStatements statements];
                                [$$ setExpressions:$1];
                            }
    | expressions TK_DOT TK_RETURN expression
                            { 
                                $$ = [STCStatements statements];
                                [$$ setReturnExpression:$4];
                                [$$ setExpressions:$1];
                            }
;    
    
expressions:
    expression              { 
                                $$ = [NSMutableArray array];
                                [$$ addObject:$1];
                            }
                            
    | expressions TK_DOT expression
                            {   
                                $$ = $1; 
                                [$$ addObject:$3]; 
                            }
;
expression: primary         
                            { 
                                $$ = [STCExpression 
                                /**/          primaryExpressionWithObject:$1];
                            }
    | assignments primary
                            { 
                                $$ = [STCExpression 
                                /**/          primaryExpressionWithObject:$2];
                                [$$ setAssignments:$1];
                            }
    | message_expression
    | assignments message_expression
                            { 
                                $$ = $2;
                                [$$ setAssignments:$1];
                            }
    | cascade
    | assignments cascade
                            { 
                                $$ = $2;
                                [$$ setAssignments:$1];
                            }
;
assignments: assignment     
                            { 
                                $$ = [NSMutableArray array];
                                [$$ addObject:$1];
                            }
    | assignments assignment
                            { 
                                $$ = $1; 
                                [$$ addObject:$2]; 
                            } 
;

assignment: variable_name TK_ASSIGNMENT
                            { $$ = $1;}
;
cascade: message_expression messages
                            { 
                                $$ = $1;
                                [$$ setCascade:$2]; 
                            }
;
messages: TK_SEMICOLON message
                            {
                                $$ = [NSMutableArray array];
                                [$$ addObject:$2]; 
                            }
    | messages TK_SEMICOLON message
                            { 
                                $$ = $1; 
                                [$$ addObject:$3];
                            }
;
message: unary_message
    | binary_message
    | keyword_message
;

message_expression: unary_expression
    | binary_expression
    | keyword_expression
;
unary_expression: unary_object unary_message
                            { 
                                $$ = [STCExpression 
                                /**/        messageExpressionWithTarget:$1
                                /**/        message:$2];
                            }
;
unary_message: unary_selector
                            { 
                                $$ = [STCMessage message];
                                [$$ addKeyword:$1 object:nil];
                            }
;
binary_expression: binary_object binary_message
                            { 
                                $$ = [STCExpression 
                                /**/        messageExpressionWithTarget:$1
                                /**/        message:$2];
                            }
;
binary_message: binary_selector unary_object
                            { 
                                $$ = [STCMessage message];
                                [$$ addKeyword:$1 object:$2];
                            }
;
keyword_expression: binary_object keyword_message
                            {
                                $$ = [STCExpression 
                                /**/        messageExpressionWithTarget:$1
                                /**/        message:$2];
                            }
;
keyword_message: keyword binary_object 
                            { 
                                $$ = [STCMessage message];
                                [$$ addKeyword:$1 object:$2];
                            }
    | keyword_message keyword binary_object 
                            { 
                                $$ = $1;
                                [$$ addKeyword:$2 object:$3];
                            }
;
unary_object: primary
    | unary_expression
;
binary_object: unary_object
    | binary_expression
;
primary: variable_name      
                            {
                                $$ = [STCPrimary primaryWithVariable:$1];
                            }
    | literal
                            {
                                $$ = [STCPrimary primaryWithLiteral:$1];
                            }
    | block
                            {
                                $$ = [STCPrimary primaryWithBlock:$1];
                            }
    | TK_LCURLY TK_RCURLY
                            {
                                $$ = [STCPrimary primaryWithArray:[NSArray array]];
                            }
    | TK_LCURLY expressions TK_RCURLY
                            {
                                $$ = [STCPrimary primaryWithArray:$2];
                            }
    | TK_LPAREN expression TK_RPAREN 
                            {
                                $$ = [STCPrimary primaryWithExpression:$2];
                            }
;
variable_name: TK_IDENTIFIER /* STCheckVariable ... */
;
unary_selector: TK_IDENTIFIER
;
binary_selector: TK_BINARY_SELECTOR
;
keyword: TK_KEYWORD
;
literal: 
    TK_INTNUMBER               
                        { $$ = [COMPILER createIntNumberLiteralFrom:$1]; }
    | TK_REALNUMBER               
                        { $$ = [COMPILER createRealNumberLiteralFrom:$1]; }
    | TK_SYMBOL
                        { $$ = [COMPILER createSymbolLiteralFrom:$1]; }
    | TK_STRING
                        { $$ = [COMPILER createStringLiteralFrom:$1]; }
    | TK_CHARACTER
                        { $$ = [COMPILER createCharacterLiteralFrom:$1]; }
    | TK_ARRAY_OPEN array TK_RPAREN
                        { $$ = [COMPILER createArrayLiteralFrom:$2]; }
;
array: /* nothing */    { $$ = [NSMutableArray array]; }
    | array literal              { $$ = $1; [$$ addObject:$2]; }
    | array symbol               { $$ = $1; [$$ addObject:$2]; }
    | array TK_LPAREN array TK_RPAREN
                                 {
                                   $$ = $1;
                                   [$$ addObject:[COMPILER createArrayLiteralFrom:$3]];
                                 }
;
symbol: TK_IDENTIFIER                        
                        { $$ = [COMPILER createSymbolLiteralFrom:$1]; }
    | binary_selector
                        { $$ = [COMPILER createSymbolLiteralFrom:$1]; }
    | TK_KEYWORD
                        { $$ = [COMPILER createSymbolLiteralFrom:$1]; }
;
%%

int STCerror(void *context, const char *str)
{
    [NSException raise:STCompilerSyntaxException
                 format:@"Unknown parse error (%s)", str];
    return 0;
}



/* 
 * Lexer
 * --------------------------------------------------------------------------
 */

int STClex (YYSTYPE *lvalp, void *context)
{
    STTokenType tokenType = [READER nextToken];

    if(tokenType == STEndTokenType)
    {
        return 0;
    }

    *lvalp = [READER tokenString];

    switch(tokenType)
    {
    case STBarTokenType:            return TK_BAR;
    case STReturnTokenType:         return TK_RETURN;
    case STColonTokenType:          return TK_COLON;
    case STSemicolonTokenType:      return TK_SEMICOLON;
    case STDotTokenType:            return TK_DOT;
    case STLParenTokenType:         return TK_LPAREN;
    case STRParenTokenType:         return TK_RPAREN;
    case STBlockOpenTokenType:      return TK_BLOCK_OPEN;
    case STBlockCloseTokenType:     return TK_BLOCK_CLOSE;
    case STLCurlyTokenType:         return TK_LCURLY;
    case STRCurlyTokenType:         return TK_RCURLY;
    case STArrayOpenTokenType:      return TK_ARRAY_OPEN;
    case STAssignTokenType:         return TK_ASSIGNMENT;
    case STIdentifierTokenType:     return TK_IDENTIFIER;
    case STKeywordTokenType:        return TK_KEYWORD;
    case STBinarySelectorTokenType: return TK_BINARY_SELECTOR;
    case STSymbolTokenType:         return TK_SYMBOL;
    case STStringTokenType:         return TK_STRING;
    case STCharacterTokenType:      return TK_CHARACTER;
    case STIntNumberTokenType:         return TK_INTNUMBER;
    case STRealNumberTokenType:         return TK_REALNUMBER;
    case STSeparatorTokenType:      return TK_SEPARATOR;

    case STEndTokenType:            return 0;

    case STSharpTokenType:
    case STInvalidTokenType:
    case STErrorTokenType:
                                    return 1;
    }

    return 1;   
}

/*
    STTokenTypes.h
    STSourceReader token types
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StpTalk project.
 
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

typedef enum
{
    STInvalidTokenType,             
    STSeparatorTokenType,           //  !
    STBarTokenType,                 //  |
    STReturnTokenType,              //  ^
    STColonTokenType,               //  :
    STSemicolonTokenType,           //  ;
    STDotTokenType,                 //  .
    STLParenTokenType,              //  (
    STRParenTokenType,              //  )
    STBlockOpenTokenType,           //  [
    STBlockCloseTokenType,          //  ]
    STLCurlyTokenType,              //  {
    STRCurlyTokenType,              //  }
    STArrayOpenTokenType,           //  #(
    STSharpTokenType,               //  #
    STAssignTokenType,              //  :=

    STErrorTokenType,
    STIdentifierTokenType,          //  thisIsIdentifier
    STKeywordTokenType,             //  thisIsKeyword:
    
    STBinarySelectorTokenType,      //  +,-,*,/ 
    STSymbolTokenType,              //  #thisIsSymbol
    STStringTokenType,              //  'This is string'

    STCharacterTokenType,           //  $a (any single alphanum character)
    STIntNumberTokenType,           //  [+-]?[0-9]+
    STRealNumberTokenType,          //  [+-]?[0-9]+.[0-9]+[eE][+-][0-9]+
    
    STEndTokenType
    
} STTokenType;

/**
    STSourceReader.m
    Source reader class.
 
    Copyright (c) 2002 Free Software Foundation
 
    This file is part of the StepTalk project.
 
 */

#import "STSourceReader.h"
#import <Foundation/NSString.h>
#import <Foundation/NSException.h>
#import <Foundation/NSCharacterSet.h>

#import <StepTalk/STExterns.h>

#import "Externs.h"

static NSCharacterSet *identStartCharacterSet;
static NSCharacterSet *identCharacterSet;
static NSCharacterSet *wsCharacterSet;
static NSCharacterSet *numericCharacterSet;
static NSCharacterSet *symbolicSelectorCharacterSet;
static NSCharacterSet *validCharacterCharacterSet;

#define AT_END (srcOffset >= NSMaxRange(srcRange))
// #define AT_END ([self atEnd])

@interface NSString (LineCounting)
- (int)lineNumberForIndex:(int)index;
@end

@implementation NSString (LineCounting)
- (int)lineNumberForIndex:(int)index
{
    int i, len;
    int cr = 0;
    int line = 1;
    len = [self length];
    index = (index < len) ? index : len;

    for(i=0;i<index;i++)
    {
        switch([self characterAtIndex:i])
        {
        case 0x000a: if(cr) 
                      { cr = 0; break; }
        case 0x000d: cr = 1;
        case 0x2028: 
        case 0x2029: cr = 0;
                     line++;
                     break;
        }
    }
    return line;
}

@end

#define PEEK_CHAR [source characterAtIndex:srcOffset]
#define GET_CHAR [source characterAtIndex:srcOffset++]

@interface NSMutableString(CharacterAppending)
- (void)appendCharacter:(unichar)character;
@end
@implementation NSMutableString(CharacterAppending)
- (void)appendCharacter:(unichar)character
{
    [self appendString:[NSString stringWithCharacters:&character 
                                               length:1]];
}
@end

static NSString *_STNormalizeStringToken(NSString *token)
{
    NSMutableString *string = [NSMutableString string];
    unsigned int     i;
    unichar          c;
    unsigned int     len = [token length];

    for(i = 0;i < len; i++)
    {
        c = [token characterAtIndex:i];
        if(c == '\\')
        {
            i++;
            c = [token characterAtIndex:i];
            switch(c)
            {
            case 'a': [string appendCharacter:'\a']; break;
            case 'b': [string appendCharacter:'\b']; break;
            case 'e': [string appendCharacter:'\e']; break;
            case 'n': [string appendCharacter:'\n']; break;
            case 'r': [string appendCharacter:'\r']; break;
            case 't': [string appendCharacter:'\t']; break;
            case 'v': [string appendCharacter:'\v']; break;
            default:[string appendCharacter:c]; break;
            }
        }
        else
        {
            [string appendCharacter:c];
        }
    }

    return string;
}

@implementation STSourceReader
+ (void)initialize
{
    NSMutableCharacterSet *set; 

    set = [[NSCharacterSet letterCharacterSet] mutableCopy]; 
    [set addCharactersInString:@"_"]; 
    identStartCharacterSet = [set copy];

    [set formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    identCharacterSet = [set copy];

    RELEASE(set);
    
    wsCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    numericCharacterSet = [NSCharacterSet decimalDigitCharacterSet];
    symbolicSelectorCharacterSet = 
                    [NSCharacterSet characterSetWithCharactersInString:
                                                        @"%&*+-,/<=>?@\\~"];

    RETAIN(wsCharacterSet);
    RETAIN(numericCharacterSet);
    RETAIN(symbolicSelectorCharacterSet);

    set = [[NSCharacterSet controlCharacterSet] mutableCopy];
    [set formUnionWithCharacterSet:[NSCharacterSet illegalCharacterSet]];
    [set formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    validCharacterCharacterSet = RETAIN([set invertedSet]);
    
    RELEASE(set);
}
- (void)dealloc
{
    RELEASE(source);
    [super dealloc];
}
- initWithString:(NSString *)aString
{
    return [self initWithString:aString range:NSMakeRange(0,[aString length])];
}

- initWithString:(NSString *)aString range:(NSRange)range
{
    [super init];

    ASSIGN(source,aString);
    srcRange = range;
    srcOffset = range.location;
    tokenRange = NSMakeRange(0,0);
    tokenType = STInvalidTokenType;
    
    return self;
}

- (STTokenType) tokenType
{
    return tokenType;
}

- (NSString *)tokenString
{

    if(tokenType == STStringTokenType)
    {
        return _STNormalizeStringToken([source substringWithRange:tokenRange]);
    }
    else
    {       
        return [source substringWithRange:tokenRange];
    }
}

- (NSRange)tokenRange;
{
    return tokenRange;
}

- (BOOL) atEnd
{
    return (srcOffset >= NSMaxRange(srcRange));
}

- (int) currentLine
{
    return [source lineNumberForIndex:srcOffset];
}

- (BOOL) eatWhiteSpace
{
    unichar uc;
    
    for(;;)
    {
        if(AT_END)
        {
            return 0;
        }
            
        uc = PEEK_CHAR;

        /* treat comments as whitespace */
        if(uc == '"')
        {
            unsigned int start = srcOffset;
            do
            {
                srcOffset++;
                if(AT_END)
                {
                    tokenRange = NSMakeRange(start, 1);
                
                    [NSException raise:STCompilerSyntaxException
                                format:@"Unterminated comment"];
                    return 1;
                }
            } while(PEEK_CHAR != '"');
        }
        else if([wsCharacterSet characterIsMember:uc] == NO)
        {
            return 0;
        }
        srcOffset++;
    }
}

- (STTokenType)readNextToken
{
    unichar c;
    int start;
    
    if([self eatWhiteSpace])
    {
        return STErrorTokenType;
    }

    if(AT_END)
    {
        return STEndTokenType;
    }
    
    c = PEEK_CHAR;
    
    if([identStartCharacterSet characterIsMember:c])
    {
        start=srcOffset++;
        while([identCharacterSet characterIsMember:c] && !AT_END)
        {
            c = GET_CHAR;
            if(AT_END)
            {
                break;
            }
        }
        if(!AT_END)
        {
            srcOffset--;
            c = PEEK_CHAR;
            if(c == ':')
            {
                GET_CHAR;
                c = PEEK_CHAR;
                if(c == '=')
                {
                    srcOffset--; /* we got := */
                }
                else
                {
                    tokenRange = NSMakeRange(start,srcOffset - start);
                    return STKeywordTokenType;
                }
            }
        }
        else
        {
            srcOffset --;
        }
        tokenRange = NSMakeRange(start,srcOffset - start);
        return STIdentifierTokenType;
    }
    else if ( c == '-' || c == '+' || [numericCharacterSet characterIsMember:c])
    {
        BOOL maybesym = (c == '-' || c == '+');
        BOOL scannedSomething = NO;
        BOOL isReal = NO;
                
        start = srcOffset++;
        if(!AT_END)
        {
            c = GET_CHAR;
            if(![numericCharacterSet characterIsMember:c] && maybesym)
            {
                if([symbolicSelectorCharacterSet characterIsMember:c])
                {
                    tokenRange = NSMakeRange(start,2);
                }
                else
                {
                    srcOffset--;
                    tokenRange = NSMakeRange(start, 1);
                }

                return STBinarySelectorTokenType;
            }
        }        

        while([numericCharacterSet characterIsMember:c] && !AT_END)
        {
            c = GET_CHAR;
        }

        if(AT_END)
        {
            tokenRange = NSMakeRange(start,srcOffset - start);
            return STIntNumberTokenType;
        }
        
        if(c == '.'  && !AT_END)
        {
            c = GET_CHAR;
            while([numericCharacterSet characterIsMember:c])
            {
                c = GET_CHAR;
                scannedSomething = YES;
                if(AT_END)
                    break;
            }
            if(!scannedSomething)
            {
#if 0
                tokenRange = NSMakeRange(start,srcOffset - start + 1);
                [NSException raise:STCompilerSyntaxException
                            format:@"Expected digit after the decimal point"];
                return STErrorTokenType;
#endif
                srcOffset-=2; /* eat next character and the dot */
                tokenRange = NSMakeRange(start,srcOffset - start);
                return STIntNumberTokenType;
            }
            scannedSomething = NO;
            isReal = YES;
        }
            
        if((c == 'e' || c == 'E')  && !AT_END)
        {
            c = GET_CHAR;
            if((c == '+' || c == '-')  && !AT_END)
            {
                c = GET_CHAR;
            }
            while([numericCharacterSet characterIsMember:c])
            {
                c = GET_CHAR;
                scannedSomething = YES;
                if(AT_END)
                    break;
            }
            if(!scannedSomething)
            {
                tokenRange = NSMakeRange(start,srcOffset - start + 1);
                [NSException raise:STCompilerSyntaxException
                            format:@"Expected digits in the exponent"];
                return STErrorTokenType;
            }
            scannedSomething = NO;
            isReal = YES;
        }
        
        srcOffset --;
        tokenRange = NSMakeRange(start,srcOffset - start);

        if([identStartCharacterSet characterIsMember:c] && c != 'e' && c != 'E')
        {
            tokenRange = NSMakeRange(start,srcOffset - start + 1);
            [NSException raise:STCompilerSyntaxException
                        format:@"Letter '%c' in number", c];
            return STErrorTokenType;
        }
        
        if(isReal)
        {
            return STRealNumberTokenType;
        }
        else
        {
            return STIntNumberTokenType;
        }
        
    }
    else if ([symbolicSelectorCharacterSet characterIsMember:c])
    {
        start = srcOffset++;
        c = PEEK_CHAR;
        if ([symbolicSelectorCharacterSet characterIsMember:c])
        {
            srcOffset++;
            tokenRange = NSMakeRange(start,2);
        }
        else
            tokenRange = NSMakeRange(start,1);
        return STBinarySelectorTokenType;
    }
    else 
    {
        switch(c)
        {
        case '$':
                srcOffset++;
                c = GET_CHAR;
                if(AT_END)
                {
                    tokenRange = NSMakeRange(srcOffset-2, 1);
                    [NSException raise:STCompilerSyntaxException
                                format:@"Character expected"];
                    return STErrorTokenType;
                };
                
                if([validCharacterCharacterSet characterIsMember:c])
                {
                    c = PEEK_CHAR;
                    if([identCharacterSet characterIsMember:c])
                    {
                        tokenRange = NSMakeRange(srcOffset-2, 3);
                        [NSException raise:STCompilerSyntaxException
                                    format:@"Too many characters"];
                        return STErrorTokenType;
                    }
                    
                    tokenRange = NSMakeRange(srcOffset++,1);\
                    return STCharacterTokenType;
                }

                tokenRange = NSMakeRange(srcOffset-2,2);\
                [NSException raise:STCompilerSyntaxException
                            format:@"Invalid character literal"];
                return STErrorTokenType;

        case '#':
                start=srcOffset++;
                c = PEEK_CHAR;
                if(c=='(')
                {
                    srcOffset++;
                    tokenRange = NSMakeRange(start,2);
                    return STArrayOpenTokenType;
                }
                
                if([identStartCharacterSet characterIsMember:c])
                {
                    start=srcOffset++;
                    while([identCharacterSet characterIsMember:c] || c == ':')
                    {
                        c = GET_CHAR;
                        if(AT_END)
                            break;
                    }
                    srcOffset--;
                    tokenRange = NSMakeRange(start,srcOffset - start);
                    return STSymbolTokenType;
                }
                tokenRange = NSMakeRange(start,srcOffset - start);
                return STSharpTokenType;
        case ':':
                start=srcOffset++;
                c = PEEK_CHAR;
                if(c == '=')
                {
                    srcOffset++;
                    tokenRange = NSMakeRange(start,srcOffset - start);
                    return STAssignTokenType;
                }
                tokenRange = NSMakeRange(start,srcOffset - start);
                return STColonTokenType;

#define SIMPLE_TOKEN_RETURN(type) \
            tokenRange = NSMakeRange(srcOffset++,1);\
            return type
            
        case '(':SIMPLE_TOKEN_RETURN(STLParenTokenType);
        case ')':SIMPLE_TOKEN_RETURN(STRParenTokenType);
        case '|':SIMPLE_TOKEN_RETURN(STBarTokenType);
        case ';':SIMPLE_TOKEN_RETURN(STSemicolonTokenType);
        case '[':SIMPLE_TOKEN_RETURN(STBlockOpenTokenType);
        case ']':SIMPLE_TOKEN_RETURN(STBlockCloseTokenType);
        case '^':SIMPLE_TOKEN_RETURN(STReturnTokenType);
        case '!':SIMPLE_TOKEN_RETURN(STSeparatorTokenType);
        case '.':SIMPLE_TOKEN_RETURN(STDotTokenType);
        case '\'':
                start= 1 + srcOffset++;
                for(;;)
                {
     
                    if(AT_END)
                    {
                        tokenRange = NSMakeRange(start-1,1);\

                        [NSException raise:STCompilerSyntaxException
                                    format:@"Unterminated string"];
                        return STErrorTokenType;
                    };
                    
                    c = GET_CHAR;
                    if( c=='\\')
                    {
                        if(AT_END)
                        {
                            [NSException raise:STCompilerSyntaxException
                                        format:@"\\ at end"];
                            return STErrorTokenType;
                        }
                        
                        GET_CHAR;
                    }
                    else if( c=='\'' )
                    {
                        if(AT_END)
                        {
                            return STStringTokenType;
                        }

                        c = GET_CHAR;
                        if(c != '\'')
                        {
                            srcOffset--;
                            tokenRange = NSMakeRange(start,
                                                     srcOffset - start - 1);
                            return STStringTokenType;
                        }
                        
                    }
                }
        default: return STErrorTokenType;
        }
    }
}

- (STTokenType)nextToken
{
    tokenType = [self readNextToken];
    return tokenType;
}

- (void)unreadLastToken
{
    srcOffset = tokenRange.location;
}
@end

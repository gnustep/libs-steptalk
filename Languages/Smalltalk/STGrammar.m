/* A Bison parser, made from STGrammar.y, by GNU bison 1.75.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* Written by Richard Stallman by simplifying the original so called
   ``semantic'' parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON	1

/* Pure parsers.  */
#define YYPURE	1

/* Using locations.  */
#define YYLSP_NEEDED 0

/* If NAME_PREFIX is specified substitute the variables and functions
   names.  */
#define yyparse STCparse
#define yylex   STClex
#define yyerror STCerror
#define yylval  STClval
#define yychar  STCchar
#define yydebug STCdebug
#define yynerrs STCnerrs


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TK_SEPARATOR = 258,
     TK_BAR = 259,
     TK_ASSIGNMENT = 260,
     TK_LPAREN = 261,
     TK_RPAREN = 262,
     TK_BLOCK_OPEN = 263,
     TK_BLOCK_CLOSE = 264,
     TK_ARRAY_OPEN = 265,
     TK_DOT = 266,
     TK_COLON = 267,
     TK_SEMICOLON = 268,
     TK_RETURN = 269,
     TK_IDENTIFIER = 270,
     TK_BINARY_SELECTOR = 271,
     TK_KEYWORD = 272,
     TK_INTNUMBER = 273,
     TK_REALNUMBER = 274,
     TK_SYMBOL = 275,
     TK_STRING = 276,
     TK_CHARACTER = 277
   };
#endif
#define TK_SEPARATOR 258
#define TK_BAR 259
#define TK_ASSIGNMENT 260
#define TK_LPAREN 261
#define TK_RPAREN 262
#define TK_BLOCK_OPEN 263
#define TK_BLOCK_CLOSE 264
#define TK_ARRAY_OPEN 265
#define TK_DOT 266
#define TK_COLON 267
#define TK_SEMICOLON 268
#define TK_RETURN 269
#define TK_IDENTIFIER 270
#define TK_BINARY_SELECTOR 271
#define TK_KEYWORD 272
#define TK_INTNUMBER 273
#define TK_REALNUMBER 274
#define TK_SYMBOL 275
#define TK_STRING 276
#define TK_CHARACTER 277




/* Copy the first part of user declarations.  */
#line 25 "STGrammar.y"


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
    #define YYPARSE_PARAM    context
    #define YYLEX_PARAM      context
    #define YYERROR_VERBOSE

    #define CONTEXT ((STParserContext *)context)
    #define COMPILER (CONTEXT->compiler)
    #define READER   (CONTEXT->reader)
    #define RESULT   (CONTEXT->result)

    int STClex (YYSTYPE *lvalp, void *context);
    int STCerror(const char *str);


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

#ifndef YYSTYPE
typedef int yystype;
# define YYSTYPE yystype
# define YYSTYPE_IS_TRIVIAL 1
#endif

#ifndef YYLTYPE
typedef struct yyltype
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} yyltype;
# define YYLTYPE yyltype
# define YYLTYPE_IS_TRIVIAL 1
#endif

/* Copy the second part of user declarations.  */


/* Line 213 of /usr/share/bison/yacc.c.  */
#line 177 "STGrammar.m"

#if ! defined (yyoverflow) || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# if YYSTACK_USE_ALLOCA
#  define YYSTACK_ALLOC alloca
# else
#  ifndef YYSTACK_USE_ALLOCA
#   if defined (alloca) || defined (_ALLOCA_H)
#    define YYSTACK_ALLOC alloca
#   else
#    ifdef __GNUC__
#     define YYSTACK_ALLOC __builtin_alloca
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
# else
#  if defined (__STDC__) || defined (__cplusplus)
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   define YYSIZE_T size_t
#  endif
#  define YYSTACK_ALLOC malloc
#  define YYSTACK_FREE free
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAX)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  register YYSIZE_T yyi;		\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];	\
	}					\
      while (0)
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAX;	\
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (0)

#endif

#if defined (__STDC__) || defined (__cplusplus)
   typedef signed char yysigned_char;
#else
   typedef short yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  48
#define YYLAST   242

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  23
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  36
/* YYNRULES -- Number of rules. */
#define YYNRULES  81
/* YYNRULES -- Number of states. */
#define YYNSTATES  116

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   277

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned char yyprhs[] =
{
       0,     0,     3,     4,     6,    11,    13,    16,    17,    21,
      23,    25,    29,    32,    36,    38,    41,    43,    46,    50,
      54,    56,    59,    62,    66,    72,    75,    79,    82,    84,
      87,    92,    94,    98,   100,   103,   105,   108,   110,   113,
     115,   118,   121,   124,   127,   131,   133,   136,   138,   140,
     142,   144,   147,   151,   154,   157,   161,   163,   165,   167,
     169,   171,   173,   175,   179,   181,   183,   185,   187,   189,
     191,   193,   195,   197,   201,   202,   204,   206,   209,   212,
     214,   216
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const yysigned_char yyrhs[] =
{
      24,     0,    -1,    -1,    25,    -1,     8,     4,    26,     9,
      -1,    36,    -1,    32,    36,    -1,    -1,    35,    27,    28,
      -1,    28,    -1,    29,    -1,    28,     3,    29,    -1,    30,
      36,    -1,    30,    32,    36,    -1,    53,    -1,    54,    52,
      -1,    31,    -1,    55,    52,    -1,    31,    55,    52,    -1,
       4,    33,     4,    -1,    52,    -1,    33,    52,    -1,     8,
       9,    -1,     8,    36,     9,    -1,     8,    35,     4,    36,
       9,    -1,    12,    52,    -1,    35,    12,    52,    -1,    14,
      38,    -1,    37,    -1,    37,    11,    -1,    37,    11,    14,
      38,    -1,    38,    -1,    37,    11,    38,    -1,    51,    -1,
      39,    51,    -1,    44,    -1,    39,    44,    -1,    41,    -1,
      39,    41,    -1,    40,    -1,    39,    40,    -1,    52,     5,
      -1,    44,    42,    -1,    13,    43,    -1,    42,    13,    43,
      -1,    53,    -1,    54,    49,    -1,    48,    -1,    45,    -1,
      46,    -1,    47,    -1,    49,    53,    -1,    50,    54,    49,
      -1,    50,    48,    -1,    55,    50,    -1,    48,    55,    50,
      -1,    51,    -1,    45,    -1,    49,    -1,    46,    -1,    52,
      -1,    56,    -1,    34,    -1,     6,    38,     7,    -1,    15,
      -1,    15,    -1,    16,    -1,    17,    -1,    18,    -1,    19,
      -1,    20,    -1,    21,    -1,    22,    -1,    10,    57,     7,
      -1,    -1,    56,    -1,    58,    -1,    57,    56,    -1,    57,
      58,    -1,    15,    -1,    54,    -1,    17,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,    69,    69,    74,    78,    84,    89,    99,    97,   104,
     107,   111,   117,   122,   130,   136,   141,   144,   149,   156,
     160,   165,   172,   176,   180,   186,   191,   197,   203,   209,
     214,   222,   228,   234,   239,   245,   246,   251,   252,   258,
     263,   270,   273,   279,   284,   290,   295,   300,   303,   304,
     305,   307,   316,   325,   332,   337,   343,   344,   346,   347,
     349,   353,   357,   361,   366,   368,   370,   372,   374,   377,
     379,   381,   383,   385,   388,   389,   391,   393,   394,   396,
     398,   400
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "TK_SEPARATOR", "TK_BAR", "TK_ASSIGNMENT", 
  "TK_LPAREN", "TK_RPAREN", "TK_BLOCK_OPEN", "TK_BLOCK_CLOSE", 
  "TK_ARRAY_OPEN", "TK_DOT", "TK_COLON", "TK_SEMICOLON", "TK_RETURN", 
  "TK_IDENTIFIER", "TK_BINARY_SELECTOR", "TK_KEYWORD", "TK_INTNUMBER", 
  "TK_REALNUMBER", "TK_SYMBOL", "TK_STRING", "TK_CHARACTER", "$accept", 
  "source", "single_method", "methods", "@1", "method_list", "method", 
  "message_pattern", "keyword_list", "temporaries", "variable_list", 
  "block", "block_var_list", "statements", "expressions", "expression", 
  "assignments", "assignment", "cascade", "cascade_list", "cascade_item", 
  "message_expression", "unary_expression", "binary_expression", 
  "keyword_expression", "keyword_expr_list", "unary_object", 
  "binary_object", "primary", "variable_name", "unary_selector", 
  "binary_selector", "keyword", "literal", "array", "symbol", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    23,    24,    24,    24,    25,    25,    27,    26,    26,
      28,    28,    29,    29,    30,    30,    30,    31,    31,    32,
      33,    33,    34,    34,    34,    35,    35,    36,    36,    36,
      36,    37,    37,    38,    38,    38,    38,    38,    38,    39,
      39,    40,    41,    42,    42,    43,    43,    43,    44,    44,
      44,    45,    46,    47,    48,    48,    49,    49,    50,    50,
      51,    51,    51,    51,    52,    53,    54,    55,    56,    56,
      56,    56,    56,    56,    57,    57,    57,    57,    57,    58,
      58,    58
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     1,     4,     1,     2,     0,     3,     1,
       1,     3,     2,     3,     1,     2,     1,     2,     3,     3,
       1,     2,     2,     3,     5,     2,     3,     2,     1,     2,
       4,     1,     3,     1,     2,     1,     2,     1,     2,     1,
       2,     2,     2,     2,     3,     1,     2,     1,     1,     1,
       1,     2,     3,     2,     2,     3,     1,     1,     1,     1,
       1,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     0,     1,     1,     2,     2,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     0,    74,     0,    64,    68,    69,    70,
      71,    72,     0,     3,     0,    62,     5,    28,    31,     0,
      39,    37,    35,    48,    49,    50,    58,     0,    33,    60,
      61,     0,    20,     0,     0,     0,    22,     0,     0,     0,
      79,    66,    81,    80,    75,     0,    76,    27,     1,     6,
      29,    40,    38,    36,    34,     0,    42,    65,    51,    67,
      53,     0,     0,    41,    19,    21,    63,     0,     9,    10,
       0,    16,     7,    14,     0,     0,    25,     0,     0,    23,
      73,    77,    78,     0,    32,    43,    47,    45,     0,     0,
       0,    57,    52,    56,    60,    59,    54,     4,     0,     0,
      12,     0,     0,    15,    17,     0,    26,    30,    46,    44,
      55,    11,    13,    18,     8,    24
};

/* YYDEFGOTO[NTERM-NUM]. */
static const yysigned_char yydefgoto[] =
{
      -1,    12,    13,    67,   102,    68,    69,    70,    71,    14,
      31,    15,    38,    39,    17,    18,    19,    20,    21,    56,
      85,    22,    23,    24,    25,    86,    26,    27,    28,    29,
      58,    61,    62,    30,    45,    46
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -58
static const short yypact[] =
{
     117,    -4,   204,    98,     3,   204,   -58,   -58,   -58,   -58,
     -58,   -58,    17,   -58,   170,   -58,   -58,    23,   -58,   204,
     -58,   -58,    15,    28,    49,   -58,    31,    66,    47,    43,
     -58,    11,   -58,   153,    68,    42,   -58,    -4,    27,    71,
     -58,   -58,   -58,   -58,   -58,   220,   -58,   -58,   -58,   -58,
     187,   -58,   -58,    15,    47,    53,    72,   -58,   -58,   -58,
      39,   204,   204,   -58,   -58,   -58,   -58,    79,    88,   -58,
     136,    39,    80,   -58,    -4,    -4,   -58,   170,    -4,   -58,
     -58,   -58,   -58,   204,   -58,   -58,    39,   -58,   204,    53,
     204,   -58,    31,   -58,   -58,   -58,    77,   -58,    53,   170,
     -58,    -4,    53,   -58,   -58,    87,   -58,   -58,    31,   -58,
      77,   -58,   -58,   -58,    88,   -58
};

/* YYPGOTO[NTERM-NUM].  */
static const yysigned_char yypgoto[] =
{
     -58,   -58,   -58,   -58,   -58,    -5,     0,   -58,   -58,    33,
     -58,   -58,    70,     2,   -58,     1,   -58,    90,    92,   -58,
      25,    96,   -53,   -57,   -58,    95,   -47,   -52,   -12,    -1,
      -8,    -3,   -31,     8,   -58,    81
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -60
static const yysigned_char yytable[] =
{
      32,    43,    16,    34,    75,    95,    47,    54,    91,    91,
      96,     6,    44,     4,    92,    64,    49,    48,    40,    41,
      42,     7,     8,     9,    10,    11,     6,    73,    55,    90,
      65,    77,    74,    95,    50,    91,    76,    91,   110,    78,
     101,   108,    43,   -57,   -57,   -57,    57,    87,    63,    93,
      93,    84,    88,    81,    37,    90,    59,    57,    41,    59,
      94,    94,   -56,   -56,   -56,   -59,   -59,    75,    57,    41,
      59,    75,   100,   103,   104,    66,    93,   106,    93,   105,
      79,    87,    41,    59,   107,    89,    88,    94,    97,    94,
      73,    98,    78,    41,    73,    74,   115,   114,   111,    74,
     113,   112,    35,    99,     2,    72,    33,    36,     4,    51,
      37,    52,     5,     6,   109,    53,     7,     8,     9,    10,
      11,     1,    60,     2,     0,     3,    82,     4,     0,     0,
       0,     5,     6,     0,     0,     7,     8,     9,    10,    11,
       1,     0,     2,     0,    33,     0,     4,     0,     0,     0,
       5,     6,     0,     0,     7,     8,     9,    10,    11,     2,
       0,    33,    36,     4,     0,    37,     0,     5,     6,     0,
       0,     7,     8,     9,    10,    11,     2,     0,    33,     0,
       4,     0,     0,     0,     5,     6,     0,     0,     7,     8,
       9,    10,    11,     2,     0,    33,     0,     4,     0,     0,
       0,    83,     6,     0,     0,     7,     8,     9,    10,    11,
       2,     0,    33,     0,     4,     0,     0,     0,     0,     6,
       0,     0,     7,     8,     9,    10,    11,    80,     0,     0,
       4,     0,     0,     0,     0,    40,    41,    42,     7,     8,
       9,    10,    11
};

static const yysigned_char yycheck[] =
{
       1,     4,     0,     2,    35,    62,     5,    19,    61,    62,
      62,    15,     4,    10,    61,     4,    14,     0,    15,    16,
      17,    18,    19,    20,    21,    22,    15,    35,    13,    60,
      31,     4,    35,    90,    11,    88,    37,    90,    90,    12,
      71,    88,    45,    15,    16,    17,    15,    55,     5,    61,
      62,    50,    55,    45,    12,    86,    17,    15,    16,    17,
      61,    62,    15,    16,    17,    16,    17,    98,    15,    16,
      17,   102,    70,    74,    75,     7,    88,    78,    90,    77,
       9,    89,    16,    17,    83,    13,    89,    88,     9,    90,
      98,     3,    12,    16,   102,    98,     9,   102,    98,   102,
     101,    99,     4,    70,     6,    35,     8,     9,    10,    19,
      12,    19,    14,    15,    89,    19,    18,    19,    20,    21,
      22,     4,    27,     6,    -1,     8,    45,    10,    -1,    -1,
      -1,    14,    15,    -1,    -1,    18,    19,    20,    21,    22,
       4,    -1,     6,    -1,     8,    -1,    10,    -1,    -1,    -1,
      14,    15,    -1,    -1,    18,    19,    20,    21,    22,     6,
      -1,     8,     9,    10,    -1,    12,    -1,    14,    15,    -1,
      -1,    18,    19,    20,    21,    22,     6,    -1,     8,    -1,
      10,    -1,    -1,    -1,    14,    15,    -1,    -1,    18,    19,
      20,    21,    22,     6,    -1,     8,    -1,    10,    -1,    -1,
      -1,    14,    15,    -1,    -1,    18,    19,    20,    21,    22,
       6,    -1,     8,    -1,    10,    -1,    -1,    -1,    -1,    15,
      -1,    -1,    18,    19,    20,    21,    22,     7,    -1,    -1,
      10,    -1,    -1,    -1,    -1,    15,    16,    17,    18,    19,
      20,    21,    22
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,    10,    14,    15,    18,    19,    20,
      21,    22,    24,    25,    32,    34,    36,    37,    38,    39,
      40,    41,    44,    45,    46,    47,    49,    50,    51,    52,
      56,    33,    52,     8,    38,     4,     9,    12,    35,    36,
      15,    16,    17,    54,    56,    57,    58,    38,     0,    36,
      11,    40,    41,    44,    51,    13,    42,    15,    53,    17,
      48,    54,    55,     5,     4,    52,     7,    26,    28,    29,
      30,    31,    35,    53,    54,    55,    52,     4,    12,     9,
       7,    56,    58,    14,    38,    43,    48,    53,    54,    13,
      55,    45,    49,    51,    52,    46,    50,     9,     3,    32,
      36,    55,    27,    52,    52,    36,    52,    38,    49,    43,
      50,    29,    36,    52,    28,     9
};

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# if defined (__STDC__) || defined (__cplusplus)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# endif
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrlab1

/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror ("syntax error: cannot back up");			\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)           \
  Current.first_line   = Rhs[1].first_line;      \
  Current.first_column = Rhs[1].first_column;    \
  Current.last_line    = Rhs[N].last_line;       \
  Current.last_column  = Rhs[N].last_column;
#endif

/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX	yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX	yylex (&yylval)
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (0)
# define YYDSYMPRINT(Args)			\
do {						\
  if (yydebug)					\
    yysymprint Args;				\
} while (0)
/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YYDSYMPRINT(Args)
#endif /* !YYDEBUG */

/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#if YYMAXDEPTH == 0
# undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined (__GLIBC__) && defined (_STRING_H)
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
#   if defined (__STDC__) || defined (__cplusplus)
yystrlen (const char *yystr)
#   else
yystrlen (yystr)
     const char *yystr;
#   endif
{
  register const char *yys = yystr;

  while (*yys++ != '\0')
    continue;

  return yys - yystr - 1;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
#   if defined (__STDC__) || defined (__cplusplus)
yystpcpy (char *yydest, const char *yysrc)
#   else
yystpcpy (yydest, yysrc)
     char *yydest;
     const char *yysrc;
#   endif
{
  register char *yyd = yydest;
  register const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

#endif /* !YYERROR_VERBOSE */



#if YYDEBUG
/*-----------------------------.
| Print this symbol on YYOUT.  |
`-----------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yysymprint (FILE* yyout, int yytype, YYSTYPE yyvalue)
#else
yysymprint (yyout, yytype, yyvalue)
    FILE* yyout;
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  if (yytype < YYNTOKENS)
    {
      YYFPRINTF (yyout, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyout, yytoknum[yytype], yyvalue);
# endif
    }
  else
    YYFPRINTF (yyout, "nterm %s (", yytname[yytype]);

  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyout, ")");
}
#endif /* YYDEBUG. */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yydestruct (int yytype, YYSTYPE yyvalue)
#else
yydestruct (yytype, yyvalue)
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  switch (yytype)
    {
      default:
        break;
    }
}



/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
#  define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL
# else
#  define YYPARSE_PARAM_ARG YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
# endif
#else /* !YYPARSE_PARAM */
# define YYPARSE_PARAM_ARG
# define YYPARSE_PARAM_DECL
#endif /* !YYPARSE_PARAM */

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
# ifdef YYPARSE_PARAM
int yyparse (void *);
# else
int yyparse (void);
# endif
#endif




int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  /* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of parse errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yychar1 = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;



#define YYPOPSTACK   (yyvsp--, yyssp--)

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* When reducing, the number of symbols on the RHS of the reduced
     rule.  */
  int yylen;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed. so pushing a state here evens the stacks.
     */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack. Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	short *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyoverflowlab;
# else
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;

      {
	short *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyoverflowlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with.  */

  if (yychar <= 0)		/* This means end of input.  */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more.  */

      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yychar1 = YYTRANSLATE (yychar);

      /* We have to keep this `#if YYDEBUG', since we use variables
	 which are defined only if `YYDEBUG' is set.  */
      YYDPRINTF ((stderr, "Next token is "));
      YYDSYMPRINT ((stderr, yychar1, yylval));
      YYDPRINTF ((stderr, "\n"));
    }

  /* If the proper action on seeing token YYCHAR1 is to reduce or to
     detect an error, take that action.  */
  yyn += yychar1;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yychar1)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
	      yychar, yytname[yychar1]));

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;


  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  yystate = yyn;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];



#if YYDEBUG
  /* We have to keep this `#if YYDEBUG', since we use variables which
     are defined only if `YYDEBUG' is set.  */
  if (yydebug)
    {
      int yyi;

      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
		 yyn - 1, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (yyi = yyprhs[yyn]; yyrhs[yyi] >= 0; yyi++)
	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif
  switch (yyn)
    {
        case 2:
#line 69 "STGrammar.y"
    { 
                                [COMPILER compileMethod:nil]; 
                            }
    break;

  case 3:
#line 74 "STGrammar.y"
    {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
    break;

  case 5:
#line 85 "STGrammar.y"
    {
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
    break;

  case 6:
#line 90 "STGrammar.y"
    {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
    break;

  case 7:
#line 99 "STGrammar.y"
    {
                                [COMPILER setReceiverVariables:yyvsp[0]];
                            }
    break;

  case 10:
#line 108 "STGrammar.y"
    {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
    break;

  case 11:
#line 112 "STGrammar.y"
    {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
    break;

  case 12:
#line 118 "STGrammar.y"
    {
                                yyval =  [STCMethod methodWithPattern:yyvsp[-1]
                                /**/                    statements:yyvsp[0]];
                            }
    break;

  case 13:
#line 123 "STGrammar.y"
    {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:yyvsp[-2]
                                /**/                    statements:yyvsp[0]];
                            }
    break;

  case 14:
#line 132 "STGrammar.y"
    {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            }
    break;

  case 15:
#line 137 "STGrammar.y"
    {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
    break;

  case 17:
#line 145 "STGrammar.y"
    {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
    break;

  case 18:
#line 150 "STGrammar.y"
    {
                                [yyvsp[-2] addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = yyvsp[-2];
                            }
    break;

  case 19:
#line 157 "STGrammar.y"
    { yyval = yyvsp[-1]; }
    break;

  case 20:
#line 161 "STGrammar.y"
    { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
    break;

  case 21:
#line 166 "STGrammar.y"
    { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
    break;

  case 22:
#line 173 "STGrammar.y"
    {
                                yyval = [STCStatements statements];
                            }
    break;

  case 23:
#line 177 "STGrammar.y"
    {
                                yyval = yyvsp[-1];
                            }
    break;

  case 24:
#line 181 "STGrammar.y"
    {
                                yyval = yyvsp[-1];
                                [yyval setTemporaries:yyvsp[-3]];
                            }
    break;

  case 25:
#line 187 "STGrammar.y"
    { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
    break;

  case 26:
#line 192 "STGrammar.y"
    { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
    break;

  case 27:
#line 199 "STGrammar.y"
    { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                            }
    break;

  case 28:
#line 204 "STGrammar.y"
    { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[0]];
                            }
    break;

  case 29:
#line 210 "STGrammar.y"
    { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[-1]];
                            }
    break;

  case 30:
#line 215 "STGrammar.y"
    { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                                [yyval setExpressions:yyvsp[-3]];
                            }
    break;

  case 31:
#line 223 "STGrammar.y"
    { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
    break;

  case 32:
#line 229 "STGrammar.y"
    {   
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
    break;

  case 33:
#line 235 "STGrammar.y"
    { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                            }
    break;

  case 34:
#line 240 "STGrammar.y"
    { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                                [yyval setAssignments:yyvsp[-1]];
                            }
    break;

  case 36:
#line 247 "STGrammar.y"
    { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
    break;

  case 38:
#line 253 "STGrammar.y"
    { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
    break;

  case 39:
#line 259 "STGrammar.y"
    { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
    break;

  case 40:
#line 264 "STGrammar.y"
    { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
    break;

  case 41:
#line 271 "STGrammar.y"
    { yyval = yyvsp[-1];}
    break;

  case 42:
#line 274 "STGrammar.y"
    { 
                                /* FIXME: check if this is this OK */
                                [yyval setCascade:yyvsp[0]]; 
                            }
    break;

  case 43:
#line 280 "STGrammar.y"
    {
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
    break;

  case 44:
#line 285 "STGrammar.y"
    { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]];
                            }
    break;

  case 45:
#line 291 "STGrammar.y"
    { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            }
    break;

  case 46:
#line 296 "STGrammar.y"
    { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
    break;

  case 51:
#line 308 "STGrammar.y"
    { 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[0] object:nil];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:message];
                            }
    break;

  case 52:
#line 317 "STGrammar.y"
    { 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-2]
                                /**/        message:message];
                            }
    break;

  case 53:
#line 326 "STGrammar.y"
    {
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:yyvsp[0]];
                            }
    break;

  case 54:
#line 333 "STGrammar.y"
    { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
    break;

  case 55:
#line 338 "STGrammar.y"
    { 
                                yyval = yyvsp[-2];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
    break;

  case 60:
#line 350 "STGrammar.y"
    {
                                yyval = [STCPrimary primaryWithVariable:yyvsp[0]];
                            }
    break;

  case 61:
#line 354 "STGrammar.y"
    {
                                yyval = [STCPrimary primaryWithLiteral:yyvsp[0]];
                            }
    break;

  case 62:
#line 358 "STGrammar.y"
    {
                                yyval = [STCPrimary primaryWithBlock:yyvsp[0]];
                            }
    break;

  case 63:
#line 362 "STGrammar.y"
    {
                                yyval = [STCPrimary primaryWithExpression:yyvsp[-1]];
                            }
    break;

  case 68:
#line 376 "STGrammar.y"
    { yyval = [COMPILER createIntNumberLiteralFrom:yyvsp[0]]; }
    break;

  case 69:
#line 378 "STGrammar.y"
    { yyval = [COMPILER createRealNumberLiteralFrom:yyvsp[0]]; }
    break;

  case 70:
#line 380 "STGrammar.y"
    { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
    break;

  case 71:
#line 382 "STGrammar.y"
    { yyval = [COMPILER createStringLiteralFrom:yyvsp[0]]; }
    break;

  case 72:
#line 384 "STGrammar.y"
    { yyval = [COMPILER createCharacterLiteralFrom:yyvsp[0]]; }
    break;

  case 73:
#line 386 "STGrammar.y"
    { yyval = [COMPILER createArrayLiteralFrom:yyvsp[-1]]; }
    break;

  case 74:
#line 388 "STGrammar.y"
    { yyval = [NSMutableArray array]; }
    break;

  case 75:
#line 389 "STGrammar.y"
    { yyval = [NSMutableArray array]; 
                                   [yyval addObject:yyvsp[0]]; }
    break;

  case 76:
#line 391 "STGrammar.y"
    { yyval = [NSMutableArray array];
                                   [yyval addObject:yyvsp[0]]; }
    break;

  case 77:
#line 393 "STGrammar.y"
    { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
    break;

  case 78:
#line 394 "STGrammar.y"
    { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
    break;

  case 79:
#line 397 "STGrammar.y"
    { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
    break;

  case 80:
#line 399 "STGrammar.y"
    { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
    break;

  case 81:
#line 401 "STGrammar.y"
    { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 1586 "STGrammar.m"

  yyvsp -= yylen;
  yyssp -= yylen;


#if YYDEBUG
  if (yydebug)
    {
      short *yyssp1 = yyss - 1;
      YYFPRINTF (stderr, "state stack now");
      while (yyssp1 != yyssp)
	YYFPRINTF (stderr, " %d", *++yyssp1);
      YYFPRINTF (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (YYPACT_NINF < yyn && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  int yytype = YYTRANSLATE (yychar);
	  char *yymsg;
	  int yyx, yycount;

	  yycount = 0;
	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  for (yyx = yyn < 0 ? -yyn : 0;
	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
	  yysize += yystrlen ("parse error, unexpected ") + 1;
	  yysize += yystrlen (yytname[yytype]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[yytype]);

	      if (yycount < 5)
		{
		  yycount = 0;
		  for (yyx = yyn < 0 ? -yyn : 0;
		       yyx < (int) (sizeof (yytname) / sizeof (char *));
		       yyx++)
		    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
		      {
			const char *yyq = ! yycount ? ", expecting " : " or ";
			yyp = yystpcpy (yyp, yyq);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yycount++;
		      }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror ("parse error");
    }
  goto yyerrlab1;


/*----------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action.  |
`----------------------------------------------------*/
yyerrlab1:
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      /* Return failure if at end of input.  */
      if (yychar == YYEOF)
        {
	  /* Pop the error token.  */
          YYPOPSTACK;
	  /* Pop the rest of the stack.  */
	  while (yyssp > yyss)
	    {
	      YYDPRINTF ((stderr, "Error: popping "));
	      YYDSYMPRINT ((stderr,
			    yystos[*yyssp],
			    *yyvsp));
	      YYDPRINTF ((stderr, "\n"));
	      yydestruct (yystos[*yyssp], *yyvsp);
	      YYPOPSTACK;
	    }
	  YYABORT;
        }

      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
		  yychar, yytname[yychar1]));
      yydestruct (yychar1, yylval);
      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */

  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      YYDPRINTF ((stderr, "Error: popping "));
      YYDSYMPRINT ((stderr,
		    yystos[*yyssp], *yyvsp));
      YYDPRINTF ((stderr, "\n"));

      yydestruct (yystos[yystate], *yyvsp);
      yyvsp--;
      yystate = *--yyssp;


#if YYDEBUG
      if (yydebug)
	{
	  short *yyssp1 = yyss - 1;
	  YYFPRINTF (stderr, "Error: state stack now");
	  while (yyssp1 != yyssp)
	    YYFPRINTF (stderr, " %d", *++yyssp1);
	  YYFPRINTF (stderr, "\n");
	}
#endif
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;


  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*----------------------------------------------.
| yyoverflowlab -- parser overflow comes here.  |
`----------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 403 "STGrammar.y"


int STCerror(const char *str)
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



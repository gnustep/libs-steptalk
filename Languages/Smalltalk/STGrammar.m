/* A Bison parser, made from STGrammar.y
   by GNU bison 1.35.  */

#define YYBISON 1  /* Identify Bison output.  */

#define yyparse STCparse
#define yylex STClex
#define yyerror STCerror
#define yylval STClval
#define yychar STCchar
#define yydebug STCdebug
#define yynerrs STCnerrs
# define	TK_SEPARATOR	257
# define	TK_BAR	258
# define	TK_ASSIGNMENT	259
# define	TK_LPAREN	260
# define	TK_RPAREN	261
# define	TK_BLOCK_OPEN	262
# define	TK_BLOCK_CLOSE	263
# define	TK_ARRAY_OPEN	264
# define	TK_DOT	265
# define	TK_COLON	266
# define	TK_SEMICOLON	267
# define	TK_RETURN	268
# define	TK_IDENTIFIER	269
# define	TK_BINARY_SELECTOR	270
# define	TK_KEYWORD	271
# define	TK_NUMBER	272
# define	TK_SYMBOL	273
# define	TK_STRING	274
# define	TK_CHARACTER	275

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
#ifndef YYSTYPE
# define YYSTYPE int
# define YYSTYPE_IS_TRIVIAL 1
#endif
#ifndef YYDEBUG
# define YYDEBUG 0
#endif



#define	YYFINAL		115
#define	YYFLAG		-32768
#define	YYNTBASE	22

/* YYTRANSLATE(YYLEX) -- Bison token number corresponding to YYLEX. */
#define YYTRANSLATE(x) ((unsigned)(x) <= 275 ? yytranslate[x] : 57)

/* YYTRANSLATE[YYLEX] -- Bison token number corresponding to YYLEX. */
static const char yytranslate[] =
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
       2,     2,     2,     2,     2,     2,     1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21
};

#if YYDEBUG
static const short yyprhs[] =
{
       0,     0,     1,     3,     8,    10,    13,    14,    18,    20,
      22,    26,    29,    33,    35,    38,    40,    43,    47,    51,
      53,    56,    59,    63,    69,    72,    76,    79,    81,    84,
      89,    91,    95,    97,   100,   102,   105,   107,   110,   112,
     115,   118,   121,   124,   128,   130,   133,   135,   137,   139,
     141,   144,   148,   151,   154,   158,   160,   162,   164,   166,
     168,   170,   172,   176,   178,   180,   182,   184,   186,   188,
     190,   192,   196,   197,   199,   201,   204,   207,   209,   211
};
static const short yyrhs[] =
{
      -1,    23,     0,     8,     4,    24,     9,     0,    34,     0,
      30,    34,     0,     0,    33,    25,    26,     0,    26,     0,
      27,     0,    26,     3,    27,     0,    28,    34,     0,    28,
      30,    34,     0,    51,     0,    52,    50,     0,    29,     0,
      53,    50,     0,    29,    53,    50,     0,     4,    31,     4,
       0,    50,     0,    31,    50,     0,     8,     9,     0,     8,
      34,     9,     0,     8,    33,     4,    34,     9,     0,    12,
      50,     0,    33,    12,    50,     0,    14,    36,     0,    35,
       0,    35,    11,     0,    35,    11,    14,    36,     0,    36,
       0,    35,    11,    36,     0,    49,     0,    37,    49,     0,
      42,     0,    37,    42,     0,    39,     0,    37,    39,     0,
      38,     0,    37,    38,     0,    50,     5,     0,    42,    40,
       0,    13,    41,     0,    40,    13,    41,     0,    51,     0,
      52,    47,     0,    46,     0,    43,     0,    44,     0,    45,
       0,    47,    51,     0,    48,    52,    47,     0,    48,    46,
       0,    53,    48,     0,    46,    53,    48,     0,    49,     0,
      43,     0,    47,     0,    44,     0,    50,     0,    54,     0,
      32,     0,     6,    36,     7,     0,    15,     0,    15,     0,
      16,     0,    17,     0,    18,     0,    19,     0,    20,     0,
      21,     0,    10,    55,     7,     0,     0,    54,     0,    56,
       0,    55,    54,     0,    55,    56,     0,    15,     0,    52,
       0,    17,     0
};

#endif

#if YYDEBUG
/* YYRLINE[YYN] -- source line where rule number YYN was defined. */
static const short yyrline[] =
{
       0,    66,    71,    75,    81,    86,    94,    94,   101,   104,
     108,   114,   119,   127,   133,   138,   141,   146,   153,   157,
     162,   169,   173,   177,   183,   188,   194,   200,   206,   211,
     219,   225,   231,   236,   242,   243,   248,   249,   255,   260,
     267,   270,   276,   281,   287,   292,   297,   300,   301,   302,
     304,   313,   322,   329,   334,   340,   341,   343,   344,   346,
     350,   354,   358,   363,   365,   367,   369,   371,   373,   375,
     377,   379,   382,   383,   385,   387,   388,   390,   392,   394
};
#endif


#if (YYDEBUG) || defined YYERROR_VERBOSE

/* YYTNAME[TOKEN_NUM] -- String name of the token TOKEN_NUM. */
static const char *const yytname[] =
{
  "$", "error", "$undefined.", "TK_SEPARATOR", "TK_BAR", "TK_ASSIGNMENT", 
  "TK_LPAREN", "TK_RPAREN", "TK_BLOCK_OPEN", "TK_BLOCK_CLOSE", 
  "TK_ARRAY_OPEN", "TK_DOT", "TK_COLON", "TK_SEMICOLON", "TK_RETURN", 
  "TK_IDENTIFIER", "TK_BINARY_SELECTOR", "TK_KEYWORD", "TK_NUMBER", 
  "TK_SYMBOL", "TK_STRING", "TK_CHARACTER", "source", "single_method", 
  "methods", "@1", "method_list", "method", "message_pattern", 
  "keyword_list", "temporaries", "variable_list", "block", 
  "block_var_list", "statements", "expressions", "expression", 
  "assignments", "assignment", "cascade", "cascade_list", "cascade_item", 
  "message_expression", "unary_expression", "binary_expression", 
  "keyword_expression", "keyword_expr_list", "unary_object", 
  "binary_object", "primary", "variable_name", "unary_selector", 
  "binary_selector", "keyword", "literal", "array", "symbol", 0
};
#endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives. */
static const short yyr1[] =
{
       0,    22,    22,    22,    23,    23,    25,    24,    24,    26,
      26,    27,    27,    28,    28,    28,    29,    29,    30,    31,
      31,    32,    32,    32,    33,    33,    34,    34,    34,    34,
      35,    35,    36,    36,    36,    36,    36,    36,    37,    37,
      38,    39,    40,    40,    41,    41,    41,    42,    42,    42,
      43,    44,    45,    46,    46,    47,    47,    48,    48,    49,
      49,    49,    49,    50,    51,    52,    53,    54,    54,    54,
      54,    54,    55,    55,    55,    55,    55,    56,    56,    56
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN. */
static const short yyr2[] =
{
       0,     0,     1,     4,     1,     2,     0,     3,     1,     1,
       3,     2,     3,     1,     2,     1,     2,     3,     3,     1,
       2,     2,     3,     5,     2,     3,     2,     1,     2,     4,
       1,     3,     1,     2,     1,     2,     1,     2,     1,     2,
       2,     2,     2,     3,     1,     2,     1,     1,     1,     1,
       2,     3,     2,     2,     3,     1,     1,     1,     1,     1,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     0,     1,     1,     2,     2,     1,     1,     1
};

/* YYDEFACT[S] -- default rule to reduce with in state S when YYTABLE
   doesn't specify something else to do.  Zero means the default is an
   error. */
static const short yydefact[] =
{
       1,     0,     0,     0,    72,     0,    63,    67,    68,    69,
      70,     2,     0,    61,     4,    27,    30,     0,    38,    36,
      34,    47,    48,    49,    57,     0,    32,    59,    60,     0,
      19,     0,     0,     0,    21,     0,     0,     0,    77,    65,
      79,    78,    73,     0,    74,    26,     5,    28,    39,    37,
      35,    33,     0,    41,    64,    50,    66,    52,     0,     0,
      40,    18,    20,    62,     0,     8,     9,     0,    15,     6,
      13,     0,     0,    24,     0,     0,    22,    71,    75,    76,
       0,    31,    42,    46,    44,     0,     0,     0,    56,    51,
      55,    59,    58,    53,     3,     0,     0,    11,     0,     0,
      14,    16,     0,    25,    29,    45,    43,    54,    10,    12,
      17,     7,    23,     0,     0,     0
};

static const short yydefgoto[] =
{
     113,    11,    64,    99,    65,    66,    67,    68,    12,    29,
      13,    36,    37,    15,    16,    17,    18,    19,    53,    82,
      20,    21,    22,    23,    83,    24,    25,    26,    27,    55,
      58,    59,    28,    43,    44
};

static const short yypact[] =
{
      46,    11,   177,    95,     3,   177,-32768,-32768,-32768,-32768,
  -32768,-32768,   145,-32768,-32768,    -4,-32768,   177,-32768,-32768,
       4,   109,    15,-32768,    14,    78,   141,     7,-32768,    64,
  -32768,   129,     9,   194,-32768,    11,    29,    27,-32768,-32768,
  -32768,-32768,-32768,   184,-32768,-32768,-32768,   161,-32768,-32768,
       4,   141,   157,    32,-32768,-32768,-32768,    36,   177,   177,
  -32768,-32768,-32768,-32768,    50,    52,-32768,   113,    36,    51,
  -32768,    11,    11,-32768,   145,    11,-32768,-32768,-32768,-32768,
     177,-32768,-32768,    36,-32768,   177,   157,   177,-32768,    14,
  -32768,-32768,-32768,    56,-32768,   157,   145,-32768,    11,   157,
  -32768,-32768,    71,-32768,-32768,    14,-32768,    56,-32768,-32768,
  -32768,    52,-32768,    82,    85,-32768
};

static const short yypgoto[] =
{
  -32768,-32768,-32768,-32768,   -11,    -5,-32768,-32768,    33,-32768,
  -32768,    69,     2,-32768,     1,-32768,    89,    91,-32768,    25,
     101,   -50,   -49,-32768,    87,   -43,   -48,   -12,    -1,    -8,
      -3,    -6,     0,-32768,    77
};


#define	YYLAST		211


static const short yytable[] =
{
      30,    41,    14,    32,    42,    51,    45,    47,    88,    88,
      92,    93,    60,     4,    46,    89,    63,    52,    38,    39,
      40,     7,     8,     9,    10,    70,     6,    72,    62,    54,
      71,   -58,   -58,    74,    73,    88,    76,    88,    92,   107,
      41,    75,   105,    78,    84,    86,    90,    90,    81,    85,
       1,    87,     2,    56,     3,    95,     4,    91,    91,    94,
       5,     6,    98,    75,     7,     8,     9,    10,    61,    97,
     100,   101,    39,    90,   103,    90,   102,    87,    84,     6,
     112,   104,   114,    85,    91,   115,    91,    70,   111,    72,
     108,    70,    71,    72,    39,    56,    71,   110,   109,    33,
      96,     2,    69,    31,    34,     4,    48,    35,    49,     5,
       6,   106,    57,     7,     8,     9,    10,     1,    50,     2,
      79,    31,     0,     4,   -56,   -56,   -56,     5,     6,     0,
       0,     7,     8,     9,    10,     2,     0,    31,    34,     4,
       0,    35,     0,     5,     6,     0,     0,     7,     8,     9,
      10,     2,     0,    31,     0,     4,   -55,   -55,   -55,     5,
       6,     0,     0,     7,     8,     9,    10,     2,     0,    31,
       0,     4,    54,    39,    56,    80,     6,     0,     0,     7,
       8,     9,    10,     2,     0,    31,     0,     4,     0,     0,
       0,    77,     6,     0,     4,     7,     8,     9,    10,    38,
      39,    40,     7,     8,     9,    10,    35,     0,     0,    54,
      39,    56
};

static const short yycheck[] =
{
       1,     4,     0,     2,     4,    17,     5,    11,    58,    59,
      59,    59,     5,    10,    12,    58,     7,    13,    15,    16,
      17,    18,    19,    20,    21,    33,    15,    33,    29,    15,
      33,    16,    17,     4,    35,    85,     9,    87,    87,    87,
      43,    12,    85,    43,    52,    13,    58,    59,    47,    52,
       4,    57,     6,    17,     8,     3,    10,    58,    59,     9,
      14,    15,    68,    12,    18,    19,    20,    21,     4,    67,
      71,    72,    16,    85,    75,    87,    74,    83,    86,    15,
       9,    80,     0,    86,    85,     0,    87,    95,    99,    95,
      95,    99,    95,    99,    16,    17,    99,    98,    96,     4,
      67,     6,    33,     8,     9,    10,    17,    12,    17,    14,
      15,    86,    25,    18,    19,    20,    21,     4,    17,     6,
      43,     8,    -1,    10,    15,    16,    17,    14,    15,    -1,
      -1,    18,    19,    20,    21,     6,    -1,     8,     9,    10,
      -1,    12,    -1,    14,    15,    -1,    -1,    18,    19,    20,
      21,     6,    -1,     8,    -1,    10,    15,    16,    17,    14,
      15,    -1,    -1,    18,    19,    20,    21,     6,    -1,     8,
      -1,    10,    15,    16,    17,    14,    15,    -1,    -1,    18,
      19,    20,    21,     6,    -1,     8,    -1,    10,    -1,    -1,
      -1,     7,    15,    -1,    10,    18,    19,    20,    21,    15,
      16,    17,    18,    19,    20,    21,    12,    -1,    -1,    15,
      16,    17
};
#define YYPURE 1

/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "/usr/share/bison/bison.simple"

/* Skeleton output parser for bison,

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software
   Foundation, Inc.

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

/* This is the parser code that is written into each bison parser when
   the %semantic_parser declaration is not specified in the grammar.
   It was written by Richard Stallman by simplifying the hairy parser
   used when %semantic_parser is specified.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

#if ! defined (yyoverflow) || defined (YYERROR_VERBOSE)

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
#endif /* ! defined (yyoverflow) || defined (YYERROR_VERBOSE) */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
# if YYLSP_NEEDED
  YYLTYPE yyls;
# endif
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# if YYLSP_NEEDED
#  define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE) + sizeof (YYLTYPE))	\
      + 2 * YYSTACK_GAP_MAX)
# else
#  define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAX)
# endif

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
	    (To)[yyi] = (From)[yyi];		\
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
#define YYABORT 	goto yyabortlab
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
   are run).

   When YYLLOC_DEFAULT is run, CURRENT is set the location of the
   first token.  By default, to implement support for ranges, extend
   its range to the last symbol.  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)       	\
   Current.last_line   = Rhs[N].last_line;	\
   Current.last_column = Rhs[N].last_column;
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#if YYPURE
# if YYLSP_NEEDED
#  ifdef YYLEX_PARAM
#   define YYLEX		yylex (&yylval, &yylloc, YYLEX_PARAM)
#  else
#   define YYLEX		yylex (&yylval, &yylloc)
#  endif
# else /* !YYLSP_NEEDED */
#  ifdef YYLEX_PARAM
#   define YYLEX		yylex (&yylval, YYLEX_PARAM)
#  else
#   define YYLEX		yylex (&yylval)
#  endif
# endif /* !YYLSP_NEEDED */
#else /* !YYPURE */
# define YYLEX			yylex ()
#endif /* !YYPURE */


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
/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
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

#ifdef YYERROR_VERBOSE

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
#endif

#line 315 "/usr/share/bison/bison.simple"


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

/* YY_DECL_VARIABLES -- depending whether we use a pure parser,
   variables are global, or local to YYPARSE.  */

#define YY_DECL_NON_LSP_VARIABLES			\
/* The lookahead symbol.  */				\
int yychar;						\
							\
/* The semantic value of the lookahead symbol. */	\
YYSTYPE yylval;						\
							\
/* Number of parse errors so far.  */			\
int yynerrs;

#if YYLSP_NEEDED
# define YY_DECL_VARIABLES			\
YY_DECL_NON_LSP_VARIABLES			\
						\
/* Location data for the lookahead symbol.  */	\
YYLTYPE yylloc;
#else
# define YY_DECL_VARIABLES			\
YY_DECL_NON_LSP_VARIABLES
#endif


/* If nonreentrant, generate the variables here. */

#if !YYPURE
YY_DECL_VARIABLES
#endif  /* !YYPURE */

int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  /* If reentrant, generate the variables here. */
#if YYPURE
  YY_DECL_VARIABLES
#endif  /* !YYPURE */

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

  /* The state stack. */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;

#if YYLSP_NEEDED
  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
#endif

#if YYLSP_NEEDED
# define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
# define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  YYSIZE_T yystacksize = YYINITDEPTH;


  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
#if YYLSP_NEEDED
  YYLTYPE yyloc;
#endif

  /* When reducing, the number of symbols on the RHS of the reduced
     rule. */
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
#if YYLSP_NEEDED
  yylsp = yyls;
#endif
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
	   data in use in that stack, in bytes.  */
# if YYLSP_NEEDED
	YYLTYPE *yyls1 = yyls;
	/* This used to be a conditional around just the two extra args,
	   but that might be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);
	yyls = yyls1;
# else
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);
# endif
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
# if YYLSP_NEEDED
	YYSTACK_RELOCATE (yyls);
# endif
# undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
#if YYLSP_NEEDED
      yylsp = yyls + yysize - 1;
#endif

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
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yychar1 = YYTRANSLATE (yychar);

#if YYDEBUG
     /* We have to keep this `#if YYDEBUG', since we use variables
	which are defined only if `YYDEBUG' is set.  */
      if (yydebug)
	{
	  YYFPRINTF (stderr, "Next token is %d (%s",
		     yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise
	     meaning of a token, for further debugging info.  */
# ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
# endif
	  YYFPRINTF (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
	      yychar, yytname[yychar1]));

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#if YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

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

     Otherwise, the following line sets YYVAL to the semantic value of
     the lookahead token.  This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

#if YYLSP_NEEDED
  /* Similarly for the default location.  Let the user run additional
     commands if for instance locations are ranges.  */
  yyloc = yylsp[1-yylen];
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
#endif

#if YYDEBUG
  /* We have to keep this `#if YYDEBUG', since we use variables which
     are defined only if `YYDEBUG' is set.  */
  if (yydebug)
    {
      int yyi;

      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
		 yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (yyi = yyprhs[yyn]; yyrhs[yyi] > 0; yyi++)
	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif

  switch (yyn) {

case 1:
#line 66 "STGrammar.y"
{ 
                                [COMPILER compileMethod:nil]; 
                            ;
    break;}
case 2:
#line 71 "STGrammar.y"
{
                                [COMPILER compileMethod:yyvsp[0]];
                            ;
    break;}
case 4:
#line 82 "STGrammar.y"
{
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            ;
    break;}
case 5:
#line 87 "STGrammar.y"
{
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            ;
    break;}
case 6:
#line 96 "STGrammar.y"
{
                                [COMPILER setReceiverVariables:yyvsp[0]];
                            ;
    break;}
case 9:
#line 105 "STGrammar.y"
{
                                [COMPILER compileMethod:yyvsp[0]];
                            ;
    break;}
case 10:
#line 109 "STGrammar.y"
{
                                [COMPILER compileMethod:yyvsp[0]];
                            ;
    break;}
case 11:
#line 115 "STGrammar.y"
{
                                yyval =  [STCMethod methodWithPattern:yyvsp[-1]
                                /**/                    statements:yyvsp[0]];
                            ;
    break;}
case 12:
#line 120 "STGrammar.y"
{
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:yyvsp[-2]
                                /**/                    statements:yyvsp[0]];
                            ;
    break;}
case 13:
#line 129 "STGrammar.y"
{
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            ;
    break;}
case 14:
#line 134 "STGrammar.y"
{
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            ;
    break;}
case 16:
#line 142 "STGrammar.y"
{
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            ;
    break;}
case 17:
#line 147 "STGrammar.y"
{
                                [yyvsp[-2] addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = yyvsp[-2];
                            ;
    break;}
case 18:
#line 154 "STGrammar.y"
{ yyval = yyvsp[-1]; ;
    break;}
case 19:
#line 158 "STGrammar.y"
{ 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            ;
    break;}
case 20:
#line 163 "STGrammar.y"
{ 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            ;
    break;}
case 21:
#line 170 "STGrammar.y"
{
                                yyval = [STCStatements statements];
                            ;
    break;}
case 22:
#line 174 "STGrammar.y"
{
                                yyval = yyvsp[-1];
                            ;
    break;}
case 23:
#line 178 "STGrammar.y"
{
                                yyval = yyvsp[-1];
                                [yyval setTemporaries:yyvsp[-3]];
                            ;
    break;}
case 24:
#line 184 "STGrammar.y"
{ 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            ;
    break;}
case 25:
#line 189 "STGrammar.y"
{ 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            ;
    break;}
case 26:
#line 196 "STGrammar.y"
{ 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                            ;
    break;}
case 27:
#line 201 "STGrammar.y"
{ 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[0]];
                            ;
    break;}
case 28:
#line 207 "STGrammar.y"
{ 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[-1]];
                            ;
    break;}
case 29:
#line 212 "STGrammar.y"
{ 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                                [yyval setExpressions:yyvsp[-3]];
                            ;
    break;}
case 30:
#line 220 "STGrammar.y"
{ 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            ;
    break;}
case 31:
#line 226 "STGrammar.y"
{   
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            ;
    break;}
case 32:
#line 232 "STGrammar.y"
{ 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                            ;
    break;}
case 33:
#line 237 "STGrammar.y"
{ 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                                [yyval setAssignments:yyvsp[-1]];
                            ;
    break;}
case 35:
#line 244 "STGrammar.y"
{ 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            ;
    break;}
case 37:
#line 250 "STGrammar.y"
{ 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            ;
    break;}
case 38:
#line 256 "STGrammar.y"
{ 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            ;
    break;}
case 39:
#line 261 "STGrammar.y"
{ 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            ;
    break;}
case 40:
#line 268 "STGrammar.y"
{ yyval = yyvsp[-1];;
    break;}
case 41:
#line 271 "STGrammar.y"
{ 
                                /* FIXME: check if this is this OK */
                                [yyval setCascade:yyvsp[0]]; 
                            ;
    break;}
case 42:
#line 277 "STGrammar.y"
{
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            ;
    break;}
case 43:
#line 282 "STGrammar.y"
{ 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]];
                            ;
    break;}
case 44:
#line 288 "STGrammar.y"
{ 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            ;
    break;}
case 45:
#line 293 "STGrammar.y"
{ 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            ;
    break;}
case 50:
#line 305 "STGrammar.y"
{ 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[0] object:nil];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:message];
                            ;
    break;}
case 51:
#line 314 "STGrammar.y"
{ 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-2]
                                /**/        message:message];
                            ;
    break;}
case 52:
#line 323 "STGrammar.y"
{
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:yyvsp[0]];
                            ;
    break;}
case 53:
#line 330 "STGrammar.y"
{ 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            ;
    break;}
case 54:
#line 335 "STGrammar.y"
{ 
                                yyval = yyvsp[-2];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            ;
    break;}
case 59:
#line 347 "STGrammar.y"
{
                                yyval = [STCPrimary primaryWithVariable:yyvsp[0]];
                            ;
    break;}
case 60:
#line 351 "STGrammar.y"
{
                                yyval = [STCPrimary primaryWithLiteral:yyvsp[0]];
                            ;
    break;}
case 61:
#line 355 "STGrammar.y"
{
                                yyval = [STCPrimary primaryWithBlock:yyvsp[0]];
                            ;
    break;}
case 62:
#line 359 "STGrammar.y"
{
                                yyval = [STCPrimary primaryWithExpression:yyvsp[-1]];
                            ;
    break;}
case 67:
#line 372 "STGrammar.y"
{ yyval = [COMPILER createNumberLiteralFrom:yyvsp[0]]; ;
    break;}
case 68:
#line 374 "STGrammar.y"
{ yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; ;
    break;}
case 69:
#line 376 "STGrammar.y"
{ yyval = [COMPILER createStringLiteralFrom:yyvsp[0]]; ;
    break;}
case 70:
#line 378 "STGrammar.y"
{ yyval = [COMPILER createCharacterLiteralFrom:yyvsp[0]]; ;
    break;}
case 71:
#line 380 "STGrammar.y"
{ yyval = [COMPILER createArrayLiteralFrom:yyvsp[-1]]; ;
    break;}
case 72:
#line 382 "STGrammar.y"
{ yyval = [NSMutableArray array]; ;
    break;}
case 73:
#line 383 "STGrammar.y"
{ yyval = [NSMutableArray array]; 
                                   [yyval addObject:yyvsp[0]]; ;
    break;}
case 74:
#line 385 "STGrammar.y"
{ yyval = [NSMutableArray array];
                                   [yyval addObject:yyvsp[0]]; ;
    break;}
case 75:
#line 387 "STGrammar.y"
{ yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; ;
    break;}
case 76:
#line 388 "STGrammar.y"
{ yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; ;
    break;}
case 77:
#line 391 "STGrammar.y"
{ yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; ;
    break;}
case 78:
#line 393 "STGrammar.y"
{ yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; ;
    break;}
case 79:
#line 395 "STGrammar.y"
{ yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; ;
    break;}
}

#line 705 "/usr/share/bison/bison.simple"


  yyvsp -= yylen;
  yyssp -= yylen;
#if YYLSP_NEEDED
  yylsp -= yylen;
#endif

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
#if YYLSP_NEEDED
  *++yylsp = yyloc;
#endif

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  char *yymsg;
	  int yyx, yycount;

	  yycount = 0;
	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  for (yyx = yyn < 0 ? -yyn : 0;
	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
	    if (yycheck[yyx + yyn] == yyx)
	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
	  yysize += yystrlen ("parse error, unexpected ") + 1;
	  yysize += yystrlen (yytname[YYTRANSLATE (yychar)]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[YYTRANSLATE (yychar)]);

	      if (yycount < 5)
		{
		  yycount = 0;
		  for (yyx = yyn < 0 ? -yyn : 0;
		       yyx < (int) (sizeof (yytname) / sizeof (char *));
		       yyx++)
		    if (yycheck[yyx + yyn] == yyx)
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
#endif /* defined (YYERROR_VERBOSE) */
	yyerror ("parse error");
    }
  goto yyerrlab1;


/*--------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action |
`--------------------------------------------------*/
yyerrlab1:
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;
      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
		  yychar, yytname[yychar1]));
      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;


/*-------------------------------------------------------------------.
| yyerrdefault -- current state does not do anything special for the |
| error token.                                                       |
`-------------------------------------------------------------------*/
yyerrdefault:
#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */

  /* If its default is to accept any token, ok.  Otherwise pop it.  */
  yyn = yydefact[yystate];
  if (yyn)
    goto yydefault;
#endif


/*---------------------------------------------------------------.
| yyerrpop -- pop the current state because it cannot handle the |
| error token                                                    |
`---------------------------------------------------------------*/
yyerrpop:
  if (yyssp == yyss)
    YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#if YYLSP_NEEDED
  yylsp--;
#endif

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

/*--------------.
| yyerrhandle.  |
`--------------*/
yyerrhandle:
  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;
#if YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

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

/*---------------------------------------------.
| yyoverflowab -- parser overflow comes here.  |
`---------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}
#line 397 "STGrammar.y"


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
    case STNumberTokenType:         return TK_NUMBER;
    case STSeparatorTokenType:      return TK_SEPARATOR;

    case STEndTokenType:            return 0;

    case STSharpTokenType:
    case STInvalidTokenType:
    case STErrorTokenType:
                                    return 1;
    }

    return 1;   
}

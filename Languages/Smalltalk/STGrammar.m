/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1


/* Substitute the variable and function names.  */
#define yyparse         STCparse
#define yylex           STClex
#define yyerror         STCerror
#define yydebug         STCdebug
#define yynerrs         STCnerrs

/* First part of user prologue.  */
#line 27 "STGrammar.y"


    #define YYSTYPE id
    #define YYLTYPE int
    #undef YYDEBUG
    
    #import <Foundation/NSException.h>
    #import "STCompiler.h"
    #import "STCompilerUtils.h"
    #import "STSourceReader.h"
    
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

#line 104 "STGrammar.m"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif


/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int STCdebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TK_SEPARATOR = 258,            /* TK_SEPARATOR  */
    TK_BAR = 259,                  /* TK_BAR  */
    TK_ASSIGNMENT = 260,           /* TK_ASSIGNMENT  */
    TK_LPAREN = 261,               /* TK_LPAREN  */
    TK_RPAREN = 262,               /* TK_RPAREN  */
    TK_BLOCK_OPEN = 263,           /* TK_BLOCK_OPEN  */
    TK_BLOCK_CLOSE = 264,          /* TK_BLOCK_CLOSE  */
    TK_LCURLY = 265,               /* TK_LCURLY  */
    TK_RCURLY = 266,               /* TK_RCURLY  */
    TK_ARRAY_OPEN = 267,           /* TK_ARRAY_OPEN  */
    TK_DOT = 268,                  /* TK_DOT  */
    TK_COLON = 269,                /* TK_COLON  */
    TK_SEMICOLON = 270,            /* TK_SEMICOLON  */
    TK_RETURN = 271,               /* TK_RETURN  */
    TK_IDENTIFIER = 272,           /* TK_IDENTIFIER  */
    TK_BINARY_SELECTOR = 273,      /* TK_BINARY_SELECTOR  */
    TK_KEYWORD = 274,              /* TK_KEYWORD  */
    TK_INTNUMBER = 275,            /* TK_INTNUMBER  */
    TK_REALNUMBER = 276,           /* TK_REALNUMBER  */
    TK_SYMBOL = 277,               /* TK_SYMBOL  */
    TK_STRING = 278,               /* TK_STRING  */
    TK_CHARACTER = 279             /* TK_CHARACTER  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif




int STCparse (void *context);



/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_TK_SEPARATOR = 3,               /* TK_SEPARATOR  */
  YYSYMBOL_TK_BAR = 4,                     /* TK_BAR  */
  YYSYMBOL_TK_ASSIGNMENT = 5,              /* TK_ASSIGNMENT  */
  YYSYMBOL_TK_LPAREN = 6,                  /* TK_LPAREN  */
  YYSYMBOL_TK_RPAREN = 7,                  /* TK_RPAREN  */
  YYSYMBOL_TK_BLOCK_OPEN = 8,              /* TK_BLOCK_OPEN  */
  YYSYMBOL_TK_BLOCK_CLOSE = 9,             /* TK_BLOCK_CLOSE  */
  YYSYMBOL_TK_LCURLY = 10,                 /* TK_LCURLY  */
  YYSYMBOL_TK_RCURLY = 11,                 /* TK_RCURLY  */
  YYSYMBOL_TK_ARRAY_OPEN = 12,             /* TK_ARRAY_OPEN  */
  YYSYMBOL_TK_DOT = 13,                    /* TK_DOT  */
  YYSYMBOL_TK_COLON = 14,                  /* TK_COLON  */
  YYSYMBOL_TK_SEMICOLON = 15,              /* TK_SEMICOLON  */
  YYSYMBOL_TK_RETURN = 16,                 /* TK_RETURN  */
  YYSYMBOL_TK_IDENTIFIER = 17,             /* TK_IDENTIFIER  */
  YYSYMBOL_TK_BINARY_SELECTOR = 18,        /* TK_BINARY_SELECTOR  */
  YYSYMBOL_TK_KEYWORD = 19,                /* TK_KEYWORD  */
  YYSYMBOL_TK_INTNUMBER = 20,              /* TK_INTNUMBER  */
  YYSYMBOL_TK_REALNUMBER = 21,             /* TK_REALNUMBER  */
  YYSYMBOL_TK_SYMBOL = 22,                 /* TK_SYMBOL  */
  YYSYMBOL_TK_STRING = 23,                 /* TK_STRING  */
  YYSYMBOL_TK_CHARACTER = 24,              /* TK_CHARACTER  */
  YYSYMBOL_25_script_open_ = 25,           /* "script_open"  */
  YYSYMBOL_YYACCEPT = 26,                  /* $accept  */
  YYSYMBOL_source = 27,                    /* source  */
  YYSYMBOL_script_open = 28,               /* script_open  */
  YYSYMBOL_plain_code = 29,                /* plain_code  */
  YYSYMBOL_methods = 30,                   /* methods  */
  YYSYMBOL_31_1 = 31,                      /* $@1  */
  YYSYMBOL_method_list = 32,               /* method_list  */
  YYSYMBOL_method = 33,                    /* method  */
  YYSYMBOL_message_pattern = 34,           /* message_pattern  */
  YYSYMBOL_keyword_list = 35,              /* keyword_list  */
  YYSYMBOL_temporaries = 36,               /* temporaries  */
  YYSYMBOL_variable_list = 37,             /* variable_list  */
  YYSYMBOL_block = 38,                     /* block  */
  YYSYMBOL_block_var_list = 39,            /* block_var_list  */
  YYSYMBOL_statements = 40,                /* statements  */
  YYSYMBOL_expressions = 41,               /* expressions  */
  YYSYMBOL_expression = 42,                /* expression  */
  YYSYMBOL_assignments = 43,               /* assignments  */
  YYSYMBOL_assignment = 44,                /* assignment  */
  YYSYMBOL_cascade = 45,                   /* cascade  */
  YYSYMBOL_messages = 46,                  /* messages  */
  YYSYMBOL_message = 47,                   /* message  */
  YYSYMBOL_message_expression = 48,        /* message_expression  */
  YYSYMBOL_unary_expression = 49,          /* unary_expression  */
  YYSYMBOL_unary_message = 50,             /* unary_message  */
  YYSYMBOL_binary_expression = 51,         /* binary_expression  */
  YYSYMBOL_binary_message = 52,            /* binary_message  */
  YYSYMBOL_keyword_expression = 53,        /* keyword_expression  */
  YYSYMBOL_keyword_message = 54,           /* keyword_message  */
  YYSYMBOL_unary_object = 55,              /* unary_object  */
  YYSYMBOL_binary_object = 56,             /* binary_object  */
  YYSYMBOL_primary = 57,                   /* primary  */
  YYSYMBOL_variable_name = 58,             /* variable_name  */
  YYSYMBOL_unary_selector = 59,            /* unary_selector  */
  YYSYMBOL_binary_selector = 60,           /* binary_selector  */
  YYSYMBOL_keyword = 61,                   /* keyword  */
  YYSYMBOL_literal = 62,                   /* literal  */
  YYSYMBOL_array = 63,                     /* array  */
  YYSYMBOL_symbol = 64                     /* symbol  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  49
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   312

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  26
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  39
/* YYNRULES -- Number of rules.  */
#define YYNRULES  88
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  133

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   280


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
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
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    81,    81,    86,    91,    96,   102,   107,   117,   116,
     122,   125,   129,   135,   140,   149,   154,   159,   162,   167,
     174,   178,   184,   189,   196,   201,   207,   213,   221,   226,
     232,   233,   238,   244,   249,   258,   263,   269,   274,   280,
     281,   286,   287,   293,   298,   305,   308,   314,   319,   325,
     326,   327,   330,   331,   332,   334,   341,   347,   354,   360,
     367,   372,   378,   379,   381,   382,   384,   388,   392,   396,
     400,   404,   409,   411,   413,   415,   418,   420,   422,   424,
     426,   428,   431,   432,   433,   434,   440,   442,   444
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "TK_SEPARATOR",
  "TK_BAR", "TK_ASSIGNMENT", "TK_LPAREN", "TK_RPAREN", "TK_BLOCK_OPEN",
  "TK_BLOCK_CLOSE", "TK_LCURLY", "TK_RCURLY", "TK_ARRAY_OPEN", "TK_DOT",
  "TK_COLON", "TK_SEMICOLON", "TK_RETURN", "TK_IDENTIFIER",
  "TK_BINARY_SELECTOR", "TK_KEYWORD", "TK_INTNUMBER", "TK_REALNUMBER",
  "TK_SYMBOL", "TK_STRING", "TK_CHARACTER", "\"script_open\"", "$accept",
  "source", "script_open", "plain_code", "methods", "$@1", "method_list",
  "method", "message_pattern", "keyword_list", "temporaries",
  "variable_list", "block", "block_var_list", "statements", "expressions",
  "expression", "assignments", "assignment", "cascade", "messages",
  "message", "message_expression", "unary_expression", "unary_message",
  "binary_expression", "binary_message", "keyword_expression",
  "keyword_message", "unary_object", "binary_object", "primary",
  "variable_name", "unary_selector", "binary_selector", "keyword",
  "literal", "array", "symbol", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-73)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-66)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     111,    18,    10,   288,   132,   193,   -73,   288,   -73,   -73,
     -73,   -73,   -73,   -73,     9,    17,   -73,   212,   -73,   -73,
      24,   -73,   288,   -73,   -73,    37,    28,     7,   -73,     1,
      22,    52,    48,   -73,    55,   -73,    11,   -73,   153,    51,
      57,    50,   212,    15,    66,   -73,    19,   231,   -73,   -73,
     -73,   -73,   -73,    67,    76,   -73,   174,    61,    70,   -73,
      50,    50,   -73,   250,   -73,   -73,    37,    52,    55,    73,
     -73,   -73,   -73,    61,   288,   288,   -73,   -73,   -73,   -73,
     -73,   -73,    84,   174,    50,   -73,   -73,   288,   -73,   -73,
     -73,   -73,   -73,   -73,   -73,   -73,    55,   212,   -73,    50,
      55,   -73,   -73,   288,   -73,   -73,   -73,   -73,    61,    55,
     288,   -73,     1,   -73,   -73,   -73,    77,   -73,   212,    87,
     -73,   269,   -73,   -73,   -73,    76,   -73,   -73,    77,    89,
     -73,   -73,   -73
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
      30,     0,     0,     0,    30,     0,    82,     0,    72,    76,
      77,    78,    79,    80,     0,     0,     2,    30,    68,     6,
      32,    35,     0,    43,    41,    39,    52,    53,    54,    64,
       0,    37,    66,    67,     0,    20,     0,    22,    30,     0,
       5,     0,    30,     0,     0,    69,     0,     0,    31,     1,
      73,    74,    75,     0,    10,    11,    30,    17,     8,    15,
       0,     0,     7,    33,    44,    42,    40,    38,     0,    46,
      55,    56,    57,    59,     0,     0,    45,     3,    21,    23,
      71,    28,     0,    30,     0,    24,    70,     0,    82,    81,
      86,    88,    87,    83,    84,     4,     0,    30,    13,     0,
       0,    16,    18,     0,    36,    47,    49,    50,    51,     0,
       0,    63,    58,    62,    66,    65,    60,    25,    30,     0,
      29,     0,    12,    14,    19,     9,    34,    48,    61,     0,
      26,    85,    27
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -73,   -73,   -73,   -73,   -73,   -73,   -15,   -30,   -73,   -73,
       6,   -73,   -73,    88,     0,    94,     5,   -73,    82,    83,
     -73,    -3,    90,   -51,   -58,   -72,   -52,   -73,    79,    36,
     -62,   -20,     3,   -18,   -14,    -8,   -40,    23,   -73
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,    14,    15,    16,    53,   100,    54,    55,    56,    57,
      42,    36,    18,    43,    44,    20,    21,    22,    23,    24,
      69,   105,    25,    26,    70,    27,    72,    28,   108,    29,
      30,    31,    32,    59,    74,    61,    33,    47,    94
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      19,    60,    67,   115,    77,    37,    17,    93,    39,    49,
     106,    71,    48,   116,    35,    78,   107,    62,    50,    83,
      60,    34,    75,   111,   111,   -65,   -65,     8,     8,    84,
      86,    41,    87,    92,    50,    51,    52,    63,   115,    79,
      51,    52,    82,    37,    81,   -63,   -63,   -63,   128,    99,
      71,   106,    68,    76,   113,   113,    98,   107,    80,   111,
      75,    35,    97,   101,   102,   110,   122,     8,   104,   -62,
     -62,   -62,    50,    51,    52,    85,    95,   114,   114,    96,
      52,    93,    60,   119,    84,   125,    60,   120,   109,   118,
     113,    71,   104,   117,    71,    51,   130,   123,   132,    46,
     110,    75,   124,    58,    64,    65,   127,    92,   126,    73,
     112,   121,    66,   114,     1,     2,     0,     3,   129,     4,
       0,     5,     0,     6,     0,     0,     0,     7,     8,     0,
       0,     9,    10,    11,    12,    13,    40,     0,     3,     0,
      38,     0,     5,     0,     6,     0,    41,     0,     7,     8,
       0,     0,     9,    10,    11,    12,    13,     2,     0,     3,
       0,    38,     0,     5,     0,     6,     0,    41,     0,     7,
       8,     0,     0,     9,    10,    11,    12,    13,     2,     0,
       3,     0,    38,     0,     5,     0,     6,     0,     0,     0,
       7,     8,     0,     0,     9,    10,    11,    12,    13,     3,
       0,    38,     0,     5,    45,     6,     0,     0,     0,     0,
       8,     0,     0,     9,    10,    11,    12,    13,     3,     0,
      38,     0,     5,     0,     6,     0,     0,     0,     7,     8,
       0,     0,     9,    10,    11,    12,    13,    88,    89,     0,
       0,     0,     0,     6,     0,     0,     0,     0,    90,    51,
      91,     9,    10,    11,    12,    13,     3,     0,    38,     0,
       5,     0,     6,     0,     0,     0,   103,     8,     0,     0,
       9,    10,    11,    12,    13,    88,   131,     0,     0,     0,
       0,     6,     0,     0,     0,     0,    90,    51,    91,     9,
      10,    11,    12,    13,     3,     0,    38,     0,     5,     0,
       6,     0,     0,     0,     0,     8,     0,     0,     9,    10,
      11,    12,    13
};

static const yytype_int8 yycheck[] =
{
       0,    15,    22,    75,    34,     2,     0,    47,     3,     0,
      68,    29,     7,    75,     4,     4,    68,    17,    17,     4,
      34,     3,    30,    74,    75,    18,    19,    17,    17,    14,
      11,    14,    13,    47,    17,    18,    19,    13,   110,    36,
      18,    19,    42,    40,    41,    17,    18,    19,   110,    57,
      68,   109,    15,     5,    74,    75,    56,   109,     7,   110,
      68,     4,    56,    60,    61,    73,    96,    17,    63,    17,
      18,    19,    17,    18,    19,     9,     9,    74,    75,     3,
      19,   121,    96,    83,    14,   100,   100,    84,    15,    83,
     110,   109,    87,     9,   112,    18,     9,    97,     9,     5,
     108,   109,    99,    15,    22,    22,   109,   121,   103,    30,
      74,    88,    22,   110,     3,     4,    -1,     6,   118,     8,
      -1,    10,    -1,    12,    -1,    -1,    -1,    16,    17,    -1,
      -1,    20,    21,    22,    23,    24,     4,    -1,     6,    -1,
       8,    -1,    10,    -1,    12,    -1,    14,    -1,    16,    17,
      -1,    -1,    20,    21,    22,    23,    24,     4,    -1,     6,
      -1,     8,    -1,    10,    -1,    12,    -1,    14,    -1,    16,
      17,    -1,    -1,    20,    21,    22,    23,    24,     4,    -1,
       6,    -1,     8,    -1,    10,    -1,    12,    -1,    -1,    -1,
      16,    17,    -1,    -1,    20,    21,    22,    23,    24,     6,
      -1,     8,    -1,    10,    11,    12,    -1,    -1,    -1,    -1,
      17,    -1,    -1,    20,    21,    22,    23,    24,     6,    -1,
       8,    -1,    10,    -1,    12,    -1,    -1,    -1,    16,    17,
      -1,    -1,    20,    21,    22,    23,    24,     6,     7,    -1,
      -1,    -1,    -1,    12,    -1,    -1,    -1,    -1,    17,    18,
      19,    20,    21,    22,    23,    24,     6,    -1,     8,    -1,
      10,    -1,    12,    -1,    -1,    -1,    16,    17,    -1,    -1,
      20,    21,    22,    23,    24,     6,     7,    -1,    -1,    -1,
      -1,    12,    -1,    -1,    -1,    -1,    17,    18,    19,    20,
      21,    22,    23,    24,     6,    -1,     8,    -1,    10,    -1,
      12,    -1,    -1,    -1,    -1,    17,    -1,    -1,    20,    21,
      22,    23,    24
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     6,     8,    10,    12,    16,    17,    20,
      21,    22,    23,    24,    27,    28,    29,    36,    38,    40,
      41,    42,    43,    44,    45,    48,    49,    51,    53,    55,
      56,    57,    58,    62,     3,     4,    37,    58,     8,    42,
       4,    14,    36,    39,    40,    11,    41,    63,    42,     0,
      17,    18,    19,    30,    32,    33,    34,    35,    39,    59,
      60,    61,    40,    13,    44,    45,    48,    57,    15,    46,
      50,    59,    52,    54,    60,    61,     5,    33,     4,    58,
       7,    58,    40,     4,    14,     9,    11,    13,     6,     7,
      17,    19,    60,    62,    64,     9,     3,    36,    40,    61,
      31,    58,    58,    16,    42,    47,    50,    52,    54,    15,
      61,    49,    55,    57,    58,    51,    56,     9,    36,    40,
      58,    63,    33,    40,    58,    32,    42,    47,    56,    40,
       9,     7,     9
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    26,    27,    27,    27,    28,    29,    29,    31,    30,
      30,    32,    32,    33,    33,    34,    34,    34,    35,    35,
      36,    36,    37,    37,    38,    38,    38,    38,    39,    39,
      40,    40,    40,    40,    40,    41,    41,    42,    42,    42,
      42,    42,    42,    43,    43,    44,    45,    46,    46,    47,
      47,    47,    48,    48,    48,    49,    50,    51,    52,    53,
      54,    54,    55,    55,    56,    56,    57,    57,    57,    57,
      57,    57,    58,    59,    60,    61,    62,    62,    62,    62,
      62,    62,    63,    63,    63,    63,    64,    64,    64
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     3,     3,     2,     1,     2,     0,     3,
       1,     1,     3,     2,     3,     1,     2,     1,     2,     3,
       2,     3,     1,     2,     3,     4,     5,     6,     2,     3,
       0,     2,     1,     2,     4,     1,     3,     1,     2,     1,
       2,     1,     2,     1,     2,     2,     2,     2,     3,     1,
       1,     1,     1,     1,     1,     2,     1,     2,     2,     2,
       2,     3,     1,     1,     1,     1,     1,     1,     1,     2,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     0,     2,     2,     4,     1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (context, YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value, context); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, void *context)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  YY_USE (context);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, void *context)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep, context);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule, void *context)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)], context);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule, context); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep, void *context)
{
  YY_USE (yyvaluep);
  YY_USE (context);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}






/*----------.
| yyparse.  |
`----------*/

int
yyparse (void *context)
{
/* Lookahead token kind.  */
int yychar;


/* The semantic value of the lookahead symbol.  */
/* Default value used for initialization, for pacifying older GCCs
   or non-GCC compilers.  */
YY_INITIAL_VALUE (static YYSTYPE yyval_default;)
YYSTYPE yylval YY_INITIAL_VALUE (= yyval_default);

    /* Number of syntax errors so far.  */
    int yynerrs = 0;

    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex (&yylval, context);
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
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
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* source: plain_code  */
#line 81 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1355 "STGrammar.m"
    break;

  case 3: /* source: TK_SEPARATOR TK_SEPARATOR method  */
#line 87 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1363 "STGrammar.m"
    break;

  case 5: /* script_open: TK_BLOCK_OPEN TK_BAR  */
#line 97 "STGrammar.y"
                            {
                                [COMPILER beginScript];
                            }
#line 1371 "STGrammar.m"
    break;

  case 6: /* plain_code: statements  */
#line 103 "STGrammar.y"
                            {
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
#line 1380 "STGrammar.m"
    break;

  case 7: /* plain_code: temporaries statements  */
#line 108 "STGrammar.y"
                            {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
#line 1390 "STGrammar.m"
    break;

  case 8: /* $@1: %empty  */
#line 117 "STGrammar.y"
                            {
                                [COMPILER setReceiverVariables:yyvsp[0]];
                            }
#line 1398 "STGrammar.m"
    break;

  case 11: /* method_list: method  */
#line 126 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1406 "STGrammar.m"
    break;

  case 12: /* method_list: method_list TK_SEPARATOR method  */
#line 130 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1414 "STGrammar.m"
    break;

  case 13: /* method: message_pattern statements  */
#line 136 "STGrammar.y"
                            {
                                yyval =  [STCMethod methodWithPattern:yyvsp[-1]
                                /**/                    statements:yyvsp[0]];
                            }
#line 1423 "STGrammar.m"
    break;

  case 14: /* method: message_pattern temporaries statements  */
#line 141 "STGrammar.y"
                            {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:yyvsp[-2]
                                /**/                    statements:yyvsp[0]];
                            }
#line 1433 "STGrammar.m"
    break;

  case 15: /* message_pattern: unary_selector  */
#line 150 "STGrammar.y"
                            {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            }
#line 1442 "STGrammar.m"
    break;

  case 16: /* message_pattern: binary_selector variable_name  */
#line 155 "STGrammar.y"
                            {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1451 "STGrammar.m"
    break;

  case 18: /* keyword_list: keyword variable_name  */
#line 163 "STGrammar.y"
                            {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1460 "STGrammar.m"
    break;

  case 19: /* keyword_list: keyword_list keyword variable_name  */
#line 168 "STGrammar.y"
                            {
                                [yyvsp[-2] addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = yyvsp[-2];
                            }
#line 1469 "STGrammar.m"
    break;

  case 20: /* temporaries: TK_BAR TK_BAR  */
#line 175 "STGrammar.y"
                            {
                                yyval = [NSMutableArray array];
                            }
#line 1477 "STGrammar.m"
    break;

  case 21: /* temporaries: TK_BAR variable_list TK_BAR  */
#line 179 "STGrammar.y"
                            {
                                yyval = yyvsp[-1];
                            }
#line 1485 "STGrammar.m"
    break;

  case 22: /* variable_list: variable_name  */
#line 185 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1494 "STGrammar.m"
    break;

  case 23: /* variable_list: variable_list variable_name  */
#line 190 "STGrammar.y"
                            { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1503 "STGrammar.m"
    break;

  case 24: /* block: TK_BLOCK_OPEN statements TK_BLOCK_CLOSE  */
#line 197 "STGrammar.y"
                            {
                                yyval = [STCBlock block];
                                [yyval setStatements:yyvsp[-1]];
                            }
#line 1512 "STGrammar.m"
    break;

  case 25: /* block: TK_BLOCK_OPEN temporaries statements TK_BLOCK_CLOSE  */
#line 202 "STGrammar.y"
                            {
                                [yyvsp[-1] setTemporaries:yyvsp[-2]];
                                yyval = [STCBlock block];
                                [yyval setStatements:yyvsp[-1]];
                            }
#line 1522 "STGrammar.m"
    break;

  case 26: /* block: TK_BLOCK_OPEN block_var_list TK_BAR statements TK_BLOCK_CLOSE  */
#line 208 "STGrammar.y"
                            {
                                yyval = [STCBlock block];
                                [yyval setArguments:yyvsp[-3]];
                                [yyval setStatements:yyvsp[-1]];
                            }
#line 1532 "STGrammar.m"
    break;

  case 27: /* block: TK_BLOCK_OPEN block_var_list TK_BAR temporaries statements TK_BLOCK_CLOSE  */
#line 214 "STGrammar.y"
                            {
                                [yyvsp[-1] setTemporaries:yyvsp[-2]];
                                yyval = [STCBlock block];
                                [yyval setArguments:yyvsp[-4]];
                                [yyval setStatements:yyvsp[-1]];
                            }
#line 1543 "STGrammar.m"
    break;

  case 28: /* block_var_list: TK_COLON variable_name  */
#line 222 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1552 "STGrammar.m"
    break;

  case 29: /* block_var_list: block_var_list TK_COLON variable_name  */
#line 227 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1561 "STGrammar.m"
    break;

  case 30: /* statements: %empty  */
#line 232 "STGrammar.y"
                            { yyval = [STCStatements statements]; }
#line 1567 "STGrammar.m"
    break;

  case 31: /* statements: TK_RETURN expression  */
#line 234 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                            }
#line 1576 "STGrammar.m"
    break;

  case 32: /* statements: expressions  */
#line 239 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[0]];
                            }
#line 1585 "STGrammar.m"
    break;

  case 33: /* statements: expressions TK_DOT  */
#line 245 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[-1]];
                            }
#line 1594 "STGrammar.m"
    break;

  case 34: /* statements: expressions TK_DOT TK_RETURN expression  */
#line 250 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                                [yyval setExpressions:yyvsp[-3]];
                            }
#line 1604 "STGrammar.m"
    break;

  case 35: /* expressions: expression  */
#line 258 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
#line 1613 "STGrammar.m"
    break;

  case 36: /* expressions: expressions TK_DOT expression  */
#line 264 "STGrammar.y"
                            {   
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1622 "STGrammar.m"
    break;

  case 37: /* expression: primary  */
#line 270 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                            }
#line 1631 "STGrammar.m"
    break;

  case 38: /* expression: assignments primary  */
#line 275 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1641 "STGrammar.m"
    break;

  case 40: /* expression: assignments message_expression  */
#line 282 "STGrammar.y"
                            { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1650 "STGrammar.m"
    break;

  case 42: /* expression: assignments cascade  */
#line 288 "STGrammar.y"
                            { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1659 "STGrammar.m"
    break;

  case 43: /* assignments: assignment  */
#line 294 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
#line 1668 "STGrammar.m"
    break;

  case 44: /* assignments: assignments assignment  */
#line 299 "STGrammar.y"
                            { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1677 "STGrammar.m"
    break;

  case 45: /* assignment: variable_name TK_ASSIGNMENT  */
#line 306 "STGrammar.y"
                            { yyval = yyvsp[-1];}
#line 1683 "STGrammar.m"
    break;

  case 46: /* cascade: message_expression messages  */
#line 309 "STGrammar.y"
                            { 
                                yyval = yyvsp[-1];
                                [yyval setCascade:yyvsp[0]]; 
                            }
#line 1692 "STGrammar.m"
    break;

  case 47: /* messages: TK_SEMICOLON message  */
#line 315 "STGrammar.y"
                            {
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1701 "STGrammar.m"
    break;

  case 48: /* messages: messages TK_SEMICOLON message  */
#line 320 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]];
                            }
#line 1710 "STGrammar.m"
    break;

  case 55: /* unary_expression: unary_object unary_message  */
#line 335 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:yyvsp[0]];
                            }
#line 1720 "STGrammar.m"
    break;

  case 56: /* unary_message: unary_selector  */
#line 342 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            }
#line 1729 "STGrammar.m"
    break;

  case 57: /* binary_expression: binary_object binary_message  */
#line 348 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:yyvsp[0]];
                            }
#line 1739 "STGrammar.m"
    break;

  case 58: /* binary_message: binary_selector unary_object  */
#line 355 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1748 "STGrammar.m"
    break;

  case 59: /* keyword_expression: binary_object keyword_message  */
#line 361 "STGrammar.y"
                            {
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:yyvsp[0]];
                            }
#line 1758 "STGrammar.m"
    break;

  case 60: /* keyword_message: keyword binary_object  */
#line 368 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1767 "STGrammar.m"
    break;

  case 61: /* keyword_message: keyword_message keyword binary_object  */
#line 373 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1776 "STGrammar.m"
    break;

  case 66: /* primary: variable_name  */
#line 385 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithVariable:yyvsp[0]];
                            }
#line 1784 "STGrammar.m"
    break;

  case 67: /* primary: literal  */
#line 389 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithLiteral:yyvsp[0]];
                            }
#line 1792 "STGrammar.m"
    break;

  case 68: /* primary: block  */
#line 393 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithBlock:yyvsp[0]];
                            }
#line 1800 "STGrammar.m"
    break;

  case 69: /* primary: TK_LCURLY TK_RCURLY  */
#line 397 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithArray:[NSArray array]];
                            }
#line 1808 "STGrammar.m"
    break;

  case 70: /* primary: TK_LCURLY expressions TK_RCURLY  */
#line 401 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithArray:yyvsp[-1]];
                            }
#line 1816 "STGrammar.m"
    break;

  case 71: /* primary: TK_LPAREN expression TK_RPAREN  */
#line 405 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithExpression:yyvsp[-1]];
                            }
#line 1824 "STGrammar.m"
    break;

  case 76: /* literal: TK_INTNUMBER  */
#line 419 "STGrammar.y"
                        { yyval = [COMPILER createIntNumberLiteralFrom:yyvsp[0]]; }
#line 1830 "STGrammar.m"
    break;

  case 77: /* literal: TK_REALNUMBER  */
#line 421 "STGrammar.y"
                        { yyval = [COMPILER createRealNumberLiteralFrom:yyvsp[0]]; }
#line 1836 "STGrammar.m"
    break;

  case 78: /* literal: TK_SYMBOL  */
#line 423 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1842 "STGrammar.m"
    break;

  case 79: /* literal: TK_STRING  */
#line 425 "STGrammar.y"
                        { yyval = [COMPILER createStringLiteralFrom:yyvsp[0]]; }
#line 1848 "STGrammar.m"
    break;

  case 80: /* literal: TK_CHARACTER  */
#line 427 "STGrammar.y"
                        { yyval = [COMPILER createCharacterLiteralFrom:yyvsp[0]]; }
#line 1854 "STGrammar.m"
    break;

  case 81: /* literal: TK_ARRAY_OPEN array TK_RPAREN  */
#line 429 "STGrammar.y"
                        { yyval = [COMPILER createArrayLiteralFrom:yyvsp[-1]]; }
#line 1860 "STGrammar.m"
    break;

  case 82: /* array: %empty  */
#line 431 "STGrammar.y"
                        { yyval = [NSMutableArray array]; }
#line 1866 "STGrammar.m"
    break;

  case 83: /* array: array literal  */
#line 432 "STGrammar.y"
                                 { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
#line 1872 "STGrammar.m"
    break;

  case 84: /* array: array symbol  */
#line 433 "STGrammar.y"
                                 { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
#line 1878 "STGrammar.m"
    break;

  case 85: /* array: array TK_LPAREN array TK_RPAREN  */
#line 435 "STGrammar.y"
                                 {
                                   yyval = yyvsp[-3];
                                   [yyval addObject:[COMPILER createArrayLiteralFrom:yyvsp[-1]]];
                                 }
#line 1887 "STGrammar.m"
    break;

  case 86: /* symbol: TK_IDENTIFIER  */
#line 441 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1893 "STGrammar.m"
    break;

  case 87: /* symbol: binary_selector  */
#line 443 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1899 "STGrammar.m"
    break;

  case 88: /* symbol: TK_KEYWORD  */
#line 445 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1905 "STGrammar.m"
    break;


#line 1909 "STGrammar.m"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (context, YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, context);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp, context);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (context, YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, context);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp, context);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 447 "STGrammar.y"


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

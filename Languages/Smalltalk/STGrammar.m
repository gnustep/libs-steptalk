/* A Bison parser, made by GNU Bison 3.7.5.  */

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
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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
#define YYBISON 30705

/* Bison version string.  */
#define YYBISON_VERSION "3.7.5"

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

#line 105 "STGrammar.m"

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
    TK_ARRAY_OPEN = 265,           /* TK_ARRAY_OPEN  */
    TK_DOT = 266,                  /* TK_DOT  */
    TK_COLON = 267,                /* TK_COLON  */
    TK_SEMICOLON = 268,            /* TK_SEMICOLON  */
    TK_RETURN = 269,               /* TK_RETURN  */
    TK_IDENTIFIER = 270,           /* TK_IDENTIFIER  */
    TK_BINARY_SELECTOR = 271,      /* TK_BINARY_SELECTOR  */
    TK_KEYWORD = 272,              /* TK_KEYWORD  */
    TK_INTNUMBER = 273,            /* TK_INTNUMBER  */
    TK_REALNUMBER = 274,           /* TK_REALNUMBER  */
    TK_SYMBOL = 275,               /* TK_SYMBOL  */
    TK_STRING = 276,               /* TK_STRING  */
    TK_CHARACTER = 277             /* TK_CHARACTER  */
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
  YYSYMBOL_TK_ARRAY_OPEN = 10,             /* TK_ARRAY_OPEN  */
  YYSYMBOL_TK_DOT = 11,                    /* TK_DOT  */
  YYSYMBOL_TK_COLON = 12,                  /* TK_COLON  */
  YYSYMBOL_TK_SEMICOLON = 13,              /* TK_SEMICOLON  */
  YYSYMBOL_TK_RETURN = 14,                 /* TK_RETURN  */
  YYSYMBOL_TK_IDENTIFIER = 15,             /* TK_IDENTIFIER  */
  YYSYMBOL_TK_BINARY_SELECTOR = 16,        /* TK_BINARY_SELECTOR  */
  YYSYMBOL_TK_KEYWORD = 17,                /* TK_KEYWORD  */
  YYSYMBOL_TK_INTNUMBER = 18,              /* TK_INTNUMBER  */
  YYSYMBOL_TK_REALNUMBER = 19,             /* TK_REALNUMBER  */
  YYSYMBOL_TK_SYMBOL = 20,                 /* TK_SYMBOL  */
  YYSYMBOL_TK_STRING = 21,                 /* TK_STRING  */
  YYSYMBOL_TK_CHARACTER = 22,              /* TK_CHARACTER  */
  YYSYMBOL_YYACCEPT = 23,                  /* $accept  */
  YYSYMBOL_source = 24,                    /* source  */
  YYSYMBOL_25_1 = 25,                      /* $@1  */
  YYSYMBOL_plain_code = 26,                /* plain_code  */
  YYSYMBOL_methods = 27,                   /* methods  */
  YYSYMBOL_28_2 = 28,                      /* $@2  */
  YYSYMBOL_method_list = 29,               /* method_list  */
  YYSYMBOL_method = 30,                    /* method  */
  YYSYMBOL_message_pattern = 31,           /* message_pattern  */
  YYSYMBOL_keyword_list = 32,              /* keyword_list  */
  YYSYMBOL_temporaries = 33,               /* temporaries  */
  YYSYMBOL_variable_list = 34,             /* variable_list  */
  YYSYMBOL_block = 35,                     /* block  */
  YYSYMBOL_block_var_list = 36,            /* block_var_list  */
  YYSYMBOL_statements = 37,                /* statements  */
  YYSYMBOL_expressions = 38,               /* expressions  */
  YYSYMBOL_expression = 39,                /* expression  */
  YYSYMBOL_assignments = 40,               /* assignments  */
  YYSYMBOL_assignment = 41,                /* assignment  */
  YYSYMBOL_cascade = 42,                   /* cascade  */
  YYSYMBOL_cascade_list = 43,              /* cascade_list  */
  YYSYMBOL_cascade_item = 44,              /* cascade_item  */
  YYSYMBOL_message_expression = 45,        /* message_expression  */
  YYSYMBOL_unary_expression = 46,          /* unary_expression  */
  YYSYMBOL_binary_expression = 47,         /* binary_expression  */
  YYSYMBOL_keyword_expression = 48,        /* keyword_expression  */
  YYSYMBOL_keyword_expr_list = 49,         /* keyword_expr_list  */
  YYSYMBOL_unary_object = 50,              /* unary_object  */
  YYSYMBOL_binary_object = 51,             /* binary_object  */
  YYSYMBOL_primary = 52,                   /* primary  */
  YYSYMBOL_variable_name = 53,             /* variable_name  */
  YYSYMBOL_unary_selector = 54,            /* unary_selector  */
  YYSYMBOL_binary_selector = 55,           /* binary_selector  */
  YYSYMBOL_keyword = 56,                   /* keyword  */
  YYSYMBOL_literal = 57,                   /* literal  */
  YYSYMBOL_array = 58,                     /* array  */
  YYSYMBOL_array_elements = 59,            /* array_elements  */
  YYSYMBOL_symbol = 60                     /* symbol  */
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
typedef yytype_int8 yy_state_t;

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

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
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
#define YYFINAL  52
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   247

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  23
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  38
/* YYNRULES -- Number of rules.  */
#define YYNRULES  85
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  122

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   277


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
      15,    16,    17,    18,    19,    20,    21,    22
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    69,    69,    74,    79,    86,    85,    93,    98,   108,
     107,   113,   116,   120,   126,   131,   140,   145,   150,   153,
     158,   165,   169,   175,   180,   187,   191,   195,   201,   206,
     213,   218,   224,   229,   238,   243,   249,   254,   260,   261,
     266,   267,   273,   278,   285,   288,   294,   299,   305,   310,
     315,   318,   319,   320,   322,   331,   340,   347,   352,   358,
     359,   361,   362,   364,   368,   372,   376,   381,   383,   385,
     387,   390,   392,   394,   396,   398,   400,   403,   404,   406,
     407,   408,   409,   411,   413,   415
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
  "TK_BLOCK_CLOSE", "TK_ARRAY_OPEN", "TK_DOT", "TK_COLON", "TK_SEMICOLON",
  "TK_RETURN", "TK_IDENTIFIER", "TK_BINARY_SELECTOR", "TK_KEYWORD",
  "TK_INTNUMBER", "TK_REALNUMBER", "TK_SYMBOL", "TK_STRING",
  "TK_CHARACTER", "$accept", "source", "$@1", "plain_code", "methods",
  "$@2", "method_list", "method", "message_pattern", "keyword_list",
  "temporaries", "variable_list", "block", "block_var_list", "statements",
  "expressions", "expression", "assignments", "assignment", "cascade",
  "cascade_list", "cascade_item", "message_expression", "unary_expression",
  "binary_expression", "keyword_expression", "keyword_expr_list",
  "unary_object", "binary_object", "primary", "variable_name",
  "unary_selector", "binary_selector", "keyword", "literal", "array",
  "array_elements", "symbol", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277
};
#endif

#define YYPACT_NINF (-62)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-63)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     106,    29,     9,   212,   125,   225,   212,   -62,   -62,   -62,
     -62,   -62,   -62,    18,   -62,   178,   -62,   -62,    26,   -62,
     212,   -62,   -62,    32,     0,    13,   -62,    38,    24,    11,
      51,   -62,    35,   -62,    10,   -62,   161,    54,   -62,   -62,
      47,     8,    57,   -62,   -62,   -62,   -62,   -62,    56,   225,
     -62,   -62,   -62,   -62,   195,   -62,   -62,    32,    11,    35,
      55,   -62,   -62,   -62,    52,   212,   212,   -62,   -62,   144,
      52,   -62,    47,    47,   -62,   -62,   -62,    43,   -62,   178,
      47,   -62,   -62,   -62,   -62,   212,   -62,   -62,    52,   -62,
     212,    35,   212,   -62,    38,   -62,   -62,   -62,    59,   178,
     -62,    47,   -62,   -62,    67,    75,   -62,    70,    76,   -62,
     -62,    38,   -62,    59,   -62,   -62,   -62,    35,    35,   -62,
     -62,    75
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,     0,     0,     0,     0,    77,     0,    67,    71,    72,
      73,    74,    75,     0,     3,     0,    65,     7,    31,    34,
       0,    42,    40,    38,    51,    52,    53,    61,     0,    36,
      63,    64,     0,    21,     0,    23,     0,     0,     5,    25,
       0,     0,     0,    83,    69,    85,    84,    79,     0,    78,
      80,    30,     1,     8,    32,    43,    41,    39,    37,     0,
      45,    68,    54,    70,    56,     0,     0,    44,     4,     0,
      18,    16,     0,     0,    22,    24,    66,     0,    28,     0,
       0,    26,    76,    81,    82,     0,    35,    46,    50,    48,
       0,     0,     0,    60,    55,    59,    63,    62,    57,     0,
      14,     0,    17,    19,     0,    11,    12,     9,     0,    29,
      33,    49,    47,    58,    15,    20,     6,     0,     0,    27,
      13,    10
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -62,   -62,   -62,   -62,   -62,   -62,   -34,   -30,   -62,   -62,
      21,   -62,   -62,    19,     4,   -62,     3,   -62,    72,    77,
     -62,     7,    79,   -44,   -61,   -62,    73,   -54,   -58,    15,
      -1,   -17,    -5,   -21,    -2,   -62,   -62,    46
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,    13,    77,    14,   104,   118,   105,   106,    69,    70,
      15,    34,    16,    41,    42,    18,    19,    20,    21,    22,
      60,    87,    23,    24,    25,    26,    88,    27,    28,    29,
      30,    71,    72,    73,    31,    48,    49,    50
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      46,    35,    68,    47,    17,    97,    37,    66,    98,    51,
      62,    94,    79,    33,    74,   -60,   -60,   -60,    52,    53,
      80,    93,    93,    65,     7,     7,   -59,   -59,   -59,   -62,
     -62,    97,    32,    75,   113,    58,   111,    54,    66,    78,
      44,    63,    89,    92,    46,    59,    93,    83,    93,   101,
      61,    44,    63,    61,    90,    40,    67,    86,    61,    44,
      63,    76,     7,    82,    96,    96,    81,    92,    91,    63,
      66,   102,   103,   100,    89,    44,   116,    62,   117,   109,
      95,    95,    80,   108,   121,   119,    90,   120,   110,    96,
      99,    96,    55,    65,    62,    84,   107,    56,   112,    57,
     115,    64,     0,   114,     0,    95,     0,    95,    65,     1,
       2,     0,     3,     0,     4,     0,     5,     0,     0,     0,
       6,     7,     0,     0,     8,     9,    10,    11,    12,    38,
       0,     3,     0,    36,    39,     5,     0,    40,     0,     6,
       7,     0,     0,     8,     9,    10,    11,    12,     2,     0,
       3,     0,    36,     0,     5,     0,     0,     0,     6,     7,
       0,     0,     8,     9,    10,    11,    12,     3,     0,    36,
      39,     5,     0,    40,     0,     6,     7,     0,     0,     8,
       9,    10,    11,    12,     3,     0,    36,     0,     5,     0,
       0,     0,     6,     7,     0,     0,     8,     9,    10,    11,
      12,     3,     0,    36,     0,     5,     0,     0,     0,    85,
       7,     0,     0,     8,     9,    10,    11,    12,     3,     0,
      36,     0,     5,     0,     0,     0,     0,     7,     0,     0,
       8,     9,    10,    11,    12,     5,     0,     0,     0,     0,
      43,    44,    45,     8,     9,    10,    11,    12
};

static const yytype_int8 yycheck[] =
{
       5,     2,    32,     5,     0,    66,     3,    28,    66,     6,
      27,    65,     4,     4,     4,    15,    16,    17,     0,    15,
      12,    65,    66,    28,    15,    15,    15,    16,    17,    16,
      17,    92,     3,    34,    92,    20,    90,    11,    59,    40,
      16,    17,    59,    64,    49,    13,    90,    49,    92,    70,
      15,    16,    17,    15,    59,    12,     5,    54,    15,    16,
      17,     7,    15,     7,    65,    66,     9,    88,    13,    17,
      91,    72,    73,    69,    91,    16,     9,    94,     3,    80,
      65,    66,    12,    79,   118,     9,    91,   117,    85,    90,
      69,    92,    20,    98,   111,    49,    77,    20,    91,    20,
     101,    28,    -1,    99,    -1,    90,    -1,    92,   113,     3,
       4,    -1,     6,    -1,     8,    -1,    10,    -1,    -1,    -1,
      14,    15,    -1,    -1,    18,    19,    20,    21,    22,     4,
      -1,     6,    -1,     8,     9,    10,    -1,    12,    -1,    14,
      15,    -1,    -1,    18,    19,    20,    21,    22,     4,    -1,
       6,    -1,     8,    -1,    10,    -1,    -1,    -1,    14,    15,
      -1,    -1,    18,    19,    20,    21,    22,     6,    -1,     8,
       9,    10,    -1,    12,    -1,    14,    15,    -1,    -1,    18,
      19,    20,    21,    22,     6,    -1,     8,    -1,    10,    -1,
      -1,    -1,    14,    15,    -1,    -1,    18,    19,    20,    21,
      22,     6,    -1,     8,    -1,    10,    -1,    -1,    -1,    14,
      15,    -1,    -1,    18,    19,    20,    21,    22,     6,    -1,
       8,    -1,    10,    -1,    -1,    -1,    -1,    15,    -1,    -1,
      18,    19,    20,    21,    22,    10,    -1,    -1,    -1,    -1,
      15,    16,    17,    18,    19,    20,    21,    22
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     6,     8,    10,    14,    15,    18,    19,
      20,    21,    22,    24,    26,    33,    35,    37,    38,    39,
      40,    41,    42,    45,    46,    47,    48,    50,    51,    52,
      53,    57,     3,     4,    34,    53,     8,    39,     4,     9,
      12,    36,    37,    15,    16,    17,    55,    57,    58,    59,
      60,    39,     0,    37,    11,    41,    42,    45,    52,    13,
      43,    15,    54,    17,    49,    55,    56,     5,    30,    31,
      32,    54,    55,    56,     4,    53,     7,    25,    53,     4,
      12,     9,     7,    57,    60,    14,    39,    44,    49,    54,
      55,    13,    56,    46,    50,    52,    53,    47,    51,    33,
      37,    56,    53,    53,    27,    29,    30,    36,    37,    53,
      39,    50,    44,    51,    37,    53,     9,     3,    28,     9,
      30,    29
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    23,    24,    24,    24,    25,    24,    26,    26,    28,
      27,    27,    29,    29,    30,    30,    31,    31,    31,    32,
      32,    33,    33,    34,    34,    35,    35,    35,    36,    36,
      37,    37,    37,    37,    38,    38,    39,    39,    39,    39,
      39,    39,    40,    40,    41,    42,    43,    43,    44,    44,
      44,    45,    45,    45,    46,    47,    48,    49,    49,    50,
      50,    51,    51,    52,    52,    52,    52,    53,    54,    55,
      56,    57,    57,    57,    57,    57,    57,    58,    58,    59,
      59,    59,    59,    60,    60,    60
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     1,     3,     0,     5,     1,     2,     0,
       3,     1,     1,     3,     2,     3,     1,     2,     1,     2,
       3,     2,     3,     1,     2,     2,     3,     5,     2,     3,
       2,     1,     2,     4,     1,     3,     1,     2,     1,     2,
       1,     2,     1,     2,     2,     2,     2,     3,     1,     2,
       1,     1,     1,     1,     2,     3,     2,     2,     3,     1,
       1,     1,     1,     1,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     3,     0,     1,     1,
       1,     2,     2,     1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


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

/* This macro is provided for backward compatibility. */
# ifndef YY_LOCATION_PRINT
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif


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
# ifdef YYPRINT
  if (yykind < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yykind], *yyvaluep);
# endif
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
    goto yyexhaustedlab;
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
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
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
  case 2: /* source: %empty  */
#line 69 "STGrammar.y"
                            { 
                                [COMPILER compileMethod:nil]; 
                            }
#line 1338 "STGrammar.m"
    break;

  case 3: /* source: plain_code  */
#line 74 "STGrammar.y"
                         {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1346 "STGrammar.m"
    break;

  case 4: /* source: TK_SEPARATOR TK_SEPARATOR method  */
#line 80 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1354 "STGrammar.m"
    break;

  case 5: /* $@1: %empty  */
#line 86 "STGrammar.y"
                            {
                                [COMPILER beginScript];
                            }
#line 1362 "STGrammar.m"
    break;

  case 7: /* plain_code: statements  */
#line 94 "STGrammar.y"
                            {
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
#line 1371 "STGrammar.m"
    break;

  case 8: /* plain_code: temporaries statements  */
#line 99 "STGrammar.y"
                            {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
#line 1381 "STGrammar.m"
    break;

  case 9: /* $@2: %empty  */
#line 108 "STGrammar.y"
                            {
                                [COMPILER setReceiverVariables:yyvsp[0]];
                            }
#line 1389 "STGrammar.m"
    break;

  case 12: /* method_list: method  */
#line 117 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1397 "STGrammar.m"
    break;

  case 13: /* method_list: method_list TK_SEPARATOR method  */
#line 121 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1405 "STGrammar.m"
    break;

  case 14: /* method: message_pattern statements  */
#line 127 "STGrammar.y"
                            {
                                yyval =  [STCMethod methodWithPattern:yyvsp[-1]
                                /**/                    statements:yyvsp[0]];
                            }
#line 1414 "STGrammar.m"
    break;

  case 15: /* method: message_pattern temporaries statements  */
#line 132 "STGrammar.y"
                            {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:yyvsp[-2]
                                /**/                    statements:yyvsp[0]];
                            }
#line 1424 "STGrammar.m"
    break;

  case 16: /* message_pattern: unary_selector  */
#line 141 "STGrammar.y"
                            {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            }
#line 1433 "STGrammar.m"
    break;

  case 17: /* message_pattern: binary_selector variable_name  */
#line 146 "STGrammar.y"
                            {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1442 "STGrammar.m"
    break;

  case 19: /* keyword_list: keyword variable_name  */
#line 154 "STGrammar.y"
                            {
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1451 "STGrammar.m"
    break;

  case 20: /* keyword_list: keyword_list keyword variable_name  */
#line 159 "STGrammar.y"
                            {
                                [yyvsp[-2] addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = yyvsp[-2];
                            }
#line 1460 "STGrammar.m"
    break;

  case 21: /* temporaries: TK_BAR TK_BAR  */
#line 166 "STGrammar.y"
                            {
                                yyval = [NSMutableArray array];
                            }
#line 1468 "STGrammar.m"
    break;

  case 22: /* temporaries: TK_BAR variable_list TK_BAR  */
#line 170 "STGrammar.y"
                            {
                                yyval = yyvsp[-1];
                            }
#line 1476 "STGrammar.m"
    break;

  case 23: /* variable_list: variable_name  */
#line 176 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1485 "STGrammar.m"
    break;

  case 24: /* variable_list: variable_list variable_name  */
#line 181 "STGrammar.y"
                            { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1494 "STGrammar.m"
    break;

  case 25: /* block: TK_BLOCK_OPEN TK_BLOCK_CLOSE  */
#line 188 "STGrammar.y"
                            {
                                yyval = [STCStatements statements];
                            }
#line 1502 "STGrammar.m"
    break;

  case 26: /* block: TK_BLOCK_OPEN statements TK_BLOCK_CLOSE  */
#line 192 "STGrammar.y"
                            {
                                yyval = yyvsp[-1];
                            }
#line 1510 "STGrammar.m"
    break;

  case 27: /* block: TK_BLOCK_OPEN block_var_list TK_BAR statements TK_BLOCK_CLOSE  */
#line 196 "STGrammar.y"
                            {
                                yyval = yyvsp[-1];
                                [yyval setTemporaries:yyvsp[-3]];
                            }
#line 1519 "STGrammar.m"
    break;

  case 28: /* block_var_list: TK_COLON variable_name  */
#line 202 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1528 "STGrammar.m"
    break;

  case 29: /* block_var_list: block_var_list TK_COLON variable_name  */
#line 207 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1537 "STGrammar.m"
    break;

  case 30: /* statements: TK_RETURN expression  */
#line 214 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                            }
#line 1546 "STGrammar.m"
    break;

  case 31: /* statements: expressions  */
#line 219 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[0]];
                            }
#line 1555 "STGrammar.m"
    break;

  case 32: /* statements: expressions TK_DOT  */
#line 225 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[-1]];
                            }
#line 1564 "STGrammar.m"
    break;

  case 33: /* statements: expressions TK_DOT TK_RETURN expression  */
#line 230 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                                [yyval setExpressions:yyvsp[-3]];
                            }
#line 1574 "STGrammar.m"
    break;

  case 34: /* expressions: expression  */
#line 238 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
#line 1583 "STGrammar.m"
    break;

  case 35: /* expressions: expressions TK_DOT expression  */
#line 244 "STGrammar.y"
                            {   
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1592 "STGrammar.m"
    break;

  case 36: /* expression: primary  */
#line 250 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                            }
#line 1601 "STGrammar.m"
    break;

  case 37: /* expression: assignments primary  */
#line 255 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1611 "STGrammar.m"
    break;

  case 39: /* expression: assignments message_expression  */
#line 262 "STGrammar.y"
                            { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1620 "STGrammar.m"
    break;

  case 41: /* expression: assignments cascade  */
#line 268 "STGrammar.y"
                            { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1629 "STGrammar.m"
    break;

  case 42: /* assignments: assignment  */
#line 274 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
#line 1638 "STGrammar.m"
    break;

  case 43: /* assignments: assignments assignment  */
#line 279 "STGrammar.y"
                            { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1647 "STGrammar.m"
    break;

  case 44: /* assignment: variable_name TK_ASSIGNMENT  */
#line 286 "STGrammar.y"
                            { yyval = yyvsp[-1];}
#line 1653 "STGrammar.m"
    break;

  case 45: /* cascade: message_expression cascade_list  */
#line 289 "STGrammar.y"
                            { 
                                /* FIXME: check if this is this OK */
                                [yyval setCascade:yyvsp[0]]; 
                            }
#line 1662 "STGrammar.m"
    break;

  case 46: /* cascade_list: TK_SEMICOLON cascade_item  */
#line 295 "STGrammar.y"
                            {
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1671 "STGrammar.m"
    break;

  case 47: /* cascade_list: cascade_list TK_SEMICOLON cascade_item  */
#line 300 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]];
                            }
#line 1680 "STGrammar.m"
    break;

  case 48: /* cascade_item: unary_selector  */
#line 306 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            }
#line 1689 "STGrammar.m"
    break;

  case 49: /* cascade_item: binary_selector unary_object  */
#line 311 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1698 "STGrammar.m"
    break;

  case 54: /* unary_expression: unary_object unary_selector  */
#line 323 "STGrammar.y"
                            { 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[0] object:nil];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:message];
                            }
#line 1710 "STGrammar.m"
    break;

  case 55: /* binary_expression: binary_object binary_selector unary_object  */
#line 332 "STGrammar.y"
                            { 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-2]
                                /**/        message:message];
                            }
#line 1722 "STGrammar.m"
    break;

  case 56: /* keyword_expression: binary_object keyword_expr_list  */
#line 341 "STGrammar.y"
                            {
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:yyvsp[0]];
                            }
#line 1732 "STGrammar.m"
    break;

  case 57: /* keyword_expr_list: keyword binary_object  */
#line 348 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1741 "STGrammar.m"
    break;

  case 58: /* keyword_expr_list: keyword_expr_list keyword binary_object  */
#line 353 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1750 "STGrammar.m"
    break;

  case 63: /* primary: variable_name  */
#line 365 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithVariable:yyvsp[0]];
                            }
#line 1758 "STGrammar.m"
    break;

  case 64: /* primary: literal  */
#line 369 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithLiteral:yyvsp[0]];
                            }
#line 1766 "STGrammar.m"
    break;

  case 65: /* primary: block  */
#line 373 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithBlock:yyvsp[0]];
                            }
#line 1774 "STGrammar.m"
    break;

  case 66: /* primary: TK_LPAREN expression TK_RPAREN  */
#line 377 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithExpression:yyvsp[-1]];
                            }
#line 1782 "STGrammar.m"
    break;

  case 71: /* literal: TK_INTNUMBER  */
#line 391 "STGrammar.y"
                        { yyval = [COMPILER createIntNumberLiteralFrom:yyvsp[0]]; }
#line 1788 "STGrammar.m"
    break;

  case 72: /* literal: TK_REALNUMBER  */
#line 393 "STGrammar.y"
                        { yyval = [COMPILER createRealNumberLiteralFrom:yyvsp[0]]; }
#line 1794 "STGrammar.m"
    break;

  case 73: /* literal: TK_SYMBOL  */
#line 395 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1800 "STGrammar.m"
    break;

  case 74: /* literal: TK_STRING  */
#line 397 "STGrammar.y"
                        { yyval = [COMPILER createStringLiteralFrom:yyvsp[0]]; }
#line 1806 "STGrammar.m"
    break;

  case 75: /* literal: TK_CHARACTER  */
#line 399 "STGrammar.y"
                        { yyval = [COMPILER createCharacterLiteralFrom:yyvsp[0]]; }
#line 1812 "STGrammar.m"
    break;

  case 76: /* literal: TK_ARRAY_OPEN array TK_RPAREN  */
#line 401 "STGrammar.y"
                        { yyval = [COMPILER createArrayLiteralFrom:yyvsp[-1]]; }
#line 1818 "STGrammar.m"
    break;

  case 77: /* array: %empty  */
#line 403 "STGrammar.y"
                        { yyval = [NSMutableArray array]; }
#line 1824 "STGrammar.m"
    break;

  case 79: /* array_elements: literal  */
#line 406 "STGrammar.y"
                                 { yyval = [NSMutableArray arrayWithObject:yyvsp[0]]; }
#line 1830 "STGrammar.m"
    break;

  case 80: /* array_elements: symbol  */
#line 407 "STGrammar.y"
                                 { yyval = [NSMutableArray arrayWithObject:yyvsp[0]]; }
#line 1836 "STGrammar.m"
    break;

  case 81: /* array_elements: array_elements literal  */
#line 408 "STGrammar.y"
                                 { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
#line 1842 "STGrammar.m"
    break;

  case 82: /* array_elements: array_elements symbol  */
#line 409 "STGrammar.y"
                                 { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
#line 1848 "STGrammar.m"
    break;

  case 83: /* symbol: TK_IDENTIFIER  */
#line 412 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1854 "STGrammar.m"
    break;

  case 84: /* symbol: binary_selector  */
#line 414 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1860 "STGrammar.m"
    break;

  case 85: /* symbol: TK_KEYWORD  */
#line 416 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1866 "STGrammar.m"
    break;


#line 1870 "STGrammar.m"

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
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (context, YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturn;
#endif


/*-------------------------------------------------------.
| yyreturn -- parsing is finished, clean up and return.  |
`-------------------------------------------------------*/
yyreturn:
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

#line 418 "STGrammar.y"


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

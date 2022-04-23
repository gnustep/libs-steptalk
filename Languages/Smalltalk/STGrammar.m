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
  YYSYMBOL_23_script_open_ = 23,           /* "script_open"  */
  YYSYMBOL_YYACCEPT = 24,                  /* $accept  */
  YYSYMBOL_source = 25,                    /* source  */
  YYSYMBOL_script_open = 26,               /* script_open  */
  YYSYMBOL_plain_code = 27,                /* plain_code  */
  YYSYMBOL_methods = 28,                   /* methods  */
  YYSYMBOL_29_1 = 29,                      /* $@1  */
  YYSYMBOL_method_list = 30,               /* method_list  */
  YYSYMBOL_method = 31,                    /* method  */
  YYSYMBOL_message_pattern = 32,           /* message_pattern  */
  YYSYMBOL_keyword_list = 33,              /* keyword_list  */
  YYSYMBOL_type = 34,                      /* type  */
  YYSYMBOL_pointer_type = 35,              /* pointer_type  */
  YYSYMBOL_base_type = 36,                 /* base_type  */
  YYSYMBOL_temporaries = 37,               /* temporaries  */
  YYSYMBOL_variable_list = 38,             /* variable_list  */
  YYSYMBOL_block = 39,                     /* block  */
  YYSYMBOL_block_var_list = 40,            /* block_var_list  */
  YYSYMBOL_block_code = 41,                /* block_code  */
  YYSYMBOL_statements = 42,                /* statements  */
  YYSYMBOL_expressions = 43,               /* expressions  */
  YYSYMBOL_expression = 44,                /* expression  */
  YYSYMBOL_assignments = 45,               /* assignments  */
  YYSYMBOL_assignment = 46,                /* assignment  */
  YYSYMBOL_cascade = 47,                   /* cascade  */
  YYSYMBOL_cascade_list = 48,              /* cascade_list  */
  YYSYMBOL_cascade_item = 49,              /* cascade_item  */
  YYSYMBOL_message_expression = 50,        /* message_expression  */
  YYSYMBOL_unary_expression = 51,          /* unary_expression  */
  YYSYMBOL_binary_expression = 52,         /* binary_expression  */
  YYSYMBOL_keyword_expression = 53,        /* keyword_expression  */
  YYSYMBOL_keyword_expr_list = 54,         /* keyword_expr_list  */
  YYSYMBOL_unary_object = 55,              /* unary_object  */
  YYSYMBOL_binary_object = 56,             /* binary_object  */
  YYSYMBOL_primary = 57,                   /* primary  */
  YYSYMBOL_variable_name = 58,             /* variable_name  */
  YYSYMBOL_unary_selector = 59,            /* unary_selector  */
  YYSYMBOL_binary_selector = 60,           /* binary_selector  */
  YYSYMBOL_keyword = 61,                   /* keyword  */
  YYSYMBOL_literal = 62,                   /* literal  */
  YYSYMBOL_array = 63,                     /* array  */
  YYSYMBOL_array_elements = 64,            /* array_elements  */
  YYSYMBOL_symbol = 65                     /* symbol  */
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
#define YYFINAL  55
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   233

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  24
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  42
/* YYNRULES -- Number of rules.  */
#define YYNRULES  95
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  137

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   278


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
      15,    16,    17,    18,    19,    20,    21,    22,    23
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    81,    81,    86,    91,    96,   101,   107,   112,   122,
     121,   127,   130,   134,   140,   145,   154,   160,   166,   173,
     178,   185,   187,   192,   194,   199,   200,   204,   208,   214,
     218,   224,   229,   236,   240,   245,   251,   256,   262,   266,
     272,   277,   283,   288,   297,   302,   308,   313,   319,   320,
     325,   326,   332,   337,   344,   347,   353,   358,   364,   369,
     374,   377,   378,   379,   381,   390,   399,   406,   411,   417,
     418,   420,   421,   423,   427,   431,   435,   440,   442,   444,
     446,   449,   451,   453,   455,   457,   459,   462,   463,   465,
     466,   467,   468,   470,   472,   474
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
  "TK_CHARACTER", "\"script_open\"", "$accept", "source", "script_open",
  "plain_code", "methods", "$@1", "method_list", "method",
  "message_pattern", "keyword_list", "type", "pointer_type", "base_type",
  "temporaries", "variable_list", "block", "block_var_list", "block_code",
  "statements", "expressions", "expression", "assignments", "assignment",
  "cascade", "cascade_list", "cascade_item", "message_expression",
  "unary_expression", "binary_expression", "keyword_expression",
  "keyword_expr_list", "unary_object", "binary_object", "primary",
  "variable_name", "unary_selector", "binary_selector", "keyword",
  "literal", "array", "array_elements", "symbol", YY_NULLPTR
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
     275,   276,   277,   278
};
#endif

#define YYPACT_NINF (-83)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-73)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     106,    21,    15,    69,   126,   211,    69,   -83,   -83,   -83,
     -83,   -83,   -83,    22,    23,   -83,   181,   -83,   -83,    25,
     -83,    69,   -83,   -83,    27,    37,    10,   -83,    41,    50,
      55,    33,   -83,    36,   -83,    17,   -83,   145,    51,    58,
     -83,    61,   181,    19,    76,   -83,   -83,   -83,   -83,   -83,
     -83,    71,   211,   -83,   -83,   -83,    78,    77,    92,   -83,
     164,    65,    84,   -83,   198,   -83,   -83,    27,    55,    65,
      85,   -83,   -83,   -83,    80,    69,    69,   -83,   -83,   -83,
     -83,   -83,   -83,   -83,   164,    61,   -83,   -83,   -83,   -83,
      87,    18,   -83,   -83,    36,   181,   -83,    80,   -83,    36,
      36,    36,    69,   -83,   -83,    80,   -83,    69,    65,    69,
     -83,    41,   -83,   -83,   -83,    90,    91,   -83,    88,   -83,
     -83,   -83,   -83,    36,    61,    61,    92,   -83,    41,   -83,
      90,   -83,   -83,    61,   -83,   -83,   -83
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,     0,     0,     0,     0,    87,     0,    77,    81,    82,
      83,    84,    85,     0,    21,     3,     0,    75,     7,    41,
      44,     0,    52,    50,    48,    61,    62,    63,    71,     0,
      46,    73,    74,    21,    29,     0,    31,     0,     0,     6,
      33,     0,     0,     0,     0,    38,    93,    79,    95,    94,
      89,     0,    88,    90,    40,     1,    25,     0,    11,    12,
       0,     0,     9,     8,    42,    53,    51,    49,    47,     0,
      55,    78,    64,    80,    66,     0,     0,    54,     4,    30,
      32,    76,    36,    39,     0,     0,    34,    86,    91,    92,
      26,     0,    23,     5,    21,     0,    14,    18,    16,    21,
      21,    21,     0,    45,    56,    60,    58,     0,     0,     0,
      70,    65,    69,    73,    72,    67,     0,    37,    27,    22,
      24,    13,    15,    21,     0,     0,    10,    43,    59,    57,
      68,    35,    28,     0,    17,    19,    20
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -83,   -83,   -83,   -83,   -83,   -83,     7,   -26,   -83,   -83,
     -82,   -83,   -83,     9,   -83,   -83,    97,    29,     4,   -83,
      -1,   -83,    94,    96,   -83,    11,   108,   -62,   -66,   -83,
      89,   -63,   -60,   -15,    -2,   -58,    -4,   -46,     3,   -83,
     -83,    81
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,    13,    14,    15,    57,   101,    58,    59,    60,    97,
      61,    91,    92,    42,    35,    17,    43,    44,    45,    19,
      20,    21,    22,    23,    70,   104,    24,    25,    26,    27,
     105,    28,    29,    30,    31,    72,    75,    76,    32,    51,
      52,    53
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      36,    49,    38,    98,    18,    54,    68,    78,    50,    16,
     114,   106,   111,   110,   110,   100,   115,   124,   125,    34,
      63,    79,    55,    84,    33,   119,   -72,   -72,   109,    56,
       7,    85,     7,    80,   120,    41,    64,    36,    77,    82,
      69,   133,    56,   114,   128,   110,    83,   110,    49,   130,
     106,   123,   -70,   -70,   -70,    88,    71,    99,    81,   109,
     112,   112,    34,   103,    96,   107,    47,    73,   121,    95,
     -69,   -69,   -69,   113,   113,     3,     7,    37,    87,     5,
      71,    47,    73,   117,     7,    86,    93,     8,     9,    10,
      11,    12,   112,    90,   112,    94,    85,    73,   108,   122,
     131,   127,   118,   132,   107,   113,    47,   113,   126,     1,
       2,    62,     3,   116,     4,    65,     5,    66,    74,   129,
       6,     7,   134,   135,     8,     9,    10,    11,    12,    67,
      39,   136,     3,    89,    37,    40,     5,     0,    41,     0,
       6,     7,     0,     0,     8,     9,    10,    11,    12,     2,
       0,     3,     0,    37,    40,     5,     0,    41,     0,     6,
       7,     0,     0,     8,     9,    10,    11,    12,     2,     0,
       3,     0,    37,     0,     5,     0,     0,     0,     6,     7,
       0,     0,     8,     9,    10,    11,    12,     3,     0,    37,
       0,     5,     0,     0,     0,     6,     7,     0,     0,     8,
       9,    10,    11,    12,     3,     0,    37,     0,     5,     0,
       0,     0,   102,     7,     0,     0,     8,     9,    10,    11,
      12,     5,     0,     0,     0,     0,    46,    47,    48,     8,
       9,    10,    11,    12
};

static const yytype_int16 yycheck[] =
{
       2,     5,     3,    61,     0,     6,    21,    33,     5,     0,
      76,    69,    75,    75,    76,    61,    76,    99,   100,     4,
      16,     4,     0,     4,     3,     7,    16,    17,    74,     6,
      15,    12,    15,    35,    16,    12,    11,    39,     5,    41,
      13,   123,     6,   109,   107,   107,    42,   109,    52,   109,
     108,    97,    15,    16,    17,    52,    15,    61,     7,   105,
      75,    76,     4,    64,    60,    69,    16,    17,    94,    60,
      15,    16,    17,    75,    76,     6,    15,     8,     7,    10,
      15,    16,    17,    85,    15,     9,     9,    18,    19,    20,
      21,    22,   107,    15,   109,     3,    12,    17,    13,    95,
       9,   102,    15,    15,   108,   107,    16,   109,   101,     3,
       4,    14,     6,    84,     8,    21,    10,    21,    29,   108,
      14,    15,   124,   125,    18,    19,    20,    21,    22,    21,
       4,   133,     6,    52,     8,     9,    10,    -1,    12,    -1,
      14,    15,    -1,    -1,    18,    19,    20,    21,    22,     4,
      -1,     6,    -1,     8,     9,    10,    -1,    12,    -1,    14,
      15,    -1,    -1,    18,    19,    20,    21,    22,     4,    -1,
       6,    -1,     8,    -1,    10,    -1,    -1,    -1,    14,    15,
      -1,    -1,    18,    19,    20,    21,    22,     6,    -1,     8,
      -1,    10,    -1,    -1,    -1,    14,    15,    -1,    -1,    18,
      19,    20,    21,    22,     6,    -1,     8,    -1,    10,    -1,
      -1,    -1,    14,    15,    -1,    -1,    18,    19,    20,    21,
      22,    10,    -1,    -1,    -1,    -1,    15,    16,    17,    18,
      19,    20,    21,    22
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     6,     8,    10,    14,    15,    18,    19,
      20,    21,    22,    25,    26,    27,    37,    39,    42,    43,
      44,    45,    46,    47,    50,    51,    52,    53,    55,    56,
      57,    58,    62,     3,     4,    38,    58,     8,    44,     4,
       9,    12,    37,    40,    41,    42,    15,    16,    17,    60,
      62,    63,    64,    65,    44,     0,     6,    28,    30,    31,
      32,    34,    40,    42,    11,    46,    47,    50,    57,    13,
      48,    15,    59,    17,    54,    60,    61,     5,    31,     4,
      58,     7,    58,    42,     4,    12,     9,     7,    62,    65,
      15,    35,    36,     9,     3,    37,    42,    33,    59,    60,
      61,    29,    14,    44,    49,    54,    59,    60,    13,    61,
      51,    55,    57,    58,    52,    56,    41,    58,    15,     7,
      16,    31,    42,    61,    34,    34,    30,    44,    55,    49,
      56,     9,    15,    34,    58,    58,    58
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    24,    25,    25,    25,    25,    26,    27,    27,    29,
      28,    28,    30,    30,    31,    31,    32,    32,    32,    33,
      33,    34,    34,    35,    35,    36,    36,    36,    36,    37,
      37,    38,    38,    39,    39,    39,    40,    40,    41,    41,
      42,    42,    42,    42,    43,    43,    44,    44,    44,    44,
      44,    44,    45,    45,    46,    47,    48,    48,    49,    49,
      49,    50,    50,    50,    51,    52,    53,    54,    54,    55,
      55,    56,    56,    57,    57,    57,    57,    58,    59,    60,
      61,    62,    62,    62,    62,    62,    62,    63,    63,    64,
      64,    64,    64,    65,    65,    65
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     1,     3,     3,     2,     1,     2,     0,
       3,     1,     1,     3,     2,     3,     2,     4,     2,     3,
       4,     0,     3,     1,     2,     0,     1,     2,     3,     2,
       3,     1,     2,     2,     3,     5,     2,     3,     1,     2,
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
#line 81 "STGrammar.y"
                            { 
                                [COMPILER compileMethod:nil]; 
                            }
#line 1350 "STGrammar.m"
    break;

  case 3: /* source: plain_code  */
#line 86 "STGrammar.y"
                         {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1358 "STGrammar.m"
    break;

  case 4: /* source: TK_SEPARATOR TK_SEPARATOR method  */
#line 92 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1366 "STGrammar.m"
    break;

  case 6: /* script_open: TK_BLOCK_OPEN TK_BAR  */
#line 102 "STGrammar.y"
                            {
                                [COMPILER beginScript];
                            }
#line 1374 "STGrammar.m"
    break;

  case 7: /* plain_code: statements  */
#line 108 "STGrammar.y"
                            {
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
#line 1383 "STGrammar.m"
    break;

  case 8: /* plain_code: temporaries statements  */
#line 113 "STGrammar.y"
                            {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:nil
                                /**/                    statements:yyvsp[0]];
                            }
#line 1393 "STGrammar.m"
    break;

  case 9: /* $@1: %empty  */
#line 122 "STGrammar.y"
                            {
                                [COMPILER setReceiverVariables:yyvsp[0]];
                            }
#line 1401 "STGrammar.m"
    break;

  case 12: /* method_list: method  */
#line 131 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1409 "STGrammar.m"
    break;

  case 13: /* method_list: method_list TK_SEPARATOR method  */
#line 135 "STGrammar.y"
                            {
                                [COMPILER compileMethod:yyvsp[0]];
                            }
#line 1417 "STGrammar.m"
    break;

  case 14: /* method: message_pattern statements  */
#line 141 "STGrammar.y"
                            {
                                yyval =  [STCMethod methodWithPattern:yyvsp[-1]
                                /**/                    statements:yyvsp[0]];
                            }
#line 1426 "STGrammar.m"
    break;

  case 15: /* method: message_pattern temporaries statements  */
#line 146 "STGrammar.y"
                            {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval =  [STCMethod methodWithPattern:yyvsp[-2]
                                /**/                    statements:yyvsp[0]];
                            }
#line 1436 "STGrammar.m"
    break;

  case 16: /* message_pattern: type unary_selector  */
#line 155 "STGrammar.y"
                            {
                                yyval = [STCTypedMessage message];
                                [yyval setReturnType:yyvsp[-1]];
                                [yyval addKeyword:yyvsp[0] type:nil object:nil];
                            }
#line 1446 "STGrammar.m"
    break;

  case 17: /* message_pattern: type binary_selector type variable_name  */
#line 161 "STGrammar.y"
                            {
                                yyval = [STCTypedMessage message];
                                [yyval setReturnType:yyvsp[-3]];
                                [yyval addKeyword:yyvsp[-2] type:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1456 "STGrammar.m"
    break;

  case 18: /* message_pattern: type keyword_list  */
#line 167 "STGrammar.y"
                            {
                                yyval = yyvsp[0];
                                [yyval setReturnType:yyvsp[-1]];
                            }
#line 1465 "STGrammar.m"
    break;

  case 19: /* keyword_list: keyword type variable_name  */
#line 174 "STGrammar.y"
                            {
                                yyval = [STCTypedMessage message];
                                [yyval addKeyword:yyvsp[-2] type:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1474 "STGrammar.m"
    break;

  case 20: /* keyword_list: keyword_list keyword type variable_name  */
#line 179 "STGrammar.y"
                            {
                                [yyvsp[-3] addKeyword:yyvsp[-2] type:yyvsp[-1] object:yyvsp[0]];
                                yyval = yyvsp[-3];
                            }
#line 1483 "STGrammar.m"
    break;

  case 21: /* type: %empty  */
#line 185 "STGrammar.y"
                  { yyval = nil; }
#line 1489 "STGrammar.m"
    break;

  case 22: /* type: TK_LPAREN pointer_type TK_RPAREN  */
#line 188 "STGrammar.y"
                            {
                                yyval = yyvsp[-1];
                            }
#line 1497 "STGrammar.m"
    break;

  case 24: /* pointer_type: pointer_type TK_BINARY_SELECTOR  */
#line 195 "STGrammar.y"
                            {
                                yyval = [STCTypedMessage objCType:yyvsp[-1] withPointer:yyvsp[0]];
                            }
#line 1505 "STGrammar.m"
    break;

  case 26: /* base_type: TK_IDENTIFIER  */
#line 201 "STGrammar.y"
                            {
                                yyval = [STCTypedMessage objCType:yyvsp[0], nil];
                            }
#line 1513 "STGrammar.m"
    break;

  case 27: /* base_type: TK_IDENTIFIER TK_IDENTIFIER  */
#line 205 "STGrammar.y"
                            {
                                yyval = [STCTypedMessage objCType:yyvsp[-1], yyvsp[0], nil];
                            }
#line 1521 "STGrammar.m"
    break;

  case 28: /* base_type: TK_IDENTIFIER TK_IDENTIFIER TK_IDENTIFIER  */
#line 209 "STGrammar.y"
                            {
                                yyval = [STCTypedMessage objCType:yyvsp[-2], yyvsp[-1], yyvsp[0], nil];
                            }
#line 1529 "STGrammar.m"
    break;

  case 29: /* temporaries: TK_BAR TK_BAR  */
#line 215 "STGrammar.y"
                            {
                                yyval = [NSMutableArray array];
                            }
#line 1537 "STGrammar.m"
    break;

  case 30: /* temporaries: TK_BAR variable_list TK_BAR  */
#line 219 "STGrammar.y"
                            {
                                yyval = yyvsp[-1];
                            }
#line 1545 "STGrammar.m"
    break;

  case 31: /* variable_list: variable_name  */
#line 225 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1554 "STGrammar.m"
    break;

  case 32: /* variable_list: variable_list variable_name  */
#line 230 "STGrammar.y"
                            { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1563 "STGrammar.m"
    break;

  case 33: /* block: TK_BLOCK_OPEN TK_BLOCK_CLOSE  */
#line 237 "STGrammar.y"
                            {
                                yyval = [STCStatements statements];
                            }
#line 1571 "STGrammar.m"
    break;

  case 34: /* block: TK_BLOCK_OPEN block_code TK_BLOCK_CLOSE  */
#line 241 "STGrammar.y"
                            {
                                yyval = [STCBlock blockWithArguments:nil
                                /**/                   statements:yyvsp[-1]];
                            }
#line 1580 "STGrammar.m"
    break;

  case 35: /* block: TK_BLOCK_OPEN block_var_list TK_BAR block_code TK_BLOCK_CLOSE  */
#line 246 "STGrammar.y"
                            {
                                yyval = [STCBlock blockWithArguments:yyvsp[-3]
                                /**/                   statements:yyvsp[-1]];
                            }
#line 1589 "STGrammar.m"
    break;

  case 36: /* block_var_list: TK_COLON variable_name  */
#line 252 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1598 "STGrammar.m"
    break;

  case 37: /* block_var_list: block_var_list TK_COLON variable_name  */
#line 257 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1607 "STGrammar.m"
    break;

  case 38: /* block_code: statements  */
#line 263 "STGrammar.y"
                            {
                                yyval = yyvsp[0];
                            }
#line 1615 "STGrammar.m"
    break;

  case 39: /* block_code: temporaries statements  */
#line 267 "STGrammar.y"
                            {
                                [yyvsp[0] setTemporaries:yyvsp[-1]];
                                yyval = yyvsp[0];
                            }
#line 1624 "STGrammar.m"
    break;

  case 40: /* statements: TK_RETURN expression  */
#line 273 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                            }
#line 1633 "STGrammar.m"
    break;

  case 41: /* statements: expressions  */
#line 278 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[0]];
                            }
#line 1642 "STGrammar.m"
    break;

  case 42: /* statements: expressions TK_DOT  */
#line 284 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setExpressions:yyvsp[-1]];
                            }
#line 1651 "STGrammar.m"
    break;

  case 43: /* statements: expressions TK_DOT TK_RETURN expression  */
#line 289 "STGrammar.y"
                            { 
                                yyval = [STCStatements statements];
                                [yyval setReturnExpression:yyvsp[0]];
                                [yyval setExpressions:yyvsp[-3]];
                            }
#line 1661 "STGrammar.m"
    break;

  case 44: /* expressions: expression  */
#line 297 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
#line 1670 "STGrammar.m"
    break;

  case 45: /* expressions: expressions TK_DOT expression  */
#line 303 "STGrammar.y"
                            {   
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1679 "STGrammar.m"
    break;

  case 46: /* expression: primary  */
#line 309 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                            }
#line 1688 "STGrammar.m"
    break;

  case 47: /* expression: assignments primary  */
#line 314 "STGrammar.y"
                            { 
                                yyval = [STCExpression 
                                /**/          primaryExpressionWithObject:yyvsp[0]];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1698 "STGrammar.m"
    break;

  case 49: /* expression: assignments message_expression  */
#line 321 "STGrammar.y"
                            { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1707 "STGrammar.m"
    break;

  case 51: /* expression: assignments cascade  */
#line 327 "STGrammar.y"
                            { 
                                yyval = yyvsp[0];
                                [yyval setAssignments:yyvsp[-1]];
                            }
#line 1716 "STGrammar.m"
    break;

  case 52: /* assignments: assignment  */
#line 333 "STGrammar.y"
                            { 
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]];
                            }
#line 1725 "STGrammar.m"
    break;

  case 53: /* assignments: assignments assignment  */
#line 338 "STGrammar.y"
                            { 
                                yyval = yyvsp[-1]; 
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1734 "STGrammar.m"
    break;

  case 54: /* assignment: variable_name TK_ASSIGNMENT  */
#line 345 "STGrammar.y"
                            { yyval = yyvsp[-1];}
#line 1740 "STGrammar.m"
    break;

  case 55: /* cascade: message_expression cascade_list  */
#line 348 "STGrammar.y"
                            { 
                                /* FIXME: check if this is this OK */
                                [yyval setCascade:yyvsp[0]]; 
                            }
#line 1749 "STGrammar.m"
    break;

  case 56: /* cascade_list: TK_SEMICOLON cascade_item  */
#line 354 "STGrammar.y"
                            {
                                yyval = [NSMutableArray array];
                                [yyval addObject:yyvsp[0]]; 
                            }
#line 1758 "STGrammar.m"
    break;

  case 57: /* cascade_list: cascade_list TK_SEMICOLON cascade_item  */
#line 359 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2]; 
                                [yyval addObject:yyvsp[0]];
                            }
#line 1767 "STGrammar.m"
    break;

  case 58: /* cascade_item: unary_selector  */
#line 365 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[0] object:nil];
                            }
#line 1776 "STGrammar.m"
    break;

  case 59: /* cascade_item: binary_selector unary_object  */
#line 370 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1785 "STGrammar.m"
    break;

  case 64: /* unary_expression: unary_object unary_selector  */
#line 382 "STGrammar.y"
                            { 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[0] object:nil];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:message];
                            }
#line 1797 "STGrammar.m"
    break;

  case 65: /* binary_expression: binary_object binary_selector unary_object  */
#line 391 "STGrammar.y"
                            { 
                                STCMessage *message = [STCMessage message];
                                [message addKeyword:yyvsp[-1] object:yyvsp[0]];
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-2]
                                /**/        message:message];
                            }
#line 1809 "STGrammar.m"
    break;

  case 66: /* keyword_expression: binary_object keyword_expr_list  */
#line 400 "STGrammar.y"
                            {
                                yyval = [STCExpression 
                                /**/        messageExpressionWithTarget:yyvsp[-1]
                                /**/        message:yyvsp[0]];
                            }
#line 1819 "STGrammar.m"
    break;

  case 67: /* keyword_expr_list: keyword binary_object  */
#line 407 "STGrammar.y"
                            { 
                                yyval = [STCMessage message];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1828 "STGrammar.m"
    break;

  case 68: /* keyword_expr_list: keyword_expr_list keyword binary_object  */
#line 412 "STGrammar.y"
                            { 
                                yyval = yyvsp[-2];
                                [yyval addKeyword:yyvsp[-1] object:yyvsp[0]];
                            }
#line 1837 "STGrammar.m"
    break;

  case 73: /* primary: variable_name  */
#line 424 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithVariable:yyvsp[0]];
                            }
#line 1845 "STGrammar.m"
    break;

  case 74: /* primary: literal  */
#line 428 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithLiteral:yyvsp[0]];
                            }
#line 1853 "STGrammar.m"
    break;

  case 75: /* primary: block  */
#line 432 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithBlock:yyvsp[0]];
                            }
#line 1861 "STGrammar.m"
    break;

  case 76: /* primary: TK_LPAREN expression TK_RPAREN  */
#line 436 "STGrammar.y"
                            {
                                yyval = [STCPrimary primaryWithExpression:yyvsp[-1]];
                            }
#line 1869 "STGrammar.m"
    break;

  case 81: /* literal: TK_INTNUMBER  */
#line 450 "STGrammar.y"
                        { yyval = [COMPILER createIntNumberLiteralFrom:yyvsp[0]]; }
#line 1875 "STGrammar.m"
    break;

  case 82: /* literal: TK_REALNUMBER  */
#line 452 "STGrammar.y"
                        { yyval = [COMPILER createRealNumberLiteralFrom:yyvsp[0]]; }
#line 1881 "STGrammar.m"
    break;

  case 83: /* literal: TK_SYMBOL  */
#line 454 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1887 "STGrammar.m"
    break;

  case 84: /* literal: TK_STRING  */
#line 456 "STGrammar.y"
                        { yyval = [COMPILER createStringLiteralFrom:yyvsp[0]]; }
#line 1893 "STGrammar.m"
    break;

  case 85: /* literal: TK_CHARACTER  */
#line 458 "STGrammar.y"
                        { yyval = [COMPILER createCharacterLiteralFrom:yyvsp[0]]; }
#line 1899 "STGrammar.m"
    break;

  case 86: /* literal: TK_ARRAY_OPEN array TK_RPAREN  */
#line 460 "STGrammar.y"
                        { yyval = [COMPILER createArrayLiteralFrom:yyvsp[-1]]; }
#line 1905 "STGrammar.m"
    break;

  case 87: /* array: %empty  */
#line 462 "STGrammar.y"
                        { yyval = [NSMutableArray array]; }
#line 1911 "STGrammar.m"
    break;

  case 89: /* array_elements: literal  */
#line 465 "STGrammar.y"
                                 { yyval = [NSMutableArray arrayWithObject:yyvsp[0]]; }
#line 1917 "STGrammar.m"
    break;

  case 90: /* array_elements: symbol  */
#line 466 "STGrammar.y"
                                 { yyval = [NSMutableArray arrayWithObject:yyvsp[0]]; }
#line 1923 "STGrammar.m"
    break;

  case 91: /* array_elements: array_elements literal  */
#line 467 "STGrammar.y"
                                 { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
#line 1929 "STGrammar.m"
    break;

  case 92: /* array_elements: array_elements symbol  */
#line 468 "STGrammar.y"
                                 { yyval = yyvsp[-1]; [yyval addObject:yyvsp[0]]; }
#line 1935 "STGrammar.m"
    break;

  case 93: /* symbol: TK_IDENTIFIER  */
#line 471 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1941 "STGrammar.m"
    break;

  case 94: /* symbol: binary_selector  */
#line 473 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1947 "STGrammar.m"
    break;

  case 95: /* symbol: TK_KEYWORD  */
#line 475 "STGrammar.y"
                        { yyval = [COMPILER createSymbolLiteralFrom:yyvsp[0]]; }
#line 1953 "STGrammar.m"
    break;


#line 1957 "STGrammar.m"

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

#line 477 "STGrammar.y"


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


/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     VAR = 258,
     STR = 259,
     NUM = 260,
     MAIN = 261,
     IF = 262,
     ELSE = 263,
     ELIF = 264,
     TO = 265,
     FOR = 266,
     INT = 267,
     DOUBLE = 268,
     FLOAT = 269,
     CHAR = 270,
     DO = 271,
     WHILE = 272,
     HEADER = 273,
     ID = 274,
     VD = 275,
     LN = 276,
     TAN = 277,
     SIN = 278,
     COS = 279,
     UP = 280,
     UM = 281,
     GT = 282,
     GE = 283,
     LT = 284,
     LE = 285,
     MIN = 286,
     PLUS = 287,
     MUL = 288,
     DIV = 289,
     AND = 290,
     OR = 291,
     NOT = 292,
     EQ = 293,
     NQ = 294,
     CASE = 295,
     DEFAULT = 296,
     STRNG = 297,
     SHOW = 298,
     INPUT = 299,
     SWITCH = 300,
     STRNGG = 301,
     PRIME = 302,
     RET = 303,
     FACTORIAL = 304,
     GCD = 305,
     TUT = 306,
     FUNC = 307
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 23 "program.y"

	int number;
        char *string;



/* Line 1676 of yacc.c  */
#line 111 "program.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;



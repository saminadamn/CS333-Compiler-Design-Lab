# CS333-Compiler-Design-Lab
This repository contains programs and experiments performed as part of the Compiler Design Lab. It includes implementations using Lex and Yacc for lexical analysis, parsing, syntax-directed translation, intermediate code generation, backpatching, and control flow handling.

---

# Overview

This lab repository contains programs and experiments covering fundamental compiler construction concepts through hands-on implementation. The work focuses on building lexical analyzers, parsers, syntax-directed translators, and intermediate code generators using industry-standard compiler construction tools.

The repository includes implementations for:

* Lexical Analysis
* Token Recognition
* Parsing Techniques
* Syntax Directed Translation (SDT)
* Intermediate Code Generation
* Backpatching
* Control Flow Statements
* Boolean Expression Handling
* Operator Precedence and Associativity
* Loop Constructs
* Semantic Value Passing using `yylval`
* Dynamic Memory Allocation
* Linked List Handling for Jump Resolution

---

# Technologies Used

* C Programming Language
* Lex / Flex
* Yacc / Bison
* GCC Compiler
* Linux Terminal

---

# Repository Structure

```text
.
├── Lex Programs
│   ├── Token identification
│   ├── Keyword recognition
│   ├── Identifier validation
│   ├── Number recognition
│   └── Expression handling
│
├── Yacc Programs
│   ├── Arithmetic expression parser
│   ├── Operator precedence parser
│   ├── Boolean expression parser
│   ├── If-Else grammar
│   ├── While loop grammar
│   ├── Do-While loop grammar
│   └── Syntax validation
│
├── Intermediate Code Generation
│   ├── Three Address Code
│   ├── Temporary variable generation
│   ├── Label generation
│   ├── Goto statements
│   └── Control flow handling
│
├── Backpatching
│   ├── True list
│   ├── False list
│   ├── Merge list
│   └── Jump resolution
│
├── Supporting Files
│   ├── y.tab.c
│   ├── y.tab.h
│   ├── lex.yy.c
│   ├── input.txt
│   └── output files
│
└── Documentation
    └── Experiment descriptions
```

---

# Concepts Implemented

## 1. Lexical Analysis

Implemented lexical analyzers using Lex/Flex to identify:

* Keywords
* Identifiers
* Operators
* Constants
* Special symbols
* Boolean literals

Concepts used:

* Regular Expressions
* Token generation
* `yytext`
* `yylval`

---

## 2. Syntax Analysis

Implemented parsers using Yacc/Bison for validating grammar structures.

Features:

* Expression parsing
* Shift-reduce parsing
* Grammar rule handling
* Syntax checking
* Error handling

Important concepts:

* `%token`
* `%union`
* `%type`
* Semantic actions
* Operator precedence
* Associativity correction

---

## 3. Syntax Directed Translation (SDT)

Implemented semantic actions within grammar rules to perform translation during parsing.

Implemented using:

```c
$$ = $1 + $3;
```

Applications:

* Expression evaluation
* Intermediate code generation
* Semantic value propagation

---

## 4. Intermediate Code Generation

Generated Three Address Code (TAC) for arithmetic and control flow expressions.

Examples:

```text
T1 = a + b
if T1 < c goto L1
goto L2
```

Concepts covered:

* Temporary variables
* Labels
* Conditional jumps
* Unconditional jumps
* Control flow graphs

---

## 5. Backpatching

Implemented backpatching for resolving forward jumps in boolean expressions and loops.

Data structures used:

```c
struct list {
    int index;
    struct list* next;
};
```

Functions implemented:

* `makelist()`
* `merge()`
* `backpatch()`

Lists maintained:

* `truelist`
* `falselist`
* `nextlist`

---

## 6. Control Flow Statements

Implemented grammar and intermediate code generation for:

* If
* If-Else
* While
* Do-While

Control flow handled using:

* Labels
* Goto instructions
* Backpatching

---

## 7. Memory Management

Dynamic memory allocation implemented using:

```c
malloc()
```

Purpose:

* Linked list creation
* Dynamic node allocation
* Runtime memory handling

String handling implemented using:

```c
strdup()
```

---

# Compilation Steps

## Step 1: Generate parser

```bash
yacc -d filename.y
```

## Step 2: Generate lexical analyzer

```bash
lex filename.l
```

## Step 3: Compile

```bash
gcc lex.yy.c y.tab.c -ll
```

## Step 4: Run

```bash
./a.out
```

---

# Useful Yacc Flags

| Flag  | Purpose                       |
| ----- | ----------------------------- |
| `-d`  | Generates `y.tab.h`           |
| `-v`  | Generates parser state file   |
| `-t`  | Enables debugging             |
| `-dt` | Header generation + debugging |

---

# Key Learning Outcomes

Through these experiments, the following concepts were understood practically:

* Working of lexical analyzers
* Parser generation using context-free grammars
* Semantic value handling
* Compiler front-end implementation
* Intermediate code generation techniques
* Backpatching and jump resolution
* Control flow implementation
* Dynamic memory allocation in compiler construction
* Parser conflict resolution using precedence and associativity

---

# Sample Topics Covered in Viva

* Difference between token and type
* Use of `yylval`
* Use of `%union`
* Purpose of `malloc`
* Communication between Lex and Yacc
* Backpatching
* `strdup()` usage
* Shift-reduce conflicts
* True list and false list
* Operator precedence and associativity
* Control flow diagrams

---

# Author

Samina Parveen
B.Tech CSE
BIT Mesra

---

# Acknowledgement

This repository was developed as part of the Compiler Design Laboratory coursework to understand the internal working of compiler front-end phases through practical implementation using Lex and Yacc.

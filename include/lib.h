#ifndef LIB_H
#define LIB_H

#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// #define DEBUG
#define bool char
#define true 1
#define false 0
typedef char* string;
typedef size_t* pointer;
#define ALIGN_SIZE sizeof(size_t)

#if defined(_WIN32) || defined(_WIN64) || defined(__CYGWIN__)
#ifdef _MSC_VER
#define PLATFORM 1  // MSVC
#else
#define PLATFORM 2  // MinGW
#endif
#elif defined(__linux__) || defined(__gnu_linux__)
#define PLATFORM 3  // LINUX
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 4  // MACOS
#else
#define PLATFORM 0  // UNKNOWN
#endif

typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    MemoryBlock* next;
    pointer block;
};

typedef struct StringList StringList;
struct StringList {
    string str;
    size_t length;
    StringList* next;
};

#define keywordCount 22
#define symbolCount 30
extern string keywordList[keywordCount];
extern string symbolList[symbolCount];

#define defaultMemorySize 1024  // 1 KB
extern MemoryBlock* struct_memory;
extern MemoryBlock* string_memory;
extern bool initialized;

extern StringList* all_string_list;

extern string IMPORT_KEYWORD;     // keyword `import`
extern string FROM_KEYWORD;       // keyword `from`
extern string FUNC_KEYWORD;       // keyword `func`
extern string CLASS_KEYWORD;      // keyword `class`
extern string METHOD_KEYWORD;     // keyword `method`
extern string SELF_KEYWORD;       // keyword `self`
extern string IF_KEYWORD;         // keyword `if`
extern string ELIF_KEYWORD;       // keyword `elif`
extern string ELSE_KEYWORD;       // keyword `else`
extern string WHILE_KEYWORD;      // keyword `while`
extern string FOR_KEYWORD;        // keyword `for`
extern string TRUE_KEYWORD;       // keyword `true`
extern string FALSE_KEYWORD;      // keyword `false`
extern string RETURN_KEYWORD;     // keyword `return`
extern string BREAK_KEYWORD;      // keyword `break`
extern string CONTINUE_KEYWORD;   // keyword `continue`
extern string INT_KEYWORD;        // keyword `int`
extern string FLOAT_KEYWORD;      // keyword `float`
extern string STRING_KEYWORD;     // keyword `string`
extern string BOOL_KEYWORD;       // keyword `bool`
extern string VOID_KEYWORD;       // keyword `void`
extern string VAR_KEYWORD;        // keyword `var`
extern string L_PAREN_SYMBOL;     // symbol `(`
extern string R_PAREN_SYMBOL;     // symbol `)`
extern string L_BRACE_SYMBOL;     // symbol `{`
extern string R_BRACE_SYMBOL;     // symbol `}`
extern string COMMA_SYMBOL;       // symbol `,`
extern string NOT_SYMBOL;         // symbol `!`
extern string DOT_SYMBOL;         // symbol `.`
extern string L_BRACKET_SYMBOL;   // symbol `[`
extern string R_BRACKET_SYMBOL;   // symbol `]`
extern string SEMICOLON_SYMBOL;   // symbol `;`
extern string UNDERLINE_SYMBOL;   // symbol `_`
extern string ADD_SYMBOL;         // symbol `+`
extern string SUB_SYMBOL;         // symbol `-`
extern string MUL_SYMBOL;         // symbol `*`
extern string DIV_SYMBOL;         // symbol `/`
extern string MOD_SYMBOL;         // symbol `%`
extern string LT_SYMBOL;          // symbol `<`
extern string GT_SYMBOL;          // symbol `>`
extern string ASSIGN_SYMBOL;      // symbol `=`
extern string EQ_SYMBOL;          // symbol `==`
extern string NE_SYMBOL;          // symbol `!=`
extern string LE_SYMBOL;          // symbol `<=`
extern string GE_SYMBOL;          // symbol `>=`
extern string ADD_ASSIGN_SYMBOL;  // symbol `+=`
extern string SUB_ASSIGN_SYMBOL;  // symbol `-=`
extern string MUL_ASSIGN_SYMBOL;  // symbol `*=`
extern string DIV_ASSIGN_SYMBOL;  // symbol `/=`
extern string MOD_ASSIGN_SYMBOL;  // symbol `%=`
extern string AND_SYMBOL;         // symbol `&&`
extern string OR_SYMBOL;          // symbol `||`

typedef struct Name Name;
typedef struct Scope Scope;
extern Name* name_void;
extern Name* name_int;
extern Name* name_float;
extern Name* name_string;
extern Name* name_bool;
extern Scope* builtin_scope;

void init(void);
string create_string(const char* data, size_t length);
pointer alloc_memory(size_t size);
bool is_keyword(const string str);
bool string_equal(string a, string b);
string get_info(void);

#endif  // LIB_H

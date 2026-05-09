#ifndef LIB_H
#define LIB_H

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// TODO: let std_path be determined by the environment
#if defined(_WIN32) || defined(_WIN64) || defined(__CYGWIN__)
#ifdef _MSC_VER
#define PLATFORM 1  // MSVC
#define std_path "D:/TC/std/"
#else
#define PLATFORM 2  // MinGW
#define std_path "D:/TC/std/"
#endif
#elif defined(__linux__) || defined(__gnu_linux__)
#define PLATFORM 3  // LINUX
#define std_path "/home/su2u4/code/TC/std/"
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 4  // MACOS
#define std_path "NOT SUPPORTED"
#else
#define PLATFORM 0  // UNKNOWN
#define std_path "NOT SUPPORTED"
#endif

#if PLATFORM == 1
#include <direct.h>  // MSVC
#elif PLATFORM == 2 || PLATFORM == 3 || PLATFORM == 4
#include <unistd.h>  // MinGW or LINUX or MACOS
#endif

#define bool char
#define true 1
#define false 0
typedef char* string;
typedef size_t* pointer;

#define DEFAULT_MEMORY_SIZE 1024
#define ALIGN_SIZE ((size_t)__SIZEOF_POINTER__)

typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    char* data;
    MemoryBlock* next;
};
typedef struct StringNode StringNode;
struct StringNode {
    size_t size;
    size_t hash;
    StringNode* next;
    string value;
};

typedef struct {
    StringNode** buckets;
    size_t capacity;
    size_t count;
} StringTable;

extern MemoryBlock* string_memory;
extern MemoryBlock* struct_memory;

void init(void);
#define create_struct(T) (T*)alloc_memory(sizeof(T), true)
string create_string(const char* str, size_t len);
pointer alloc_memory(size_t size, bool is_struct);
string string_splice(string format, ...);
string get_info(void);

#define keywordCount 24
#define symbolCount 30
#define specialCount 17
extern string keywordList[keywordCount];
extern string symbolList[symbolCount];
extern string specialList[specialCount];

extern string KEYWORD_IMPORT;     // keyword `import`
extern string KEYWORD_FROM;       // keyword `from`
extern string KEYWORD_FUNC;       // keyword `func`
extern string KEYWORD_CLASS;      // keyword `class`
extern string KEYWORD_METHOD;     // keyword `method`
extern string KEYWORD_SELF;       // keyword `self`
extern string KEYWORD_IF;         // keyword `if`
extern string KEYWORD_ELIF;       // keyword `elif`
extern string KEYWORD_ELSE;       // keyword `else`
extern string KEYWORD_WHILE;      // keyword `while`
extern string KEYWORD_FOR;        // keyword `for`
extern string KEYWORD_TRUE;       // keyword `true`
extern string KEYWORD_FALSE;      // keyword `false`
extern string KEYWORD_RETURN;     // keyword `return`
extern string KEYWORD_BREAK;      // keyword `break`
extern string KEYWORD_CONTINUE;   // keyword `continue`
extern string KEYWORD_INT;        // keyword `int`
extern string KEYWORD_FLOAT;      // keyword `float`
extern string KEYWORD_STRING;     // keyword `string`
extern string KEYWORD_BOOL;       // keyword `bool`
extern string KEYWORD_VOID;       // keyword `void`
extern string KEYWORD_VAR;        // keyword `var`
extern string KEYWORD_POINTER;    // keyword `pointer`
extern string KEYWORD_CONST;      // keyword `const`
extern string SYMBOL_L_PAREN;     // symbol `(`
extern string SYMBOL_R_PAREN;     // symbol `)`
extern string SYMBOL_L_BRACE;     // symbol `{`
extern string SYMBOL_R_BRACE;     // symbol `}`
extern string SYMBOL_COMMA;       // symbol `,`
extern string SYMBOL_NOT;         // symbol `!`
extern string SYMBOL_DOT;         // symbol `.`
extern string SYMBOL_L_BRACKET;   // symbol `[`
extern string SYMBOL_R_BRACKET;   // symbol `]`
extern string SYMBOL_SEMICOLON;   // symbol `;`
extern string SYMBOL_UNDERLINE;   // symbol `_`
extern string SYMBOL_ADD;         // symbol `+`
extern string SYMBOL_SUB;         // symbol `-`
extern string SYMBOL_MUL;         // symbol `*`
extern string SYMBOL_DIV;         // symbol `/`
extern string SYMBOL_MOD;         // symbol `%`
extern string SYMBOL_LT;          // symbol `<`
extern string SYMBOL_GT;          // symbol `>`
extern string SYMBOL_ASSIGN;      // symbol `=`
extern string SYMBOL_EQ;          // symbol `==`
extern string SYMBOL_NE;          // symbol `!=`
extern string SYMBOL_LE;          // symbol `<=`
extern string SYMBOL_GE;          // symbol `>=`
extern string SYMBOL_ADD_ASSIGN;  // symbol `+=`
extern string SYMBOL_SUB_ASSIGN;  // symbol `-=`
extern string SYMBOL_MUL_ASSIGN;  // symbol `*=`
extern string SYMBOL_DIV_ASSIGN;  // symbol `/=`
extern string SYMBOL_MOD_ASSIGN;  // symbol `%=`
extern string SYMBOL_AND;         // symbol `&&`
extern string SYMBOL_OR;          // symbol `||`
extern string SPECIAL_INIT;       // special method `$init`
extern string SPECIAL_TO_INT;     // special method `$to_int`
extern string SPECIAL_TO_FLOAT;   // special method `$to_float`
extern string SPECIAL_TO_STRING;  // special method `$to_string`
extern string SPECIAL_TO_BOOL;    // special method `$to_bool`
extern string SPECIAL_ADD;        // special method `$add`
extern string SPECIAL_SUB;        // special method `$sub`
extern string SPECIAL_MUL;        // special method `$mul`
extern string SPECIAL_DIV;        // special method `$div`
extern string SPECIAL_MOD;        // special method `$mod`
extern string SPECIAL_EQ;         // special method `$eq`
extern string SPECIAL_LT;         // special method `$lt`
extern string SPECIAL_GT;         // special method `$gt`
extern string SPECIAL_AND;        // special method `$and`
extern string SPECIAL_OR;         // special method `$or`
extern string SPECIAL_NOT;        // special method `$not`
extern string SPECIAL_NEG;        // special method `$neg`

#define list(T) List*
#define list_empty(self) (self == NULL || self->head == NULL)

typedef struct ListNode {
    pointer data;
    struct ListNode* next;
} ListNode;
typedef struct List {
    ListNode* head;
    ListNode* tail;
} List;

List* list_create(void);
void list_append(List* self, pointer value);
pointer list_pop_front(List* self);
pointer list_pop_back(List* self);

typedef struct Symbol Symbol;
extern Symbol* symbol_int;
extern Symbol* symbol_float;
extern Symbol* symbol_string;
extern Symbol* symbol_bool;
extern Symbol* symbol_void;
extern Symbol* symbol_pointer;
extern Symbol* symbol_const;

#endif  // LIB_H

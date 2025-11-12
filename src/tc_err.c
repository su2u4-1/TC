#include "tc_err.h"

#include "tc_mem.h"

#if defined(__GNUC__) || defined(__clang__)
#define NORETURN __attribute__((noreturn))
#elif defined(_MSC_VER)
#define NORETURN __declspec(noreturn)
#else
#define NORETURN
#endif

NORETURN void tcerr_alloc(void) {
    fprintf(stderr, "[os error]: Memory allocation error\n");
    tc_free_all_memory();
    exit(1);
}

NORETURN void tcerr_unclosed_string(int line_number) {
    fprintf(stderr, "[syntax error]: Unclosed string at line %d\n", line_number);
    tc_free_all_memory();
    exit(2);
}

NORETURN void tcerr_unclosed_comment(int line_number) {
    fprintf(stderr, "[syntax error]: Unclosed comment at line %d\n", line_number);
    tc_free_all_memory();
    exit(3);
}

NORETURN void tcerr_file_open_error(const char* file_path) {
    fprintf(stderr, "[io error]: cannot open file %s\n", file_path);
    tc_free_all_memory();
    exit(4);
}

NORETURN void tcerr_unexpected_token(const char* filename, int line_number, const char* token_content) {
    fprintf(stderr, "[syntax error]: Unexpected token \"%s\" at %s:%d\n", token_content, filename, line_number);
    tc_free_all_memory();
    exit(5);
}

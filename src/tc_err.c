#include "tc_err.h"

__attribute__((noreturn)) void tcerr_alloc(void) {
    fprintf(stderr, "os error: Memory allocation error\n");
    tc_free_all_memory();
    exit(1);
}

__attribute__((noreturn)) void tcerr_unclosed_string(int line_number) {
    fprintf(stderr, "syntax error: Unclosed string at line %d\n", line_number);
    tc_free_all_memory();
    exit(1);
}

__attribute__((noreturn)) void tcerr_unclosed_comment(int line_number) {
    fprintf(stderr, "syntax error: Unclosed comment at line %d\n", line_number);
    tc_free_all_memory();
    exit(1);
}

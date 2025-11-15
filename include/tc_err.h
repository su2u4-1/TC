#ifndef TC_ERR_H
#define TC_ERR_H

#include "tc_lib.h"

void tcerr_alloc(void);
void tcerr_unclosed_string(int line_number);
void tcerr_unclosed_comment(int line_number);
void tcerr_file_open_error(const char* file_path);
void tcerr_unexpected_token(const char* filename, int line_number, const char* token_content);
void tcerr_loop_error(const char* filename, int line_number, const char* message);

#endif  // TC_ERR_H

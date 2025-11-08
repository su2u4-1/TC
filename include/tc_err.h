#ifndef TC_ERR_H
#define TC_ERR_H

#include "tc_lib.h"
#include "tc_mem.h"

void tcerr_alloc(void);
void tcerr_unclosed_string(int line_number);
void tcerr_unclosed_comment(int line_number);

#endif  // TC_ERR_H

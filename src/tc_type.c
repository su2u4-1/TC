#include "tc_type.h"

Array* tc_type;

void tc_type_init(void) {
    tc_type = arr_init(sizeof(char*), 8);
    char* types[] = {"int", "float", "string", "bool", "void"};
    for (int i = 0; i < 5; i++) {
        arr_push(tc_type, &types[i]);
    }
}

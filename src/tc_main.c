#include "tc_lib.h"

int main(int argc, char* argv[]) {
    printf("handle parameter\n");
    char* file_name;
    char* output_path;
    int flag;
    /*
    1: -o: output compiler result to output_path/file_name.exe
    2: -a: output AST to output_path/file_name.ast
    4: -l: output lexer result to output_path/file_name.lex
    8: -s: output symbol table to output_path/file_name.sym
    16: -h: display help information
     */
    handle_parameters(argc, argv);
    return 0;
}

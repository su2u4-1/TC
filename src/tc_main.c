#include "tc_err.h"
#include "tc_file.h"
#include "tc_lexer.h"
#include "tc_lib.h"
#include "tc_mem.h"

static Path* file_path = NULL;
static Path* output_path = NULL;
/*
 * 1: -o: output compiler result to output_path/file_name.exe
 * 2: -a: output AST to output_path/file_name.ast
 * 4: -l: output lexer result to output_path/file_name.lex
 * 8: -s: output symbol table to output_path/file_name.sym
 * 16: -h: display help information
 */
static int flags = 0;

static void handle_parameters(int argc, char* argv[]) {
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-o") == 0) {
            flags |= 1;
        } else if (strcmp(argv[i], "-a") == 0) {
            flags |= 2;
        } else if (strcmp(argv[i], "-l") == 0) {
            flags |= 4;
        } else if (strcmp(argv[i], "-s") == 0) {
            flags |= 8;
        } else if (strcmp(argv[i], "-h") == 0) {
            flags |= 16;
        } else {
            if (file_path == NULL) {
                file_path = path_init(argv[i]);
                path_normalize(file_path);

            } else if (output_path == NULL) {
                output_path = path_init(argv[i]);
                path_normalize(output_path);
            }
        }
    }
}

int main(int argc, char* argv[]) {
    printf("[info]: handle parameter\n");
    handle_parameters(argc, argv);
    if (flags & 16 || file_path == NULL) {
        printf("Usage: <executable_file> <source_file> [output_path] [options]\n");
        printf("Options:\n");
        printf("  -o    Output compiled result to output_path/file_name.exe\n");
        printf("  -a    Output AST to output_path/file_name.ast\n");
        printf("  -l    Output lexer result to output_path/file_name.lex\n");
        printf("  -s    Output symbol table to output_path/file_name.sym\n");
        printf("  -h    Display this help information\n");
        return 0;
    }
    printf("[info]: start compile file: %s\n", file_path->path);
    printf("[info]: start read file\n");
    FILE* file = fopen(file_path->path, "r");
    if (file == NULL) {
        tcerr_file_open_error(file_path->path);
    }
    fseek(file, 0, SEEK_END);
    unsigned file_size = (unsigned)ftell(file);
    char* source_code = (char*)tc_malloc(file_size + 1);
    fseek(file, 0, SEEK_SET);
    if (source_code == NULL) {
        fclose(file);
        tcerr_alloc();
    }
    fread(source_code, 1, file_size, file);
    source_code[file_size] = '\0';
    fclose(file);

    printf("[info]: start lexing\n");
    Token* tokens = lexer(source_code);
    if (flags & 4) {
        printf("[info]: output lexer result\n");
        Path* lex_path = path_init(output_path != NULL ? output_path->path : ".");
        path_change_file_name(lex_path, file_path->file_name, false);
        path_change_extension(lex_path, ".lex");
        path_normalize(lex_path);
        printf("[info]: lexer output path: %s\n", lex_path->path);
        output_lexer_result(tokens, lex_path->path);
    }

    tc_free_all_memory();
    return 0;
}

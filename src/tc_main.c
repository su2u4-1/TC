#include "tc_err.h"
#include "tc_lexer.h"
#include "tc_lib.h"
#include "tc_mem.h"

static char* file_path = NULL;
static char* file_name = NULL;
static char* output_path = NULL;
/*
 * 1: -o: output compiler result to output_path/file_name.exe
 * 2: -a: output AST to output_path/file_name.ast
 * 4: -l: output lexer result to output_path/file_name.lex
 * 8: -s: output symbol table to output_path/file_name.sym
 * 16: -h: display help information
 */
static int flags = 0;

static char* get_file_name(const char* path) {
    const char* last_slash = strrchr(path, '/');
    const char* last_backslash = strrchr(path, '\\');
    const char* file_start = path;
    if (last_slash != NULL && (last_backslash == NULL || last_slash > last_backslash)) {
        file_start = last_slash + 1;
    } else if (last_backslash != NULL) {
        file_start = last_backslash + 1;
    }
    size_t len = strlen(file_start);
    char* name = (char*)tc_malloc(len + 1);
    strcpy(name, file_start);
    return name;
}

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
                file_path = argv[i];
                file_name = get_file_name(file_path);
            } else if (output_path == NULL) {
                output_path = argv[i];
            }
        }
    }
}

int main(int argc, char* argv[]) {
    printf("handle parameter\n");
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
    printf("start compile file: %s\n", file_path);
    printf("start read file\n");
    FILE* file = fopen(file_path, "r");
    if (file == NULL) {
        tcerr_file_open_error(file_path);
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

    printf("start lexing\n");
    Token* tokens = lexer(source_code);
    if (flags & 4) {
        printf("output lexer result\n");
        output_lexer_result(tokens, output_path, file_name);
    }

    tc_free_all_memory();
    return 0;
}

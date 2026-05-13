#include "output.h"
#include "parser.h"

typedef enum OutputFlags {
    OUTPUT_NONE = 0,
    OUTPUT_RESULT = 1,        // -o
    OUTPUT_IR = 2,            // -i
    OUTPUT_AST = 4,           // -a
    OUTPUT_TOKENS = 8,        // -l
    OUTPUT_SYMBOL_TABLE = 16  // -s
} OutputFlags;

typedef struct Args {
    File* source_path;
    File* output_path;
    OutputFlags output_flags;
} Args;

static Args* parse_args(int argc, char* argv[]) {
    Args* args = create_struct(Args);
    memset(args, 0, sizeof(Args));
    for (int i = 1; i < argc; ++i) {
        if (argv[i][0] == '-') {
            if (argv[i][1] == 'o') {
                args->output_flags |= OUTPUT_RESULT;
            } else if (argv[i][1] == 'i') {
                args->output_flags |= OUTPUT_IR;
            } else if (argv[i][1] == 'a') {
                args->output_flags |= OUTPUT_AST;
            } else if (argv[i][1] == 'l') {
                args->output_flags |= OUTPUT_TOKENS;
            } else if (argv[i][1] == 's') {
                args->output_flags |= OUTPUT_SYMBOL_TABLE;
            } else if (argv[i][1] == 'h') {
                printf("Usage: %s <source_file> [output_file] [options]\n", argv[0]);
                printf("Options:\n");
                printf("  -o  Output compile result\n");
                printf("  -i  Output IR\n");
                printf("  -a  Output AST\n");
                printf("  -l  Output tokens\n");
                printf("  -s  Output symbol table\n");
                printf("  -h  Show this help message\n");
                exit(0);
            }
        } else {
            if (args->source_path == NULL) {
                args->source_path = create_file(create_string(argv[i], strlen(argv[i])));
            } else if (args->output_path == NULL) {
                args->output_path = create_file(create_string(argv[i], strlen(argv[i])));
            } else {
                fprintf(stderr, "[Error] Unexpected argument: %s\n", argv[i]);
            }
        }
    }
    if (args->source_path == NULL) {
        fprintf(stderr, "[Error] No source file provided\n");
        exit(1);
    } else if (args->output_path == NULL) {
        args->output_path = create_file(args->source_path->path);
    }
    return args;
}

int main(int argc, char* argv[]) {
    init();
    init_symbol();

    Args* args = parse_args(argc, argv);

    Lexer* lexer = NULL;
    if (args->output_flags != OUTPUT_NONE) {
        lexer = create_lexer(args->source_path);
    }
    if (args->output_flags & OUTPUT_TOKENS) {
        Lexer* copy_lexer = create_struct(Lexer);
        memcpy(copy_lexer, lexer, sizeof(Lexer));
        output_tokens(copy_lexer, args->output_path);
    }
    AST* ast = NULL;
    if (args->output_flags & OUTPUT_AST) {
        Parser* parser = create_parser(lexer);
        parser->lexer->skip_comment = true;
        ast = parse_code(parser);
        FILE* ast_file = fopen(change_extension(args->output_path, ".ast"), "w");
        print_ast(ast, ast_file);
        fclose(ast_file);
    }
    if (args->output_flags & OUTPUT_IR) {
        // TODO: IR
    }
    if (args->output_flags & OUTPUT_RESULT) {
        // TODO: compile result
    }
    if (args->output_flags & OUTPUT_SYMBOL_TABLE) {
        // TODO: symbol table
    }

    return 0;
}

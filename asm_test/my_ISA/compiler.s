str c.str_0: "%.*s%s"
str c.str_1: "%s%s"
str c.str_2: ""
str c.str_3: "Token(Type: EOF,         Line: %zu, Column: %zu)\n"
str c.str_4: "Token(Type: identifier,  Line: "
str c.str_5: "Token(Type: integer,     Line: "
str c.str_6: "Token(Type: float,       Line: "
str c.str_7: "Token(Type: string,      Line: "
str c.str_8: "Token(Type: symbol,      Line: "
str c.str_9: "Token(Type: keyword,     Line: "
str c.str_10: "Token(Type: comment,     Line: "
str c.str_11: "%zu, Column: %zu)\tLexeme: '"
str c.str_12: "\\0"
str c.str_13: "\\n"
str c.str_14: "\\t"
str c.str_15: "\\r"
str c.str_16: "'\n"
str c.str_17: "\ninfo by lib:\n    %s\n"
str c.str_18: "r"
str c.str_19: "Error opening file: %s\n"
str c.str_20: ".token"
str c.str_21: "w"
str c.str_22: ".ast"

; void string_append(string dest, const size_t dest_length, const string src, const string new) {
f.string_append:
    ; a0: dest
    ; a1: dest_length
    ; a2: src
    ; a3: new
    ; size_t src_length = strlen(src), new_length = strlen(new);
    push a2
    call f.strlen 1
    mov  r0 rv  ; r0: src_length
    push a3
    call f.strlen 1
    mov  r1 rv  ; r1: new_length
    ; if (dest_length <= src_length + new_length) {
    add  t0 r0 r1
    cmpu a1 t0
    jmp  l.if_else_0 gt
    ; size_t max_src_length = dest_length - new_length - 1;
    sub  r2 a1 r1
    sub  r2 r2 1  ; r2: max_src_length
    ; snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
    push a0
    push a1
    push c.str_0
    push word r2
    push a2
    push a3
    call f.snprintf 6
    jmp  l.if_end_0 always
    ; }
l.if_else_0:
    ; else {
    ; sprintf(dest, "%s%s", src, new);
    push a0
    push c.str_1
    push a2
    push a3
    call f.sprintf 4
    ; }
l.if_end_0:
    mov  rv 0
    ret
; }

; string read_source(FILE* file, size_t* length) {
f.read_source:
    ; a0: file
    ; a1: length
    ; fseek(file, 0, SEEK_END);
    push a0
    push 0
    push g.SEEK_END  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    call f.fseek 3
    ; *length = (size_t)ftell(file);
    push a0
    call f.ftell 1
    save a1 rv
    ; fseek(file, 0, SEEK_SET);
    push a0
    push 0
    push g.SEEK_SET  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    call f.fseek 3
    ; string source = create_string("", *length + 1);
    push c.str_2
    load r0 a1
    add  r1 r0 1
    push r1
    call f.create_string 2
    mov  r0 rv  ; r0: source
    ; fread(source, 1, *length, file);
    push r0
    push 1
    load r1 a1
    push r1
    push a0
    call f.fread 4
    ; source[*length] = '\0';
    load r1 a1
    add  r1 r0 r1
    save byte r1 0
    ; for (size_t i = 0; i < *length; ++i) {
    mov  r1 0  ; r1: i
l.for_start_0:
    load r2 a1
    cmpu r1 r2
    jmp  l.for_end_0 ge
    ; if (source[i] == '\r' || source[i] == '\t') {
    add  r2 r0 r1
    load byte r3 r2
    cmpu byte r3 13  ; '\r' == 13
    jmp  l.if_then_1 eq
    cmpu byte r3 9  ; '\t' == 9
    jmp  l.if_then_1 eq
    jmp  l.if_end_1 always
l.if_then_1:
    ; source[i] = ' ';
    save byte r2 32  ; ' ' == 32
    ; }
l.if_end_1:
    add  r1 r1 1
    jmp  l.for_start_0 always
    ; }
l.for_end_0:
    ; return source;
    mov  rv r0
    ret
; }

; void output_token(FILE* file, Lexer* lexer) {
f.output_token:
    ; a0: file
    ; a1: lexer
    ; for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
    push a1
    push 0  ; false
    call f.get_next_token 2
    mov  r0 rv  ; r0: current
l.for_start_1:
    cmpu r0 0
    jmp  l.for_end_1 eq
    ; Token* token = current;
    mov  r1 r0  ; r1: token
    ; if (token->type == EOF_TOKEN) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.EOF_TOKEN  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_elif_2_0 ne
    ; fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
    push a0
    push c.str_3
    add  r2 r1 size   ; size = sizeof(size_t), offset of line in Token struct
    load r2 r2
    add  r2 r2 1
    push r2
    add  r2 r1 2 * size  ; size = sizeof(size_t), offset of column in Token struct
    load r2 r2
    add  r2 r2 1
    push r2
    call f.fprintf 4
    ; break;
    jmp  l.for_end_1 always
    jmp  l.if_end_2 always
    ; }
l.if_elif_2_0:
    ; else if (token->type == IDENTIFIER) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.IDENTIFIER  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_elif_2_1 ne
    ; fprintf(file, "Token(Type: identifier,  Line: ");
    push a0
    push c.str_4
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; }
l.if_elif_2_1:
    ; else if (token->type == INTEGER) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.INTEGER  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_elif_2_2 ne
    ; fprintf(file, "Token(Type: integer,     Line: ");
    push a0
    push c.str_5
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; }
l.if_elif_2_2:
    ; else if (token->type == FLOAT) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.FLOAT  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_elif_2_3 ne
    ; fprintf(file, "Token(Type: float,       Line: ");
    push a0
    push c.str_6
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; }
l.if_elif_2_3:
    ; else if (token->type == STRING) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.STRING  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_elif_2_4 ne
    ; fprintf(file, "Token(Type: string,      Line: ");
    push a0
    push c.str_7
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; }
l.if_elif_2_4:
    ; else if (token->type == SYMBOL) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.SYMBOL  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_elif_2_5 ne
    ; fprintf(file, "Token(Type: symbol,      Line: ");
    push a0
    push c.str_8
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; }
l.if_elif_2_5:
    ; else if (token->type == KEYWORD) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.KEYWORD  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_elif_2_6 ne
    ; fprintf(file, "Token(Type: keyword,     Line: ");
    push a0
    push c.str_9
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; }
l.if_elif_2_6:
    ; else if (token->type == COMMENT) {
    add  r2 r1 3 * size  ; size = sizeof(size_t), offset of type in Token struct
    load r2 r2
    cmpu r2 g.COMMENT  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    jmp  l.if_end_2 ne
    ; fprintf(file, "Token(Type: comment,     Line: ");
    push a0
    push c.str_10
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; }
l.if_end_2:
    ; fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    push a0
    push c.str_11
    add  r2 r1 size   ; size = sizeof(size_t), offset of line in Token struct
    load r2 r2
    add  r2 r2 1
    push r2
    add  r2 r1 2 * size  ; size = sizeof(size_t), offset of column in Token struct
    load r2 r2
    add  r2 r2 1
    push r2
    call f.fprintf 4
    ; string lexeme_ptr = token->lexeme;
    add  r2 r1 0   ; offset of lexeme in Token struct
    load r2 r2  ; r2: lexeme_ptr
    ; for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
    mov  r3 0  ; r3: i
l.for_start_2:
    push r2
    call f.strlen 1
    cmpu r3 rv
    jmp  l.for_end_2 ge
    ; char c = lexeme_ptr[i];
    add  r4 r2 r3
    load byte r4 r4  ; r4: c
    ; if (c == '\0') {
    cmpu byte r4 0  ; '\0' == 0
    jmp  l.if_elif_3_0 ne
    ; fputs("\\0", file);
    push c.str_12
    push a0
    call f.fputs 2
    jmp  l.if_end_3 always
    ; }
l.if_elif_3_0:
    ; else if (c == '\n') {
    cmpu byte r4 10  ; '\n' == 10
    jmp  l.if_elif_3_1 ne
    ; fputs("\\n", file);
    push c.str_13
    push a0
    call f.fputs 2
    jmp  l.if_end_3 always
    ; }
l.if_elif_3_1:
    ; else if (c == '\t') {
    cmpu byte r4 9  ; '\t' == 9
    jmp  l.if_elif_3_2 ne
    ; fputs("\\t", file);
    push c.str_14
    push a0
    call f.fputs 2
    jmp  l.if_end_3 always
    ; }
l.if_elif_3_2:
    ; else if (c == '\r') {
    cmpu byte r4 13  ; '\r' == 13
    jmp  l.if_else_3 ne
    ; fputs("\\r", file);
    push c.str_15
    push a0
    call f.fputs 2
    jmp  l.if_end_3 always
    ; }
l.if_else_3:
    ; else {
    ; fputc(c, file);
    push r4
    push a0
    call f.fputc 2
    jmp  l.if_end_3 always
    ; }
l.if_end_3:
    add  r3 r3 1
    jmp  l.for_start_2 always
    ; }
l.for_end_2:
    ; fprintf(file, "'\n");
    push a0
    push c.str_16
    call f.fprintf 2
    push a1
    push 0  ; false
    call f.get_next_token 2
    mov  r0 rv  ; r0: current
    jmp  l.for_start_1 always
    ; }
l.for_end_1:
    ; fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
    push a0
    push c.str_17
    call f.get_info 0
    push rv
    call f.fprintf 3
    mov  rv 0
    ret
; }

; void output_ast(FILE* file, Lexer* lexer, Parser* parser) {
f.output_ast:
    ; a0: file
    ; a1: lexer
    ; a2: parser
    ; Code* ast_root = parse_code(lexer, builtin_scope, parser);
    push a1
    push g.builtin_scope  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    push a2
    call f.parse_code 3
    mov  r0 rv  ; r0: ast_root
    ; output_code(ast_root, file, 0, parser);
    push r0
    push a0
    push 0
    push a2
    call f.output_code 4
    ; fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
    push a0
    push c.str_17
    call f.get_info 0
    push rv
    call f.fprintf 3
    mov  rv 0
    ret
; }

; void parse_file(const string name, bool o_token, bool o_ast) {
f.parse_file:
    ; a0: name
    ; a1: o_token
    ; a2: o_ast
    ; File* file = create_file(name);
    push a0
    call f.create_file 1
    mov  r0 rv  ; r0: file
    ; string filename = get_full_path(file);
    push r0
    call f.get_full_path 1
    mov  r1 rv  ; r1: filename
    ; size_t length = 0;
    mov  r2 0  ; r2: length
    ; FILE* source_file = fopen(filename, "r");
    push r1
    push c.str_18
    call f.fopen 2
    mov  r3 rv  ; r3: source_file
    ; if (source_file == NULL) {
    cmp  r3 0
    jmp  l.if_end_4 ne
    ; fprintf(stderr, "Error opening file: %s", filename);
    push g.stderr  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    push c.str_19
    push r1
    call f.fprintf 3
    ; return;
    mov  rv 0
    ret
    ; }
l.if_end_4:
    ; string source = read_source(source_file, &length);
    push r3
    add  r4 lp 2 * size  ; size depends on the machine (32-bit or 64-bit)
    push r4
    call f.read_source 2
    mov  r4 rv  ; r4: source
    ; fclose(source_file);
    push r3
    call f.fclose 1
    ; Lexer* lexer = create_lexer(source, length);
    push r4
    push r2
    call f.create_lexer 2
    mov  r5 rv  ; r5: lexer
    ; if (o_token) {
    cmp  a1 0
    jmp  l.if_end_5 eq
    ; change_file_extension(file, create_string(".token", 6));
    push r0
    push c.str_20
    push 6
    call f.create_string 2
    push rv
    call f.change_file_extension 2
    ; string out_token_name = get_full_path(file);
    push r0
    call f.get_full_path 1
    mov  r6 rv  ; r6: out_token_name
    ; FILE* out_token_file = fopen(out_token_name, "w");
    push r6
    push c.str_21
    call f.fopen 2
    mov  r7 rv  ; r7: out_token_file
    ; if (out_token_file == NULL) {
    cmp  r7 0
    jmp  l.if_else_6 ne
    ; fprintf(stderr, "Error opening file: %s\n", out_token_name);
    push g.stderr  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    push c.str_19
    push r6
    call f.fprintf 3
    ; }
    jmp  l.if_end_6 always
l.if_else_6:
    ; else {
    ; output_token(out_token_file, lexer);
    push r7
    push r5
    call f.output_token 2
    ; fclose(out_token_file);
    push r7
    call f.fclose 1
    ; }
l.if_end_6:
    ; }
l.if_end_5:
    ; reset_lexer(lexer);
    push r5
    call f.reset_lexer 1
    ; Parser* parser = create_parser();
    call f.create_parser 0
    mov  r8 rv  ; r8: parser
    ; if (o_ast) {
    cmp  a2 0
    jmp  l.if_end_7 eq
    ; change_file_extension(file, create_string(".ast", 4));
    push r0
    push c.str_22
    push 4
    call f.create_string 2
    push rv
    call f.change_file_extension 2
    ; string out_ast_name = get_full_path(file);
    push r0
    call f.get_full_path 1
    mov  r9 rv  ; r9: out_ast_name
    ; FILE* out_ast_file = fopen(out_ast_name, "w");
    push r9
    push c.str_21
    call f.fopen 2
    mov  r10 rv  ; r10: out_ast_file
    ; if (out_ast_file == NULL) {
    cmp  r10 0
    jmp  l.if_else_8 ne
    ; fprintf(stderr, "Error opening file: %s\n", out_ast_name);
    push g.stderr  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    push c.str_19
    push r9
    call f.fprintf 3
    ; }
    jmp  l.if_end_8 always
l.if_else_8:
    ; else {
    ; output_ast(out_ast_file, lexer, parser);
    push r10
    push r5
    push r8
    call f.output_ast 3
    ; fclose(out_ast_file);
    push r10
    call f.fclose 1
    ; }
l.if_end_8:
    ; }
l.if_end_7:
    mov  rv 0
    ret
; }

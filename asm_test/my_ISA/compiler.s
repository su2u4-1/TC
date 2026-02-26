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

; void string_append(string dest, const size_t dest_length, const string src, const string new) {
f.string_append:
    ; a0: dest
    ; a1: dest_length
    ; a2: src
    ; a3: new
    ; size_t src_length = strlen(src), new_length = strlen(new);
    push a2
    call f.strlen 1
    mov  r0 rv
    push a3
    call f.strlen 1
    mov  r1 rv
    ; if (dest_length <= src_length + new_length) {
    add  t0 r0 r1
    cmpu t0 a1
    jmp  l.if_then_0 le
    jmp  l.if_else_0 always
l.if_then_0:
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
    ; } else {
l.if_else_0:
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
    push c.SEEK_END
    call f.fseek 3
    ; *length = (size_t)ftell(file);
    push a0
    call f.ftell 1
    save a1 rv
    ; fseek(file, 0, SEEK_SET);
    push a0
    push 0
    push c.SEEK_SET
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
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.EOF_TOKEN
    jmp  l.if_elif_2_0 ne
    ; fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
    push a0
    push c.str_3
    add  r2 r1 8   ; offset of line in Token struct
    load r2 r2
    add  r2 r2 1
    push r2
    add  r2 r1 16  ; offset of column in Token struct
    load r2 r2
    add  r2 r2 1
    push r2
    call f.fprintf 4
    ; break;
    jmp  l.for_end_1 always
    jmp  l.if_end_2 always
    ; } else if (token->type == IDENTIFIER) {
l.if_elif_2_0:
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.IDENTIFIER
    jmp  l.if_elif_2_1 ne
    ; fprintf(file, "Token(Type: identifier,  Line: ");
    push a0
    push c.str_4
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; } else if (token->type == INTEGER) {
l.if_elif_2_1:
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.INTEGER
    jmp  l.if_elif_2_2 ne
    ; fprintf(file, "Token(Type: integer,     Line: ");
    push a0
    push c.str_5
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; } else if (token->type == FLOAT) {
l.if_elif_2_2:
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.FLOAT
    jmp  l.if_elif_2_3 ne
    ; fprintf(file, "Token(Type: float,       Line: ");
    push a0
    push c.str_6
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; } else if (token->type == STRING) {
l.if_elif_2_3:
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.STRING
    jmp  l.if_elif_2_4 ne
    ; fprintf(file, "Token(Type: string,      Line: ");
    push a0
    push c.str_7
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; } else if (token->type == SYMBOL) {
l.if_elif_2_4:
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.SYMBOL
    jmp  l.if_elif_2_5 ne
    ; fprintf(file, "Token(Type: symbol,      Line: ");
    push a0
    push c.str_8
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; } else if (token->type == KEYWORD) {
l.if_elif_2_5:
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.KEYWORD
    jmp  l.if_elif_2_6 ne
    ; fprintf(file, "Token(Type: keyword,     Line: ");
    push a0
    push c.str_9
    call f.fprintf 2
    jmp  l.if_end_2 always
    ; } else if (token->type == COMMENT) {
l.if_elif_2_6:
    add  r2 r1 24  ; offset of type in Token struct
    load r2 r2
    cmpu r2 c.COMMENT
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
    add  r2 r1 8   ; offset of line in Token struct
    load r2 r2
    add  r2 r2 1
    push r2
    add  r2 r1 16  ; offset of column in Token struct
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
    ; } else if (c == '\n') {
l.if_elif_3_0:
    cmpu byte r4 10  ; '\n' == 10
    jmp  l.if_elif_3_1 ne
    ; fputs("\\n", file);
    push c.str_13
    push a0
    call f.fputs 2
    jmp  l.if_end_3 always
    ; } else if (c == '\t') {
l.if_elif_3_1:
    cmpu byte r4 9  ; '\t' == 9
    jmp  l.if_elif_3_2 ne
    ; fputs("\\t", file);
    push c.str_14
    push a0
    call f.fputs 2
    jmp  l.if_end_3 always
    ; } else if (c == '\r') {
l.if_elif_3_2:
    cmpu byte r4 13  ; '\r' == 13
    jmp  l.if_else_3 ne
    ; fputs("\\r", file);
    push c.str_15
    push a0
    call f.fputs 2
    jmp  l.if_end_3 always
    ; } else {
l.if_else_3:
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

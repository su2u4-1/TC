.LC0:
        .string "Failed to parse import statement"
.LC1:
        .string "Failed to parse function declaration"
.LC2:
        .string "Failed to parse class declaration"
.LC3:
        .string "Unexpected token in code member"
parse_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     rax, QWORD PTR builtin_scope[rip]
        test    rax, rax
        jne     .L2
        mov     edi, 0
        call    create_symbol_table
        mov     QWORD PTR builtin_scope[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR VOID_KEYWORD[rip]
        mov     rcx, rdx
        mov     edx, 0
        mov     esi, 6
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR name_void[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR INT_KEYWORD[rip]
        mov     rcx, rdx
        mov     edx, 0
        mov     esi, 6
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR name_int[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR FLOAT_KEYWORD[rip]
        mov     rcx, rdx
        mov     edx, 0
        mov     esi, 6
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR name_float[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR STRING_KEYWORD[rip]
        mov     rcx, rdx
        mov     edx, 0
        mov     esi, 6
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR name_string[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR BOOL_KEYWORD[rip]
        mov     rcx, rdx
        mov     edx, 0
        mov     esi, 6
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR name_bool[rip], rax
.L2:
        cmp     QWORD PTR [rbp-64], 0
        jne     .L3
        mov     rax, QWORD PTR builtin_scope[rip]
        mov     QWORD PTR [rbp-64], rax
.L3:
        mov     QWORD PTR [rbp-8], 0
        call    create_list
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rdi, rax
        call    create_symbol_table
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L4
.L13:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L5
        mov     rdx, QWORD PTR IMPORT_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L5
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_import
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L6
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    parser_error
.L6:
        mov     rax, QWORD PTR [rbp-32]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 0
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L7
.L5:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L8
        mov     rdx, QWORD PTR FUNC_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L8
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_function
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L9
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        call    parser_error
.L9:
        mov     rax, QWORD PTR [rbp-40]
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 1
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L7
.L8:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L10
        mov     rdx, QWORD PTR CLASS_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L10
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_class
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L11
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC2
        call    parser_error
.L11:
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 0
        mov     esi, 0
        mov     edi, 2
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L7
.L10:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC3
        call    parser_error
.L7:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L4:
        cmp     QWORD PTR [rbp-8], 0
        je      .L12
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        jne     .L13
.L12:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_code
        leave
        ret
.LC4:
        .string "Expected identifier after 'import'"
.LC5:
        .string "Expected string literal after 'from'"
.LC6:
        .string "Expected ';' at end of import statement"
.LC7:
        .string "Failed to import module"
parse_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L16
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC4
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L16:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-32], rax
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L18
        mov     rdx, QWORD PTR FROM_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L18
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        je      .L19
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC5
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L19:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L18:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L20
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L21
.L20:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC6
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L21:
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    parse_import_file
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L22
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        call    parser_error
        mov     rdx, QWORD PTR name_void[rip]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 3
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-24], rax
.L22:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_import
.L17:
        leave
        ret
.LC8:
        .string "Expected function return type after 'func'"
.LC9:
        .string "Unknown function return type"
.LC10:
        .string "Expected function name after return type"
.LC11:
        .string "Expected '(' after function name"
.LC12:
        .string "Failed to parse function parameter"
.LC13:
        .string "Function parameters cannot have default values"
.LC14:
        .string "Expected ',' or ')' after function parameter"
.LC15:
        .string "Expected '{' to start function body"
.LC16:
        .string "Failed to parse function body statement"
.LC17:
        .string "Unreachable code after return statement"
.LC18:
        .string "Function missing return statement"
parse_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR [rbp-88], rdi
        mov     QWORD PTR [rbp-96], rsi
        mov     QWORD PTR [rbp-104], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-96]
        mov     rdi, rax
        call    create_symbol_table
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L24
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L25
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    is_builtin_type
        test    al, al
        jne     .L24
.L25:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC8
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L24:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L27
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC9
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L27:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L28
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC10
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L28:
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-32]
        mov     esi, 1
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L29
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L30
.L29:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC11
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L30:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        call    create_list
        mov     QWORD PTR [rbp-56], rax
        jmp     .L31
.L37:
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L32
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC12
        call    parser_error
        jmp     .L33
.L32:
        mov     rax, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L34
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC13
        call    parser_error
        jmp     .L33
.L34:
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L33:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L35
        mov     rdx, QWORD PTR COMMA_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L35
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L31
.L35:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L36
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L31
.L36:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC14
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L31:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L37
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L37
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L38
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L39
.L38:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC15
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L39:
        call    create_list
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     BYTE PTR [rax+8], 1
        mov     BYTE PTR [rbp-9], 0
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L40
.L44:
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-72], rax
        cmp     QWORD PTR [rbp-72], 0
        jne     .L41
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC16
        call    parser_error
        jmp     .L42
.L41:
        cmp     BYTE PTR [rbp-9], 0
        je      .L42
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC17
        call    parser_error
.L42:
        cmp     QWORD PTR [rbp-72], 0
        je      .L43
        mov     rax, QWORD PTR [rbp-72]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 5
        jne     .L43
        mov     BYTE PTR [rbp-9], 1
.L43:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L40:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L44
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L44
        mov     rax, QWORD PTR [rbp-104]
        mov     BYTE PTR [rax+8], 0
        cmp     BYTE PTR [rbp-9], 0
        jne     .L45
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-32], rax
        je      .L45
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC18
        call    parser_error
.L45:
        cmp     BYTE PTR [rbp-9], 0
        jne     .L46
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-32], rax
        jne     .L46
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L46:
        mov     r8, QWORD PTR [rbp-24]
        mov     rdi, QWORD PTR [rbp-64]
        mov     rcx, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     r9, r8
        mov     r8, rdi
        mov     rdi, rax
        call    create_function_use_ptr
.L26:
        leave
        ret
.LC19:
        .string "Expected method return type after 'method'"
.LC20:
        .string "Unknown return type for method"
.LC21:
        .string "Expected method name after return type"
.LC22:
        .string "Expected '(' after method name"
.LC23:
        .string "Expected 'self' as first parameter of method"
.LC24:
        .string "Expected ',' or ')' after method parameter"
.LC25:
        .string "Failed to parse method parameter"
.LC26:
        .string "Method parameters cannot have default values"
.LC27:
        .string "Expected '{' to start method body"
.LC28:
        .string "Failed to parse method body statement"
.LC29:
        .string "Method missing return statement"
parse_method:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
        mov     QWORD PTR [rbp-104], rdi
        mov     QWORD PTR [rbp-112], rsi
        mov     QWORD PTR [rbp-120], rdx
        mov     QWORD PTR [rbp-128], rcx
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-112]
        mov     rdi, rax
        call    create_symbol_table
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR SELF_KEYWORD[rip]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-120]
        mov     esi, 3
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L48
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L49
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    is_builtin_type
        test    al, al
        jne     .L48
.L49:
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC19
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L48:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L51
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC20
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L51:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L52
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC21
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L52:
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     rdi, rax
        mov     rdx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rax
        mov     esi, 2
        call    create_symbol
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L53
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L54
.L53:
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC22
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L54:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L55
        mov     rdx, QWORD PTR SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L56
.L55:
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC23
        call    parser_error
.L56:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        call    create_list
        mov     QWORD PTR [rbp-64], rax
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-120]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L57
.L65:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L58
        mov     rdx, QWORD PTR COMMA_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L58
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        nop
        mov     rdx, QWORD PTR [rbp-128]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-72], rax
        cmp     QWORD PTR [rbp-72], 0
        jne     .L62
        jmp     .L75
.L58:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L60
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L61
.L60:
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC24
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L75:
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC25
        call    parser_error
        jmp     .L63
.L62:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L64
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC26
        call    parser_error
        jmp     .L63
.L64:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L63:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L57:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L65
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L65
.L61:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L66
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L67
.L66:
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC27
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L67:
        call    create_list
        mov     QWORD PTR [rbp-80], rax
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax+8], 1
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax+9], 1
        mov     BYTE PTR [rbp-9], 0
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L68
.L72:
        mov     rdx, QWORD PTR [rbp-128]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L69
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC28
        call    parser_error
        jmp     .L70
.L69:
        cmp     BYTE PTR [rbp-9], 0
        je      .L70
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC17
        call    parser_error
.L70:
        cmp     QWORD PTR [rbp-88], 0
        je      .L71
        mov     rax, QWORD PTR [rbp-88]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 5
        jne     .L71
        mov     BYTE PTR [rbp-9], 1
.L71:
        mov     rdx, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L68:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L72
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L72
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax+9], 0
        cmp     BYTE PTR [rbp-9], 0
        jne     .L73
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-40], rax
        je      .L73
        mov     rax, QWORD PTR [rbp-128]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC29
        call    parser_error
.L73:
        cmp     BYTE PTR [rbp-9], 0
        jne     .L74
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-40], rax
        jne     .L74
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L74:
        mov     r8, QWORD PTR [rbp-24]
        mov     rdi, QWORD PTR [rbp-80]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     r9, r8
        mov     r8, rdi
        mov     rdi, rax
        call    create_method_use_ptr
.L50:
        leave
        ret
.LC30:
        .string "Expected class name after 'class'"
.LC31:
        .string "Expected '{' to start class body"
.LC32:
        .string "Failed to parse class method"
.LC33:
        .string "Failed to parse class variable"
.LC34:
        .string "Unsupported type for class variable"
.LC35:
        .string "Expected ';' after class variable declaration"
.LC36:
        .string "Unexpected token in class member"
.LC37:
        .string "Constructor name conflicts with existing member"
.LC38:
        .string "0"
parse_class:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 280
        mov     QWORD PTR [rbp-264], rdi
        mov     QWORD PTR [rbp-272], rsi
        mov     QWORD PTR [rbp-280], rdx
        mov     QWORD PTR [rbp-24], 0
        mov     rax, QWORD PTR [rbp-272]
        mov     rdi, rax
        call    create_symbol_table
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-264]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L77
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC30
        call    parser_error
        mov     eax, 0
        jmp     .L78
.L77:
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, rdx
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-264]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L79
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L80
.L79:
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC31
        call    parser_error
        mov     eax, 0
        jmp     .L78
.L80:
        call    create_list
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-264]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     QWORD PTR [rbp-32], 0
        jmp     .L81
.L95:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L82
        mov     rdx, QWORD PTR METHOD_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L82
        mov     rcx, QWORD PTR [rbp-280]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-264]
        mov     rdi, rax
        call    parse_method
        mov     QWORD PTR [rbp-232], rax
        cmp     QWORD PTR [rbp-232], 0
        jne     .L83
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC32
        call    parser_error
.L83:
        mov     rax, QWORD PTR [rbp-232]
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L84
.L82:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L85
        mov     rdx, QWORD PTR VAR_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L85
        mov     rax, QWORD PTR [rbp-264]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-280]
        mov     BYTE PTR [rax+10], 1
        mov     rdx, QWORD PTR [rbp-280]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-264]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-240], rax
        mov     rax, QWORD PTR [rbp-280]
        mov     BYTE PTR [rax+10], 0
        cmp     QWORD PTR [rbp-240], 0
        jne     .L86
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC33
        call    parser_error
.L86:
        mov     rax, QWORD PTR [rbp-240]
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 1
        call    create_class_member
        mov     QWORD PTR [rbp-248], rax
        mov     rdx, QWORD PTR [rbp-248]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-248]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 1
        jne     .L87
        mov     rax, QWORD PTR [rbp-248]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-256], rax
        mov     rax, QWORD PTR name_int[rip]
        cmp     QWORD PTR [rbp-256], rax
        je      .L88
        mov     rax, QWORD PTR name_float[rip]
        cmp     QWORD PTR [rbp-256], rax
        je      .L88
        mov     rax, QWORD PTR name_string[rip]
        cmp     QWORD PTR [rbp-256], rax
        jne     .L89
.L88:
        add     QWORD PTR [rbp-32], 8
        jmp     .L87
.L89:
        mov     rax, QWORD PTR name_bool[rip]
        cmp     QWORD PTR [rbp-256], rax
        je      .L90
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-256], rax
        jne     .L91
.L90:
        add     QWORD PTR [rbp-32], 1
        jmp     .L87
.L91:
        mov     rax, QWORD PTR [rbp-256]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L92
        add     QWORD PTR [rbp-32], 8
        jmp     .L87
.L92:
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC34
        call    parser_error
.L87:
        mov     rax, QWORD PTR [rbp-264]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L93
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L107
.L93:
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC35
        call    parser_error
        jmp     .L107
.L85:
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC36
        call    parser_error
        jmp     .L84
.L107:
        nop
.L84:
        mov     rax, QWORD PTR [rbp-264]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
.L81:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L95
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L95
        mov     rdx, QWORD PTR DEFAULT_INIT_NAME[rip]
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     QWORD PTR [rbp-80], rax
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name_use_strcmp
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L96
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-88], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    create_symbol_table
        mov     rdx, QWORD PTR [rbp-88]
        mov     QWORD PTR [rdx+32], rax
        mov     rcx, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-80]
        mov     esi, 2
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-40], rax
        call    create_list
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rax+32]
        mov     rax, QWORD PTR SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rbp-64]
        mov     esi, 3
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-104], rax
        mov     rcx, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rbp-64]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        call    create_list
        mov     QWORD PTR [rbp-112], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 8
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     r9d, 0
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-88]
        mov     r8, QWORD PTR [rax+32]
        mov     rdi, QWORD PTR [rbp-112]
        mov     rcx, QWORD PTR [rbp-96]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-88]
        mov     r9, r8
        mov     r8, rdi
        mov     rdi, rax
        call    create_method_use_ptr
        mov     rax, QWORD PTR [rbp-88]
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L96:
        mov     rax, QWORD PTR [rbp-40]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 2
        je      .L97
        mov     rax, QWORD PTR [rbp-280]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC37
        call    parser_error
.L97:
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     QWORD PTR [rbp-120], rax
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-128], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    create_symbol_table
        mov     rdx, QWORD PTR [rbp-128]
        mov     QWORD PTR [rdx+32], rax
        mov     rcx, QWORD PTR [rbp-128]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-120]
        mov     esi, 2
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-136], rax
        call    create_list
        mov     QWORD PTR [rbp-144], rax
        mov     rax, QWORD PTR [rbp-128]
        mov     rcx, QWORD PTR [rax+32]
        mov     rax, QWORD PTR SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rbp-64]
        mov     esi, 3
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-152], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-160], rax
        jmp     .L98
.L100:
        mov     rdx, QWORD PTR SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-168]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L99
        jmp     .L98
.L99:
        mov     rax, QWORD PTR [rbp-168]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-168]
        mov     rax, QWORD PTR [rax]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-144]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L98:
        mov     rax, QWORD PTR [rbp-160]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-168], rax
        cmp     QWORD PTR [rbp-168], 0
        jne     .L100
        call    create_list
        mov     QWORD PTR [rbp-176], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-184], rax
        mov     rax, QWORD PTR [rbp-152]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 8
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     r9d, 0
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 0
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-176]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L101
.L104:
        mov     rax, QWORD PTR [rbp-192]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 1
        jne     .L101
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax]
        mov     rbx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-152]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rbx
        mov     rsi, rax
        mov     edi, 2
        call    create_variable_access
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 8
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     QWORD PTR [rbp-216], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L102
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+16]
        jmp     .L103
.L102:
        mov     esi, 2
        mov     edi, OFFSET FLAT:.LC38
        call    create_string
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 0
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
.L103:
        mov     QWORD PTR [rbp-224], rax
        mov     rdx, QWORD PTR [rbp-224]
        mov     rax, QWORD PTR [rbp-216]
        mov     rcx, rdx
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 13
        call    create_expression
        mov     r9d, 0
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 0
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-176]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L101:
        mov     rax, QWORD PTR [rbp-184]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-192], rax
        cmp     QWORD PTR [rbp-192], 0
        jne     .L104
        call    create_list
        mov     QWORD PTR [rbp-200], rax
        mov     rax, QWORD PTR [rbp-152]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 8
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-200]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-144]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-208], rax
        jmp     .L105
.L106:
        mov     rax, QWORD PTR [rbp-168]
        mov     rax, QWORD PTR [rax+8]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 8
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-200]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L105:
        mov     rax, QWORD PTR [rbp-208]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-168], rax
        cmp     QWORD PTR [rbp-168], 0
        jne     .L106
        mov     rax, QWORD PTR [rbp-40]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     rdx, QWORD PTR [rbp-200]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 1
        call    create_variable_access
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 8
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     r9d, 0
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-176]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-128]
        mov     r8, QWORD PTR [rax+32]
        mov     rdi, QWORD PTR [rbp-176]
        mov     rcx, QWORD PTR [rbp-144]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rbp-128]
        mov     r9, r8
        mov     r8, rdi
        mov     rdi, rax
        call    create_method_use_ptr
        mov     rax, QWORD PTR [rbp-128]
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rdi, QWORD PTR [rbp-32]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     r8, rdi
        mov     rdi, rax
        call    create_class_use_ptr
.L78:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC39:
        .string "Expected variable type"
.LC40:
        .string "Expected a type for variable declaration"
.LC41:
        .string "Unknown variable type"
.LC42:
        .string "Expected variable name"
.LC43:
        .string "Failed to parse variable initializer"
parse_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L109
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L110
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    is_builtin_type
        test    al, al
        jne     .L109
.L110:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC39
        call    parser_error
        mov     eax, 0
        jmp     .L111
.L109:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        je      .L112
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 6
        je      .L113
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        je      .L113
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC40
        call    parser_error
        jmp     .L113
.L112:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC41
        call    parser_error
.L113:
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L114
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC42
        call    parser_error
.L114:
        mov     rax, QWORD PTR [rbp-56]
        movzx   eax, BYTE PTR [rax+10]
        test    al, al
        je      .L115
        mov     rax, QWORD PTR [rbp-56]
        movzx   eax, BYTE PTR [rax+9]
        test    al, al
        jne     .L115
        mov     esi, 5
        jmp     .L116
.L115:
        mov     esi, 3
.L116:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    create_symbol
        mov     QWORD PTR [rbp-32], rax
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L117
        mov     rdx, QWORD PTR ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L117
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L117
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC43
        call    parser_error
.L117:
        mov     rdx, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    create_variable
.L111:
        leave
        ret
.LC44:
        .string "Cannot use 'break' outside of a loop"
.LC45:
        .string "Cannot use 'continue' outside of a loop"
.LC46:
        .string "Failed to parse statement"
.LC47:
        .string "Expected ';' after statement"
parse_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L119
        mov     rdx, QWORD PTR IF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L120
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_if
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 2
        call    create_statement
        jmp     .L121
.L120:
        mov     rdx, QWORD PTR FOR_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L122
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_for
        mov     r9d, 0
        mov     r8d, 0
        mov     rcx, rax
        mov     edx, 0
        mov     esi, 0
        mov     edi, 4
        call    create_statement
        jmp     .L121
.L122:
        mov     rdx, QWORD PTR WHILE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L123
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_while
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 3
        call    create_statement
        jmp     .L121
.L123:
        mov     rdx, QWORD PTR VAR_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L124
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     r9, rax
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 1
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
        jmp     .L125
.L124:
        mov     rdx, QWORD PTR RETURN_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L126
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L127
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L127
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 5
        call    create_statement
        jmp     .L121
.L127:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     r9d, 0
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 5
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
        jmp     .L125
.L126:
        mov     rdx, QWORD PTR BREAK_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L128
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax+11]
        test    al, al
        jne     .L129
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC44
        call    parser_error
        mov     eax, 0
        jmp     .L121
.L129:
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 6
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
        jmp     .L125
.L128:
        mov     rdx, QWORD PTR CONTINUE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L130
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax+11]
        test    al, al
        jne     .L131
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC45
        call    parser_error
        mov     eax, 0
        jmp     .L121
.L131:
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 7
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
        jmp     .L125
.L130:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     r9d, 0
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 0
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
        jmp     .L125
.L119:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     r9d, 0
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 0
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
.L125:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L132
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC46
        call    parser_error
.L132:
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L133
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L134
.L133:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC47
        call    parser_error
.L134:
        mov     rax, QWORD PTR [rbp-8]
.L121:
        leave
        ret
.LC48:
        .string "Expected '(' after 'if'"
.LC49:
        .string "Failed to parse if condition"
.LC50:
        .string "Expected ')' after if condition"
.LC51:
        .string "Expected '{' to start if body"
.LC52:
        .string "Failed to parse if body statement"
.LC53:
        .string "Expected '(' after 'elif'"
.LC54:
        .string "Failed to parse else-if condition"
.LC55:
        .string "Expected ')' after else-if condition"
.LC56:
        .string "Expected '{' to start else-if body"
.LC57:
        .string "Failed to parse else-if body statement"
.LC58:
        .string "Expected '{' to start else body"
.LC59:
        .string "Failed to parse else body statement"
parse_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR [rbp-88], rdi
        mov     QWORD PTR [rbp-96], rsi
        mov     QWORD PTR [rbp-104], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L136
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L137
.L136:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC48
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L137:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L139
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC49
        call    parser_error
.L139:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L140
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L141
.L140:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC50
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L141:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L142
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L143
.L142:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC51
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L143:
        call    create_list
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L144
.L146:
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L145
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC52
        call    parser_error
.L145:
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L144:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L146
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L146
        call    create_list
        mov     QWORD PTR [rbp-32], rax
        call    create_list
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L147
.L159:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L148
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L149
.L148:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC53
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L149:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L150
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC54
        call    parser_error
.L150:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L151
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L152
.L151:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC55
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L152:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L153
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L154
.L153:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC56
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L154:
        call    create_list
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L155
.L157:
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-64], rax
        cmp     QWORD PTR [rbp-64], 0
        jne     .L156
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC57
        call    parser_error
.L156:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L155:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L157
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L157
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_else_if
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
.L147:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L158
        mov     rdx, QWORD PTR ELIF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L159
.L158:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L160
        mov     rdx, QWORD PTR ELSE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L160
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L161
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L162
.L161:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC58
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L162:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L163
.L165:
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-72], rax
        cmp     QWORD PTR [rbp-72], 0
        jne     .L164
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC59
        call    parser_error
.L164:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L163:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L165
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L165
.L160:
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-8], rax
        mov     rcx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    create_if
.L138:
        leave
        ret
.LC60:
        .string "Expected '(' after 'for'"
.LC61:
        .string "Failed to parse for loop initializer"
.LC62:
        .string "Expected ';' after for loop initializer"
.LC63:
        .string "Failed to parse for loop condition"
.LC64:
        .string "Expected ';' after for loop condition"
.LC65:
        .string "Failed to parse for loop increment"
.LC66:
        .string "Expected ')' after for loop increment"
.LC67:
        .string "Expected '{' to start for loop body"
.LC68:
        .string "Failed to parse for loop body statement"
parse_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L167
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L168
.L167:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC60
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L168:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L170
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L171
.L170:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L172
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC61
        call    parser_error
.L172:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L171:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L173
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L174
.L173:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC62
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L174:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     QWORD PTR [rbp-24], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L175
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L176
.L175:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L177
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC63
        call    parser_error
.L177:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L176:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L178
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L179
.L178:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC64
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L179:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     QWORD PTR [rbp-32], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L180
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L181
.L180:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L182
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC65
        call    parser_error
.L182:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L181:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L183
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L184
.L183:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC66
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L184:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L185
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L186
.L185:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC67
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L186:
        call    create_list
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     BYTE PTR [rax+11], 1
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L187
.L189:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L188
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC68
        call    parser_error
.L188:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L187:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L189
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L189
        mov     rax, QWORD PTR [rbp-72]
        mov     BYTE PTR [rax+11], 0
        mov     rcx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    create_for
.L169:
        leave
        ret
.LC69:
        .string "Expected '(' after 'while'"
.LC70:
        .string "Failed to parse while condition"
.LC71:
        .string "Expected ')' after while condition"
.LC72:
        .string "Expected '{' to start while body"
.LC73:
        .string "Failed to parse while body statement"
parse_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L191
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L192
.L191:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC69
        call    parser_error
        mov     eax, 0
        jmp     .L193
.L192:
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L194
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC70
        call    parser_error
.L194:
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L195
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L196
.L195:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC71
        call    parser_error
        mov     eax, 0
        jmp     .L193
.L196:
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L197
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L198
.L197:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC72
        call    parser_error
        mov     eax, 0
        jmp     .L193
.L198:
        call    create_list
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     BYTE PTR [rax+11], 1
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L199
.L201:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L200
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC73
        call    parser_error
.L200:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L199:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L201
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L201
        mov     rax, QWORD PTR [rbp-56]
        mov     BYTE PTR [rax+11], 0
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_while
.L193:
        leave
        ret
.LC74:
        .string "Failed to parse right operand"
parse_expr_prec:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     DWORD PTR [rbp-68], edx
        mov     QWORD PTR [rbp-80], rcx
        mov     QWORD PTR [rbp-88], r8
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L203
.L211:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    string_to_operator
        mov     DWORD PTR [rbp-20], eax
        mov     eax, DWORD PTR [rbp-20]
        mov     edi, eax
        call    operator_precedence
        mov     DWORD PTR [rbp-24], eax
        cmp     DWORD PTR [rbp-20], 19
        je      .L204
        mov     eax, DWORD PTR [rbp-24]
        cmp     eax, DWORD PTR [rbp-68]
        jl      .L204
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L205
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC74
        call    parser_error
        mov     eax, 0
        jmp     .L206
.L205:
        mov     rax, QWORD PTR [rbp-32]
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L207
.L210:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    string_to_operator
        mov     DWORD PTR [rbp-36], eax
        mov     eax, DWORD PTR [rbp-36]
        mov     edi, eax
        call    operator_precedence
        mov     DWORD PTR [rbp-40], eax
        cmp     DWORD PTR [rbp-36], 19
        je      .L208
        mov     eax, DWORD PTR [rbp-40]
        cmp     eax, DWORD PTR [rbp-24]
        jle     .L208
        mov     rdi, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     edx, DWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-56]
        mov     r8, rdi
        mov     rdi, rax
        call    parse_expr_prec
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L209
        mov     eax, 0
        jmp     .L206
.L209:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
.L207:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        je      .L210
.L208:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, QWORD PTR [rbp-64]
        mov     eax, DWORD PTR [rbp-20]
        mov     rcx, rdx
        mov     edx, 0
        mov     edi, eax
        call    create_expression
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
.L203:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        je      .L211
.L204:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-64]
.L206:
        leave
        ret
.LC75:
        .string "Failed to parse expression primary"
parse_expression:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L213
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    peek_current_token
        mov     rdx, rbx
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC75
        call    parser_error
        mov     eax, 0
        jmp     .L214
.L213:
        mov     rax, QWORD PTR [rbp-24]
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     rsi, rax
        mov     rcx, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     r8, rcx
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    parse_expr_prec
.L214:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC76:
        .string "Failed to parse parenthesized expression"
.LC77:
        .string "Expected ')' after expression"
.LC78:
        .string "Failed to parse operand of unary '!'"
.LC79:
        .string "Failed to parse operand of unary '-'"
.LC80:
        .string "Failed to parse variable access"
.LC81:
        .string "Unexpected token in primary expression"
parse_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     QWORD PTR [rbp-48], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-48], rax
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-24], 0
        mov     QWORD PTR [rbp-32], 0
        mov     QWORD PTR [rbp-40], 0
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 2
        jne     .L216
        mov     DWORD PTR [rbp-4], 0
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L217
.L216:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 3
        jne     .L218
        mov     DWORD PTR [rbp-4], 1
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L217
.L218:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        jne     .L219
        mov     DWORD PTR [rbp-4], 2
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L217
.L219:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L220
        mov     rdx, QWORD PTR TRUE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L220
        mov     DWORD PTR [rbp-4], 3
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L217
.L220:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L221
        mov     rdx, QWORD PTR FALSE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L221
        mov     DWORD PTR [rbp-4], 4
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L217
.L221:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L222
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L222
        mov     DWORD PTR [rbp-4], 5
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L223
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC76
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L223:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L225
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L234
.L225:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC77
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L222:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L227
        mov     rdx, QWORD PTR NOT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L227
        mov     DWORD PTR [rbp-4], 6
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L217
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC78
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L227:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L229
        mov     rdx, QWORD PTR SUB_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L229
        mov     DWORD PTR [rbp-4], 7
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L217
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC79
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L229:
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L231
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L232
        mov     rdx, QWORD PTR SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L232
        mov     rax, QWORD PTR [rbp-72]
        movzx   eax, BYTE PTR [rax+9]
        test    al, al
        je      .L232
.L231:
        mov     DWORD PTR [rbp-4], 8
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable_access
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L217
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC80
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L232:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC81
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L234:
        nop
.L217:
        mov     rdi, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rbp-4]
        mov     r8, rdi
        mov     edi, eax
        call    create_primary
.L224:
        leave
        ret
.LC82:
        .string "Expected variable name in variable access"
.LC83:
        .string "Cannot call undefined variable"
.LC84:
        .string "Cannot call non-function variable"
.LC85:
        .string "Failed to parse function call argument"
.LC86:
        .string "Expected ',' or ')' after function call argument"
.LC87:
        .string "Failed to parse sequence index"
.LC88:
        .string "Expected ']' after sequence index"
.LC89:
        .string "Cannot access attribute without a valid scope"
.LC90:
        .string "Expected attribute name after '.'"
.LC91:
        .string "Unknown attribute name"
parse_variable_access:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
        mov     QWORD PTR [rbp-104], rdi
        mov     QWORD PTR [rbp-112], rsi
        mov     QWORD PTR [rbp-120], rdx
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L236
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L237
        mov     rdx, QWORD PTR SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L236
.L237:
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC82
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L236:
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-24], 0
        mov     QWORD PTR [rbp-32], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L239
.L264:
        cmp     QWORD PTR [rbp-24], 0
        je      .L240
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L240
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
.L240:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L241
        cmp     QWORD PTR [rbp-16], 0
        je      .L241
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L241
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-32], rax
.L241:
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L242
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L243
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC83
        call    parser_error
        jmp     .L244
.L243:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L244
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name_use_strcmp
        mov     QWORD PTR [rbp-24], rax
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-40]
        mov     r8d, 0
        mov     ecx, 0
        mov     rsi, rax
        mov     edi, 2
        call    create_variable_access
        mov     QWORD PTR [rbp-40], rax
.L244:
        cmp     QWORD PTR [rbp-24], 0
        je      .L245
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 1
        je      .L245
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 2
        je      .L245
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC84
        call    parser_error
.L245:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        call    create_list
        mov     QWORD PTR [rbp-80], rax
        jmp     .L246
.L250:
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L247
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC85
        call    parser_error
.L247:
        mov     rdx, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L248
        mov     rdx, QWORD PTR COMMA_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L248
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L246
.L248:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L249
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L246
.L249:
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC86
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L246:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L250
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L250
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-40]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 1
        call    create_variable_access
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-32], 0
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L251
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-32], rax
        jmp     .L251
.L242:
        mov     rdx, QWORD PTR L_BRACKET_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L252
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-64], rax
        cmp     QWORD PTR [rbp-64], 0
        jne     .L253
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC87
        call    parser_error
.L253:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L254
        mov     rdx, QWORD PTR R_BRACKET_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L255
.L254:
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC88
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L255:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     r8d, 0
        mov     rcx, rdx
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 3
        call    create_variable_access
        mov     QWORD PTR [rbp-40], rax
        jmp     .L251
.L252:
        mov     rdx, QWORD PTR DOT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L265
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L257
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC89
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L257:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L258
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC90
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L258:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L259
        mov     QWORD PTR [rbp-48], 0
        cmp     QWORD PTR [rbp-16], 0
        je      .L260
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L261
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-48], rax
        jmp     .L260
.L261:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L260
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L260
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-48], rax
.L260:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     QWORD PTR [rbp-56], rax
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name_use_strcmp
        mov     QWORD PTR [rbp-24], rax
.L259:
        cmp     QWORD PTR [rbp-24], 0
        jne     .L262
        mov     rax, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC91
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L262:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-40]
        mov     r8d, 0
        mov     ecx, 0
        mov     rsi, rax
        mov     edi, 2
        call    create_variable_access
        mov     QWORD PTR [rbp-40], rax
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-32], 0
.L251:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
.L239:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        je      .L264
        jmp     .L263
.L265:
        nop
.L263:
        mov     rax, QWORD PTR [rbp-40]
.L238:
        leave
        ret

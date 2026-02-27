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
        sub     rsp, 96
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     QWORD PTR [rbp-88], rdx
        mov     rax, QWORD PTR builtin_scope[rip]
        test    rax, rax
        jne     .L2
        mov     edi, 0
        call    create_scope
        mov     QWORD PTR builtin_scope[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR VOID_KEYWORD[rip]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR name_void[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR INT_KEYWORD[rip]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR name_int[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR FLOAT_KEYWORD[rip]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR name_float[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR STRING_KEYWORD[rip]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR name_string[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR BOOL_KEYWORD[rip]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR name_bool[rip], rax
.L2:
        cmp     QWORD PTR [rbp-80], 0
        jne     .L3
        mov     rax, QWORD PTR builtin_scope[rip]
        mov     QWORD PTR [rbp-80], rax
.L3:
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        call    create_list
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    create_scope
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L4
.L13:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L5
        mov     rdx, QWORD PTR IMPORT_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L5
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    parse_import
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L6
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    parser_error
.L6:
        mov     rax, QWORD PTR [rbp-40]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 0
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L7
.L5:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L8
        mov     rdx, QWORD PTR FUNC_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L8
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_function
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L9
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        call    parser_error
.L9:
        mov     rax, QWORD PTR [rbp-48]
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 1
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L7
.L8:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L10
        mov     rdx, QWORD PTR CLASS_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L10
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_class
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-56], 0
        jne     .L11
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC2
        call    parser_error
.L11:
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 0
        mov     esi, 0
        mov     edi, 2
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L7
.L10:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC3
        call    parser_error
.L7:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L4:
        cmp     QWORD PTR [rbp-8], 0
        je      .L12
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        jne     .L13
.L12:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
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
parse_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L16
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC4
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L16:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-40], rax
        mov     QWORD PTR [rbp-24], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L18
        mov     rdx, QWORD PTR FROM_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L18
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        je      .L19
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC5
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L19:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L18:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L20
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L21
.L20:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC6
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L21:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_import_file
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L22
        mov     rdx, QWORD PTR name_void[rip]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     r8, rcx
        mov     ecx, 0
        mov     esi, 1
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR [rbp-32], rax
.L22:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_import
.L17:
        leave
        ret
.LC7:
        .string "Expected function return type after 'func'"
.LC8:
        .string "Unknown function return type"
.LC9:
        .string "Expected function name after return type"
.LC10:
        .string "Expected '(' after function name"
.LC11:
        .string "Failed to parse function parameter"
.LC12:
        .string "Function parameters cannot have default values"
.LC13:
        .string "Expected ',' or ')' after function parameter"
.LC14:
        .string "Expected '{' to start function body"
.LC15:
        .string "Failed to parse function body statement"
.LC16:
        .string "Unreachable code after return statement"
.LC17:
        .string "Function missing return statement"
parse_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR [rbp-88], rdi
        mov     QWORD PTR [rbp-96], rsi
        mov     QWORD PTR [rbp-104], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-96]
        mov     rdi, rax
        call    create_scope
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L24
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L25
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    is_builtin_type
        test    al, al
        jne     .L24
.L25:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L24:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    search
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L27
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC8
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
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L28
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC9
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L28:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-96]
        mov     rdx, QWORD PTR [rbp-40]
        mov     r8, rcx
        mov     ecx, 0
        mov     esi, 2
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L29
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L30
.L29:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC10
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L30:
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        call    create_list
        mov     QWORD PTR [rbp-56], rax
        jmp     .L31
.L37:
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L32
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC11
        call    parser_error
        jmp     .L33
.L32:
        mov     rax, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L34
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC12
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
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L35
        mov     rdx, QWORD PTR COMMA_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L31
.L35:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L36
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L31
.L36:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC13
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L31:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L37
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
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
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L38
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L39
.L38:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC14
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L39:
        call    create_list
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     BYTE PTR [rax], 1
        mov     BYTE PTR [rbp-17], 0
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L40
.L44:
        mov     rdx, QWORD PTR [rbp-104]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-72], rax
        cmp     QWORD PTR [rbp-72], 0
        jne     .L41
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC15
        call    parser_error
        jmp     .L42
.L41:
        cmp     BYTE PTR [rbp-17], 0
        je      .L42
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC16
        call    parser_error
.L42:
        mov     rax, QWORD PTR [rbp-72]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 5
        jne     .L43
        mov     BYTE PTR [rbp-17], 1
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
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L40:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L44
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L44
        mov     rax, QWORD PTR [rbp-104]
        mov     BYTE PTR [rax], 0
        cmp     BYTE PTR [rbp-17], 0
        jne     .L45
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-40], rax
        je      .L45
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC17
        call    parser_error
.L45:
        mov     rdi, QWORD PTR [rbp-32]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-48]
        mov     r8, rdi
        mov     rdi, rax
        call    create_function
.L26:
        leave
        ret
.LC18:
        .string "Expected method return type after 'method'"
.LC19:
        .string "Unknown return type for method"
.LC20:
        .string "Expected method name after return type"
.LC21:
        .string "Expected '(' after method name"
.LC22:
        .string "Expected 'self' as first parameter of method"
.LC23:
        .string "Expected ',' or ')' after method parameter"
.LC24:
        .string "Failed to parse method parameter"
.LC25:
        .string "Method parameters cannot have default values"
.LC26:
        .string "Expected '{' to start method body"
.LC27:
        .string "Failed to parse method body statement"
.LC28:
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
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-112]
        mov     rdi, rax
        call    create_scope
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR SELF_KEYWORD[rip]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-120]
        mov     r8, rcx
        mov     ecx, 0
        mov     esi, 1
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L47
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L48
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    is_builtin_type
        test    al, al
        jne     .L47
.L48:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC18
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L47:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    search
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L50
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC19
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L50:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L51
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC20
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L51:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rdx, QWORD PTR [rbp-48]
        mov     r8, rcx
        mov     ecx, 0
        mov     esi, 3
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L52
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L53
.L52:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC21
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L53:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L54
        mov     rdx, QWORD PTR SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L55
.L54:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC22
        call    parser_error
.L55:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        call    create_list
        mov     QWORD PTR [rbp-64], rax
        mov     rcx, QWORD PTR [rbp-40]
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
        jmp     .L56
.L64:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L57
        mov     rdx, QWORD PTR COMMA_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L57
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-128]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-72], rax
        cmp     QWORD PTR [rbp-72], 0
        je      .L58
        jmp     .L73
.L57:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L60
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L61
.L60:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC23
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L58:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC24
        call    parser_error
        jmp     .L62
.L73:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L63
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC25
        call    parser_error
        jmp     .L62
.L63:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L62:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L56:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L64
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L64
.L61:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L65
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L66
.L65:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC26
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L66:
        call    create_list
        mov     QWORD PTR [rbp-80], rax
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax], 1
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax+1], 1
        mov     BYTE PTR [rbp-17], 0
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L67
.L71:
        mov     rdx, QWORD PTR [rbp-128]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L68
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC27
        call    parser_error
        jmp     .L69
.L68:
        cmp     BYTE PTR [rbp-17], 0
        je      .L69
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC16
        call    parser_error
.L69:
        mov     rax, QWORD PTR [rbp-88]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 5
        jne     .L70
        mov     BYTE PTR [rbp-17], 1
.L70:
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
        mov     QWORD PTR [rbp-16], rax
.L67:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L71
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L71
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax+1], 0
        cmp     BYTE PTR [rbp-17], 0
        jne     .L72
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-48], rax
        je      .L72
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC28
        call    parser_error
.L72:
        mov     rdi, QWORD PTR [rbp-32]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-56]
        mov     r8, rdi
        mov     rdi, rax
        call    create_method
.L49:
        leave
        ret
.LC29:
        .string "Expected class name after 'class'"
.LC30:
        .string "Expected '{' to start class body"
.LC31:
        .string "Failed to parse class method"
.LC32:
        .string "Failed to parse class variable"
.LC33:
        .string "Expected ';' after class variable declaration"
.LC34:
        .string "Unexpected token in class member"
parse_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     QWORD PTR [rbp-88], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    create_scope
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L75
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC29
        call    parser_error
        mov     eax, 0
        jmp     .L76
.L75:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rdx, QWORD PTR [rbp-24]
        mov     r8, rcx
        mov     rcx, rdx
        mov     edx, 0
        mov     esi, 4
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L77
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L78
.L77:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC30
        call    parser_error
        mov     eax, 0
        jmp     .L76
.L78:
        call    create_list
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L79
.L87:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L80
        mov     rdx, QWORD PTR METHOD_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L80
        mov     rcx, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    parse_method
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L81
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC31
        call    parser_error
.L81:
        mov     rax, QWORD PTR [rbp-48]
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L82
.L80:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L83
        mov     rdx, QWORD PTR VAR_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L83
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-56], 0
        jne     .L84
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC32
        call    parser_error
.L84:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 1
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L85
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L88
.L85:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC33
        call    parser_error
        jmp     .L88
.L83:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC34
        call    parser_error
        jmp     .L82
.L88:
        nop
.L82:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L79:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L87
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L87
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rcx
        mov     rdi, rax
        call    create_class
.L76:
        leave
        ret
.LC35:
        .string "Expected variable type"
.LC36:
        .string "Expected a type for variable declaration"
.LC37:
        .string "Unknown variable type"
.LC38:
        .string "Expected variable name"
.LC39:
        .string "Failed to parse variable initializer"
parse_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-24], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L90
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L91
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    is_builtin_type
        test    al, al
        jne     .L90
.L91:
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC35
        call    parser_error
        mov     eax, 0
        jmp     .L92
.L90:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    search
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        je      .L93
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        je      .L94
        mov     rax, QWORD PTR [rbp-40]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        je      .L94
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC36
        call    parser_error
        jmp     .L94
.L93:
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC37
        call    parser_error
.L94:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L95
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC38
        call    parser_error
.L95:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-32]
        mov     r8, rcx
        mov     ecx, 0
        mov     esi, 1
        mov     rdi, rax
        call    create_name
        mov     QWORD PTR [rbp-48], rax
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L96
        mov     rdx, QWORD PTR ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L96
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L96
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC39
        call    parser_error
.L96:
        mov     rdx, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rcx
        mov     rdi, rax
        call    create_variable
.L92:
        leave
        ret
.LC40:
        .string "Cannot use 'break' outside of a loop"
.LC41:
        .string "Cannot use 'continue' outside of a loop"
.LC42:
        .string "Failed to parse statement"
.LC43:
        .string "Expected ';' after statement"
parse_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-24], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L98
        mov     rdx, QWORD PTR IF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L99
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
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
        jmp     .L100
.L99:
        mov     rdx, QWORD PTR FOR_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L101
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
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
        jmp     .L100
.L101:
        mov     rdx, QWORD PTR WHILE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L102
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
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
        jmp     .L100
.L102:
        mov     rdx, QWORD PTR VAR_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L103
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
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
        jmp     .L104
.L103:
        mov     rdx, QWORD PTR RETURN_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L105
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
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
        jmp     .L104
.L105:
        mov     rdx, QWORD PTR BREAK_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L106
        mov     rax, QWORD PTR [rbp-56]
        movzx   eax, BYTE PTR [rax+2]
        test    al, al
        jne     .L107
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC40
        call    parser_error
        mov     eax, 0
        jmp     .L100
.L107:
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 6
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
        jmp     .L104
.L106:
        mov     rdx, QWORD PTR CONTINUE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L108
        mov     rax, QWORD PTR [rbp-56]
        movzx   eax, BYTE PTR [rax+2]
        test    al, al
        jne     .L109
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC41
        call    parser_error
        mov     eax, 0
        jmp     .L100
.L109:
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 7
        call    create_statement
        mov     QWORD PTR [rbp-8], rax
        jmp     .L104
.L108:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
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
        jmp     .L104
.L98:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
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
.L104:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L110
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC42
        call    parser_error
.L110:
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L111
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L112
.L111:
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC43
        call    parser_error
.L112:
        mov     rax, QWORD PTR [rbp-8]
.L100:
        leave
        ret
.LC44:
        .string "Expected '(' after 'if'"
.LC45:
        .string "Failed to parse if condition"
.LC46:
        .string "Expected ')' after if condition"
.LC47:
        .string "Expected '{' to start if body"
.LC48:
        .string "Failed to parse if body statement"
.LC49:
        .string "Expected '(' after 'elif'"
.LC50:
        .string "Failed to parse else-if condition"
.LC51:
        .string "Expected ')' after else-if condition"
.LC52:
        .string "Expected '{' to start else-if body"
.LC53:
        .string "Failed to parse else-if body statement"
.LC54:
        .string "Expected '{' to start else body"
.LC55:
        .string "Failed to parse else body statement"
parse_if:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
        mov     QWORD PTR [rbp-104], rdi
        mov     QWORD PTR [rbp-112], rsi
        mov     QWORD PTR [rbp-120], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L114
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L115
.L114:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC44
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L115:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L117
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC45
        call    parser_error
.L117:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L118
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L119
.L118:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC46
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L119:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L120
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L121
.L120:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC47
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L121:
        call    create_list
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L122
.L124:
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L123
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC48
        call    parser_error
.L123:
        mov     rdx, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L122:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L124
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L124
        call    create_list
        mov     QWORD PTR [rbp-40], rax
        call    create_list
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L125
.L137:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L126
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L127
.L126:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC49
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L127:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-56], 0
        jne     .L128
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC50
        call    parser_error
.L128:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L129
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L130
.L129:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC51
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L130:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L131
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L132
.L131:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC52
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L132:
        call    create_list
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L133
.L135:
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-72], rax
        cmp     QWORD PTR [rbp-72], 0
        jne     .L134
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC53
        call    parser_error
.L134:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L133:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L135
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L135
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_else_if
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L125:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L136
        mov     rdx, QWORD PTR ELIF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L137
.L136:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L138
        mov     rdx, QWORD PTR ELSE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L138
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L139
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L140
.L139:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC54
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L140:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L141
.L143:
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L142
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC55
        call    parser_error
.L142:
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L141:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L143
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L143
.L138:
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rcx, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    create_if
.L116:
        leave
        ret
.LC56:
        .string "Expected '(' after 'for'"
.LC57:
        .string "Failed to parse for loop initializer"
.LC58:
        .string "Expected ';' after for loop initializer"
.LC59:
        .string "Failed to parse for loop condition"
.LC60:
        .string "Expected ';' after for loop condition"
.LC61:
        .string "Failed to parse for loop increment"
.LC62:
        .string "Expected ')' after for loop increment"
.LC63:
        .string "Expected '{' to start for loop body"
.LC64:
        .string "Failed to parse for loop body statement"
parse_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     QWORD PTR [rbp-88], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L145
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L146
.L145:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC56
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L146:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-24], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L148
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L149
.L148:
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L150
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC57
        call    parser_error
.L150:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L149:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L151
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L152
.L151:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC58
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L152:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-32], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L153
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L154
.L153:
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L155
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC59
        call    parser_error
.L155:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L154:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L156
        mov     rdx, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L157
.L156:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC60
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L157:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-40], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L158
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L159
.L158:
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L160
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC61
        call    parser_error
.L160:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L159:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L161
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L162
.L161:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC62
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L162:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L163
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L164
.L163:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC63
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L164:
        call    create_list
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     BYTE PTR [rax+2], 1
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L165
.L167:
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-56], 0
        jne     .L166
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC64
        call    parser_error
.L166:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L165:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L167
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L167
        mov     rax, QWORD PTR [rbp-88]
        mov     BYTE PTR [rax+2], 0
        mov     rcx, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    create_for
.L147:
        leave
        ret
.LC65:
        .string "Expected '(' after 'while'"
.LC66:
        .string "Failed to parse while condition"
.LC67:
        .string "Expected ')' after while condition"
.LC68:
        .string "Expected '{' to start while body"
.LC69:
        .string "Failed to parse while body statement"
parse_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L169
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L170
.L169:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC65
        call    parser_error
        mov     eax, 0
        jmp     .L171
.L170:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L172
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC66
        call    parser_error
.L172:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L173
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L174
.L173:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC67
        call    parser_error
        mov     eax, 0
        jmp     .L171
.L174:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L175
        mov     rdx, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L176
.L175:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC68
        call    parser_error
        mov     eax, 0
        jmp     .L171
.L176:
        call    create_list
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     BYTE PTR [rax+2], 1
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L177
.L179:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_statement
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L178
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC69
        call    parser_error
.L178:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L177:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L179
        mov     rdx, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L179
        mov     rax, QWORD PTR [rbp-72]
        mov     BYTE PTR [rax+2], 0
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_while
.L171:
        leave
        ret
.LC70:
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
        mov     QWORD PTR [rbp-24], 0
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L181
.L189:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    string_to_operator
        mov     DWORD PTR [rbp-28], eax
        mov     eax, DWORD PTR [rbp-28]
        mov     edi, eax
        call    operator_precedence
        mov     DWORD PTR [rbp-32], eax
        cmp     DWORD PTR [rbp-28], 19
        je      .L182
        mov     eax, DWORD PTR [rbp-32]
        cmp     eax, DWORD PTR [rbp-68]
        jl      .L182
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L183
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC70
        call    parser_error
        mov     eax, 0
        jmp     .L184
.L183:
        mov     rax, QWORD PTR [rbp-40]
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
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L185
.L188:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    string_to_operator
        mov     DWORD PTR [rbp-44], eax
        mov     eax, DWORD PTR [rbp-44]
        mov     edi, eax
        call    operator_precedence
        mov     DWORD PTR [rbp-48], eax
        cmp     DWORD PTR [rbp-44], 19
        je      .L186
        mov     eax, DWORD PTR [rbp-48]
        cmp     eax, DWORD PTR [rbp-32]
        jle     .L186
        mov     rdi, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     edx, DWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-56]
        mov     r8, rdi
        mov     rdi, rax
        call    parse_expr_prec
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L187
        mov     eax, 0
        jmp     .L184
.L187:
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
.L185:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        je      .L188
.L186:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, QWORD PTR [rbp-64]
        mov     eax, DWORD PTR [rbp-28]
        mov     rcx, rdx
        mov     edx, 0
        mov     edi, eax
        call    create_expression
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
.L181:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        je      .L189
.L182:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-64]
.L184:
        leave
        ret
.LC71:
        .string "Failed to parse expression primary"
parse_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L191
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    peek_current_token
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC71
        call    parser_error
        mov     eax, 0
        jmp     .L192
.L191:
        mov     rax, QWORD PTR [rbp-8]
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     rsi, rax
        mov     rcx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     r8, rcx
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    parse_expr_prec
.L192:
        leave
        ret
.LC72:
        .string "Failed to parse parenthesized expression"
.LC73:
        .string "Expected ')' after expression"
.LC74:
        .string "Failed to parse operand of unary '!'"
.LC75:
        .string "Failed to parse operand of unary '-'"
.LC76:
        .string "Failed to parse variable access"
.LC77:
        .string "Unexpected token in primary expression"
parse_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     QWORD PTR [rbp-88], rdx
        mov     QWORD PTR [rbp-48], 0
        mov     QWORD PTR [rbp-56], 0
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    peek_current_token
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-56], rax
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-24], 0
        mov     QWORD PTR [rbp-32], 0
        mov     QWORD PTR [rbp-40], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 2
        jne     .L194
        mov     DWORD PTR [rbp-4], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L195
.L194:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 3
        jne     .L196
        mov     DWORD PTR [rbp-4], 1
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L195
.L196:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        jne     .L197
        mov     DWORD PTR [rbp-4], 2
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L195
.L197:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L198
        mov     rdx, QWORD PTR TRUE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L198
        mov     DWORD PTR [rbp-4], 3
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L195
.L198:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L199
        mov     rdx, QWORD PTR FALSE_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L199
        mov     DWORD PTR [rbp-4], 4
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L195
.L199:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L200
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L200
        mov     DWORD PTR [rbp-4], 5
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-56], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L201
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC72
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L201:
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L203
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L212
.L203:
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC73
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L200:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L205
        mov     rdx, QWORD PTR NOT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L205
        mov     DWORD PTR [rbp-4], 6
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-56], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L195
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC74
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L205:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L207
        mov     rdx, QWORD PTR SUB_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L207
        mov     DWORD PTR [rbp-4], 7
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-56], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_primary
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L195
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC75
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L207:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L209
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L210
        mov     rdx, QWORD PTR SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L210
        mov     rax, QWORD PTR [rbp-88]
        movzx   eax, BYTE PTR [rax+1]
        test    al, al
        je      .L210
.L209:
        mov     DWORD PTR [rbp-4], 8
        mov     rdx, QWORD PTR [rbp-88]
        mov     rcx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_variable_access
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L195
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC76
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L210:
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC77
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L212:
        nop
.L195:
        mov     rdi, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rbp-4]
        mov     r8, rdi
        mov     edi, eax
        call    create_primary
.L202:
        leave
        ret
.LC78:
        .string "Expected variable name in variable access"
.LC79:
        .string "Cannot call undefined variable"
.LC80:
        .string "Cannot call non-function variable"
.LC81:
        .string "Failed to parse function call argument"
.LC82:
        .string "Expected ',' or ')' after function call argument"
.LC83:
        .string "Failed to parse sequence index"
.LC84:
        .string "Expected ']' after sequence index"
.LC85:
        .string "Cannot access attribute without a valid scope"
.LC86:
        .string "Expected attribute name after '.'"
.LC87:
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
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L214
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L215
        mov     rdx, QWORD PTR SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L214
.L215:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC78
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L214:
        mov     QWORD PTR [rbp-24], 0
        mov     QWORD PTR [rbp-32], 0
        mov     QWORD PTR [rbp-40], 0
        mov     QWORD PTR [rbp-56], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    search
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-32]
        mov     r8d, 0
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_variable_access
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L217
.L241:
        cmp     QWORD PTR [rbp-32], 0
        je      .L218
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L219
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        je      .L219
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 2
        je      .L219
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 3
        jne     .L220
.L219:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-24], rax
        jmp     .L218
.L220:
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        je      .L221
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        jne     .L218
.L221:
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rbp-24], rax
.L218:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L222
        cmp     QWORD PTR [rbp-24], 0
        je      .L222
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        jne     .L222
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-40], rax
.L222:
        mov     rdx, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L223
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L224
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC79
        call    parser_error
.L224:
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 2
        je      .L225
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 3
        je      .L225
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC80
        call    parser_error
.L225:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        call    create_list
        mov     QWORD PTR [rbp-80], rax
        jmp     .L226
.L230:
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L227
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC81
        call    parser_error
.L227:
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
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L228
        mov     rdx, QWORD PTR COMMA_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L228
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L226
.L228:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L229
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L226
.L229:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC82
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L226:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L230
        mov     rdx, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L230
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-48]
        mov     r8, rdx
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 1
        call    create_variable_access
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-32], rax
        mov     QWORD PTR [rbp-24], 0
        mov     QWORD PTR [rbp-40], 0
        jmp     .L231
.L223:
        mov     rdx, QWORD PTR L_BRACKET_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L232
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-120]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_expression
        mov     QWORD PTR [rbp-72], rax
        cmp     QWORD PTR [rbp-72], 0
        jne     .L233
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC83
        call    parser_error
.L233:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L234
        mov     rdx, QWORD PTR R_BRACKET_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L235
.L234:
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC84
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L235:
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-48]
        mov     r8d, 0
        mov     rcx, rdx
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 3
        call    create_variable_access
        mov     QWORD PTR [rbp-48], rax
        jmp     .L231
.L232:
        mov     rdx, QWORD PTR DOT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L237
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC85
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L237:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        je      .L238
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC86
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L238:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    search
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L239
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC87
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L239:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-48]
        mov     r8d, 0
        mov     ecx, 0
        mov     rsi, rax
        mov     edi, 2
        call    create_variable_access
        mov     QWORD PTR [rbp-48], rax
        mov     QWORD PTR [rbp-24], 0
        mov     QWORD PTR [rbp-40], 0
.L231:
        mov     rax, QWORD PTR [rbp-104]
        mov     esi, 1
        mov     rdi, rax
        call    peek_next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
.L217:
        mov     rax, QWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        je      .L241
        jmp     .L240
.L242:
        nop
.L240:
        mov     rax, QWORD PTR [rbp-48]
.L216:
        leave
        ret

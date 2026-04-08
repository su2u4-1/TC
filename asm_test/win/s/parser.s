.LC0:
        .ascii "Failed to parse import statement\0"
.LC1:
        .ascii "Failed to parse function declaration\0"
.LC2:
        .ascii "Failed to parse class declaration\0"
.LC3:
        .ascii "Unexpected token in code member\0"
parse_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L2
        mov     ecx, 0
        call    create_symbol_table
        mov     rdx, QWORD PTR .refptr.builtin_scope[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.VOID_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     rdx, QWORD PTR .refptr.name_void[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.INT_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     rdx, QWORD PTR .refptr.name_int[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.FLOAT_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     rdx, QWORD PTR .refptr.name_float[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.STRING_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     rdx, QWORD PTR .refptr.name_string[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.BOOL_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     rdx, QWORD PTR .refptr.name_bool[rip]
        mov     QWORD PTR [rdx], rax
.L2:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L3
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 24[rbp], rax
.L3:
        mov     QWORD PTR -8[rbp], 0
        call    create_list
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L4
.L13:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L5
        mov     rax, QWORD PTR .refptr.IMPORT_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L5
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_import
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L6
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    parser_error
.L6:
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L7
.L5:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L8
        mov     rax, QWORD PTR .refptr.FUNC_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L8
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_function
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L9
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC1[rip]
        mov     rcx, rax
        call    parser_error
.L9:
        mov     rax, QWORD PTR -40[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 1
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L7
.L8:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L10
        mov     rax, QWORD PTR .refptr.CLASS_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L10
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_class
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L11
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC2[rip]
        mov     rcx, rax
        call    parser_error
.L11:
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rax
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 2
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L7
.L10:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC3[rip]
        mov     rcx, rax
        call    parser_error
.L7:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L4:
        cmp     QWORD PTR -8[rbp], 0
        je      .L12
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        jne     .L13
.L12:
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_code
        add     rsp, 80
        pop     rbp
        ret
.LC4:
        .ascii "Expected identifier after 'import'\0"
.LC5:
        .ascii "Expected string literal after 'from'\0"
.LC6:
        .ascii "Expected ';' at end of import statement\0"
.LC7:
        .ascii "Failed to import module\0"
parse_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L16
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L16:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -32[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L18
        mov     rax, QWORD PTR .refptr.FROM_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L18
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        je      .L19
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L19:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L18:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L20
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L21
.L20:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC6[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L21:
        mov     rax, QWORD PTR 32[rbp]
        mov     r8, QWORD PTR [rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    parse_import_file
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L22
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    parser_error
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -24[rbp], rax
.L22:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_import
.L17:
        add     rsp, 64
        pop     rbp
        ret
.LC8:
        .ascii "Expected function return type after 'func'\0"
.LC9:
        .ascii "Unknown function return type\0"
.LC10:
        .ascii "Expected function name after return type\0"
.LC11:
        .ascii "Expected '(' after function name\0"
.LC12:
        .ascii "Failed to parse function parameter\0"
.LC13:
        .ascii "Function parameters cannot have default values\0"
.LC14:
        .ascii "Expected ',' or ')' after function parameter\0"
.LC15:
        .ascii "Expected '{' to start function body\0"
.LC16:
        .ascii "Failed to parse function body statement\0"
.LC17:
        .ascii "Unreachable code after return statement\0"
.LC18:
        .ascii "Function missing return statement\0"
parse_function:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L24
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L25
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    is_builtin_type
        test    al, al
        jne     .L24
.L25:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC8[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L24:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L27
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC9[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L27:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L28
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L28:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 1
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L29
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L30
.L29:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC11[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L30:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     QWORD PTR -56[rbp], rax
        jmp     .L31
.L37:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L32
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC12[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L33
.L32:
        mov     rax, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L34
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC13[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L33
.L34:
        mov     rdx, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
.L33:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L35
        mov     rax, QWORD PTR .refptr.COMMA_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L35
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L31
.L35:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L36
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L31
.L36:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC14[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L31:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L37
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L37
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L38
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L39
.L38:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC15[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L39:
        call    create_list
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 8[rax], 1
        mov     BYTE PTR -9[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L40
.L44:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L41
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L42
.L41:
        cmp     BYTE PTR -9[rbp], 0
        je      .L42
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    parser_error
.L42:
        cmp     QWORD PTR -72[rbp], 0
        je      .L43
        mov     rax, QWORD PTR -72[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 5
        jne     .L43
        mov     BYTE PTR -9[rbp], 1
.L43:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L40:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L44
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L44
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 8[rax], 0
        cmp     BYTE PTR -9[rbp], 0
        jne     .L45
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -32[rbp], rax
        je      .L45
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC18[rip]
        mov     rcx, rax
        call    parser_error
.L45:
        cmp     BYTE PTR -9[rbp], 0
        jne     .L46
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -32[rbp], rax
        jne     .L46
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
.L46:
        mov     r9, QWORD PTR -56[rbp]
        mov     r8, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, QWORD PTR -24[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR -64[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_function_use_ptr
.L26:
        sub     rsp, -128
        pop     rbp
        ret
.LC19:
        .ascii "Expected method return type after 'method'\0"
.LC20:
        .ascii "Unknown return type for method\0"
.LC21:
        .ascii "Expected method name after return type\0"
.LC22:
        .ascii "Expected '(' after method name\0"
.LC23:
        .ascii "Expected 'self' as first parameter of method\0"
.LC24:
        .ascii "Expected ',' or ')' after method parameter\0"
.LC25:
        .ascii "Failed to parse method parameter\0"
.LC26:
        .ascii "Method parameters cannot have default values\0"
.LC27:
        .ascii "Expected '{' to start method body\0"
.LC28:
        .ascii "Failed to parse method body statement\0"
.LC29:
        .ascii "Method missing return statement\0"
parse_method:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 144
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L48
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L49
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    is_builtin_type
        test    al, al
        jne     .L48
.L49:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC19[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L48:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L51
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L51:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L52
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC21[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L52:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rcx, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 2
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L53
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L54
.L53:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC22[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L54:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L55
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L56
.L55:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC23[rip]
        mov     rcx, rax
        call    parser_error
.L56:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     QWORD PTR -64[rbp], rax
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L57
.L65:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L58
        mov     rax, QWORD PTR .refptr.COMMA_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L58
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        nop
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L62
        jmp     .L75
.L58:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L60
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L61
.L60:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC24[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L75:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC25[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L63
.L62:
        mov     rax, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L64
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC26[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L63
.L64:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
.L63:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L57:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L65
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L65
.L61:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L66
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L67
.L66:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC27[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L50
.L67:
        call    create_list
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR 8[rax], 1
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR 9[rax], 1
        mov     BYTE PTR -9[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L68
.L72:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L69
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC28[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L70
.L69:
        cmp     BYTE PTR -9[rbp], 0
        je      .L70
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    parser_error
.L70:
        cmp     QWORD PTR -88[rbp], 0
        je      .L71
        mov     rax, QWORD PTR -88[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 5
        jne     .L71
        mov     BYTE PTR -9[rbp], 1
.L71:
        mov     rdx, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L68:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L72
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L72
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR 8[rax], 0
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR 9[rax], 0
        cmp     BYTE PTR -9[rbp], 0
        jne     .L73
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -40[rbp], rax
        je      .L73
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC29[rip]
        mov     rcx, rax
        call    parser_error
.L73:
        cmp     BYTE PTR -9[rbp], 0
        jne     .L74
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -40[rbp], rax
        jne     .L74
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
.L74:
        mov     r9, QWORD PTR -64[rbp]
        mov     r8, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, QWORD PTR -24[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR -80[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_method_use_ptr
.L50:
        add     rsp, 144
        pop     rbp
        ret
.LC30:
        .ascii "Expected class name after 'class'\0"
.LC31:
        .ascii "Expected '{' to start class body\0"
.LC32:
        .ascii "Failed to parse class method\0"
.LC33:
        .ascii "Failed to parse class variable\0"
.LC34:
        .ascii "Unsupported type for class variable\0"
.LC35:
        .ascii "Expected ';' after class variable declaration\0"
.LC36:
        .ascii "Unexpected token in class member\0"
.LC37:
        .ascii "Constructor name conflicts with existing member\0"
.LC38:
        .ascii "0\0"
parse_class:
        push    rbp
        push    rbx
        sub     rsp, 296
        lea     rbp, 128[rsp]
        mov     QWORD PTR 192[rbp], rcx
        mov     QWORD PTR 200[rbp], rdx
        mov     QWORD PTR 208[rbp], r8
        mov     QWORD PTR 152[rbp], 0
        mov     rax, QWORD PTR 200[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR 128[rbp], rax
        mov     rax, QWORD PTR 192[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L77
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC30[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L78
.L77:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR 120[rbp], rax
        mov     rax, QWORD PTR 120[rbp]
        mov     rdx, QWORD PTR 128[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 120[rbp]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 112[rbp], rax
        mov     rax, QWORD PTR 192[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L79
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L80
.L79:
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC31[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L78
.L80:
        call    create_list
        mov     QWORD PTR 104[rbp], rax
        mov     rax, QWORD PTR 192[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     QWORD PTR 144[rbp], 0
        jmp     .L81
.L95:
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L82
        mov     rax, QWORD PTR .refptr.METHOD_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L82
        mov     r8, QWORD PTR 208[rbp]
        mov     rcx, QWORD PTR 112[rbp]
        mov     rdx, QWORD PTR 128[rbp]
        mov     rax, QWORD PTR 192[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    parse_method
        mov     QWORD PTR -56[rbp], rax
        cmp     QWORD PTR -56[rbp], 0
        jne     .L83
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC32[rip]
        mov     rcx, rax
        call    parser_error
.L83:
        mov     rax, QWORD PTR -56[rbp]
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L84
.L82:
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L85
        mov     rax, QWORD PTR .refptr.VAR_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L85
        mov     rax, QWORD PTR 192[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 208[rbp]
        mov     BYTE PTR 10[rax], 1
        mov     rcx, QWORD PTR 208[rbp]
        mov     rdx, QWORD PTR 128[rbp]
        mov     rax, QWORD PTR 192[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 208[rbp]
        mov     BYTE PTR 10[rax], 0
        cmp     QWORD PTR -64[rbp], 0
        jne     .L86
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC33[rip]
        mov     rcx, rax
        call    parser_error
.L86:
        mov     rax, QWORD PTR -64[rbp]
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 1
        call    create_class_member
        mov     QWORD PTR -72[rbp], rax
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -72[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 1
        jne     .L87
        mov     rax, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR .refptr.name_int[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -80[rbp], rax
        je      .L88
        mov     rax, QWORD PTR .refptr.name_float[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -80[rbp], rax
        je      .L88
        mov     rax, QWORD PTR .refptr.name_string[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -80[rbp], rax
        jne     .L89
.L88:
        add     QWORD PTR 144[rbp], 8
        jmp     .L87
.L89:
        mov     rax, QWORD PTR .refptr.name_bool[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -80[rbp], rax
        je      .L90
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -80[rbp], rax
        jne     .L91
.L90:
        add     QWORD PTR 144[rbp], 1
        jmp     .L87
.L91:
        mov     rax, QWORD PTR -80[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L92
        add     QWORD PTR 144[rbp], 8
        jmp     .L87
.L92:
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC34[rip]
        mov     rcx, rax
        call    parser_error
.L87:
        mov     rax, QWORD PTR 192[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L93
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L107
.L93:
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC35[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L107
.L85:
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC36[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L84
.L107:
        nop
.L84:
        mov     rax, QWORD PTR 192[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
.L81:
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L95
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L95
        mov     rax, QWORD PTR .refptr.DEFAULT_INIT_NAME[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR 96[rbp], rax
        mov     rdx, QWORD PTR 96[rbp]
        mov     rax, QWORD PTR 128[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR 136[rbp], rax
        cmp     QWORD PTR 136[rbp], 0
        jne     .L96
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR 88[rbp], rax
        mov     rax, QWORD PTR 128[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     rdx, QWORD PTR 88[rbp]
        mov     QWORD PTR 32[rdx], rax
        mov     rcx, QWORD PTR 88[rbp]
        mov     rdx, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 96[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 2
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 136[rbp], rax
        call    create_list
        mov     QWORD PTR 80[rbp], rax
        mov     rax, QWORD PTR 88[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 72[rbp], rax
        mov     rdx, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 112[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR 80[rbp]
        mov     rcx, rax
        call    list_append
        call    create_list
        mov     QWORD PTR 64[rbp], rax
        mov     rax, QWORD PTR 72[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 64[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 88[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     r9, QWORD PTR 80[rbp]
        mov     r8, QWORD PTR 112[rbp]
        mov     rdx, QWORD PTR 136[rbp]
        mov     rax, QWORD PTR 88[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR 64[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_method_use_ptr
        mov     rax, QWORD PTR 88[rbp]
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
.L96:
        mov     rax, QWORD PTR 136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        je      .L97
        mov     rax, QWORD PTR 208[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR 152[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC37[rip]
        mov     rcx, rax
        call    parser_error
.L97:
        mov     rax, QWORD PTR .refptr.DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR 56[rbp], rax
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR 48[rbp], rax
        mov     rax, QWORD PTR 128[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rdx], rax
        mov     rcx, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 56[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 2
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 40[rbp], rax
        call    create_list
        mov     QWORD PTR 32[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 24[rbp], rax
        mov     rax, QWORD PTR 136[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR 16[rbp], rax
        jmp     .L98
.L100:
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L99
        jmp     .L98
.L99:
        mov     rax, QWORD PTR 8[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     r8d, 0
        mov     rcx, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    list_append
.L98:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR 8[rbp], rax
        cmp     QWORD PTR 8[rbp], 0
        jne     .L100
        call    create_list
        mov     QWORD PTR 0[rbp], rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 0[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L101
.L104:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 1
        jne     .L101
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 2
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L102
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        jmp     .L103
.L102:
        mov     edx, 2
        lea     rax, .LC38[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
.L103:
        mov     QWORD PTR -48[rbp], rax
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rdx
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 13
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 0[rbp]
        mov     rcx, rax
        call    list_append
.L101:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L104
        call    create_list
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -32[rbp], rax
        jmp     .L105
.L106:
        mov     rax, QWORD PTR 8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
.L105:
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR 8[rbp], rax
        cmp     QWORD PTR 8[rbp], 0
        jne     .L106
        mov     rax, QWORD PTR 136[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 1
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 0[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     r9, QWORD PTR 32[rbp]
        mov     r8, QWORD PTR 112[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR 0[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_method_use_ptr
        mov     rax, QWORD PTR 48[rbp]
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
        mov     r9, QWORD PTR 128[rbp]
        mov     r8, QWORD PTR 104[rbp]
        mov     rdx, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 120[rbp]
        mov     rcx, QWORD PTR 144[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_class_use_ptr
.L78:
        add     rsp, 296
        pop     rbx
        pop     rbp
        ret
.LC39:
        .ascii "Expected variable type\0"
.LC40:
        .ascii "Expected a type for variable declaration\0"
.LC41:
        .ascii "Unknown variable type\0"
.LC42:
        .ascii "Expected variable name\0"
.LC43:
        .ascii "Failed to parse variable initializer\0"
parse_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L109
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L110
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    is_builtin_type
        test    al, al
        jne     .L109
.L110:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC39[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L111
.L109:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        je      .L112
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 6
        je      .L113
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        je      .L113
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC40[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L113
.L112:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC41[rip]
        mov     rcx, rax
        call    parser_error
.L113:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L114
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC42[rip]
        mov     rcx, rax
        call    parser_error
.L114:
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 10[rax]
        test    al, al
        je      .L115
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 9[rax]
        test    al, al
        jne     .L115
        mov     r10d, 5
        jmp     .L116
.L115:
        mov     r10d, 3
.L116:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, r10d
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -32[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L117
        mov     rax, QWORD PTR .refptr.ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L117
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L117
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC43[rip]
        mov     rcx, rax
        call    parser_error
.L117:
        mov     rcx, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_variable
.L111:
        add     rsp, 64
        pop     rbp
        ret
.LC44:
        .ascii "Cannot use 'break' outside of a loop\0"
.LC45:
        .ascii "Cannot use 'continue' outside of a loop\0"
.LC46:
        .ascii "Failed to parse statement\0"
.LC47:
        .ascii "Expected ';' after statement\0"
parse_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -16[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L119
        mov     rax, QWORD PTR .refptr.IF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L120
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_if
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 2
        call    create_statement
        jmp     .L121
.L120:
        mov     rax, QWORD PTR .refptr.FOR_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L122
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_for
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9, rax
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 4
        call    create_statement
        jmp     .L121
.L122:
        mov     rax, QWORD PTR .refptr.WHILE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L123
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_while
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 3
        call    create_statement
        jmp     .L121
.L123:
        mov     rax, QWORD PTR .refptr.VAR_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L124
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR 40[rsp], rax
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 1
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L125
.L124:
        mov     rax, QWORD PTR .refptr.RETURN_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L126
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L127
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L127
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        jmp     .L121
.L127:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L125
.L126:
        mov     rax, QWORD PTR .refptr.BREAK_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L128
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 11[rax]
        test    al, al
        jne     .L129
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC44[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L121
.L129:
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 6
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L125
.L128:
        mov     rax, QWORD PTR .refptr.CONTINUE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L130
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 11[rax]
        test    al, al
        jne     .L131
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC45[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L121
.L131:
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 7
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L125
.L130:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L125
.L119:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
.L125:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L132
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC46[rip]
        mov     rcx, rax
        call    parser_error
.L132:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L133
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L134
.L133:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC47[rip]
        mov     rcx, rax
        call    parser_error
.L134:
        mov     rax, QWORD PTR -8[rbp]
.L121:
        add     rsp, 64
        pop     rbp
        ret
.LC48:
        .ascii "Expected '(' after 'if'\0"
.LC49:
        .ascii "Failed to parse if condition\0"
.LC50:
        .ascii "Expected ')' after if condition\0"
.LC51:
        .ascii "Expected '{' to start if body\0"
.LC52:
        .ascii "Failed to parse if body statement\0"
.LC53:
        .ascii "Expected '(' after 'elif'\0"
.LC54:
        .ascii "Failed to parse else-if condition\0"
.LC55:
        .ascii "Expected ')' after else-if condition\0"
.LC56:
        .ascii "Expected '{' to start else-if body\0"
.LC57:
        .ascii "Failed to parse else-if body statement\0"
.LC58:
        .ascii "Expected '{' to start else body\0"
.LC59:
        .ascii "Failed to parse else body statement\0"
parse_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L136
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L137
.L136:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC48[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L137:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L139
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC49[rip]
        mov     rcx, rax
        call    parser_error
.L139:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L140
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L141
.L140:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC50[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L141:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L142
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L143
.L142:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC51[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L143:
        call    create_list
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L144
.L146:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L145
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC52[rip]
        mov     rcx, rax
        call    parser_error
.L145:
        mov     rdx, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L144:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L146
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L146
        call    create_list
        mov     QWORD PTR -32[rbp], rax
        call    create_list
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L147
.L159:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L148
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L149
.L148:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC53[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L149:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L150
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC54[rip]
        mov     rcx, rax
        call    parser_error
.L150:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L151
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L152
.L151:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC55[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L152:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L153
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L154
.L153:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC56[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L154:
        call    create_list
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L155
.L157:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L156
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    parser_error
.L156:
        mov     rdx, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L155:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L157
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L157
        mov     rdx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    create_else_if
        mov     rdx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L147:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L158
        mov     rax, QWORD PTR .refptr.ELIF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L159
.L158:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L160
        mov     rax, QWORD PTR .refptr.ELSE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L160
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L161
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L162
.L161:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC58[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L138
.L162:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L163
.L165:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L164
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC59[rip]
        mov     rcx, rax
        call    parser_error
.L164:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L163:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L165
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L165
.L160:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -8[rbp], rax
        mov     r8, QWORD PTR -40[rbp]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    create_if
.L138:
        add     rsp, 112
        pop     rbp
        ret
.LC60:
        .ascii "Expected '(' after 'for'\0"
.LC61:
        .ascii "Failed to parse for loop initializer\0"
.LC62:
        .ascii "Expected ';' after for loop initializer\0"
.LC63:
        .ascii "Failed to parse for loop condition\0"
.LC64:
        .ascii "Expected ';' after for loop condition\0"
.LC65:
        .ascii "Failed to parse for loop increment\0"
.LC66:
        .ascii "Expected ')' after for loop increment\0"
.LC67:
        .ascii "Expected '{' to start for loop body\0"
.LC68:
        .ascii "Failed to parse for loop body statement\0"
parse_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L167
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L168
.L167:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC60[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L168:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L170
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L171
.L170:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L172
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC61[rip]
        mov     rcx, rax
        call    parser_error
.L172:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L171:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L173
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L174
.L173:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC62[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L174:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -24[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L175
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L176
.L175:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L177
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC63[rip]
        mov     rcx, rax
        call    parser_error
.L177:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L176:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L178
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L179
.L178:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC64[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L179:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -32[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L180
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L181
.L180:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L182
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC65[rip]
        mov     rcx, rax
        call    parser_error
.L182:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L181:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L183
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L184
.L183:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC66[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L184:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L185
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L186
.L185:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC67[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L169
.L186:
        call    create_list
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 11[rax], 1
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L187
.L189:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L188
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC68[rip]
        mov     rcx, rax
        call    parser_error
.L188:
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L187:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L189
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L189
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 11[rax], 0
        mov     r8, QWORD PTR -40[rbp]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    create_for
.L169:
        add     rsp, 80
        pop     rbp
        ret
.LC69:
        .ascii "Expected '(' after 'while'\0"
.LC70:
        .ascii "Failed to parse while condition\0"
.LC71:
        .ascii "Expected ')' after while condition\0"
.LC72:
        .ascii "Expected '{' to start while body\0"
.LC73:
        .ascii "Failed to parse while body statement\0"
parse_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L191
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L192
.L191:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC69[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L193
.L192:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L194
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC70[rip]
        mov     rcx, rax
        call    parser_error
.L194:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L195
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L196
.L195:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC71[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L193
.L196:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L197
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L198
.L197:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC72[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L193
.L198:
        call    create_list
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 11[rax], 1
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L199
.L201:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L200
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC73[rip]
        mov     rcx, rax
        call    parser_error
.L200:
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L199:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L201
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L201
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 11[rax], 0
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_while
.L193:
        add     rsp, 64
        pop     rbp
        ret
.LC74:
        .ascii "Failed to parse right operand\0"
parse_expr_prec:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     DWORD PTR 32[rbp], r8d
        mov     QWORD PTR 40[rbp], r9
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L203
.L211:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_to_operator
        mov     DWORD PTR -20[rbp], eax
        mov     eax, DWORD PTR -20[rbp]
        mov     ecx, eax
        call    operator_precedence
        mov     DWORD PTR -24[rbp], eax
        cmp     DWORD PTR -20[rbp], 19
        je      .L204
        mov     eax, DWORD PTR -24[rbp]
        cmp     eax, DWORD PTR 32[rbp]
        jl      .L204
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L205
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC74[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L206
.L205:
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L207
.L210:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_to_operator
        mov     DWORD PTR -36[rbp], eax
        mov     eax, DWORD PTR -36[rbp]
        mov     ecx, eax
        call    operator_precedence
        mov     DWORD PTR -40[rbp], eax
        cmp     DWORD PTR -36[rbp], 19
        je      .L208
        mov     eax, DWORD PTR -40[rbp]
        cmp     eax, DWORD PTR -24[rbp]
        jle     .L208
        mov     r9, QWORD PTR 40[rbp]
        mov     r8d, DWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    parse_expr_prec
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L209
        mov     eax, 0
        jmp     .L206
.L209:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L207:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L210
.L208:
        mov     rcx, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR -20[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     ecx, eax
        call    create_expression
        mov     QWORD PTR 24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L203:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L211
.L204:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
.L206:
        add     rsp, 96
        pop     rbp
        ret
.LC75:
        .ascii "Failed to parse expression primary\0"
parse_expression:
        push    rbp
        push    rbx
        sub     rsp, 72
        lea     rbp, 64[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     rcx, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L213
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rbx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     r8, rbx
        mov     rdx, rax
        lea     rax, .LC75[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L214
.L213:
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rcx, rax
        mov     r8, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, r8
        mov     r8d, 0
        mov     rdx, rcx
        mov     rcx, rax
        call    parse_expr_prec
.L214:
        add     rsp, 72
        pop     rbx
        pop     rbp
        ret
.LC76:
        .ascii "Failed to parse parenthesized expression\0"
.LC77:
        .ascii "Expected ')' after expression\0"
.LC78:
        .ascii "Failed to parse operand of unary '!'\0"
.LC79:
        .ascii "Failed to parse operand of unary '-'\0"
.LC80:
        .ascii "Failed to parse variable access\0"
.LC81:
        .ascii "Unexpected token in primary expression\0"
parse_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -48[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -48[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     QWORD PTR -40[rbp], 0
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        jne     .L216
        mov     DWORD PTR -4[rbp], 0
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L217
.L216:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        jne     .L218
        mov     DWORD PTR -4[rbp], 1
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L217
.L218:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L219
        mov     DWORD PTR -4[rbp], 2
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L217
.L219:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L220
        mov     rax, QWORD PTR .refptr.TRUE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L220
        mov     DWORD PTR -4[rbp], 3
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L217
.L220:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L221
        mov     rax, QWORD PTR .refptr.FALSE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L221
        mov     DWORD PTR -4[rbp], 4
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L217
.L221:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L222
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L222
        mov     DWORD PTR -4[rbp], 5
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L223
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC76[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L223:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L225
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L234
.L225:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC77[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L222:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L227
        mov     rax, QWORD PTR .refptr.NOT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L227
        mov     DWORD PTR -4[rbp], 6
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L217
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC78[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L227:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L229
        mov     rax, QWORD PTR .refptr.SUB_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L229
        mov     DWORD PTR -4[rbp], 7
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L217
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC79[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L229:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L231
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L232
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L232
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 9[rax]
        test    al, al
        je      .L232
.L231:
        mov     DWORD PTR -4[rbp], 8
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable_access
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L217
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC80[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L232:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC81[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L224
.L234:
        nop
.L217:
        mov     r9, QWORD PTR -32[rbp]
        mov     r8, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR -4[rbp]
        mov     rcx, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     ecx, eax
        call    create_primary
.L224:
        add     rsp, 96
        pop     rbp
        ret
.LC82:
        .ascii "Expected variable name in variable access\0"
.LC83:
        .ascii "Cannot call undefined variable\0"
.LC84:
        .ascii "Cannot call non-function variable\0"
.LC85:
        .ascii "Failed to parse function call argument\0"
.LC86:
        .ascii "Expected ',' or ')' after function call argument\0"
.LC87:
        .ascii "Failed to parse sequence index\0"
.LC88:
        .ascii "Expected ']' after sequence index\0"
.LC89:
        .ascii "Cannot access attribute without a valid scope\0"
.LC90:
        .ascii "Expected attribute name after '.'\0"
.LC91:
        .ascii "Unknown attribute name\0"
parse_variable_access:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 144
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L236
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L237
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L236
.L237:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC82[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L236:
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L239
.L264:
        cmp     QWORD PTR -24[rbp], 0
        je      .L240
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L240
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
.L240:
        cmp     QWORD PTR -32[rbp], 0
        jne     .L241
        cmp     QWORD PTR -16[rbp], 0
        je      .L241
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L241
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -32[rbp], rax
.L241:
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L242
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L243
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC83[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L244
.L243:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L244
        mov     rax, QWORD PTR .refptr.DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR -72[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -24[rbp], rax
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 2
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
.L244:
        cmp     QWORD PTR -24[rbp], 0
        je      .L245
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L245
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        je      .L245
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC84[rip]
        mov     rcx, rax
        call    parser_error
.L245:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     QWORD PTR -80[rbp], rax
        jmp     .L246
.L250:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L247
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC85[rip]
        mov     rcx, rax
        call    parser_error
.L247:
        mov     rdx, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L248
        mov     rax, QWORD PTR .refptr.COMMA_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L248
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L246
.L248:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L249
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L246
.L249:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC86[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L246:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L250
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L250
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -80[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 1
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L251
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -32[rbp], rax
        jmp     .L251
.L242:
        mov     rax, QWORD PTR .refptr.L_BRACKET_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L252
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L253
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC87[rip]
        mov     rcx, rax
        call    parser_error
.L253:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L254
        mov     rax, QWORD PTR .refptr.R_BRACKET_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L255
.L254:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC88[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L255:
        mov     rdx, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9, rdx
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 3
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        jmp     .L251
.L252:
        mov     rax, QWORD PTR .refptr.DOT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L265
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L257
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC89[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L257:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L258
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC90[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L258:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L259
        mov     QWORD PTR -48[rbp], 0
        cmp     QWORD PTR -16[rbp], 0
        je      .L260
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L261
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -48[rbp], rax
        jmp     .L260
.L261:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L260
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L260
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -48[rbp], rax
.L260:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR -56[rbp], rax
        mov     rdx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -24[rbp], rax
.L259:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L262
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    get_full_path
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC91[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L238
.L262:
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 2
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -32[rbp], 0
.L251:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L239:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L264
        jmp     .L263
.L265:
        nop
.L263:
        mov     rax, QWORD PTR -40[rbp]
.L238:
        add     rsp, 144
        pop     rbp
        ret
.refptr.DOT_SYMBOL:
        .quad   DOT_SYMBOL
.refptr.R_BRACKET_SYMBOL:
        .quad   R_BRACKET_SYMBOL
.refptr.L_BRACKET_SYMBOL:
        .quad   L_BRACKET_SYMBOL
.refptr.SUB_SYMBOL:
        .quad   SUB_SYMBOL
.refptr.NOT_SYMBOL:
        .quad   NOT_SYMBOL
.refptr.FALSE_KEYWORD:
        .quad   FALSE_KEYWORD
.refptr.TRUE_KEYWORD:
        .quad   TRUE_KEYWORD
.refptr.ELSE_KEYWORD:
        .quad   ELSE_KEYWORD
.refptr.ELIF_KEYWORD:
        .quad   ELIF_KEYWORD
.refptr.CONTINUE_KEYWORD:
        .quad   CONTINUE_KEYWORD
.refptr.BREAK_KEYWORD:
        .quad   BREAK_KEYWORD
.refptr.RETURN_KEYWORD:
        .quad   RETURN_KEYWORD
.refptr.WHILE_KEYWORD:
        .quad   WHILE_KEYWORD
.refptr.FOR_KEYWORD:
        .quad   FOR_KEYWORD
.refptr.IF_KEYWORD:
        .quad   IF_KEYWORD
.refptr.ASSIGN_SYMBOL:
        .quad   ASSIGN_SYMBOL
.refptr.DEFAULT_CONSTRUCTOR_NAME:
        .quad   DEFAULT_CONSTRUCTOR_NAME
.refptr.DEFAULT_INIT_NAME:
        .quad   DEFAULT_INIT_NAME
.refptr.VAR_KEYWORD:
        .quad   VAR_KEYWORD
.refptr.METHOD_KEYWORD:
        .quad   METHOD_KEYWORD
.refptr.SELF_KEYWORD:
        .quad   SELF_KEYWORD
.refptr.R_BRACE_SYMBOL:
        .quad   R_BRACE_SYMBOL
.refptr.L_BRACE_SYMBOL:
        .quad   L_BRACE_SYMBOL
.refptr.R_PAREN_SYMBOL:
        .quad   R_PAREN_SYMBOL
.refptr.COMMA_SYMBOL:
        .quad   COMMA_SYMBOL
.refptr.L_PAREN_SYMBOL:
        .quad   L_PAREN_SYMBOL
.refptr.SEMICOLON_SYMBOL:
        .quad   SEMICOLON_SYMBOL
.refptr.FROM_KEYWORD:
        .quad   FROM_KEYWORD
.refptr.CLASS_KEYWORD:
        .quad   CLASS_KEYWORD
.refptr.FUNC_KEYWORD:
        .quad   FUNC_KEYWORD
.refptr.IMPORT_KEYWORD:
        .quad   IMPORT_KEYWORD
.refptr.name_bool:
        .quad   name_bool
.refptr.BOOL_KEYWORD:
        .quad   BOOL_KEYWORD
.refptr.name_string:
        .quad   name_string
.refptr.STRING_KEYWORD:
        .quad   STRING_KEYWORD
.refptr.name_float:
        .quad   name_float
.refptr.FLOAT_KEYWORD:
        .quad   FLOAT_KEYWORD
.refptr.name_int:
        .quad   name_int
.refptr.INT_KEYWORD:
        .quad   INT_KEYWORD
.refptr.name_void:
        .quad   name_void
.refptr.VOID_KEYWORD:
        .quad   VOID_KEYWORD
.refptr.builtin_scope:
        .quad   builtin_scope

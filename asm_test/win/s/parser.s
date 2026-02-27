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
        sub     rsp, 112
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L2
        mov     ecx, 0
        call    create_scope
        mov     rdx, QWORD PTR .refptr.builtin_scope[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.VOID_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    create_name
        mov     rdx, QWORD PTR .refptr.name_void[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.INT_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    create_name
        mov     rdx, QWORD PTR .refptr.name_int[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.FLOAT_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    create_name
        mov     rdx, QWORD PTR .refptr.name_float[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.STRING_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    create_name
        mov     rdx, QWORD PTR .refptr.name_string[rip]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR .refptr.BOOL_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    create_name
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
        mov     QWORD PTR -16[rbp], 0
        call    create_list
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_scope
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L4
.L13:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L5
        mov     rax, QWORD PTR .refptr.IMPORT_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L5
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    parse_import
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L6
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    parser_error
.L6:
        mov     rax, QWORD PTR -40[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L7
.L5:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L8
        mov     rax, QWORD PTR .refptr.FUNC_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L8
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_function
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L9
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC1[rip]
        mov     rcx, rax
        call    parser_error
.L9:
        mov     rax, QWORD PTR -48[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 1
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L7
.L8:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L10
        mov     rax, QWORD PTR .refptr.CLASS_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L10
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_class
        mov     QWORD PTR -56[rbp], rax
        cmp     QWORD PTR -56[rbp], 0
        jne     .L11
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC2[rip]
        mov     rcx, rax
        call    parser_error
.L11:
        mov     rax, QWORD PTR -56[rbp]
        mov     r9, rax
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 2
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L7
.L10:
        mov     rax, QWORD PTR -8[rbp]
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
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L4:
        cmp     QWORD PTR -8[rbp], 0
        je      .L12
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        jne     .L13
.L12:
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_code
        add     rsp, 112
        pop     rbp
        ret
.LC4:
        .ascii "Expected identifier after 'import'\0"
.LC5:
        .ascii "Expected string literal after 'from'\0"
.LC6:
        .ascii "Expected ';' at end of import statement\0"
parse_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L16
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L16:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -40[rbp], rax
        mov     QWORD PTR -24[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L18
        mov     rax, QWORD PTR .refptr.FROM_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        je      .L19
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L19:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L18:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L20
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L21
.L20:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC6[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L17
.L21:
        mov     rcx, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_import_file
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L22
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8, rcx
        mov     edx, 1
        mov     rcx, rax
        call    create_name
        mov     QWORD PTR -32[rbp], rax
.L22:
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_import
.L17:
        add     rsp, 96
        pop     rbp
        ret
.LC7:
        .ascii "Expected function return type after 'func'\0"
.LC8:
        .ascii "Unknown function return type\0"
.LC9:
        .ascii "Expected function name after return type\0"
.LC10:
        .ascii "Expected '(' after function name\0"
.LC11:
        .ascii "Failed to parse function parameter\0"
.LC12:
        .ascii "Function parameters cannot have default values\0"
.LC13:
        .ascii "Expected ',' or ')' after function parameter\0"
.LC14:
        .ascii "Expected '{' to start function body\0"
.LC15:
        .ascii "Failed to parse function body statement\0"
.LC16:
        .ascii "Unreachable code after return statement\0"
.LC17:
        .ascii "Function missing return statement\0"
parse_function:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_scope
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L24
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L25
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    is_builtin_type
        test    al, al
        jne     .L24
.L25:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L24:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L27
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC8[rip]
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L28
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC9[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L28:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8, rcx
        mov     edx, 2
        mov     rcx, rax
        call    create_name
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L29
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L30
.L29:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC10[rip]
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
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        call    create_list
        mov     QWORD PTR -56[rbp], rax
        jmp     .L31
.L37:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L32
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC11[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L33
.L32:
        mov     rax, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L34
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC12[rip]
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L35
        mov     rax, QWORD PTR .refptr.COMMA_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
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
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L31
.L35:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L36
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L31
.L36:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC13[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L31:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L37
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L38
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L39
.L38:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC14[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L26
.L39:
        call    create_list
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR [rax], 1
        mov     BYTE PTR -17[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L40
.L44:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L41
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC15[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L42
.L41:
        cmp     BYTE PTR -17[rbp], 0
        je      .L42
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    parser_error
.L42:
        mov     rax, QWORD PTR -72[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 5
        jne     .L43
        mov     BYTE PTR -17[rbp], 1
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
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L40:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L44
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L44
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR [rax], 0
        cmp     BYTE PTR -17[rbp], 0
        jne     .L45
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -40[rbp], rax
        je      .L45
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    parser_error
.L45:
        mov     r9, QWORD PTR -64[rbp]
        mov     r8, QWORD PTR -56[rbp]
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, QWORD PTR -32[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_function
.L26:
        sub     rsp, -128
        pop     rbp
        ret
.LC18:
        .ascii "Expected method return type after 'method'\0"
.LC19:
        .ascii "Unknown return type for method\0"
.LC20:
        .ascii "Expected method name after return type\0"
.LC21:
        .ascii "Expected '(' after method name\0"
.LC22:
        .ascii "Expected 'self' as first parameter of method\0"
.LC23:
        .ascii "Expected ',' or ')' after method parameter\0"
.LC24:
        .ascii "Failed to parse method parameter\0"
.LC25:
        .ascii "Method parameters cannot have default values\0"
.LC26:
        .ascii "Expected '{' to start method body\0"
.LC27:
        .ascii "Failed to parse method body statement\0"
.LC28:
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
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_scope
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8, rcx
        mov     edx, 1
        mov     rcx, rax
        call    create_name
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L47
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L48
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    is_builtin_type
        test    al, al
        jne     .L47
.L48:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC18[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L47:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L50
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC19[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L50:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L51
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L51:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8, rcx
        mov     edx, 3
        mov     rcx, rax
        call    create_name
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L52
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L53
.L52:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC21[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L53:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L54
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L55
.L54:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC22[rip]
        mov     rcx, rax
        call    parser_error
.L55:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        call    create_list
        mov     QWORD PTR -64[rbp], rax
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L56
.L64:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L57
        mov     rax, QWORD PTR .refptr.COMMA_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L57
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        je      .L58
        jmp     .L73
.L57:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L60
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L61
.L60:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC23[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L58:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC24[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L62
.L73:
        mov     rax, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L63
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC25[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L62
.L63:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
.L62:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L56:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L64
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L64
.L61:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L65
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L66
.L65:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC26[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L49
.L66:
        call    create_list
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR [rax], 1
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR 1[rax], 1
        mov     BYTE PTR -17[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L67
.L71:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L68
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC27[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L69
.L68:
        cmp     BYTE PTR -17[rbp], 0
        je      .L69
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    parser_error
.L69:
        mov     rax, QWORD PTR -88[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 5
        jne     .L70
        mov     BYTE PTR -17[rbp], 1
.L70:
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
        mov     QWORD PTR -16[rbp], rax
.L67:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L71
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L71
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 40[rbp]
        mov     BYTE PTR 1[rax], 0
        cmp     BYTE PTR -17[rbp], 0
        jne     .L72
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -48[rbp], rax
        je      .L72
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC28[rip]
        mov     rcx, rax
        call    parser_error
.L72:
        mov     r9, QWORD PTR -80[rbp]
        mov     r8, QWORD PTR -64[rbp]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, QWORD PTR -32[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_method
.L49:
        add     rsp, 144
        pop     rbp
        ret
.LC29:
        .ascii "Expected class name after 'class'\0"
.LC30:
        .ascii "Expected '{' to start class body\0"
.LC31:
        .ascii "Failed to parse class method\0"
.LC32:
        .ascii "Failed to parse class variable\0"
.LC33:
        .ascii "Expected ';' after class variable declaration\0"
.LC34:
        .ascii "Unexpected token in class member\0"
parse_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_scope
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L75
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC29[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L76
.L75:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, rcx
        mov     r8d, 0
        mov     edx, 4
        mov     rcx, rax
        call    create_name
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L77
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L78
.L77:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC30[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L76
.L78:
        call    create_list
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L79
.L87:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L80
        mov     rax, QWORD PTR .refptr.METHOD_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L80
        mov     r8, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    parse_method
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L81
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC31[rip]
        mov     rcx, rax
        call    parser_error
.L81:
        mov     rax, QWORD PTR -48[rbp]
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L82
.L80:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L83
        mov     rax, QWORD PTR .refptr.VAR_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L83
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -56[rbp], rax
        cmp     QWORD PTR -56[rbp], 0
        jne     .L84
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC32[rip]
        mov     rcx, rax
        call    parser_error
.L84:
        mov     rax, QWORD PTR -56[rbp]
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 1
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L85
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L88
.L85:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC33[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L88
.L83:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC34[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L82
.L88:
        nop
.L82:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L79:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L87
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L87
        mov     rcx, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_class
.L76:
        add     rsp, 112
        pop     rbp
        ret
.LC35:
        .ascii "Expected variable type\0"
.LC36:
        .ascii "Expected a type for variable declaration\0"
.LC37:
        .ascii "Unknown variable type\0"
.LC38:
        .ascii "Expected variable name\0"
.LC39:
        .ascii "Failed to parse variable initializer\0"
parse_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -24[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L90
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L91
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    is_builtin_type
        test    al, al
        jne     .L90
.L91:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC35[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L92
.L90:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        je      .L93
        mov     rax, QWORD PTR -32[rbp]
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        je      .L94
        mov     rax, QWORD PTR -40[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        je      .L94
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC36[rip]
        mov     rcx, rax
        call    parser_error
        jmp     .L94
.L93:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC37[rip]
        mov     rcx, rax
        call    parser_error
.L94:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L95
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC38[rip]
        mov     rcx, rax
        call    parser_error
.L95:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8, rcx
        mov     edx, 1
        mov     rcx, rax
        call    create_name
        mov     QWORD PTR -48[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L96
        mov     rax, QWORD PTR .refptr.ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L96
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L96
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC39[rip]
        mov     rcx, rax
        call    parser_error
.L96:
        mov     rcx, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_variable
.L92:
        add     rsp, 96
        pop     rbp
        ret
.LC40:
        .ascii "Cannot use 'break' outside of a loop\0"
.LC41:
        .ascii "Cannot use 'continue' outside of a loop\0"
.LC42:
        .ascii "Failed to parse statement\0"
.LC43:
        .ascii "Expected ';' after statement\0"
parse_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -24[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L98
        mov     rax, QWORD PTR .refptr.IF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L99
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
        jmp     .L100
.L99:
        mov     rax, QWORD PTR .refptr.FOR_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L101
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
        jmp     .L100
.L101:
        mov     rax, QWORD PTR .refptr.WHILE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L102
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
        jmp     .L100
.L102:
        mov     rax, QWORD PTR .refptr.VAR_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L103
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
        jmp     .L104
.L103:
        mov     rax, QWORD PTR .refptr.RETURN_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L105
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
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
        jmp     .L104
.L105:
        mov     rax, QWORD PTR .refptr.BREAK_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L106
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 2[rax]
        test    al, al
        jne     .L107
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC40[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L100
.L107:
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 6
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L104
.L106:
        mov     rax, QWORD PTR .refptr.CONTINUE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L108
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 2[rax]
        test    al, al
        jne     .L109
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC41[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L100
.L109:
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 7
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L104
.L108:
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
        jmp     .L104
.L98:
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
.L104:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L110
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC42[rip]
        mov     rcx, rax
        call    parser_error
.L110:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L111
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L112
.L111:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        lea     rax, .LC43[rip]
        mov     rcx, rax
        call    parser_error
.L112:
        mov     rax, QWORD PTR -8[rbp]
.L100:
        add     rsp, 80
        pop     rbp
        ret
.LC44:
        .ascii "Expected '(' after 'if'\0"
.LC45:
        .ascii "Failed to parse if condition\0"
.LC46:
        .ascii "Expected ')' after if condition\0"
.LC47:
        .ascii "Expected '{' to start if body\0"
.LC48:
        .ascii "Failed to parse if body statement\0"
.LC49:
        .ascii "Expected '(' after 'elif'\0"
.LC50:
        .ascii "Failed to parse else-if condition\0"
.LC51:
        .ascii "Expected ')' after else-if condition\0"
.LC52:
        .ascii "Expected '{' to start else-if body\0"
.LC53:
        .ascii "Failed to parse else-if body statement\0"
.LC54:
        .ascii "Expected '{' to start else body\0"
.LC55:
        .ascii "Failed to parse else body statement\0"
parse_if:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L114
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L115
.L114:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC44[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L115:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L117
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC45[rip]
        mov     rcx, rax
        call    parser_error
.L117:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L118
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L119
.L118:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC46[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L119:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L120
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L121
.L120:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC47[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L121:
        call    create_list
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L122
.L124:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L123
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC48[rip]
        mov     rcx, rax
        call    parser_error
.L123:
        mov     rdx, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L122:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L124
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L124
        call    create_list
        mov     QWORD PTR -40[rbp], rax
        call    create_list
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L125
.L137:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L126
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L127
.L126:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC49[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L127:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -56[rbp], rax
        cmp     QWORD PTR -56[rbp], 0
        jne     .L128
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC50[rip]
        mov     rcx, rax
        call    parser_error
.L128:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L129
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L130
.L129:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC51[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L130:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L131
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L132
.L131:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC52[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L132:
        call    create_list
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L133
.L135:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L134
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC53[rip]
        mov     rcx, rax
        call    parser_error
.L134:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L133:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L135
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L135
        mov     rdx, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    create_else_if
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L125:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L136
        mov     rax, QWORD PTR .refptr.ELIF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L137
.L136:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L138
        mov     rax, QWORD PTR .refptr.ELSE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L138
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L139
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L140
.L139:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC54[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L116
.L140:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L141
.L143:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L142
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC55[rip]
        mov     rcx, rax
        call    parser_error
.L142:
        mov     rdx, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L141:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L143
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L143
.L138:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     r8, QWORD PTR -48[rbp]
        mov     rcx, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    create_if
.L116:
        sub     rsp, -128
        pop     rbp
        ret
.LC56:
        .ascii "Expected '(' after 'for'\0"
.LC57:
        .ascii "Failed to parse for loop initializer\0"
.LC58:
        .ascii "Expected ';' after for loop initializer\0"
.LC59:
        .ascii "Failed to parse for loop condition\0"
.LC60:
        .ascii "Expected ';' after for loop condition\0"
.LC61:
        .ascii "Failed to parse for loop increment\0"
.LC62:
        .ascii "Expected ')' after for loop increment\0"
.LC63:
        .ascii "Expected '{' to start for loop body\0"
.LC64:
        .ascii "Failed to parse for loop body statement\0"
parse_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L145
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L146
.L145:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC56[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L146:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     QWORD PTR -24[rbp], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L148
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L149
.L148:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L150
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    parser_error
.L150:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L149:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L151
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L152
.L151:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC58[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L152:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     QWORD PTR -32[rbp], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L153
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L154
.L153:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L155
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC59[rip]
        mov     rcx, rax
        call    parser_error
.L155:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L154:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L156
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L157
.L156:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC60[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L157:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     QWORD PTR -40[rbp], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L158
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L159
.L158:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L160
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC61[rip]
        mov     rcx, rax
        call    parser_error
.L160:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L159:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L161
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L162
.L161:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC62[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L162:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L163
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L164
.L163:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC63[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L147
.L164:
        call    create_list
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 2[rax], 1
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L165
.L167:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -56[rbp], rax
        cmp     QWORD PTR -56[rbp], 0
        jne     .L166
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC64[rip]
        mov     rcx, rax
        call    parser_error
.L166:
        mov     rdx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L165:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L167
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L167
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 2[rax], 0
        mov     r8, QWORD PTR -48[rbp]
        mov     rcx, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    create_for
.L147:
        add     rsp, 96
        pop     rbp
        ret
.LC65:
        .ascii "Expected '(' after 'while'\0"
.LC66:
        .ascii "Failed to parse while condition\0"
.LC67:
        .ascii "Expected ')' after while condition\0"
.LC68:
        .ascii "Expected '{' to start while body\0"
.LC69:
        .ascii "Failed to parse while body statement\0"
parse_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L169
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L170
.L169:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC65[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L171
.L170:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L172
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC66[rip]
        mov     rcx, rax
        call    parser_error
.L172:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L173
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L174
.L173:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC67[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L171
.L174:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L175
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L176
.L175:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC68[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L171
.L176:
        call    create_list
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 2[rax], 1
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L177
.L179:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L178
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC69[rip]
        mov     rcx, rax
        call    parser_error
.L178:
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L177:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L179
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L179
        mov     rax, QWORD PTR 32[rbp]
        mov     BYTE PTR 2[rax], 0
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_while
.L171:
        add     rsp, 80
        pop     rbp
        ret
.LC70:
        .ascii "Failed to parse right operand\0"
parse_expr_prec:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     DWORD PTR 32[rbp], r8d
        mov     QWORD PTR 40[rbp], r9
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L181
.L189:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_to_operator
        mov     DWORD PTR -28[rbp], eax
        mov     eax, DWORD PTR -28[rbp]
        mov     ecx, eax
        call    operator_precedence
        mov     DWORD PTR -32[rbp], eax
        cmp     DWORD PTR -28[rbp], 19
        je      .L182
        mov     eax, DWORD PTR -32[rbp]
        cmp     eax, DWORD PTR 32[rbp]
        jl      .L182
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L183
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        lea     rax, .LC70[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L184
.L183:
        mov     rax, QWORD PTR -40[rbp]
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
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L185
.L188:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_to_operator
        mov     DWORD PTR -44[rbp], eax
        mov     eax, DWORD PTR -44[rbp]
        mov     ecx, eax
        call    operator_precedence
        mov     DWORD PTR -48[rbp], eax
        cmp     DWORD PTR -44[rbp], 19
        je      .L186
        mov     eax, DWORD PTR -48[rbp]
        cmp     eax, DWORD PTR -32[rbp]
        jle     .L186
        mov     r9, QWORD PTR 40[rbp]
        mov     r8d, DWORD PTR -48[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    parse_expr_prec
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L187
        mov     eax, 0
        jmp     .L184
.L187:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
.L185:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L188
.L186:
        mov     rcx, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR -28[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     ecx, eax
        call    create_expression
        mov     QWORD PTR 24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
.L181:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L189
.L182:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
.L184:
        add     rsp, 96
        pop     rbp
        ret
.LC71:
        .ascii "Failed to parse expression primary\0"
parse_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L191
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     rdx, rax
        lea     rax, .LC71[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L192
.L191:
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rcx, rax
        mov     r8, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, r8
        mov     r8d, 0
        mov     rdx, rcx
        mov     rcx, rax
        call    parse_expr_prec
.L192:
        add     rsp, 64
        pop     rbp
        ret
.LC72:
        .ascii "Failed to parse parenthesized expression\0"
.LC73:
        .ascii "Expected ')' after expression\0"
.LC74:
        .ascii "Failed to parse operand of unary '!'\0"
.LC75:
        .ascii "Failed to parse operand of unary '-'\0"
.LC76:
        .ascii "Failed to parse variable access\0"
.LC77:
        .ascii "Unexpected token in primary expression\0"
parse_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR -48[rbp], 0
        mov     QWORD PTR -56[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    peek_current_token
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR -56[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     QWORD PTR -40[rbp], 0
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        jne     .L194
        mov     DWORD PTR -4[rbp], 0
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L195
.L194:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        jne     .L196
        mov     DWORD PTR -4[rbp], 1
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L195
.L196:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L197
        mov     DWORD PTR -4[rbp], 2
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L195
.L197:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L198
        mov     rax, QWORD PTR .refptr.TRUE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L198
        mov     DWORD PTR -4[rbp], 3
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L195
.L198:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L199
        mov     rax, QWORD PTR .refptr.FALSE_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L199
        mov     DWORD PTR -4[rbp], 4
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L195
.L199:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L200
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L200
        mov     DWORD PTR -4[rbp], 5
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR -56[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L201
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, rax
        lea     rax, .LC72[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L201:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L203
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L212
.L203:
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, rax
        lea     rax, .LC73[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L200:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L205
        mov     rax, QWORD PTR .refptr.NOT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L205
        mov     DWORD PTR -4[rbp], 6
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR -56[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L195
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, rax
        lea     rax, .LC74[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L205:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L207
        mov     rax, QWORD PTR .refptr.SUB_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L207
        mov     DWORD PTR -4[rbp], 7
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR -56[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L195
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, rax
        lea     rax, .LC75[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L207:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L209
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L210
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L210
        mov     rax, QWORD PTR 32[rbp]
        movzx   eax, BYTE PTR 1[rax]
        test    al, al
        je      .L210
.L209:
        mov     DWORD PTR -4[rbp], 8
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable_access
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L195
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, rax
        lea     rax, .LC76[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L210:
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, rax
        lea     rax, .LC77[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L202
.L212:
        nop
.L195:
        mov     r9, QWORD PTR -32[rbp]
        mov     r8, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR -4[rbp]
        mov     rcx, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     ecx, eax
        call    create_primary
.L202:
        add     rsp, 112
        pop     rbp
        ret
.LC78:
        .ascii "Expected variable name in variable access\0"
.LC79:
        .ascii "Cannot call undefined variable\0"
.LC80:
        .ascii "Cannot call non-function variable\0"
.LC81:
        .ascii "Failed to parse function call argument\0"
.LC82:
        .ascii "Expected ',' or ')' after function call argument\0"
.LC83:
        .ascii "Failed to parse sequence index\0"
.LC84:
        .ascii "Expected ']' after sequence index\0"
.LC85:
        .ascii "Cannot access attribute without a valid scope\0"
.LC86:
        .ascii "Expected attribute name after '.'\0"
.LC87:
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L214
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L215
        mov     rax, QWORD PTR .refptr.SELF_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L214
.L215:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC78[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L214:
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     QWORD PTR -40[rbp], 0
        mov     QWORD PTR -56[rbp], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    search
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L217
.L241:
        cmp     QWORD PTR -32[rbp], 0
        je      .L218
        mov     rax, QWORD PTR -32[rbp]
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L219
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L219
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        je      .L219
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        jne     .L220
.L219:
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -24[rbp], rax
        jmp     .L218
.L220:
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        je      .L221
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        jne     .L218
.L221:
        mov     rax, QWORD PTR -32[rbp]
        mov     QWORD PTR -24[rbp], rax
.L218:
        cmp     QWORD PTR -40[rbp], 0
        jne     .L222
        cmp     QWORD PTR -24[rbp], 0
        je      .L222
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR -64[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L222
        mov     rax, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -40[rbp], rax
.L222:
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L223
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L224
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC79[rip]
        mov     rcx, rax
        call    parser_error
.L224:
        mov     rax, QWORD PTR -32[rbp]
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        je      .L225
        mov     rax, QWORD PTR -56[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        je      .L225
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC80[rip]
        mov     rcx, rax
        call    parser_error
.L225:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        call    create_list
        mov     QWORD PTR -80[rbp], rax
        jmp     .L226
.L230:
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L227
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC81[rip]
        mov     rcx, rax
        call    parser_error
.L227:
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L228
        mov     rax, QWORD PTR .refptr.COMMA_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L228
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L226
.L228:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L229
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L226
.L229:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC82[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L226:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L230
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L230
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR -80[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 1
        call    create_variable_access
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -32[rbp], rax
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -40[rbp], 0
        jmp     .L231
.L223:
        mov     rax, QWORD PTR .refptr.L_BRACKET_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L232
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L233
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC83[rip]
        mov     rcx, rax
        call    parser_error
.L233:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L234
        mov     rax, QWORD PTR .refptr.R_BRACKET_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L235
.L234:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC84[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L235:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9, rdx
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 3
        call    create_variable_access
        mov     QWORD PTR -48[rbp], rax
        jmp     .L231
.L232:
        mov     rax, QWORD PTR .refptr.DOT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -16[rbp]
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
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L237
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC85[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L237:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L238
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC86[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L238:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    search
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L239
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        lea     rax, .LC87[rip]
        mov     rcx, rax
        call    parser_error
        mov     eax, 0
        jmp     .L216
.L239:
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 2
        call    create_variable_access
        mov     QWORD PTR -48[rbp], rax
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -40[rbp], 0
.L231:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
.L217:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L241
        jmp     .L240
.L242:
        nop
.L240:
        mov     rax, QWORD PTR -48[rbp]
.L216:
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

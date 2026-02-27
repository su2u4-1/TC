.LC0:
        .ascii "%.*s%s\0"
.LC1:
        .ascii "%s\0"
.LC2:
        .ascii "%s%s\0"
string_append:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -16[rbp], rax
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        cmp     rax, QWORD PTR 24[rbp]
        jb      .L2
        mov     rax, QWORD PTR 24[rbp]
        sub     rax, QWORD PTR -16[rbp]
        sub     rax, 1
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     r8d, eax
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, QWORD PTR 40[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR 32[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     r9d, r8d
        lea     r8, .LC0[rip]
        mov     rcx, rax
        call    snprintf
        jmp     .L5
.L2:
        mov     rax, QWORD PTR 32[rbp]
        cmp     rax, QWORD PTR 16[rbp]
        jne     .L4
        mov     rax, QWORD PTR 24[rbp]
        sub     rax, QWORD PTR -8[rbp]
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        add     rcx, rdx
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        lea     r8, .LC1[rip]
        mov     rdx, rax
        call    snprintf
        jmp     .L5
.L4:
        mov     r8, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, QWORD PTR 40[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     r9, r8
        lea     r8, .LC2[rip]
        mov     rcx, rax
        call    snprintf
.L5:
        nop
        add     rsp, 80
        pop     rbp
        ret
.LC3:
        .ascii "\0"
read_source:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     r8d, 2
        mov     edx, 0
        mov     rcx, rax
        call    fseek
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    ftell
        movsx   rdx, eax
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    fseek
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC3[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 1
        mov     rcx, rax
        call    fread
        mov     QWORD PTR -24[rbp], rax
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     QWORD PTR -8[rbp], 0
        jmp     .L7
.L10:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 13
        je      .L8
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 9
        jne     .L9
.L8:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 32
.L9:
        add     QWORD PTR -8[rbp], 1
.L7:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -8[rbp], rax
        jb      .L10
        mov     rax, QWORD PTR -16[rbp]
        add     rsp, 64
        pop     rbp
        ret
.LC4:
        .ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC5:
        .ascii "Token(Type: identifier,  Line: \0"
.LC6:
        .ascii "Token(Type: integer,     Line: \0"
.LC7:
        .ascii "Token(Type: float,       Line: \0"
.LC8:
        .ascii "Token(Type: string,      Line: \0"
.LC9:
        .ascii "Token(Type: symbol,      Line: \0"
.LC10:
        .ascii "Token(Type: keyword,     Line: \0"
.LC11:
        .ascii "Token(Type: comment,     Line: \0"
.LC12:
        .ascii "%zu, Column: %zu)\11Lexeme: '\0"
.LC13:
        .ascii "\\0\0"
.LC14:
        .ascii "\\n\0"
.LC15:
        .ascii "\\t\0"
.LC16:
        .ascii "\\r\0"
.LC17:
        .ascii "'\12\0"
.LC18:
        .ascii "\12info by lib:\12    %s\12\0"
output_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L13
.L30:
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        jne     .L14
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC4[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L15
.L14:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        jne     .L16
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L17
.L16:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        jne     .L18
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC6[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L17
.L18:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        jne     .L19
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L17
.L19:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L20
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC8[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L17
.L20:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L21
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC9[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L17
.L21:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L22
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L17
.L22:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 7
        jne     .L17
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC11[rip]
        mov     rcx, rax
        call    fwrite
.L17:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC12[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -32[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        jmp     .L23
.L29:
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR -33[rbp], al
        cmp     BYTE PTR -33[rbp], 0
        jne     .L24
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC13[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L25
.L24:
        cmp     BYTE PTR -33[rbp], 10
        jne     .L26
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC14[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L25
.L26:
        cmp     BYTE PTR -33[rbp], 9
        jne     .L27
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC15[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L25
.L27:
        cmp     BYTE PTR -33[rbp], 13
        jne     .L28
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L25
.L28:
        movsx   eax, BYTE PTR -33[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     ecx, eax
        call    fputc
.L25:
        add     QWORD PTR -16[rbp], 1
.L23:
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    strlen
        cmp     QWORD PTR -16[rbp], rax
        jb      .L29
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 24[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L13:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L30
.L15:
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC18[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 80
        pop     rbp
        ret
output_ast:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_code
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    output_code
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC18[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC19:
        .ascii "r\0"
.LC20:
        .ascii "Error opening file: %s\0"
.LC21:
        .ascii ".token\0"
.LC22:
        .ascii "w\0"
.LC23:
        .ascii "Error opening file: %s\12\0"
.LC24:
        .ascii ".ast\0"
parse_file:
        push    rbp
        mov     rbp, rsp
        add     rsp, -128
        mov     QWORD PTR 16[rbp], rcx
        mov     eax, edx
        mov     edx, r8d
        mov     BYTE PTR 24[rbp], al
        mov     eax, edx
        mov     BYTE PTR 32[rbp], al
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    create_file
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    get_full_path
        mov     QWORD PTR -16[rbp], rax
        mov     QWORD PTR -88[rbp], 0
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, .LC19[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L33
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     r8, rax
        lea     rax, .LC20[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L32
.L33:
        lea     rdx, -88[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    read_source
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    fclose
        mov     rdx, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_lexer
        mov     QWORD PTR -40[rbp], rax
        cmp     BYTE PTR 24[rbp], 0
        je      .L35
        mov     edx, 6
        lea     rax, .LC21[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    get_full_path
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        lea     rdx, .LC22[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -56[rbp], rax
        cmp     QWORD PTR -56[rbp], 0
        jne     .L36
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rax
        lea     rax, .LC23[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L35
.L36:
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    output_token
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    fclose
.L35:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    reset_lexer
        call    create_parser
        mov     QWORD PTR -64[rbp], rax
        cmp     BYTE PTR 32[rbp], 0
        je      .L32
        mov     edx, 4
        lea     rax, .LC24[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    get_full_path
        mov     QWORD PTR -72[rbp], rax
        mov     rax, QWORD PTR -72[rbp]
        lea     rdx, .LC22[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L38
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -72[rbp]
        mov     r8, rax
        lea     rax, .LC23[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L32
.L38:
        mov     rcx, QWORD PTR -64[rbp]
        mov     rdx, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_ast
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    fclose
        nop
.L32:
        sub     rsp, -128
        pop     rbp
        ret
.refptr.builtin_scope:
        .quad   builtin_scope

.LC0:
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
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string_not_check
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
        jmp     .L2
.L5:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 13
        je      .L3
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 9
        jne     .L4
.L3:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 32
.L4:
        add     QWORD PTR -8[rbp], 1
.L2:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -8[rbp], rax
        jb      .L5
        mov     rax, QWORD PTR -16[rbp]
        add     rsp, 64
        pop     rbp
        ret
.LC1:
        .ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC2:
        .ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC3:
        .ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC4:
        .ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC5:
        .ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC6:
        .ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC7:
        .ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC8:
        .ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC9:
        .ascii "\\0\0"
.LC10:
        .ascii "\\n\0"
.LC11:
        .ascii "\\t\0"
.LC12:
        .ascii "\\r\0"
.LC13:
        .ascii "'\12\0"
output_one_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        jne     .L8
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC1[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L7
.L8:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        jne     .L10
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC2[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L11
.L10:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        jne     .L12
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC3[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L11
.L12:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        jne     .L13
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC4[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L11
.L13:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L14
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC5[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L11
.L14:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L15
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC6[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L11
.L15:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L16
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC7[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L11
.L16:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 7
        jne     .L11
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC8[rip]
        mov     rcx, rax
        call    fprintf
.L11:
        mov     QWORD PTR -8[rbp], 0
        jmp     .L17
.L23:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR -9[rbp], al
        cmp     BYTE PTR -9[rbp], 0
        jne     .L18
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC9[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L19
.L18:
        cmp     BYTE PTR -9[rbp], 10
        jne     .L20
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L19
.L20:
        cmp     BYTE PTR -9[rbp], 9
        jne     .L21
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC11[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L19
.L21:
        cmp     BYTE PTR -9[rbp], 13
        jne     .L22
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC12[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L19
.L22:
        movsx   eax, BYTE PTR -9[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     ecx, eax
        call    fputc
.L19:
        add     QWORD PTR -8[rbp], 1
.L17:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        cmp     QWORD PTR -8[rbp], rax
        jb      .L23
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC13[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L7:
        add     rsp, 48
        pop     rbp
        ret
.LC14:
        .ascii "\12info by lib:\12    %s\12\0"
output_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L25
.L28:
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    output_one_token
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        je      .L29
        mov     rax, QWORD PTR 24[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L25:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L28
        jmp     .L27
.L29:
        nop
.L27:
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC14[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 48
        pop     rbp
        ret
output_ast:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        lea     rcx, -32[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    output_code
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC14[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 64
        pop     rbp
        ret
output_tac:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    output_TAC
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC14[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 32
        pop     rbp
        ret
.LC15:
        .ascii "r\0"
.LC16:
        .ascii "Error opening file: %s\12\0"
.LC17:
        .ascii ".token\0"
.LC18:
        .ascii "w\0"
.LC19:
        .ascii ".ast\0"
.LC20:
        .ascii ".tc\0"
.LC21:
        .ascii ".tac\0"
parse_file:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 160
        mov     QWORD PTR 16[rbp], rcx
        mov     eax, edx
        mov     ecx, r8d
        mov     edx, r9d
        mov     BYTE PTR 24[rbp], al
        mov     eax, ecx
        mov     BYTE PTR 32[rbp], al
        mov     eax, edx
        mov     BYTE PTR 40[rbp], al
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    create_file
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    get_full_path
        mov     QWORD PTR -24[rbp], rax
        mov     QWORD PTR -120[rbp], 0
        mov     rax, QWORD PTR -24[rbp]
        lea     rdx, .LC15[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L33
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     r8, rax
        lea     rax, .LC16[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L32
.L33:
        lea     rdx, -120[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    read_source
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    fclose
        mov     rdx, QWORD PTR -120[rbp]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_lexer
        mov     QWORD PTR -48[rbp], rax
        cmp     BYTE PTR 24[rbp], 0
        je      .L35
        mov     edx, 6
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    get_full_path
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        lea     rdx, .LC18[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L36
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     r8, rax
        lea     rax, .LC16[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L35
.L36:
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    output_token
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    fclose
.L35:
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    reset_lexer
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_parser
        mov     QWORD PTR -72[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        cmp     BYTE PTR 32[rbp], 0
        jne     .L37
        cmp     BYTE PTR 40[rbp], 0
        je      .L38
.L37:
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_code
        mov     QWORD PTR -8[rbp], rax
.L38:
        cmp     BYTE PTR 32[rbp], 0
        je      .L39
        mov     edx, 4
        lea     rax, .LC19[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    get_full_path
        mov     QWORD PTR -80[rbp], rax
        mov     edx, 3
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -80[rbp]
        lea     rdx, .LC18[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L40
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -80[rbp]
        mov     r8, rax
        lea     rax, .LC16[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L39
.L40:
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    output_ast
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    fclose
.L39:
        cmp     BYTE PTR 40[rbp], 0
        je      .L32
        mov     edx, 4
        lea     rax, .LC21[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    get_full_path
        mov     QWORD PTR -96[rbp], rax
        mov     edx, 3
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -96[rbp]
        lea     rdx, .LC18[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -104[rbp], rax
        cmp     QWORD PTR -104[rbp], 0
        jne     .L42
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -96[rbp]
        mov     r8, rax
        lea     rax, .LC16[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L32
.L42:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    tac_code
        mov     QWORD PTR -112[rbp], rax
        mov     rdx, QWORD PTR -112[rbp]
        mov     rax, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    output_tac
        mov     rax, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    fclose
        nop
.L32:
        add     rsp, 160
        pop     rbp
        ret
.refptr.builtin_scope:
        .quad   builtin_scope

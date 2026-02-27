create_lexer:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     ecx, 80
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 32[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 40[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 48[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 56[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 64[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 72[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 24[rax], edx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC0:
        .ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
lexer_error:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 48
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     rax, QWORD PTR 48[rbp]
        lea     rsi, 1[rax]
        mov     rax, QWORD PTR 40[rbp]
        lea     rbx, 1[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     QWORD PTR 32[rsp], rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC0[rip]
        mov     rdx, rax
        call    fprintf
        nop
        add     rsp, 48
        pop     rbx
        pop     rsi
        pop     rbp
        ret
get_current_char:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        cmp     rdx, rax
        jb      .L7
        mov     eax, 0
        jmp     .L8
.L7:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rdx], rcx
        add     rax, r8
        movzx   eax, BYTE PTR [rax]
.L8:
        pop     rbp
        ret
peek_next_char:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        cmp     rdx, rax
        jb      .L10
        mov     eax, 0
        jmp     .L11
.L10:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
.L11:
        pop     rbp
        ret
newline:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], 0
        nop
        pop     rbp
        ret
move_position:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     DWORD PTR 24[rbp], edx
        cmp     DWORD PTR 24[rbp], 0
        js      .L14
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 24[rbp]
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     eax, DWORD PTR 24[rbp]
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], rdx
        jmp     .L16
.L14:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 24[rbp]
        neg     eax
        cdqe
        sub     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     eax, DWORD PTR 24[rbp]
        neg     eax
        cdqe
        sub     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], rdx
.L16:
        nop
        pop     rbp
        ret
.LC1:
        .ascii "Unterminated string literal\0"
.LC2:
        .ascii "C:\\Windows\\TEMP\\compiler-explorer-compilerawsr7s\\example.c\0"
.LC3:
        .ascii "c != '\\0'\0"
.LC4:
        .ascii "Unterminated comment\0"
.LC5:
        .ascii "Unexpected character\0"
next_token:
        push    rbp
        push    rbx
        sub     rsp, 152
        lea     rbp, 144[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     eax, edx
        mov     BYTE PTR 40[rbp], al
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        cmp     BYTE PTR -1[rbp], 0
        jne     .L18
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     r9, rdx
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_token
        jmp     .L19
.L18:
        cmp     BYTE PTR -1[rbp], 32
        je      .L20
        cmp     BYTE PTR -1[rbp], 9
        je      .L20
        cmp     BYTE PTR -1[rbp], 13
        jne     .L21
.L20:
        movsx   edx, BYTE PTR 40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L19
.L21:
        cmp     BYTE PTR -1[rbp], 10
        jne     .L22
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    newline
        movsx   edx, BYTE PTR 40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L19
.L22:
        cmp     BYTE PTR -1[rbp], 96
        jle     .L23
        cmp     BYTE PTR -1[rbp], 122
        jle     .L24
.L23:
        cmp     BYTE PTR -1[rbp], 64
        jle     .L25
        cmp     BYTE PTR -1[rbp], 90
        jle     .L24
.L25:
        cmp     BYTE PTR -1[rbp], 95
        jne     .L26
.L24:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, 1
        mov     QWORD PTR -96[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        sub     rax, 1
        mov     QWORD PTR -104[rbp], rax
        jmp     .L27
.L29:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L27:
        cmp     BYTE PTR -1[rbp], 96
        jle     .L28
        cmp     BYTE PTR -1[rbp], 122
        jle     .L29
.L28:
        cmp     BYTE PTR -1[rbp], 64
        jle     .L30
        cmp     BYTE PTR -1[rbp], 90
        jle     .L29
.L30:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L31
        cmp     BYTE PTR -1[rbp], 57
        jle     .L29
.L31:
        cmp     BYTE PTR -1[rbp], 95
        je      .L29
        mov     rax, QWORD PTR 32[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, QWORD PTR -96[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR -96[rbp]
        add     rcx, rdx
        mov     rdx, rax
        call    create_string
        mov     QWORD PTR -112[rbp], rax
        mov     rax, QWORD PTR -112[rbp]
        mov     rcx, rax
        call    is_keyword
        test    al, al
        je      .L32
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rcx, QWORD PTR -104[rbp]
        mov     rax, QWORD PTR -112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 6
        call    create_token
        jmp     .L19
.L32:
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rcx, QWORD PTR -104[rbp]
        mov     rax, QWORD PTR -112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 1
        call    create_token
        jmp     .L19
.L26:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L33
        cmp     BYTE PTR -1[rbp], 57
        jg      .L33
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, 1
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        sub     rax, 1
        mov     QWORD PTR -32[rbp], rax
        jmp     .L34
.L36:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L34:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L35
        cmp     BYTE PTR -1[rbp], 57
        jle     .L36
.L35:
        mov     DWORD PTR -8[rbp], 2
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    peek_next_char
        mov     BYTE PTR -33[rbp], al
        cmp     BYTE PTR -1[rbp], 46
        jne     .L37
        cmp     BYTE PTR -33[rbp], 47
        jle     .L37
        cmp     BYTE PTR -33[rbp], 57
        jg      .L37
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        jmp     .L38
.L40:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L38:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L39
        cmp     BYTE PTR -1[rbp], 57
        jle     .L40
.L39:
        mov     DWORD PTR -8[rbp], 3
.L37:
        mov     rax, QWORD PTR 32[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR -24[rbp]
        add     rcx, rdx
        mov     rdx, rax
        call    create_string
        mov     rdx, rax
        mov     rcx, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR -8[rbp]
        mov     r9, rcx
        mov     r8, rbx
        mov     ecx, eax
        call    create_token
        jmp     .L19
.L33:
        cmp     BYTE PTR -1[rbp], 34
        jne     .L41
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        sub     rax, 1
        mov     QWORD PTR -88[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        jmp     .L42
.L44:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L42:
        cmp     BYTE PTR -1[rbp], 34
        je      .L43
        cmp     BYTE PTR -1[rbp], 0
        je      .L43
        cmp     BYTE PTR -1[rbp], 10
        jne     .L44
.L43:
        cmp     BYTE PTR -1[rbp], 34
        je      .L45
        mov     rax, QWORD PTR -80[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC1[rip]
        mov     rcx, rax
        call    lexer_error
        cmp     BYTE PTR -1[rbp], 10
        jne     .L46
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    newline
.L46:
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, QWORD PTR -80[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR -80[rbp]
        add     rax, rcx
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR -88[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 4
        call    create_token
        jmp     .L19
.L45:
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, QWORD PTR -80[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR -80[rbp]
        add     rax, rcx
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR -88[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 4
        call    create_token
        jmp     .L19
.L41:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    peek_next_char
        mov     BYTE PTR -9[rbp], al
        cmp     BYTE PTR -1[rbp], 47
        jne     .L47
        cmp     BYTE PTR -9[rbp], 47
        jne     .L47
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        add     rax, 1
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        sub     rax, 1
        mov     QWORD PTR -56[rbp], rax
        jmp     .L48
.L50:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L48:
        cmp     BYTE PTR -1[rbp], 10
        je      .L49
        cmp     BYTE PTR -1[rbp], 0
        jne     .L50
.L49:
        mov     rax, QWORD PTR 32[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
        cmp     BYTE PTR 40[rbp], 0
        je      .L51
        movsx   edx, BYTE PTR 40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L19
.L51:
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR -48[rbp]
        add     rcx, rdx
        mov     rdx, rax
        call    create_string
        mov     rdx, QWORD PTR -56[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 7
        call    create_token
        jmp     .L19
.L47:
        cmp     BYTE PTR -1[rbp], 47
        jne     .L52
        cmp     BYTE PTR -9[rbp], 42
        jne     .L52
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        add     rax, 1
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        sub     rax, 1
        mov     QWORD PTR -72[rbp], rax
        jmp     .L53
.L58:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    peek_next_char
        mov     BYTE PTR -9[rbp], al
        cmp     BYTE PTR -1[rbp], 10
        jne     .L54
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    newline
.L54:
        cmp     BYTE PTR -9[rbp], 0
        je      .L93
        cmp     BYTE PTR -1[rbp], 0
        jne     .L94
        mov     r8d, 241
        lea     rax, .LC2[rip]
        mov     rdx, rax
        lea     rax, .LC3[rip]
        mov     rcx, rax
        mov     rax, QWORD PTR __imp__assert[rip]
        call    rax
.L94:
        nop
.L53:
        cmp     BYTE PTR -1[rbp], 42
        jne     .L58
        cmp     BYTE PTR -9[rbp], 47
        jne     .L58
        jmp     .L56
.L93:
        nop
.L56:
        cmp     BYTE PTR -9[rbp], 0
        jne     .L59
        cmp     BYTE PTR -1[rbp], 0
        jne     .L60
        mov     rax, QWORD PTR 32[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
.L60:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR -64[rbp]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    lexer_error
        cmp     BYTE PTR 40[rbp], 0
        je      .L61
        movsx   edx, BYTE PTR 40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L19
.L61:
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, QWORD PTR -64[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR -64[rbp]
        add     rcx, rdx
        mov     rdx, rax
        call    create_string
        mov     rdx, QWORD PTR -72[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 7
        call    create_token
        jmp     .L19
.L59:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        cmp     BYTE PTR 40[rbp], 0
        je      .L62
        movsx   edx, BYTE PTR 40[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L19
.L62:
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        sub     rax, QWORD PTR -64[rbp]
        lea     rdx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR -64[rbp]
        add     rax, rcx
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR -72[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 7
        call    create_token
        jmp     .L19
.L52:
        cmp     BYTE PTR -1[rbp], 61
        jne     .L63
        cmp     BYTE PTR -9[rbp], 61
        jne     .L63
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.EQ_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L63:
        cmp     BYTE PTR -1[rbp], 33
        jne     .L64
        cmp     BYTE PTR -9[rbp], 61
        jne     .L64
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.NE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L64:
        cmp     BYTE PTR -1[rbp], 60
        jne     .L65
        cmp     BYTE PTR -9[rbp], 61
        jne     .L65
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.LE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L65:
        cmp     BYTE PTR -1[rbp], 62
        jne     .L66
        cmp     BYTE PTR -9[rbp], 61
        jne     .L66
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.GE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L66:
        cmp     BYTE PTR -1[rbp], 43
        jne     .L67
        cmp     BYTE PTR -9[rbp], 61
        jne     .L67
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.ADD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L67:
        cmp     BYTE PTR -1[rbp], 45
        jne     .L68
        cmp     BYTE PTR -9[rbp], 61
        jne     .L68
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.SUB_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L68:
        cmp     BYTE PTR -1[rbp], 42
        jne     .L69
        cmp     BYTE PTR -9[rbp], 61
        jne     .L69
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.MUL_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L69:
        cmp     BYTE PTR -1[rbp], 47
        jne     .L70
        cmp     BYTE PTR -9[rbp], 61
        jne     .L70
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.DIV_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L70:
        cmp     BYTE PTR -1[rbp], 37
        jne     .L71
        cmp     BYTE PTR -9[rbp], 61
        jne     .L71
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.MOD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L71:
        cmp     BYTE PTR -1[rbp], 38
        jne     .L72
        cmp     BYTE PTR -9[rbp], 38
        jne     .L72
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.AND_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L72:
        cmp     BYTE PTR -1[rbp], 124
        jne     .L73
        cmp     BYTE PTR -9[rbp], 124
        jne     .L73
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.OR_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L73:
        cmp     BYTE PTR -1[rbp], 40
        jne     .L74
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.L_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L74:
        cmp     BYTE PTR -1[rbp], 41
        jne     .L75
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.R_PAREN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L75:
        cmp     BYTE PTR -1[rbp], 123
        jne     .L76
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.L_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L76:
        cmp     BYTE PTR -1[rbp], 125
        jne     .L77
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.R_BRACE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L77:
        cmp     BYTE PTR -1[rbp], 44
        jne     .L78
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.COMMA_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L78:
        cmp     BYTE PTR -1[rbp], 33
        jne     .L79
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.NOT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L79:
        cmp     BYTE PTR -1[rbp], 46
        jne     .L80
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.DOT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L80:
        cmp     BYTE PTR -1[rbp], 91
        jne     .L81
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.L_BRACKET_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L81:
        cmp     BYTE PTR -1[rbp], 93
        jne     .L82
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.R_BRACKET_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L82:
        cmp     BYTE PTR -1[rbp], 59
        jne     .L83
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.SEMICOLON_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L83:
        cmp     BYTE PTR -1[rbp], 95
        jne     .L84
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.UNDERLINE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L84:
        cmp     BYTE PTR -1[rbp], 43
        jne     .L85
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.ADD_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L85:
        cmp     BYTE PTR -1[rbp], 45
        jne     .L86
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.SUB_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L86:
        cmp     BYTE PTR -1[rbp], 42
        jne     .L87
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.MUL_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L87:
        cmp     BYTE PTR -1[rbp], 47
        jne     .L88
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.DIV_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L88:
        cmp     BYTE PTR -1[rbp], 37
        jne     .L89
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.MOD_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L89:
        cmp     BYTE PTR -1[rbp], 60
        jne     .L90
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.LT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L90:
        cmp     BYTE PTR -1[rbp], 62
        jne     .L91
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.GT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L91:
        cmp     BYTE PTR -1[rbp], 61
        jne     .L92
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR .refptr.ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L19
.L92:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     r8, rdx
        mov     rdx, rax
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    lexer_error
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_token
.L19:
        add     rsp, 152
        pop     rbx
        pop     rbp
        ret
get_next_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     eax, edx
        mov     BYTE PTR 24[rbp], al
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 40[rax]
        test    rax, rax
        je      .L96
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 40[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 72[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 48[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 56[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 64[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 40[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 72[rax]
        jmp     .L97
.L96:
        movsx   edx, BYTE PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 72[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 72[rax]
.L97:
        add     rsp, 48
        pop     rbp
        ret
peek_next_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     eax, edx
        mov     BYTE PTR 24[rbp], al
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 40[rax]
        test    rax, rax
        je      .L99
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 40[rax]
        jmp     .L100
.L99:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     QWORD PTR -24[rbp], rax
        movsx   edx, BYTE PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 48[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 56[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 64[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 40[rax], rdx
        mov     rax, QWORD PTR -32[rbp]
.L100:
        add     rsp, 64
        pop     rbp
        ret
peek_current_token:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 72[rax]
        pop     rbp
        ret
reset_lexer:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 24[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 40[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 48[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 56[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 64[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 72[rax], 0
        nop
        pop     rbp
        ret
.refptr.ASSIGN_SYMBOL:
        .quad   ASSIGN_SYMBOL
.refptr.GT_SYMBOL:
        .quad   GT_SYMBOL
.refptr.LT_SYMBOL:
        .quad   LT_SYMBOL
.refptr.MOD_SYMBOL:
        .quad   MOD_SYMBOL
.refptr.DIV_SYMBOL:
        .quad   DIV_SYMBOL
.refptr.MUL_SYMBOL:
        .quad   MUL_SYMBOL
.refptr.SUB_SYMBOL:
        .quad   SUB_SYMBOL
.refptr.ADD_SYMBOL:
        .quad   ADD_SYMBOL
.refptr.UNDERLINE_SYMBOL:
        .quad   UNDERLINE_SYMBOL
.refptr.SEMICOLON_SYMBOL:
        .quad   SEMICOLON_SYMBOL
.refptr.R_BRACKET_SYMBOL:
        .quad   R_BRACKET_SYMBOL
.refptr.L_BRACKET_SYMBOL:
        .quad   L_BRACKET_SYMBOL
.refptr.DOT_SYMBOL:
        .quad   DOT_SYMBOL
.refptr.NOT_SYMBOL:
        .quad   NOT_SYMBOL
.refptr.COMMA_SYMBOL:
        .quad   COMMA_SYMBOL
.refptr.R_BRACE_SYMBOL:
        .quad   R_BRACE_SYMBOL
.refptr.L_BRACE_SYMBOL:
        .quad   L_BRACE_SYMBOL
.refptr.R_PAREN_SYMBOL:
        .quad   R_PAREN_SYMBOL
.refptr.L_PAREN_SYMBOL:
        .quad   L_PAREN_SYMBOL
.refptr.OR_SYMBOL:
        .quad   OR_SYMBOL
.refptr.AND_SYMBOL:
        .quad   AND_SYMBOL
.refptr.MOD_ASSIGN_SYMBOL:
        .quad   MOD_ASSIGN_SYMBOL
.refptr.DIV_ASSIGN_SYMBOL:
        .quad   DIV_ASSIGN_SYMBOL
.refptr.MUL_ASSIGN_SYMBOL:
        .quad   MUL_ASSIGN_SYMBOL
.refptr.SUB_ASSIGN_SYMBOL:
        .quad   SUB_ASSIGN_SYMBOL
.refptr.ADD_ASSIGN_SYMBOL:
        .quad   ADD_ASSIGN_SYMBOL
.refptr.GE_SYMBOL:
        .quad   GE_SYMBOL
.refptr.LE_SYMBOL:
        .quad   LE_SYMBOL
.refptr.NE_SYMBOL:
        .quad   NE_SYMBOL
.refptr.EQ_SYMBOL:
        .quad   EQ_SYMBOL

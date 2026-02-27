create_lexer:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     edi, 80
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+24], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+32], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+40], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+48], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+56], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+64], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+72], 0
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+24], edx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string "Lexer Error at Line %zu, Column %zu: %s\n"
lexer_error:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-24]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR stderr[rip]
        mov     rsi, QWORD PTR [rbp-8]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
get_current_char:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        cmp     rdx, rax
        jb      .L7
        mov     eax, 0
        jmp     .L8
.L7:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+32]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+8], rcx
        add     rax, rsi
        movzx   eax, BYTE PTR [rax]
.L8:
        pop     rbp
        ret
peek_next_char:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        cmp     rdx, rax
        jb      .L10
        mov     eax, 0
        jmp     .L11
.L10:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
.L11:
        pop     rbp
        ret
newline:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+24]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+32], 0
        nop
        pop     rbp
        ret
move_position:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     DWORD PTR [rbp-12], esi
        cmp     DWORD PTR [rbp-12], 0
        js      .L14
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rbp-12]
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+32]
        mov     eax, DWORD PTR [rbp-12]
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+32], rdx
        jmp     .L16
.L14:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rbp-12]
        neg     eax
        cdqe
        sub     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+32]
        mov     eax, DWORD PTR [rbp-12]
        neg     eax
        cdqe
        sub     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+32], rdx
.L16:
        nop
        pop     rbp
        ret
.LC1:
        .string "Unterminated string literal"
.LC2:
        .string "/app/example.c"
.LC3:
        .string "c != '\\0'"
.LC4:
        .string "Unterminated comment"
.LC5:
        .string "Unexpected character"
next_token:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 136
        mov     QWORD PTR [rbp-136], rdi
        mov     eax, esi
        mov     BYTE PTR [rbp-140], al
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
        cmp     BYTE PTR [rbp-17], 0
        jne     .L18
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+32]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+24]
        mov     rcx, rdx
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 0
        call    create_token
        jmp     .L19
.L18:
        cmp     BYTE PTR [rbp-17], 32
        je      .L20
        cmp     BYTE PTR [rbp-17], 9
        je      .L20
        cmp     BYTE PTR [rbp-17], 13
        jne     .L21
.L20:
        movsx   edx, BYTE PTR [rbp-140]
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, edx
        mov     rdi, rax
        call    next_token
        jmp     .L19
.L21:
        cmp     BYTE PTR [rbp-17], 10
        jne     .L22
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    newline
        movsx   edx, BYTE PTR [rbp-140]
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, edx
        mov     rdi, rax
        call    next_token
        jmp     .L19
.L22:
        cmp     BYTE PTR [rbp-17], 96
        jle     .L23
        cmp     BYTE PTR [rbp-17], 122
        jle     .L24
.L23:
        cmp     BYTE PTR [rbp-17], 64
        jle     .L25
        cmp     BYTE PTR [rbp-17], 90
        jle     .L24
.L25:
        cmp     BYTE PTR [rbp-17], 95
        jne     .L26
.L24:
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, 1
        mov     QWORD PTR [rbp-112], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        sub     rax, 1
        mov     QWORD PTR [rbp-120], rax
        jmp     .L27
.L29:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
.L27:
        cmp     BYTE PTR [rbp-17], 96
        jle     .L28
        cmp     BYTE PTR [rbp-17], 122
        jle     .L29
.L28:
        cmp     BYTE PTR [rbp-17], 64
        jle     .L30
        cmp     BYTE PTR [rbp-17], 90
        jle     .L29
.L30:
        cmp     BYTE PTR [rbp-17], 47
        jle     .L31
        cmp     BYTE PTR [rbp-17], 57
        jle     .L29
.L31:
        cmp     BYTE PTR [rbp-17], 95
        je      .L29
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, -1
        mov     rdi, rax
        call    move_position
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, QWORD PTR [rbp-112]
        mov     rdx, QWORD PTR [rbp-136]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR [rbp-112]
        add     rdx, rcx
        mov     rsi, rax
        mov     rdi, rdx
        call    create_string
        mov     QWORD PTR [rbp-128], rax
        mov     rax, QWORD PTR [rbp-128]
        mov     rdi, rax
        call    is_keyword
        test    al, al
        je      .L32
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rcx, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rbp-128]
        mov     rsi, rax
        mov     edi, 6
        call    create_token
        jmp     .L19
.L32:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rcx, QWORD PTR [rbp-120]
        mov     rax, QWORD PTR [rbp-128]
        mov     rsi, rax
        mov     edi, 1
        call    create_token
        jmp     .L19
.L26:
        cmp     BYTE PTR [rbp-17], 47
        jle     .L33
        cmp     BYTE PTR [rbp-17], 57
        jg      .L33
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, 1
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        sub     rax, 1
        mov     QWORD PTR [rbp-48], rax
        jmp     .L34
.L36:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
.L34:
        cmp     BYTE PTR [rbp-17], 47
        jle     .L35
        cmp     BYTE PTR [rbp-17], 57
        jle     .L36
.L35:
        mov     DWORD PTR [rbp-24], 2
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    peek_next_char
        mov     BYTE PTR [rbp-49], al
        cmp     BYTE PTR [rbp-17], 46
        jne     .L37
        cmp     BYTE PTR [rbp-49], 47
        jle     .L37
        cmp     BYTE PTR [rbp-49], 57
        jg      .L37
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
        jmp     .L38
.L40:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
.L38:
        cmp     BYTE PTR [rbp-17], 47
        jle     .L39
        cmp     BYTE PTR [rbp-17], 57
        jle     .L40
.L39:
        mov     DWORD PTR [rbp-24], 3
.L37:
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, -1
        mov     rdi, rax
        call    move_position
        mov     rax, QWORD PTR [rbp-136]
        mov     rbx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-136]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR [rbp-40]
        add     rdx, rcx
        mov     rsi, rax
        mov     rdi, rdx
        call    create_string
        mov     rsi, rax
        mov     rdx, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rbx
        mov     edi, eax
        call    create_token
        jmp     .L19
.L33:
        cmp     BYTE PTR [rbp-17], 34
        jne     .L41
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        sub     rax, 1
        mov     QWORD PTR [rbp-104], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
        jmp     .L42
.L44:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
.L42:
        cmp     BYTE PTR [rbp-17], 34
        je      .L43
        cmp     BYTE PTR [rbp-17], 0
        je      .L43
        cmp     BYTE PTR [rbp-17], 10
        jne     .L44
.L43:
        cmp     BYTE PTR [rbp-17], 34
        je      .L45
        mov     rax, QWORD PTR [rbp-96]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        call    lexer_error
        cmp     BYTE PTR [rbp-17], 10
        jne     .L46
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    newline
.L46:
        mov     rax, QWORD PTR [rbp-136]
        mov     rbx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, QWORD PTR [rbp-96]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-96]
        add     rax, rcx
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rcx, rax
        mov     rdx, rbx
        mov     edi, 4
        call    create_token
        jmp     .L19
.L45:
        mov     rax, QWORD PTR [rbp-136]
        mov     rbx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, QWORD PTR [rbp-96]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-96]
        add     rax, rcx
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rcx, rax
        mov     rdx, rbx
        mov     edi, 4
        call    create_token
        jmp     .L19
.L41:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    peek_next_char
        mov     BYTE PTR [rbp-25], al
        cmp     BYTE PTR [rbp-17], 47
        jne     .L47
        cmp     BYTE PTR [rbp-25], 47
        jne     .L47
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        add     rax, 1
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        sub     rax, 1
        mov     QWORD PTR [rbp-72], rax
        jmp     .L48
.L50:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
.L48:
        cmp     BYTE PTR [rbp-17], 10
        je      .L49
        cmp     BYTE PTR [rbp-17], 0
        jne     .L50
.L49:
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, -1
        mov     rdi, rax
        call    move_position
        cmp     BYTE PTR [rbp-140], 0
        je      .L51
        movsx   edx, BYTE PTR [rbp-140]
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, edx
        mov     rdi, rax
        call    next_token
        jmp     .L19
.L51:
        mov     rax, QWORD PTR [rbp-136]
        mov     rbx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-136]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR [rbp-64]
        add     rdx, rcx
        mov     rsi, rax
        mov     rdi, rdx
        call    create_string
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rcx, rax
        mov     rdx, rbx
        mov     edi, 7
        call    create_token
        jmp     .L19
.L47:
        cmp     BYTE PTR [rbp-17], 47
        jne     .L52
        cmp     BYTE PTR [rbp-25], 42
        jne     .L52
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        add     rax, 1
        mov     QWORD PTR [rbp-80], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        sub     rax, 1
        mov     QWORD PTR [rbp-88], rax
        jmp     .L53
.L57:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    peek_next_char
        mov     BYTE PTR [rbp-25], al
        cmp     BYTE PTR [rbp-17], 10
        jne     .L54
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    newline
.L54:
        cmp     BYTE PTR [rbp-25], 0
        je      .L92
        cmp     BYTE PTR [rbp-17], 0
        jne     .L53
        mov     ecx, OFFSET FLAT:__PRETTY_FUNCTION__.0
        mov     edx, 241
        mov     esi, OFFSET FLAT:.LC2
        mov     edi, OFFSET FLAT:.LC3
        call    __assert_fail
.L53:
        cmp     BYTE PTR [rbp-17], 42
        jne     .L57
        cmp     BYTE PTR [rbp-25], 47
        jne     .L57
        jmp     .L56
.L92:
        nop
.L56:
        cmp     BYTE PTR [rbp-25], 0
        jne     .L58
        cmp     BYTE PTR [rbp-17], 0
        jne     .L59
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, -1
        mov     rdi, rax
        call    move_position
.L59:
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+24]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC4
        call    lexer_error
        cmp     BYTE PTR [rbp-140], 0
        je      .L60
        movsx   edx, BYTE PTR [rbp-140]
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, edx
        mov     rdi, rax
        call    next_token
        jmp     .L19
.L60:
        mov     rax, QWORD PTR [rbp-136]
        mov     rbx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, QWORD PTR [rbp-80]
        mov     rdx, QWORD PTR [rbp-136]
        mov     rcx, QWORD PTR [rdx]
        mov     rdx, QWORD PTR [rbp-80]
        add     rdx, rcx
        mov     rsi, rax
        mov     rdi, rdx
        call    create_string
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rcx, rax
        mov     rdx, rbx
        mov     edi, 7
        call    create_token
        jmp     .L19
.L58:
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     BYTE PTR [rbp-17], al
        cmp     BYTE PTR [rbp-140], 0
        je      .L61
        movsx   edx, BYTE PTR [rbp-140]
        mov     rax, QWORD PTR [rbp-136]
        mov     esi, edx
        mov     rdi, rax
        call    next_token
        jmp     .L19
.L61:
        mov     rax, QWORD PTR [rbp-136]
        mov     rbx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+8]
        sub     rax, QWORD PTR [rbp-80]
        lea     rdx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-80]
        add     rax, rcx
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rcx, rax
        mov     rdx, rbx
        mov     edi, 7
        call    create_token
        jmp     .L19
.L52:
        cmp     BYTE PTR [rbp-17], 61
        jne     .L62
        cmp     BYTE PTR [rbp-25], 61
        jne     .L62
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR EQ_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L62:
        cmp     BYTE PTR [rbp-17], 33
        jne     .L63
        cmp     BYTE PTR [rbp-25], 61
        jne     .L63
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR NE_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L63:
        cmp     BYTE PTR [rbp-17], 60
        jne     .L64
        cmp     BYTE PTR [rbp-25], 61
        jne     .L64
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR LE_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L64:
        cmp     BYTE PTR [rbp-17], 62
        jne     .L65
        cmp     BYTE PTR [rbp-25], 61
        jne     .L65
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR GE_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L65:
        cmp     BYTE PTR [rbp-17], 43
        jne     .L66
        cmp     BYTE PTR [rbp-25], 61
        jne     .L66
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR ADD_ASSIGN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L66:
        cmp     BYTE PTR [rbp-17], 45
        jne     .L67
        cmp     BYTE PTR [rbp-25], 61
        jne     .L67
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR SUB_ASSIGN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L67:
        cmp     BYTE PTR [rbp-17], 42
        jne     .L68
        cmp     BYTE PTR [rbp-25], 61
        jne     .L68
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR MUL_ASSIGN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L68:
        cmp     BYTE PTR [rbp-17], 47
        jne     .L69
        cmp     BYTE PTR [rbp-25], 61
        jne     .L69
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR DIV_ASSIGN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L69:
        cmp     BYTE PTR [rbp-17], 37
        jne     .L70
        cmp     BYTE PTR [rbp-25], 61
        jne     .L70
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR MOD_ASSIGN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L70:
        cmp     BYTE PTR [rbp-17], 38
        jne     .L71
        cmp     BYTE PTR [rbp-25], 38
        jne     .L71
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR AND_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L71:
        cmp     BYTE PTR [rbp-17], 124
        jne     .L72
        cmp     BYTE PTR [rbp-25], 124
        jne     .L72
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    get_current_char
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-2]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR OR_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L72:
        cmp     BYTE PTR [rbp-17], 40
        jne     .L73
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR L_PAREN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L73:
        cmp     BYTE PTR [rbp-17], 41
        jne     .L74
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR R_PAREN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L74:
        cmp     BYTE PTR [rbp-17], 123
        jne     .L75
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR L_BRACE_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L75:
        cmp     BYTE PTR [rbp-17], 125
        jne     .L76
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR R_BRACE_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L76:
        cmp     BYTE PTR [rbp-17], 44
        jne     .L77
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR COMMA_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L77:
        cmp     BYTE PTR [rbp-17], 33
        jne     .L78
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR NOT_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L78:
        cmp     BYTE PTR [rbp-17], 46
        jne     .L79
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR DOT_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L79:
        cmp     BYTE PTR [rbp-17], 91
        jne     .L80
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR L_BRACKET_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L80:
        cmp     BYTE PTR [rbp-17], 93
        jne     .L81
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR R_BRACKET_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L81:
        cmp     BYTE PTR [rbp-17], 59
        jne     .L82
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR SEMICOLON_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L82:
        cmp     BYTE PTR [rbp-17], 95
        jne     .L83
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR UNDERLINE_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L83:
        cmp     BYTE PTR [rbp-17], 43
        jne     .L84
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR ADD_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L84:
        cmp     BYTE PTR [rbp-17], 45
        jne     .L85
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR SUB_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L85:
        cmp     BYTE PTR [rbp-17], 42
        jne     .L86
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR MUL_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L86:
        cmp     BYTE PTR [rbp-17], 47
        jne     .L87
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR DIV_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L87:
        cmp     BYTE PTR [rbp-17], 37
        jne     .L88
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR MOD_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L88:
        cmp     BYTE PTR [rbp-17], 60
        jne     .L89
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR LT_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L89:
        cmp     BYTE PTR [rbp-17], 62
        jne     .L90
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR GT_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L90:
        cmp     BYTE PTR [rbp-17], 61
        jne     .L91
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rcx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR ASSIGN_SYMBOL[rip]
        mov     rsi, rax
        mov     edi, 5
        call    create_token
        jmp     .L19
.L91:
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+32]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax+24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC5
        call    lexer_error
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 0
        call    create_token
.L19:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
get_next_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     eax, esi
        mov     BYTE PTR [rbp-28], al
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+40]
        test    rax, rax
        je      .L94
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+40]
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+72], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+48]
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+56]
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+64]
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+40], 0
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+72]
        jmp     .L95
.L94:
        movsx   edx, BYTE PTR [rbp-28]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, edx
        mov     rdi, rax
        call    next_token
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+72], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+72]
.L95:
        leave
        ret
peek_next_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     eax, esi
        mov     BYTE PTR [rbp-44], al
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+40]
        test    rax, rax
        je      .L97
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+40]
        jmp     .L98
.L97:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+24]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+32]
        mov     QWORD PTR [rbp-24], rax
        movsx   edx, BYTE PTR [rbp-44]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, edx
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+48], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+56], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax+32]
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+64], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+40], rdx
        mov     rax, QWORD PTR [rbp-32]
.L98:
        leave
        ret
peek_current_token:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+72]
        pop     rbp
        ret
reset_lexer:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+24], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+32], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+40], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+48], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+56], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+64], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+72], 0
        nop
        pop     rbp
        ret
__PRETTY_FUNCTION__.0:
        .string "next_token"

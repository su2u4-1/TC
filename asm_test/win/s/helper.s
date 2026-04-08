create_list:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_node:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC0:
        .ascii "Error: list_append received NULL list\12\0"
list_append:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L6
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 38
        mov     edx, 1
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L5
.L6:
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_node
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L8
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L5
.L8:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
.L5:
        add     rsp, 48
        pop     rbp
        ret
list_copy:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L10
        mov     eax, 0
        jmp     .L11
.L10:
        call    create_list
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L11:
        add     rsp, 48
        pop     rbp
        ret
list_pop:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR 16[rbp], rcx
        cmp     QWORD PTR 16[rbp], 0
        je      .L13
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L14
.L13:
        mov     eax, 0
        jmp     .L15
.L14:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L16
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], 0
.L16:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
.L15:
        add     rsp, 16
        pop     rbp
        ret
list_pop_back:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        cmp     QWORD PTR 16[rbp], 0
        je      .L18
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L19
.L18:
        mov     eax, 0
        jmp     .L20
.L19:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     rdx, rax
        jne     .L21
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L20
.L21:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L22
.L23:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
.L22:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     rdx, rax
        jne     .L23
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
.L20:
        add     rsp, 32
        pop     rbp
        ret
list_is_empty:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        cmp     QWORD PTR 16[rbp], 0
        je      .L25
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L25
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L26
.L25:
        mov     eax, 1
        jmp     .L27
.L26:
        mov     eax, 0
.L27:
        pop     rbp
        ret
.LC1:
        .ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
.LC2:
        .ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
.LC3:
        .ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
.LC4:
        .ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
create_symbol:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     DWORD PTR 56[rbp], edx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR 72[rbp], r9
        mov     QWORD PTR -8[rbp], 0
        cmp     DWORD PTR 56[rbp], 6
        ja      .L30
        cmp     DWORD PTR 56[rbp], 3
        jnb     .L31
        cmp     DWORD PTR 56[rbp], 2
        je      .L32
        cmp     DWORD PTR 56[rbp], 2
        ja      .L30
        cmp     DWORD PTR 56[rbp], 0
        je      .L33
        cmp     DWORD PTR 56[rbp], 1
        je      .L34
        jmp     .L30
.L33:
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L35
.L34:
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L35
.L32:
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L35
.L31:
        mov     rax, QWORD PTR 72[rbp]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L35
.L30:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 56[rbp]
        mov     r8d, eax
        lea     rax, .LC1[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L35:
        mov     rdx, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L36
        mov     rax, QWORD PTR id_counter.0[rip]
        lea     rsi, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rbx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     edi, DWORD PTR 32[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 40[rsp], rsi
        mov     QWORD PTR 32[rsp], rbx
        mov     r9d, edi
        mov     r8, rax
        lea     rax, .LC2[rip]
        mov     rdx, rax
        call    fprintf
.L36:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR id_counter.0[rip]
        add     rax, 1
        mov     QWORD PTR id_counter.0[rip], rax
        mov     rdx, QWORD PTR id_counter.0[rip]
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -24[rbp]
        mov     edx, DWORD PTR 56[rbp]
        mov     DWORD PTR 32[rax], edx
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR [rax], rdx
        cmp     DWORD PTR 56[rbp], 6
        ja      .L37
        cmp     DWORD PTR 56[rbp], 3
        jnb     .L38
        cmp     DWORD PTR 56[rbp], 2
        je      .L39
        cmp     DWORD PTR 56[rbp], 2
        ja      .L37
        cmp     DWORD PTR 56[rbp], 0
        je      .L40
        cmp     DWORD PTR 56[rbp], 1
        je      .L41
        jmp     .L37
.L40:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L42
.L41:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L42
.L39:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L42
.L38:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L42
.L37:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 56[rbp]
        mov     r8d, eax
        lea     rax, .LC3[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L42:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L43
        mov     rax, QWORD PTR -24[rbp]
        mov     rbx, QWORD PTR 16[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     edx, DWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rsp], rbx
        mov     r9d, edx
        mov     r8, rax
        lea     rax, .LC4[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L44
.L43:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
.L44:
        mov     rax, QWORD PTR -24[rbp]
        add     rsp, 88
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
create_symbol_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
search_name_use_strcmp:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        jmp     .L49
.L54:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L50
.L53:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L51
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L52
.L51:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
.L50:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L53
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 16[rbp], rax
.L49:
        cmp     QWORD PTR 16[rbp], 0
        jne     .L54
        mov     eax, 0
.L52:
        add     rsp, 64
        pop     rbp
        ret
search_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        jmp     .L56
.L61:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L57
.L60:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L58
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L59
.L58:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
.L57:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L60
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 16[rbp], rax
.L56:
        cmp     QWORD PTR 16[rbp], 0
        jne     .L61
        mov     eax, 0
.L59:
        add     rsp, 64
        pop     rbp
        ret
is_builtin_type:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR .refptr.INT_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rax, QWORD PTR .refptr.FLOAT_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rax, QWORD PTR .refptr.STRING_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rax, QWORD PTR .refptr.BOOL_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rax, QWORD PTR .refptr.VOID_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L64
.L63:
        mov     eax, 1
        jmp     .L65
.L64:
        mov     eax, 0
.L65:
        add     rsp, 32
        pop     rbp
        ret
.LC5:
        .ascii "[Parser Error] at %s:%zu:%zu: %s\12\0"
parser_error:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 48
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rsi, 1[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rdx, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     QWORD PTR 40[rsp], rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rsi
        mov     r8, rdx
        lea     rax, .LC5[rip]
        mov     rdx, rax
        call    fprintf
        nop
        add     rsp, 48
        pop     rbx
        pop     rsi
        pop     rbp
        ret
set_bool_list:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     eax, r8d
        mov     BYTE PTR 32[rbp], al
        mov     rax, QWORD PTR 24[rbp]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR -1[rbp], al
        cmp     BYTE PTR 32[rbp], 0
        je      .L69
        mov     rax, QWORD PTR 24[rbp]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        or      al, BYTE PTR -1[rbp]
        jmp     .L70
.L69:
        mov     rax, QWORD PTR 24[rbp]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        not     eax
        and     al, BYTE PTR -1[rbp]
.L70:
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rdx
        shr     rcx, 3
        mov     rdx, QWORD PTR 16[rbp]
        add     rdx, rcx
        mov     BYTE PTR [rdx], al
        nop
        add     rsp, 16
        pop     rbp
        ret
get_bool_list:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR 24[rbp]
        and     eax, 7
        mov     ecx, eax
        sar     edx, cl
        mov     eax, edx
        and     eax, 1
        test    eax, eax
        setne   al
        pop     rbp
        ret
.LC6:
        .ascii "\342\224\202   \0"
.LC7:
        .ascii "    \0"
.LC8:
        .ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC9:
        .ascii "\342\224\234\342\224\200\342\224\200 \0"
indention:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     eax, r8d
        mov     QWORD PTR 40[rbp], r9
        mov     BYTE PTR 32[rbp], al
        cmp     BYTE PTR 32[rbp], 0
        sete    al
        movzx   ecx, al
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 40[rbp]
        mov     r8d, ecx
        mov     rcx, rax
        call    set_bool_list
        mov     QWORD PTR -8[rbp], 1
        jmp     .L74
.L77:
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    get_bool_list
        test    al, al
        je      .L75
        lea     rax, .LC6[rip]
        jmp     .L76
.L75:
        lea     rax, .LC7[rip]
.L76:
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, rax
        call    fprintf
        add     QWORD PTR -8[rbp], 1
.L74:
        mov     rax, QWORD PTR -8[rbp]
        cmp     rax, QWORD PTR 24[rbp]
        jb      .L77
        cmp     QWORD PTR 24[rbp], 0
        je      .L81
        cmp     BYTE PTR 32[rbp], 0
        je      .L79
        lea     rax, .LC8[rip]
        jmp     .L80
.L79:
        lea     rax, .LC9[rip]
.L80:
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, rax
        call    fprintf
.L81:
        nop
        add     rsp, 48
        pop     rbp
        ret
indention_tac:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR -8[rbp], 0
        jmp     .L83
.L84:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L83:
        mov     rax, QWORD PTR 24[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L84
        nop
        nop
        add     rsp, 48
        pop     rbp
        ret
create_parser:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 9[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 11[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC10:
        .ascii "\0"
.LC11:
        .ascii "%s.tc\0"
.LC12:
        .ascii "D:/TC/std/\0"
.LC13:
        .ascii "r\0"
.LC14:
        .ascii "Error opening library file for import: %s\12\0"
.LC15:
        .ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC16:
        .ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC17:
        .ascii "Error parsing library file for import: %s\12\0"
.LC18:
        .ascii "Error: Imported symbol '%s' was not found in %s\12\0"
parse_import_file:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 96
        lea     rbp, 96[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     QWORD PTR 56[rbp], r9
        mov     QWORD PTR -16[rbp], 0
        cmp     QWORD PTR 40[rbp], 0
        jne     .L88
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    strlen
        add     rax, 4
        mov     rdx, rax
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR -24[rbp], rax
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r8, rdx
        lea     rdx, .LC11[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -24[rbp]
        lea     rdx, .LC12[rip]
        mov     rcx, rax
        call    absolute_path
        mov     QWORD PTR -8[rbp], rax
        jmp     .L89
.L88:
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    get_file_dir
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    absolute_path
        mov     QWORD PTR -8[rbp], rax
.L89:
        mov     rax, QWORD PTR -8[rbp]
        lea     rdx, .LC13[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L90
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC14[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L95
.L90:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC15[rip]
        mov     rdx, rax
        call    fprintf
        mov     QWORD PTR -56[rbp], 0
        lea     rdx, -56[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    read_source
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    fclose
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_file
        mov     rcx, rax
        call    create_parser
        mov     rsi, rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rbx, QWORD PTR [rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_lexer
        mov     r8, rsi
        mov     rdx, rbx
        mov     rcx, rax
        call    parse_code
        mov     QWORD PTR -48[rbp], rax
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC16[rip]
        mov     rdx, rax
        call    fprintf
        cmp     QWORD PTR -48[rbp], 0
        jne     .L92
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC17[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L95
.L92:
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L93
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L94
.L93:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     r9, rdx
        mov     r8, rax
        lea     rax, .LC18[rip]
        mov     rdx, rax
        call    fprintf
.L94:
        mov     rax, QWORD PTR -16[rbp]
.L95:
        add     rsp, 96
        pop     rbx
        pop     rsi
        pop     rbp
        ret
.LC19:
        .ascii "%s.%s\0"
make_method_name:
        push    rbp
        push    rbx
        sub     rsp, 56
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    strlen
        add     rax, rbx
        add     rax, 2
        mov     rdx, rax
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR -8[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC19[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret
string_to_operator:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR .refptr.ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L99
        mov     eax, 13
        jmp     .L100
.L99:
        mov     rax, QWORD PTR .refptr.ADD_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L101
        mov     eax, 14
        jmp     .L100
.L101:
        mov     rax, QWORD PTR .refptr.SUB_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L102
        mov     eax, 15
        jmp     .L100
.L102:
        mov     rax, QWORD PTR .refptr.MUL_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L103
        mov     eax, 16
        jmp     .L100
.L103:
        mov     rax, QWORD PTR .refptr.DIV_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L104
        mov     eax, 17
        jmp     .L100
.L104:
        mov     rax, QWORD PTR .refptr.MOD_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L105
        mov     eax, 18
        jmp     .L100
.L105:
        mov     rax, QWORD PTR .refptr.AND_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L106
        mov     eax, 11
        jmp     .L100
.L106:
        mov     rax, QWORD PTR .refptr.OR_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L107
        mov     eax, 12
        jmp     .L100
.L107:
        mov     rax, QWORD PTR .refptr.EQ_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L108
        mov     eax, 5
        jmp     .L100
.L108:
        mov     rax, QWORD PTR .refptr.NE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L109
        mov     eax, 6
        jmp     .L100
.L109:
        mov     rax, QWORD PTR .refptr.LT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L110
        mov     eax, 7
        jmp     .L100
.L110:
        mov     rax, QWORD PTR .refptr.GT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L111
        mov     eax, 8
        jmp     .L100
.L111:
        mov     rax, QWORD PTR .refptr.LE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L112
        mov     eax, 9
        jmp     .L100
.L112:
        mov     rax, QWORD PTR .refptr.GE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L113
        mov     eax, 10
        jmp     .L100
.L113:
        mov     rax, QWORD PTR .refptr.ADD_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L114
        mov     eax, 0
        jmp     .L100
.L114:
        mov     rax, QWORD PTR .refptr.SUB_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L115
        mov     eax, 1
        jmp     .L100
.L115:
        mov     rax, QWORD PTR .refptr.MUL_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L116
        mov     eax, 2
        jmp     .L100
.L116:
        mov     rax, QWORD PTR .refptr.DIV_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L117
        mov     eax, 3
        jmp     .L100
.L117:
        mov     rax, QWORD PTR .refptr.MOD_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L118
        mov     eax, 4
        jmp     .L100
.L118:
        mov     eax, 19
.L100:
        add     rsp, 32
        pop     rbp
        ret
operator_precedence:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L120
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L122[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L122[rip]
        add     rax, rdx
        jmp     rax
.L122:
        .long   .L126-.L122
        .long   .L126-.L122
        .long   .L125-.L122
        .long   .L125-.L122
        .long   .L125-.L122
        .long   .L124-.L122
        .long   .L124-.L122
        .long   .L124-.L122
        .long   .L124-.L122
        .long   .L124-.L122
        .long   .L124-.L122
        .long   .L123-.L122
        .long   .L123-.L122
        .long   .L121-.L122
        .long   .L121-.L122
        .long   .L121-.L122
        .long   .L121-.L122
        .long   .L121-.L122
        .long   .L121-.L122
.L121:
        mov     eax, 1
        jmp     .L127
.L123:
        mov     eax, 2
        jmp     .L127
.L124:
        mov     eax, 3
        jmp     .L127
.L126:
        mov     eax, 4
        jmp     .L127
.L125:
        mov     eax, 5
        jmp     .L127
.L120:
        mov     eax, 0
.L127:
        pop     rbp
        ret
operator_to_string:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L129
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L131[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L131[rip]
        add     rax, rdx
        jmp     rax
.L131:
        .long   .L149-.L131
        .long   .L148-.L131
        .long   .L147-.L131
        .long   .L146-.L131
        .long   .L145-.L131
        .long   .L144-.L131
        .long   .L143-.L131
        .long   .L142-.L131
        .long   .L141-.L131
        .long   .L140-.L131
        .long   .L139-.L131
        .long   .L138-.L131
        .long   .L137-.L131
        .long   .L136-.L131
        .long   .L135-.L131
        .long   .L134-.L131
        .long   .L133-.L131
        .long   .L132-.L131
        .long   .L130-.L131
.L136:
        mov     rax, QWORD PTR .refptr.ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L135:
        mov     rax, QWORD PTR .refptr.ADD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L134:
        mov     rax, QWORD PTR .refptr.SUB_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L133:
        mov     rax, QWORD PTR .refptr.MUL_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L132:
        mov     rax, QWORD PTR .refptr.DIV_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L130:
        mov     rax, QWORD PTR .refptr.MOD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L138:
        mov     rax, QWORD PTR .refptr.AND_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L137:
        mov     rax, QWORD PTR .refptr.OR_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L144:
        mov     rax, QWORD PTR .refptr.EQ_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L143:
        mov     rax, QWORD PTR .refptr.NE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L142:
        mov     rax, QWORD PTR .refptr.LT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L141:
        mov     rax, QWORD PTR .refptr.GT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L140:
        mov     rax, QWORD PTR .refptr.LE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L139:
        mov     rax, QWORD PTR .refptr.GE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L149:
        mov     rax, QWORD PTR .refptr.ADD_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L148:
        mov     rax, QWORD PTR .refptr.SUB_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L147:
        mov     rax, QWORD PTR .refptr.MUL_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L146:
        mov     rax, QWORD PTR .refptr.DIV_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L145:
        mov     rax, QWORD PTR .refptr.MOD_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L150
.L129:
        mov     eax, 0
.L150:
        pop     rbp
        ret
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
.refptr.GE_SYMBOL:
        .quad   GE_SYMBOL
.refptr.LE_SYMBOL:
        .quad   LE_SYMBOL
.refptr.GT_SYMBOL:
        .quad   GT_SYMBOL
.refptr.LT_SYMBOL:
        .quad   LT_SYMBOL
.refptr.NE_SYMBOL:
        .quad   NE_SYMBOL
.refptr.EQ_SYMBOL:
        .quad   EQ_SYMBOL
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
.refptr.ASSIGN_SYMBOL:
        .quad   ASSIGN_SYMBOL
.refptr.builtin_scope:
        .quad   builtin_scope
.refptr.VOID_KEYWORD:
        .quad   VOID_KEYWORD
.refptr.BOOL_KEYWORD:
        .quad   BOOL_KEYWORD
.refptr.STRING_KEYWORD:
        .quad   STRING_KEYWORD
.refptr.FLOAT_KEYWORD:
        .quad   FLOAT_KEYWORD
.refptr.INT_KEYWORD:
        .quad   INT_KEYWORD

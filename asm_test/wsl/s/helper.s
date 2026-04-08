create_list:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_node:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string "Error: list_append received NULL list\n"
list_append:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        cmp     QWORD PTR [rbp-24], 0
        jne     .L6
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 38
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC0
        call    fwrite
        jmp     .L5
.L6:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    create_node
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L8
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L5
.L8:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
.L5:
        leave
        ret
list_copy:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        cmp     QWORD PTR [rbp-24], 0
        jne     .L10
        mov     eax, 0
        jmp     .L11
.L10:
        call    create_list
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
.L11:
        leave
        ret
list_pop:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        cmp     QWORD PTR [rbp-24], 0
        je      .L13
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L14
.L13:
        mov     eax, 0
        jmp     .L15
.L14:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L16
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], 0
.L16:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
.L15:
        pop     rbp
        ret
list_pop_back:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-40], rdi
        cmp     QWORD PTR [rbp-40], 0
        je      .L18
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L19
.L18:
        mov     eax, 0
        jmp     .L20
.L19:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        cmp     rdx, rax
        jne     .L21
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L20
.L21:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L22
.L23:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
.L22:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        cmp     rdx, rax
        jne     .L23
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
.L20:
        pop     rbp
        ret
list_is_empty:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        cmp     QWORD PTR [rbp-8], 0
        je      .L25
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L25
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
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
        .string "[Warning] Creating symbol with unknown SymbolType: %u\n"
.LC2:
        .string "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n"
.LC3:
        .string "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n"
.LC4:
        .string "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n"
create_symbol:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     DWORD PTR [rbp-44], esi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     QWORD PTR [rbp-8], 0
        cmp     DWORD PTR [rbp-44], 6
        ja      .L30
        cmp     DWORD PTR [rbp-44], 3
        jnb     .L31
        cmp     DWORD PTR [rbp-44], 2
        je      .L32
        cmp     DWORD PTR [rbp-44], 2
        ja      .L30
        cmp     DWORD PTR [rbp-44], 0
        je      .L33
        cmp     DWORD PTR [rbp-44], 1
        je      .L34
        jmp     .L30
.L33:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L35
.L34:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+32]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L35
.L32:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+32]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L35
.L31:
        mov     rax, QWORD PTR [rbp-64]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L35
.L30:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-44]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L35:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        je      .L36
        mov     rax, QWORD PTR id_counter.0[rip]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-16]
        mov     ecx, DWORD PTR [rax+32]
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-40]
        mov     r9, rdi
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L36:
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR id_counter.0[rip]
        add     rax, 1
        mov     QWORD PTR id_counter.0[rip], rax
        mov     rdx, QWORD PTR id_counter.0[rip]
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     edx, DWORD PTR [rbp-44]
        mov     DWORD PTR [rax+32], edx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax], rdx
        cmp     DWORD PTR [rbp-44], 6
        ja      .L37
        cmp     DWORD PTR [rbp-44], 3
        jnb     .L38
        cmp     DWORD PTR [rbp-44], 2
        je      .L39
        cmp     DWORD PTR [rbp-44], 2
        ja      .L37
        cmp     DWORD PTR [rbp-44], 0
        je      .L40
        cmp     DWORD PTR [rbp-44], 1
        je      .L41
        jmp     .L37
.L40:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax+24], rdx
        jmp     .L42
.L41:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax+24], rdx
        jmp     .L42
.L39:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax+24], rdx
        jmp     .L42
.L38:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax+24], rdx
        jmp     .L42
.L37:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-44]
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L42:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L43
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rax+16]
        mov     rax, QWORD PTR stderr[rip]
        mov     ecx, DWORD PTR [rbp-44]
        mov     rdx, QWORD PTR [rbp-40]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L44
.L43:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L44:
        mov     rax, QWORD PTR [rbp-24]
        leave
        ret
create_symbol_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+8], rax
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
search_name_use_strcmp:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        jmp     .L49
.L54:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L50
.L53:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L51
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L52
.L51:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
.L50:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L53
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-40], rax
.L49:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L54
        mov     eax, 0
.L52:
        leave
        ret
search_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        jmp     .L56
.L61:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L57
.L60:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L58
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L59
.L58:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
.L57:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L60
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-40], rax
.L56:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L61
        mov     eax, 0
.L59:
        leave
        ret
is_builtin_type:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rdx, QWORD PTR INT_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rdx, QWORD PTR FLOAT_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rdx, QWORD PTR STRING_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rdx, QWORD PTR BOOL_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L63
        mov     rdx, QWORD PTR VOID_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L64
.L63:
        mov     eax, 1
        jmp     .L65
.L64:
        mov     eax, 0
.L65:
        leave
        ret
.LC5:
        .string "[Parser Error] at %s:%zu:%zu: %s\n"
parser_error:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+16]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR stderr[rip]
        mov     rsi, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     r9, rsi
        mov     r8, rdi
        mov     esi, OFFSET FLAT:.LC5
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
set_bool_list:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     eax, edx
        mov     BYTE PTR [rbp-36], al
        mov     rax, QWORD PTR [rbp-32]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-1], al
        cmp     BYTE PTR [rbp-36], 0
        je      .L69
        mov     rax, QWORD PTR [rbp-32]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        or      al, BYTE PTR [rbp-1]
        jmp     .L70
.L69:
        mov     rax, QWORD PTR [rbp-32]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        not     eax
        and     al, BYTE PTR [rbp-1]
.L70:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rcx, rdx
        shr     rcx, 3
        mov     rdx, QWORD PTR [rbp-24]
        add     rdx, rcx
        mov     BYTE PTR [rdx], al
        nop
        pop     rbp
        ret
get_bool_list:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-16]
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
        .string "\342\224\202   "
.LC7:
        .string "    "
.LC8:
        .string "\342\224\224\342\224\200\342\224\200 "
.LC9:
        .string "\342\224\234\342\224\200\342\224\200 "
indention:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     eax, edx
        mov     QWORD PTR [rbp-48], rcx
        mov     BYTE PTR [rbp-36], al
        cmp     BYTE PTR [rbp-36], 0
        sete    al
        movzx   edx, al
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rcx
        mov     rdi, rax
        call    set_bool_list
        mov     QWORD PTR [rbp-8], 1
        jmp     .L74
.L77:
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    get_bool_list
        test    al, al
        je      .L75
        mov     edx, OFFSET FLAT:.LC6
        jmp     .L76
.L75:
        mov     edx, OFFSET FLAT:.LC7
.L76:
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        add     QWORD PTR [rbp-8], 1
.L74:
        mov     rax, QWORD PTR [rbp-8]
        cmp     rax, QWORD PTR [rbp-32]
        jb      .L77
        cmp     QWORD PTR [rbp-32], 0
        je      .L81
        cmp     BYTE PTR [rbp-36], 0
        je      .L79
        mov     edx, OFFSET FLAT:.LC8
        jmp     .L80
.L79:
        mov     edx, OFFSET FLAT:.LC9
.L80:
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L81:
        nop
        leave
        ret
indention_tac:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-8], 0
        jmp     .L83
.L84:
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, 32
        call    putc
        add     QWORD PTR [rbp-8], 1
.L83:
        mov     rax, QWORD PTR [rbp-32]
        sal     rax, 2
        cmp     QWORD PTR [rbp-8], rax
        jb      .L84
        nop
        nop
        leave
        ret
create_parser:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     BYTE PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     BYTE PTR [rax+9], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     BYTE PTR [rax+11], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC10:
        .string ""
.LC11:
        .string "%s.tc"
.LC12:
        .string "/home/su2u4/code/TC/std/"
.LC13:
        .string "r"
.LC14:
        .string "Error opening library file for import: %s\n"
.LC15:
        .string "Info: Starting parsing lib file for import: %s\n"
.LC16:
        .string "Info: Finished parsing lib file for import: %s\n"
.LC17:
        .string "Error parsing library file for import: %s\n"
.LC18:
        .string "Error: Imported symbol '%s' was not found in %s\n"
parse_import_file:
        push    rbp
        mov     rbp, rsp
        push    r12
        push    rbx
        sub     rsp, 96
        mov     QWORD PTR [rbp-88], rdi
        mov     QWORD PTR [rbp-96], rsi
        mov     QWORD PTR [rbp-104], rdx
        mov     QWORD PTR [rbp-112], rcx
        mov     QWORD PTR [rbp-32], 0
        cmp     QWORD PTR [rbp-96], 0
        jne     .L88
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    strlen
        add     rax, 4
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC10
        call    create_string_not_check
        mov     QWORD PTR [rbp-40], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC11
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC12
        mov     rdi, rax
        call    absolute_path
        mov     QWORD PTR [rbp-24], rax
        jmp     .L89
.L88:
        mov     rax, QWORD PTR [rbp-112]
        mov     rdi, rax
        call    get_file_dir
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    absolute_path
        mov     QWORD PTR [rbp-24], rax
.L89:
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC13
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L90
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC14
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L95
.L90:
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC15
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     QWORD PTR [rbp-72], 0
        lea     rdx, [rbp-72]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    read_source
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    fclose
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    create_file
        mov     rdi, rax
        call    create_parser
        mov     r12, rax
        mov     rbx, QWORD PTR builtin_scope[rip]
        mov     rcx, QWORD PTR [rbp-72]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    create_lexer
        mov     rdx, r12
        mov     rsi, rbx
        mov     rdi, rax
        call    parse_code
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        cmp     QWORD PTR [rbp-64], 0
        jne     .L92
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC17
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L95
.L92:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name_use_strcmp
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        je      .L93
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L94
.L93:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-88]
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L94:
        mov     rax, QWORD PTR [rbp-32]
.L95:
        add     rsp, 96
        pop     rbx
        pop     r12
        pop     rbp
        ret
.LC19:
        .string "%s.%s"
make_method_name:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        add     rax, rbx
        add     rax, 2
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC10
        call    create_string
        mov     QWORD PTR [rbp-24], rax
        mov     rcx, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC19
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     rax, QWORD PTR [rbp-24]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
string_to_operator:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rdx, QWORD PTR ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L99
        mov     eax, 13
        jmp     .L100
.L99:
        mov     rdx, QWORD PTR ADD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L101
        mov     eax, 14
        jmp     .L100
.L101:
        mov     rdx, QWORD PTR SUB_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L102
        mov     eax, 15
        jmp     .L100
.L102:
        mov     rdx, QWORD PTR MUL_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L103
        mov     eax, 16
        jmp     .L100
.L103:
        mov     rdx, QWORD PTR DIV_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L104
        mov     eax, 17
        jmp     .L100
.L104:
        mov     rdx, QWORD PTR MOD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L105
        mov     eax, 18
        jmp     .L100
.L105:
        mov     rdx, QWORD PTR AND_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L106
        mov     eax, 11
        jmp     .L100
.L106:
        mov     rdx, QWORD PTR OR_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L107
        mov     eax, 12
        jmp     .L100
.L107:
        mov     rdx, QWORD PTR EQ_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L108
        mov     eax, 5
        jmp     .L100
.L108:
        mov     rdx, QWORD PTR NE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L109
        mov     eax, 6
        jmp     .L100
.L109:
        mov     rdx, QWORD PTR LT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L110
        mov     eax, 7
        jmp     .L100
.L110:
        mov     rdx, QWORD PTR GT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L111
        mov     eax, 8
        jmp     .L100
.L111:
        mov     rdx, QWORD PTR LE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L112
        mov     eax, 9
        jmp     .L100
.L112:
        mov     rdx, QWORD PTR GE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L113
        mov     eax, 10
        jmp     .L100
.L113:
        mov     rdx, QWORD PTR ADD_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L114
        mov     eax, 0
        jmp     .L100
.L114:
        mov     rdx, QWORD PTR SUB_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L115
        mov     eax, 1
        jmp     .L100
.L115:
        mov     rdx, QWORD PTR MUL_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L116
        mov     eax, 2
        jmp     .L100
.L116:
        mov     rdx, QWORD PTR DIV_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L117
        mov     eax, 3
        jmp     .L100
.L117:
        mov     rdx, QWORD PTR MOD_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L118
        mov     eax, 4
        jmp     .L100
.L118:
        mov     eax, 19
.L100:
        leave
        ret
operator_precedence:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi
        cmp     DWORD PTR [rbp-4], 18
        ja      .L120
        mov     eax, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR .L122[0+rax*8]
        jmp     rax
.L122:
        .quad   .L126
        .quad   .L126
        .quad   .L125
        .quad   .L125
        .quad   .L125
        .quad   .L124
        .quad   .L124
        .quad   .L124
        .quad   .L124
        .quad   .L124
        .quad   .L124
        .quad   .L123
        .quad   .L123
        .quad   .L121
        .quad   .L121
        .quad   .L121
        .quad   .L121
        .quad   .L121
        .quad   .L121
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
        mov     DWORD PTR [rbp-4], edi
        cmp     DWORD PTR [rbp-4], 18
        ja      .L129
        mov     eax, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR .L131[0+rax*8]
        jmp     rax
.L131:
        .quad   .L149
        .quad   .L148
        .quad   .L147
        .quad   .L146
        .quad   .L145
        .quad   .L144
        .quad   .L143
        .quad   .L142
        .quad   .L141
        .quad   .L140
        .quad   .L139
        .quad   .L138
        .quad   .L137
        .quad   .L136
        .quad   .L135
        .quad   .L134
        .quad   .L133
        .quad   .L132
        .quad   .L130
.L136:
        mov     rax, QWORD PTR ASSIGN_SYMBOL[rip]
        jmp     .L150
.L135:
        mov     rax, QWORD PTR ADD_ASSIGN_SYMBOL[rip]
        jmp     .L150
.L134:
        mov     rax, QWORD PTR SUB_ASSIGN_SYMBOL[rip]
        jmp     .L150
.L133:
        mov     rax, QWORD PTR MUL_ASSIGN_SYMBOL[rip]
        jmp     .L150
.L132:
        mov     rax, QWORD PTR DIV_ASSIGN_SYMBOL[rip]
        jmp     .L150
.L130:
        mov     rax, QWORD PTR MOD_ASSIGN_SYMBOL[rip]
        jmp     .L150
.L138:
        mov     rax, QWORD PTR AND_SYMBOL[rip]
        jmp     .L150
.L137:
        mov     rax, QWORD PTR OR_SYMBOL[rip]
        jmp     .L150
.L144:
        mov     rax, QWORD PTR EQ_SYMBOL[rip]
        jmp     .L150
.L143:
        mov     rax, QWORD PTR NE_SYMBOL[rip]
        jmp     .L150
.L142:
        mov     rax, QWORD PTR LT_SYMBOL[rip]
        jmp     .L150
.L141:
        mov     rax, QWORD PTR GT_SYMBOL[rip]
        jmp     .L150
.L140:
        mov     rax, QWORD PTR LE_SYMBOL[rip]
        jmp     .L150
.L139:
        mov     rax, QWORD PTR GE_SYMBOL[rip]
        jmp     .L150
.L149:
        mov     rax, QWORD PTR ADD_SYMBOL[rip]
        jmp     .L150
.L148:
        mov     rax, QWORD PTR SUB_SYMBOL[rip]
        jmp     .L150
.L147:
        mov     rax, QWORD PTR MUL_SYMBOL[rip]
        jmp     .L150
.L146:
        mov     rax, QWORD PTR DIV_SYMBOL[rip]
        jmp     .L150
.L145:
        mov     rax, QWORD PTR MOD_SYMBOL[rip]
        jmp     .L150
.L129:
        mov     eax, 0
.L150:
        pop     rbp
        ret

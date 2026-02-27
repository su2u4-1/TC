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
list_append:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    create_node
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L6
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L8
.L6:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
.L8:
        nop
        leave
        ret
list_copy:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
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
        leave
        ret
list_pop:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L12
        mov     eax, 0
        jmp     .L13
.L12:
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
        jne     .L14
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], 0
.L14:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
.L13:
        pop     rbp
        ret
.LC0:
        .string "Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
.LC1:
        .string "type\n"
.LC2:
        .string "variable\n"
.LC3:
        .string "function\n"
.LC4:
        .string "method\n"
.LC5:
        .string "class\n"
.LC6:
        .string "attribute\n"
.LC7:
        .string "unknown\n"
.LC8:
        .string "Error creating name: name_info and scope_info are both NULL for kind %d\n"
.LC9:
        .string "Error creating name: unknown NameType %d\n"
create_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     QWORD PTR [rbp-56], r8
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    search
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        je      .L16
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        ja      .L17
        mov     eax, eax
        mov     rax, QWORD PTR .L19[0+rax*8]
        jmp     rax
.L19:
        .quad   .L24
        .quad   .L23
        .quad   .L22
        .quad   .L21
        .quad   .L20
        .quad   .L18
.L24:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC1
        call    fwrite
        jmp     .L16
.L23:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC2
        call    fwrite
        jmp     .L16
.L22:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC3
        call    fwrite
        jmp     .L16
.L21:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        jmp     .L16
.L20:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC5
        call    fwrite
        jmp     .L16
.L18:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC6
        call    fwrite
        jmp     .L16
.L17:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 8
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        nop
.L16:
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR id_counter.0[rip]
        add     rax, 1
        mov     QWORD PTR id_counter.0[rip], rax
        mov     rdx, QWORD PTR id_counter.0[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rbp-28]
        mov     DWORD PTR [rax+24], edx
        cmp     DWORD PTR [rbp-28], 1
        je      .L25
        cmp     DWORD PTR [rbp-28], 5
        je      .L25
        cmp     DWORD PTR [rbp-28], 2
        je      .L25
        cmp     DWORD PTR [rbp-28], 3
        jne     .L26
.L25:
        cmp     QWORD PTR [rbp-40], 0
        je      .L26
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        jmp     .L27
.L26:
        cmp     DWORD PTR [rbp-28], 4
        jne     .L28
        cmp     QWORD PTR [rbp-48], 0
        je      .L28
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        jmp     .L27
.L28:
        cmp     DWORD PTR [rbp-28], 0
        jne     .L29
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+16], 0
        jmp     .L27
.L29:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L30
        cmp     QWORD PTR [rbp-48], 0
        jne     .L30
        cmp     DWORD PTR [rbp-28], 0
        je      .L30
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-28]
        mov     esi, OFFSET FLAT:.LC8
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L31
.L30:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-28]
        mov     esi, OFFSET FLAT:.LC9
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L31:
        mov     eax, 0
        jmp     .L32
.L27:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-16]
.L32:
        leave
        ret
create_scope:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        call    create_list
        mov     rdx, QWORD PTR [rbp-16]
        mov     QWORD PTR [rdx+8], rax
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
search:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L36
.L41:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L37
.L40:
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L38
        mov     rax, QWORD PTR [rbp-40]
        jmp     .L39
.L38:
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
.L37:
        cmp     QWORD PTR [rbp-16], 0
        jne     .L40
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
.L36:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L41
        mov     eax, 0
.L39:
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
        jne     .L43
        mov     rdx, QWORD PTR FLOAT_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L43
        mov     rdx, QWORD PTR STRING_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L43
        mov     rdx, QWORD PTR BOOL_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        jne     .L43
        mov     rdx, QWORD PTR VOID_KEYWORD[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L44
.L43:
        mov     eax, 1
        jmp     .L45
.L44:
        mov     eax, 0
.L45:
        leave
        ret
is_type:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        je      .L48
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        jne     .L49
.L48:
        mov     eax, 1
        jmp     .L50
.L49:
        mov     eax, 0
.L50:
        pop     rbp
        ret
.LC10:
        .string "Parser Error at line %zu, column %zu: %s\n"
parser_error:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR stderr[rip]
        mov     rsi, QWORD PTR [rbp-8]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC10
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
        je      .L54
        mov     rax, QWORD PTR [rbp-32]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        mov     ecx, eax
        mov     rax, QWORD PTR [rbp-32]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        add     rdx, rax
        mov     eax, ecx
        or      al, BYTE PTR [rbp-1]
        mov     BYTE PTR [rdx], al
        jmp     .L56
.L54:
        mov     rax, QWORD PTR [rbp-32]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        not     eax
        mov     rdx, QWORD PTR [rbp-32]
        mov     rcx, rdx
        shr     rcx, 3
        mov     rdx, QWORD PTR [rbp-24]
        add     rdx, rcx
        and     al, BYTE PTR [rbp-1]
        mov     BYTE PTR [rdx], al
.L56:
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
.LC11:
        .string "\342\224\202   "
.LC12:
        .string "    "
.LC13:
        .string "\342\224\224\342\224\200\342\224\200 "
.LC14:
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
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-16], rax
        cmp     BYTE PTR [rbp-36], 0
        sete    al
        movzx   edx, al
        mov     rax, QWORD PTR [rbp-16]
        lea     rcx, [rax+3]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     rdi, rcx
        call    set_bool_list
        mov     QWORD PTR [rbp-8], 1
        jmp     .L60
.L63:
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax+3]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     rdi, rdx
        call    get_bool_list
        test    al, al
        je      .L61
        mov     edx, OFFSET FLAT:.LC11
        jmp     .L62
.L61:
        mov     edx, OFFSET FLAT:.LC12
.L62:
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        add     QWORD PTR [rbp-8], 1
.L60:
        mov     rax, QWORD PTR [rbp-8]
        cmp     rax, QWORD PTR [rbp-32]
        jb      .L63
        cmp     QWORD PTR [rbp-32], 0
        je      .L67
        cmp     BYTE PTR [rbp-36], 0
        je      .L65
        mov     edx, OFFSET FLAT:.LC13
        jmp     .L66
.L65:
        mov     edx, OFFSET FLAT:.LC14
.L66:
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L67:
        nop
        leave
        ret
create_parser:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     edi, 35
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     BYTE PTR [rax+1], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     BYTE PTR [rax+2], 0
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC15:
        .string "print"
.LC16:
        .string "arr"
.LC17:
        .string "Error: Standard library file for import not found: %s\n"
.LC18:
        .string "/"
.LC19:
        .string ".tc"
.LC20:
        .string "r"
.LC21:
        .string "Error opening library file for import: %s\n"
.LC22:
        .string "Info: Starting parsing lib file for import: %s\n"
.LC23:
        .string "Info: Finished parsing lib file for import: %s\n"
.LC24:
        .string "Error parsing library file for import: %s\n"
parse_import_file:
        push    rbp
        mov     rbp, rsp
        push    r12
        push    rbx
        sub     rsp, 1152
        mov     QWORD PTR [rbp-1144], rdi
        mov     QWORD PTR [rbp-1152], rsi
        mov     QWORD PTR [rbp-1160], rdx
        mov     QWORD PTR [rbp-24], 0
        mov     BYTE PTR [rbp-1120], 0
        cmp     QWORD PTR [rbp-1152], 0
        jne     .L71
        mov     rax, QWORD PTR [rbp-1144]
        mov     esi, OFFSET FLAT:.LC15
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L72
        lea     rax, [rbp-1120]
        movabs  rbx, 8246143026212319022
        mov     QWORD PTR [rax], rbx
        movabs  rbx, 27993765565065586
        mov     QWORD PTR [rax+7], rbx
        jmp     .L73
.L72:
        mov     rax, QWORD PTR [rbp-1144]
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L74
        lea     rax, [rbp-1120]
        movabs  rbx, 8241920901561659182
        mov     QWORD PTR [rax], rbx
        movabs  rcx, 27993765531771183
        mov     QWORD PTR [rax+5], rcx
        jmp     .L73
.L74:
        mov     rax, QWORD PTR stderr[rip]
        lea     rdx, [rbp-1120]
        mov     esi, OFFSET FLAT:.LC17
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L83
.L71:
        mov     rcx, QWORD PTR [rbp-1152]
        lea     rdx, [rbp-1120]
        lea     rax, [rbp-1120]
        mov     esi, 1024
        mov     rdi, rax
        call    string_append
        lea     rdx, [rbp-1120]
        lea     rax, [rbp-1120]
        mov     ecx, OFFSET FLAT:.LC18
        mov     esi, 1024
        mov     rdi, rax
        call    string_append
        mov     rcx, QWORD PTR [rbp-1144]
        lea     rdx, [rbp-1120]
        lea     rax, [rbp-1120]
        mov     esi, 1024
        mov     rdi, rax
        call    string_append
        lea     rdx, [rbp-1120]
        lea     rax, [rbp-1120]
        mov     ecx, OFFSET FLAT:.LC19
        mov     esi, 1024
        mov     rdi, rax
        call    string_append
.L73:
        lea     rax, [rbp-1120]
        mov     esi, OFFSET FLAT:.LC20
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L76
        mov     rax, QWORD PTR stderr[rip]
        lea     rdx, [rbp-1120]
        mov     esi, OFFSET FLAT:.LC21
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L83
.L76:
        lea     rax, [rbp-1120]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC22
        mov     eax, 0
        call    printf
        mov     QWORD PTR [rbp-1128], 0
        lea     rdx, [rbp-1128]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    read_source
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    fclose
        call    create_parser
        mov     r12, rax
        mov     rbx, QWORD PTR builtin_scope[rip]
        mov     rdx, QWORD PTR [rbp-1128]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_lexer
        mov     rdx, r12
        mov     rsi, rbx
        mov     rdi, rax
        call    parse_code
        mov     QWORD PTR [rbp-56], rax
        lea     rax, [rbp-1120]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC23
        mov     eax, 0
        call    printf
        cmp     QWORD PTR [rbp-56], 0
        jne     .L77
        mov     rax, QWORD PTR stderr[rip]
        lea     rdx, [rbp-1120]
        mov     esi, OFFSET FLAT:.LC24
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L83
.L77:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-32], rax
        jmp     .L78
.L81:
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-80], rax
        mov     rax, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-1144]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L79
        mov     rax, QWORD PTR [rbp-80]
        mov     QWORD PTR [rbp-24], rax
        jmp     .L80
.L79:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-32], rax
.L78:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L81
.L80:
        cmp     QWORD PTR [rbp-24], 0
        je      .L82
        mov     rax, QWORD PTR [rbp-1160]
        mov     QWORD PTR [rbp-88], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L82:
        mov     rax, QWORD PTR [rbp-24]
.L83:
        add     rsp, 1152
        pop     rbx
        pop     r12
        pop     rbp
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
        je      .L85
        mov     eax, 13
        jmp     .L86
.L85:
        mov     rdx, QWORD PTR ADD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L87
        mov     eax, 14
        jmp     .L86
.L87:
        mov     rdx, QWORD PTR SUB_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L88
        mov     eax, 15
        jmp     .L86
.L88:
        mov     rdx, QWORD PTR MUL_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L89
        mov     eax, 16
        jmp     .L86
.L89:
        mov     rdx, QWORD PTR DIV_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L90
        mov     eax, 17
        jmp     .L86
.L90:
        mov     rdx, QWORD PTR MOD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L91
        mov     eax, 18
        jmp     .L86
.L91:
        mov     rdx, QWORD PTR AND_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L92
        mov     eax, 11
        jmp     .L86
.L92:
        mov     rdx, QWORD PTR OR_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L93
        mov     eax, 12
        jmp     .L86
.L93:
        mov     rdx, QWORD PTR EQ_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L94
        mov     eax, 5
        jmp     .L86
.L94:
        mov     rdx, QWORD PTR NE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L95
        mov     eax, 6
        jmp     .L86
.L95:
        mov     rdx, QWORD PTR LT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L96
        mov     eax, 7
        jmp     .L86
.L96:
        mov     rdx, QWORD PTR GT_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L97
        mov     eax, 8
        jmp     .L86
.L97:
        mov     rdx, QWORD PTR LE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L98
        mov     eax, 9
        jmp     .L86
.L98:
        mov     rdx, QWORD PTR GE_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L99
        mov     eax, 10
        jmp     .L86
.L99:
        mov     rdx, QWORD PTR ADD_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L100
        mov     eax, 0
        jmp     .L86
.L100:
        mov     rdx, QWORD PTR SUB_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L101
        mov     eax, 1
        jmp     .L86
.L101:
        mov     rdx, QWORD PTR MUL_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L102
        mov     eax, 2
        jmp     .L86
.L102:
        mov     rdx, QWORD PTR DIV_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L103
        mov     eax, 3
        jmp     .L86
.L103:
        mov     rdx, QWORD PTR MOD_SYMBOL[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L104
        mov     eax, 4
        jmp     .L86
.L104:
        mov     eax, 19
.L86:
        leave
        ret
operator_precedence:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi
        cmp     DWORD PTR [rbp-4], 18
        ja      .L106
        mov     eax, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR .L108[0+rax*8]
        jmp     rax
.L108:
        .quad   .L112
        .quad   .L112
        .quad   .L111
        .quad   .L111
        .quad   .L111
        .quad   .L110
        .quad   .L110
        .quad   .L110
        .quad   .L110
        .quad   .L110
        .quad   .L110
        .quad   .L109
        .quad   .L109
        .quad   .L107
        .quad   .L107
        .quad   .L107
        .quad   .L107
        .quad   .L107
        .quad   .L107
.L107:
        mov     eax, 1
        jmp     .L113
.L109:
        mov     eax, 2
        jmp     .L113
.L110:
        mov     eax, 3
        jmp     .L113
.L112:
        mov     eax, 4
        jmp     .L113
.L111:
        mov     eax, 5
        jmp     .L113
.L106:
        mov     eax, 0
.L113:
        pop     rbp
        ret
operator_to_string:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi
        cmp     DWORD PTR [rbp-4], 18
        ja      .L115
        mov     eax, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR .L117[0+rax*8]
        jmp     rax
.L117:
        .quad   .L135
        .quad   .L134
        .quad   .L133
        .quad   .L132
        .quad   .L131
        .quad   .L130
        .quad   .L129
        .quad   .L128
        .quad   .L127
        .quad   .L126
        .quad   .L125
        .quad   .L124
        .quad   .L123
        .quad   .L122
        .quad   .L121
        .quad   .L120
        .quad   .L119
        .quad   .L118
        .quad   .L116
.L122:
        mov     rax, QWORD PTR ASSIGN_SYMBOL[rip]
        jmp     .L136
.L121:
        mov     rax, QWORD PTR ADD_ASSIGN_SYMBOL[rip]
        jmp     .L136
.L120:
        mov     rax, QWORD PTR SUB_ASSIGN_SYMBOL[rip]
        jmp     .L136
.L119:
        mov     rax, QWORD PTR MUL_ASSIGN_SYMBOL[rip]
        jmp     .L136
.L118:
        mov     rax, QWORD PTR DIV_ASSIGN_SYMBOL[rip]
        jmp     .L136
.L116:
        mov     rax, QWORD PTR MOD_ASSIGN_SYMBOL[rip]
        jmp     .L136
.L124:
        mov     rax, QWORD PTR AND_SYMBOL[rip]
        jmp     .L136
.L123:
        mov     rax, QWORD PTR OR_SYMBOL[rip]
        jmp     .L136
.L130:
        mov     rax, QWORD PTR EQ_SYMBOL[rip]
        jmp     .L136
.L129:
        mov     rax, QWORD PTR NE_SYMBOL[rip]
        jmp     .L136
.L128:
        mov     rax, QWORD PTR LT_SYMBOL[rip]
        jmp     .L136
.L127:
        mov     rax, QWORD PTR GT_SYMBOL[rip]
        jmp     .L136
.L126:
        mov     rax, QWORD PTR LE_SYMBOL[rip]
        jmp     .L136
.L125:
        mov     rax, QWORD PTR GE_SYMBOL[rip]
        jmp     .L136
.L135:
        mov     rax, QWORD PTR ADD_SYMBOL[rip]
        jmp     .L136
.L134:
        mov     rax, QWORD PTR SUB_SYMBOL[rip]
        jmp     .L136
.L133:
        mov     rax, QWORD PTR MUL_SYMBOL[rip]
        jmp     .L136
.L132:
        mov     rax, QWORD PTR DIV_SYMBOL[rip]
        jmp     .L136
.L131:
        mov     rax, QWORD PTR MOD_SYMBOL[rip]
        jmp     .L136
.L115:
        mov     eax, 0
.L136:
        pop     rbp
        ret

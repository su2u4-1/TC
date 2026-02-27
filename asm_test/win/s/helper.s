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
list_append:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_node
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L6
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L8
.L6:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
.L8:
        nop
        add     rsp, 48
        pop     rbp
        ret
list_copy:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
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
        add     rsp, 48
        pop     rbp
        ret
list_pop:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L12
        mov     eax, 0
        jmp     .L13
.L12:
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
        jne     .L14
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], 0
.L14:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
.L13:
        add     rsp, 16
        pop     rbp
        ret
.LC0:
        .ascii "Warning: Name '%s' already exists in the current scope, returning existing name, kind: \0"
.LC1:
        .ascii "type\12\0"
.LC2:
        .ascii "variable\12\0"
.LC3:
        .ascii "function\12\0"
.LC4:
        .ascii "method\12\0"
.LC5:
        .ascii "class\12\0"
.LC6:
        .ascii "attribute\12\0"
.LC7:
        .ascii "unknown\12\0"
.LC8:
        .ascii "Error creating name: name_info and scope_info are both NULL for kind %u\12\0"
.LC9:
        .ascii "Error creating name: unknown NameType %u\12\0"
create_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     DWORD PTR 24[rbp], edx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    search
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        je      .L16
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rax
        lea     rax, .LC0[rip]
        mov     rdx, rax
        call    fprintf
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        ja      .L17
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L19[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L19[rip]
        add     rax, rdx
        jmp     rax
.L19:
        .long   .L24-.L19
        .long   .L23-.L19
        .long   .L22-.L19
        .long   .L21-.L19
        .long   .L20-.L19
        .long   .L18-.L19
.L24:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC1[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L16
.L23:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC2[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L16
.L22:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC3[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L16
.L21:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 7
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L16
.L20:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L16
.L18:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC6[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L16
.L17:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 8
        mov     edx, 1
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L16:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR id_counter.0[rip]
        add     rax, 1
        mov     QWORD PTR id_counter.0[rip], rax
        mov     rdx, QWORD PTR id_counter.0[rip]
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 24[rbp]
        mov     DWORD PTR 24[rax], edx
        cmp     DWORD PTR 24[rbp], 1
        je      .L25
        cmp     DWORD PTR 24[rbp], 5
        je      .L25
        cmp     DWORD PTR 24[rbp], 2
        je      .L25
        cmp     DWORD PTR 24[rbp], 3
        jne     .L26
.L25:
        cmp     QWORD PTR 32[rbp], 0
        je      .L26
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        jmp     .L27
.L26:
        cmp     DWORD PTR 24[rbp], 4
        jne     .L28
        cmp     QWORD PTR 40[rbp], 0
        je      .L28
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        jmp     .L27
.L28:
        cmp     DWORD PTR 24[rbp], 0
        jne     .L29
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR 16[rax], 0
        jmp     .L27
.L29:
        cmp     QWORD PTR 32[rbp], 0
        jne     .L30
        cmp     QWORD PTR 40[rbp], 0
        jne     .L30
        cmp     DWORD PTR 24[rbp], 0
        je      .L30
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 24[rbp]
        mov     r8d, eax
        lea     rax, .LC8[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L31
.L30:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 24[rbp]
        mov     r8d, eax
        lea     rax, .LC9[rip]
        mov     rdx, rax
        call    fprintf
.L31:
        mov     eax, 0
        jmp     .L32
.L27:
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -16[rbp]
.L32:
        add     rsp, 48
        pop     rbp
        ret
create_scope:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        call    create_list
        mov     rdx, QWORD PTR -16[rbp]
        mov     QWORD PTR 8[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
search:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L36
.L41:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L37
.L40:
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L38
        mov     rax, QWORD PTR -40[rbp]
        jmp     .L39
.L38:
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
.L37:
        cmp     QWORD PTR -16[rbp], 0
        jne     .L40
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
.L36:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L41
        mov     eax, 0
.L39:
        add     rsp, 80
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
        jne     .L43
        mov     rax, QWORD PTR .refptr.FLOAT_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L43
        mov     rax, QWORD PTR .refptr.STRING_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L43
        mov     rax, QWORD PTR .refptr.BOOL_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        jne     .L43
        mov     rax, QWORD PTR .refptr.VOID_KEYWORD[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L44
.L43:
        mov     eax, 1
        jmp     .L45
.L44:
        mov     eax, 0
.L45:
        add     rsp, 32
        pop     rbp
        ret
is_type:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        je      .L48
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L49
.L48:
        mov     eax, 1
        jmp     .L50
.L49:
        mov     eax, 0
.L50:
        add     rsp, 16
        pop     rbp
        ret
.LC10:
        .ascii "Parser Error at line %zu, column %zu: %s\12\0"
parser_error:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 48
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rsi, 1[rax]
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rbx, 1[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     QWORD PTR 32[rsp], rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC10[rip]
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
        je      .L54
        mov     rax, QWORD PTR 24[rbp]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        mov     ecx, eax
        mov     rax, QWORD PTR 24[rbp]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        add     rdx, rax
        mov     eax, ecx
        or      al, BYTE PTR -1[rbp]
        mov     BYTE PTR [rdx], al
        jmp     .L56
.L54:
        mov     rax, QWORD PTR 24[rbp]
        and     eax, 7
        mov     edx, 1
        mov     ecx, eax
        sal     edx, cl
        mov     eax, edx
        not     eax
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rdx
        shr     rcx, 3
        mov     rdx, QWORD PTR 16[rbp]
        add     rdx, rcx
        and     al, BYTE PTR -1[rbp]
        mov     BYTE PTR [rdx], al
.L56:
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
.LC11:
        .ascii "\342\224\202   \0"
.LC12:
        .ascii "    \0"
.LC13:
        .ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC14:
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
        mov     rax, QWORD PTR 40[rbp]
        mov     QWORD PTR -16[rbp], rax
        cmp     BYTE PTR 32[rbp], 0
        sete    al
        movzx   edx, al
        mov     rax, QWORD PTR -16[rbp]
        lea     rcx, 3[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        mov     rdx, rax
        call    set_bool_list
        mov     QWORD PTR -8[rbp], 1
        jmp     .L60
.L63:
        mov     rax, QWORD PTR -16[rbp]
        lea     rcx, 3[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        call    get_bool_list
        test    al, al
        je      .L61
        lea     rax, .LC11[rip]
        jmp     .L62
.L61:
        lea     rax, .LC12[rip]
.L62:
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, rax
        call    fprintf
        add     QWORD PTR -8[rbp], 1
.L60:
        mov     rax, QWORD PTR -8[rbp]
        cmp     rax, QWORD PTR 24[rbp]
        jb      .L63
        cmp     QWORD PTR 24[rbp], 0
        je      .L67
        cmp     BYTE PTR 32[rbp], 0
        je      .L65
        lea     rax, .LC13[rip]
        jmp     .L66
.L65:
        lea     rax, .LC14[rip]
.L66:
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, rax
        call    fprintf
.L67:
        nop
        add     rsp, 48
        pop     rbp
        ret
create_parser:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     ecx, 35
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     BYTE PTR 1[rax], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     BYTE PTR 2[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC15:
        .ascii "print\0"
.LC16:
        .ascii "arr\0"
.LC17:
        .ascii "Error: Standard library file for import not found: %s\12\0"
.LC18:
        .ascii "/\0"
.LC19:
        .ascii ".tc\0"
.LC20:
        .ascii "r\0"
.LC21:
        .ascii "Error opening library file for import: %s\12\0"
.LC22:
        .ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC23:
        .ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC24:
        .ascii "Error parsing library file for import: %s\12\0"
parse_import_file:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 1152
        lea     rbp, 128[rsp]
        mov     QWORD PTR 1056[rbp], rcx
        mov     QWORD PTR 1064[rbp], rdx
        mov     QWORD PTR 1072[rbp], r8
        mov     QWORD PTR 1016[rbp], 0
        mov     BYTE PTR -80[rbp], 0
        cmp     QWORD PTR 1064[rbp], 0
        jne     .L71
        mov     rax, QWORD PTR 1056[rbp]
        lea     rdx, .LC15[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L72
        lea     rax, -80[rbp]
        movabs  rbx, 8246143026212319022
        mov     QWORD PTR [rax], rbx
        movabs  rsi, 27993765565065586
        mov     QWORD PTR 7[rax], rsi
        jmp     .L73
.L72:
        mov     rax, QWORD PTR 1056[rbp]
        lea     rdx, .LC16[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L74
        lea     rax, -80[rbp]
        movabs  rbx, 8241920901561659182
        mov     QWORD PTR [rax], rbx
        movabs  rsi, 27993765531771183
        mov     QWORD PTR 5[rax], rsi
        jmp     .L73
.L74:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        lea     rax, -80[rbp]
        mov     r8, rax
        lea     rax, .LC17[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L83
.L71:
        mov     rcx, QWORD PTR 1064[rbp]
        lea     rdx, -80[rbp]
        lea     rax, -80[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 1024
        mov     rcx, rax
        call    string_append
        lea     rdx, -80[rbp]
        lea     rax, -80[rbp]
        lea     r9, .LC18[rip]
        mov     r8, rdx
        mov     edx, 1024
        mov     rcx, rax
        call    string_append
        mov     rcx, QWORD PTR 1056[rbp]
        lea     rdx, -80[rbp]
        lea     rax, -80[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 1024
        mov     rcx, rax
        call    string_append
        lea     rdx, -80[rbp]
        lea     rax, -80[rbp]
        lea     r9, .LC19[rip]
        mov     r8, rdx
        mov     edx, 1024
        mov     rcx, rax
        call    string_append
.L73:
        lea     rax, -80[rbp]
        lea     rdx, .LC20[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR 1000[rbp], rax
        cmp     QWORD PTR 1000[rbp], 0
        jne     .L76
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        lea     rax, -80[rbp]
        mov     r8, rax
        lea     rax, .LC21[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L83
.L76:
        lea     rax, -80[rbp]
        mov     rdx, rax
        lea     rax, .LC22[rip]
        mov     rcx, rax
        call    printf
        mov     QWORD PTR -88[rbp], 0
        lea     rdx, -88[rbp]
        mov     rax, QWORD PTR 1000[rbp]
        mov     rcx, rax
        call    read_source
        mov     QWORD PTR 992[rbp], rax
        mov     rax, QWORD PTR 1000[rbp]
        mov     rcx, rax
        call    fclose
        call    create_parser
        mov     rsi, rax
        mov     rax, QWORD PTR .refptr.builtin_scope[rip]
        mov     rbx, QWORD PTR [rax]
        mov     rdx, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR 992[rbp]
        mov     rcx, rax
        call    create_lexer
        mov     r8, rsi
        mov     rdx, rbx
        mov     rcx, rax
        call    parse_code
        mov     QWORD PTR 984[rbp], rax
        lea     rax, -80[rbp]
        mov     rdx, rax
        lea     rax, .LC23[rip]
        mov     rcx, rax
        call    printf
        cmp     QWORD PTR 984[rbp], 0
        jne     .L77
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        lea     rax, -80[rbp]
        mov     r8, rax
        lea     rax, .LC24[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L83
.L77:
        mov     rax, QWORD PTR 984[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 976[rbp], rax
        mov     rax, QWORD PTR 976[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 1008[rbp], rax
        jmp     .L78
.L81:
        mov     rax, QWORD PTR 1008[rbp]
        mov     QWORD PTR 968[rbp], rax
        mov     rax, QWORD PTR 968[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 960[rbp], rax
        mov     rax, QWORD PTR 960[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 1056[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L79
        mov     rax, QWORD PTR 960[rbp]
        mov     QWORD PTR 1016[rbp], rax
        jmp     .L80
.L79:
        mov     rax, QWORD PTR 968[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 1008[rbp], rax
.L78:
        cmp     QWORD PTR 1008[rbp], 0
        jne     .L81
.L80:
        cmp     QWORD PTR 1016[rbp], 0
        je      .L82
        mov     rax, QWORD PTR 1072[rbp]
        mov     QWORD PTR 952[rbp], rax
        mov     rax, QWORD PTR 952[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 1016[rbp]
        mov     rcx, rax
        call    list_append
.L82:
        mov     rax, QWORD PTR 1016[rbp]
.L83:
        add     rsp, 1152
        pop     rbx
        pop     rsi
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
        je      .L85
        mov     eax, 13
        jmp     .L86
.L85:
        mov     rax, QWORD PTR .refptr.ADD_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L87
        mov     eax, 14
        jmp     .L86
.L87:
        mov     rax, QWORD PTR .refptr.SUB_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L88
        mov     eax, 15
        jmp     .L86
.L88:
        mov     rax, QWORD PTR .refptr.MUL_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L89
        mov     eax, 16
        jmp     .L86
.L89:
        mov     rax, QWORD PTR .refptr.DIV_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L90
        mov     eax, 17
        jmp     .L86
.L90:
        mov     rax, QWORD PTR .refptr.MOD_ASSIGN_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L91
        mov     eax, 18
        jmp     .L86
.L91:
        mov     rax, QWORD PTR .refptr.AND_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L92
        mov     eax, 11
        jmp     .L86
.L92:
        mov     rax, QWORD PTR .refptr.OR_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L93
        mov     eax, 12
        jmp     .L86
.L93:
        mov     rax, QWORD PTR .refptr.EQ_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L94
        mov     eax, 5
        jmp     .L86
.L94:
        mov     rax, QWORD PTR .refptr.NE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L95
        mov     eax, 6
        jmp     .L86
.L95:
        mov     rax, QWORD PTR .refptr.LT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L96
        mov     eax, 7
        jmp     .L86
.L96:
        mov     rax, QWORD PTR .refptr.GT_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L97
        mov     eax, 8
        jmp     .L86
.L97:
        mov     rax, QWORD PTR .refptr.LE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L98
        mov     eax, 9
        jmp     .L86
.L98:
        mov     rax, QWORD PTR .refptr.GE_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L99
        mov     eax, 10
        jmp     .L86
.L99:
        mov     rax, QWORD PTR .refptr.ADD_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L100
        mov     eax, 0
        jmp     .L86
.L100:
        mov     rax, QWORD PTR .refptr.SUB_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L101
        mov     eax, 1
        jmp     .L86
.L101:
        mov     rax, QWORD PTR .refptr.MUL_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L102
        mov     eax, 2
        jmp     .L86
.L102:
        mov     rax, QWORD PTR .refptr.DIV_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L103
        mov     eax, 3
        jmp     .L86
.L103:
        mov     rax, QWORD PTR .refptr.MOD_SYMBOL[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L104
        mov     eax, 4
        jmp     .L86
.L104:
        mov     eax, 19
.L86:
        add     rsp, 32
        pop     rbp
        ret
operator_precedence:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L106
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L108[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L108[rip]
        add     rax, rdx
        jmp     rax
.L108:
        .long   .L112-.L108
        .long   .L112-.L108
        .long   .L111-.L108
        .long   .L111-.L108
        .long   .L111-.L108
        .long   .L110-.L108
        .long   .L110-.L108
        .long   .L110-.L108
        .long   .L110-.L108
        .long   .L110-.L108
        .long   .L110-.L108
        .long   .L109-.L108
        .long   .L109-.L108
        .long   .L107-.L108
        .long   .L107-.L108
        .long   .L107-.L108
        .long   .L107-.L108
        .long   .L107-.L108
        .long   .L107-.L108
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
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L115
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L117[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L117[rip]
        add     rax, rdx
        jmp     rax
.L117:
        .long   .L135-.L117
        .long   .L134-.L117
        .long   .L133-.L117
        .long   .L132-.L117
        .long   .L131-.L117
        .long   .L130-.L117
        .long   .L129-.L117
        .long   .L128-.L117
        .long   .L127-.L117
        .long   .L126-.L117
        .long   .L125-.L117
        .long   .L124-.L117
        .long   .L123-.L117
        .long   .L122-.L117
        .long   .L121-.L117
        .long   .L120-.L117
        .long   .L119-.L117
        .long   .L118-.L117
        .long   .L116-.L117
.L122:
        mov     rax, QWORD PTR .refptr.ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L121:
        mov     rax, QWORD PTR .refptr.ADD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L120:
        mov     rax, QWORD PTR .refptr.SUB_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L119:
        mov     rax, QWORD PTR .refptr.MUL_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L118:
        mov     rax, QWORD PTR .refptr.DIV_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L116:
        mov     rax, QWORD PTR .refptr.MOD_ASSIGN_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L124:
        mov     rax, QWORD PTR .refptr.AND_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L123:
        mov     rax, QWORD PTR .refptr.OR_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L130:
        mov     rax, QWORD PTR .refptr.EQ_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L129:
        mov     rax, QWORD PTR .refptr.NE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L128:
        mov     rax, QWORD PTR .refptr.LT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L127:
        mov     rax, QWORD PTR .refptr.GT_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L126:
        mov     rax, QWORD PTR .refptr.LE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L125:
        mov     rax, QWORD PTR .refptr.GE_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L135:
        mov     rax, QWORD PTR .refptr.ADD_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L134:
        mov     rax, QWORD PTR .refptr.SUB_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L133:
        mov     rax, QWORD PTR .refptr.MUL_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L132:
        mov     rax, QWORD PTR .refptr.DIV_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L131:
        mov     rax, QWORD PTR .refptr.MOD_SYMBOL[rip]
        mov     rax, QWORD PTR [rax]
        jmp     .L136
.L115:
        mov     eax, 0
.L136:
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

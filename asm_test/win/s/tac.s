create_attribute_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC0:
        .ascii "[Warning] Unsupported type for size lookup: %s\12\0"
get_type_size:
        push    rbp
        push    rbx
        sub     rsp, 56
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR -8[rbp], 8
        cmp     QWORD PTR 32[rbp], 0
        jne     .L4
        mov     QWORD PTR -8[rbp], 0
        jmp     .L5
.L4:
        mov     rax, QWORD PTR .refptr.name_int[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 32[rbp], rax
        je      .L6
        mov     rax, QWORD PTR .refptr.name_float[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 32[rbp], rax
        je      .L6
        mov     rax, QWORD PTR .refptr.name_string[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 32[rbp], rax
        jne     .L7
.L6:
        mov     QWORD PTR -8[rbp], 8
        jmp     .L5
.L7:
        mov     rax, QWORD PTR .refptr.name_bool[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 32[rbp], rax
        je      .L8
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 32[rbp], rax
        jne     .L9
.L8:
        mov     QWORD PTR -8[rbp], 1
        jmp     .L5
.L9:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L10
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L5
.L10:
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC0[rip]
        mov     rdx, rax
        call    fprintf
.L5:
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret
is_assignment_operator:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 13
        je      .L13
        cmp     DWORD PTR 16[rbp], 14
        je      .L13
        cmp     DWORD PTR 16[rbp], 15
        je      .L13
        cmp     DWORD PTR 16[rbp], 16
        je      .L13
        cmp     DWORD PTR 16[rbp], 17
        je      .L13
        cmp     DWORD PTR 16[rbp], 18
        jne     .L14
.L13:
        mov     eax, 1
        jmp     .L15
.L14:
        mov     eax, 0
.L15:
        pop     rbp
        ret
get_instruction_type:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L18
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L20[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L20[rip]
        add     rax, rdx
        jmp     rax
.L20:
        .long   .L24-.L20
        .long   .L23-.L20
        .long   .L22-.L20
        .long   .L21-.L20
        .long   .L19-.L20
        .long   .L33-.L20
        .long   .L32-.L20
        .long   .L31-.L20
        .long   .L30-.L20
        .long   .L29-.L20
        .long   .L28-.L20
        .long   .L27-.L20
        .long   .L26-.L20
        .long   .L25-.L20
        .long   .L24-.L20
        .long   .L23-.L20
        .long   .L22-.L20
        .long   .L21-.L20
        .long   .L19-.L20
.L24:
        mov     eax, 0
        jmp     .L34
.L23:
        mov     eax, 1
        jmp     .L34
.L22:
        mov     eax, 2
        jmp     .L34
.L21:
        mov     eax, 3
        jmp     .L34
.L19:
        mov     eax, 4
        jmp     .L34
.L25:
        mov     eax, 14
        jmp     .L34
.L33:
        mov     eax, 5
        jmp     .L34
.L32:
        mov     eax, 6
        jmp     .L34
.L31:
        mov     eax, 7
        jmp     .L34
.L30:
        mov     eax, 8
        jmp     .L34
.L29:
        mov     eax, 9
        jmp     .L34
.L28:
        mov     eax, 10
        jmp     .L34
.L27:
        mov     eax, 11
        jmp     .L34
.L26:
        mov     eax, 12
        jmp     .L34
.L18:
        mov     eax, 25
.L34:
        pop     rbp
        ret
create_tac:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_tac_status:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 96
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], 0
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 32[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 40[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 48[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 56[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 64[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 72[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 80[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 88[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_subroutine:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 32[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_block:
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
search_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L44
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L44
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        jmp     .L45
.L47:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L45
        mov     rax, QWORD PTR -16[rbp]
        jmp     .L46
.L45:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L47
.L44:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L48
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L48
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        jmp     .L49
.L50:
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L49
        mov     rax, QWORD PTR -32[rbp]
        jmp     .L46
.L49:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L50
.L48:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L51
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L51
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -40[rbp], rax
        jmp     .L52
.L55:
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jne     .L52
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L52
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -56[rbp], rax
        jmp     .L53
.L54:
        mov     rax, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L53
        mov     rax, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR [rax]
        jmp     .L46
.L53:
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L54
.L52:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L55
.L51:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L56
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -72[rbp], rax
        jmp     .L57
.L58:
        mov     rax, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L57
        mov     rax, QWORD PTR -80[rbp]
        jmp     .L46
.L57:
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L58
.L56:
        mov     eax, 0
.L46:
        add     rsp, 112
        pop     rbp
        ret
.LC1:
        .ascii "\0"
.LC2:
        .ascii "$%d-error\0"
.LC3:
        .ascii "$%c%zu\0"
create_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     DWORD PTR 32[rbp], r8d
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 16[rbp], 0
        je      .L60
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L61
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], rdx
.L61:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    search_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L62
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rax], rdx
.L62:
        cmp     QWORD PTR -24[rbp], 0
        je      .L60
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L63
.L60:
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     eax, DWORD PTR 32[rbp]
        sub     eax, 97
        cmp     eax, 21
        ja      .L64
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L66[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L66[rip]
        add     rax, rdx
        jmp     rax
.L66:
        .long   .L71-.L66
        .long   .L70-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L69-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L68-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L64-.L66
        .long   .L67-.L66
        .long   .L64-.L66
        .long   .L65-.L66
.L71:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 48[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 48[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L72
.L68:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 56[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 56[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L72
.L65:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 64[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 64[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L72
.L67:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 72[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 72[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L72
.L70:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 80[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 80[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L72
.L69:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 88[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 88[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L72
.L64:
        mov     QWORD PTR -16[rbp], -1
        nop
.L72:
        mov     edx, 32
        lea     rax, .LC1[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 8[rdx], rax
        cmp     QWORD PTR -16[rbp], -1
        jne     .L73
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     edx, DWORD PTR 32[rbp]
        mov     r8d, edx
        lea     rdx, .LC2[rip]
        mov     rcx, rax
        call    sprintf
        jmp     .L74
.L73:
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 32[rbp]
        mov     r9, rcx
        mov     r8d, edx
        lea     rdx, .LC3[rip]
        mov     rcx, rax
        call    sprintf
.L74:
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 16[rax], rdx
        cmp     DWORD PTR 32[rbp], 116
        je      .L75
        cmp     DWORD PTR 32[rbp], 118
        jne     .L76
.L75:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
.L76:
        mov     rax, QWORD PTR -32[rbp]
.L63:
        add     rsp, 64
        pop     rbp
        ret
.LC4:
        .ascii "Error: create_attribute received NULL table\12\0"
.LC5:
        .ascii "Error: create_attribute received NULL table or attributes list\12\0"
create_attribute:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8d, 97
        mov     rcx, rax
        call    create_var
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        cmp     QWORD PTR 40[rbp], 0
        jne     .L78
        cmp     QWORD PTR 32[rbp], 0
        je      .L78
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    get_type_size
        mov     rdx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rdx]
        add     rdx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        jmp     .L79
.L78:
        cmp     QWORD PTR 32[rbp], 0
        jne     .L79
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 44
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
.L79:
        cmp     QWORD PTR 32[rbp], 0
        je      .L80
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L81
.L80:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 63
        mov     edx, 1
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L82
.L81:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
.L82:
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_instruction:
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
.LC6:
        .ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
create_arg:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 16[rax], edx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        cmp     DWORD PTR 16[rbp], 8
        ja      .L87
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L89[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L89[rip]
        add     rax, rdx
        jmp     rax
.L89:
        .long   .L96-.L89
        .long   .L95-.L89
        .long   .L94-.L89
        .long   .L93-.L89
        .long   .L92-.L89
        .long   .L91-.L89
        .long   .L90-.L89
        .long   .L88-.L89
        .long   .L88-.L89
.L96:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L97
.L95:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR .refptr.name_int[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L97
.L94:
        mov     rax, QWORD PTR 24[rbp]
        movsd   xmm0, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        movsd   QWORD PTR [rax], xmm0
        mov     rax, QWORD PTR .refptr.name_float[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L97
.L93:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR .refptr.name_string[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L97
.L92:
        mov     rax, QWORD PTR 24[rbp]
        movzx   edx, BYTE PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR [rax], dl
        mov     rax, QWORD PTR .refptr.name_bool[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L97
.L91:
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR .refptr.name_void[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L97
.L90:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L97
.L88:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L97
.L87:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC6[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L97:
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 20[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
load_rvalue:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L100
        mov     eax, 0
        jmp     .L101
.L100:
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR 20[rax]
        test    al, al
        je      .L102
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 23
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -8[rbp]
        jmp     .L101
.L102:
        mov     rax, QWORD PTR 16[rbp]
.L101:
        add     rsp, 48
        pop     rbp
        ret
.LC7:
        .ascii "main\0"
tac_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        call    create_tac
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_tac_status
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        jmp     .L104
.L107:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 1
        jne     .L105
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    tac_function
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, .LC7[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L104
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L104
.L105:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 2
        jne     .L106
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    tac_class
        jmp     .L104
.L106:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        jne     .L104
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    tac_import
.L104:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L107
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 64
        pop     rbp
        ret
.LC8:
        .ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
tac_import:
        push    rbp
        push    rbx
        sub     rsp, 40
        lea     rbp, 32[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 3
        jne     .L110
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 48[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L115
.L110:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L112
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L113
.L112:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 48[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L115
.L113:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L114
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    tac_class
        jmp     .L115
.L114:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     ebx, DWORD PTR 32[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC8[rip]
        mov     rdx, rax
        call    fprintf
.L115:
        nop
        add     rsp, 40
        pop     rbx
        pop     rbp
        ret
tac_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    create_subroutine
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        jmp     .L117
.L118:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 112
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
.L117:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L118
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -40[rbp], rax
        jmp     .L119
.L120:
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    tac_statement
.L119:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L120
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], 0
        nop
        add     rsp, 80
        pop     rbp
        ret
.LC9:
        .ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
tac_method:
        push    rbp
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    create_subroutine
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        jmp     .L122
.L123:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 112
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
.L122:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L123
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR .refptr.DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L128
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        jne     .L125
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 19
        jne     .L125
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 8
        jne     .L125
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        je      .L126
.L125:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC9[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L121
.L126:
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rax]
        add     rax, 24
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     r9d, 0
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 18
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L128
.L129:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    tac_statement
.L128:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L129
        mov     rax, QWORD PTR 40[rbp]
        mov     QWORD PTR 8[rax], 0
.L121:
        add     rsp, 104
        pop     rbx
        pop     rbp
        ret
.LC10:
        .ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
tac_class:
        push    rbp
        push    rbx
        sub     rsp, 72
        lea     rbp, 64[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    create_attribute_table
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L131
.L135:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        je      .L132
        cmp     eax, 1
        je      .L133
        jmp     .L136
.L132:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_method
        jmp     .L131
.L133:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    tac_variable
        jmp     .L131
.L136:
        mov     rax, QWORD PTR -24[rbp]
        mov     ebx, DWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC10[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L131:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L135
        mov     rax, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], 0
        nop
        add     rsp, 72
        pop     rbx
        pop     rbp
        ret
tac_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     eax, r8d
        mov     BYTE PTR 32[rbp], al
        mov     QWORD PTR -16[rbp], 0
        cmp     BYTE PTR 32[rbp], 0
        je      .L138
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_pop_back
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     r8, QWORD PTR -24[rbp]
        mov     rcx, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     r9d, 0
        mov     rcx, rax
        call    create_attribute
        jmp     .L142
.L138:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L140
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
        jmp     .L141
.L140:
        mov     QWORD PTR -32[rbp], 0
        lea     rax, -32[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
.L141:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     rdx, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 14
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
.L142:
        nop
        add     rsp, 80
        pop     rbp
        ret
.LC11:
        .ascii "[Warning] 'break' statement used outside of loop\12\0"
.LC12:
        .ascii "[Warning] 'continue' statement used outside of loop\12\0"
.LC13:
        .ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
tac_statement:
        push    rbp
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 7
        ja      .L144
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L146[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L146[rip]
        add     rax, rdx
        jmp     rax
.L146:
        .long   .L153-.L146
        .long   .L152-.L146
        .long   .L151-.L146
        .long   .L150-.L146
        .long   .L149-.L146
        .long   .L148-.L146
        .long   .L147-.L146
        .long   .L145-.L146
.L153:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        jmp     .L154
.L152:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    tac_variable
        jmp     .L154
.L151:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_if
        jmp     .L154
.L150:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_while
        jmp     .L154
.L149:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_for
        jmp     .L154
.L148:
        mov     edx, 0
        mov     ecx, 5
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L155
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
.L155:
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 21
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L154
.L147:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L156
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        je      .L156
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L154
.L156:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 49
        mov     edx, 1
        lea     rax, .LC11[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L154
.L145:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L157
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L157
        mov     rax, QWORD PTR -16[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L154
.L157:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 52
        mov     edx, 1
        lea     rax, .LC12[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L154
.L144:
        mov     rax, QWORD PTR 32[rbp]
        mov     ebx, DWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC13[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L154:
        nop
        add     rsp, 88
        pop     rbx
        pop     rbp
        ret
tac_if:
        push    rbp
        push    rbx
        sub     rsp, 200
        lea     rbp, 192[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        je      .L159
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        je      .L159
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L160
.L159:
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -16[rbp], rax
.L160:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -64[rbp], rax
        jmp     .L161
.L162:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    tac_statement
.L161:
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L162
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L163
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -88[rbp], rax
        jmp     .L164
.L168:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -104[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -104[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -96[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        je      .L165
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        je      .L165
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -8[rbp], rax
.L165:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -96[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -112[rbp], rax
        jmp     .L166
.L167:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -120[rbp]
        mov     rcx, rax
        call    tac_statement
.L166:
        mov     rax, QWORD PTR -112[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -120[rbp], rax
        cmp     QWORD PTR -120[rbp], 0
        jne     .L167
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
.L164:
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -96[rbp], rax
        cmp     QWORD PTR -96[rbp], 0
        jne     .L168
.L163:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_is_empty
        test    al, al
        jne     .L169
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -128[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -128[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -128[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -136[rbp], rax
        jmp     .L170
.L171:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -144[rbp]
        mov     rcx, rax
        call    tac_statement
.L170:
        mov     rax, QWORD PTR -136[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -144[rbp], rax
        cmp     QWORD PTR -144[rbp], 0
        jne     .L171
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
.L169:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -152[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -152[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -152[rbp]
        mov     QWORD PTR 16[rax], rdx
        nop
        add     rsp, 200
        pop     rbx
        pop     rbp
        ret
tac_for:
        push    rbp
        push    rbx
        sub     rsp, 168
        lea     rbp, 160[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L173
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    tac_variable
.L173:
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L174
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -64[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L175
.L174:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
.L175:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -72[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -72[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L176
        mov     rax, QWORD PTR -80[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L177
.L176:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L178
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L177
.L178:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
.L177:
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -88[rbp], rax
        jmp     .L179
.L180:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -96[rbp]
        mov     rcx, rax
        call    tac_statement
.L179:
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -96[rbp], rax
        cmp     QWORD PTR -96[rbp], 0
        jne     .L180
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L181
        mov     rax, QWORD PTR -80[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -104[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -112[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -112[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -112[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
.L181:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L182
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
.L182:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -120[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -120[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -120[rbp]
        mov     QWORD PTR 16[rax], rdx
        nop
        add     rsp, 168
        pop     rbx
        pop     rbp
        ret
tac_while:
        push    rbp
        push    rbx
        sub     rsp, 120
        lea     rbp, 112[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -64[rbp], rax
        jmp     .L184
.L185:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    tac_statement
.L184:
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L185
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -80[rbp]
        mov     QWORD PTR 16[rax], rdx
        nop
        add     rsp, 120
        pop     rbx
        pop     rbp
        ret
.LC14:
        .ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
tac_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 19
        jne     .L187
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_primary
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        jmp     .L188
.L187:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        mov     ecx, eax
        call    get_instruction_type
        mov     DWORD PTR -20[rbp], eax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        mov     ecx, eax
        call    is_assignment_operator
        test    al, al
        je      .L189
        cmp     DWORD PTR -20[rbp], 14
        je      .L190
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -48[rbp], rax
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    load_rvalue
        mov     rcx, rax
        mov     r8, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR -20[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     ecx, eax
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR -8[rbp], rax
.L190:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        je      .L191
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 57
        mov     edx, 1
        lea     rax, .LC14[rip]
        mov     rcx, rax
        call    fwrite
.L191:
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 14
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        movzx   eax, BYTE PTR 20[rax]
        test    al, al
        je      .L192
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 24
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        jmp     .L192
.L189:
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -40[rbp], rax
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    load_rvalue
        mov     rcx, rax
        mov     r8, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR -40[rbp]
        mov     eax, DWORD PTR -20[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     ecx, eax
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR -8[rbp], rax
.L192:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -8[rbp]
.L188:
        add     rsp, 96
        pop     rbp
        ret
.LC16:
        .ascii "[Warning] Unsupported type for negation: %s\12\0"
.LC17:
        .ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
tac_primary:
        push    rbp
        push    rbx
        sub     rsp, 136
        lea     rbp, 128[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 8
        ja      .L194
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L196[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L196[rip]
        add     rax, rdx
        jmp     rax
.L196:
        .long   .L204-.L196
        .long   .L203-.L196
        .long   .L202-.L196
        .long   .L201-.L196
        .long   .L200-.L196
        .long   .L199-.L196
        .long   .L198-.L196
        .long   .L197-.L196
        .long   .L195-.L196
.L204:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     r8d, 10
        mov     edx, 0
        mov     rcx, rax
        call    strtoll
        mov     QWORD PTR -56[rbp], rax
        lea     rax, -56[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        jmp     .L205
.L203:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     edx, 0
        mov     rcx, rax
        call    strtod
        movq    rax, xmm0
        mov     QWORD PTR -64[rbp], rax
        lea     rax, -64[rbp]
        mov     rdx, rax
        mov     ecx, 2
        call    create_arg
        jmp     .L205
.L202:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, rax
        mov     ecx, 3
        call    create_arg
        jmp     .L205
.L201:
        mov     BYTE PTR -65[rbp], 1
        lea     rax, -65[rbp]
        mov     rdx, rax
        mov     ecx, 4
        call    create_arg
        jmp     .L205
.L200:
        mov     BYTE PTR -66[rbp], 0
        lea     rax, -66[rbp]
        mov     rdx, rax
        mov     ecx, 4
        call    create_arg
        jmp     .L205
.L199:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        jmp     .L205
.L198:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_primary
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR .refptr.name_bool[rip]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -40[rbp], rax
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 13
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -40[rbp]
        jmp     .L205
.L197:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_primary
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -24[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -80[rbp], 0
        movsd   xmm0, QWORD PTR .LC15[rip]
        movsd   QWORD PTR -88[rbp], xmm0
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR .refptr.name_int[rip]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jne     .L206
        lea     rax, -80[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 1
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
        jmp     .L207
.L206:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR .refptr.name_float[rip]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jne     .L208
        lea     rax, -88[rbp]
        mov     rdx, rax
        mov     ecx, 2
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 2
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
        jmp     .L207
.L208:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC16[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L205
.L207:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L205
.L195:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_variable_access
        jmp     .L205
.L194:
        mov     rax, QWORD PTR 32[rbp]
        mov     ebx, DWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC17[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
.L205:
        add     rsp, 136
        pop     rbx
        pop     rbp
        ret
.LC18:
        .ascii "[Warning] Unsupported variable access with NULL base\12\0"
.LC19:
        .ascii "[Warning] Failed to generate variable access for base\12\0"
.LC20:
        .ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
.LC21:
        .ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
.LC22:
        .ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
.LC23:
        .ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC24:
        .ascii "arr\0"
.LC25:
        .ascii "[Warning] Attempting to index non-array type: %s\12\0"
.LC26:
        .ascii "[Warning] Failed to generate variable access for index\12\0"
.LC27:
        .ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
.LC28:
        .ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
tac_variable_access:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 224
        lea     rbp, 224[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        jne     .L211
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L211
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L212
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L213
.L212:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 7
        call    create_arg
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        jmp     .L214
.L213:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L215
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        jmp     .L214
.L215:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L214
.L211:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L216
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 53
        mov     edx, 1
        lea     rax, .LC18[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L214
.L216:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_variable_access
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L217
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 54
        mov     edx, 1
        lea     rax, .LC19[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L214
.L217:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 2
        jne     .L218
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L219
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L220
.L219:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC20[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L220:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L221
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -16[rbp], rax
.L221:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -136[rbp], rax
        cmp     QWORD PTR -136[rbp], 0
        jne     .L222
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC21[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L222:
        mov     rax, QWORD PTR -136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        jne     .L223
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC22[rip]
        mov     rdx, rax
        call    fprintf
        mov     rax, QWORD PTR -136[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -136[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 7
        call    create_arg
        jmp     .L214
.L223:
        mov     rax, QWORD PTR -136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L224
        mov     rax, QWORD PTR -136[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -136[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 8
        call    create_arg
        jmp     .L214
.L224:
        mov     rax, QWORD PTR -136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 5
        je      .L225
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC23[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L225:
        mov     rax, QWORD PTR -136[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -144[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 97
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -144[rbp]
        mov     r9, rdx
        mov     r8, rcx
        mov     rdx, rax
        mov     ecx, 15
        call    create_instruction
        mov     QWORD PTR -152[rbp], rax
        mov     rax, QWORD PTR -144[rbp]
        mov     BYTE PTR 20[rax], 1
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -152[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -144[rbp]
        jmp     .L214
.L218:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 3
        jne     .L226
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, .LC24[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L227
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC25[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L227:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -112[rbp], rax
        cmp     QWORD PTR -112[rbp], 0
        jne     .L228
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 55
        mov     edx, 1
        lea     rax, .LC26[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L214
.L228:
        mov     rax, QWORD PTR .refptr.name_int[rip]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -120[rbp], rax
        mov     rcx, QWORD PTR -112[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -120[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 16
        call    create_instruction
        mov     QWORD PTR -128[rbp], rax
        mov     rax, QWORD PTR -120[rbp]
        mov     BYTE PTR 20[rax], 1
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -128[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -120[rbp]
        jmp     .L214
.L226:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 1
        jne     .L229
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        jne     .L230
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L230
        mov     rax, QWORD PTR .refptr.DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 8
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
.L230:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 8
        je      .L231
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 7
        je      .L231
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     ebx, DWORD PTR 16[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8d, ebx
        lea     rax, .LC27[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L231:
        mov     QWORD PTR -160[rbp], 0
        call    create_list
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 8
        jne     .L233
        mov     rax, QWORD PTR .refptr.DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L233
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
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
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    get_type_size
        mov     QWORD PTR -168[rbp], rax
        lea     rax, -168[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, QWORD PTR -64[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 17
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -160[rbp]
        add     rax, 1
        mov     QWORD PTR -160[rbp], rax
.L233:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -72[rbp], rax
        jmp     .L234
.L235:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -104[rbp], rax
        mov     rax, QWORD PTR -104[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    get_type_size
        mov     QWORD PTR -176[rbp], rax
        lea     rax, -176[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, QWORD PTR -104[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 17
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -160[rbp]
        add     rax, 1
        mov     QWORD PTR -160[rbp], rax
.L234:
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L235
        jmp     .L236
.L237:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    list_append
.L236:
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L237
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -96[rbp], rax
        lea     rax, -160[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -96[rbp]
        mov     r9, rdx
        mov     r8, rcx
        mov     rdx, rax
        mov     ecx, 22
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -96[rbp]
        jmp     .L214
.L229:
        mov     rax, QWORD PTR 32[rbp]
        mov     ebx, DWORD PTR 16[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC28[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
.L214:
        add     rsp, 224
        pop     rbx
        pop     rsi
        pop     rbp
        ret
.LC15:
        .long   0
        .long   -1074790400
.refptr.DEFAULT_CONSTRUCTOR_NAME:
        .quad   DEFAULT_CONSTRUCTOR_NAME
.refptr.name_void:
        .quad   name_void
.refptr.name_bool:
        .quad   name_bool
.refptr.name_string:
        .quad   name_string
.refptr.name_float:
        .quad   name_float
.refptr.name_int:
        .quad   name_int

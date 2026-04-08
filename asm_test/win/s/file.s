get_cwd:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     edx, 0
        mov     ecx, 0
        call    getcwd
        add     rsp, 32
        pop     rbp
        ret
create_file:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    absolute_path
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    normalize_path
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC0:
        .ascii "\0"
.LC1:
        .ascii "%s/%s\0"
absolute_path:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR 16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        jmp     .L6
.L10:
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 92
        jne     .L7
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 47
.L7:
        cmp     QWORD PTR -16[rbp], 1
        jbe     .L8
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L8
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 46
        jne     .L8
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, -2[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L8
        mov     rax, QWORD PTR -8[rbp]
        sub     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        lea     r8, -1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, r8
        mov     r8, rcx
        mov     rcx, rax
        call    memmove
        sub     QWORD PTR -8[rbp], 2
        sub     QWORD PTR -16[rbp], 2
.L8:
        cmp     QWORD PTR -16[rbp], 0
        je      .L9
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L9
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L9
        mov     rax, QWORD PTR -8[rbp]
        sub     rax, QWORD PTR -16[rbp]
        mov     r8, rax
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rdx, rax
        mov     rcx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rcx
        mov     rcx, rax
        call    memmove
        sub     QWORD PTR -8[rbp], 1
        sub     QWORD PTR -16[rbp], 1
.L9:
        add     QWORD PTR -16[rbp], 1
.L6:
        mov     rax, QWORD PTR -16[rbp]
        cmp     rax, QWORD PTR -8[rbp]
        jb      .L10
        cmp     QWORD PTR -8[rbp], 2
        jbe     .L11
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L11
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 96
        jle     .L11
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 122
        jg      .L11
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 2
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L11
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     ecx, eax
        call    to_upper
        mov     rdx, QWORD PTR 16[rbp]
        mov     BYTE PTR [rdx], al
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        mov     BYTE PTR [rax], 58
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L12
.L11:
        cmp     QWORD PTR -8[rbp], 1
        jbe     .L13
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 64
        jle     .L13
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 90
        jg      .L13
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 58
        jne     .L13
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L12
.L13:
        cmp     QWORD PTR -8[rbp], 0
        je      .L14
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L14
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L12
.L14:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L15
        call    get_cwd
        mov     QWORD PTR 24[rbp], rax
.L15:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L16
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L12
.L16:
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, QWORD PTR -8[rbp]
        add     rax, rdx
        add     rax, 2
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR -32[rbp], rax
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC1[rip]
        mov     rcx, rax
        call    sprintf
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_string
        mov     edx, 0
        mov     rcx, rax
        call    absolute_path
.L12:
        add     rsp, 64
        pop     rbp
        ret
get_file_name:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        pop     rbp
        ret
get_file_extension:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        pop     rbp
        ret
.LC2:
        .ascii "/\0"
get_file_dir:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L22
        mov     eax, 0
        jmp     .L23
.L22:
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        jmp     .L24
.L26:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L25
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        add     QWORD PTR -8[rbp], rax
        add     QWORD PTR -16[rbp], 1
.L25:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
.L24:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L26
        cmp     QWORD PTR -16[rbp], 0
        jne     .L27
        mov     eax, 0
        jmp     .L23
.L27:
        cmp     QWORD PTR -16[rbp], 1
        jbe     .L28
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR -8[rbp], rax
.L28:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        mov     BYTE PTR -25[rbp], 1
        jmp     .L29
.L32:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L30
        cmp     BYTE PTR -25[rbp], 0
        jne     .L31
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC2[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L31
        mov     rax, QWORD PTR -40[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L31
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L31
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L31:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strcat
        mov     BYTE PTR -25[rbp], 0
.L30:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
.L29:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L32
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    create_string
.L23:
        add     rsp, 80
        pop     rbp
        ret
get_full_path:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        pop     rbp
        ret
.LC3:
        .ascii "%s/%s%s\0"
.LC4:
        .ascii "%s%s\0"
rebuild_full_path:
        push    rbp
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_file_dir
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L36
        mov     rax, QWORD PTR -16[rbp]
        jmp     .L37
.L36:
        lea     rax, .LC0[rip]
.L37:
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L38
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        jmp     .L39
.L38:
        lea     rax, .LC0[rip]
.L39:
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    strlen
        add     rax, rbx
        add     rax, 1
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L40
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR -8[rbp], rax
.L40:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L41
        mov     rax, QWORD PTR -24[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L41
        mov     rax, QWORD PTR 32[rbp]
        mov     r8, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, r8
        mov     r8, rcx
        lea     rdx, .LC3[rip]
        mov     rcx, rax
        call    sprintf
        jmp     .L42
.L41:
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC4[rip]
        mov     rcx, rax
        call    sprintf
.L42:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 24[rdx], rax
        nop
        add     rsp, 104
        pop     rbx
        pop     rbp
        ret
change_file_extension:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    rebuild_full_path
        nop
        add     rsp, 32
        pop     rbp
        ret
change_file_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L45
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L46
.L51:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L47
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L48
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        jmp     .L49
.L48:
        lea     rax, .LC0[rip]
.L49:
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L50
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR -16[rbp], rax
.L50:
        mov     rax, QWORD PTR -16[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR -32[rbp], rax
        mov     rcx, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC4[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        jmp     .L45
.L47:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -8[rbp], rax
.L46:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L51
.L45:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    rebuild_full_path
        nop
        add     rsp, 64
        pop     rbp
        ret
.LC5:
        .ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC6:
        .ascii ".\0"
.LC7:
        .ascii "..\0"
normalize_path:
        push    rbp
        sub     rsp, 448
        lea     rbp, 128[rsp]
        mov     QWORD PTR 336[rbp], rcx
        mov     rax, QWORD PTR 336[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR 232[rbp], rax
        mov     rax, QWORD PTR 232[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR 224[rbp], rax
        mov     rax, QWORD PTR 336[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rcx, rax
        call    strcpy
        mov     QWORD PTR 312[rbp], 0
        mov     QWORD PTR 304[rbp], 0
        mov     QWORD PTR 296[rbp], 0
        cmp     QWORD PTR 232[rbp], 0
        je      .L53
        mov     rax, QWORD PTR 224[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L53
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 216[rbp], rax
        mov     edx, 1
        lea     rax, .LC2[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 216[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 216[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 216[rbp]
        mov     QWORD PTR 312[rbp], rax
        mov     rax, QWORD PTR 216[rbp]
        mov     QWORD PTR 304[rbp], rax
        mov     QWORD PTR 296[rbp], 1
.L53:
        mov     rax, QWORD PTR 296[rbp]
        mov     QWORD PTR 288[rbp], rax
        jmp     .L54
.L69:
        mov     rax, QWORD PTR 288[rbp]
        cmp     rax, QWORD PTR 232[rbp]
        je      .L55
        mov     rdx, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR 288[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L56
.L55:
        mov     rax, QWORD PTR 288[rbp]
        cmp     QWORD PTR 296[rbp], rax
        jnb     .L57
        mov     rax, QWORD PTR 288[rbp]
        sub     rax, QWORD PTR 296[rbp]
        mov     QWORD PTR 280[rbp], rax
        cmp     QWORD PTR 280[rbp], 255
        jbe     .L58
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 280[rbp]
        mov     r8, rax
        lea     rax, .LC5[rip]
        mov     rdx, rax
        call    fprintf
        mov     QWORD PTR 280[rbp], 255
.L58:
        mov     rdx, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR 296[rbp]
        add     rdx, rax
        mov     rcx, QWORD PTR 280[rbp]
        lea     rax, -96[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    strncpy
        lea     rdx, -96[rbp]
        mov     rax, QWORD PTR 280[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        lea     rax, -96[rbp]
        lea     rdx, .LC6[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L57
        lea     rax, -96[rbp]
        lea     rdx, .LC7[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L60
        cmp     QWORD PTR 304[rbp], 0
        je      .L61
        mov     rax, QWORD PTR 304[rbp]
        cmp     rax, QWORD PTR 312[rbp]
        je      .L61
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC7[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L62
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 176[rbp], rax
        mov     edx, 2
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 176[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 176[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR 176[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 176[rbp]
        mov     QWORD PTR 304[rbp], rax
        jmp     .L80
.L62:
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 272[rbp], rax
        jmp     .L64
.L66:
        mov     rax, QWORD PTR 272[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 272[rbp], rax
.L64:
        cmp     QWORD PTR 272[rbp], 0
        je      .L65
        mov     rax, QWORD PTR 272[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     QWORD PTR 304[rbp], rax
        jne     .L66
.L65:
        cmp     QWORD PTR 272[rbp], 0
        je      .L80
        mov     rax, QWORD PTR 272[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 272[rbp]
        mov     QWORD PTR 304[rbp], rax
        jmp     .L80
.L61:
        cmp     QWORD PTR 312[rbp], 0
        jne     .L57
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 168[rbp], rax
        mov     edx, 2
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 168[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 168[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 168[rbp]
        mov     QWORD PTR 312[rbp], rax
        mov     rax, QWORD PTR 168[rbp]
        mov     QWORD PTR 304[rbp], rax
        jmp     .L57
.L60:
        lea     rax, -96[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L57
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 184[rbp], rax
        mov     rdx, QWORD PTR 280[rbp]
        lea     rax, -96[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 184[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 8[rax], 0
        cmp     QWORD PTR 304[rbp], 0
        je      .L68
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR 184[rbp]
        mov     QWORD PTR 8[rax], rdx
.L68:
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 304[rbp], rax
        cmp     QWORD PTR 312[rbp], 0
        jne     .L57
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 312[rbp], rax
        jmp     .L57
.L80:
        nop
.L57:
        mov     rax, QWORD PTR 288[rbp]
        add     rax, 1
        mov     QWORD PTR 296[rbp], rax
.L56:
        add     QWORD PTR 288[rbp], 1
.L54:
        mov     rax, QWORD PTR 288[rbp]
        cmp     QWORD PTR 232[rbp], rax
        jnb     .L69
        mov     rax, QWORD PTR 336[rbp]
        mov     rdx, QWORD PTR 312[rbp]
        mov     QWORD PTR [rax], rdx
        cmp     QWORD PTR 304[rbp], 0
        je      .L70
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     edx, 46
        mov     rcx, rax
        call    strrchr
        mov     QWORD PTR 208[rbp], rax
        cmp     QWORD PTR 208[rbp], 0
        je      .L71
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 208[rbp], rax
        je      .L71
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 208[rbp]
        sub     rdx, rax
        mov     QWORD PTR 200[rbp], rdx
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 200[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rdx], rax
        mov     rax, QWORD PTR 208[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 208[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rdx], rax
        jmp     .L73
.L71:
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rax], 0
        jmp     .L73
.L70:
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rax], 0
.L73:
        mov     QWORD PTR 264[rbp], 0
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 256[rbp], rax
        mov     QWORD PTR 248[rbp], 0
        jmp     .L74
.L75:
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR 264[rbp], rax
        add     QWORD PTR 248[rbp], 1
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 256[rbp], rax
.L74:
        cmp     QWORD PTR 256[rbp], 0
        jne     .L75
        cmp     QWORD PTR 248[rbp], 1
        jbe     .L76
        mov     rdx, QWORD PTR 248[rbp]
        mov     rax, QWORD PTR 264[rbp]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR 264[rbp], rax
.L76:
        mov     rax, QWORD PTR 264[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string_not_check
        mov     QWORD PTR 192[rbp], rax
        mov     rax, QWORD PTR 192[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 256[rbp], rax
        mov     BYTE PTR 247[rbp], 1
        jmp     .L77
.L79:
        cmp     BYTE PTR 247[rbp], 0
        jne     .L78
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC2[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L78
        mov     rax, QWORD PTR 192[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L78
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strlen
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 192[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L78
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 192[rbp]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L78:
        mov     rax, QWORD PTR 256[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strcat
        mov     BYTE PTR 247[rbp], 0
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 256[rbp], rax
.L77:
        cmp     QWORD PTR 256[rbp], 0
        jne     .L79
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 24[rdx], rax
        nop
        add     rsp, 448
        pop     rbp
        ret

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
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
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
        cmp     QWORD PTR -8[rbp], 0
        je      .L11
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L11
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L12
.L11:
        call    get_cwd
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L13
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L12
.L13:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, QWORD PTR -8[rbp]
        add     rax, rdx
        add     rax, 2
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR -40[rbp], rax
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC1[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    free
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    create_string
.L12:
        add     rsp, 80
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
        jne     .L19
        mov     eax, 0
        jmp     .L20
.L19:
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        jmp     .L21
.L23:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L22
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        add     QWORD PTR -8[rbp], rax
        add     QWORD PTR -16[rbp], 1
.L22:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
.L21:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L23
        cmp     QWORD PTR -16[rbp], 0
        jne     .L24
        mov     eax, 0
        jmp     .L20
.L24:
        cmp     QWORD PTR -16[rbp], 1
        jbe     .L25
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR -8[rbp], rax
.L25:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        mov     BYTE PTR -25[rbp], 1
        jmp     .L26
.L29:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L27
        cmp     BYTE PTR -25[rbp], 0
        jne     .L28
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC2[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L28
        mov     rax, QWORD PTR -40[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L28
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L28
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L28:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strcat
        mov     BYTE PTR -25[rbp], 0
.L27:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
.L26:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L29
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    create_string
.L20:
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
        .ascii "%s\0"
change_file_extension:
        push    rbp
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_file_dir
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L33
        mov     rax, QWORD PTR -16[rbp]
        jmp     .L34
.L33:
        lea     rax, .LC0[rip]
.L34:
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR 40[rbp], 0
        je      .L35
        mov     rax, QWORD PTR 40[rbp]
        jmp     .L36
.L35:
        lea     rax, .LC0[rip]
.L36:
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
        cmp     QWORD PTR 40[rbp], 0
        je      .L37
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR -8[rbp], rax
.L37:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L38
        mov     rax, QWORD PTR -24[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L38
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC1[rip]
        mov     rcx, rax
        call    sprintf
        jmp     .L39
.L38:
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rdx
        lea     rdx, .LC3[rip]
        mov     rcx, rax
        call    sprintf
.L39:
        cmp     QWORD PTR 40[rbp], 0
        je      .L40
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strcat
.L40:
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
        add     rsp, 88
        pop     rbx
        pop     rbp
        ret
.LC4:
        .ascii "%s%s\0"
.LC5:
        .ascii "%s/%s%s\0"
change_file_name:
        push    rbp
        push    rbx
        sub     rsp, 136
        lea     rbp, 128[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L42
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L43
.L48:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L44
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L45
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        jmp     .L46
.L45:
        lea     rax, .LC0[rip]
.L46:
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L47
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR -16[rbp], rax
.L47:
        mov     rax, QWORD PTR -16[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR -40[rbp], rax
        mov     rcx, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC4[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        jmp     .L42
.L44:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -8[rbp], rax
.L43:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L48
.L42:
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_file_dir
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        je      .L49
        mov     rax, QWORD PTR -48[rbp]
        jmp     .L50
.L49:
        lea     rax, .LC0[rip]
.L50:
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L51
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        jmp     .L52
.L51:
        lea     rax, .LC0[rip]
.L52:
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    strlen
        add     rax, rbx
        add     rax, 1
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L53
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR -24[rbp], rax
.L53:
        mov     rax, QWORD PTR -24[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        je      .L54
        mov     rax, QWORD PTR -56[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L54
        mov     r8, QWORD PTR 40[rbp]
        mov     rcx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -72[rbp]
        mov     rdx, QWORD PTR -64[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, r8
        mov     r8, rcx
        lea     rdx, .LC5[rip]
        mov     rcx, rax
        call    sprintf
        jmp     .L55
.L54:
        mov     rcx, QWORD PTR -64[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -72[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC4[rip]
        mov     rcx, rax
        call    sprintf
.L55:
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 24[rdx], rax
        nop
        add     rsp, 136
        pop     rbx
        pop     rbp
        ret
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
        mov     QWORD PTR 240[rbp], rax
        mov     rax, QWORD PTR 240[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR 232[rbp], rax
        mov     rax, QWORD PTR 336[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 232[rbp]
        mov     rcx, rax
        call    strcpy
        mov     QWORD PTR 312[rbp], 0
        mov     QWORD PTR 304[rbp], 0
        mov     QWORD PTR 296[rbp], 0
        cmp     QWORD PTR 240[rbp], 0
        je      .L57
        mov     rax, QWORD PTR 232[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L57
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 224[rbp], rax
        mov     edx, 1
        lea     rax, .LC2[rip]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 224[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 224[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 224[rbp]
        mov     QWORD PTR 312[rbp], rax
        mov     rax, QWORD PTR 224[rbp]
        mov     QWORD PTR 304[rbp], rax
        mov     QWORD PTR 296[rbp], 1
.L57:
        mov     rax, QWORD PTR 296[rbp]
        mov     QWORD PTR 288[rbp], rax
        jmp     .L58
.L72:
        mov     rax, QWORD PTR 288[rbp]
        cmp     rax, QWORD PTR 240[rbp]
        je      .L59
        mov     rdx, QWORD PTR 232[rbp]
        mov     rax, QWORD PTR 288[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L60
.L59:
        mov     rax, QWORD PTR 288[rbp]
        cmp     QWORD PTR 296[rbp], rax
        jnb     .L61
        mov     rax, QWORD PTR 288[rbp]
        sub     rax, QWORD PTR 296[rbp]
        mov     QWORD PTR 192[rbp], rax
        mov     rdx, QWORD PTR 232[rbp]
        mov     rax, QWORD PTR 296[rbp]
        add     rdx, rax
        mov     rcx, QWORD PTR 192[rbp]
        lea     rax, -96[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    strncpy
        lea     rdx, -96[rbp]
        mov     rax, QWORD PTR 192[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        lea     rax, -96[rbp]
        lea     rdx, .LC6[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L61
        lea     rax, -96[rbp]
        lea     rdx, .LC7[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L63
        cmp     QWORD PTR 304[rbp], 0
        je      .L64
        mov     rax, QWORD PTR 304[rbp]
        cmp     rax, QWORD PTR 312[rbp]
        je      .L64
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC7[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L65
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
        jmp     .L83
.L65:
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 280[rbp], rax
        jmp     .L67
.L69:
        mov     rax, QWORD PTR 280[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 280[rbp], rax
.L67:
        cmp     QWORD PTR 280[rbp], 0
        je      .L68
        mov     rax, QWORD PTR 280[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     QWORD PTR 304[rbp], rax
        jne     .L69
.L68:
        cmp     QWORD PTR 280[rbp], 0
        je      .L83
        mov     rax, QWORD PTR 280[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 280[rbp]
        mov     QWORD PTR 304[rbp], rax
        jmp     .L83
.L64:
        cmp     QWORD PTR 312[rbp], 0
        jne     .L61
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
        jmp     .L61
.L63:
        lea     rax, -96[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L61
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 184[rbp], rax
        mov     rdx, QWORD PTR 192[rbp]
        lea     rax, -96[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 184[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 8[rax], 0
        cmp     QWORD PTR 304[rbp], 0
        je      .L71
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR 184[rbp]
        mov     QWORD PTR 8[rax], rdx
.L71:
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 304[rbp], rax
        cmp     QWORD PTR 312[rbp], 0
        jne     .L61
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 312[rbp], rax
        jmp     .L61
.L83:
        nop
.L61:
        mov     rax, QWORD PTR 288[rbp]
        add     rax, 1
        mov     QWORD PTR 296[rbp], rax
.L60:
        add     QWORD PTR 288[rbp], 1
.L58:
        mov     rax, QWORD PTR 288[rbp]
        cmp     QWORD PTR 240[rbp], rax
        jnb     .L72
        mov     rax, QWORD PTR 336[rbp]
        mov     rdx, QWORD PTR 312[rbp]
        mov     QWORD PTR [rax], rdx
        cmp     QWORD PTR 304[rbp], 0
        je      .L73
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     edx, 46
        mov     rcx, rax
        call    strrchr
        mov     QWORD PTR 216[rbp], rax
        cmp     QWORD PTR 216[rbp], 0
        je      .L74
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 216[rbp], rax
        je      .L74
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 216[rbp]
        sub     rdx, rax
        mov     QWORD PTR 208[rbp], rdx
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 208[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rdx], rax
        mov     rax, QWORD PTR 216[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 216[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rdx], rax
        jmp     .L76
.L74:
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rax], 0
        jmp     .L76
.L73:
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rax], 0
.L76:
        mov     QWORD PTR 272[rbp], 0
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 264[rbp], rax
        mov     QWORD PTR 256[rbp], 0
        jmp     .L77
.L78:
        mov     rax, QWORD PTR 264[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR 272[rbp], rax
        add     QWORD PTR 256[rbp], 1
        mov     rax, QWORD PTR 264[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 264[rbp], rax
.L77:
        cmp     QWORD PTR 264[rbp], 0
        jne     .L78
        cmp     QWORD PTR 256[rbp], 1
        jbe     .L79
        mov     rdx, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR 272[rbp]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR 272[rbp], rax
.L79:
        mov     rax, QWORD PTR 272[rbp]
        add     rax, 1
        mov     rdx, rax
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    create_string
        mov     QWORD PTR 200[rbp], rax
        mov     rax, QWORD PTR 200[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 264[rbp], rax
        mov     BYTE PTR 255[rbp], 1
        jmp     .L80
.L82:
        cmp     BYTE PTR 255[rbp], 0
        jne     .L81
        mov     rax, QWORD PTR 264[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC2[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L81
        mov     rax, QWORD PTR 200[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L81
        mov     rax, QWORD PTR 200[rbp]
        mov     rcx, rax
        call    strlen
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 200[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L81
        mov     rax, QWORD PTR 200[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 200[rbp]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L81:
        mov     rax, QWORD PTR 264[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 200[rbp]
        mov     rcx, rax
        call    strcat
        mov     BYTE PTR 255[rbp], 0
        mov     rax, QWORD PTR 264[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 264[rbp], rax
.L80:
        cmp     QWORD PTR 264[rbp], 0
        jne     .L82
        mov     rax, QWORD PTR 200[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 200[rbp]
        mov     rcx, rax
        call    create_string
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 24[rdx], rax
        nop
        add     rsp, 448
        pop     rbp
        ret

get_cwd:
        push    rbp
        mov     rbp, rsp
        mov     esi, 0
        mov     edi, 0
        call    getcwd
        pop     rbp
        ret
create_file:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    absolute_path
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+24], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    normalize_path
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string ""
.LC1:
        .string "%s/%s"
absolute_path:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-8], rax
        mov     QWORD PTR [rbp-16], 0
        jmp     .L6
.L10:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 92
        jne     .L7
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        mov     BYTE PTR [rax], 47
.L7:
        cmp     QWORD PTR [rbp-16], 1
        jbe     .L8
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L8
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 46
        jne     .L8
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax-2]
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L8
        mov     rax, QWORD PTR [rbp-8]
        sub     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-16]
        lea     rcx, [rdx+1]
        mov     rdx, QWORD PTR [rbp-56]
        lea     rsi, [rcx+rdx]
        mov     rdx, QWORD PTR [rbp-16]
        lea     rcx, [rdx-1]
        mov     rdx, QWORD PTR [rbp-56]
        add     rcx, rdx
        mov     rdx, rax
        mov     rdi, rcx
        call    memmove
        sub     QWORD PTR [rbp-8], 2
        sub     QWORD PTR [rbp-16], 2
.L8:
        cmp     QWORD PTR [rbp-16], 0
        je      .L9
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L9
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L9
        mov     rax, QWORD PTR [rbp-8]
        sub     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-16]
        lea     rcx, [rdx+1]
        mov     rdx, QWORD PTR [rbp-56]
        lea     rsi, [rcx+rdx]
        mov     rcx, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rbp-16]
        add     rcx, rdx
        mov     rdx, rax
        mov     rdi, rcx
        call    memmove
        sub     QWORD PTR [rbp-8], 1
        sub     QWORD PTR [rbp-16], 1
.L9:
        add     QWORD PTR [rbp-16], 1
.L6:
        mov     rax, QWORD PTR [rbp-16]
        cmp     rax, QWORD PTR [rbp-8]
        jb      .L10
        cmp     QWORD PTR [rbp-8], 0
        je      .L11
        mov     rax, QWORD PTR [rbp-56]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L11
        mov     rax, QWORD PTR [rbp-56]
        jmp     .L12
.L11:
        call    get_cwd
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L13
        mov     rax, QWORD PTR [rbp-56]
        jmp     .L12
.L13:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    strlen
        mov     rdx, QWORD PTR [rbp-8]
        add     rax, rdx
        add     rax, 2
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string
        mov     QWORD PTR [rbp-40], rax
        mov     rcx, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    free
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
.L12:
        leave
        ret
get_file_name:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        pop     rbp
        ret
get_file_extension:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        pop     rbp
        ret
.LC2:
        .string "/"
get_file_dir:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L19
        mov     eax, 0
        jmp     .L20
.L19:
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        jmp     .L21
.L23:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L22
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        add     QWORD PTR [rbp-8], rax
        add     QWORD PTR [rbp-16], 1
.L22:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
.L21:
        cmp     QWORD PTR [rbp-24], 0
        jne     .L23
        cmp     QWORD PTR [rbp-16], 0
        jne     .L24
        mov     eax, 0
        jmp     .L20
.L24:
        cmp     QWORD PTR [rbp-16], 1
        jbe     .L25
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR [rbp-8], rax
.L25:
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        mov     BYTE PTR [rbp-25], 1
        jmp     .L26
.L29:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L27
        cmp     BYTE PTR [rbp-25], 0
        jne     .L28
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L28
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L28
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L28
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L28:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcat
        mov     BYTE PTR [rbp-25], 0
.L27:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
.L26:
        cmp     QWORD PTR [rbp-24], 0
        jne     .L29
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
.L20:
        leave
        ret
get_full_path:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+24]
        pop     rbp
        ret
.LC3:
        .string "%s"
change_file_extension:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 72
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     rax, QWORD PTR [rbp-72]
        mov     rdx, QWORD PTR [rbp-80]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    get_file_dir
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        je      .L33
        mov     rax, QWORD PTR [rbp-32]
        jmp     .L34
.L33:
        mov     eax, OFFSET FLAT:.LC0
.L34:
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-80], 0
        je      .L35
        mov     rax, QWORD PTR [rbp-80]
        jmp     .L36
.L35:
        mov     eax, OFFSET FLAT:.LC0
.L36:
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    strlen
        add     rax, rbx
        add     rax, 1
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-80], 0
        je      .L37
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        add     QWORD PTR [rbp-24], rax
.L37:
        mov     rax, QWORD PTR [rbp-24]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-32], 0
        je      .L38
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L38
        mov     rax, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        jmp     .L39
.L38:
        mov     rax, QWORD PTR [rbp-72]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
.L39:
        cmp     QWORD PTR [rbp-80], 0
        je      .L40
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcat
.L40:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-72]
        mov     QWORD PTR [rdx+24], rax
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC4:
        .string "%s%s"
.LC5:
        .string "%s/%s%s"
change_file_name:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 104
        mov     QWORD PTR [rbp-104], rdi
        mov     QWORD PTR [rbp-112], rsi
        mov     rax, QWORD PTR [rbp-104]
        mov     rdx, QWORD PTR [rbp-112]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L42
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        jmp     .L43
.L48:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L44
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L45
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        jmp     .L46
.L45:
        mov     eax, OFFSET FLAT:.LC0
.L46:
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L47
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        add     QWORD PTR [rbp-32], rax
.L47:
        mov     rax, QWORD PTR [rbp-32]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string
        mov     QWORD PTR [rbp-56], rax
        mov     rcx, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rdx], rax
        jmp     .L42
.L44:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
.L43:
        cmp     QWORD PTR [rbp-24], 0
        jne     .L48
.L42:
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    get_file_dir
        mov     QWORD PTR [rbp-64], rax
        cmp     QWORD PTR [rbp-64], 0
        je      .L49
        mov     rax, QWORD PTR [rbp-64]
        jmp     .L50
.L49:
        mov     eax, OFFSET FLAT:.LC0
.L50:
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L51
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        jmp     .L52
.L51:
        mov     eax, OFFSET FLAT:.LC0
.L52:
        mov     QWORD PTR [rbp-80], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rdi, rax
        call    strlen
        add     rax, rbx
        add     rax, 1
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L53
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    strlen
        add     QWORD PTR [rbp-40], rax
.L53:
        mov     rax, QWORD PTR [rbp-40]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-64], 0
        je      .L54
        mov     rax, QWORD PTR [rbp-72]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L54
        mov     rsi, QWORD PTR [rbp-80]
        mov     rcx, QWORD PTR [rbp-112]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-88]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC5
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        jmp     .L55
.L54:
        mov     rcx, QWORD PTR [rbp-80]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-88]
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
.L55:
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-104]
        mov     QWORD PTR [rdx+24], rax
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC6:
        .string "."
.LC7:
        .string ".."
normalize_path:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 432
        mov     QWORD PTR [rbp-424], rdi
        mov     rax, QWORD PTR [rbp-424]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-80], rax
        mov     rax, QWORD PTR [rbp-80]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string
        mov     QWORD PTR [rbp-88], rax
        mov     rax, QWORD PTR [rbp-424]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcpy
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-24], 0
        cmp     QWORD PTR [rbp-80], 0
        je      .L57
        mov     rax, QWORD PTR [rbp-88]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L57
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-96], rax
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC2
        call    create_string
        mov     rdx, QWORD PTR [rbp-96]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-96]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-96]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-96]
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-24], 1
.L57:
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-32], rax
        jmp     .L58
.L72:
        mov     rax, QWORD PTR [rbp-32]
        cmp     rax, QWORD PTR [rbp-80]
        je      .L59
        mov     rdx, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rbp-32]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L60
.L59:
        mov     rax, QWORD PTR [rbp-32]
        cmp     QWORD PTR [rbp-24], rax
        jnb     .L61
        mov     rax, QWORD PTR [rbp-32]
        sub     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-128], rax
        mov     rdx, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rbp-24]
        lea     rcx, [rdx+rax]
        mov     rdx, QWORD PTR [rbp-128]
        lea     rax, [rbp-416]
        mov     rsi, rcx
        mov     rdi, rax
        call    strncpy
        lea     rdx, [rbp-416]
        mov     rax, QWORD PTR [rbp-128]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        lea     rax, [rbp-416]
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L61
        lea     rax, [rbp-416]
        mov     esi, OFFSET FLAT:.LC7
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L63
        cmp     QWORD PTR [rbp-16], 0
        je      .L64
        mov     rax, QWORD PTR [rbp-16]
        cmp     rax, QWORD PTR [rbp-8]
        je      .L64
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC7
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L65
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-144], rax
        mov     esi, 2
        mov     edi, OFFSET FLAT:.LC7
        call    create_string
        mov     rdx, QWORD PTR [rbp-144]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-144]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-144]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-144]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L83
.L65:
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-40], rax
        jmp     .L67
.L69:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-40], rax
.L67:
        cmp     QWORD PTR [rbp-40], 0
        je      .L68
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        cmp     QWORD PTR [rbp-16], rax
        jne     .L69
.L68:
        cmp     QWORD PTR [rbp-40], 0
        je      .L83
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L83
.L64:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L61
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-152], rax
        mov     esi, 2
        mov     edi, OFFSET FLAT:.LC7
        call    create_string
        mov     rdx, QWORD PTR [rbp-152]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-152]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-152]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-152]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L61
.L63:
        lea     rax, [rbp-416]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L61
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-136], rax
        mov     rdx, QWORD PTR [rbp-128]
        lea     rax, [rbp-416]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-136]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     QWORD PTR [rax+8], 0
        cmp     QWORD PTR [rbp-16], 0
        je      .L71
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-136]
        mov     QWORD PTR [rax+8], rdx
.L71:
        mov     rax, QWORD PTR [rbp-136]
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L61
        mov     rax, QWORD PTR [rbp-136]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L61
.L83:
        nop
.L61:
        mov     rax, QWORD PTR [rbp-32]
        add     rax, 1
        mov     QWORD PTR [rbp-24], rax
.L60:
        add     QWORD PTR [rbp-32], 1
.L58:
        mov     rax, QWORD PTR [rbp-32]
        cmp     QWORD PTR [rbp-80], rax
        jnb     .L72
        mov     rax, QWORD PTR [rbp-424]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        cmp     QWORD PTR [rbp-16], 0
        je      .L73
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     esi, 46
        mov     rdi, rax
        call    strrchr
        mov     QWORD PTR [rbp-104], rax
        cmp     QWORD PTR [rbp-104], 0
        je      .L74
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-104], rax
        je      .L74
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-104]
        sub     rdx, rax
        mov     QWORD PTR [rbp-112], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-424]
        mov     QWORD PTR [rdx+16], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-424]
        mov     QWORD PTR [rdx+8], rax
        jmp     .L76
.L74:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+8], 0
        jmp     .L76
.L73:
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+16], 0
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+8], 0
.L76:
        mov     QWORD PTR [rbp-48], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-56], rax
        mov     QWORD PTR [rbp-64], 0
        jmp     .L77
.L78:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    strlen
        add     QWORD PTR [rbp-48], rax
        add     QWORD PTR [rbp-64], 1
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-56], rax
.L77:
        cmp     QWORD PTR [rbp-56], 0
        jne     .L78
        cmp     QWORD PTR [rbp-64], 1
        jbe     .L79
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-48]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR [rbp-48], rax
.L79:
        mov     rax, QWORD PTR [rbp-48]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string
        mov     QWORD PTR [rbp-120], rax
        mov     rax, QWORD PTR [rbp-120]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-56], rax
        mov     BYTE PTR [rbp-65], 1
        jmp     .L80
.L82:
        cmp     BYTE PTR [rbp-65], 0
        jne     .L81
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L81
        mov     rax, QWORD PTR [rbp-120]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L81
        mov     rax, QWORD PTR [rbp-120]
        mov     rdi, rax
        call    strlen
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-120]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L81
        mov     rax, QWORD PTR [rbp-120]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-120]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L81:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-120]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcat
        mov     BYTE PTR [rbp-65], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-56], rax
.L80:
        cmp     QWORD PTR [rbp-56], 0
        jne     .L82
        mov     rax, QWORD PTR [rbp-120]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-120]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-424]
        mov     QWORD PTR [rdx+24], rax
        nop
        leave
        ret

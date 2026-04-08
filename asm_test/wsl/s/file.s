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
        mov     esi, 0
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
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string_not_check
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-8], rax
        mov     QWORD PTR [rbp-16], 0
        jmp     .L6
.L10:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 92
        jne     .L7
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        mov     BYTE PTR [rax], 47
.L7:
        cmp     QWORD PTR [rbp-16], 1
        jbe     .L8
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L8
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 46
        jne     .L8
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax-2]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L8
        mov     rax, QWORD PTR [rbp-8]
        sub     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-16]
        lea     rcx, [rdx+1]
        mov     rdx, QWORD PTR [rbp-40]
        lea     rsi, [rcx+rdx]
        mov     rdx, QWORD PTR [rbp-16]
        lea     rcx, [rdx-1]
        mov     rdx, QWORD PTR [rbp-40]
        add     rcx, rdx
        mov     rdx, rax
        mov     rdi, rcx
        call    memmove
        sub     QWORD PTR [rbp-8], 2
        sub     QWORD PTR [rbp-16], 2
.L8:
        cmp     QWORD PTR [rbp-16], 0
        je      .L9
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L9
        mov     rax, QWORD PTR [rbp-16]
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L9
        mov     rax, QWORD PTR [rbp-8]
        sub     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-16]
        lea     rcx, [rdx+1]
        mov     rdx, QWORD PTR [rbp-40]
        lea     rsi, [rcx+rdx]
        mov     rcx, QWORD PTR [rbp-40]
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
        cmp     QWORD PTR [rbp-8], 1
        jbe     .L11
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 64
        jle     .L11
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 90
        jg      .L11
        mov     rax, QWORD PTR [rbp-40]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 58
        jne     .L11
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     edi, eax
        call    to_lower
        mov     rdx, QWORD PTR [rbp-40]
        mov     BYTE PTR [rdx], al
        mov     rax, QWORD PTR [rbp-40]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    memmove
        mov     rax, QWORD PTR [rbp-40]
        mov     BYTE PTR [rax], 47
        mov     rax, QWORD PTR [rbp-40]
        add     rax, 2
        mov     BYTE PTR [rax], 47
        mov     rax, QWORD PTR [rbp-40]
        jmp     .L12
.L11:
        cmp     QWORD PTR [rbp-8], 1
        jbe     .L13
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 64
        jle     .L13
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 90
        jg      .L13
        mov     rax, QWORD PTR [rbp-40]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 58
        jne     .L13
        mov     rax, QWORD PTR [rbp-40]
        jmp     .L12
.L13:
        cmp     QWORD PTR [rbp-8], 0
        je      .L14
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L14
        mov     rax, QWORD PTR [rbp-40]
        jmp     .L12
.L14:
        cmp     QWORD PTR [rbp-48], 0
        jne     .L15
        call    get_cwd
        mov     QWORD PTR [rbp-48], rax
.L15:
        cmp     QWORD PTR [rbp-48], 0
        jne     .L16
        mov     rax, QWORD PTR [rbp-40]
        jmp     .L12
.L16:
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        mov     rdx, QWORD PTR [rbp-8]
        add     rax, rdx
        add     rax, 2
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string_not_check
        mov     QWORD PTR [rbp-32], rax
        mov     rcx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     esi, 0
        mov     rdi, rax
        call    absolute_path
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
        jne     .L22
        mov     eax, 0
        jmp     .L23
.L22:
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        jmp     .L24
.L26:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L25
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        add     QWORD PTR [rbp-8], rax
        add     QWORD PTR [rbp-16], 1
.L25:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
.L24:
        cmp     QWORD PTR [rbp-24], 0
        jne     .L26
        cmp     QWORD PTR [rbp-16], 0
        jne     .L27
        mov     eax, 0
        jmp     .L23
.L27:
        cmp     QWORD PTR [rbp-16], 1
        jbe     .L28
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR [rbp-8], rax
.L28:
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string_not_check
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        mov     BYTE PTR [rbp-25], 1
        jmp     .L29
.L32:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L30
        cmp     BYTE PTR [rbp-25], 0
        jne     .L31
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L31
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L31
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L31
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L31:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcat
        mov     BYTE PTR [rbp-25], 0
.L30:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
.L29:
        cmp     QWORD PTR [rbp-24], 0
        jne     .L32
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
.L23:
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
        .string "%s/%s%s"
.LC4:
        .string "%s%s"
rebuild_full_path:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 72
        mov     QWORD PTR [rbp-72], rdi
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    get_file_dir
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        je      .L36
        mov     rax, QWORD PTR [rbp-32]
        jmp     .L37
.L36:
        mov     eax, OFFSET FLAT:.LC0
.L37:
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L38
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+8]
        jmp     .L39
.L38:
        mov     eax, OFFSET FLAT:.LC0
.L39:
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
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L40
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        add     QWORD PTR [rbp-24], rax
.L40:
        mov     rax, QWORD PTR [rbp-24]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string_not_check
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-32], 0
        je      .L41
        mov     rax, QWORD PTR [rbp-40]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L41
        mov     rax, QWORD PTR [rbp-72]
        mov     rcx, QWORD PTR [rax+16]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-56]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        jmp     .L42
.L41:
        mov     rax, QWORD PTR [rbp-72]
        mov     rdx, QWORD PTR [rax+16]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
.L42:
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
change_file_extension:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    rebuild_full_path
        nop
        leave
        ret
change_file_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L45
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L46
.L51:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L47
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L48
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        jmp     .L49
.L48:
        mov     eax, OFFSET FLAT:.LC0
.L49:
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L50
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    strlen
        add     QWORD PTR [rbp-16], rax
.L50:
        mov     rax, QWORD PTR [rbp-16]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string_not_check
        mov     QWORD PTR [rbp-32], rax
        mov     rcx, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx], rax
        jmp     .L45
.L47:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
.L46:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L51
.L45:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    rebuild_full_path
        nop
        leave
        ret
.LC5:
        .string "Warning: Path component too long, truncating to %zu characters\n"
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
        mov     QWORD PTR [rbp-88], rax
        mov     rax, QWORD PTR [rbp-88]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string_not_check
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-424]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcpy
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-16], 0
        mov     QWORD PTR [rbp-24], 0
        cmp     QWORD PTR [rbp-88], 0
        je      .L53
        mov     rax, QWORD PTR [rbp-96]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L53
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-104], rax
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC2
        call    create_string
        mov     rdx, QWORD PTR [rbp-104]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-104]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-24], 1
.L53:
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-32], rax
        jmp     .L54
.L69:
        mov     rax, QWORD PTR [rbp-32]
        cmp     rax, QWORD PTR [rbp-88]
        je      .L55
        mov     rdx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-32]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L56
.L55:
        mov     rax, QWORD PTR [rbp-32]
        cmp     QWORD PTR [rbp-24], rax
        jnb     .L57
        mov     rax, QWORD PTR [rbp-32]
        sub     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 255
        jbe     .L58
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC5
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     QWORD PTR [rbp-40], 255
.L58:
        mov     rdx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-24]
        lea     rcx, [rdx+rax]
        mov     rdx, QWORD PTR [rbp-40]
        lea     rax, [rbp-416]
        mov     rsi, rcx
        mov     rdi, rax
        call    strncpy
        lea     rdx, [rbp-416]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        lea     rax, [rbp-416]
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L57
        lea     rax, [rbp-416]
        mov     esi, OFFSET FLAT:.LC7
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L60
        cmp     QWORD PTR [rbp-16], 0
        je      .L61
        mov     rax, QWORD PTR [rbp-16]
        cmp     rax, QWORD PTR [rbp-8]
        je      .L61
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC7
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L62
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
        jmp     .L80
.L62:
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-48], rax
        jmp     .L64
.L66:
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-48], rax
.L64:
        cmp     QWORD PTR [rbp-48], 0
        je      .L65
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax+8]
        cmp     QWORD PTR [rbp-16], rax
        jne     .L66
.L65:
        cmp     QWORD PTR [rbp-48], 0
        je      .L80
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L80
.L61:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L57
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
        jmp     .L57
.L60:
        lea     rax, [rbp-416]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L57
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-136], rax
        mov     rdx, QWORD PTR [rbp-40]
        lea     rax, [rbp-416]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-136]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-136]
        mov     QWORD PTR [rax+8], 0
        cmp     QWORD PTR [rbp-16], 0
        je      .L68
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-136]
        mov     QWORD PTR [rax+8], rdx
.L68:
        mov     rax, QWORD PTR [rbp-136]
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L57
        mov     rax, QWORD PTR [rbp-136]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L57
.L80:
        nop
.L57:
        mov     rax, QWORD PTR [rbp-32]
        add     rax, 1
        mov     QWORD PTR [rbp-24], rax
.L56:
        add     QWORD PTR [rbp-32], 1
.L54:
        mov     rax, QWORD PTR [rbp-32]
        cmp     QWORD PTR [rbp-88], rax
        jnb     .L69
        mov     rax, QWORD PTR [rbp-424]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        cmp     QWORD PTR [rbp-16], 0
        je      .L70
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     esi, 46
        mov     rdi, rax
        call    strrchr
        mov     QWORD PTR [rbp-112], rax
        cmp     QWORD PTR [rbp-112], 0
        je      .L71
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-112], rax
        je      .L71
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-112]
        sub     rdx, rax
        mov     QWORD PTR [rbp-120], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-120]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-424]
        mov     QWORD PTR [rdx+16], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-424]
        mov     QWORD PTR [rdx+8], rax
        jmp     .L73
.L71:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+8], 0
        jmp     .L73
.L70:
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+16], 0
        mov     rax, QWORD PTR [rbp-424]
        mov     QWORD PTR [rax+8], 0
.L73:
        mov     QWORD PTR [rbp-56], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-64], rax
        mov     QWORD PTR [rbp-72], 0
        jmp     .L74
.L75:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    strlen
        add     QWORD PTR [rbp-56], rax
        add     QWORD PTR [rbp-72], 1
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-64], rax
.L74:
        cmp     QWORD PTR [rbp-64], 0
        jne     .L75
        cmp     QWORD PTR [rbp-72], 1
        jbe     .L76
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR [rbp-56], rax
.L76:
        mov     rax, QWORD PTR [rbp-56]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        call    create_string_not_check
        mov     QWORD PTR [rbp-128], rax
        mov     rax, QWORD PTR [rbp-128]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-64], rax
        mov     BYTE PTR [rbp-73], 1
        jmp     .L77
.L79:
        cmp     BYTE PTR [rbp-73], 0
        jne     .L78
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L78
        mov     rax, QWORD PTR [rbp-128]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L78
        mov     rax, QWORD PTR [rbp-128]
        mov     rdi, rax
        call    strlen
        lea     rdx, [rax-1]
        mov     rax, QWORD PTR [rbp-128]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L78
        mov     rax, QWORD PTR [rbp-128]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-128]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L78:
        mov     rax, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-128]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcat
        mov     BYTE PTR [rbp-73], 0
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-64], rax
.L77:
        cmp     QWORD PTR [rbp-64], 0
        jne     .L79
        mov     rax, QWORD PTR [rbp-128]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-128]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_string
        mov     rdx, QWORD PTR [rbp-424]
        mov     QWORD PTR [rdx+24], rax
        nop
        leave
        ret

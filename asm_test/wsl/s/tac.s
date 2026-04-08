create_attribute_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+16], 0
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string "[Warning] Unsupported type for size lookup: %s\n"
get_type_size:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-8], 8
        cmp     QWORD PTR [rbp-24], 0
        jne     .L4
        mov     QWORD PTR [rbp-8], 0
        jmp     .L5
.L4:
        mov     rax, QWORD PTR name_int[rip]
        cmp     QWORD PTR [rbp-24], rax
        je      .L6
        mov     rax, QWORD PTR name_float[rip]
        cmp     QWORD PTR [rbp-24], rax
        je      .L6
        mov     rax, QWORD PTR name_string[rip]
        cmp     QWORD PTR [rbp-24], rax
        jne     .L7
.L6:
        mov     QWORD PTR [rbp-8], 8
        jmp     .L5
.L7:
        mov     rax, QWORD PTR name_bool[rip]
        cmp     QWORD PTR [rbp-24], rax
        je      .L8
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR [rbp-24], rax
        jne     .L9
.L8:
        mov     QWORD PTR [rbp-8], 1
        jmp     .L5
.L9:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L10
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax+24]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L5
.L10:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L5:
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
is_assignment_operator:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi
        cmp     DWORD PTR [rbp-4], 13
        je      .L13
        cmp     DWORD PTR [rbp-4], 14
        je      .L13
        cmp     DWORD PTR [rbp-4], 15
        je      .L13
        cmp     DWORD PTR [rbp-4], 16
        je      .L13
        cmp     DWORD PTR [rbp-4], 17
        je      .L13
        cmp     DWORD PTR [rbp-4], 18
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
        mov     DWORD PTR [rbp-4], edi
        cmp     DWORD PTR [rbp-4], 18
        ja      .L18
        mov     eax, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR .L20[0+rax*8]
        jmp     rax
.L20:
        .quad   .L24
        .quad   .L23
        .quad   .L22
        .quad   .L21
        .quad   .L19
        .quad   .L33
        .quad   .L32
        .quad   .L31
        .quad   .L30
        .quad   .L29
        .quad   .L28
        .quad   .L27
        .quad   .L26
        .quad   .L25
        .quad   .L24
        .quad   .L23
        .quad   .L22
        .quad   .L21
        .quad   .L19
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
        sub     rsp, 16
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+16], rax
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+24], rax
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_tac_status:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     edi, 96
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+16], 0
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+32], rax
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+40], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+48], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+56], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+64], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+72], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+80], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+88], 0
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_subroutine:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+16], rax
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+24], rax
        call    create_list
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx+32], rax
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_block:
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
search_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR [rbp-88], rdi
        mov     QWORD PTR [rbp-96], rsi
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L44
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L44
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        jmp     .L45
.L47:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-88], rax
        jne     .L45
        mov     rax, QWORD PTR [rbp-16]
        jmp     .L46
.L45:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L47
.L44:
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L48
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L48
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        jmp     .L49
.L50:
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-88], rax
        jne     .L49
        mov     rax, QWORD PTR [rbp-32]
        jmp     .L46
.L49:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L50
.L48:
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+24]
        test    rax, rax
        je      .L51
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L51
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-40], rax
        jmp     .L52
.L55:
        mov     rax, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jne     .L52
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L52
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-56], rax
        jmp     .L53
.L54:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-88], rax
        jne     .L53
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        jmp     .L46
.L53:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-64], rax
        cmp     QWORD PTR [rbp-64], 0
        jne     .L54
.L52:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L55
.L51:
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L56
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-72], rax
        jmp     .L57
.L58:
        mov     rax, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-88], rax
        jne     .L57
        mov     rax, QWORD PTR [rbp-80]
        jmp     .L46
.L57:
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L58
.L56:
        mov     eax, 0
.L46:
        leave
        ret
.LC1:
        .string ""
.LC2:
        .string "$%u-error"
.LC3:
        .string "$%c%zu"
create_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     DWORD PTR [rbp-52], edx
        mov     QWORD PTR [rbp-64], rcx
        cmp     QWORD PTR [rbp-40], 0
        je      .L60
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L61
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+24]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax+24], rdx
.L61:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_var
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L62
        mov     rax, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+24], rdx
.L62:
        cmp     QWORD PTR [rbp-24], 0
        je      .L60
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L63
.L60:
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        mov     eax, DWORD PTR [rbp-52]
        sub     eax, 97
        cmp     eax, 21
        ja      .L64
        mov     eax, eax
        mov     rax, QWORD PTR .L66[0+rax*8]
        jmp     rax
.L66:
        .quad   .L71
        .quad   .L70
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L69
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L68
        .quad   .L64
        .quad   .L64
        .quad   .L64
        .quad   .L67
        .quad   .L64
        .quad   .L65
.L71:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+48]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rdx+48], rcx
        mov     QWORD PTR [rbp-16], rax
        jmp     .L72
.L68:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+56]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rdx+56], rcx
        mov     QWORD PTR [rbp-16], rax
        jmp     .L72
.L65:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+64]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rdx+64], rcx
        mov     QWORD PTR [rbp-16], rax
        jmp     .L72
.L67:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+72]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rdx+72], rcx
        mov     QWORD PTR [rbp-16], rax
        jmp     .L72
.L70:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+80]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rdx+80], rcx
        mov     QWORD PTR [rbp-16], rax
        jmp     .L72
.L69:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+88]
        lea     rcx, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rdx+88], rcx
        mov     QWORD PTR [rbp-16], rax
        jmp     .L72
.L64:
        mov     QWORD PTR [rbp-16], -1
        nop
.L72:
        mov     esi, 32
        mov     edi, OFFSET FLAT:.LC1
        call    create_string
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rdx+8], rax
        cmp     QWORD PTR [rbp-16], -1
        jne     .L73
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        mov     edx, DWORD PTR [rbp-52]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        jmp     .L74
.L73:
        mov     eax, DWORD PTR [rbp-52]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        mov     rcx, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
.L74:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        cmp     DWORD PTR [rbp-52], 116
        je      .L75
        cmp     DWORD PTR [rbp-52], 118
        jne     .L76
.L75:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+24]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L76:
        mov     rax, QWORD PTR [rbp-32]
.L63:
        leave
        ret
.LC4:
        .string "Error: create_attribute received NULL table\n"
.LC5:
        .string "Error: create_attribute received NULL table or attributes list\n"
create_attribute:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     QWORD PTR [rbp-56], r8
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-56]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     edx, 97
        mov     rdi, rax
        call    create_var
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        cmp     QWORD PTR [rbp-48], 0
        jne     .L78
        cmp     QWORD PTR [rbp-40], 0
        je      .L78
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    get_type_size
        mov     rdx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rdx+16]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        jmp     .L79
.L78:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L79
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 44
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
.L79:
        cmp     QWORD PTR [rbp-40], 0
        je      .L80
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L81
.L80:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 63
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC5
        call    fwrite
        jmp     .L82
.L81:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L82:
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_instruction:
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
.LC6:
        .string "[Warning] Unsupported argument type for create_arg: %u\n"
create_arg:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+16], edx
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        cmp     DWORD PTR [rbp-20], 8
        ja      .L87
        mov     eax, DWORD PTR [rbp-20]
        mov     rax, QWORD PTR .L89[0+rax*8]
        jmp     rax
.L89:
        .quad   .L96
        .quad   .L95
        .quad   .L94
        .quad   .L93
        .quad   .L92
        .quad   .L91
        .quad   .L90
        .quad   .L88
        .quad   .L88
.L96:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L97
.L95:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        mov     rdx, QWORD PTR name_int[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L97
.L94:
        mov     rax, QWORD PTR [rbp-32]
        movsd   xmm0, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        movsd   QWORD PTR [rax], xmm0
        mov     rdx, QWORD PTR name_float[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L97
.L93:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        mov     rdx, QWORD PTR name_string[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L97
.L92:
        mov     rax, QWORD PTR [rbp-32]
        movzx   edx, BYTE PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     BYTE PTR [rax], dl
        mov     rdx, QWORD PTR name_bool[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L97
.L91:
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], 0
        mov     rdx, QWORD PTR name_void[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L97
.L90:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L97
.L88:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L97
.L87:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L97:
        mov     rax, QWORD PTR [rbp-8]
        mov     BYTE PTR [rax+20], 0
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
load_rvalue:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        cmp     QWORD PTR [rbp-24], 0
        jne     .L100
        mov     eax, 0
        jmp     .L101
.L100:
        mov     rax, QWORD PTR [rbp-24]
        movzx   eax, BYTE PTR [rax+20]
        test    al, al
        je      .L102
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-8]
        mov     ecx, 0
        mov     rsi, rax
        mov     edi, 23
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-8]
        jmp     .L101
.L102:
        mov     rax, QWORD PTR [rbp-24]
.L101:
        leave
        ret
.LC7:
        .string "main"
tac_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        call    create_tac
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    create_tac_status
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        jmp     .L104
.L107:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 1
        jne     .L105
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_function
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     esi, OFFSET FLAT:.LC7
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L104
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L104
.L105:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 2
        jne     .L106
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_class
        jmp     .L104
.L106:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+8]
        test    eax, eax
        jne     .L104
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rcx, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    tac_import
.L104:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L107
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC8:
        .string "[Warning] Unsupported symbol kind for import: %u\n"
tac_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 3
        jne     .L110
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     edx, 118
        mov     rdi, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L115
.L110:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 1
        je      .L112
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 2
        jne     .L113
.L112:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     edx, 102
        mov     rdi, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L115
.L113:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L114
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+24]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_class
        jmp     .L115
.L114:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     edx, DWORD PTR [rax+32]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC8
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L115:
        nop
        leave
        ret
tac_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     rax, QWORD PTR [rbp-56]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_subroutine
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        jmp     .L117
.L118:
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 112
        mov     rdi, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L117:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L118
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-40], rax
        jmp     .L119
.L120:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_statement
.L119:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
        jne     .L120
        mov     rax, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax+8], 0
        nop
        leave
        ret
.LC9:
        .string "[Warning] Constructor '%s' does not start with 'self' initialization\n"
tac_method:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 88
        mov     QWORD PTR [rbp-88], rdi
        mov     QWORD PTR [rbp-96], rsi
        mov     rax, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_subroutine
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-96]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+24]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-32], rax
        jmp     .L122
.L123:
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-96]
        mov     rcx, rdx
        mov     edx, 112
        mov     rdi, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L122:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L123
        mov     rax, QWORD PTR [rbp-96]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-96]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-56], rax
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L128
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     eax, DWORD PTR [rax+8]
        test    eax, eax
        jne     .L125
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 19
        jne     .L125
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 8
        jne     .L125
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR [rax+16]
        test    eax, eax
        je      .L126
.L125:
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC9
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L121
.L126:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rax+24]
        add     rax, 24
        mov     rsi, rax
        mov     edi, 1
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-72]
        mov     rcx, rdx
        mov     edx, 118
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     ecx, 0
        mov     rdx, rbx
        mov     rsi, rax
        mov     edi, 18
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L128
.L129:
        mov     rdx, QWORD PTR [rbp-96]
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_statement
.L128:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L129
        mov     rax, QWORD PTR [rbp-96]
        mov     QWORD PTR [rax+8], 0
.L121:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC10:
        .string "[Warning] Unsupported class member type for tac_class: %u\n"
tac_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     rax, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    create_attribute_table
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L131
.L135:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+8]
        test    eax, eax
        je      .L132
        cmp     eax, 1
        je      .L133
        jmp     .L136
.L132:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_method
        jmp     .L131
.L133:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-48]
        mov     edx, 1
        mov     rsi, rcx
        mov     rdi, rax
        call    tac_variable
        jmp     .L131
.L136:
        mov     rax, QWORD PTR [rbp-24]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC10
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L131:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L135
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+24], 0
        nop
        leave
        ret
tac_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     eax, edx
        mov     BYTE PTR [rbp-52], al
        mov     QWORD PTR [rbp-16], 0
        cmp     BYTE PTR [rbp-52], 0
        je      .L138
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_pop_back
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-24]
        mov     r8, rcx
        mov     ecx, 0
        mov     rdi, rax
        call    create_attribute
        jmp     .L142
.L138:
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 118
        mov     rdi, rax
        call    create_var
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L140
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-8], rax
        jmp     .L141
.L140:
        mov     QWORD PTR [rbp-32], 0
        lea     rax, [rbp-32]
        mov     rsi, rax
        mov     edi, 1
        call    create_arg
        mov     QWORD PTR [rbp-8], rax
.L141:
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     ecx, 0
        mov     rdx, rax
        mov     edi, 14
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L142:
        nop
        leave
        ret
.LC11:
        .string "[Warning] 'break' statement used outside of loop\n"
.LC12:
        .string "[Warning] 'continue' statement used outside of loop\n"
.LC13:
        .string "[Warning] Unsupported statement type for tac_statement: %u\n"
tac_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     rax, QWORD PTR [rbp-56]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 7
        ja      .L144
        mov     eax, eax
        mov     rax, QWORD PTR .L146[0+rax*8]
        jmp     rax
.L146:
        .quad   .L153
        .quad   .L152
        .quad   .L151
        .quad   .L150
        .quad   .L149
        .quad   .L148
        .quad   .L147
        .quad   .L145
.L153:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        jmp     .L154
.L152:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-64]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    tac_variable
        jmp     .L154
.L151:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_if
        jmp     .L154
.L150:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_while
        jmp     .L154
.L149:
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_for
        jmp     .L154
.L148:
        mov     esi, 0
        mov     edi, 5
        call    create_arg
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L155
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-8], rax
.L155:
        mov     rax, QWORD PTR [rbp-8]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 21
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L154
.L147:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+32]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L156
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+32]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        je      .L156
        mov     rax, QWORD PTR [rbp-32]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L154
.L156:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 49
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC11
        call    fwrite
        jmp     .L154
.L145:
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+40]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L157
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+40]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        je      .L157
        mov     rax, QWORD PTR [rbp-16]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L154
.L157:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 52
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC12
        call    fwrite
        jmp     .L154
.L144:
        mov     rax, QWORD PTR [rbp-56]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC13
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L154:
        nop
        leave
        ret
tac_if:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 184
        mov     QWORD PTR [rbp-184], rdi
        mov     QWORD PTR [rbp-192], rsi
        mov     rax, QWORD PTR [rbp-192]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-24], rax
        mov     QWORD PTR [rbp-32], 0
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L159
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L159
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-32], rax
        jmp     .L160
.L159:
        mov     rax, QWORD PTR [rbp-192]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-32], rax
.L160:
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rbx
        mov     rsi, rax
        mov     edi, 19
        call    create_instruction
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-192]
        mov     rdx, QWORD PTR [rbp-72]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-80], rax
        jmp     .L161
.L162:
        mov     rdx, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_statement
.L161:
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L162
        mov     rax, QWORD PTR [rbp-48]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L163
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-104], rax
        jmp     .L164
.L168:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-120], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-120]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-192]
        mov     rdx, QWORD PTR [rbp-120]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-192]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L165
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L165
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rbp-24], rax
.L165:
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rbx
        mov     rsi, rax
        mov     edi, 19
        call    create_instruction
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-192]
        mov     rdx, QWORD PTR [rbp-72]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-128], rax
        jmp     .L166
.L167:
        mov     rdx, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rbp-136]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_statement
.L166:
        mov     rax, QWORD PTR [rbp-128]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-136], rax
        cmp     QWORD PTR [rbp-136], 0
        jne     .L167
        mov     rax, QWORD PTR [rbp-48]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L164:
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-112], rax
        cmp     QWORD PTR [rbp-112], 0
        jne     .L168
.L163:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        jne     .L169
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-144], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-144]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-192]
        mov     rdx, QWORD PTR [rbp-144]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-152], rax
        jmp     .L170
.L171:
        mov     rdx, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rbp-160]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_statement
.L170:
        mov     rax, QWORD PTR [rbp-152]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-160], rax
        cmp     QWORD PTR [rbp-160], 0
        jne     .L171
        mov     rax, QWORD PTR [rbp-48]
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L169:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-168], rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-168]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-192]
        mov     rdx, QWORD PTR [rbp-168]
        mov     QWORD PTR [rax+16], rdx
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
tac_for:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 152
        mov     QWORD PTR [rbp-152], rdi
        mov     QWORD PTR [rbp-160], rsi
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L173
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-160]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    tac_variable
.L173:
        mov     rax, QWORD PTR [rbp-160]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L174
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-160]
        mov     rdx, QWORD PTR [rbp-72]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-160]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-80], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-80]
        mov     rcx, rbx
        mov     rsi, rax
        mov     edi, 19
        call    create_instruction
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L175
.L174:
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L175:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-88], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-160]
        mov     rdx, QWORD PTR [rbp-88]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-160]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L176
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L177
.L176:
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L178
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        jmp     .L177
.L178:
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L177:
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-104], rax
        jmp     .L179
.L180:
        mov     rdx, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_statement
.L179:
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-112], rax
        cmp     QWORD PTR [rbp-112], 0
        jne     .L180
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+40]
        mov     rdi, rax
        call    list_pop_back
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+32]
        mov     rdi, rax
        call    list_pop_back
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L181
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-120], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-120]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-96]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-128], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-128]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-160]
        mov     rdx, QWORD PTR [rbp-128]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-160]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
.L181:
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-152]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L182
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-24], rax
.L182:
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-136], rax
        mov     rax, QWORD PTR [rbp-160]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-136]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-160]
        mov     rdx, QWORD PTR [rbp-136]
        mov     QWORD PTR [rax+16], rdx
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
tac_while:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 104
        mov     QWORD PTR [rbp-104], rdi
        mov     QWORD PTR [rbp-112], rsi
        mov     rax, QWORD PTR [rbp-112]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-112]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-112]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rcx, rax
        mov     edx, 98
        mov     esi, 0
        mov     edi, 0
        call    create_var
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rbx
        mov     rsi, rax
        mov     edi, 19
        call    create_instruction
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-112]
        mov     rdx, QWORD PTR [rbp-72]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+40]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-80], rax
        jmp     .L184
.L185:
        mov     rdx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_statement
.L184:
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L185
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+40]
        mov     rdi, rax
        call    list_pop_back
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+32]
        mov     rdi, rax
        call    list_pop_back
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, 6
        call    create_arg
        mov     ecx, 0
        mov     edx, 0
        mov     rsi, rax
        mov     edi, 20
        call    create_instruction
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    create_block
        mov     QWORD PTR [rbp-96], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+32]
        mov     rdx, QWORD PTR [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-112]
        mov     rdx, QWORD PTR [rbp-96]
        mov     QWORD PTR [rax+16], rdx
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC14:
        .string "[Warning] Left-hand side of assignment is not a variable\n"
tac_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     rax, QWORD PTR [rbp-72]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 19
        jne     .L187
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_primary
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-56]
        jmp     .L188
.L187:
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     eax, DWORD PTR [rax+24]
        mov     edi, eax
        call    get_instruction_type
        mov     DWORD PTR [rbp-20], eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     eax, DWORD PTR [rax+24]
        mov     edi, eax
        call    is_assignment_operator
        test    al, al
        je      .L189
        cmp     DWORD PTR [rbp-20], 14
        je      .L190
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-48], rax
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    load_rvalue
        mov     rdi, rax
        mov     rdx, QWORD PTR [rbp-8]
        mov     rsi, QWORD PTR [rbp-48]
        mov     eax, DWORD PTR [rbp-20]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     edi, eax
        call    create_instruction
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rbp-8], rax
.L190:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+16]
        test    eax, eax
        je      .L191
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 57
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC14
        call    fwrite
.L191:
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-32]
        mov     ecx, 0
        mov     rsi, rax
        mov     edi, 14
        call    create_instruction
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-32]
        movzx   eax, BYTE PTR [rax+20]
        test    al, al
        je      .L192
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-32]
        mov     ecx, 0
        mov     rsi, rax
        mov     edi, 24
        call    create_instruction
        mov     QWORD PTR [rbp-16], rax
        jmp     .L192
.L189:
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-40], rax
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    load_rvalue
        mov     rdi, rax
        mov     rdx, QWORD PTR [rbp-8]
        mov     rsi, QWORD PTR [rbp-40]
        mov     eax, DWORD PTR [rbp-20]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     edi, eax
        call    create_instruction
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-8], rax
.L192:
        mov     rax, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-8]
.L188:
        leave
        ret
.LC16:
        .string "[Warning] Unsupported type for negation: %s\n"
.LC17:
        .string "[Warning] Unsupported primary type for tac_primary: %u\n"
tac_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR [rbp-104], rdi
        mov     QWORD PTR [rbp-112], rsi
        mov     rax, QWORD PTR [rbp-104]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 8
        ja      .L194
        mov     eax, eax
        mov     rax, QWORD PTR .L196[0+rax*8]
        jmp     rax
.L196:
        .quad   .L204
        .quad   .L203
        .quad   .L202
        .quad   .L201
        .quad   .L200
        .quad   .L199
        .quad   .L198
        .quad   .L197
        .quad   .L195
.L204:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     edx, 10
        mov     esi, 0
        mov     rdi, rax
        call    strtoll
        mov     QWORD PTR [rbp-56], rax
        lea     rax, [rbp-56]
        mov     rsi, rax
        mov     edi, 1
        call    create_arg
        jmp     .L205
.L203:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     esi, 0
        mov     rdi, rax
        call    strtod
        movq    rax, xmm0
        mov     QWORD PTR [rbp-64], rax
        lea     rax, [rbp-64]
        mov     rsi, rax
        mov     edi, 2
        call    create_arg
        jmp     .L205
.L202:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rax
        mov     edi, 3
        call    create_arg
        jmp     .L205
.L201:
        mov     BYTE PTR [rbp-65], 1
        lea     rax, [rbp-65]
        mov     rsi, rax
        mov     edi, 4
        call    create_arg
        jmp     .L205
.L200:
        mov     BYTE PTR [rbp-66], 0
        lea     rax, [rbp-66]
        mov     rsi, rax
        mov     edi, 4
        call    create_arg
        jmp     .L205
.L199:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        jmp     .L205
.L198:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_primary
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR name_bool[rip]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-40], rax
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-40]
        mov     ecx, 0
        mov     rsi, rax
        mov     edi, 13
        call    create_instruction
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-40]
        jmp     .L205
.L197:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_primary
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-24], rax
        mov     QWORD PTR [rbp-8], 0
        mov     QWORD PTR [rbp-80], 0
        movsd   xmm0, QWORD PTR .LC15[rip]
        movsd   QWORD PTR [rbp-88], xmm0
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR name_int[rip]
        cmp     rdx, rax
        jne     .L206
        lea     rax, [rbp-80]
        mov     rsi, rax
        mov     edi, 1
        call    create_arg
        mov     rsi, rax
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rsi
        mov     rsi, rax
        mov     edi, 1
        call    create_instruction
        mov     QWORD PTR [rbp-8], rax
        jmp     .L207
.L206:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR name_float[rip]
        cmp     rdx, rax
        jne     .L208
        lea     rax, [rbp-88]
        mov     rsi, rax
        mov     edi, 2
        call    create_arg
        mov     rsi, rax
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rsi
        mov     rsi, rax
        mov     edi, 2
        call    create_instruction
        mov     QWORD PTR [rbp-8], rax
        jmp     .L207
.L208:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L205
.L207:
        mov     rax, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L205
.L195:
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_variable_access
        jmp     .L205
.L194:
        mov     rax, QWORD PTR [rbp-104]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC17
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
.L205:
        leave
        ret
.LC18:
        .string "[Warning] Unsupported variable access with NULL base\n"
.LC19:
        .string "[Warning] Failed to generate variable access for base\n"
.LC20:
        .string "[Warning] Attempting to access attribute of non-object type: %s\n"
.LC21:
        .string "[Warning] Attribute '%s' not found in type '%s'\n"
.LC22:
        .string "[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
.LC23:
        .string "[Warning] Symbol '%s' in type '%s' is not an attribute\n"
.LC24:
        .string "arr"
.LC25:
        .string "[Warning] Attempting to index non-array type: %s\n"
.LC26:
        .string "[Warning] Failed to generate variable access for index\n"
.LC27:
        .string "[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
.LC28:
        .string "[Warning] Unsupported variable access type for tac_variable_access: %u\n"
tac_variable_access:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 192
        mov     QWORD PTR [rbp-184], rdi
        mov     QWORD PTR [rbp-192], rsi
        mov     rax, QWORD PTR [rbp-184]
        mov     eax, DWORD PTR [rax+16]
        test    eax, eax
        jne     .L211
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L211
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 1
        je      .L212
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 2
        jne     .L213
.L212:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rcx, rdx
        mov     edx, 102
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 7
        call    create_arg
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-40]
        jmp     .L214
.L213:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L215
        mov     rax, QWORD PTR [rbp-184]
        mov     rsi, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rcx, rdx
        mov     edx, 118
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-32]
        jmp     .L214
.L215:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rcx, rdx
        mov     edx, 118
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L214
.L211:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L216
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 53
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC18
        call    fwrite
        mov     eax, 0
        jmp     .L214
.L216:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_variable_access
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L217
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 54
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC19
        call    fwrite
        mov     eax, 0
        jmp     .L214
.L217:
        mov     rax, QWORD PTR [rbp-184]
        mov     eax, DWORD PTR [rax+16]
        cmp     eax, 2
        jne     .L218
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 1
        je      .L219
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 2
        jne     .L220
.L219:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC20
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L220:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+24]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L221
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-16], rax
.L221:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name_use_strcmp
        mov     QWORD PTR [rbp-136], rax
        cmp     QWORD PTR [rbp-136], 0
        jne     .L222
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC21
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L222:
        mov     rax, QWORD PTR [rbp-136]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 1
        jne     .L223
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC22
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-136]
        mov     rsi, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rbp-136]
        mov     rcx, rdx
        mov     edx, 102
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 7
        call    create_arg
        jmp     .L214
.L223:
        mov     rax, QWORD PTR [rbp-136]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 2
        jne     .L224
        mov     rax, QWORD PTR [rbp-136]
        mov     rsi, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rbp-136]
        mov     rcx, rdx
        mov     edx, 102
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 8
        call    create_arg
        jmp     .L214
.L224:
        mov     rax, QWORD PTR [rbp-136]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 5
        je      .L225
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC23
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L225:
        mov     rax, QWORD PTR [rbp-136]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-144], rax
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rcx, rdx
        mov     edx, 97
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     rcx, rax
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-144]
        mov     rsi, rax
        mov     edi, 15
        call    create_instruction
        mov     QWORD PTR [rbp-152], rax
        mov     rax, QWORD PTR [rbp-144]
        mov     BYTE PTR [rax+20], 1
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-152]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-144]
        jmp     .L214
.L218:
        mov     rax, QWORD PTR [rbp-184]
        mov     eax, DWORD PTR [rax+16]
        cmp     eax, 3
        jne     .L226
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     esi, OFFSET FLAT:.LC24
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L227
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC25
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L227:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-112], rax
        cmp     QWORD PTR [rbp-112], 0
        jne     .L228
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 55
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC26
        call    fwrite
        mov     eax, 0
        jmp     .L214
.L228:
        mov     rax, QWORD PTR name_int[rip]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-120], rax
        mov     rcx, QWORD PTR [rbp-112]
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-120]
        mov     rsi, rax
        mov     edi, 16
        call    create_instruction
        mov     QWORD PTR [rbp-128], rax
        mov     rax, QWORD PTR [rbp-120]
        mov     BYTE PTR [rax+20], 1
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-128]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-120]
        jmp     .L214
.L226:
        mov     rax, QWORD PTR [rbp-184]
        mov     eax, DWORD PTR [rax+16]
        cmp     eax, 1
        jne     .L229
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+16]
        test    eax, eax
        jne     .L230
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     eax, DWORD PTR [rax+32]
        test    eax, eax
        jne     .L230
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+24]
        mov     rax, QWORD PTR [rax+16]
        mov     rsi, rdx
        mov     rdi, rax
        call    search_name_use_strcmp
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 102
        mov     rdi, rax
        call    create_var
        mov     rsi, rax
        mov     edi, 8
        call    create_arg
        mov     QWORD PTR [rbp-8], rax
.L230:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+16]
        cmp     eax, 8
        je      .L231
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+16]
        cmp     eax, 7
        je      .L231
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+16]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC27
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L214
.L231:
        mov     QWORD PTR [rbp-160], 0
        call    create_list
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+16]
        cmp     eax, 8
        jne     .L233
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L233
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     r8, rax
        mov     ecx, 0
        mov     edx, 0
        mov     esi, 0
        mov     edi, 8
        call    create_primary
        mov     ecx, 0
        mov     rdx, rax
        mov     esi, 0
        mov     edi, 19
        call    create_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rsi, rax
        mov     rdi, rdx
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    get_type_size
        mov     QWORD PTR [rbp-168], rax
        lea     rax, [rbp-168]
        mov     rsi, rax
        mov     edi, 1
        call    create_arg
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     ecx, 0
        mov     rdx, rax
        mov     edi, 17
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-160]
        add     rax, 1
        mov     QWORD PTR [rbp-160], rax
.L233:
        mov     rax, QWORD PTR [rbp-184]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-72], rax
        jmp     .L234
.L235:
        mov     rdx, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rdx
        mov     rdi, rax
        call    tac_expression
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rsi, rax
        mov     rdi, rdx
        call    load_rvalue
        mov     QWORD PTR [rbp-104], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    get_type_size
        mov     QWORD PTR [rbp-176], rax
        lea     rax, [rbp-176]
        mov     rsi, rax
        mov     edi, 1
        call    create_arg
        mov     rsi, rax
        mov     rax, QWORD PTR [rbp-104]
        mov     ecx, 0
        mov     rdx, rax
        mov     edi, 17
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-160]
        add     rax, 1
        mov     QWORD PTR [rbp-160], rax
.L234:
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L235
        jmp     .L236
.L237:
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
.L236:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L237
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-192]
        mov     rcx, rdx
        mov     edx, 116
        mov     rsi, rax
        mov     edi, 0
        call    create_var
        mov     rsi, rax
        mov     edi, 0
        call    create_arg
        mov     QWORD PTR [rbp-96], rax
        lea     rax, [rbp-160]
        mov     rsi, rax
        mov     edi, 1
        call    create_arg
        mov     rcx, rax
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-96]
        mov     rsi, rax
        mov     edi, 22
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-192]
        mov     rax, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rax+8]
        mov     rsi, rdx
        mov     rdi, rax
        call    list_append
        mov     rax, QWORD PTR [rbp-96]
        jmp     .L214
.L229:
        mov     rax, QWORD PTR [rbp-184]
        mov     edx, DWORD PTR [rax+16]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC28
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
.L214:
        leave
        ret
.LC15:
        .long   0
        .long   -1074790400

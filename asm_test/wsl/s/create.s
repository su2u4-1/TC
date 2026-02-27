.LC0:
        .string "Error creating code member: content is NULL\n"
.LC1:
        .string "Error creating code member: unknown type %d\n"
create_code_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+8], edx
        cmp     DWORD PTR [rbp-20], 0
        jne     .L2
        cmp     QWORD PTR [rbp-32], 0
        je      .L2
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L3
.L2:
        cmp     DWORD PTR [rbp-20], 1
        jne     .L4
        cmp     QWORD PTR [rbp-40], 0
        je      .L4
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        jmp     .L3
.L4:
        cmp     DWORD PTR [rbp-20], 2
        jne     .L5
        cmp     QWORD PTR [rbp-48], 0
        je      .L5
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax], rdx
        jmp     .L3
.L5:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L6
        cmp     QWORD PTR [rbp-40], 0
        jne     .L6
        cmp     QWORD PTR [rbp-48], 0
        jne     .L6
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 44
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC0
        call    fwrite
        jmp     .L7
.L6:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L7:
        mov     eax, 0
        jmp     .L8
.L3:
        mov     rax, QWORD PTR [rbp-8]
.L8:
        leave
        ret
create_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC2:
        .string "Error creating import: name is NULL\n"
create_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        cmp     QWORD PTR [rbp-24], 0
        jne     .L12
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 36
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC2
        call    fwrite
        mov     eax, 0
        jmp     .L13
.L12:
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
.L13:
        leave
        ret
.LC3:
        .string "Error creating function: name or return_type is NULL\n"
create_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     QWORD PTR [rbp-56], r8
        cmp     QWORD PTR [rbp-24], 0
        je      .L15
        cmp     QWORD PTR [rbp-32], 0
        jne     .L16
.L15:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 53
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC3
        call    fwrite
        mov     eax, 0
        jmp     .L17
.L16:
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-8]
.L17:
        leave
        ret
.LC4:
        .string "Error creating method: name or return_type is NULL\n"
create_method:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     QWORD PTR [rbp-56], r8
        cmp     QWORD PTR [rbp-24], 0
        je      .L19
        cmp     QWORD PTR [rbp-32], 0
        jne     .L20
.L19:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 51
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     eax, 0
        jmp     .L21
.L20:
        mov     edi, 40
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-8]
.L21:
        leave
        ret
.LC5:
        .string "Error creating class member: content is NULL\n"
.LC6:
        .string "Error creating class member: unknown type %d\n"
create_class_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+8], edx
        cmp     DWORD PTR [rbp-20], 0
        jne     .L23
        cmp     QWORD PTR [rbp-32], 0
        je      .L23
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L24
.L23:
        cmp     DWORD PTR [rbp-20], 1
        jne     .L25
        cmp     QWORD PTR [rbp-40], 0
        je      .L25
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        jmp     .L24
.L25:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L26
        cmp     QWORD PTR [rbp-40], 0
        jne     .L26
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 45
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC5
        call    fwrite
        jmp     .L27
.L26:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L27:
        mov     eax, 0
        jmp     .L28
.L24:
        mov     rax, QWORD PTR [rbp-8]
.L28:
        leave
        ret
.LC7:
        .string "Error creating class: name is NULL\n"
create_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        cmp     QWORD PTR [rbp-24], 0
        jne     .L30
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 35
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     eax, 0
        jmp     .L31
.L30:
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
.L31:
        leave
        ret
.LC8:
        .string "Error creating variable: type or name is NULL\n"
create_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        cmp     QWORD PTR [rbp-24], 0
        je      .L33
        cmp     QWORD PTR [rbp-32], 0
        jne     .L34
.L33:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 46
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC8
        call    fwrite
        mov     eax, 0
        jmp     .L35
.L34:
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
.L35:
        leave
        ret
.LC9:
        .string "Error creating statement: content is NULL\n"
.LC10:
        .string "Error creating statement: unknown type %d\n"
create_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     QWORD PTR [rbp-56], r8
        mov     QWORD PTR [rbp-64], r9
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+8], edx
        cmp     DWORD PTR [rbp-20], 0
        jne     .L37
        cmp     QWORD PTR [rbp-56], 0
        je      .L37
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L37:
        cmp     DWORD PTR [rbp-20], 1
        jne     .L39
        cmp     QWORD PTR [rbp-64], 0
        je      .L39
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L39:
        cmp     DWORD PTR [rbp-20], 2
        jne     .L40
        cmp     QWORD PTR [rbp-32], 0
        je      .L40
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L40:
        cmp     DWORD PTR [rbp-20], 3
        jne     .L41
        cmp     QWORD PTR [rbp-40], 0
        je      .L41
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L41:
        cmp     DWORD PTR [rbp-20], 4
        jne     .L42
        cmp     QWORD PTR [rbp-48], 0
        je      .L42
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L42:
        cmp     DWORD PTR [rbp-20], 5
        jne     .L43
        cmp     QWORD PTR [rbp-56], 0
        je      .L43
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L43:
        cmp     DWORD PTR [rbp-20], 6
        je      .L44
        cmp     DWORD PTR [rbp-20], 7
        jne     .L45
.L44:
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax], 0
        jmp     .L38
.L45:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L46
        cmp     QWORD PTR [rbp-40], 0
        jne     .L46
        cmp     QWORD PTR [rbp-48], 0
        jne     .L46
        cmp     QWORD PTR [rbp-56], 0
        jne     .L46
        cmp     QWORD PTR [rbp-64], 0
        jne     .L46
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 42
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC9
        call    fwrite
        jmp     .L47
.L46:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC10
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L47:
        mov     eax, 0
        jmp     .L48
.L38:
        mov     rax, QWORD PTR [rbp-8]
.L48:
        leave
        ret
.LC11:
        .string "Error creating if statement: condition is NULL\n"
create_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        cmp     QWORD PTR [rbp-24], 0
        jne     .L50
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 47
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC11
        call    fwrite
        mov     eax, 0
        jmp     .L51
.L50:
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-8]
.L51:
        leave
        ret
.LC12:
        .string "Error creating else-if statement: condition is NULL\n"
create_else_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        cmp     QWORD PTR [rbp-24], 0
        jne     .L53
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 52
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC12
        call    fwrite
        mov     eax, 0
        jmp     .L54
.L53:
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
.L54:
        leave
        ret
create_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC13:
        .string "true"
.LC14:
        .string "false"
.LC15:
        .string "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n"
.LC16:
        .string "Error creating expression: both expr_left and prim_left are NULL\n"
create_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        cmp     DWORD PTR [rbp-20], 19
        sete    dl
        cmp     QWORD PTR [rbp-48], 0
        sete    al
        xor     eax, edx
        test    al, al
        jne     .L60
        cmp     QWORD PTR [rbp-32], 0
        jne     .L61
        cmp     QWORD PTR [rbp-40], 0
        jne     .L61
.L60:
        cmp     QWORD PTR [rbp-48], 0
        jne     .L62
        mov     edi, OFFSET FLAT:.LC13
        jmp     .L63
.L62:
        mov     edi, OFFSET FLAT:.LC14
.L63:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L64
        mov     esi, OFFSET FLAT:.LC13
        jmp     .L65
.L64:
        mov     esi, OFFSET FLAT:.LC14
.L65:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L66
        mov     ecx, OFFSET FLAT:.LC13
        jmp     .L67
.L66:
        mov     ecx, OFFSET FLAT:.LC14
.L67:
        cmp     DWORD PTR [rbp-20], 19
        jne     .L68
        mov     edx, OFFSET FLAT:.LC13
        jmp     .L69
.L68:
        mov     edx, OFFSET FLAT:.LC14
.L69:
        mov     rax, QWORD PTR stderr[rip]
        mov     r9, rdi
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC15
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L70
.L61:
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+24], edx
        cmp     QWORD PTR [rbp-32], 0
        je      .L71
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L72
.L71:
        cmp     QWORD PTR [rbp-40], 0
        je      .L73
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L72
.L73:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 65
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     eax, 0
        jmp     .L70
.L72:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
.L70:
        leave
        ret
.LC17:
        .string "Error creating primary: value is NULL\n"
.LC18:
        .string "Error creating primary: unknown type %d\n"
create_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     QWORD PTR [rbp-56], r8
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+8], edx
        cmp     DWORD PTR [rbp-20], 0
        je      .L75
        cmp     DWORD PTR [rbp-20], 1
        je      .L75
        cmp     DWORD PTR [rbp-20], 2
        je      .L75
        cmp     DWORD PTR [rbp-20], 3
        je      .L75
        cmp     DWORD PTR [rbp-20], 4
        jne     .L76
.L75:
        cmp     QWORD PTR [rbp-32], 0
        je      .L76
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L76:
        cmp     DWORD PTR [rbp-20], 5
        jne     .L78
        cmp     QWORD PTR [rbp-40], 0
        je      .L78
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L78:
        cmp     DWORD PTR [rbp-20], 6
        je      .L79
        cmp     DWORD PTR [rbp-20], 7
        jne     .L80
.L79:
        cmp     QWORD PTR [rbp-48], 0
        je      .L80
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L80:
        cmp     DWORD PTR [rbp-20], 8
        jne     .L81
        cmp     QWORD PTR [rbp-56], 0
        je      .L81
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L81:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L82
        cmp     QWORD PTR [rbp-40], 0
        jne     .L82
        cmp     QWORD PTR [rbp-48], 0
        jne     .L82
        cmp     QWORD PTR [rbp-56], 0
        jne     .L82
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 38
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC17
        call    fwrite
        jmp     .L83
.L82:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L83:
        mov     eax, 0
        jmp     .L84
.L77:
        mov     rax, QWORD PTR [rbp-8]
.L84:
        leave
        ret
.LC19:
        .string "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n"
.LC20:
        .string "Error creating variable access: content is NULL\n"
.LC21:
        .string "Error creating variable access: unknown type %d\n"
create_variable_access:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     QWORD PTR [rbp-56], r8
        cmp     QWORD PTR [rbp-32], 0
        sete    dl
        cmp     DWORD PTR [rbp-20], 0
        sete    al
        xor     eax, edx
        test    al, al
        je      .L86
        cmp     DWORD PTR [rbp-20], 0
        jne     .L87
        mov     ecx, OFFSET FLAT:.LC13
        jmp     .L88
.L87:
        mov     ecx, OFFSET FLAT:.LC14
.L88:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L89
        mov     edx, OFFSET FLAT:.LC13
        jmp     .L90
.L89:
        mov     edx, OFFSET FLAT:.LC14
.L90:
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC19
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L91
.L86:
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+16], edx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        cmp     DWORD PTR [rbp-20], 0
        jne     .L92
        cmp     QWORD PTR [rbp-40], 0
        je      .L92
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L93
.L92:
        cmp     DWORD PTR [rbp-20], 1
        jne     .L94
        cmp     QWORD PTR [rbp-56], 0
        je      .L94
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L93
.L94:
        cmp     DWORD PTR [rbp-20], 3
        jne     .L95
        cmp     QWORD PTR [rbp-48], 0
        je      .L95
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L93
.L95:
        cmp     DWORD PTR [rbp-20], 2
        jne     .L96
        cmp     QWORD PTR [rbp-40], 0
        je      .L96
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L93
.L96:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L97
        cmp     QWORD PTR [rbp-48], 0
        jne     .L97
        cmp     QWORD PTR [rbp-56], 0
        jne     .L97
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 48
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC20
        call    fwrite
        jmp     .L98
.L97:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC21
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L98:
        mov     eax, 0
        jmp     .L91
.L93:
        mov     rax, QWORD PTR [rbp-8]
.L91:
        leave
        ret

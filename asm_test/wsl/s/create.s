.LC0:
        .string "Error creating code member: content is NULL\n"
.LC1:
        .string "Error creating code member: unknown type %u\n"
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
        jmp     .L3
.L6:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L3:
        mov     rax, QWORD PTR [rbp-8]
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
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
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
        jne     .L11
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 36
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC2
        call    fwrite
        mov     eax, 0
        jmp     .L12
.L11:
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
.L12:
        leave
        ret
.LC3:
        .string "Error creating function: name or return_type is NULL\n"
create_function_use_ptr:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     QWORD PTR [rbp-40], r8
        mov     QWORD PTR [rbp-48], r9
        cmp     QWORD PTR [rbp-16], 0
        je      .L14
        cmp     QWORD PTR [rbp-24], 0
        jne     .L15
.L14:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 53
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC3
        call    fwrite
        mov     eax, 0
        jmp     .L16
.L15:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-8]
.L16:
        leave
        ret
.LC4:
        .string "Error creating method: name or return_type is NULL\n"
create_method_use_ptr:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     QWORD PTR [rbp-40], r8
        mov     QWORD PTR [rbp-48], r9
        cmp     QWORD PTR [rbp-16], 0
        je      .L18
        cmp     QWORD PTR [rbp-24], 0
        jne     .L19
.L18:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 51
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     eax, 0
        jmp     .L20
.L19:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+32], rdx
        mov     rax, QWORD PTR [rbp-8]
.L20:
        leave
        ret
.LC5:
        .string "Error creating class member: content is NULL\n"
.LC6:
        .string "Error creating class member: unknown type %u\n"
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
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+8], edx
        cmp     DWORD PTR [rbp-20], 0
        jne     .L22
        cmp     QWORD PTR [rbp-32], 0
        je      .L22
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L23
.L22:
        cmp     DWORD PTR [rbp-20], 1
        jne     .L24
        cmp     QWORD PTR [rbp-40], 0
        je      .L24
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        jmp     .L23
.L24:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L25
        cmp     QWORD PTR [rbp-40], 0
        jne     .L25
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 45
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC5
        call    fwrite
        jmp     .L26
.L25:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L26:
        mov     eax, 0
        jmp     .L27
.L23:
        mov     rax, QWORD PTR [rbp-8]
.L27:
        leave
        ret
.LC7:
        .string "Error creating class: name is NULL\n"
create_class_use_ptr:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     QWORD PTR [rbp-40], r8
        cmp     QWORD PTR [rbp-16], 0
        jne     .L29
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 35
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     eax, 0
        jmp     .L30
.L29:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-8]
.L30:
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
        je      .L32
        cmp     QWORD PTR [rbp-32], 0
        jne     .L33
.L32:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 46
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC8
        call    fwrite
        mov     eax, 0
        jmp     .L34
.L33:
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
.L34:
        leave
        ret
.LC9:
        .string "Error creating statement: content is NULL\n"
.LC10:
        .string "Error creating statement: unknown type %u\n"
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
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+8], edx
        cmp     DWORD PTR [rbp-20], 0
        jne     .L36
        cmp     QWORD PTR [rbp-56], 0
        je      .L36
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L36:
        cmp     DWORD PTR [rbp-20], 1
        jne     .L38
        cmp     QWORD PTR [rbp-64], 0
        je      .L38
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L38:
        cmp     DWORD PTR [rbp-20], 2
        jne     .L39
        cmp     QWORD PTR [rbp-32], 0
        je      .L39
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L39:
        cmp     DWORD PTR [rbp-20], 3
        jne     .L40
        cmp     QWORD PTR [rbp-40], 0
        je      .L40
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L40:
        cmp     DWORD PTR [rbp-20], 4
        jne     .L41
        cmp     QWORD PTR [rbp-48], 0
        je      .L41
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L41:
        cmp     DWORD PTR [rbp-20], 5
        jne     .L42
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L42:
        cmp     DWORD PTR [rbp-20], 6
        je      .L43
        cmp     DWORD PTR [rbp-20], 7
        jne     .L44
.L43:
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], 0
        jmp     .L37
.L44:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L45
        cmp     QWORD PTR [rbp-40], 0
        jne     .L45
        cmp     QWORD PTR [rbp-48], 0
        jne     .L45
        cmp     QWORD PTR [rbp-56], 0
        jne     .L45
        cmp     QWORD PTR [rbp-64], 0
        jne     .L45
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 42
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC9
        call    fwrite
        jmp     .L46
.L45:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC10
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L46:
        mov     eax, 0
        jmp     .L47
.L37:
        mov     rax, QWORD PTR [rbp-8]
.L47:
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
        jne     .L49
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 47
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC11
        call    fwrite
        mov     eax, 0
        jmp     .L50
.L49:
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-8]
.L50:
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
        jne     .L52
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 52
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC12
        call    fwrite
        mov     eax, 0
        jmp     .L53
.L52:
        mov     edi, 16
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
.L53:
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
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
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
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
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
        .string "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n"
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
        jne     .L59
        cmp     QWORD PTR [rbp-32], 0
        jne     .L60
        cmp     QWORD PTR [rbp-40], 0
        jne     .L60
.L59:
        cmp     QWORD PTR [rbp-48], 0
        jne     .L61
        mov     edi, OFFSET FLAT:.LC13
        jmp     .L62
.L61:
        mov     edi, OFFSET FLAT:.LC14
.L62:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L63
        mov     esi, OFFSET FLAT:.LC13
        jmp     .L64
.L63:
        mov     esi, OFFSET FLAT:.LC14
.L64:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L65
        mov     ecx, OFFSET FLAT:.LC13
        jmp     .L66
.L65:
        mov     ecx, OFFSET FLAT:.LC14
.L66:
        cmp     DWORD PTR [rbp-20], 19
        jne     .L67
        mov     edx, OFFSET FLAT:.LC13
        jmp     .L68
.L67:
        mov     edx, OFFSET FLAT:.LC14
.L68:
        mov     rax, QWORD PTR stderr[rip]
        mov     r9, rdi
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC15
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L69
.L60:
        mov     edi, 32
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+24], edx
        cmp     QWORD PTR [rbp-32], 0
        je      .L70
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L71
.L70:
        cmp     QWORD PTR [rbp-40], 0
        je      .L72
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L71
.L72:
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 65
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     eax, 0
        jmp     .L69
.L71:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-8]
.L69:
        leave
        ret
.LC17:
        .string "Error creating primary: value is NULL\n"
.LC18:
        .string "Error creating primary: unknown type %u\n"
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
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+8], edx
        cmp     DWORD PTR [rbp-20], 0
        je      .L74
        cmp     DWORD PTR [rbp-20], 1
        je      .L74
        cmp     DWORD PTR [rbp-20], 2
        je      .L74
        cmp     DWORD PTR [rbp-20], 3
        je      .L74
        cmp     DWORD PTR [rbp-20], 4
        jne     .L75
.L74:
        cmp     QWORD PTR [rbp-32], 0
        je      .L75
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L75:
        cmp     DWORD PTR [rbp-20], 5
        jne     .L77
        cmp     QWORD PTR [rbp-40], 0
        je      .L77
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L77:
        cmp     DWORD PTR [rbp-20], 6
        je      .L78
        cmp     DWORD PTR [rbp-20], 7
        jne     .L79
.L78:
        cmp     QWORD PTR [rbp-48], 0
        je      .L79
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L79:
        cmp     DWORD PTR [rbp-20], 8
        jne     .L80
        cmp     QWORD PTR [rbp-56], 0
        je      .L80
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L80:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L81
        cmp     QWORD PTR [rbp-40], 0
        jne     .L81
        cmp     QWORD PTR [rbp-48], 0
        jne     .L81
        cmp     QWORD PTR [rbp-56], 0
        jne     .L81
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 38
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC17
        call    fwrite
        jmp     .L82
.L81:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L82:
        mov     eax, 0
        jmp     .L83
.L76:
        mov     rax, QWORD PTR [rbp-8]
.L83:
        leave
        ret
.LC19:
        .string "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n"
.LC20:
        .string "Error creating variable access: content is NULL\n"
.LC21:
        .string "Error creating variable access: unknown type %u\n"
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
        je      .L85
        cmp     DWORD PTR [rbp-20], 0
        jne     .L86
        mov     ecx, OFFSET FLAT:.LC13
        jmp     .L87
.L86:
        mov     ecx, OFFSET FLAT:.LC14
.L87:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L88
        mov     edx, OFFSET FLAT:.LC13
        jmp     .L89
.L88:
        mov     edx, OFFSET FLAT:.LC14
.L89:
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC19
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 0
        jmp     .L90
.L85:
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rbp-20]
        mov     DWORD PTR [rax+16], edx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        cmp     DWORD PTR [rbp-20], 0
        jne     .L91
        cmp     QWORD PTR [rbp-40], 0
        je      .L91
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L92
.L91:
        cmp     DWORD PTR [rbp-20], 1
        jne     .L93
        cmp     QWORD PTR [rbp-56], 0
        je      .L93
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L92
.L93:
        cmp     DWORD PTR [rbp-20], 3
        jne     .L94
        cmp     QWORD PTR [rbp-48], 0
        je      .L94
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L92
.L94:
        cmp     DWORD PTR [rbp-20], 2
        jne     .L95
        cmp     QWORD PTR [rbp-40], 0
        je      .L95
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L92
.L95:
        cmp     QWORD PTR [rbp-40], 0
        jne     .L96
        cmp     QWORD PTR [rbp-48], 0
        jne     .L96
        cmp     QWORD PTR [rbp-56], 0
        jne     .L96
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 48
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC20
        call    fwrite
        jmp     .L97
.L96:
        mov     rax, QWORD PTR stderr[rip]
        mov     edx, DWORD PTR [rbp-20]
        mov     esi, OFFSET FLAT:.LC21
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L97:
        mov     eax, 0
        jmp     .L90
.L92:
        mov     rax, QWORD PTR [rbp-8]
.L90:
        leave
        ret

.LC0:
        .ascii "Error creating code member: content is NULL\12\0"
.LC1:
        .ascii "Error creating code member: unknown type %u\12\0"
create_code_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 8[rax], edx
        cmp     DWORD PTR 16[rbp], 0
        jne     .L2
        cmp     QWORD PTR 24[rbp], 0
        je      .L2
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L3
.L2:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L4
        cmp     QWORD PTR 32[rbp], 0
        je      .L4
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L3
.L4:
        cmp     DWORD PTR 16[rbp], 2
        jne     .L5
        cmp     QWORD PTR 40[rbp], 0
        je      .L5
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L3
.L5:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L6
        cmp     QWORD PTR 32[rbp], 0
        jne     .L6
        cmp     QWORD PTR 40[rbp], 0
        jne     .L6
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 44
        mov     edx, 1
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L3
.L6:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC1[rip]
        mov     rdx, rax
        call    fprintf
.L3:
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC2:
        .ascii "Error creating import: name is NULL\12\0"
create_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L11
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 36
        mov     edx, 1
        lea     rax, .LC2[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L12
.L11:
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L12:
        add     rsp, 48
        pop     rbp
        ret
.LC3:
        .ascii "Error creating function: name or return_type is NULL\12\0"
create_function_use_ptr:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 24[rbp], 0
        je      .L14
        cmp     QWORD PTR 32[rbp], 0
        jne     .L15
.L14:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 53
        mov     edx, 1
        lea     rax, .LC3[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L16
.L15:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
.L16:
        add     rsp, 32
        pop     rbp
        ret
.LC4:
        .ascii "Error creating method: name or return_type is NULL\12\0"
create_method_use_ptr:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 24[rbp], 0
        je      .L18
        cmp     QWORD PTR 32[rbp], 0
        jne     .L19
.L18:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 51
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L20
.L19:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
.L20:
        add     rsp, 32
        pop     rbp
        ret
.LC5:
        .ascii "Error creating class member: content is NULL\12\0"
.LC6:
        .ascii "Error creating class member: unknown type %u\12\0"
create_class_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 8[rax], edx
        cmp     DWORD PTR 16[rbp], 0
        jne     .L22
        cmp     QWORD PTR 24[rbp], 0
        je      .L22
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L23
.L22:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L24
        cmp     QWORD PTR 32[rbp], 0
        je      .L24
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L23
.L24:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L25
        cmp     QWORD PTR 32[rbp], 0
        jne     .L25
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 45
        mov     edx, 1
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L26
.L25:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC6[rip]
        mov     rdx, rax
        call    fprintf
.L26:
        mov     eax, 0
        jmp     .L27
.L23:
        mov     rax, QWORD PTR -8[rbp]
.L27:
        add     rsp, 48
        pop     rbp
        ret
.LC7:
        .ascii "Error creating class: name is NULL\12\0"
create_class_use_ptr:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 24[rbp], 0
        jne     .L29
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 35
        mov     edx, 1
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L30
.L29:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
.L30:
        add     rsp, 32
        pop     rbp
        ret
.LC8:
        .ascii "Error creating variable: type or name is NULL\12\0"
create_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        je      .L32
        cmp     QWORD PTR 24[rbp], 0
        jne     .L33
.L32:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 46
        mov     edx, 1
        lea     rax, .LC8[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L34
.L33:
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L34:
        add     rsp, 48
        pop     rbp
        ret
.LC9:
        .ascii "Error creating statement: content is NULL\12\0"
.LC10:
        .ascii "Error creating statement: unknown type %u\12\0"
create_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 8[rax], edx
        cmp     DWORD PTR 16[rbp], 0
        jne     .L36
        cmp     QWORD PTR 48[rbp], 0
        je      .L36
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L36:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L38
        cmp     QWORD PTR 56[rbp], 0
        je      .L38
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L38:
        cmp     DWORD PTR 16[rbp], 2
        jne     .L39
        cmp     QWORD PTR 24[rbp], 0
        je      .L39
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L39:
        cmp     DWORD PTR 16[rbp], 3
        jne     .L40
        cmp     QWORD PTR 32[rbp], 0
        je      .L40
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L40:
        cmp     DWORD PTR 16[rbp], 4
        jne     .L41
        cmp     QWORD PTR 40[rbp], 0
        je      .L41
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L41:
        cmp     DWORD PTR 16[rbp], 5
        jne     .L42
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L37
.L42:
        cmp     DWORD PTR 16[rbp], 6
        je      .L43
        cmp     DWORD PTR 16[rbp], 7
        jne     .L44
.L43:
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        jmp     .L37
.L44:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L45
        cmp     QWORD PTR 32[rbp], 0
        jne     .L45
        cmp     QWORD PTR 40[rbp], 0
        jne     .L45
        cmp     QWORD PTR 48[rbp], 0
        jne     .L45
        cmp     QWORD PTR 56[rbp], 0
        jne     .L45
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 42
        mov     edx, 1
        lea     rax, .LC9[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L46
.L45:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC10[rip]
        mov     rdx, rax
        call    fprintf
.L46:
        mov     eax, 0
        jmp     .L47
.L37:
        mov     rax, QWORD PTR -8[rbp]
.L47:
        add     rsp, 48
        pop     rbp
        ret
.LC11:
        .ascii "Error creating if statement: condition is NULL\12\0"
create_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 16[rbp], 0
        jne     .L49
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 47
        mov     edx, 1
        lea     rax, .LC11[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L50
.L49:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L50:
        add     rsp, 48
        pop     rbp
        ret
.LC12:
        .ascii "Error creating else-if statement: condition is NULL\12\0"
create_else_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L52
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 52
        mov     edx, 1
        lea     rax, .LC12[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L53
.L52:
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L53:
        add     rsp, 48
        pop     rbp
        ret
create_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC13:
        .ascii "true\0"
.LC14:
        .ascii "false\0"
.LC15:
        .ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
.LC16:
        .ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
create_expression:
        push    rbp
        push    r12
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 64
        lea     rbp, 64[rsp]
        mov     DWORD PTR 48[rbp], ecx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR 72[rbp], r9
        cmp     DWORD PTR 48[rbp], 19
        sete    dl
        cmp     QWORD PTR 72[rbp], 0
        sete    al
        xor     eax, edx
        test    al, al
        jne     .L59
        cmp     QWORD PTR 56[rbp], 0
        jne     .L60
        cmp     QWORD PTR 64[rbp], 0
        jne     .L60
.L59:
        cmp     QWORD PTR 72[rbp], 0
        jne     .L61
        lea     rsi, .LC13[rip]
        jmp     .L62
.L61:
        lea     rsi, .LC14[rip]
.L62:
        cmp     QWORD PTR 64[rbp], 0
        jne     .L63
        lea     rbx, .LC13[rip]
        jmp     .L64
.L63:
        lea     rbx, .LC14[rip]
.L64:
        cmp     QWORD PTR 56[rbp], 0
        jne     .L65
        lea     r12, .LC13[rip]
        jmp     .L66
.L65:
        lea     r12, .LC14[rip]
.L66:
        cmp     DWORD PTR 48[rbp], 19
        jne     .L67
        lea     rdi, .LC13[rip]
        jmp     .L68
.L67:
        lea     rdi, .LC14[rip]
.L68:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 40[rsp], rsi
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, r12
        mov     r8, rdi
        lea     rax, .LC15[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L69
.L60:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 48[rbp]
        mov     DWORD PTR 24[rax], edx
        cmp     QWORD PTR 56[rbp], 0
        je      .L70
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L71
.L70:
        cmp     QWORD PTR 64[rbp], 0
        je      .L72
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L71
.L72:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 65
        mov     edx, 1
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L69
.L71:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L69:
        add     rsp, 64
        pop     rbx
        pop     rsi
        pop     rdi
        pop     r12
        pop     rbp
        ret
.LC17:
        .ascii "Error creating primary: value is NULL\12\0"
.LC18:
        .ascii "Error creating primary: unknown type %u\12\0"
create_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 8[rax], edx
        cmp     DWORD PTR 16[rbp], 0
        je      .L74
        cmp     DWORD PTR 16[rbp], 1
        je      .L74
        cmp     DWORD PTR 16[rbp], 2
        je      .L74
        cmp     DWORD PTR 16[rbp], 3
        je      .L74
        cmp     DWORD PTR 16[rbp], 4
        jne     .L75
.L74:
        cmp     QWORD PTR 24[rbp], 0
        je      .L75
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L75:
        cmp     DWORD PTR 16[rbp], 5
        jne     .L77
        cmp     QWORD PTR 32[rbp], 0
        je      .L77
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L77:
        cmp     DWORD PTR 16[rbp], 6
        je      .L78
        cmp     DWORD PTR 16[rbp], 7
        jne     .L79
.L78:
        cmp     QWORD PTR 40[rbp], 0
        je      .L79
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L79:
        cmp     DWORD PTR 16[rbp], 8
        jne     .L80
        cmp     QWORD PTR 48[rbp], 0
        je      .L80
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L76
.L80:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L81
        cmp     QWORD PTR 32[rbp], 0
        jne     .L81
        cmp     QWORD PTR 40[rbp], 0
        jne     .L81
        cmp     QWORD PTR 48[rbp], 0
        jne     .L81
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 38
        mov     edx, 1
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L82
.L81:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC18[rip]
        mov     rdx, rax
        call    fprintf
.L82:
        mov     eax, 0
        jmp     .L83
.L76:
        mov     rax, QWORD PTR -8[rbp]
.L83:
        add     rsp, 48
        pop     rbp
        ret
.LC19:
        .ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
.LC20:
        .ascii "Error creating variable access: content is NULL\12\0"
.LC21:
        .ascii "Error creating variable access: unknown type %u\12\0"
create_variable_access:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 48
        lea     rbp, 48[rsp]
        mov     DWORD PTR 32[rbp], ecx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     QWORD PTR 56[rbp], r9
        cmp     QWORD PTR 40[rbp], 0
        sete    dl
        cmp     DWORD PTR 32[rbp], 0
        sete    al
        xor     eax, edx
        test    al, al
        je      .L85
        cmp     DWORD PTR 32[rbp], 0
        jne     .L86
        lea     rsi, .LC13[rip]
        jmp     .L87
.L86:
        lea     rsi, .LC14[rip]
.L87:
        cmp     QWORD PTR 40[rbp], 0
        jne     .L88
        lea     rbx, .LC13[rip]
        jmp     .L89
.L88:
        lea     rbx, .LC14[rip]
.L89:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC19[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L90
.L85:
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 32[rbp]
        mov     DWORD PTR 16[rax], edx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        cmp     DWORD PTR 32[rbp], 0
        jne     .L91
        cmp     QWORD PTR 48[rbp], 0
        je      .L91
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L92
.L91:
        cmp     DWORD PTR 32[rbp], 1
        jne     .L93
        cmp     QWORD PTR 64[rbp], 0
        je      .L93
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L92
.L93:
        cmp     DWORD PTR 32[rbp], 3
        jne     .L94
        cmp     QWORD PTR 56[rbp], 0
        je      .L94
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L92
.L94:
        cmp     DWORD PTR 32[rbp], 2
        jne     .L95
        cmp     QWORD PTR 48[rbp], 0
        je      .L95
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L92
.L95:
        cmp     QWORD PTR 48[rbp], 0
        jne     .L96
        cmp     QWORD PTR 56[rbp], 0
        jne     .L96
        cmp     QWORD PTR 64[rbp], 0
        jne     .L96
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 48
        mov     edx, 1
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L97
.L96:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 32[rbp]
        mov     r8d, eax
        lea     rax, .LC21[rip]
        mov     rdx, rax
        call    fprintf
.L97:
        mov     eax, 0
        jmp     .L90
.L92:
        mov     rax, QWORD PTR -8[rbp]
.L90:
        add     rsp, 48
        pop     rbx
        pop     rsi
        pop     rbp
        ret

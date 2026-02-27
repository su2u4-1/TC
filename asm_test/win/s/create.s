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
        jmp     .L7
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
.L7:
        mov     eax, 0
        jmp     .L8
.L3:
        mov     rax, QWORD PTR -8[rbp]
.L8:
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
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
        jne     .L12
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
        jmp     .L13
.L12:
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L13:
        add     rsp, 48
        pop     rbp
        ret
.LC3:
        .ascii "Error creating function: name or return_type is NULL\12\0"
create_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 16[rbp], 0
        je      .L15
        cmp     QWORD PTR 24[rbp], 0
        jne     .L16
.L15:
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
        jmp     .L17
.L16:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L17:
        add     rsp, 48
        pop     rbp
        ret
.LC4:
        .ascii "Error creating method: name or return_type is NULL\12\0"
create_method:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 16[rbp], 0
        je      .L19
        cmp     QWORD PTR 24[rbp], 0
        jne     .L20
.L19:
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
        jmp     .L21
.L20:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L21:
        add     rsp, 48
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 8[rax], edx
        cmp     DWORD PTR 16[rbp], 0
        jne     .L23
        cmp     QWORD PTR 24[rbp], 0
        je      .L23
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L24
.L23:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L25
        cmp     QWORD PTR 32[rbp], 0
        je      .L25
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L24
.L25:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L26
        cmp     QWORD PTR 32[rbp], 0
        jne     .L26
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 45
        mov     edx, 1
        lea     rax, .LC5[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L27
.L26:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC6[rip]
        mov     rdx, rax
        call    fprintf
.L27:
        mov     eax, 0
        jmp     .L28
.L24:
        mov     rax, QWORD PTR -8[rbp]
.L28:
        add     rsp, 48
        pop     rbp
        ret
.LC7:
        .ascii "Error creating class: name is NULL\12\0"
create_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        jne     .L30
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
        jmp     .L31
.L30:
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L31:
        add     rsp, 48
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
        je      .L33
        cmp     QWORD PTR 24[rbp], 0
        jne     .L34
.L33:
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
        jmp     .L35
.L34:
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L35:
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 8[rax], edx
        cmp     DWORD PTR 16[rbp], 0
        jne     .L37
        cmp     QWORD PTR 48[rbp], 0
        je      .L37
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L37:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L39
        cmp     QWORD PTR 56[rbp], 0
        je      .L39
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L39:
        cmp     DWORD PTR 16[rbp], 2
        jne     .L40
        cmp     QWORD PTR 24[rbp], 0
        je      .L40
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L40:
        cmp     DWORD PTR 16[rbp], 3
        jne     .L41
        cmp     QWORD PTR 32[rbp], 0
        je      .L41
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L41:
        cmp     DWORD PTR 16[rbp], 4
        jne     .L42
        cmp     QWORD PTR 40[rbp], 0
        je      .L42
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L42:
        cmp     DWORD PTR 16[rbp], 5
        jne     .L43
        cmp     QWORD PTR 48[rbp], 0
        je      .L43
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L38
.L43:
        cmp     DWORD PTR 16[rbp], 6
        je      .L44
        cmp     DWORD PTR 16[rbp], 7
        jne     .L45
.L44:
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR [rax], 0
        jmp     .L38
.L45:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L46
        cmp     QWORD PTR 32[rbp], 0
        jne     .L46
        cmp     QWORD PTR 40[rbp], 0
        jne     .L46
        cmp     QWORD PTR 48[rbp], 0
        jne     .L46
        cmp     QWORD PTR 56[rbp], 0
        jne     .L46
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 42
        mov     edx, 1
        lea     rax, .LC9[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L47
.L46:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC10[rip]
        mov     rdx, rax
        call    fprintf
.L47:
        mov     eax, 0
        jmp     .L48
.L38:
        mov     rax, QWORD PTR -8[rbp]
.L48:
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
        jne     .L50
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
        jmp     .L51
.L50:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L51:
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
        jne     .L53
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
        jmp     .L54
.L53:
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L54:
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -16[rbp]
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
        .ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\12\0"
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
        jne     .L60
        cmp     QWORD PTR 56[rbp], 0
        jne     .L61
        cmp     QWORD PTR 64[rbp], 0
        jne     .L61
.L60:
        cmp     QWORD PTR 72[rbp], 0
        jne     .L62
        lea     rsi, .LC13[rip]
        jmp     .L63
.L62:
        lea     rsi, .LC14[rip]
.L63:
        cmp     QWORD PTR 64[rbp], 0
        jne     .L64
        lea     rbx, .LC13[rip]
        jmp     .L65
.L64:
        lea     rbx, .LC14[rip]
.L65:
        cmp     QWORD PTR 56[rbp], 0
        jne     .L66
        lea     r12, .LC13[rip]
        jmp     .L67
.L66:
        lea     r12, .LC14[rip]
.L67:
        cmp     DWORD PTR 48[rbp], 19
        jne     .L68
        lea     rdi, .LC13[rip]
        jmp     .L69
.L68:
        lea     rdi, .LC14[rip]
.L69:
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
        jmp     .L70
.L61:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 48[rbp]
        mov     DWORD PTR 24[rax], edx
        cmp     QWORD PTR 56[rbp], 0
        je      .L71
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L72
.L71:
        cmp     QWORD PTR 64[rbp], 0
        je      .L73
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L72
.L73:
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
        jmp     .L70
.L72:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L70:
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
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 8[rax], edx
        cmp     DWORD PTR 16[rbp], 0
        je      .L75
        cmp     DWORD PTR 16[rbp], 1
        je      .L75
        cmp     DWORD PTR 16[rbp], 2
        je      .L75
        cmp     DWORD PTR 16[rbp], 3
        je      .L75
        cmp     DWORD PTR 16[rbp], 4
        jne     .L76
.L75:
        cmp     QWORD PTR 24[rbp], 0
        je      .L76
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L76:
        cmp     DWORD PTR 16[rbp], 5
        jne     .L78
        cmp     QWORD PTR 32[rbp], 0
        je      .L78
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L78:
        cmp     DWORD PTR 16[rbp], 6
        je      .L79
        cmp     DWORD PTR 16[rbp], 7
        jne     .L80
.L79:
        cmp     QWORD PTR 40[rbp], 0
        je      .L80
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L80:
        cmp     DWORD PTR 16[rbp], 8
        jne     .L81
        cmp     QWORD PTR 48[rbp], 0
        je      .L81
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L77
.L81:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L82
        cmp     QWORD PTR 32[rbp], 0
        jne     .L82
        cmp     QWORD PTR 40[rbp], 0
        jne     .L82
        cmp     QWORD PTR 48[rbp], 0
        jne     .L82
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 38
        mov     edx, 1
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L83
.L82:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC18[rip]
        mov     rdx, rax
        call    fprintf
.L83:
        mov     eax, 0
        jmp     .L84
.L77:
        mov     rax, QWORD PTR -8[rbp]
.L84:
        add     rsp, 48
        pop     rbp
        ret
.LC19:
        .ascii "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\12\0"
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
        je      .L86
        cmp     DWORD PTR 32[rbp], 0
        jne     .L87
        lea     rsi, .LC13[rip]
        jmp     .L88
.L87:
        lea     rsi, .LC14[rip]
.L88:
        cmp     QWORD PTR 40[rbp], 0
        jne     .L89
        lea     rbx, .LC13[rip]
        jmp     .L90
.L89:
        lea     rbx, .LC14[rip]
.L90:
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
        jmp     .L91
.L86:
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 32[rbp]
        mov     DWORD PTR 16[rax], edx
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        cmp     DWORD PTR 32[rbp], 0
        jne     .L92
        cmp     QWORD PTR 48[rbp], 0
        je      .L92
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L93
.L92:
        cmp     DWORD PTR 32[rbp], 1
        jne     .L94
        cmp     QWORD PTR 64[rbp], 0
        je      .L94
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L93
.L94:
        cmp     DWORD PTR 32[rbp], 3
        jne     .L95
        cmp     QWORD PTR 56[rbp], 0
        je      .L95
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L93
.L95:
        cmp     DWORD PTR 32[rbp], 2
        jne     .L96
        cmp     QWORD PTR 48[rbp], 0
        je      .L96
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L93
.L96:
        cmp     QWORD PTR 48[rbp], 0
        jne     .L97
        cmp     QWORD PTR 56[rbp], 0
        jne     .L97
        cmp     QWORD PTR 64[rbp], 0
        jne     .L97
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 48
        mov     edx, 1
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L98
.L97:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 32[rbp]
        mov     r8d, eax
        lea     rax, .LC21[rip]
        mov     rdx, rax
        call    fprintf
.L98:
        mov     eax, 0
        jmp     .L91
.L93:
        mov     rax, QWORD PTR -8[rbp]
.L91:
        add     rsp, 48
        pop     rbx
        pop     rsi
        pop     rbp
        ret

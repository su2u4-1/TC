.LC0:
        .ascii "import\12\0"
.LC1:
        .ascii "function\12\0"
.LC2:
        .ascii "class\12\0"
.LC3:
        .ascii "unknown_CodeMemberType: %u\12\0"
output_code_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 2
        je      .L2
        cmp     eax, 2
        ja      .L3
        test    eax, eax
        je      .L4
        cmp     eax, 1
        je      .L5
        jmp     .L3
.L4:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 7
        mov     edx, 1
        lea     rax, .LC0[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_import
        jmp     .L6
.L5:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC1[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_function
        jmp     .L6
.L2:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC2[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_class
        jmp     .L6
.L3:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC3[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L6:
        nop
        add     rsp, 48
        pop     rbp
        ret
output_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        jmp     .L8
.L9:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_code_member
.L8:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L9
        nop
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC4:
        .ascii "name\12\0"
.LC5:
        .ascii "NULL\0"
.LC6:
        .ascii "source: \"%s\"\12\0"
output_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L11
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        jmp     .L12
.L11:
        lea     rax, .LC5[rip]
.L12:
        mov     rcx, QWORD PTR 24[rbp]
        mov     r8, rax
        lea     rax, .LC6[rip]
        mov     rdx, rax
        call    fprintf
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC7:
        .ascii "return_type\12\0"
.LC8:
        .ascii "parameters\12\0"
.LC9:
        .ascii "parameters[%d]\12\0"
.LC10:
        .ascii "body\12\0"
output_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 11
        mov     edx, 1
        lea     rax, .LC8[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -32[rbp], rax
        mov     DWORD PTR -4[rbp], -1
        jmp     .L14
.L15:
        mov     rax, QWORD PTR 32[rbp]
        lea     rdx, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        add     DWORD PTR -4[rbp], 1
        mov     edx, DWORD PTR -4[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC9[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 2[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
.L14:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L15
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L16
.L17:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L16:
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L17
        nop
        nop
        add     rsp, 80
        pop     rbp
        ret
output_method:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 11
        mov     edx, 1
        lea     rax, .LC8[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -32[rbp], rax
        mov     DWORD PTR -4[rbp], -1
        jmp     .L19
.L20:
        mov     rax, QWORD PTR 32[rbp]
        lea     rdx, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        add     DWORD PTR -4[rbp], 1
        mov     edx, DWORD PTR -4[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC9[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 2[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
.L19:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L20
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L21
.L22:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L21:
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L22
        nop
        nop
        add     rsp, 80
        pop     rbp
        ret
.LC11:
        .ascii "method\12\0"
.LC12:
        .ascii "variable\12\0"
.LC13:
        .ascii "unknown_ClassMemberType: %u\12\0"
output_class_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        je      .L24
        cmp     eax, 1
        je      .L25
        jmp     .L28
.L24:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 7
        mov     edx, 1
        lea     rax, .LC11[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_method
        jmp     .L27
.L25:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC12[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
        jmp     .L27
.L28:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC13[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L27:
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC14:
        .ascii "members\12\0"
output_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 8
        mov     edx, 1
        lea     rax, .LC14[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        jmp     .L30
.L31:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_class_member
.L30:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L31
        nop
        nop
        add     rsp, 64
        pop     rbp
        ret
.LC15:
        .ascii "type\12\0"
.LC16:
        .ascii "value\12\0"
.LC17:
        .ascii "value: \"NULL\"\12\0"
output_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC15[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L33
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L35
.L33:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 14
        mov     edx, 1
        lea     rax, .LC17[rip]
        mov     rcx, rax
        call    fwrite
.L35:
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC18:
        .ascii "if_statement\12\0"
.LC19:
        .ascii "for_statement\12\0"
.LC20:
        .ascii "while_statement\12\0"
.LC21:
        .ascii "variable_declaration_statement\12\0"
.LC22:
        .ascii "return_statement: \"NULL\"\12\0"
.LC23:
        .ascii "return_statement\12\0"
.LC24:
        .ascii "break_statement: \"NULL\"\12\0"
.LC25:
        .ascii "continue_statement: \"NULL\"\12\0"
.LC26:
        .ascii "expression_statement: \"NULL\"\12\0"
.LC27:
        .ascii "expression_statement\12\0"
.LC28:
        .ascii "unknown_StatementType: %u\12\0"
output_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 7
        ja      .L37
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L39[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L39[rip]
        add     rax, rdx
        jmp     rax
.L39:
        .long   .L46-.L39
        .long   .L45-.L39
        .long   .L44-.L39
        .long   .L43-.L39
        .long   .L42-.L39
        .long   .L41-.L39
        .long   .L40-.L39
        .long   .L38-.L39
.L44:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 13
        mov     edx, 1
        lea     rax, .LC18[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_if
        jmp     .L36
.L42:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 14
        mov     edx, 1
        lea     rax, .LC19[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_for
        jmp     .L36
.L43:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 16
        mov     edx, 1
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_while
        jmp     .L36
.L45:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 31
        mov     edx, 1
        lea     rax, .LC21[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
        jmp     .L36
.L41:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L48
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 25
        mov     edx, 1
        lea     rax, .LC22[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L36
.L48:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 17
        mov     edx, 1
        lea     rax, .LC23[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L36
.L40:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 24
        mov     edx, 1
        lea     rax, .LC24[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L36
.L38:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 27
        mov     edx, 1
        lea     rax, .LC25[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L36
.L46:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L49
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 29
        mov     edx, 1
        lea     rax, .LC26[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L36
.L49:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 21
        mov     edx, 1
        lea     rax, .LC27[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L36
.L37:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC28[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L36:
        add     rsp, 48
        pop     rbp
        ret
.LC29:
        .ascii "condition\12\0"
.LC30:
        .ascii "else_if\12\0"
.LC31:
        .ascii "else_body\12\0"
output_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -32[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC29[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L51
.L52:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L51:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L52
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 8
        mov     edx, 1
        lea     rax, .LC30[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L53
.L54:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_else_if
.L53:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L54
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC31[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L55
.L56:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L55:
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L56
        nop
        nop
        add     rsp, 80
        pop     rbp
        ret
output_else_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC29[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L58
.L59:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L58:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L59
        nop
        nop
        add     rsp, 64
        pop     rbp
        ret
.LC32:
        .ascii "initializer\12\0"
.LC33:
        .ascii "initializer: \"NULL\"\12\0"
.LC34:
        .ascii "condition: \"NULL\"\12\0"
.LC35:
        .ascii "increment\12\0"
.LC36:
        .ascii "increment: \"NULL\"\12\0"
output_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L61
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC32[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
        jmp     .L62
.L61:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 20
        mov     edx, 1
        lea     rax, .LC33[rip]
        mov     rcx, rax
        call    fwrite
.L62:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L63
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC29[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L64
.L63:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 18
        mov     edx, 1
        lea     rax, .LC34[rip]
        mov     rcx, rax
        call    fwrite
.L64:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L65
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC35[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L66
.L65:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 18
        mov     edx, 1
        lea     rax, .LC36[rip]
        mov     rcx, rax
        call    fwrite
.L66:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L67
.L68:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L67:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L68
        nop
        nop
        add     rsp, 64
        pop     rbp
        ret
output_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC29[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC10[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L70
.L71:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L70:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L71
        nop
        nop
        add     rsp, 64
        pop     rbp
        ret
.LC37:
        .ascii "primary\12\0"
.LC38:
        .ascii "UNKNOWN_OPERATOR\0"
.LC39:
        .ascii "operator: \"%s\"\12\0"
.LC40:
        .ascii "left\12\0"
.LC41:
        .ascii "right\12\0"
output_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 19
        jne     .L73
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 8
        mov     edx, 1
        lea     rax, .LC37[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_primary
        jmp     .L77
.L73:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        mov     ecx, eax
        call    operator_to_string
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        cmp     QWORD PTR -16[rbp], 0
        je      .L75
        mov     rax, QWORD PTR -16[rbp]
        jmp     .L76
.L75:
        lea     rax, .LC38[rip]
.L76:
        mov     rcx, QWORD PTR 24[rbp]
        mov     r8, rax
        lea     rax, .LC39[rip]
        mov     rdx, rax
        call    fprintf
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC40[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC41[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
.L77:
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC42:
        .ascii "type: \"integer\"\12\0"
.LC43:
        .ascii "value: %s\12\0"
.LC44:
        .ascii "type: \"float\"\12\0"
.LC45:
        .ascii "type: \"string\"\12\0"
.LC46:
        .ascii "value: \"%s\"\12\0"
.LC47:
        .ascii "type: \"boolean\"\12\0"
.LC48:
        .ascii "value: \"true\"\12\0"
.LC49:
        .ascii "value: \"false\"\12\0"
.LC50:
        .ascii "type: \"expression\"\12\0"
.LC51:
        .ascii "type: \"!\"\12\0"
.LC52:
        .ascii "type: \"-\"\12\0"
.LC53:
        .ascii "type: \"variable\"\12\0"
.LC54:
        .ascii "unknown_PrimaryType: %u\12\0"
output_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 8
        ja      .L79
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L81[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L81[rip]
        add     rax, rdx
        jmp     rax
.L81:
        .long   .L89-.L81
        .long   .L88-.L81
        .long   .L87-.L81
        .long   .L86-.L81
        .long   .L85-.L81
        .long   .L84-.L81
        .long   .L83-.L81
        .long   .L82-.L81
        .long   .L80-.L81
.L89:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 16
        mov     edx, 1
        lea     rax, .LC42[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC43[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L90
.L88:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 14
        mov     edx, 1
        lea     rax, .LC44[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC43[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L90
.L87:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 15
        mov     edx, 1
        lea     rax, .LC45[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC46[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L90
.L86:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 16
        mov     edx, 1
        lea     rax, .LC47[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 14
        mov     edx, 1
        lea     rax, .LC48[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L90
.L85:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 16
        mov     edx, 1
        lea     rax, .LC47[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 15
        mov     edx, 1
        lea     rax, .LC49[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L90
.L84:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 19
        mov     edx, 1
        lea     rax, .LC50[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L90
.L83:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC51[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_primary
        jmp     .L90
.L82:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC52[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_primary
        jmp     .L90
.L80:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 17
        mov     edx, 1
        lea     rax, .LC53[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC16[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable_access
        jmp     .L90
.L79:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC54[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L90:
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC55:
        .ascii "type: \"name\"\12\0"
.LC56:
        .ascii "type: \"function_call\"\12\0"
.LC57:
        .ascii "arguments\12\0"
.LC58:
        .ascii "arguments[%d]\12\0"
.LC59:
        .ascii "type: \"get sequence_element\"\12\0"
.LC60:
        .ascii "sequence\12\0"
.LC61:
        .ascii "index\12\0"
.LC62:
        .ascii "type: \"get_attribute\"\12\0"
.LC63:
        .ascii "object\12\0"
.LC64:
        .ascii "attribute_name\12\0"
.LC65:
        .ascii "unknown_VariableAccessType: %u\12\0"
output_variable_access:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 3
        je      .L92
        cmp     eax, 3
        ja      .L93
        cmp     eax, 2
        je      .L94
        cmp     eax, 2
        ja      .L93
        test    eax, eax
        je      .L95
        cmp     eax, 1
        je      .L96
        jmp     .L93
.L95:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 13
        mov     edx, 1
        lea     rax, .LC55[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC4[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L97
.L96:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 22
        mov     edx, 1
        lea     rax, .LC56[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC1[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable_access
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    fwrite
        mov     DWORD PTR -4[rbp], -1
        jmp     .L98
.L99:
        mov     rax, QWORD PTR 32[rbp]
        lea     rdx, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        add     DWORD PTR -4[rbp], 1
        mov     edx, DWORD PTR -4[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC58[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 2[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
.L98:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L99
        jmp     .L97
.L92:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 29
        mov     edx, 1
        lea     rax, .LC59[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC60[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable_access
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC61[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L97
.L94:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 22
        mov     edx, 1
        lea     rax, .LC62[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 7
        mov     edx, 1
        lea     rax, .LC63[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable_access
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 15
        mov     edx, 1
        lea     rax, .LC64[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L97
.L93:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 16[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC65[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L97:
        nop
        add     rsp, 64
        pop     rbp
        ret
.LC66:
        .ascii "Name pointer: \"NULL\"\12\0"
.LC67:
        .ascii "name: \"%s\"\12\0"
.LC68:
        .ascii "id: %zu\12\0"
.LC69:
        .ascii "kind: \"type\"\12\0"
.LC70:
        .ascii "kind: \"variable\"\12\0"
.LC71:
        .ascii "kind: \"function\"\12\0"
.LC72:
        .ascii "kind: \"method\"\12\0"
.LC73:
        .ascii "kind: \"class\"\12\0"
.LC74:
        .ascii "kind: \"attribute\"\12\0"
.LC75:
        .ascii "kind: \"unknown_NameType\"\12\0"
output_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L101
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 21
        mov     edx, 1
        lea     rax, .LC66[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L100
.L101:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC67[rip]
        mov     rcx, rax
        call    fprintf
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC68[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        ja      .L103
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L105[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L105[rip]
        add     rax, rdx
        jmp     rax
.L105:
        .long   .L110-.L105
        .long   .L109-.L105
        .long   .L108-.L105
        .long   .L107-.L105
        .long   .L106-.L105
        .long   .L104-.L105
.L110:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 13
        mov     edx, 1
        lea     rax, .LC69[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L100
.L109:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 17
        mov     edx, 1
        lea     rax, .LC70[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC15[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L100
.L108:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 17
        mov     edx, 1
        lea     rax, .LC71[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L100
.L107:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 15
        mov     edx, 1
        lea     rax, .LC72[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC7[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L100
.L106:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 14
        mov     edx, 1
        lea     rax, .LC73[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L100
.L104:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 18
        mov     edx, 1
        lea     rax, .LC74[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC15[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L100
.L103:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 25
        mov     edx, 1
        lea     rax, .LC75[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L100:
        add     rsp, 48
        pop     rbp
        ret

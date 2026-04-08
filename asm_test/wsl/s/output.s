.LC0:
        .string "import\n"
.LC1:
        .string "function\n"
.LC2:
        .string "class\n"
.LC3:
        .string "unknown_CodeMemberType: %u\n"
output_code_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+8]
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
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC0
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_import
        jmp     .L6
.L5:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC1
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_function
        jmp     .L6
.L2:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC2
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_class
        jmp     .L6
.L3:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L6:
        nop
        leave
        ret
output_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        jmp     .L8
.L9:
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_code_member
.L8:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L9
        nop
        nop
        leave
        ret
.LC4:
        .string "name\n"
.LC5:
        .string "NULL"
.LC6:
        .string "source: \"%s\"\n"
output_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L11
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        jmp     .L12
.L11:
        mov     eax, OFFSET FLAT:.LC5
.L12:
        mov     rcx, QWORD PTR [rbp-16]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rcx
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
.LC7:
        .string "return_type\n"
.LC8:
        .string "parameters\n"
.LC9:
        .string "parameters[%d]\n"
.LC10:
        .string "body\n"
output_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     QWORD PTR [rbp-80], rcx
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 11
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC8
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        mov     DWORD PTR [rbp-4], -1
        jmp     .L14
.L15:
        mov     rax, QWORD PTR [rbp-72]
        lea     rsi, [rax+1]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        add     DWORD PTR [rbp-4], 1
        mov     edx, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR [rbp-64]
        mov     esi, OFFSET FLAT:.LC9
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+2]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
.L14:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L15
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L16
.L17:
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L16:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L17
        nop
        nop
        leave
        ret
output_method:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     QWORD PTR [rbp-80], rcx
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 11
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC8
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        mov     DWORD PTR [rbp-4], -1
        jmp     .L19
.L20:
        mov     rax, QWORD PTR [rbp-72]
        lea     rsi, [rax+1]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        add     DWORD PTR [rbp-4], 1
        mov     edx, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR [rbp-64]
        mov     esi, OFFSET FLAT:.LC9
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+2]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
.L19:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L20
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L21
.L22:
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L21:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L22
        nop
        nop
        leave
        ret
.LC11:
        .string "method\n"
.LC12:
        .string "variable\n"
.LC13:
        .string "unknown_ClassMemberType: %u\n"
output_class_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+8]
        test    eax, eax
        je      .L24
        cmp     eax, 1
        je      .L25
        jmp     .L28
.L24:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC11
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_method
        jmp     .L27
.L25:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC12
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
        jmp     .L27
.L28:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC13
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L27:
        nop
        leave
        ret
.LC14:
        .string "members\n"
output_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 8
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC14
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        jmp     .L30
.L31:
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_class_member
.L30:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L31
        nop
        nop
        leave
        ret
.LC15:
        .string "type\n"
.LC16:
        .string "value\n"
.LC17:
        .string "value: \"NULL\"\n"
output_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L33
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L35
.L33:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC17
        call    fwrite
.L35:
        nop
        leave
        ret
.LC18:
        .string "if_statement\n"
.LC19:
        .string "for_statement\n"
.LC20:
        .string "while_statement\n"
.LC21:
        .string "variable_declaration_statement\n"
.LC22:
        .string "return_statement: \"NULL\"\n"
.LC23:
        .string "return_statement\n"
.LC24:
        .string "break_statement: \"NULL\"\n"
.LC25:
        .string "continue_statement: \"NULL\"\n"
.LC26:
        .string "expression_statement: \"NULL\"\n"
.LC27:
        .string "expression_statement\n"
.LC28:
        .string "unknown_StatementType: %u\n"
output_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 7
        ja      .L37
        mov     eax, eax
        mov     rax, QWORD PTR .L39[0+rax*8]
        jmp     rax
.L39:
        .quad   .L46
        .quad   .L45
        .quad   .L44
        .quad   .L43
        .quad   .L42
        .quad   .L41
        .quad   .L40
        .quad   .L38
.L44:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 13
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC18
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_if
        jmp     .L36
.L42:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC19
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_for
        jmp     .L36
.L43:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC20
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_while
        jmp     .L36
.L45:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC21
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
        jmp     .L36
.L41:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L48
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 25
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC22
        call    fwrite
        jmp     .L36
.L48:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC23
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L36
.L40:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 24
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC24
        call    fwrite
        jmp     .L36
.L38:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 27
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC25
        call    fwrite
        jmp     .L36
.L46:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L49
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 29
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC26
        call    fwrite
        jmp     .L36
.L49:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 21
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC27
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L36
.L37:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC28
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L36:
        leave
        ret
.LC29:
        .string "condition\n"
.LC30:
        .string "else_if\n"
.LC31:
        .string "else_body\n"
output_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     QWORD PTR [rbp-72], rdx
        mov     QWORD PTR [rbp-80], rcx
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC29
        call    fwrite
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L51
.L52:
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L51:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L52
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 8
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC30
        call    fwrite
        jmp     .L53
.L54:
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_else_if
.L53:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L54
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-64]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC31
        call    fwrite
        jmp     .L55
.L56:
        mov     rax, QWORD PTR [rbp-72]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-80]
        mov     rsi, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L55:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L56
        nop
        nop
        leave
        ret
output_else_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC29
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L58
.L59:
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L58:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L59
        nop
        nop
        leave
        ret
.LC32:
        .string "initializer\n"
.LC33:
        .string "initializer: \"NULL\"\n"
.LC34:
        .string "condition: \"NULL\"\n"
.LC35:
        .string "increment\n"
.LC36:
        .string "increment: \"NULL\"\n"
output_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L61
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC32
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
        jmp     .L62
.L61:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 20
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC33
        call    fwrite
.L62:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L63
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC29
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L64
.L63:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 18
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC34
        call    fwrite
.L64:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L65
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC35
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L66
.L65:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 18
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC36
        call    fwrite
.L66:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L67
.L68:
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L67:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L68
        nop
        nop
        leave
        ret
output_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC29
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L70
.L71:
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L70:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L71
        nop
        nop
        leave
        ret
.LC37:
        .string "primary\n"
.LC38:
        .string "UNKNOWN_OPERATOR"
.LC39:
        .string "operator: \"%s\"\n"
.LC40:
        .string "left\n"
.LC41:
        .string "right\n"
output_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 19
        jne     .L73
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 8
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC37
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_primary
        jmp     .L77
.L73:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        mov     edi, eax
        call    operator_to_string
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        cmp     QWORD PTR [rbp-8], 0
        je      .L75
        mov     rax, QWORD PTR [rbp-8]
        jmp     .L76
.L75:
        mov     eax, OFFSET FLAT:.LC38
.L76:
        mov     rcx, QWORD PTR [rbp-32]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC39
        mov     rdi, rcx
        mov     eax, 0
        call    fprintf
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC40
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC41
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
.L77:
        nop
        leave
        ret
.LC42:
        .string "type: \"integer\"\n"
.LC43:
        .string "value: %s\n"
.LC44:
        .string "type: \"float\"\n"
.LC45:
        .string "type: \"string\"\n"
.LC46:
        .string "value: \"%s\"\n"
.LC47:
        .string "type: \"boolean\"\n"
.LC48:
        .string "value: \"true\"\n"
.LC49:
        .string "value: \"false\"\n"
.LC50:
        .string "type: \"expression\"\n"
.LC51:
        .string "type: \"!\"\n"
.LC52:
        .string "type: \"-\"\n"
.LC53:
        .string "type: \"variable\"\n"
.LC54:
        .string "unknown_PrimaryType: %u\n"
output_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+8]
        cmp     eax, 8
        ja      .L79
        mov     eax, eax
        mov     rax, QWORD PTR .L81[0+rax*8]
        jmp     rax
.L81:
        .quad   .L89
        .quad   .L88
        .quad   .L87
        .quad   .L86
        .quad   .L85
        .quad   .L84
        .quad   .L83
        .quad   .L82
        .quad   .L80
.L89:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC42
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC43
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L90
.L88:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC44
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC43
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L90
.L87:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC45
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC46
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L90
.L86:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC47
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC48
        call    fwrite
        jmp     .L90
.L85:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC47
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC49
        call    fwrite
        jmp     .L90
.L84:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 19
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC50
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L90
.L83:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC51
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_primary
        jmp     .L90
.L82:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC52
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_primary
        jmp     .L90
.L80:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC53
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable_access
        jmp     .L90
.L79:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC54
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L90:
        nop
        leave
        ret
.LC55:
        .string "type: \"name\"\n"
.LC56:
        .string "type: \"function_call\"\n"
.LC57:
        .string "arguments\n"
.LC58:
        .string "arguments[%d]\n"
.LC59:
        .string "type: \"get sequence_element\"\n"
.LC60:
        .string "sequence\n"
.LC61:
        .string "index\n"
.LC62:
        .string "type: \"get_attribute\"\n"
.LC63:
        .string "object\n"
.LC64:
        .string "attribute_name\n"
.LC65:
        .string "unknown_VariableAccessType: %u\n"
output_variable_access:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     eax, DWORD PTR [rax+16]
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
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 13
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC55
        call    fwrite
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L97
.L96:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 22
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC56
        call    fwrite
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC1
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable_access
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC57
        call    fwrite
        mov     DWORD PTR [rbp-4], -1
        jmp     .L98
.L99:
        mov     rax, QWORD PTR [rbp-56]
        lea     rsi, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        add     DWORD PTR [rbp-4], 1
        mov     edx, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC58
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+2]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
.L98:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L99
        jmp     .L97
.L92:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 29
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC59
        call    fwrite
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC60
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable_access
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC61
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L97
.L94:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 22
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC62
        call    fwrite
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC63
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable_access
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC64
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L97
.L93:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-40]
        mov     edx, DWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC65
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L97:
        nop
        leave
        ret
.LC66:
        .string "Name: \"NULL\"\n"
.LC67:
        .string "name: \"%s\"\n"
.LC68:
        .string "id: %zu\n"
.LC69:
        .string "kind: \"type\"\n"
.LC70:
        .string "kind: \"variable\"\n"
.LC71:
        .string "kind: \"function\"\n"
.LC72:
        .string "kind: \"method\"\n"
.LC73:
        .string "kind: \"class\"\n"
.LC74:
        .string "kind: \"attribute\"\n"
.LC75:
        .string "kind: \"parameter\"\n"
.LC76:
        .string "kind: \"unknown_NameType\"\n"
output_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        cmp     QWORD PTR [rbp-8], 0
        jne     .L101
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 13
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC66
        call    fwrite
        jmp     .L100
.L101:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC67
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC68
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+32]
        cmp     eax, 6
        ja      .L103
        mov     eax, eax
        mov     rax, QWORD PTR .L105[0+rax*8]
        jmp     rax
.L105:
        .quad   .L111
        .quad   .L110
        .quad   .L109
        .quad   .L108
        .quad   .L107
        .quad   .L106
        .quad   .L104
.L104:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 13
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC69
        call    fwrite
        jmp     .L100
.L108:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC70
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L110:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC71
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L109:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC72
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L111:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC73
        call    fwrite
        jmp     .L100
.L106:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 18
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC74
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L107:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 18
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC75
        call    fwrite
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        mov     rax, QWORD PTR [rbp-24]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L103:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 25
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC76
        call    fwrite
        nop
.L100:
        leave
        ret
.LC77:
        .string "TAC: \"NULL\"\n"
.LC78:
        .string "TAC {\n"
.LC79:
        .string "designs: []\n"
.LC80:
        .string "designs: [\n"
.LC81:
        .string "]\n"
.LC82:
        .string "entry_point: \"NULL\"\n"
.LC83:
        .string "entry_point: %s\n"
.LC84:
        .string "global: []\n"
.LC85:
        .string "global: [\n"
.LC86:
        .string "subroutines: []\n"
.LC87:
        .string "subroutines: [\n"
.LC88:
        .string "}\n"
output_TAC:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        cmp     QWORD PTR [rbp-40], 0
        jne     .L113
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC77
        call    fwrite
        jmp     .L112
.L113:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC78
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L115
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC79
        call    fwrite
        jmp     .L116
.L115:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 11
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC80
        call    fwrite
        jmp     .L117
.L118:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+2]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_attribute_table
.L117:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L118
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC81
        call    fwrite
.L116:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L119
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 20
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC82
        call    fwrite
        jmp     .L120
.L119:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC83
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L120:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L121
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 11
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC84
        call    fwrite
        jmp     .L122
.L121:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC85
        call    fwrite
        jmp     .L123
.L124:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+2]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_var
.L123:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L124
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC81
        call    fwrite
.L122:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L125
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC86
        call    fwrite
        jmp     .L126
.L125:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC87
        call    fwrite
        jmp     .L127
.L128:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+2]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_subroutine
.L127:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L128
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC81
        call    fwrite
.L126:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC88
        call    fwrite
.L112:
        leave
        ret
.LC89:
        .string "Subroutine: \"NULL\"\n"
.LC90:
        .string "NULL {\n"
.LC91:
        .string "%s {\n"
.LC92:
        .string "return_type: \"NULL\"\n"
.LC93:
        .string "return_type: %s\n"
.LC94:
        .string "parameters: []\n"
.LC95:
        .string "parameters: [\n"
.LC96:
        .string "local: []\n"
.LC97:
        .string "local: [\n"
.LC98:
        .string "instructions: []\n"
.LC99:
        .string "instructions: [\n"
output_subroutine:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        cmp     QWORD PTR [rbp-40], 0
        jne     .L130
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 19
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC89
        call    fwrite
        jmp     .L129
.L130:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L132
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC90
        call    fwrite
        jmp     .L133
.L132:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC91
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L133:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L134
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 20
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC92
        call    fwrite
        jmp     .L135
.L134:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC93
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L135:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L136
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC94
        call    fwrite
        jmp     .L137
.L136:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC95
        call    fwrite
        jmp     .L138
.L139:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+2]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_var
.L138:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L139
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC81
        call    fwrite
.L137:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L140
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC96
        call    fwrite
        jmp     .L141
.L140:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC97
        call    fwrite
        jmp     .L142
.L143:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+2]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_var
.L142:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L143
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC81
        call    fwrite
.L141:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+32]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L144
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC98
        call    fwrite
        jmp     .L145
.L144:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC99
        call    fwrite
        jmp     .L146
.L147:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+2]
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_block
.L146:
        mov     rax, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rax+32]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L147
        mov     rax, QWORD PTR [rbp-56]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC81
        call    fwrite
.L145:
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC88
        call    fwrite
.L129:
        leave
        ret
.LC100:
        .string "Var: \"NULL\"\n"
.LC101:
        .string "NULL\t%s\n"
.LC102:
        .string "%s\t%s(%s)\n"
.LC103:
        .string "%s\t%s\n"
output_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        cmp     QWORD PTR [rbp-8], 0
        jne     .L149
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC100
        call    fwrite
        jmp     .L148
.L149:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        jne     .L151
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC101
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L148
.L151:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L152
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC102
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L148
.L152:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC103
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L148:
        leave
        ret
.LC104:
        .string "Block: \"NULL\"\n"
.LC105:
        .string "NULL "
.LC106:
        .string "%s "
.LC107:
        .string "{}\n"
.LC108:
        .string "{\n"
output_block:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        cmp     QWORD PTR [rbp-24], 0
        jne     .L154
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC104
        call    fwrite
        jmp     .L153
.L154:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L156
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC105
        call    fwrite
        jmp     .L157
.L156:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC106
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L157:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L158
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 3
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC107
        call    fwrite
        jmp     .L153
.L158:
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC108
        call    fwrite
        jmp     .L159
.L160:
        mov     rax, QWORD PTR [rbp-40]
        lea     rdx, [rax+1]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_instruction
.L159:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L160
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC88
        call    fwrite
.L153:
        leave
        ret
.LC109:
        .string "\"NULL\""
.LC110:
        .string "%s(%s)"
.LC111:
        .string "%lld"
.LC112:
        .string "%f"
.LC113:
        .string "\"%s\""
.LC114:
        .string "true"
.LC115:
        .string "false"
.LC116:
        .string "void"
.LC117:
        .string "NONE"
.LC118:
        .string "unknown_ArgType: %u"
output_arg:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        cmp     QWORD PTR [rbp-8], 0
        jne     .L162
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC109
        call    fwrite
        jmp     .L161
.L162:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+16]
        cmp     eax, 9
        ja      .L164
        mov     eax, eax
        mov     rax, QWORD PTR .L166[0+rax*8]
        jmp     rax
.L166:
        .quad   .L174
        .quad   .L173
        .quad   .L172
        .quad   .L171
        .quad   .L170
        .quad   .L169
        .quad   .L168
        .quad   .L167
        .quad   .L167
        .quad   .L165
.L174:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L175
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC110
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L161
.L175:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    fputs
        jmp     .L161
.L173:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC111
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L161
.L172:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        movq    xmm0, rdx
        mov     esi, OFFSET FLAT:.LC112
        mov     rdi, rax
        mov     eax, 1
        call    fprintf
        jmp     .L161
.L171:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC113
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L161
.L170:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L177
        mov     edx, OFFSET FLAT:.LC114
        jmp     .L178
.L177:
        mov     edx, OFFSET FLAT:.LC115
.L178:
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     rdi, rdx
        call    fputs
        jmp     .L161
.L169:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC116
        call    fwrite
        jmp     .L161
.L168:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    fputs
        jmp     .L161
.L167:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L179
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC110
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L161
.L179:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    fputs
        jmp     .L161
.L165:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC117
        call    fwrite
        jmp     .L161
.L164:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC118
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
.L161:
        leave
        ret
.LC119:
        .string "Instruction: \"NULL\"\n"
.LC120:
        .string "add\t"
.LC121:
        .string "sub\t"
.LC122:
        .string "mul\t"
.LC123:
        .string "div\t"
.LC124:
        .string "mod\t"
.LC125:
        .string "eq \t"
.LC126:
        .string "ne \t"
.LC127:
        .string "lt \t"
.LC128:
        .string "gt \t"
.LC129:
        .string "le \t"
.LC130:
        .string "ge \t"
.LC131:
        .string "and\t"
.LC132:
        .string "or \t"
.LC133:
        .string "not\t"
.LC134:
        .string "assign\t"
.LC135:
        .string "get_attr\t"
.LC136:
        .string "get_elem\t"
.LC137:
        .string "param\t"
.LC138:
        .string "alloc\t"
.LC139:
        .string "jmp_c\t"
.LC140:
        .string "jmp\t"
.LC141:
        .string "ret\t"
.LC142:
        .string "call\t"
.LC143:
        .string "load\t"
.LC144:
        .string "store\t"
.LC145:
        .string "INST_NONE\n"
.LC146:
        .string "unknown_InstructionType: %u\n"
output_instruction:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        cmp     QWORD PTR [rbp-8], 0
        jne     .L182
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 20
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC119
        call    fwrite
        jmp     .L181
.L182:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 25
        ja      .L184
        mov     eax, eax
        mov     rax, QWORD PTR .L186[0+rax*8]
        jmp     rax
.L186:
        .quad   .L211
        .quad   .L210
        .quad   .L209
        .quad   .L208
        .quad   .L207
        .quad   .L206
        .quad   .L205
        .quad   .L204
        .quad   .L203
        .quad   .L202
        .quad   .L201
        .quad   .L200
        .quad   .L199
        .quad   .L198
        .quad   .L197
        .quad   .L196
        .quad   .L195
        .quad   .L194
        .quad   .L193
        .quad   .L192
        .quad   .L191
        .quad   .L190
        .quad   .L189
        .quad   .L188
        .quad   .L187
        .quad   .L185
.L211:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC120
        call    fwrite
        jmp     .L212
.L210:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC121
        call    fwrite
        jmp     .L212
.L209:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC122
        call    fwrite
        jmp     .L212
.L208:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC123
        call    fwrite
        jmp     .L212
.L207:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC124
        call    fwrite
        jmp     .L212
.L206:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC125
        call    fwrite
        jmp     .L212
.L205:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC126
        call    fwrite
        jmp     .L212
.L204:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC127
        call    fwrite
        jmp     .L212
.L203:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC128
        call    fwrite
        jmp     .L212
.L202:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC129
        call    fwrite
        jmp     .L212
.L201:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC130
        call    fwrite
        jmp     .L212
.L200:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC131
        call    fwrite
        jmp     .L212
.L199:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC132
        call    fwrite
        jmp     .L212
.L198:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC133
        call    fwrite
        jmp     .L212
.L197:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC134
        call    fwrite
        jmp     .L212
.L196:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC135
        call    fwrite
        jmp     .L212
.L195:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC136
        call    fwrite
        jmp     .L212
.L194:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC137
        call    fwrite
        jmp     .L212
.L193:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC138
        call    fwrite
        jmp     .L212
.L192:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC139
        call    fwrite
        jmp     .L212
.L191:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC140
        call    fwrite
        jmp     .L212
.L190:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 4
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC141
        call    fwrite
        jmp     .L212
.L189:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC142
        call    fwrite
        jmp     .L212
.L188:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC143
        call    fwrite
        jmp     .L212
.L187:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC144
        call    fwrite
        jmp     .L212
.L185:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC145
        call    fwrite
        jmp     .L181
.L184:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+24]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC146
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L181
.L212:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_arg
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 24
        seta    dl
        test    dl, dl
        jne     .L218
        mov     edx, 1
        mov     ecx, eax
        sal     rdx, cl
        mov     rax, rdx
        mov     rdx, rax
        and     edx, 4825087
        test    rdx, rdx
        setne   dl
        test    dl, dl
        jne     .L214
        mov     rdx, rax
        and     edx, 25583616
        test    rdx, rdx
        setne   dl
        test    dl, dl
        jne     .L215
        and     eax, 3145728
        test    rax, rax
        setne   al
        test    al, al
        jne     .L219
        jmp     .L218
.L214:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, 32
        call    fputc
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_arg
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, 32
        call    fputc
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_arg
        jmp     .L217
.L215:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, 32
        call    fputc
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_arg
        jmp     .L217
.L219:
        nop
.L217:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rax
        mov     edi, 10
        call    fputc
        jmp     .L181
.L218:
        nop
.L181:
        leave
        ret
.LC147:
        .string "AttributeTable: \"NULL\"\n"
.LC148:
        .string "%zu "
output_attribute_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        cmp     QWORD PTR [rbp-24], 0
        jne     .L221
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 23
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC147
        call    fwrite
        jmp     .L220
.L221:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L223
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC105
        call    fwrite
        jmp     .L224
.L223:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC106
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L224:
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC148
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_is_empty
        test    al, al
        je      .L225
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 3
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC107
        call    fwrite
        jmp     .L220
.L225:
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC108
        call    fwrite
        jmp     .L226
.L227:
        mov     rax, QWORD PTR [rbp-40]
        lea     rdx, [rax+1]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_attribute
.L226:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L227
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC88
        call    fwrite
.L220:
        leave
        ret
.LC149:
        .string "Attribute: \"NULL\"\n"
.LC150:
        .string "NULL\t"
.LC151:
        .string "%s\t"
.LC152:
        .string "%s(%s) "
.LC153:
        .string "%zu\n"
output_attribute:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        cmp     QWORD PTR [rbp-8], 0
        jne     .L229
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 18
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC149
        call    fwrite
        jmp     .L228
.L229:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L231
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC150
        call    fwrite
        jmp     .L232
.L231:
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC151
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L232:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L233
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-16]
        mov     rcx, rax
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC105
        call    fwrite
        jmp     .L234
.L233:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L235
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC152
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L234
.L235:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC106
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L234:
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 0
        mov     rdi, rax
        call    indention_tac
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC153
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L228:
        leave
        ret

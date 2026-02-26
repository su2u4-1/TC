.LC0:
        .string "import\n"
.LC1:
        .string "function\n"
.LC2:
        .string "class\n"
.LC3:
        .string "unknown_CodeMemberType: %d\n"
output_code_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
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
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC0
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_import
        jmp     .L6
.L5:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC1
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_function
        jmp     .L6
.L2:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 6
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC2
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_class
        jmp     .L6
.L3:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
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
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
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
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
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
        mov     rcx, QWORD PTR [rbp-32]
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
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-16], rax
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-32], rax
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
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
.L14:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
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
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L16:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
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
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-16], rax
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-32], rax
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
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
.L19:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
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
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L21:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
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
        .string "unknown_ClassMemberType: %d\n"
output_class_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+8]
        test    eax, eax
        je      .L24
        cmp     eax, 1
        je      .L25
        jmp     .L28
.L24:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 7
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC11
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_method
        jmp     .L27
.L25:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 9
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC12
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
        jmp     .L27
.L28:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
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
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
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
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 8
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC14
        call    fwrite
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        jmp     .L30
.L31:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_class_member
.L30:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
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
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
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
        mov     edx, 5
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
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
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L33
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
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L35
.L33:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
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
        .string "unknown_StatementType: %d\n"
output_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
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
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 13
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC18
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_if
        jmp     .L36
.L42:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC19
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_for
        jmp     .L36
.L43:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC20
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_while
        jmp     .L36
.L45:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC21
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
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
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 25
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC22
        call    fwrite
        jmp     .L36
.L48:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC23
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L36
.L40:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 24
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC24
        call    fwrite
        jmp     .L36
.L38:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
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
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 29
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC26
        call    fwrite
        jmp     .L36
.L49:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 21
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC27
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L36
.L37:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
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
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-32], rax
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
        mov     rax, QWORD PTR [rbp-8]
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
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L51:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
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
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_else_if
.L53:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-48], rax
        cmp     QWORD PTR [rbp-48], 0
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
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L55:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-40], rax
        cmp     QWORD PTR [rbp-40], 0
        jne     .L56
        nop
        nop
        leave
        ret
output_else_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
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
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC29
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
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
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L58
.L59:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L58:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
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
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L61
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC32
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable
        jmp     .L62
.L61:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 20
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC33
        call    fwrite
.L62:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L63
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC29
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L64
.L63:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 18
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC34
        call    fwrite
.L64:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        test    rax, rax
        je      .L65
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC35
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L66
.L65:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     edx, 18
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC36
        call    fwrite
.L66:
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
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L67
.L68:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L67:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L68
        nop
        nop
        leave
        ret
output_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
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
        mov     edx, 10
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC29
        call    fwrite
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
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
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L70
.L71:
        mov     rax, QWORD PTR [rbp-56]
        lea     rdi, [rax+1]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_statement
.L70:
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
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
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
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
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_primary
        jmp     .L77
.L73:
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        mov     edi, eax
        call    operator_to_string
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        cmp     QWORD PTR [rbp-16], 0
        je      .L75
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-8]
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
        mov     rax, QWORD PTR [rbp-8]
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
        .string "unknown_PrimaryType: %d\n"
output_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
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
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC42
        call    fwrite
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC43
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L90
.L88:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC44
        call    fwrite
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC43
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L90
.L87:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC45
        call    fwrite
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC46
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L90
.L86:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC47
        call    fwrite
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC48
        call    fwrite
        jmp     .L90
.L85:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 16
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC47
        call    fwrite
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC49
        call    fwrite
        jmp     .L90
.L84:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 19
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC50
        call    fwrite
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
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
        jmp     .L90
.L83:
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
        mov     edi, OFFSET FLAT:.LC51
        call    fwrite
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
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_primary
        jmp     .L90
.L82:
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
        mov     edi, OFFSET FLAT:.LC52
        call    fwrite
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
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_primary
        jmp     .L90
.L80:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC53
        call    fwrite
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
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_variable_access
        jmp     .L90
.L79:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
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
        .string "unknown_VariableAccessType: %d\n"
output_variable_access:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L97
.L96:
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        mov     rdi, rax
        call    list_copy
        mov     QWORD PTR [rbp-24], rax
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_expression
.L98:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    list_pop
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
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
        mov     rax, QWORD PTR [rbp-16]
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
        .string "Name pointer: \"NULL\"\n"
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
        .string "kind: \"unknown_NameType\"\n"
output_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L101
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 21
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC66
        call    fwrite
        jmp     .L100
.L101:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC67
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC68
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        ja      .L103
        mov     eax, eax
        mov     rax, QWORD PTR .L105[0+rax*8]
        jmp     rax
.L105:
        .quad   .L110
        .quad   .L109
        .quad   .L108
        .quad   .L107
        .quad   .L106
        .quad   .L104
.L110:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 13
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC69
        call    fwrite
        jmp     .L100
.L109:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC70
        call    fwrite
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
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L108:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 17
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC71
        call    fwrite
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L107:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 15
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC72
        call    fwrite
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 12
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L106:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 14
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC73
        call    fwrite
        jmp     .L100
.L104:
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
        mov     edi, OFFSET FLAT:.LC74
        call    fwrite
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
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        mov     rax, QWORD PTR [rbp-40]
        lea     rdi, [rax+1]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rdi
        mov     rdi, rax
        call    output_name
        jmp     .L100
.L103:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     edx, 1
        mov     rdi, rax
        call    indention
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rax
        mov     edx, 25
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC75
        call    fwrite
        nop
.L100:
        leave
        ret

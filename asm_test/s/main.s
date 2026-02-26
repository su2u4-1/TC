.LC0:
        .string "Usage: %s <filename>\n"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        cmp     DWORD PTR [rbp-20], 1
        jg      .L2
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR stderr[rip]
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     eax, 1
        jmp     .L3
.L2:
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, 1
        mov     esi, 1
        mov     rdi, rax
        call    parse_file
        mov     eax, 0
.L3:
        leave
        ret

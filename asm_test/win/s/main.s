.LC0:
        .ascii "Usage: %s <filename>\12\0"
main:
        push    rbp
        push    rbx
        sub     rsp, 56
        lea     rbp, 48[rsp]
        mov     DWORD PTR 32[rbp], ecx
        mov     QWORD PTR 40[rbp], rdx
        call    __main
        cmp     DWORD PTR 32[rbp], 1
        jg      .L2
        mov     rax, QWORD PTR 40[rbp]
        mov     rbx, QWORD PTR [rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC0[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 1
        jmp     .L3
.L2:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8d, 1
        mov     edx, 1
        mov     rcx, rax
        call    parse_file
        mov     eax, 0
.L3:
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret

.LC0:
        .ascii "import\0"
.LC1:
        .ascii "from\0"
.LC2:
        .ascii "func\0"
.LC3:
        .ascii "class\0"
.LC4:
        .ascii "method\0"
.LC5:
        .ascii "self\0"
.LC6:
        .ascii "if\0"
.LC7:
        .ascii "elif\0"
.LC8:
        .ascii "else\0"
.LC9:
        .ascii "while\0"
.LC10:
        .ascii "for\0"
.LC11:
        .ascii "true\0"
.LC12:
        .ascii "false\0"
.LC13:
        .ascii "return\0"
.LC14:
        .ascii "break\0"
.LC15:
        .ascii "continue\0"
.LC16:
        .ascii "int\0"
.LC17:
        .ascii "float\0"
.LC18:
        .ascii "string\0"
.LC19:
        .ascii "bool\0"
.LC20:
        .ascii "void\0"
.LC21:
        .ascii "var\0"
keywordStrings:
        .quad   .LC0
        .quad   .LC1
        .quad   .LC2
        .quad   .LC3
        .quad   .LC4
        .quad   .LC5
        .quad   .LC6
        .quad   .LC7
        .quad   .LC8
        .quad   .LC9
        .quad   .LC10
        .quad   .LC11
        .quad   .LC12
        .quad   .LC13
        .quad   .LC14
        .quad   .LC15
        .quad   .LC16
        .quad   .LC17
        .quad   .LC18
        .quad   .LC19
        .quad   .LC20
        .quad   .LC21
.LC22:
        .ascii "(\0"
.LC23:
        .ascii ")\0"
.LC24:
        .ascii "{\0"
.LC25:
        .ascii "}\0"
.LC26:
        .ascii ",\0"
.LC27:
        .ascii "!\0"
.LC28:
        .ascii ".\0"
.LC29:
        .ascii "[\0"
.LC30:
        .ascii "]\0"
.LC31:
        .ascii ";\0"
.LC32:
        .ascii "_\0"
.LC33:
        .ascii "+\0"
.LC34:
        .ascii "-\0"
.LC35:
        .ascii "*\0"
.LC36:
        .ascii "/\0"
.LC37:
        .ascii "%\0"
.LC38:
        .ascii "<\0"
.LC39:
        .ascii ">\0"
.LC40:
        .ascii "=\0"
.LC41:
        .ascii "==\0"
.LC42:
        .ascii "!=\0"
.LC43:
        .ascii "<=\0"
.LC44:
        .ascii ">=\0"
.LC45:
        .ascii "+=\0"
.LC46:
        .ascii "-=\0"
.LC47:
        .ascii "*=\0"
.LC48:
        .ascii "/=\0"
.LC49:
        .ascii "%=\0"
.LC50:
        .ascii "&&\0"
.LC51:
        .ascii "||\0"
symbolStrings:
        .quad   .LC22
        .quad   .LC23
        .quad   .LC24
        .quad   .LC25
        .quad   .LC26
        .quad   .LC27
        .quad   .LC28
        .quad   .LC29
        .quad   .LC30
        .quad   .LC31
        .quad   .LC32
        .quad   .LC33
        .quad   .LC34
        .quad   .LC35
        .quad   .LC36
        .quad   .LC37
        .quad   .LC38
        .quad   .LC39
        .quad   .LC40
        .quad   .LC41
        .quad   .LC42
        .quad   .LC43
        .quad   .LC44
        .quad   .LC45
        .quad   .LC46
        .quad   .LC47
        .quad   .LC48
        .quad   .LC49
        .quad   .LC50
        .quad   .LC51
.LC52:
        .ascii "Fatal: Cannot allocate memory\12\0"
increase_memory_size:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     eax, ecx
        mov     BYTE PTR 16[rbp], al
        mov     ecx, 32
        call    malloc
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L2
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 30
        mov     edx, 1
        lea     rax, .LC52[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L3
.L4:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    free
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    free
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -8[rbp], rax
.L3:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L4
        mov     BYTE PTR initialized[rip], 0
        mov     ecx, 1
        call    exit
.L2:
        mov     ecx, 1024
        call    malloc
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR [rax], 1024
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR 16[rax], 0
        cmp     BYTE PTR 16[rbp], 0
        je      .L5
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR struct_memory_used[rip]
        add     rax, rdx
        mov     QWORD PTR struct_memory_used[rip], rax
        mov     rdx, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR struct_memory[rip], rax
        mov     rax, QWORD PTR struct_memory_count[rip]
        add     rax, 1024
        mov     QWORD PTR struct_memory_count[rip], rax
        jmp     .L7
.L5:
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR string_memory_used[rip]
        add     rax, rdx
        mov     QWORD PTR string_memory_used[rip], rax
        mov     rdx, QWORD PTR string_memory[rip]
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR string_memory[rip], rax
        mov     rax, QWORD PTR string_memory_count[rip]
        add     rax, 1024
        mov     QWORD PTR string_memory_count[rip], rax
.L7:
        nop
        add     rsp, 64
        pop     rbp
        ret
.LC53:
        .ascii "Info: Allocate big memory block of size %zu bytes\12\0"
alloc_big_memory:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     rdx, QWORD PTR string_memory_count[rip]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        mov     QWORD PTR string_memory_count[rip], rax
        mov     rdx, QWORD PTR string_memory_used[rip]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        mov     QWORD PTR string_memory_used[rip], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    malloc
        mov     QWORD PTR -8[rbp], rax
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rax
        lea     rax, .LC53[rip]
        mov     rdx, rax
        call    fprintf
        cmp     QWORD PTR -8[rbp], 0
        jne     .L9
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 30
        mov     edx, 1
        lea     rax, .LC52[rip]
        mov     rcx, rax
        call    fwrite
        mov     ecx, 1
        call    exit
.L9:
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_string_check:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     eax, r8d
        mov     BYTE PTR 32[rbp], al
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L12
        call    init
.L12:
        cmp     QWORD PTR 16[rbp], 0
        je      .L13
        cmp     QWORD PTR 24[rbp], 0
        jne     .L14
.L13:
        mov     eax, 0
        jmp     .L15
.L14:
        cmp     BYTE PTR 32[rbp], 0
        je      .L16
        mov     rax, QWORD PTR all_string_list[rip]
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        jmp     .L17
.L19:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     QWORD PTR 24[rbp], rax
        jne     .L18
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L18
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    strncmp
        test    eax, eax
        jne     .L18
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
.L18:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -8[rbp], rax
.L17:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L19
        cmp     QWORD PTR -16[rbp], 0
        je      .L16
        mov     rax, QWORD PTR -16[rbp]
        jmp     .L15
.L16:
        cmp     QWORD PTR 24[rbp], 1022
        jbe     .L20
        mov     rax, QWORD PTR 24[rbp]
        add     rax, 1
        mov     rcx, rax
        call    alloc_big_memory
        mov     QWORD PTR -24[rbp], rax
        jmp     .L21
.L20:
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        add     rdx, rax
        mov     rax, QWORD PTR string_memory[rip]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jb      .L22
        mov     ecx, 0
        call    increase_memory_size
.L22:
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR string_memory[rip]
        mov     rax, QWORD PTR 8[rax]
        add     rax, rdx
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        add     rdx, rax
        mov     rax, QWORD PTR string_memory[rip]
        add     rdx, 1
        mov     QWORD PTR 8[rax], rdx
.L21:
        mov     rcx, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    strncpy
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 24[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rdx, QWORD PTR all_string_list[rip]
        mov     rax, QWORD PTR -32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -32[rbp]
        mov     QWORD PTR all_string_list[rip], rax
        mov     rax, QWORD PTR -24[rbp]
.L15:
        add     rsp, 64
        pop     rbp
        ret
create_memory_block:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 32
        call    malloc
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L24
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 30
        mov     edx, 1
        lea     rax, .LC52[rip]
        mov     rcx, rax
        call    fwrite
        mov     BYTE PTR initialized[rip], 0
        mov     ecx, 1
        call    exit
.L24:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    malloc
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC54:
        .ascii "init\0"
.LC55:
        .ascii "$constructor\0"
init:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L35
        mov     rax, QWORD PTR struct_memory[rip]
        test    rax, rax
        jne     .L29
        mov     ecx, 1024
        call    create_memory_block
        mov     QWORD PTR struct_memory[rip], rax
        mov     QWORD PTR struct_memory_count[rip], 1024
.L29:
        mov     rax, QWORD PTR string_memory[rip]
        test    rax, rax
        jne     .L30
        mov     ecx, 1024
        call    create_memory_block
        mov     QWORD PTR string_memory[rip], rax
        mov     QWORD PTR string_memory_count[rip], 1024
.L30:
        mov     BYTE PTR initialized[rip], 1
        mov     QWORD PTR -8[rbp], 0
        jmp     .L31
.L32:
        mov     rax, QWORD PTR -8[rbp]
        lea     rdx, 0[0+rax*8]
        lea     rax, keywordStrings[rip]
        mov     rax, QWORD PTR [rdx+rax]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        lea     rcx, 0[0+rax*8]
        lea     rax, keywordStrings[rip]
        mov     rax, QWORD PTR [rcx+rax]
        mov     r8d, 0
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -8[rbp]
        lea     rcx, 0[0+rdx*8]
        lea     rdx, keywordList[rip]
        mov     QWORD PTR [rcx+rdx], rax
        add     QWORD PTR -8[rbp], 1
.L31:
        cmp     QWORD PTR -8[rbp], 21
        jbe     .L32
        mov     QWORD PTR -16[rbp], 0
        jmp     .L33
.L34:
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, 0[0+rax*8]
        lea     rax, symbolStrings[rip]
        mov     rax, QWORD PTR [rdx+rax]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        lea     rcx, 0[0+rax*8]
        lea     rax, symbolStrings[rip]
        mov     rax, QWORD PTR [rcx+rax]
        mov     r8d, 0
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -16[rbp]
        lea     rcx, 0[0+rdx*8]
        lea     rdx, symbolList[rip]
        mov     QWORD PTR [rcx+rdx], rax
        add     QWORD PTR -16[rbp], 1
.L33:
        cmp     QWORD PTR -16[rbp], 29
        jbe     .L34
        mov     r8d, 0
        mov     edx, 4
        lea     rax, .LC54[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR DEFAULT_INIT_NAME[rip], rax
        mov     r8d, 0
        mov     edx, 13
        lea     rax, .LC55[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip], rax
        jmp     .L26
.L35:
        nop
.L26:
        add     rsp, 48
        pop     rbp
        ret
.LC56:
        .ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
alloc_memory:
        push    rbp
        push    rbx
        sub     rsp, 56
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L37
        call    init
.L37:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 7
        and     rax, -8
        mov     QWORD PTR 32[rbp], rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        add     rdx, rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jb      .L38
        mov     ecx, 1
        call    increase_memory_size
.L38:
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR 8[rax]
        and     eax, 7
        test    rax, rax
        je      .L39
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC56[rip]
        mov     rdx, rax
        call    fprintf
        mov     BYTE PTR initialized[rip], 0
        mov     ecx, 1
        call    exit
.L39:
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR 8[rax]
        and     rax, -8
        add     rax, rdx
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR 32[rbp]
        add     rdx, rcx
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR memoryBlockCount[rip]
        add     rax, 1
        mov     QWORD PTR memoryBlockCount[rip], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret
is_keyword:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L42
        call    init
.L42:
        mov     QWORD PTR -8[rbp], 0
        jmp     .L43
.L46:
        mov     rax, QWORD PTR -8[rbp]
        lea     rdx, 0[0+rax*8]
        lea     rax, keywordList[rip]
        mov     rax, QWORD PTR [rdx+rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L44
        mov     eax, 1
        jmp     .L45
.L44:
        add     QWORD PTR -8[rbp], 1
.L43:
        cmp     QWORD PTR -8[rbp], 21
        jbe     .L46
        mov     eax, 0
.L45:
        add     rsp, 48
        pop     rbp
        ret
.LC57:
        .ascii "\0"
.LC58:
        .ascii "%zu/%zu bytes\0"
.LC59:
        .ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
get_info:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR all_string_list[rip]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L48
.L49:
        add     QWORD PTR -8[rbp], 1
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -16[rbp], rax
.L48:
        cmp     QWORD PTR -16[rbp], 0
        jne     .L49
        mov     r8d, 0
        mov     edx, 48
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -24[rbp], rax
        mov     rcx, QWORD PTR struct_memory_count[rip]
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR struct_memory_used[rip]
        add     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC58[rip]
        mov     rcx, rax
        call    sprintf
        mov     r8d, 0
        mov     edx, 48
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -32[rbp], rax
        mov     rcx, QWORD PTR string_memory_count[rip]
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR string_memory_used[rip]
        add     rdx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC58[rip]
        mov     rcx, rax
        call    sprintf
        mov     r8d, 0
        mov     edx, 240
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -40[rbp], rax
        mov     rdx, QWORD PTR memoryBlockCount[rip]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR 48[rsp], rdx
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 40[rsp], rdx
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, rcx
        mov     r8d, 2
        lea     rdx, .LC59[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -40[rbp]
        add     rsp, 112
        pop     rbp
        ret
.LC60:
        .ascii "Error creating code member: content is NULL\12\0"
.LC61:
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
        jne     .L52
        cmp     QWORD PTR 24[rbp], 0
        je      .L52
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L53
.L52:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L54
        cmp     QWORD PTR 32[rbp], 0
        je      .L54
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L53
.L54:
        cmp     DWORD PTR 16[rbp], 2
        jne     .L55
        cmp     QWORD PTR 40[rbp], 0
        je      .L55
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L53
.L55:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L56
        cmp     QWORD PTR 32[rbp], 0
        jne     .L56
        cmp     QWORD PTR 40[rbp], 0
        jne     .L56
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 44
        mov     edx, 1
        lea     rax, .LC60[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L53
.L56:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC61[rip]
        mov     rdx, rax
        call    fprintf
.L53:
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
.LC62:
        .ascii "Error creating import: name is NULL\12\0"
create_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L61
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 36
        mov     edx, 1
        lea     rax, .LC62[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L62
.L61:
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
.L62:
        add     rsp, 48
        pop     rbp
        ret
.LC63:
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
        je      .L64
        cmp     QWORD PTR 32[rbp], 0
        jne     .L65
.L64:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 53
        mov     edx, 1
        lea     rax, .LC63[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L66
.L65:
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
.L66:
        add     rsp, 32
        pop     rbp
        ret
.LC64:
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
        je      .L68
        cmp     QWORD PTR 32[rbp], 0
        jne     .L69
.L68:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 51
        mov     edx, 1
        lea     rax, .LC64[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L70
.L69:
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
.L70:
        add     rsp, 32
        pop     rbp
        ret
.LC65:
        .ascii "Error creating class member: content is NULL\12\0"
.LC66:
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
        jne     .L72
        cmp     QWORD PTR 24[rbp], 0
        je      .L72
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L73
.L72:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L74
        cmp     QWORD PTR 32[rbp], 0
        je      .L74
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L73
.L74:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L75
        cmp     QWORD PTR 32[rbp], 0
        jne     .L75
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 45
        mov     edx, 1
        lea     rax, .LC65[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L76
.L75:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC66[rip]
        mov     rdx, rax
        call    fprintf
.L76:
        mov     eax, 0
        jmp     .L77
.L73:
        mov     rax, QWORD PTR -8[rbp]
.L77:
        add     rsp, 48
        pop     rbp
        ret
.LC67:
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
        jne     .L79
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 35
        mov     edx, 1
        lea     rax, .LC67[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L80
.L79:
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
.L80:
        add     rsp, 32
        pop     rbp
        ret
.LC68:
        .ascii "Error creating variable: type or name is NULL\12\0"
create_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        je      .L82
        cmp     QWORD PTR 24[rbp], 0
        jne     .L83
.L82:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 46
        mov     edx, 1
        lea     rax, .LC68[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L84
.L83:
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
.L84:
        add     rsp, 48
        pop     rbp
        ret
.LC69:
        .ascii "Error creating statement: content is NULL\12\0"
.LC70:
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
        jne     .L86
        cmp     QWORD PTR 48[rbp], 0
        je      .L86
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L87
.L86:
        cmp     DWORD PTR 16[rbp], 1
        jne     .L88
        cmp     QWORD PTR 56[rbp], 0
        je      .L88
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L87
.L88:
        cmp     DWORD PTR 16[rbp], 2
        jne     .L89
        cmp     QWORD PTR 24[rbp], 0
        je      .L89
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L87
.L89:
        cmp     DWORD PTR 16[rbp], 3
        jne     .L90
        cmp     QWORD PTR 32[rbp], 0
        je      .L90
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L87
.L90:
        cmp     DWORD PTR 16[rbp], 4
        jne     .L91
        cmp     QWORD PTR 40[rbp], 0
        je      .L91
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L87
.L91:
        cmp     DWORD PTR 16[rbp], 5
        jne     .L92
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L87
.L92:
        cmp     DWORD PTR 16[rbp], 6
        je      .L93
        cmp     DWORD PTR 16[rbp], 7
        jne     .L94
.L93:
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        jmp     .L87
.L94:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L95
        cmp     QWORD PTR 32[rbp], 0
        jne     .L95
        cmp     QWORD PTR 40[rbp], 0
        jne     .L95
        cmp     QWORD PTR 48[rbp], 0
        jne     .L95
        cmp     QWORD PTR 56[rbp], 0
        jne     .L95
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 42
        mov     edx, 1
        lea     rax, .LC69[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L96
.L95:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC70[rip]
        mov     rdx, rax
        call    fprintf
.L96:
        mov     eax, 0
        jmp     .L97
.L87:
        mov     rax, QWORD PTR -8[rbp]
.L97:
        add     rsp, 48
        pop     rbp
        ret
.LC71:
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
        jne     .L99
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 47
        mov     edx, 1
        lea     rax, .LC71[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L100
.L99:
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
.L100:
        add     rsp, 48
        pop     rbp
        ret
.LC72:
        .ascii "Error creating else-if statement: condition is NULL\12\0"
create_else_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L102
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 52
        mov     edx, 1
        lea     rax, .LC72[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L103
.L102:
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
.L103:
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
.LC73:
        .ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
.LC74:
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
        jne     .L109
        cmp     QWORD PTR 56[rbp], 0
        jne     .L110
        cmp     QWORD PTR 64[rbp], 0
        jne     .L110
.L109:
        cmp     QWORD PTR 72[rbp], 0
        jne     .L111
        lea     rsi, .LC11[rip]
        jmp     .L112
.L111:
        lea     rsi, .LC12[rip]
.L112:
        cmp     QWORD PTR 64[rbp], 0
        jne     .L113
        lea     rbx, .LC11[rip]
        jmp     .L114
.L113:
        lea     rbx, .LC12[rip]
.L114:
        cmp     QWORD PTR 56[rbp], 0
        jne     .L115
        lea     r12, .LC11[rip]
        jmp     .L116
.L115:
        lea     r12, .LC12[rip]
.L116:
        cmp     DWORD PTR 48[rbp], 19
        jne     .L117
        lea     rdi, .LC11[rip]
        jmp     .L118
.L117:
        lea     rdi, .LC12[rip]
.L118:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 40[rsp], rsi
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, r12
        mov     r8, rdi
        lea     rax, .LC73[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L119
.L110:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 48[rbp]
        mov     DWORD PTR 24[rax], edx
        cmp     QWORD PTR 56[rbp], 0
        je      .L120
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L121
.L120:
        cmp     QWORD PTR 64[rbp], 0
        je      .L122
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L121
.L122:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 65
        mov     edx, 1
        lea     rax, .LC74[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L119
.L121:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L119:
        add     rsp, 64
        pop     rbx
        pop     rsi
        pop     rdi
        pop     r12
        pop     rbp
        ret
.LC75:
        .ascii "Error creating primary: value is NULL\12\0"
.LC76:
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
        je      .L124
        cmp     DWORD PTR 16[rbp], 1
        je      .L124
        cmp     DWORD PTR 16[rbp], 2
        je      .L124
        cmp     DWORD PTR 16[rbp], 3
        je      .L124
        cmp     DWORD PTR 16[rbp], 4
        jne     .L125
.L124:
        cmp     QWORD PTR 24[rbp], 0
        je      .L125
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L126
.L125:
        cmp     DWORD PTR 16[rbp], 5
        jne     .L127
        cmp     QWORD PTR 32[rbp], 0
        je      .L127
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L126
.L127:
        cmp     DWORD PTR 16[rbp], 6
        je      .L128
        cmp     DWORD PTR 16[rbp], 7
        jne     .L129
.L128:
        cmp     QWORD PTR 40[rbp], 0
        je      .L129
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L126
.L129:
        cmp     DWORD PTR 16[rbp], 8
        jne     .L130
        cmp     QWORD PTR 48[rbp], 0
        je      .L130
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L126
.L130:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L131
        cmp     QWORD PTR 32[rbp], 0
        jne     .L131
        cmp     QWORD PTR 40[rbp], 0
        jne     .L131
        cmp     QWORD PTR 48[rbp], 0
        jne     .L131
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 38
        mov     edx, 1
        lea     rax, .LC75[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L132
.L131:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC76[rip]
        mov     rdx, rax
        call    fprintf
.L132:
        mov     eax, 0
        jmp     .L133
.L126:
        mov     rax, QWORD PTR -8[rbp]
.L133:
        add     rsp, 48
        pop     rbp
        ret
.LC77:
        .ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
.LC78:
        .ascii "Error creating variable access: content is NULL\12\0"
.LC79:
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
        je      .L135
        cmp     DWORD PTR 32[rbp], 0
        jne     .L136
        lea     rsi, .LC11[rip]
        jmp     .L137
.L136:
        lea     rsi, .LC12[rip]
.L137:
        cmp     QWORD PTR 40[rbp], 0
        jne     .L138
        lea     rbx, .LC11[rip]
        jmp     .L139
.L138:
        lea     rbx, .LC12[rip]
.L139:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC77[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L140
.L135:
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
        jne     .L141
        cmp     QWORD PTR 48[rbp], 0
        je      .L141
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L142
.L141:
        cmp     DWORD PTR 32[rbp], 1
        jne     .L143
        cmp     QWORD PTR 64[rbp], 0
        je      .L143
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L142
.L143:
        cmp     DWORD PTR 32[rbp], 3
        jne     .L144
        cmp     QWORD PTR 56[rbp], 0
        je      .L144
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L142
.L144:
        cmp     DWORD PTR 32[rbp], 2
        jne     .L145
        cmp     QWORD PTR 48[rbp], 0
        je      .L145
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L142
.L145:
        cmp     QWORD PTR 48[rbp], 0
        jne     .L146
        cmp     QWORD PTR 56[rbp], 0
        jne     .L146
        cmp     QWORD PTR 64[rbp], 0
        jne     .L146
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 48
        mov     edx, 1
        lea     rax, .LC78[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L147
.L146:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 32[rbp]
        mov     r8d, eax
        lea     rax, .LC79[rip]
        mov     rdx, rax
        call    fprintf
.L147:
        mov     eax, 0
        jmp     .L140
.L142:
        mov     rax, QWORD PTR -8[rbp]
.L140:
        add     rsp, 48
        pop     rbx
        pop     rsi
        pop     rbp
        ret
read_source:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     r8d, 2
        mov     edx, 0
        mov     rcx, rax
        call    fseek
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    ftell
        movsx   rdx, eax
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    fseek
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        add     rax, 1
        mov     r8d, 0
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 1
        mov     rcx, rax
        call    fread
        mov     QWORD PTR -24[rbp], rax
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     QWORD PTR -8[rbp], 0
        jmp     .L149
.L152:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 13
        je      .L150
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 9
        jne     .L151
.L150:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 32
.L151:
        add     QWORD PTR -8[rbp], 1
.L149:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR -8[rbp], rax
        jb      .L152
        mov     rax, QWORD PTR -16[rbp]
        add     rsp, 64
        pop     rbp
        ret
.LC80:
        .ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC81:
        .ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC82:
        .ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC83:
        .ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC84:
        .ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC85:
        .ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC86:
        .ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC87:
        .ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC88:
        .ascii "\\0\0"
.LC89:
        .ascii "\\n\0"
.LC90:
        .ascii "\\t\0"
.LC91:
        .ascii "\\r\0"
.LC92:
        .ascii "'\12\0"
output_one_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        jne     .L155
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC80[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L154
.L155:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        jne     .L157
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC81[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L158
.L157:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        jne     .L159
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC82[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L158
.L159:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        jne     .L160
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC83[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L158
.L160:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L161
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC84[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L158
.L161:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L162
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC85[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L158
.L162:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L163
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC86[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L158
.L163:
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 7
        jne     .L158
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC87[rip]
        mov     rcx, rax
        call    fprintf
.L158:
        mov     QWORD PTR -8[rbp], 0
        jmp     .L164
.L170:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR -9[rbp], al
        cmp     BYTE PTR -9[rbp], 0
        jne     .L165
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC88[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L166
.L165:
        cmp     BYTE PTR -9[rbp], 10
        jne     .L167
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC89[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L166
.L167:
        cmp     BYTE PTR -9[rbp], 9
        jne     .L168
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC90[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L166
.L168:
        cmp     BYTE PTR -9[rbp], 13
        jne     .L169
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC91[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L166
.L169:
        movsx   eax, BYTE PTR -9[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     ecx, eax
        call    fputc
.L166:
        add     QWORD PTR -8[rbp], 1
.L164:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        cmp     QWORD PTR -8[rbp], rax
        jb      .L170
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC92[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L154:
        add     rsp, 48
        pop     rbp
        ret
.LC93:
        .ascii "\12info by lib:\12    %s\12\0"
output_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L172
.L175:
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    output_one_token
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        je      .L176
        mov     rax, QWORD PTR 24[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L172:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L175
        jmp     .L174
.L176:
        nop
.L174:
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC93[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 48
        pop     rbp
        ret
output_ast:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        lea     rcx, -32[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    output_code
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC93[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 64
        pop     rbp
        ret
output_tac:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    output_TAC
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, rdx
        lea     rdx, .LC93[rip]
        mov     rcx, rax
        call    fprintf
        nop
        add     rsp, 32
        pop     rbp
        ret
.LC94:
        .ascii "r\0"
.LC95:
        .ascii "Error opening file: %s\12\0"
.LC96:
        .ascii ".token\0"
.LC97:
        .ascii "w\0"
.LC98:
        .ascii ".ast\0"
.LC99:
        .ascii ".tc\0"
.LC100:
        .ascii ".tac\0"
parse_file:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 160
        mov     QWORD PTR 16[rbp], rcx
        mov     eax, edx
        mov     ecx, r8d
        mov     edx, r9d
        mov     BYTE PTR 24[rbp], al
        mov     eax, ecx
        mov     BYTE PTR 32[rbp], al
        mov     eax, edx
        mov     BYTE PTR 40[rbp], al
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    create_file
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     QWORD PTR -120[rbp], 0
        mov     rax, QWORD PTR -24[rbp]
        lea     rdx, .LC94[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L180
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     r8, rax
        lea     rax, .LC95[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L179
.L180:
        lea     rdx, -120[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    read_source
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    fclose
        mov     rdx, QWORD PTR -120[rbp]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_lexer
        mov     QWORD PTR -48[rbp], rax
        cmp     BYTE PTR 24[rbp], 0
        je      .L182
        mov     r8d, 1
        mov     edx, 6
        lea     rax, .LC96[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        lea     rdx, .LC97[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L183
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     r8, rax
        lea     rax, .LC95[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L182
.L183:
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    output_token
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    fclose
.L182:
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    reset_lexer
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_parser
        mov     QWORD PTR -72[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        cmp     BYTE PTR 32[rbp], 0
        jne     .L184
        cmp     BYTE PTR 40[rbp], 0
        je      .L185
.L184:
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rcx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_code
        mov     QWORD PTR -8[rbp], rax
.L185:
        cmp     BYTE PTR 32[rbp], 0
        je      .L186
        mov     r8d, 1
        mov     edx, 4
        lea     rax, .LC98[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -80[rbp], rax
        mov     r8d, 1
        mov     edx, 3
        lea     rax, .LC99[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -80[rbp]
        lea     rdx, .LC97[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L187
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -80[rbp]
        mov     r8, rax
        lea     rax, .LC95[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L186
.L187:
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    output_ast
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    fclose
.L186:
        cmp     BYTE PTR 40[rbp], 0
        je      .L179
        mov     r8d, 1
        mov     edx, 4
        lea     rax, .LC100[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -96[rbp], rax
        mov     r8d, 1
        mov     edx, 3
        lea     rax, .LC99[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    change_file_extension
        mov     rax, QWORD PTR -96[rbp]
        lea     rdx, .LC97[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -104[rbp], rax
        cmp     QWORD PTR -104[rbp], 0
        jne     .L189
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -96[rbp]
        mov     r8, rax
        lea     rax, .LC95[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L179
.L189:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    tac_code
        mov     QWORD PTR -112[rbp], rax
        mov     rdx, QWORD PTR -112[rbp]
        mov     rax, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    output_tac
        mov     rax, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    fclose
        nop
.L179:
        add     rsp, 160
        pop     rbp
        ret
create_list:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_node:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC101:
        .ascii "Error: list_append received NULL list\12\0"
list_append:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L195
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 38
        mov     edx, 1
        lea     rax, .LC101[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L194
.L195:
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    create_node
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L197
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L194
.L197:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
.L194:
        add     rsp, 48
        pop     rbp
        ret
list_copy:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L199
        mov     eax, 0
        jmp     .L200
.L199:
        call    create_list
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
.L200:
        add     rsp, 48
        pop     rbp
        ret
list_pop:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR 16[rbp], rcx
        cmp     QWORD PTR 16[rbp], 0
        je      .L202
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L203
.L202:
        mov     eax, 0
        jmp     .L204
.L203:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L205
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], 0
.L205:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
.L204:
        add     rsp, 16
        pop     rbp
        ret
list_pop_back:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        cmp     QWORD PTR 16[rbp], 0
        je      .L207
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L208
.L207:
        mov     eax, 0
        jmp     .L209
.L208:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     rdx, rax
        jne     .L210
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L209
.L210:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L211
.L212:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
.L211:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     rdx, rax
        jne     .L212
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -16[rbp]
.L209:
        add     rsp, 32
        pop     rbp
        ret
.LC102:
        .ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
.LC103:
        .ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
.LC104:
        .ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
.LC105:
        .ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
create_symbol:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     DWORD PTR 56[rbp], edx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR 72[rbp], r9
        mov     QWORD PTR -8[rbp], 0
        cmp     DWORD PTR 56[rbp], 6
        ja      .L214
        cmp     DWORD PTR 56[rbp], 3
        jnb     .L215
        cmp     DWORD PTR 56[rbp], 2
        je      .L216
        cmp     DWORD PTR 56[rbp], 2
        ja      .L214
        cmp     DWORD PTR 56[rbp], 0
        je      .L217
        cmp     DWORD PTR 56[rbp], 1
        je      .L218
        jmp     .L214
.L217:
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L219
.L218:
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L219
.L216:
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L219
.L215:
        mov     rax, QWORD PTR 72[rbp]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L219
.L214:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 56[rbp]
        mov     r8d, eax
        lea     rax, .LC102[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L219:
        mov     rdx, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L220
        mov     rax, QWORD PTR id_counter.0[rip]
        lea     rsi, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rbx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     edi, DWORD PTR 32[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 40[rsp], rsi
        mov     QWORD PTR 32[rsp], rbx
        mov     r9d, edi
        mov     r8, rax
        lea     rax, .LC103[rip]
        mov     rdx, rax
        call    fprintf
.L220:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR id_counter.0[rip]
        add     rax, 1
        mov     QWORD PTR id_counter.0[rip], rax
        mov     rdx, QWORD PTR id_counter.0[rip]
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -24[rbp]
        mov     edx, DWORD PTR 56[rbp]
        mov     DWORD PTR 32[rax], edx
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR [rax], rdx
        cmp     DWORD PTR 56[rbp], 6
        ja      .L221
        cmp     DWORD PTR 56[rbp], 3
        jnb     .L222
        cmp     DWORD PTR 56[rbp], 2
        je      .L223
        cmp     DWORD PTR 56[rbp], 2
        ja      .L221
        cmp     DWORD PTR 56[rbp], 0
        je      .L224
        cmp     DWORD PTR 56[rbp], 1
        je      .L225
        jmp     .L221
.L224:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L226
.L225:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L226
.L223:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L226
.L222:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     QWORD PTR 24[rax], rdx
        jmp     .L226
.L221:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 56[rbp]
        mov     r8d, eax
        lea     rax, .LC104[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L226:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L227
        mov     rax, QWORD PTR -24[rbp]
        mov     rbx, QWORD PTR 16[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     edx, DWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rsp], rbx
        mov     r9d, edx
        mov     r8, rax
        lea     rax, .LC105[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L228
.L227:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
.L228:
        mov     rax, QWORD PTR -24[rbp]
        add     rsp, 88
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
create_symbol_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
search_name_use_strcmp:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        jmp     .L233
.L238:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L234
.L237:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L235
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L236
.L235:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
.L234:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L237
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 16[rbp], rax
.L233:
        cmp     QWORD PTR 16[rbp], 0
        jne     .L238
        mov     eax, 0
.L236:
        add     rsp, 64
        pop     rbp
        ret
search_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        jmp     .L240
.L245:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L241
.L244:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     QWORD PTR 24[rbp], rax
        jne     .L242
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L243
.L242:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -8[rbp], rax
.L241:
        cmp     QWORD PTR -8[rbp], 0
        jne     .L244
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 16[rbp], rax
.L240:
        cmp     QWORD PTR 16[rbp], 0
        jne     .L245
        mov     eax, 0
.L243:
        add     rsp, 32
        pop     rbp
        ret
.LC106:
        .ascii "\342\224\202   \0"
.LC107:
        .ascii "    \0"
.LC108:
        .ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC109:
        .ascii "\342\224\234\342\224\200\342\224\200 \0"
indention:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     eax, r8d
        mov     QWORD PTR 40[rbp], r9
        mov     BYTE PTR 32[rbp], al
        cmp     BYTE PTR 32[rbp], 0
        jne     .L247
        mov     rax, QWORD PTR 24[rbp]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        add     rax, rdx
        movzx   edx, BYTE PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        and     eax, 7
        mov     r8d, 1
        mov     ecx, eax
        sal     r8d, cl
        mov     eax, r8d
        or      eax, edx
        jmp     .L248
.L247:
        mov     rax, QWORD PTR 24[rbp]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        add     rax, rdx
        movzx   edx, BYTE PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        and     eax, 7
        mov     r8d, 1
        mov     ecx, eax
        sal     r8d, cl
        mov     eax, r8d
        not     eax
        and     eax, edx
.L248:
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rdx
        shr     rcx, 3
        mov     rdx, QWORD PTR 40[rbp]
        add     rdx, rcx
        mov     BYTE PTR [rdx], al
        mov     QWORD PTR -8[rbp], 1
        jmp     .L249
.L252:
        mov     rax, QWORD PTR -8[rbp]
        shr     rax, 3
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR -8[rbp]
        and     eax, 7
        mov     ecx, eax
        sar     edx, cl
        mov     eax, edx
        and     eax, 1
        test    eax, eax
        je      .L250
        lea     rax, .LC106[rip]
        jmp     .L251
.L250:
        lea     rax, .LC107[rip]
.L251:
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, rax
        call    fprintf
        add     QWORD PTR -8[rbp], 1
.L249:
        mov     rax, QWORD PTR -8[rbp]
        cmp     rax, QWORD PTR 24[rbp]
        jb      .L252
        cmp     QWORD PTR 24[rbp], 0
        je      .L256
        cmp     BYTE PTR 32[rbp], 0
        je      .L254
        lea     rax, .LC108[rip]
        jmp     .L255
.L254:
        lea     rax, .LC109[rip]
.L255:
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, rax
        call    fprintf
.L256:
        nop
        add     rsp, 48
        pop     rbp
        ret
create_parser:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 9[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 11[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC110:
        .ascii "%s.tc\0"
.LC111:
        .ascii "D:/TC/std/\0"
.LC112:
        .ascii "Error opening library file for import: %s\12\0"
.LC113:
        .ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC114:
        .ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC115:
        .ascii "Error parsing library file for import: %s\12\0"
.LC116:
        .ascii "Error: Imported symbol '%s' was not found in %s\12\0"
parse_import_file:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 96
        lea     rbp, 96[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     QWORD PTR 56[rbp], r9
        mov     QWORD PTR -16[rbp], 0
        cmp     QWORD PTR 40[rbp], 0
        jne     .L260
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    strlen
        add     rax, 4
        mov     r8d, 0
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -24[rbp], rax
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r8, rdx
        lea     rdx, .LC110[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -24[rbp]
        lea     rdx, .LC111[rip]
        mov     rcx, rax
        call    absolute_path
        mov     QWORD PTR -8[rbp], rax
        jmp     .L261
.L260:
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    get_file_dir
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    absolute_path
        mov     QWORD PTR -8[rbp], rax
.L261:
        mov     rax, QWORD PTR -8[rbp]
        lea     rdx, .LC94[rip]
        mov     rcx, rax
        call    fopen
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L262
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC112[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L267
.L262:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC113[rip]
        mov     rdx, rax
        call    fprintf
        mov     QWORD PTR -56[rbp], 0
        lea     rdx, -56[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    read_source
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    fclose
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_file
        mov     rcx, rax
        call    create_parser
        mov     rsi, rax
        mov     rbx, QWORD PTR builtin_scope[rip]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_lexer
        mov     r8, rsi
        mov     rdx, rbx
        mov     rcx, rax
        call    parse_code
        mov     QWORD PTR -48[rbp], rax
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC114[rip]
        mov     rdx, rax
        call    fprintf
        cmp     QWORD PTR -48[rbp], 0
        jne     .L264
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r8, rax
        lea     rax, .LC115[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L267
.L264:
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L265
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L266
.L265:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 32[rbp]
        mov     r9, rdx
        mov     r8, rax
        lea     rax, .LC116[rip]
        mov     rdx, rax
        call    fprintf
.L266:
        mov     rax, QWORD PTR -16[rbp]
.L267:
        add     rsp, 96
        pop     rbx
        pop     rsi
        pop     rbp
        ret
.LC117:
        .ascii "%s.%s\0"
make_method_name:
        push    rbp
        push    rbx
        sub     rsp, 56
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    strlen
        add     rax, rbx
        add     rax, 2
        mov     r8d, 1
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR -8[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC117[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret
string_to_operator:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR symbolList[rip+144]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L271
        mov     eax, 13
        jmp     .L272
.L271:
        mov     rax, QWORD PTR symbolList[rip+184]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L273
        mov     eax, 14
        jmp     .L272
.L273:
        mov     rax, QWORD PTR symbolList[rip+192]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L274
        mov     eax, 15
        jmp     .L272
.L274:
        mov     rax, QWORD PTR symbolList[rip+200]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L275
        mov     eax, 16
        jmp     .L272
.L275:
        mov     rax, QWORD PTR symbolList[rip+208]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L276
        mov     eax, 17
        jmp     .L272
.L276:
        mov     rax, QWORD PTR symbolList[rip+216]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L277
        mov     eax, 18
        jmp     .L272
.L277:
        mov     rax, QWORD PTR symbolList[rip+224]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L278
        mov     eax, 11
        jmp     .L272
.L278:
        mov     rax, QWORD PTR symbolList[rip+232]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L279
        mov     eax, 12
        jmp     .L272
.L279:
        mov     rax, QWORD PTR symbolList[rip+152]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L280
        mov     eax, 5
        jmp     .L272
.L280:
        mov     rax, QWORD PTR symbolList[rip+160]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L281
        mov     eax, 6
        jmp     .L272
.L281:
        mov     rax, QWORD PTR symbolList[rip+128]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L282
        mov     eax, 7
        jmp     .L272
.L282:
        mov     rax, QWORD PTR symbolList[rip+136]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L283
        mov     eax, 8
        jmp     .L272
.L283:
        mov     rax, QWORD PTR symbolList[rip+168]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L284
        mov     eax, 9
        jmp     .L272
.L284:
        mov     rax, QWORD PTR symbolList[rip+176]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L285
        mov     eax, 10
        jmp     .L272
.L285:
        mov     rax, QWORD PTR symbolList[rip+88]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L286
        mov     eax, 0
        jmp     .L272
.L286:
        mov     rax, QWORD PTR symbolList[rip+96]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L287
        mov     eax, 1
        jmp     .L272
.L287:
        mov     rax, QWORD PTR symbolList[rip+104]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L288
        mov     eax, 2
        jmp     .L272
.L288:
        mov     rax, QWORD PTR symbolList[rip+112]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L289
        mov     eax, 3
        jmp     .L272
.L289:
        mov     rax, QWORD PTR symbolList[rip+120]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L290
        mov     eax, 4
        jmp     .L272
.L290:
        mov     eax, 19
.L272:
        pop     rbp
        ret
operator_precedence:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L292
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L294[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L294[rip]
        add     rax, rdx
        jmp     rax
.L294:
        .long   .L298-.L294
        .long   .L298-.L294
        .long   .L297-.L294
        .long   .L297-.L294
        .long   .L297-.L294
        .long   .L296-.L294
        .long   .L296-.L294
        .long   .L296-.L294
        .long   .L296-.L294
        .long   .L296-.L294
        .long   .L296-.L294
        .long   .L295-.L294
        .long   .L295-.L294
        .long   .L293-.L294
        .long   .L293-.L294
        .long   .L293-.L294
        .long   .L293-.L294
        .long   .L293-.L294
        .long   .L293-.L294
.L293:
        mov     eax, 1
        jmp     .L299
.L295:
        mov     eax, 2
        jmp     .L299
.L296:
        mov     eax, 3
        jmp     .L299
.L298:
        mov     eax, 4
        jmp     .L299
.L297:
        mov     eax, 5
        jmp     .L299
.L292:
        mov     eax, 0
.L299:
        pop     rbp
        ret
operator_to_string:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L301
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L303[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L303[rip]
        add     rax, rdx
        jmp     rax
.L303:
        .long   .L321-.L303
        .long   .L320-.L303
        .long   .L319-.L303
        .long   .L318-.L303
        .long   .L317-.L303
        .long   .L316-.L303
        .long   .L315-.L303
        .long   .L314-.L303
        .long   .L313-.L303
        .long   .L312-.L303
        .long   .L311-.L303
        .long   .L310-.L303
        .long   .L309-.L303
        .long   .L308-.L303
        .long   .L307-.L303
        .long   .L306-.L303
        .long   .L305-.L303
        .long   .L304-.L303
        .long   .L302-.L303
.L308:
        mov     rax, QWORD PTR symbolList[rip+144]
        jmp     .L322
.L307:
        mov     rax, QWORD PTR symbolList[rip+184]
        jmp     .L322
.L306:
        mov     rax, QWORD PTR symbolList[rip+192]
        jmp     .L322
.L305:
        mov     rax, QWORD PTR symbolList[rip+200]
        jmp     .L322
.L304:
        mov     rax, QWORD PTR symbolList[rip+208]
        jmp     .L322
.L302:
        mov     rax, QWORD PTR symbolList[rip+216]
        jmp     .L322
.L310:
        mov     rax, QWORD PTR symbolList[rip+224]
        jmp     .L322
.L309:
        mov     rax, QWORD PTR symbolList[rip+232]
        jmp     .L322
.L316:
        mov     rax, QWORD PTR symbolList[rip+152]
        jmp     .L322
.L315:
        mov     rax, QWORD PTR symbolList[rip+160]
        jmp     .L322
.L314:
        mov     rax, QWORD PTR symbolList[rip+128]
        jmp     .L322
.L313:
        mov     rax, QWORD PTR symbolList[rip+136]
        jmp     .L322
.L312:
        mov     rax, QWORD PTR symbolList[rip+168]
        jmp     .L322
.L311:
        mov     rax, QWORD PTR symbolList[rip+176]
        jmp     .L322
.L321:
        mov     rax, QWORD PTR symbolList[rip+88]
        jmp     .L322
.L320:
        mov     rax, QWORD PTR symbolList[rip+96]
        jmp     .L322
.L319:
        mov     rax, QWORD PTR symbolList[rip+104]
        jmp     .L322
.L318:
        mov     rax, QWORD PTR symbolList[rip+112]
        jmp     .L322
.L317:
        mov     rax, QWORD PTR symbolList[rip+120]
        jmp     .L322
.L301:
        mov     eax, 0
.L322:
        pop     rbp
        ret
create_lexer:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     ecx, 88
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 32[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 40[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 48[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 56[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 64[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 72[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 80[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 24[rax], edx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
get_current_char:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        cmp     rdx, rax
        jb      .L328
        mov     eax, 0
        jmp     .L329
.L328:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 40[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR 16[rdx], rcx
        add     rax, r8
        movzx   eax, BYTE PTR [rax]
.L329:
        pop     rbp
        ret
peek_next_char:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        cmp     rdx, rax
        jb      .L331
        mov     eax, 0
        jmp     .L332
.L331:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
.L332:
        pop     rbp
        ret
move_position:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     DWORD PTR 24[rbp], edx
        cmp     DWORD PTR 24[rbp], 0
        js      .L334
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     eax, DWORD PTR 24[rbp]
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 40[rax]
        mov     eax, DWORD PTR 24[rbp]
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 40[rax], rdx
        jmp     .L336
.L334:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     eax, DWORD PTR 24[rbp]
        neg     eax
        cdqe
        sub     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 40[rax]
        mov     eax, DWORD PTR 24[rbp]
        neg     eax
        cdqe
        sub     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 40[rax], rdx
.L336:
        nop
        pop     rbp
        ret
.LC118:
        .ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC119:
        .ascii "\0\0"
.LC120:
        .ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
.LC121:
        .ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
next_token:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 168
        lea     rbp, 160[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     eax, edx
        mov     BYTE PTR 56[rbp], al
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        cmp     BYTE PTR -1[rbp], 0
        jne     .L338
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 40[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     r9, rdx
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_token
        jmp     .L339
.L338:
        cmp     BYTE PTR -1[rbp], 32
        je      .L340
        cmp     BYTE PTR -1[rbp], 9
        je      .L340
        cmp     BYTE PTR -1[rbp], 13
        jne     .L341
.L340:
        movsx   edx, BYTE PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L339
.L341:
        cmp     BYTE PTR -1[rbp], 10
        jne     .L342
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 40[rax], 0
        movsx   edx, BYTE PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L339
.L342:
        cmp     BYTE PTR -1[rbp], 96
        jle     .L343
        cmp     BYTE PTR -1[rbp], 122
        jle     .L344
.L343:
        cmp     BYTE PTR -1[rbp], 64
        jle     .L345
        cmp     BYTE PTR -1[rbp], 90
        jle     .L344
.L345:
        cmp     BYTE PTR -1[rbp], 95
        jne     .L346
.L344:
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, 1
        mov     QWORD PTR -96[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        sub     rax, 1
        mov     QWORD PTR -104[rbp], rax
        jmp     .L347
.L349:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L347:
        cmp     BYTE PTR -1[rbp], 96
        jle     .L348
        cmp     BYTE PTR -1[rbp], 122
        jle     .L349
.L348:
        cmp     BYTE PTR -1[rbp], 64
        jle     .L350
        cmp     BYTE PTR -1[rbp], 90
        jle     .L349
.L350:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L351
        cmp     BYTE PTR -1[rbp], 57
        jle     .L349
.L351:
        cmp     BYTE PTR -1[rbp], 95
        je      .L349
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -96[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 8[rdx]
        mov     rdx, QWORD PTR -96[rbp]
        add     rcx, rdx
        mov     r8d, 1
        mov     rdx, rax
        call    create_string_check
        mov     QWORD PTR -112[rbp], rax
        mov     rax, QWORD PTR -112[rbp]
        mov     rcx, rax
        call    is_keyword
        test    al, al
        je      .L352
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rcx, QWORD PTR -104[rbp]
        mov     rax, QWORD PTR -112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 6
        call    create_token
        jmp     .L339
.L352:
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rcx, QWORD PTR -104[rbp]
        mov     rax, QWORD PTR -112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 1
        call    create_token
        jmp     .L339
.L346:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L353
        cmp     BYTE PTR -1[rbp], 57
        jg      .L353
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, 1
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        sub     rax, 1
        mov     QWORD PTR -32[rbp], rax
        jmp     .L354
.L356:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L354:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L355
        cmp     BYTE PTR -1[rbp], 57
        jle     .L356
.L355:
        mov     DWORD PTR -8[rbp], 2
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    peek_next_char
        mov     BYTE PTR -33[rbp], al
        cmp     BYTE PTR -1[rbp], 46
        jne     .L357
        cmp     BYTE PTR -33[rbp], 47
        jle     .L357
        cmp     BYTE PTR -33[rbp], 57
        jg      .L357
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        jmp     .L358
.L360:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L358:
        cmp     BYTE PTR -1[rbp], 47
        jle     .L359
        cmp     BYTE PTR -1[rbp], 57
        jle     .L360
.L359:
        mov     DWORD PTR -8[rbp], 3
.L357:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 8[rdx]
        mov     rdx, QWORD PTR -24[rbp]
        add     rcx, rdx
        mov     r8d, 1
        mov     rdx, rax
        call    create_string_check
        mov     rdx, rax
        mov     rcx, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR -8[rbp]
        mov     r9, rcx
        mov     r8, rbx
        mov     ecx, eax
        call    create_token
        jmp     .L339
.L353:
        cmp     BYTE PTR -1[rbp], 34
        jne     .L361
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        sub     rax, 1
        mov     QWORD PTR -88[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        jmp     .L362
.L364:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L362:
        cmp     BYTE PTR -1[rbp], 34
        je      .L363
        cmp     BYTE PTR -1[rbp], 0
        je      .L363
        cmp     BYTE PTR -1[rbp], 10
        jne     .L364
.L363:
        cmp     BYTE PTR -1[rbp], 34
        je      .L365
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rsi, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR [rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR -80[rbp]
        mov     QWORD PTR 32[rsp], rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC118[rip]
        mov     rdx, rax
        call    fprintf
        cmp     BYTE PTR -1[rbp], 10
        jne     .L365
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 40[rax], 0
.L365:
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -80[rbp]
        cmp     rax, 1
        jne     .L366
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 32[rax]
        mov     r8d, 1
        mov     edx, 1
        lea     rax, .LC119[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -88[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 4
        call    create_token
        jmp     .L339
.L366:
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -80[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -80[rbp]
        add     rax, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -88[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 4
        call    create_token
        jmp     .L339
.L361:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    peek_next_char
        mov     BYTE PTR -9[rbp], al
        cmp     BYTE PTR -1[rbp], 47
        jne     .L367
        cmp     BYTE PTR -9[rbp], 47
        jne     .L367
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        add     rax, 1
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        sub     rax, 1
        mov     QWORD PTR -56[rbp], rax
        jmp     .L368
.L370:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
.L368:
        cmp     BYTE PTR -1[rbp], 10
        je      .L369
        cmp     BYTE PTR -1[rbp], 0
        jne     .L370
.L369:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
        cmp     BYTE PTR 56[rbp], 0
        je      .L371
        movsx   edx, BYTE PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L339
.L371:
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 8[rdx]
        mov     rdx, QWORD PTR -48[rbp]
        add     rcx, rdx
        mov     r8d, 1
        mov     rdx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -56[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 7
        call    create_token
        jmp     .L339
.L367:
        cmp     BYTE PTR -1[rbp], 47
        jne     .L372
        cmp     BYTE PTR -9[rbp], 42
        jne     .L372
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        add     rax, 1
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        sub     rax, 1
        mov     QWORD PTR -72[rbp], rax
        jmp     .L373
.L378:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    peek_next_char
        mov     BYTE PTR -9[rbp], al
        cmp     BYTE PTR -1[rbp], 10
        jne     .L374
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 40[rax], 0
.L374:
        cmp     BYTE PTR -9[rbp], 0
        je      .L413
        cmp     BYTE PTR -1[rbp], 0
        jne     .L373
        mov     rax, QWORD PTR -64[rbp]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rsi, QWORD PTR [rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC120[rip]
        mov     rdx, rax
        call    fprintf
        cmp     BYTE PTR 56[rbp], 0
        je      .L377
        movsx   edx, BYTE PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L339
.L377:
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -64[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 8[rdx]
        mov     rdx, QWORD PTR -64[rbp]
        add     rcx, rdx
        mov     r8d, 1
        mov     rdx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -72[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 7
        call    create_token
        jmp     .L339
.L373:
        cmp     BYTE PTR -1[rbp], 42
        jne     .L378
        cmp     BYTE PTR -9[rbp], 47
        jne     .L378
        jmp     .L376
.L413:
        nop
.L376:
        cmp     BYTE PTR -9[rbp], 0
        jne     .L379
        cmp     BYTE PTR -1[rbp], 0
        jne     .L380
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, -1
        mov     rcx, rax
        call    move_position
.L380:
        mov     rax, QWORD PTR -64[rbp]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rsi, QWORD PTR [rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC120[rip]
        mov     rdx, rax
        call    fprintf
        cmp     BYTE PTR 56[rbp], 0
        je      .L381
        movsx   edx, BYTE PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L339
.L381:
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -64[rbp]
        mov     rdx, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 8[rdx]
        mov     rdx, QWORD PTR -64[rbp]
        add     rcx, rdx
        mov     r8d, 1
        mov     rdx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -72[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 7
        call    create_token
        jmp     .L339
.L379:
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     BYTE PTR -1[rbp], al
        cmp     BYTE PTR 56[rbp], 0
        je      .L382
        movsx   edx, BYTE PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    next_token
        jmp     .L339
.L382:
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 16[rax]
        sub     rax, QWORD PTR -64[rbp]
        lea     rdx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -64[rbp]
        add     rax, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -72[rbp]
        mov     r9, rdx
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 7
        call    create_token
        jmp     .L339
.L372:
        cmp     BYTE PTR -1[rbp], 61
        jne     .L383
        cmp     BYTE PTR -9[rbp], 61
        jne     .L383
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+152]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L383:
        cmp     BYTE PTR -1[rbp], 33
        jne     .L384
        cmp     BYTE PTR -9[rbp], 61
        jne     .L384
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+160]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L384:
        cmp     BYTE PTR -1[rbp], 60
        jne     .L385
        cmp     BYTE PTR -9[rbp], 61
        jne     .L385
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+168]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L385:
        cmp     BYTE PTR -1[rbp], 62
        jne     .L386
        cmp     BYTE PTR -9[rbp], 61
        jne     .L386
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+176]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L386:
        cmp     BYTE PTR -1[rbp], 43
        jne     .L387
        cmp     BYTE PTR -9[rbp], 61
        jne     .L387
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+184]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L387:
        cmp     BYTE PTR -1[rbp], 45
        jne     .L388
        cmp     BYTE PTR -9[rbp], 61
        jne     .L388
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+192]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L388:
        cmp     BYTE PTR -1[rbp], 42
        jne     .L389
        cmp     BYTE PTR -9[rbp], 61
        jne     .L389
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+200]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L389:
        cmp     BYTE PTR -1[rbp], 47
        jne     .L390
        cmp     BYTE PTR -9[rbp], 61
        jne     .L390
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+208]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L390:
        cmp     BYTE PTR -1[rbp], 37
        jne     .L391
        cmp     BYTE PTR -9[rbp], 61
        jne     .L391
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+216]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L391:
        cmp     BYTE PTR -1[rbp], 38
        jne     .L392
        cmp     BYTE PTR -9[rbp], 38
        jne     .L392
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+224]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L392:
        cmp     BYTE PTR -1[rbp], 124
        jne     .L393
        cmp     BYTE PTR -9[rbp], 124
        jne     .L393
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    get_current_char
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -2[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+232]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L393:
        cmp     BYTE PTR -1[rbp], 40
        jne     .L394
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L394:
        cmp     BYTE PTR -1[rbp], 41
        jne     .L395
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L395:
        cmp     BYTE PTR -1[rbp], 123
        jne     .L396
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L396:
        cmp     BYTE PTR -1[rbp], 125
        jne     .L397
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L397:
        cmp     BYTE PTR -1[rbp], 44
        jne     .L398
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+32]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L398:
        cmp     BYTE PTR -1[rbp], 33
        jne     .L399
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+40]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L399:
        cmp     BYTE PTR -1[rbp], 46
        jne     .L400
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+48]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L400:
        cmp     BYTE PTR -1[rbp], 91
        jne     .L401
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+56]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L401:
        cmp     BYTE PTR -1[rbp], 93
        jne     .L402
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+64]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L402:
        cmp     BYTE PTR -1[rbp], 59
        jne     .L403
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L403:
        cmp     BYTE PTR -1[rbp], 95
        jne     .L404
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+80]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L404:
        cmp     BYTE PTR -1[rbp], 43
        jne     .L405
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+88]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L405:
        cmp     BYTE PTR -1[rbp], 45
        jne     .L406
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+96]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L406:
        cmp     BYTE PTR -1[rbp], 42
        jne     .L407
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+104]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L407:
        cmp     BYTE PTR -1[rbp], 47
        jne     .L408
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+112]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L408:
        cmp     BYTE PTR -1[rbp], 37
        jne     .L409
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+120]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L409:
        cmp     BYTE PTR -1[rbp], 60
        jne     .L410
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+128]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L410:
        cmp     BYTE PTR -1[rbp], 62
        jne     .L411
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+136]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L411:
        cmp     BYTE PTR -1[rbp], 61
        jne     .L412
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 40[rax]
        lea     rcx, -1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR symbolList[rip+144]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 5
        call    create_token
        jmp     .L339
.L412:
        mov     rax, QWORD PTR 48[rbp]
        mov     rbx, QWORD PTR 40[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 32[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rsi, QWORD PTR [rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC121[rip]
        mov     rdx, rax
        call    fprintf
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_token
.L339:
        add     rsp, 168
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
get_next_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     eax, edx
        mov     BYTE PTR 24[rbp], al
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 48[rax]
        test    rax, rax
        je      .L415
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 48[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 80[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 56[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 64[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 72[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 40[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 48[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 80[rax]
        jmp     .L416
.L415:
        movsx   edx, BYTE PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 80[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 80[rax]
.L416:
        add     rsp, 48
        pop     rbp
        ret
peek_next_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     eax, edx
        mov     BYTE PTR 24[rbp], al
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 48[rax]
        test    rax, rax
        je      .L418
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 48[rax]
        jmp     .L419
.L418:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     QWORD PTR -24[rbp], rax
        movsx   edx, BYTE PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 56[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 64[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 40[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 72[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 40[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 48[rax], rdx
        mov     rax, QWORD PTR -32[rbp]
.L419:
        add     rsp, 64
        pop     rbp
        ret
reset_lexer:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 32[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 40[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 48[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 56[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 64[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 72[rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     QWORD PTR 80[rax], 0
        nop
        pop     rbp
        ret
.LC122:
        .ascii "import\12\0"
.LC123:
        .ascii "function\12\0"
.LC124:
        .ascii "class\12\0"
.LC125:
        .ascii "unknown_CodeMemberType: %u\12\0"
output_code_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 2
        je      .L422
        cmp     eax, 2
        ja      .L423
        test    eax, eax
        je      .L424
        cmp     eax, 1
        je      .L425
        jmp     .L423
.L424:
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
        lea     rax, .LC122[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_import
        jmp     .L426
.L425:
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
        lea     rax, .LC123[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_function
        jmp     .L426
.L422:
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
        lea     rax, .LC124[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_class
        jmp     .L426
.L423:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC125[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L426:
        nop
        add     rsp, 32
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
        jmp     .L428
.L429:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_code_member
.L428:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L429
        nop
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC126:
        .ascii "name\12\0"
.LC127:
        .ascii "NULL\0"
.LC128:
        .ascii "source: \"%s\"\12\0"
output_import:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
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
        lea     rax, .LC126[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L431
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        jmp     .L432
.L431:
        lea     rax, .LC127[rip]
.L432:
        mov     rcx, QWORD PTR 24[rbp]
        mov     r8, rax
        lea     rax, .LC128[rip]
        mov     rdx, rax
        call    fprintf
        nop
        add     rsp, 32
        pop     rbp
        ret
.LC129:
        .ascii "return_type\12\0"
.LC130:
        .ascii "parameters\12\0"
.LC131:
        .ascii "parameters[%d]\12\0"
.LC132:
        .ascii "body\12\0"
output_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
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
        lea     rax, .LC126[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC129[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC130[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        mov     DWORD PTR -4[rbp], -1
        jmp     .L434
.L435:
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
        lea     rdx, .LC131[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 2[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
.L434:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L435
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
        lea     rax, .LC132[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L436
.L437:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L436:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L437
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
        lea     rax, .LC126[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC129[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC130[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        mov     DWORD PTR -4[rbp], -1
        jmp     .L439
.L440:
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
        lea     rdx, .LC131[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 2[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
.L439:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L440
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
        lea     rax, .LC132[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L441
.L442:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L441:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L442
        nop
        nop
        add     rsp, 80
        pop     rbp
        ret
.LC133:
        .ascii "method\12\0"
.LC134:
        .ascii "variable\12\0"
.LC135:
        .ascii "unknown_ClassMemberType: %u\12\0"
output_class_member:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        je      .L444
        cmp     eax, 1
        je      .L445
        jmp     .L448
.L444:
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
        lea     rax, .LC133[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_method
        jmp     .L447
.L445:
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
        lea     rax, .LC134[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
        jmp     .L447
.L448:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC135[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L447:
        nop
        add     rsp, 32
        pop     rbp
        ret
.LC136:
        .ascii "members\12\0"
output_class:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
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
        lea     rax, .LC126[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC136[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        jmp     .L450
.L451:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_class_member
.L450:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L451
        nop
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC137:
        .ascii "type\12\0"
.LC138:
        .ascii "value\12\0"
.LC139:
        .ascii "value: \"NULL\"\12\0"
output_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
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
        lea     rax, .LC137[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC126[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L453
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
        lea     rax, .LC138[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L455
.L453:
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
        lea     rax, .LC139[rip]
        mov     rcx, rax
        call    fwrite
.L455:
        nop
        add     rsp, 32
        pop     rbp
        ret
.LC140:
        .ascii "if_statement\12\0"
.LC141:
        .ascii "for_statement\12\0"
.LC142:
        .ascii "while_statement\12\0"
.LC143:
        .ascii "variable_declaration_statement\12\0"
.LC144:
        .ascii "return_statement: \"NULL\"\12\0"
.LC145:
        .ascii "return_statement\12\0"
.LC146:
        .ascii "break_statement: \"NULL\"\12\0"
.LC147:
        .ascii "continue_statement: \"NULL\"\12\0"
.LC148:
        .ascii "expression_statement: \"NULL\"\12\0"
.LC149:
        .ascii "expression_statement\12\0"
.LC150:
        .ascii "unknown_StatementType: %u\12\0"
output_statement:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 7
        ja      .L457
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L459[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L459[rip]
        add     rax, rdx
        jmp     rax
.L459:
        .long   .L466-.L459
        .long   .L465-.L459
        .long   .L464-.L459
        .long   .L463-.L459
        .long   .L462-.L459
        .long   .L461-.L459
        .long   .L460-.L459
        .long   .L458-.L459
.L464:
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
        lea     rax, .LC140[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_if
        jmp     .L456
.L462:
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
        lea     rax, .LC141[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_for
        jmp     .L456
.L463:
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
        lea     rax, .LC142[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_while
        jmp     .L456
.L465:
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
        lea     rax, .LC143[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
        jmp     .L456
.L461:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L468
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
        lea     rax, .LC144[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L456
.L468:
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
        lea     rax, .LC145[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L456
.L460:
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
        lea     rax, .LC146[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L456
.L458:
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
        lea     rax, .LC147[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L456
.L466:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L469
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
        lea     rax, .LC148[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L456
.L469:
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
        lea     rax, .LC149[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L456
.L457:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC150[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L456:
        add     rsp, 32
        pop     rbp
        ret
.LC151:
        .ascii "condition\12\0"
.LC152:
        .ascii "else_if\12\0"
.LC153:
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
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
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
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC151[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC132[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L471
.L472:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L471:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L472
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
        lea     rax, .LC152[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L473
.L474:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_else_if
.L473:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L474
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
        lea     rax, .LC153[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L475
.L476:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L475:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L476
        nop
        nop
        add     rsp, 80
        pop     rbp
        ret
output_else_if:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
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
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC151[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC132[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L478
.L479:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L478:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L479
        nop
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC154:
        .ascii "initializer\12\0"
.LC155:
        .ascii "initializer: \"NULL\"\12\0"
.LC156:
        .ascii "condition: \"NULL\"\12\0"
.LC157:
        .ascii "increment\12\0"
.LC158:
        .ascii "increment: \"NULL\"\12\0"
output_for:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L481
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
        lea     rax, .LC154[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable
        jmp     .L482
.L481:
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
        lea     rax, .LC155[rip]
        mov     rcx, rax
        call    fwrite
.L482:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L483
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
        lea     rax, .LC151[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L484
.L483:
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
        lea     rax, .LC156[rip]
        mov     rcx, rax
        call    fwrite
.L484:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L485
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
        lea     rax, .LC157[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L486
.L485:
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
        lea     rax, .LC158[rip]
        mov     rcx, rax
        call    fwrite
.L486:
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
        lea     rax, .LC132[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L487
.L488:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L487:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L488
        nop
        nop
        add     rsp, 48
        pop     rbp
        ret
output_while:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
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
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC151[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC132[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L490
.L491:
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_statement
.L490:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L491
        nop
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC159:
        .ascii "primary\12\0"
.LC160:
        .ascii "UNKNOWN_OPERATOR\0"
.LC161:
        .ascii "operator: \"%s\"\12\0"
.LC162:
        .ascii "left\12\0"
.LC163:
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
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 19
        jne     .L493
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
        lea     rax, .LC159[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_primary
        jmp     .L497
.L493:
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        mov     ecx, eax
        call    operator_to_string
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        cmp     QWORD PTR -8[rbp], 0
        je      .L495
        mov     rax, QWORD PTR -8[rbp]
        jmp     .L496
.L495:
        lea     rax, .LC160[rip]
.L496:
        mov     rcx, QWORD PTR 24[rbp]
        mov     r8, rax
        lea     rax, .LC161[rip]
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
        lea     rax, .LC162[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC163[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
.L497:
        nop
        add     rsp, 48
        pop     rbp
        ret
.LC164:
        .ascii "type: \"integer\"\12\0"
.LC165:
        .ascii "value: %s\12\0"
.LC166:
        .ascii "type: \"float\"\12\0"
.LC167:
        .ascii "type: \"string\"\12\0"
.LC168:
        .ascii "value: \"%s\"\12\0"
.LC169:
        .ascii "type: \"boolean\"\12\0"
.LC170:
        .ascii "value: \"true\"\12\0"
.LC171:
        .ascii "value: \"false\"\12\0"
.LC172:
        .ascii "type: \"expression\"\12\0"
.LC173:
        .ascii "type: \"!\"\12\0"
.LC174:
        .ascii "type: \"-\"\12\0"
.LC175:
        .ascii "type: \"variable\"\12\0"
.LC176:
        .ascii "unknown_PrimaryType: %u\12\0"
output_primary:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 8
        ja      .L499
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L501[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L501[rip]
        add     rax, rdx
        jmp     rax
.L501:
        .long   .L509-.L501
        .long   .L508-.L501
        .long   .L507-.L501
        .long   .L506-.L501
        .long   .L505-.L501
        .long   .L504-.L501
        .long   .L503-.L501
        .long   .L502-.L501
        .long   .L500-.L501
.L509:
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
        lea     rax, .LC164[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC165[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L510
.L508:
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
        lea     rax, .LC166[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC165[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L510
.L507:
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
        lea     rax, .LC167[rip]
        mov     rcx, rax
        call    fwrite
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC168[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L510
.L506:
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
        lea     rax, .LC169[rip]
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
        lea     rax, .LC170[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L510
.L505:
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
        lea     rax, .LC169[rip]
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
        lea     rax, .LC171[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L510
.L504:
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
        lea     rax, .LC172[rip]
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
        lea     rax, .LC138[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L510
.L503:
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
        lea     rax, .LC173[rip]
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
        lea     rax, .LC138[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_primary
        jmp     .L510
.L502:
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
        lea     rax, .LC174[rip]
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
        lea     rax, .LC138[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_primary
        jmp     .L510
.L500:
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
        lea     rax, .LC175[rip]
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
        lea     rax, .LC138[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_variable_access
        jmp     .L510
.L499:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, DWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC176[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L510:
        nop
        add     rsp, 32
        pop     rbp
        ret
.LC177:
        .ascii "type: \"name\"\12\0"
.LC178:
        .ascii "type: \"function_call\"\12\0"
.LC179:
        .ascii "arguments\12\0"
.LC180:
        .ascii "arguments[%d]\12\0"
.LC181:
        .ascii "type: \"get sequence_element\"\12\0"
.LC182:
        .ascii "sequence\12\0"
.LC183:
        .ascii "index\12\0"
.LC184:
        .ascii "type: \"get_attribute\"\12\0"
.LC185:
        .ascii "object\12\0"
.LC186:
        .ascii "attribute_name\12\0"
.LC187:
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
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 3
        je      .L512
        cmp     eax, 3
        ja      .L513
        cmp     eax, 2
        je      .L514
        cmp     eax, 2
        ja      .L513
        test    eax, eax
        je      .L515
        cmp     eax, 1
        je      .L516
        jmp     .L513
.L515:
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
        lea     rax, .LC177[rip]
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
        lea     rax, .LC126[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L517
.L516:
        mov     rax, QWORD PTR 16[rbp]
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
        mov     r8d, 22
        mov     edx, 1
        lea     rax, .LC178[rip]
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
        lea     rax, .LC123[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC179[rip]
        mov     rcx, rax
        call    fwrite
        mov     DWORD PTR -4[rbp], -1
        jmp     .L518
.L519:
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
        lea     rdx, .LC180[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 2[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
.L518:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L519
        jmp     .L517
.L512:
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
        lea     rax, .LC181[rip]
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
        lea     rax, .LC182[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC183[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_expression
        jmp     .L517
.L514:
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
        lea     rax, .LC184[rip]
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
        lea     rax, .LC185[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
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
        lea     rax, .LC186[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L517
.L513:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 1
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, DWORD PTR 16[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC187[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L517:
        nop
        add     rsp, 64
        pop     rbp
        ret
.LC188:
        .ascii "Name: \"NULL\"\12\0"
.LC189:
        .ascii "name: \"%s\"\12\0"
.LC190:
        .ascii "id: %zu\12\0"
.LC191:
        .ascii "kind: \"type\"\12\0"
.LC192:
        .ascii "kind: \"variable\"\12\0"
.LC193:
        .ascii "kind: \"function\"\12\0"
.LC194:
        .ascii "kind: \"method\"\12\0"
.LC195:
        .ascii "kind: \"class\"\12\0"
.LC196:
        .ascii "kind: \"attribute\"\12\0"
.LC197:
        .ascii "kind: \"parameter\"\12\0"
.LC198:
        .ascii "kind: \"unknown_NameType\"\12\0"
output_name:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 16[rbp], 0
        jne     .L521
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
        lea     rax, .LC188[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L520
.L521:
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC189[rip]
        mov     rcx, rax
        call    fprintf
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     rcx, rax
        call    indention
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC190[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 6
        ja      .L523
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L525[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L525[rip]
        add     rax, rdx
        jmp     rax
.L525:
        .long   .L531-.L525
        .long   .L530-.L525
        .long   .L529-.L525
        .long   .L528-.L525
        .long   .L527-.L525
        .long   .L526-.L525
        .long   .L524-.L525
.L524:
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
        lea     rax, .LC191[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L520
.L528:
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
        lea     rax, .LC192[rip]
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
        lea     rax, .LC137[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L520
.L530:
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
        lea     rax, .LC193[rip]
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
        lea     rax, .LC129[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L520
.L529:
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
        lea     rax, .LC194[rip]
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
        lea     rax, .LC129[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L520
.L531:
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
        lea     rax, .LC195[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L520
.L526:
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
        lea     rax, .LC196[rip]
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
        lea     rax, .LC137[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L520
.L527:
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
        lea     rax, .LC197[rip]
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
        lea     rax, .LC137[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 32[rbp]
        lea     r8, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     rcx, rax
        call    output_name
        jmp     .L520
.L523:
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
        lea     rax, .LC198[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L520:
        add     rsp, 32
        pop     rbp
        ret
.LC199:
        .ascii "TAC: \"NULL\"\12\0"
.LC200:
        .ascii "TAC {\12\0"
.LC201:
        .ascii "designs: []\12\0"
.LC202:
        .ascii "designs: [\12\0"
.LC203:
        .ascii "]\12\0"
.LC204:
        .ascii "entry_point: \"NULL\"\12\0"
.LC205:
        .ascii "entry_point: %s\12\0"
.LC206:
        .ascii "global: []\12\0"
.LC207:
        .ascii "global: [\12\0"
.LC208:
        .ascii "subroutines: []\12\0"
.LC209:
        .ascii "subroutines: [\12\0"
.LC210:
        .ascii "}\12\0"
output_TAC:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 176
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        jne     .L533
        mov     QWORD PTR -8[rbp], 0
        jmp     .L534
.L535:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L534:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L535
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC199[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L532
.L533:
        mov     QWORD PTR -16[rbp], 0
        jmp     .L537
.L538:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -16[rbp], 1
.L537:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -16[rbp], rax
        jb      .L538
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC200[rip]
        mov     rcx, rax
        call    fwrite
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L539
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L539
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L540
.L539:
        mov     QWORD PTR -24[rbp], 0
        jmp     .L541
.L542:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -24[rbp], 1
.L541:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -24[rbp], rax
        jb      .L542
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC201[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L543
.L540:
        mov     QWORD PTR -32[rbp], 0
        jmp     .L544
.L545:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -32[rbp], 1
.L544:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -32[rbp], rax
        jb      .L545
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 11
        mov     edx, 1
        lea     rax, .LC202[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L546
.L547:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 2[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -120[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_attribute_table
.L546:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -120[rbp], rax
        cmp     QWORD PTR -120[rbp], 0
        jne     .L547
        mov     QWORD PTR -40[rbp], 0
        jmp     .L548
.L549:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -40[rbp], 1
.L548:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -40[rbp], rax
        jb      .L549
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC203[rip]
        mov     rcx, rax
        call    fwrite
.L543:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L550
        mov     QWORD PTR -48[rbp], 0
        jmp     .L551
.L552:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -48[rbp], 1
.L551:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -48[rbp], rax
        jb      .L552
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 20
        mov     edx, 1
        lea     rax, .LC204[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L553
.L550:
        mov     QWORD PTR -56[rbp], 0
        jmp     .L554
.L555:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -56[rbp], 1
.L554:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -56[rbp], rax
        jb      .L555
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC205[rip]
        mov     rcx, rax
        call    fprintf
.L553:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L556
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L556
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L557
.L556:
        mov     QWORD PTR -64[rbp], 0
        jmp     .L558
.L559:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -64[rbp], 1
.L558:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -64[rbp], rax
        jb      .L559
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 11
        mov     edx, 1
        lea     rax, .LC206[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L560
.L557:
        mov     QWORD PTR -72[rbp], 0
        jmp     .L561
.L562:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -72[rbp], 1
.L561:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -72[rbp], rax
        jb      .L562
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC207[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L563
.L564:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 2[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -128[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_var
.L563:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -128[rbp], rax
        cmp     QWORD PTR -128[rbp], 0
        jne     .L564
        mov     QWORD PTR -80[rbp], 0
        jmp     .L565
.L566:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -80[rbp], 1
.L565:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -80[rbp], rax
        jb      .L566
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC203[rip]
        mov     rcx, rax
        call    fwrite
.L560:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L567
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L567
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L568
.L567:
        mov     QWORD PTR -88[rbp], 0
        jmp     .L569
.L570:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -88[rbp], 1
.L569:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -88[rbp], rax
        jb      .L570
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 16
        mov     edx, 1
        lea     rax, .LC208[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L571
.L568:
        mov     QWORD PTR -96[rbp], 0
        jmp     .L572
.L573:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -96[rbp], 1
.L572:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -96[rbp], rax
        jb      .L573
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 15
        mov     edx, 1
        lea     rax, .LC209[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L574
.L575:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 2[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -136[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_subroutine
.L574:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -136[rbp], rax
        cmp     QWORD PTR -136[rbp], 0
        jne     .L575
        mov     QWORD PTR -104[rbp], 0
        jmp     .L576
.L577:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -104[rbp], 1
.L576:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -104[rbp], rax
        jb      .L577
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC203[rip]
        mov     rcx, rax
        call    fwrite
.L571:
        mov     QWORD PTR -112[rbp], 0
        jmp     .L578
.L579:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -112[rbp], 1
.L578:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -112[rbp], rax
        jb      .L579
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC210[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L532:
        add     rsp, 176
        pop     rbp
        ret
.LC211:
        .ascii "Subroutine: \"NULL\"\12\0"
.LC212:
        .ascii "NULL {\12\0"
.LC213:
        .ascii "%s {\12\0"
.LC214:
        .ascii "return_type: \"NULL\"\12\0"
.LC215:
        .ascii "return_type: %s\12\0"
.LC216:
        .ascii "parameters: []\12\0"
.LC217:
        .ascii "parameters: [\12\0"
.LC218:
        .ascii "local: []\12\0"
.LC219:
        .ascii "local: [\12\0"
.LC220:
        .ascii "instructions: []\12\0"
.LC221:
        .ascii "instructions: [\12\0"
output_subroutine:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 176
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        jne     .L581
        mov     QWORD PTR -8[rbp], 0
        jmp     .L582
.L583:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L582:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L583
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 19
        mov     edx, 1
        lea     rax, .LC211[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L580
.L581:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L585
        mov     QWORD PTR -16[rbp], 0
        jmp     .L586
.L587:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -16[rbp], 1
.L586:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -16[rbp], rax
        jb      .L587
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 7
        mov     edx, 1
        lea     rax, .LC212[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L588
.L585:
        mov     QWORD PTR -24[rbp], 0
        jmp     .L589
.L590:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -24[rbp], 1
.L589:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -24[rbp], rax
        jb      .L590
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC213[rip]
        mov     rcx, rax
        call    fprintf
.L588:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L591
        mov     QWORD PTR -32[rbp], 0
        jmp     .L592
.L593:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -32[rbp], 1
.L592:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -32[rbp], rax
        jb      .L593
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 20
        mov     edx, 1
        lea     rax, .LC214[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L594
.L591:
        mov     QWORD PTR -40[rbp], 0
        jmp     .L595
.L596:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -40[rbp], 1
.L595:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -40[rbp], rax
        jb      .L596
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC215[rip]
        mov     rcx, rax
        call    fprintf
.L594:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L597
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L597
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L598
.L597:
        mov     QWORD PTR -48[rbp], 0
        jmp     .L599
.L600:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -48[rbp], 1
.L599:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -48[rbp], rax
        jb      .L600
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 15
        mov     edx, 1
        lea     rax, .LC216[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L601
.L598:
        mov     QWORD PTR -56[rbp], 0
        jmp     .L602
.L603:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -56[rbp], 1
.L602:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -56[rbp], rax
        jb      .L603
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 14
        mov     edx, 1
        lea     rax, .LC217[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L604
.L605:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 2[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -128[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_var
.L604:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -128[rbp], rax
        cmp     QWORD PTR -128[rbp], 0
        jne     .L605
        mov     QWORD PTR -64[rbp], 0
        jmp     .L606
.L607:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -64[rbp], 1
.L606:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -64[rbp], rax
        jb      .L607
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC203[rip]
        mov     rcx, rax
        call    fwrite
.L601:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L608
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L608
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L609
.L608:
        mov     QWORD PTR -72[rbp], 0
        jmp     .L610
.L611:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -72[rbp], 1
.L610:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -72[rbp], rax
        jb      .L611
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC218[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L612
.L609:
        mov     QWORD PTR -80[rbp], 0
        jmp     .L613
.L614:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -80[rbp], 1
.L613:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -80[rbp], rax
        jb      .L614
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC219[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L615
.L616:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 2[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -136[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_var
.L615:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -136[rbp], rax
        cmp     QWORD PTR -136[rbp], 0
        jne     .L616
        mov     QWORD PTR -88[rbp], 0
        jmp     .L617
.L618:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -88[rbp], 1
.L617:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -88[rbp], rax
        jb      .L618
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC203[rip]
        mov     rcx, rax
        call    fwrite
.L612:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 32[rax]
        test    rax, rax
        je      .L619
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L619
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L620
.L619:
        mov     QWORD PTR -96[rbp], 0
        jmp     .L621
.L622:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -96[rbp], 1
.L621:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -96[rbp], rax
        jb      .L622
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 17
        mov     edx, 1
        lea     rax, .LC220[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L623
.L620:
        mov     QWORD PTR -104[rbp], 0
        jmp     .L624
.L625:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -104[rbp], 1
.L624:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -104[rbp], rax
        jb      .L625
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 16
        mov     edx, 1
        lea     rax, .LC221[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L626
.L627:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 2[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -144[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_block
.L626:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -144[rbp], rax
        cmp     QWORD PTR -144[rbp], 0
        jne     .L627
        mov     QWORD PTR -112[rbp], 0
        jmp     .L628
.L629:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -112[rbp], 1
.L628:
        mov     rax, QWORD PTR 32[rbp]
        add     rax, 1
        sal     rax, 2
        cmp     QWORD PTR -112[rbp], rax
        jb      .L629
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC203[rip]
        mov     rcx, rax
        call    fwrite
.L623:
        mov     QWORD PTR -120[rbp], 0
        jmp     .L630
.L631:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -120[rbp], 1
.L630:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -120[rbp], rax
        jb      .L631
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC210[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L580:
        add     rsp, 176
        pop     rbp
        ret
.LC222:
        .ascii "Var: \"NULL\"\12\0"
.LC223:
        .ascii "NULL\11%s\12\0"
.LC224:
        .ascii "%s\11%s(%s)\12\0"
.LC225:
        .ascii "%s\11%s\12\0"
output_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        jne     .L633
        mov     QWORD PTR -8[rbp], 0
        jmp     .L634
.L635:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L634:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L635
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 12
        mov     edx, 1
        lea     rax, .LC222[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L632
.L633:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        jne     .L637
        mov     QWORD PTR -16[rbp], 0
        jmp     .L638
.L639:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -16[rbp], 1
.L638:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -16[rbp], rax
        jb      .L639
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC223[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L632
.L637:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L640
        mov     QWORD PTR -24[rbp], 0
        jmp     .L641
.L642:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -24[rbp], 1
.L641:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -24[rbp], rax
        jb      .L642
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, r8
        mov     r8, rcx
        lea     rdx, .LC224[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L632
.L640:
        mov     QWORD PTR -32[rbp], 0
        jmp     .L643
.L644:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -32[rbp], 1
.L643:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -32[rbp], rax
        jb      .L644
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC225[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L632:
        add     rsp, 80
        pop     rbp
        ret
.LC226:
        .ascii "Block: \"NULL\"\12\0"
.LC227:
        .ascii "NULL \0"
.LC228:
        .ascii "%s \0"
.LC229:
        .ascii "{}\12\0"
.LC230:
        .ascii "{\12\0"
output_block:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        jne     .L646
        mov     QWORD PTR -8[rbp], 0
        jmp     .L647
.L648:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L647:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L648
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 14
        mov     edx, 1
        lea     rax, .LC226[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L645
.L646:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L650
        mov     QWORD PTR -16[rbp], 0
        jmp     .L651
.L652:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -16[rbp], 1
.L651:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -16[rbp], rax
        jb      .L652
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC227[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L653
.L650:
        mov     QWORD PTR -24[rbp], 0
        jmp     .L654
.L655:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -24[rbp], 1
.L654:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -24[rbp], rax
        jb      .L655
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC228[rip]
        mov     rcx, rax
        call    fprintf
.L653:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L656
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L656
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L657
.L656:
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 3
        mov     edx, 1
        lea     rax, .LC229[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L645
.L657:
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC230[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L658
.L659:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_instruction
.L658:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L659
        mov     QWORD PTR -32[rbp], 0
        jmp     .L660
.L661:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -32[rbp], 1
.L660:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -32[rbp], rax
        jb      .L661
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC210[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L645:
        add     rsp, 80
        pop     rbp
        ret
.LC231:
        .ascii "\"NULL\"\0"
.LC232:
        .ascii "%s(%s)\0"
.LC233:
        .ascii "%lld\0"
.LC234:
        .ascii "%f\0"
.LC235:
        .ascii "\"%s\"\0"
.LC236:
        .ascii "NONE\0"
.LC237:
        .ascii "unknown_ArgType: %u\0"
output_arg:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L663
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC231[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L662
.L663:
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 9
        ja      .L665
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L667[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L667[rip]
        add     rax, rdx
        jmp     rax
.L667:
        .long   .L675-.L667
        .long   .L674-.L667
        .long   .L673-.L667
        .long   .L672-.L667
        .long   .L671-.L667
        .long   .L670-.L667
        .long   .L669-.L667
        .long   .L668-.L667
        .long   .L668-.L667
        .long   .L666-.L667
.L675:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L676
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC232[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L662
.L676:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    fputs
        jmp     .L662
.L674:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC233[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L662
.L673:
        mov     rax, QWORD PTR 16[rbp]
        movsd   xmm0, QWORD PTR [rax]
        movq    rax, xmm0
        mov     rdx, rax
        movq    xmm0, rdx
        mov     rdx, rax
        mov     rax, QWORD PTR 24[rbp]
        movapd  xmm2, xmm0
        mov     r8, rdx
        lea     rdx, .LC234[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L662
.L672:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC235[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L662
.L671:
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L678
        lea     rax, .LC11[rip]
        jmp     .L679
.L678:
        lea     rax, .LC12[rip]
.L679:
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    fputs
        jmp     .L662
.L670:
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC20[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L662
.L669:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    fputs
        jmp     .L662
.L668:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L680
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC232[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L662
.L680:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    fputs
        jmp     .L662
.L666:
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC236[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L662
.L665:
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, DWORD PTR 16[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8d, edx
        lea     rdx, .LC237[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L662:
        add     rsp, 32
        pop     rbp
        ret
.LC238:
        .ascii "Instruction: \"NULL\"\12\0"
.LC239:
        .ascii "add\11\0"
.LC240:
        .ascii "sub\11\0"
.LC241:
        .ascii "mul\11\0"
.LC242:
        .ascii "div\11\0"
.LC243:
        .ascii "mod\11\0"
.LC244:
        .ascii "eq \11\0"
.LC245:
        .ascii "ne \11\0"
.LC246:
        .ascii "lt \11\0"
.LC247:
        .ascii "gt \11\0"
.LC248:
        .ascii "le \11\0"
.LC249:
        .ascii "ge \11\0"
.LC250:
        .ascii "and\11\0"
.LC251:
        .ascii "or \11\0"
.LC252:
        .ascii "not\11\0"
.LC253:
        .ascii "assign\11\0"
.LC254:
        .ascii "get_attr\11\0"
.LC255:
        .ascii "get_elem\11\0"
.LC256:
        .ascii "param\11\0"
.LC257:
        .ascii "alloc\11\0"
.LC258:
        .ascii "jmp_c\11\0"
.LC259:
        .ascii "jmp\11\0"
.LC260:
        .ascii "ret\11\0"
.LC261:
        .ascii "call\11\0"
.LC262:
        .ascii "load\11\0"
.LC263:
        .ascii "store\11\0"
.LC264:
        .ascii "INST_NONE\12\0"
.LC265:
        .ascii "unknown_InstructionType: %u\12\0"
output_instruction:
        push    rbp
        sub     rsp, 256
        lea     rbp, 128[rsp]
        mov     QWORD PTR 144[rbp], rcx
        mov     QWORD PTR 152[rbp], rdx
        mov     QWORD PTR 160[rbp], r8
        cmp     QWORD PTR 144[rbp], 0
        jne     .L683
        mov     QWORD PTR 120[rbp], 0
        jmp     .L684
.L685:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 120[rbp], 1
.L684:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 120[rbp], rax
        jb      .L685
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 20
        mov     edx, 1
        lea     rax, .LC238[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L682
.L683:
        mov     rax, QWORD PTR 144[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 25
        ja      .L687
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L689[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L689[rip]
        add     rax, rdx
        jmp     rax
.L689:
        .long   .L714-.L689
        .long   .L713-.L689
        .long   .L712-.L689
        .long   .L711-.L689
        .long   .L710-.L689
        .long   .L709-.L689
        .long   .L708-.L689
        .long   .L707-.L689
        .long   .L706-.L689
        .long   .L705-.L689
        .long   .L704-.L689
        .long   .L703-.L689
        .long   .L702-.L689
        .long   .L701-.L689
        .long   .L700-.L689
        .long   .L699-.L689
        .long   .L698-.L689
        .long   .L697-.L689
        .long   .L696-.L689
        .long   .L695-.L689
        .long   .L694-.L689
        .long   .L693-.L689
        .long   .L692-.L689
        .long   .L691-.L689
        .long   .L690-.L689
        .long   .L688-.L689
.L714:
        mov     QWORD PTR 112[rbp], 0
        jmp     .L715
.L716:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 112[rbp], 1
.L715:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 112[rbp], rax
        jb      .L716
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC239[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L713:
        mov     QWORD PTR 104[rbp], 0
        jmp     .L718
.L719:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 104[rbp], 1
.L718:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 104[rbp], rax
        jb      .L719
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC240[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L712:
        mov     QWORD PTR 96[rbp], 0
        jmp     .L720
.L721:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 96[rbp], 1
.L720:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 96[rbp], rax
        jb      .L721
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC241[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L711:
        mov     QWORD PTR 88[rbp], 0
        jmp     .L722
.L723:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 88[rbp], 1
.L722:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 88[rbp], rax
        jb      .L723
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC242[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L710:
        mov     QWORD PTR 80[rbp], 0
        jmp     .L724
.L725:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 80[rbp], 1
.L724:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 80[rbp], rax
        jb      .L725
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC243[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L709:
        mov     QWORD PTR 72[rbp], 0
        jmp     .L726
.L727:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 72[rbp], 1
.L726:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 72[rbp], rax
        jb      .L727
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC244[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L708:
        mov     QWORD PTR 64[rbp], 0
        jmp     .L728
.L729:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 64[rbp], 1
.L728:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 64[rbp], rax
        jb      .L729
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC245[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L707:
        mov     QWORD PTR 56[rbp], 0
        jmp     .L730
.L731:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 56[rbp], 1
.L730:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 56[rbp], rax
        jb      .L731
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC246[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L706:
        mov     QWORD PTR 48[rbp], 0
        jmp     .L732
.L733:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 48[rbp], 1
.L732:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 48[rbp], rax
        jb      .L733
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC247[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L705:
        mov     QWORD PTR 40[rbp], 0
        jmp     .L734
.L735:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 40[rbp], 1
.L734:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 40[rbp], rax
        jb      .L735
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC248[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L704:
        mov     QWORD PTR 32[rbp], 0
        jmp     .L736
.L737:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 32[rbp], 1
.L736:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 32[rbp], rax
        jb      .L737
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC249[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L703:
        mov     QWORD PTR 24[rbp], 0
        jmp     .L738
.L739:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 24[rbp], 1
.L738:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 24[rbp], rax
        jb      .L739
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC250[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L702:
        mov     QWORD PTR 16[rbp], 0
        jmp     .L740
.L741:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 16[rbp], 1
.L740:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 16[rbp], rax
        jb      .L741
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC251[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L701:
        mov     QWORD PTR 8[rbp], 0
        jmp     .L742
.L743:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 8[rbp], 1
.L742:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 8[rbp], rax
        jb      .L743
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC252[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L700:
        mov     QWORD PTR 0[rbp], 0
        jmp     .L744
.L745:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR 0[rbp], 1
.L744:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR 0[rbp], rax
        jb      .L745
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 7
        mov     edx, 1
        lea     rax, .LC253[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L699:
        mov     QWORD PTR -8[rbp], 0
        jmp     .L746
.L747:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L746:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L747
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC254[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L698:
        mov     QWORD PTR -16[rbp], 0
        jmp     .L748
.L749:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -16[rbp], 1
.L748:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -16[rbp], rax
        jb      .L749
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 9
        mov     edx, 1
        lea     rax, .LC255[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L697:
        mov     QWORD PTR -24[rbp], 0
        jmp     .L750
.L751:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -24[rbp], 1
.L750:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -24[rbp], rax
        jb      .L751
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC256[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L696:
        mov     QWORD PTR -32[rbp], 0
        jmp     .L752
.L753:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -32[rbp], 1
.L752:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -32[rbp], rax
        jb      .L753
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC257[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L695:
        mov     QWORD PTR -40[rbp], 0
        jmp     .L754
.L755:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -40[rbp], 1
.L754:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -40[rbp], rax
        jb      .L755
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC258[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L694:
        mov     QWORD PTR -48[rbp], 0
        jmp     .L756
.L757:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -48[rbp], 1
.L756:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -48[rbp], rax
        jb      .L757
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC259[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L693:
        mov     QWORD PTR -56[rbp], 0
        jmp     .L758
.L759:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -56[rbp], 1
.L758:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -56[rbp], rax
        jb      .L759
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 4
        mov     edx, 1
        lea     rax, .LC260[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L692:
        mov     QWORD PTR -64[rbp], 0
        jmp     .L760
.L761:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -64[rbp], 1
.L760:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -64[rbp], rax
        jb      .L761
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC261[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L691:
        mov     QWORD PTR -72[rbp], 0
        jmp     .L762
.L763:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -72[rbp], 1
.L762:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -72[rbp], rax
        jb      .L763
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC262[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L690:
        mov     QWORD PTR -80[rbp], 0
        jmp     .L764
.L765:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -80[rbp], 1
.L764:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -80[rbp], rax
        jb      .L765
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 6
        mov     edx, 1
        lea     rax, .LC263[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L717
.L688:
        mov     QWORD PTR -88[rbp], 0
        jmp     .L766
.L767:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -88[rbp], 1
.L766:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -88[rbp], rax
        jb      .L767
        mov     rax, QWORD PTR 152[rbp]
        mov     r9, rax
        mov     r8d, 10
        mov     edx, 1
        lea     rax, .LC264[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L682
.L687:
        mov     QWORD PTR -96[rbp], 0
        jmp     .L768
.L769:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -96[rbp], 1
.L768:
        mov     rax, QWORD PTR 160[rbp]
        sal     rax, 2
        cmp     QWORD PTR -96[rbp], rax
        jb      .L769
        mov     rax, QWORD PTR 144[rbp]
        mov     edx, DWORD PTR 24[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     r8d, edx
        lea     rdx, .LC265[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L682
.L717:
        mov     rax, QWORD PTR 144[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 152[rbp]
        mov     rcx, rax
        call    output_arg
        mov     rax, QWORD PTR 144[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 24
        seta    dl
        test    dl, dl
        jne     .L775
        mov     edx, 1
        mov     ecx, eax
        sal     rdx, cl
        mov     rax, rdx
        mov     rdx, rax
        and     edx, 4825087
        test    rdx, rdx
        setne   dl
        test    dl, dl
        jne     .L771
        mov     rdx, rax
        and     edx, 25583616
        test    rdx, rdx
        setne   dl
        test    dl, dl
        jne     .L772
        and     eax, 3145728
        test    rax, rax
        setne   al
        test    al, al
        jne     .L776
        jmp     .L775
.L771:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    fputc
        mov     rax, QWORD PTR 144[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 152[rbp]
        mov     rcx, rax
        call    output_arg
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    fputc
        mov     rax, QWORD PTR 144[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 152[rbp]
        mov     rcx, rax
        call    output_arg
        jmp     .L774
.L772:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    fputc
        mov     rax, QWORD PTR 144[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 152[rbp]
        mov     rcx, rax
        call    output_arg
        jmp     .L774
.L776:
        nop
.L774:
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, rax
        mov     ecx, 10
        call    fputc
        jmp     .L682
.L775:
        nop
.L682:
        add     rsp, 256
        pop     rbp
        ret
.LC266:
        .ascii "AttributeTable: \"NULL\"\12\0"
.LC267:
        .ascii "%zu \0"
output_attribute_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        jne     .L778
        mov     QWORD PTR -8[rbp], 0
        jmp     .L779
.L780:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L779:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L780
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 23
        mov     edx, 1
        lea     rax, .LC266[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L777
.L778:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L782
        mov     QWORD PTR -16[rbp], 0
        jmp     .L783
.L784:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -16[rbp], 1
.L783:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -16[rbp], rax
        jb      .L784
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC227[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L785
.L782:
        mov     QWORD PTR -24[rbp], 0
        jmp     .L786
.L787:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -24[rbp], 1
.L786:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -24[rbp], rax
        jb      .L787
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC228[rip]
        mov     rcx, rax
        call    fprintf
.L785:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC267[rip]
        mov     rcx, rax
        call    fprintf
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L788
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L788
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L789
.L788:
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 3
        mov     edx, 1
        lea     rax, .LC229[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L777
.L789:
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC230[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L790
.L791:
        mov     rax, QWORD PTR 32[rbp]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    output_attribute
.L790:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L791
        mov     QWORD PTR -32[rbp], 0
        jmp     .L792
.L793:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -32[rbp], 1
.L792:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -32[rbp], rax
        jb      .L793
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 2
        mov     edx, 1
        lea     rax, .LC210[rip]
        mov     rcx, rax
        call    fwrite
        nop
.L777:
        add     rsp, 80
        pop     rbp
        ret
.LC268:
        .ascii "Attribute: \"NULL\"\12\0"
.LC269:
        .ascii "NULL\11\0"
.LC270:
        .ascii "%s\11\0"
.LC271:
        .ascii "%s(%s) \0"
.LC272:
        .ascii "%zu\12\0"
output_attribute:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        cmp     QWORD PTR 16[rbp], 0
        jne     .L795
        mov     QWORD PTR -8[rbp], 0
        jmp     .L796
.L797:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -8[rbp], 1
.L796:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -8[rbp], rax
        jb      .L797
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 18
        mov     edx, 1
        lea     rax, .LC268[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L794
.L795:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L799
        mov     QWORD PTR -16[rbp], 0
        jmp     .L800
.L801:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -16[rbp], 1
.L800:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -16[rbp], rax
        jb      .L801
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC269[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L802
.L799:
        mov     QWORD PTR -24[rbp], 0
        jmp     .L803
.L804:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        mov     ecx, 32
        call    putc
        add     QWORD PTR -24[rbp], 1
.L803:
        mov     rax, QWORD PTR 32[rbp]
        sal     rax, 2
        cmp     QWORD PTR -24[rbp], rax
        jb      .L804
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC270[rip]
        mov     rcx, rax
        call    fprintf
.L802:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L805
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 5
        mov     edx, 1
        lea     rax, .LC227[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L806
.L805:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L807
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC271[rip]
        mov     rcx, rax
        call    fprintf
        jmp     .L806
.L807:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC228[rip]
        mov     rcx, rax
        call    fprintf
.L806:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     r8, rdx
        lea     rdx, .LC272[rip]
        mov     rcx, rax
        call    fprintf
        nop
.L794:
        add     rsp, 64
        pop     rbp
        ret
.LC273:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
.LC274:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
.LC275:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
.LC276:
        .ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
parse_code:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     rax, QWORD PTR builtin_scope[rip]
        test    rax, rax
        jne     .L809
        mov     ecx, 0
        call    create_symbol_table
        mov     QWORD PTR builtin_scope[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR keywordList[rip+160]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR name_void[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR keywordList[rip+128]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR name_int[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR keywordList[rip+136]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR name_float[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR keywordList[rip+144]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR name_string[rip], rax
        mov     rdx, QWORD PTR builtin_scope[rip]
        mov     rax, QWORD PTR keywordList[rip+152]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 6
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR name_bool[rip], rax
.L809:
        cmp     QWORD PTR 56[rbp], 0
        jne     .L810
        mov     rax, QWORD PTR builtin_scope[rip]
        mov     QWORD PTR 56[rbp], rax
.L810:
        mov     QWORD PTR -8[rbp], 0
        call    create_list
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L811
.L820:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L812
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip]
        cmp     rdx, rax
        jne     .L812
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_import
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L813
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC273[rip]
        mov     rdx, rax
        call    fprintf
.L813:
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L814
.L812:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L815
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+16]
        cmp     rdx, rax
        jne     .L815
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_function
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L816
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC274[rip]
        mov     rdx, rax
        call    fprintf
.L816:
        mov     rax, QWORD PTR -40[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 1
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L814
.L815:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L817
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+24]
        cmp     rdx, rax
        jne     .L817
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_class
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L818
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC275[rip]
        mov     rdx, rax
        call    fprintf
.L818:
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rax
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 2
        call    create_code_member
        mov     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L814
.L817:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC276[rip]
        mov     rdx, rax
        call    fprintf
.L814:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L811:
        cmp     QWORD PTR -8[rbp], 0
        je      .L819
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        test    eax, eax
        jne     .L820
.L819:
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_code
        add     rsp, 104
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC277:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\12\0"
.LC278:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\12\0"
.LC279:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\12\0"
.LC280:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
parse_import:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L823
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC277[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L824
.L823:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -32[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L825
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+8]
        cmp     rdx, rax
        jne     .L825
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        je      .L826
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC278[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L824
.L826:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L825:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L827
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        je      .L828
.L827:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC279[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L824
.L828:
        mov     rax, QWORD PTR 64[rbp]
        mov     r8, QWORD PTR [rax]
        mov     rcx, QWORD PTR 56[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    parse_import_file
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L829
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC280[rip]
        mov     rdx, rax
        call    fprintf
        mov     rdx, QWORD PTR name_void[rip]
        mov     rcx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -24[rbp], rax
.L829:
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_import
.L824:
        add     rsp, 88
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC281:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
.LC282:
        .ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
.LC283:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
.LC284:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
.LC285:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
.LC286:
        .ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
.LC287:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
.LC288:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
.LC289:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
.LC290:
        .ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
.LC291:
        .ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
parse_function:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 136
        lea     rbp, 128[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L831
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L832
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+128]
        cmp     rdx, rax
        je      .L831
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+136]
        cmp     rdx, rax
        je      .L831
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+144]
        cmp     rdx, rax
        je      .L831
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+152]
        cmp     rdx, rax
        je      .L831
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+160]
        cmp     rdx, rax
        je      .L831
.L832:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC281[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L833
.L831:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L834
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC282[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L833
.L834:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L835
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC283[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L833
.L835:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 1
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L836
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        je      .L837
.L836:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC284[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L833
.L837:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     QWORD PTR -56[rbp], rax
        jmp     .L838
.L844:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L839
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC285[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L840
.L839:
        mov     rax, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L841
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC286[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L840
.L841:
        mov     rdx, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
.L840:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L842
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+32]
        cmp     rdx, rax
        jne     .L842
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L838
.L842:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L843
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L838
.L843:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC287[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L833
.L838:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L844
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        jne     .L844
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L845
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L846
.L845:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC288[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L833
.L846:
        call    create_list
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 64[rbp]
        mov     BYTE PTR 8[rax], 1
        mov     BYTE PTR -9[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L847
.L851:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L848
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC289[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L849
.L848:
        cmp     BYTE PTR -9[rbp], 0
        je      .L849
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC290[rip]
        mov     rdx, rax
        call    fprintf
.L849:
        cmp     QWORD PTR -72[rbp], 0
        je      .L850
        mov     rax, QWORD PTR -72[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 5
        jne     .L850
        mov     BYTE PTR -9[rbp], 1
.L850:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L847:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L851
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L851
        mov     rax, QWORD PTR 64[rbp]
        mov     BYTE PTR 8[rax], 0
        cmp     BYTE PTR -9[rbp], 0
        jne     .L852
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR -32[rbp], rax
        je      .L852
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC291[rip]
        mov     rdx, rax
        call    fprintf
.L852:
        cmp     BYTE PTR -9[rbp], 0
        jne     .L853
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR -32[rbp], rax
        jne     .L853
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
.L853:
        mov     r9, QWORD PTR -56[rbp]
        mov     r8, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, QWORD PTR -24[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR -64[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_function_use_ptr
.L833:
        add     rsp, 136
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC292:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
.LC293:
        .ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
.LC294:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
.LC295:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
.LC296:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
.LC297:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
.LC298:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
.LC299:
        .ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
.LC300:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
.LC301:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
.LC302:
        .ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
parse_method:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 152
        lea     rbp, 144[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR 72[rbp], r9
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR keywordList[rip+40]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L855
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L856
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+128]
        cmp     rdx, rax
        je      .L855
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+136]
        cmp     rdx, rax
        je      .L855
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+144]
        cmp     rdx, rax
        je      .L855
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+152]
        cmp     rdx, rax
        je      .L855
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+160]
        cmp     rdx, rax
        je      .L855
.L856:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC292[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L857
.L855:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L858
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC293[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L857
.L858:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L859
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC294[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L857
.L859:
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rcx, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 2
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L860
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        je      .L861
.L860:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC295[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L857
.L861:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L862
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+40]
        cmp     rdx, rax
        je      .L863
.L862:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC296[rip]
        mov     rdx, rax
        call    fprintf
.L863:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     QWORD PTR -64[rbp], rax
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 64[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L864
.L872:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L865
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+32]
        cmp     rdx, rax
        jne     .L865
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        nop
        mov     rcx, QWORD PTR 72[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L869
        jmp     .L882
.L865:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L867
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L868
.L867:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC297[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L857
.L882:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC298[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L870
.L869:
        mov     rax, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L871
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC299[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L870
.L871:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_append
.L870:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L864:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L872
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        jne     .L872
.L868:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L873
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L874
.L873:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC300[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L857
.L874:
        call    create_list
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 72[rbp]
        mov     BYTE PTR 8[rax], 1
        mov     rax, QWORD PTR 72[rbp]
        mov     BYTE PTR 9[rax], 1
        mov     BYTE PTR -9[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L875
.L879:
        mov     rcx, QWORD PTR 72[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L876
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC301[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L877
.L876:
        cmp     BYTE PTR -9[rbp], 0
        je      .L877
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC290[rip]
        mov     rdx, rax
        call    fprintf
.L877:
        cmp     QWORD PTR -88[rbp], 0
        je      .L878
        mov     rax, QWORD PTR -88[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 5
        jne     .L878
        mov     BYTE PTR -9[rbp], 1
.L878:
        mov     rdx, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L875:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L879
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L879
        mov     rax, QWORD PTR 72[rbp]
        mov     BYTE PTR 8[rax], 0
        mov     rax, QWORD PTR 72[rbp]
        mov     BYTE PTR 9[rax], 0
        cmp     BYTE PTR -9[rbp], 0
        jne     .L880
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR -40[rbp], rax
        je      .L880
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC302[rip]
        mov     rdx, rax
        call    fprintf
.L880:
        cmp     BYTE PTR -9[rbp], 0
        jne     .L881
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR -40[rbp], rax
        jne     .L881
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
.L881:
        mov     r9, QWORD PTR -64[rbp]
        mov     r8, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, QWORD PTR -24[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR -80[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_method_use_ptr
.L857:
        add     rsp, 152
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC303:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
.LC304:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
.LC305:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
.LC306:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
.LC307:
        .ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
.LC308:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
.LC309:
        .ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
.LC310:
        .ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC311:
        .ascii "0\0"
parse_class:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 296
        lea     rbp, 128[rsp]
        mov     QWORD PTR 208[rbp], rcx
        mov     QWORD PTR 216[rbp], rdx
        mov     QWORD PTR 224[rbp], r8
        mov     QWORD PTR 152[rbp], 0
        mov     rax, QWORD PTR 216[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     QWORD PTR 128[rbp], rax
        mov     rax, QWORD PTR 208[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L884
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC303[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L885
.L884:
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR 120[rbp], rax
        mov     rax, QWORD PTR 120[rbp]
        mov     rdx, QWORD PTR 128[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 120[rbp]
        mov     r9, rdx
        mov     r8d, 0
        mov     edx, 0
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 112[rbp], rax
        mov     rax, QWORD PTR 208[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L886
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L887
.L886:
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC304[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L885
.L887:
        call    create_list
        mov     QWORD PTR 104[rbp], rax
        mov     rax, QWORD PTR 208[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     QWORD PTR 144[rbp], 0
        jmp     .L888
.L902:
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L889
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+32]
        cmp     rdx, rax
        jne     .L889
        mov     r8, QWORD PTR 224[rbp]
        mov     rcx, QWORD PTR 112[rbp]
        mov     rdx, QWORD PTR 128[rbp]
        mov     rax, QWORD PTR 208[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    parse_method
        mov     QWORD PTR -56[rbp], rax
        cmp     QWORD PTR -56[rbp], 0
        jne     .L890
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC305[rip]
        mov     rdx, rax
        call    fprintf
.L890:
        mov     rax, QWORD PTR -56[rbp]
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L891
.L889:
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L892
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+168]
        cmp     rdx, rax
        jne     .L892
        mov     rax, QWORD PTR 208[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 224[rbp]
        mov     BYTE PTR 10[rax], 1
        mov     rcx, QWORD PTR 224[rbp]
        mov     rdx, QWORD PTR 128[rbp]
        mov     rax, QWORD PTR 208[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR 224[rbp]
        mov     BYTE PTR 10[rax], 0
        cmp     QWORD PTR -64[rbp], 0
        jne     .L893
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC306[rip]
        mov     rdx, rax
        call    fprintf
.L893:
        mov     rax, QWORD PTR -64[rbp]
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 1
        call    create_class_member
        mov     QWORD PTR -72[rbp], rax
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -72[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 1
        jne     .L894
        mov     rax, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR name_int[rip]
        cmp     QWORD PTR -80[rbp], rax
        je      .L895
        mov     rax, QWORD PTR name_float[rip]
        cmp     QWORD PTR -80[rbp], rax
        je      .L895
        mov     rax, QWORD PTR name_string[rip]
        cmp     QWORD PTR -80[rbp], rax
        jne     .L896
.L895:
        add     QWORD PTR 144[rbp], 8
        jmp     .L894
.L896:
        mov     rax, QWORD PTR name_bool[rip]
        cmp     QWORD PTR -80[rbp], rax
        je      .L897
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR -80[rbp], rax
        jne     .L898
.L897:
        add     QWORD PTR 144[rbp], 1
        jmp     .L894
.L898:
        mov     rax, QWORD PTR -80[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L899
        add     QWORD PTR 144[rbp], 8
        jmp     .L894
.L899:
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC307[rip]
        mov     rdx, rax
        call    fprintf
.L894:
        mov     rax, QWORD PTR 208[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L900
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        je      .L914
.L900:
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC308[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L914
.L892:
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC309[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L891
.L914:
        nop
.L891:
        mov     rax, QWORD PTR 208[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR 152[rbp], rax
.L888:
        mov     rax, QWORD PTR 152[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L902
        mov     rax, QWORD PTR 152[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L902
        mov     rdx, QWORD PTR DEFAULT_INIT_NAME[rip]
        mov     rax, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR 96[rbp], rax
        mov     rdx, QWORD PTR 96[rbp]
        mov     rax, QWORD PTR 128[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR 136[rbp], rax
        cmp     QWORD PTR 136[rbp], 0
        jne     .L903
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR 88[rbp], rax
        mov     rax, QWORD PTR 128[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     rdx, QWORD PTR 88[rbp]
        mov     QWORD PTR 32[rdx], rax
        mov     rcx, QWORD PTR 88[rbp]
        mov     rdx, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 96[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 2
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 136[rbp], rax
        call    create_list
        mov     QWORD PTR 80[rbp], rax
        mov     rax, QWORD PTR 88[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR keywordList[rip+40]
        mov     rdx, QWORD PTR 112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 72[rbp], rax
        mov     rdx, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 112[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR 80[rbp]
        mov     rcx, rax
        call    list_append
        call    create_list
        mov     QWORD PTR 64[rbp], rax
        mov     rax, QWORD PTR 72[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 64[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 88[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     r9, QWORD PTR 80[rbp]
        mov     r8, QWORD PTR 112[rbp]
        mov     rdx, QWORD PTR 136[rbp]
        mov     rax, QWORD PTR 88[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR 64[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_method_use_ptr
        mov     rax, QWORD PTR 88[rbp]
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
.L903:
        mov     rax, QWORD PTR 136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        je      .L904
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 152[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC310[rip]
        mov     rdx, rax
        call    fprintf
.L904:
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR 56[rbp], rax
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR 48[rbp], rax
        mov     rax, QWORD PTR 128[rbp]
        mov     rcx, rax
        call    create_symbol_table
        mov     rdx, QWORD PTR 48[rbp]
        mov     QWORD PTR 32[rdx], rax
        mov     rcx, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 56[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 2
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 40[rbp], rax
        call    create_list
        mov     QWORD PTR 32[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     rax, QWORD PTR keywordList[rip+40]
        mov     rdx, QWORD PTR 112[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, 3
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR 24[rbp], rax
        mov     rax, QWORD PTR 136[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR 16[rbp], rax
        jmp     .L905
.L907:
        mov     rax, QWORD PTR 8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR keywordList[rip+40]
        cmp     rdx, rax
        jne     .L906
        jmp     .L905
.L906:
        mov     rax, QWORD PTR 8[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     r8d, 0
        mov     rcx, rax
        call    create_variable
        mov     rdx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    list_append
.L905:
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR 8[rbp], rax
        cmp     QWORD PTR 8[rbp], 0
        jne     .L907
        call    create_list
        mov     QWORD PTR 0[rbp], rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 0[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L908
.L911:
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 1
        jne     .L908
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 2
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L909
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        jmp     .L910
.L909:
        mov     r8d, 1
        mov     edx, 2
        lea     rax, .LC311[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
.L910:
        mov     QWORD PTR -48[rbp], rax
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rdx
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 13
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 0[rbp]
        mov     rcx, rax
        call    list_append
.L908:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L911
        call    create_list
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -32[rbp], rax
        jmp     .L912
.L913:
        mov     rax, QWORD PTR 8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
.L912:
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR 8[rbp], rax
        cmp     QWORD PTR 8[rbp], 0
        jne     .L913
        mov     rax, QWORD PTR 136[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     rdx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     ecx, 1
        call    create_variable_access
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     rdx, rax
        mov     rax, QWORD PTR 0[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 32[rax]
        mov     r9, QWORD PTR 32[rbp]
        mov     r8, QWORD PTR 112[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     QWORD PTR 40[rsp], rcx
        mov     rcx, QWORD PTR 0[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_method_use_ptr
        mov     rax, QWORD PTR 48[rbp]
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 0
        call    create_class_member
        mov     rdx, rax
        mov     rax, QWORD PTR 104[rbp]
        mov     rcx, rax
        call    list_append
        mov     r9, QWORD PTR 128[rbp]
        mov     r8, QWORD PTR 104[rbp]
        mov     rdx, QWORD PTR 112[rbp]
        mov     rax, QWORD PTR 120[rbp]
        mov     rcx, QWORD PTR 144[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    create_class_use_ptr
.L885:
        add     rsp, 296
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC312:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
.LC313:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
.LC314:
        .ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
.LC315:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
.LC316:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
parse_variable:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L916
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L917
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+128]
        cmp     rdx, rax
        je      .L916
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+136]
        cmp     rdx, rax
        je      .L916
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+144]
        cmp     rdx, rax
        je      .L916
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+152]
        cmp     rdx, rax
        je      .L916
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+160]
        cmp     rdx, rax
        je      .L916
.L917:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC312[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L918
.L916:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        je      .L919
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 6
        je      .L920
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        je      .L920
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC313[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L920
.L919:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC314[rip]
        mov     rdx, rax
        call    fprintf
.L920:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L921
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC315[rip]
        mov     rdx, rax
        call    fprintf
.L921:
        mov     rax, QWORD PTR 64[rbp]
        movzx   eax, BYTE PTR 10[rax]
        test    al, al
        je      .L922
        mov     rax, QWORD PTR 64[rbp]
        movzx   eax, BYTE PTR 9[rax]
        test    al, al
        jne     .L922
        mov     r10d, 5
        jmp     .L923
.L922:
        mov     r10d, 3
.L923:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 56[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     edx, r10d
        mov     rcx, rax
        call    create_symbol
        mov     QWORD PTR -32[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L924
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+144]
        cmp     rdx, rax
        jne     .L924
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L924
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC316[rip]
        mov     rdx, rax
        call    fprintf
.L924:
        mov     rcx, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    create_variable
.L918:
        add     rsp, 88
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC317:
        .ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\12\0"
.LC318:
        .ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\12\0"
.LC319:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse statement\12\0"
.LC320:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\12\0"
parse_statement:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 72
        lea     rbp, 64[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L926
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+48]
        cmp     rdx, rax
        jne     .L927
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_if
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 2
        call    create_statement
        jmp     .L928
.L927:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+80]
        cmp     rdx, rax
        jne     .L929
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_for
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9, rax
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 4
        call    create_statement
        jmp     .L928
.L929:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+72]
        cmp     rdx, rax
        jne     .L930
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_while
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 3
        call    create_statement
        jmp     .L928
.L930:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+168]
        cmp     rdx, rax
        jne     .L931
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR 40[rsp], rax
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 1
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L932
.L931:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+104]
        cmp     rdx, rax
        jne     .L933
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L934
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        jne     .L934
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        jmp     .L928
.L934:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 5
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L932
.L933:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+112]
        cmp     rdx, rax
        jne     .L935
        mov     rax, QWORD PTR 64[rbp]
        movzx   eax, BYTE PTR 11[rax]
        test    al, al
        jne     .L936
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC317[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L928
.L936:
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 6
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L932
.L935:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+120]
        cmp     rdx, rax
        jne     .L937
        mov     rax, QWORD PTR 64[rbp]
        movzx   eax, BYTE PTR 11[rax]
        test    al, al
        jne     .L938
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC318[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L928
.L938:
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 7
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L932
.L937:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
        jmp     .L932
.L926:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR 40[rsp], 0
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 0
        call    create_statement
        mov     QWORD PTR -8[rbp], rax
.L932:
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L939
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC319[rip]
        mov     rdx, rax
        call    fprintf
.L939:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L940
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        je      .L941
.L940:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC320[rip]
        mov     rdx, rax
        call    fprintf
.L941:
        mov     rax, QWORD PTR -8[rbp]
.L928:
        add     rsp, 72
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC321:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\12\0"
.LC322:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\12\0"
.LC323:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\12\0"
.LC324:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\12\0"
.LC325:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\12\0"
.LC326:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\12\0"
.LC327:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\12\0"
.LC328:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\12\0"
.LC329:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\12\0"
.LC330:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\12\0"
.LC331:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\12\0"
.LC332:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\12\0"
parse_if:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 136
        lea     rbp, 128[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L943
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        je      .L944
.L943:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC321[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L945
.L944:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L946
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC322[rip]
        mov     rdx, rax
        call    fprintf
.L946:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L947
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L948
.L947:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC323[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L945
.L948:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L949
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L950
.L949:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC324[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L945
.L950:
        call    create_list
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L951
.L953:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L952
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC325[rip]
        mov     rdx, rax
        call    fprintf
.L952:
        mov     rdx, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L951:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L953
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L953
        call    create_list
        mov     QWORD PTR -32[rbp], rax
        call    create_list
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L954
.L966:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L955
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        je      .L956
.L955:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC326[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L945
.L956:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L957
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC327[rip]
        mov     rdx, rax
        call    fprintf
.L957:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L958
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L959
.L958:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC328[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L945
.L959:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L960
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L961
.L960:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC329[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L945
.L961:
        call    create_list
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L962
.L964:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L963
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC330[rip]
        mov     rdx, rax
        call    fprintf
.L963:
        mov     rdx, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L962:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L964
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L964
        mov     rdx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    create_else_if
        mov     rdx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L954:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L965
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+56]
        cmp     rdx, rax
        je      .L966
.L965:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L967
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+64]
        cmp     rdx, rax
        jne     .L967
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L968
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L969
.L968:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC331[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L945
.L969:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L970
.L972:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L971
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC332[rip]
        mov     rdx, rax
        call    fprintf
.L971:
        mov     rdx, QWORD PTR -72[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L970:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L972
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L972
.L967:
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     r8, QWORD PTR -40[rbp]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    create_if
.L945:
        add     rsp, 136
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC333:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\12\0"
.LC334:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\12\0"
.LC335:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\12\0"
.LC336:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\12\0"
.LC337:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\12\0"
.LC338:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\12\0"
.LC339:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\12\0"
.LC340:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\12\0"
.LC341:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\12\0"
parse_for:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L974
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        je      .L975
.L974:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC333[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L976
.L975:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L977
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        je      .L978
.L977:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L979
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC334[rip]
        mov     rdx, rax
        call    fprintf
.L979:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L978:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L980
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        je      .L981
.L980:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC335[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L976
.L981:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -24[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L982
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        je      .L983
.L982:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L984
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC336[rip]
        mov     rdx, rax
        call    fprintf
.L984:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L983:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L985
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+72]
        cmp     rdx, rax
        je      .L986
.L985:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC337[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L976
.L986:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -32[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L987
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L988
.L987:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L989
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC338[rip]
        mov     rdx, rax
        call    fprintf
.L989:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L988:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L990
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L991
.L990:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC339[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L976
.L991:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L992
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L993
.L992:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC340[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L976
.L993:
        call    create_list
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 64[rbp]
        mov     BYTE PTR 11[rax], 1
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L994
.L996:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L995
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC341[rip]
        mov     rdx, rax
        call    fprintf
.L995:
        mov     rdx, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L994:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L996
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L996
        mov     rax, QWORD PTR 64[rbp]
        mov     BYTE PTR 11[rax], 0
        mov     r8, QWORD PTR -40[rbp]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     rcx, rax
        call    create_for
.L976:
        add     rsp, 104
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC342:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\12\0"
.LC343:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\12\0"
.LC344:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\12\0"
.LC345:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\12\0"
.LC346:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\12\0"
parse_while:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L998
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        je      .L999
.L998:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC342[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1000
.L999:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L1001
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC343[rip]
        mov     rdx, rax
        call    fprintf
.L1001:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1002
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L1003
.L1002:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC344[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1000
.L1003:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1004
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+16]
        cmp     rdx, rax
        je      .L1005
.L1004:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC345[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1000
.L1005:
        call    create_list
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 64[rbp]
        mov     BYTE PTR 11[rax], 1
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1006
.L1008:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_statement
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1007
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC346[rip]
        mov     rdx, rax
        call    fprintf
.L1007:
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
.L1006:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1008
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+24]
        cmp     rdx, rax
        jne     .L1008
        mov     rax, QWORD PTR 64[rbp]
        mov     BYTE PTR 11[rax], 0
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_while
.L1000:
        add     rsp, 88
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC347:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
parse_expr_prec:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     DWORD PTR 64[rbp], r8d
        mov     QWORD PTR 72[rbp], r9
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1010
.L1018:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_to_operator
        mov     DWORD PTR -20[rbp], eax
        mov     eax, DWORD PTR -20[rbp]
        mov     ecx, eax
        call    operator_precedence
        mov     DWORD PTR -24[rbp], eax
        cmp     DWORD PTR -20[rbp], 19
        je      .L1011
        mov     eax, DWORD PTR -24[rbp]
        cmp     eax, DWORD PTR 64[rbp]
        jl      .L1011
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 80[rbp]
        mov     rdx, QWORD PTR 72[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1012
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 80[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC347[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1013
.L1012:
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1014
.L1017:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    string_to_operator
        mov     DWORD PTR -36[rbp], eax
        mov     eax, DWORD PTR -36[rbp]
        mov     ecx, eax
        call    operator_precedence
        mov     DWORD PTR -40[rbp], eax
        cmp     DWORD PTR -36[rbp], 19
        je      .L1015
        mov     eax, DWORD PTR -40[rbp]
        cmp     eax, DWORD PTR -24[rbp]
        jle     .L1015
        mov     r9, QWORD PTR 72[rbp]
        mov     r8d, DWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rcx, QWORD PTR 80[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     rcx, rax
        call    parse_expr_prec
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L1016
        mov     eax, 0
        jmp     .L1013
.L1016:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L1014:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L1017
.L1015:
        mov     rcx, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     eax, DWORD PTR -20[rbp]
        mov     r9, rcx
        mov     r8d, 0
        mov     ecx, eax
        call    create_expression
        mov     QWORD PTR 56[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L1010:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L1018
.L1011:
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 56[rbp]
.L1013:
        add     rsp, 104
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC348:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\12\0"
parse_expression:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 72
        lea     rbp, 64[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L1020
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC348[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1021
.L1020:
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rcx, rax
        mov     r8, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 64[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, r8
        mov     r8d, 0
        mov     rdx, rcx
        mov     rcx, rax
        call    parse_expr_prec
.L1021:
        add     rsp, 72
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC349:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
.LC350:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
.LC351:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
.LC352:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
.LC353:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
.LC354:
        .ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\12\0"
parse_primary:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     QWORD PTR -48[rbp], 0
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     QWORD PTR -48[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     QWORD PTR -40[rbp], 0
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 2
        jne     .L1023
        mov     DWORD PTR -4[rbp], 0
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1024
.L1023:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 3
        jne     .L1025
        mov     DWORD PTR -4[rbp], 1
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1024
.L1025:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 4
        jne     .L1026
        mov     DWORD PTR -4[rbp], 2
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1024
.L1026:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L1027
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+88]
        cmp     rdx, rax
        jne     .L1027
        mov     DWORD PTR -4[rbp], 3
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1024
.L1027:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L1028
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+96]
        cmp     rdx, rax
        jne     .L1028
        mov     DWORD PTR -4[rbp], 4
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1024
.L1028:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1029
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        jne     .L1029
        mov     DWORD PTR -4[rbp], 5
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1030
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC349[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1031
.L1030:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1032
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L1041
.L1032:
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC350[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1031
.L1029:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1034
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+40]
        cmp     rdx, rax
        jne     .L1034
        mov     DWORD PTR -4[rbp], 6
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1024
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC351[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1031
.L1034:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1036
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+96]
        cmp     rdx, rax
        jne     .L1036
        mov     DWORD PTR -4[rbp], 7
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -48[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_primary
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1024
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC352[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1031
.L1036:
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L1038
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L1039
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+40]
        cmp     rdx, rax
        jne     .L1039
        mov     rax, QWORD PTR 64[rbp]
        movzx   eax, BYTE PTR 9[rax]
        test    al, al
        je      .L1039
.L1038:
        mov     DWORD PTR -4[rbp], 8
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_variable_access
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -40[rbp], 0
        jne     .L1024
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC353[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1031
.L1039:
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC354[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1031
.L1041:
        nop
.L1024:
        mov     r9, QWORD PTR -32[rbp]
        mov     r8, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR -4[rbp]
        mov     rcx, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     ecx, eax
        call    create_primary
.L1031:
        add     rsp, 104
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
.LC355:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected variable name in variable access\12\0"
.LC356:
        .ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
.LC357:
        .ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
.LC358:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
.LC359:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
.LC360:
        .ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
.LC361:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
.LC362:
        .ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
.LC363:
        .ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
.LC364:
        .ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
parse_variable_access:
        push    rbp
        push    rdi
        push    rsi
        push    rbx
        sub     rsp, 152
        lea     rbp, 144[rsp]
        mov     QWORD PTR 48[rbp], rcx
        mov     QWORD PTR 56[rbp], rdx
        mov     QWORD PTR 64[rbp], r8
        mov     rax, QWORD PTR 48[rbp]
        mov     rax, QWORD PTR 80[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L1043
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 6
        jne     .L1044
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR keywordList[rip+40]
        cmp     rdx, rax
        je      .L1043
.L1044:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC355[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1045
.L1043:
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -24[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 56[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 0
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1046
.L1071:
        cmp     QWORD PTR -24[rbp], 0
        je      .L1047
        mov     rax, QWORD PTR -24[rbp]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1047
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -16[rbp], rax
.L1047:
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1048
        cmp     QWORD PTR -16[rbp], 0
        je      .L1048
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1048
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -32[rbp], rax
.L1048:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip]
        cmp     rdx, rax
        jne     .L1049
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1050
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC356[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L1051
.L1050:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1051
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR -72[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -24[rbp], rax
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 2
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
.L1051:
        cmp     QWORD PTR -24[rbp], 0
        je      .L1052
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L1052
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        je      .L1052
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC357[rip]
        mov     rdx, rax
        call    fprintf
.L1052:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     QWORD PTR -80[rbp], rax
        jmp     .L1053
.L1057:
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L1054
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC358[rip]
        mov     rdx, rax
        call    fprintf
.L1054:
        mov     rdx, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1055
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+32]
        cmp     rdx, rax
        jne     .L1055
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1053
.L1055:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1056
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        je      .L1053
.L1056:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC359[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1045
.L1053:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1057
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+8]
        cmp     rdx, rax
        jne     .L1057
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -80[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 1
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -32[rbp], 0
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1058
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -32[rbp], rax
        jmp     .L1058
.L1049:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+56]
        cmp     rdx, rax
        jne     .L1059
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 64[rbp]
        mov     rdx, QWORD PTR 56[rbp]
        mov     rax, QWORD PTR 48[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    parse_expression
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L1060
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC360[rip]
        mov     rdx, rax
        call    fprintf
.L1060:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        jne     .L1061
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+64]
        cmp     rdx, rax
        je      .L1062
.L1061:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC361[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1045
.L1062:
        mov     rdx, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9, rdx
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 3
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        jmp     .L1058
.L1059:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR symbolList[rip+48]
        cmp     rdx, rax
        jne     .L1072
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    get_next_token
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1064
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC362[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1045
.L1064:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 1
        je      .L1065
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC363[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1045
.L1065:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    search_name
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1066
        mov     QWORD PTR -48[rbp], 0
        cmp     QWORD PTR -16[rbp], 0
        je      .L1067
        mov     rax, QWORD PTR -16[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1068
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -48[rbp], rax
        jmp     .L1067
.L1068:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1067
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1067
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -48[rbp], rax
.L1067:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    make_method_name
        mov     QWORD PTR -56[rbp], rax
        mov     rdx, QWORD PTR -56[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -24[rbp], rax
.L1066:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1069
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        lea     rbx, 1[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        lea     rdi, 1[rax]
        mov     rax, QWORD PTR 64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rsi, QWORD PTR 24[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     QWORD PTR 32[rsp], rbx
        mov     r9, rdi
        mov     r8, rsi
        lea     rax, .LC364[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1045
.L1069:
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR 32[rsp], 0
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 2
        call    create_variable_access
        mov     QWORD PTR -40[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     QWORD PTR -32[rbp], 0
.L1058:
        mov     rax, QWORD PTR 48[rbp]
        mov     edx, 1
        mov     rcx, rax
        call    peek_next_token
        mov     QWORD PTR -8[rbp], rax
.L1046:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 5
        je      .L1071
        jmp     .L1070
.L1072:
        nop
.L1070:
        mov     rax, QWORD PTR -40[rbp]
.L1045:
        add     rsp, 152
        pop     rbx
        pop     rsi
        pop     rdi
        pop     rbp
        ret
create_attribute_table:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC365:
        .ascii "[Warning] Unsupported type for size lookup: %s\12\0"
get_type_size:
        push    rbp
        push    rbx
        sub     rsp, 56
        lea     rbp, 48[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR -8[rbp], 8
        cmp     QWORD PTR 32[rbp], 0
        jne     .L1076
        mov     QWORD PTR -8[rbp], 0
        jmp     .L1077
.L1076:
        mov     rax, QWORD PTR name_int[rip]
        cmp     QWORD PTR 32[rbp], rax
        je      .L1078
        mov     rax, QWORD PTR name_float[rip]
        cmp     QWORD PTR 32[rbp], rax
        je      .L1078
        mov     rax, QWORD PTR name_string[rip]
        cmp     QWORD PTR 32[rbp], rax
        jne     .L1079
.L1078:
        mov     QWORD PTR -8[rbp], 8
        jmp     .L1077
.L1079:
        mov     rax, QWORD PTR name_bool[rip]
        cmp     QWORD PTR 32[rbp], rax
        je      .L1080
        mov     rax, QWORD PTR name_void[rip]
        cmp     QWORD PTR 32[rbp], rax
        jne     .L1081
.L1080:
        mov     QWORD PTR -8[rbp], 1
        jmp     .L1077
.L1081:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1082
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1077
.L1082:
        mov     rax, QWORD PTR 32[rbp]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC365[rip]
        mov     rdx, rax
        call    fprintf
.L1077:
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret
get_instruction_type:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR 16[rbp], ecx
        cmp     DWORD PTR 16[rbp], 18
        ja      .L1085
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L1087[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L1087[rip]
        add     rax, rdx
        jmp     rax
.L1087:
        .long   .L1091-.L1087
        .long   .L1090-.L1087
        .long   .L1089-.L1087
        .long   .L1088-.L1087
        .long   .L1086-.L1087
        .long   .L1100-.L1087
        .long   .L1099-.L1087
        .long   .L1098-.L1087
        .long   .L1097-.L1087
        .long   .L1096-.L1087
        .long   .L1095-.L1087
        .long   .L1094-.L1087
        .long   .L1093-.L1087
        .long   .L1092-.L1087
        .long   .L1091-.L1087
        .long   .L1090-.L1087
        .long   .L1089-.L1087
        .long   .L1088-.L1087
        .long   .L1086-.L1087
.L1091:
        mov     eax, 0
        jmp     .L1101
.L1090:
        mov     eax, 1
        jmp     .L1101
.L1089:
        mov     eax, 2
        jmp     .L1101
.L1088:
        mov     eax, 3
        jmp     .L1101
.L1086:
        mov     eax, 4
        jmp     .L1101
.L1092:
        mov     eax, 14
        jmp     .L1101
.L1100:
        mov     eax, 5
        jmp     .L1101
.L1099:
        mov     eax, 6
        jmp     .L1101
.L1098:
        mov     eax, 7
        jmp     .L1101
.L1097:
        mov     eax, 8
        jmp     .L1101
.L1096:
        mov     eax, 9
        jmp     .L1101
.L1095:
        mov     eax, 10
        jmp     .L1101
.L1094:
        mov     eax, 11
        jmp     .L1101
.L1093:
        mov     eax, 12
        jmp     .L1101
.L1085:
        mov     eax, 25
.L1101:
        pop     rbp
        ret
create_tac:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_tac_status:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 96
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], 0
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 32[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 40[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 48[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 56[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 64[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 72[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 80[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 88[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_subroutine:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     ecx, 40
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rdx], rax
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 32[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_block:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        call    create_list
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
search_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1111
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L1111
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1111
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1111
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1112
.L1114:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L1112
        mov     rax, QWORD PTR -16[rbp]
        jmp     .L1113
.L1112:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        jne     .L1114
.L1111:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1115
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L1115
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1115
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1115
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        jmp     .L1116
.L1117:
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L1116
        mov     rax, QWORD PTR -32[rbp]
        jmp     .L1113
.L1116:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1117
.L1115:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L1118
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1118
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1118
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1118
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -40[rbp], rax
        jmp     .L1119
.L1122:
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jne     .L1119
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1119
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1119
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1119
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -56[rbp], rax
        jmp     .L1120
.L1121:
        mov     rax, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L1120
        mov     rax, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR [rax]
        jmp     .L1113
.L1120:
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L1121
.L1119:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L1122
.L1118:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L1123
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1123
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1123
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -72[rbp], rax
        jmp     .L1124
.L1125:
        mov     rax, QWORD PTR -80[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 16[rbp], rax
        jne     .L1124
        mov     rax, QWORD PTR -80[rbp]
        jmp     .L1113
.L1124:
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L1125
.L1123:
        mov     eax, 0
.L1113:
        add     rsp, 112
        pop     rbp
        ret
.LC366:
        .ascii "$%d-error\0"
.LC367:
        .ascii "$%c%zu\0"
create_var:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     DWORD PTR 32[rbp], r8d
        mov     QWORD PTR 40[rbp], r9
        cmp     QWORD PTR 16[rbp], 0
        je      .L1127
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1128
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], rdx
.L1128:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    search_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1129
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rax], rdx
.L1129:
        cmp     QWORD PTR -24[rbp], 0
        je      .L1127
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L1130
.L1127:
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR 16[rbp]
        mov     QWORD PTR [rax], rdx
        mov     eax, DWORD PTR 32[rbp]
        sub     eax, 97
        cmp     eax, 21
        ja      .L1131
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L1133[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L1133[rip]
        add     rax, rdx
        jmp     rax
.L1133:
        .long   .L1138-.L1133
        .long   .L1137-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1136-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1135-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1131-.L1133
        .long   .L1134-.L1133
        .long   .L1131-.L1133
        .long   .L1132-.L1133
.L1138:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 48[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 48[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1139
.L1135:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 56[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 56[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1139
.L1132:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 64[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 64[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1139
.L1134:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 72[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 72[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1139
.L1137:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 80[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 80[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1139
.L1136:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 88[rax]
        lea     rcx, 1[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 88[rdx], rcx
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1139
.L1131:
        mov     QWORD PTR -16[rbp], -1
        nop
.L1139:
        mov     r8d, 1
        mov     edx, 32
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 8[rdx], rax
        cmp     QWORD PTR -16[rbp], -1
        jne     .L1140
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     edx, DWORD PTR 32[rbp]
        mov     r8d, edx
        lea     rdx, .LC366[rip]
        mov     rcx, rax
        call    sprintf
        jmp     .L1141
.L1140:
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR -16[rbp]
        mov     edx, DWORD PTR 32[rbp]
        mov     r9, rcx
        mov     r8d, edx
        lea     rdx, .LC367[rip]
        mov     rcx, rax
        call    sprintf
.L1141:
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 16[rax], rdx
        cmp     DWORD PTR 32[rbp], 116
        je      .L1142
        cmp     DWORD PTR 32[rbp], 118
        jne     .L1143
.L1142:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
.L1143:
        mov     rax, QWORD PTR -32[rbp]
.L1130:
        add     rsp, 64
        pop     rbp
        ret
.LC368:
        .ascii "Error: create_attribute received NULL table\12\0"
.LC369:
        .ascii "Error: create_attribute received NULL table or attributes list\12\0"
create_attribute:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rcx, QWORD PTR 48[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r9, rcx
        mov     r8d, 97
        mov     rcx, rax
        call    create_var
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        cmp     QWORD PTR 40[rbp], 0
        jne     .L1145
        cmp     QWORD PTR 32[rbp], 0
        je      .L1145
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    get_type_size
        mov     rdx, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rdx]
        add     rdx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     QWORD PTR 16[rax], rdx
        jmp     .L1146
.L1145:
        cmp     QWORD PTR 32[rbp], 0
        jne     .L1146
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 44
        mov     edx, 1
        lea     rax, .LC368[rip]
        mov     rcx, rax
        call    fwrite
.L1146:
        cmp     QWORD PTR 32[rbp], 0
        je      .L1147
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L1148
.L1147:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 63
        mov     edx, 1
        lea     rax, .LC369[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L1149
.L1148:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
.L1149:
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
create_instruction:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     QWORD PTR 32[rbp], r8
        mov     QWORD PTR 40[rbp], r9
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 24[rax], edx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 40[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC370:
        .ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
create_arg:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR 16[rbp], ecx
        mov     QWORD PTR 24[rbp], rdx
        mov     ecx, 24
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR 16[rbp]
        mov     DWORD PTR 16[rax], edx
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], 0
        cmp     DWORD PTR 16[rbp], 8
        ja      .L1154
        mov     eax, DWORD PTR 16[rbp]
        lea     rdx, 0[0+rax*4]
        lea     rax, .L1156[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L1156[rip]
        add     rax, rdx
        jmp     rax
.L1156:
        .long   .L1163-.L1156
        .long   .L1162-.L1156
        .long   .L1161-.L1156
        .long   .L1160-.L1156
        .long   .L1159-.L1156
        .long   .L1158-.L1156
        .long   .L1157-.L1156
        .long   .L1155-.L1156
        .long   .L1155-.L1156
.L1163:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1164
.L1162:
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rdx, QWORD PTR name_int[rip]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1164
.L1161:
        mov     rax, QWORD PTR 24[rbp]
        movsd   xmm0, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        movsd   QWORD PTR [rax], xmm0
        mov     rdx, QWORD PTR name_float[rip]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1164
.L1160:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rdx, QWORD PTR name_string[rip]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1164
.L1159:
        mov     rax, QWORD PTR 24[rbp]
        movzx   edx, BYTE PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR [rax], dl
        mov     rdx, QWORD PTR name_bool[rip]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1164
.L1158:
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR [rax], 0
        mov     rdx, QWORD PTR name_void[rip]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1164
.L1157:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        jmp     .L1164
.L1155:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 16[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1164
.L1154:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     eax, DWORD PTR 16[rbp]
        mov     r8d, eax
        lea     rax, .LC370[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L1164:
        mov     rax, QWORD PTR -8[rbp]
        mov     BYTE PTR 20[rax], 0
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
load_rvalue:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        cmp     QWORD PTR 16[rbp], 0
        jne     .L1167
        mov     eax, 0
        jmp     .L1168
.L1167:
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR 20[rax]
        test    al, al
        je      .L1169
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 23
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -8[rbp]
        jmp     .L1168
.L1169:
        mov     rax, QWORD PTR 16[rbp]
.L1168:
        add     rsp, 48
        pop     rbp
        ret
.LC371:
        .ascii "main\0"
tac_code:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        call    create_tac
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_tac_status
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -24[rbp], rax
        jmp     .L1171
.L1174:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 1
        jne     .L1172
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    tac_function
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, .LC371[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L1171
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        jmp     .L1171
.L1172:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 2
        jne     .L1173
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    tac_class
        jmp     .L1171
.L1173:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        jne     .L1171
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    tac_import
.L1171:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        jne     .L1174
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 64
        pop     rbp
        ret
.LC372:
        .ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
tac_import:
        push    rbp
        push    rbx
        sub     rsp, 40
        lea     rbp, 32[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     QWORD PTR 48[rbp], r8
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 3
        jne     .L1177
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 48[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L1182
.L1177:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L1179
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L1180
.L1179:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, QWORD PTR 48[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L1182
.L1180:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1181
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR 48[rbp]
        mov     rcx, rax
        call    tac_class
        jmp     .L1182
.L1181:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     ebx, DWORD PTR 32[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC372[rip]
        mov     rdx, rax
        call    fprintf
.L1182:
        nop
        add     rsp, 40
        pop     rbx
        pop     rbp
        ret
tac_function:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    create_subroutine
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1184
.L1185:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 112
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
.L1184:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1185
        mov     rax, QWORD PTR 24[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -40[rbp], rax
        jmp     .L1186
.L1187:
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    tac_statement
.L1186:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        cmp     QWORD PTR -48[rbp], 0
        jne     .L1187
        mov     rax, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], 0
        nop
        add     rsp, 80
        pop     rbp
        ret
.LC373:
        .ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
tac_method:
        push    rbp
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    create_subroutine
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1189
.L1190:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 112
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_append
.L1189:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1190
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -40[rbp], rax
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L1195
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        jne     .L1192
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 19
        jne     .L1192
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 8
        jne     .L1192
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR [rax]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        je      .L1193
.L1192:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC373[rip]
        mov     rdx, rax
        call    fprintf
        jmp     .L1188
.L1193:
        mov     rax, QWORD PTR -48[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 24[rax]
        add     rax, 24
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -56[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     r9d, 0
        mov     r8, rbx
        mov     rdx, rax
        mov     ecx, 18
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L1195
.L1196:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    tac_statement
.L1195:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -64[rbp], rax
        cmp     QWORD PTR -64[rbp], 0
        jne     .L1196
        mov     rax, QWORD PTR 40[rbp]
        mov     QWORD PTR 8[rax], 0
.L1188:
        add     rsp, 104
        pop     rbx
        pop     rbp
        ret
.LC374:
        .ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
tac_class:
        push    rbp
        push    rbx
        sub     rsp, 72
        lea     rbp, 64[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 24[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    create_attribute_table
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L1198
.L1202:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR 8[rax]
        test    eax, eax
        je      .L1199
        cmp     eax, 1
        je      .L1200
        jmp     .L1203
.L1199:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_method
        jmp     .L1198
.L1200:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    tac_variable
        jmp     .L1198
.L1203:
        mov     rax, QWORD PTR -24[rbp]
        mov     ebx, DWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC374[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L1198:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -24[rbp], rax
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1202
        mov     rax, QWORD PTR 40[rbp]
        mov     QWORD PTR 24[rax], 0
        nop
        add     rsp, 72
        pop     rbx
        pop     rbp
        ret
tac_variable:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     eax, r8d
        mov     BYTE PTR 32[rbp], al
        mov     QWORD PTR -16[rbp], 0
        cmp     BYTE PTR 32[rbp], 0
        je      .L1205
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    list_pop_back
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     r8, QWORD PTR -24[rbp]
        mov     rcx, QWORD PTR 24[rbp]
        mov     QWORD PTR 32[rsp], rcx
        mov     r9d, 0
        mov     rcx, rax
        call    create_attribute
        jmp     .L1209
.L1205:
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 24[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L1207
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1208
.L1207:
        mov     QWORD PTR -32[rbp], 0
        lea     rax, -32[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
.L1208:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     rdx, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 14
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
.L1209:
        nop
        add     rsp, 80
        pop     rbp
        ret
.LC375:
        .ascii "[Warning] 'break' statement used outside of loop\12\0"
.LC376:
        .ascii "[Warning] 'continue' statement used outside of loop\12\0"
.LC377:
        .ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
tac_statement:
        push    rbp
        push    rbx
        sub     rsp, 88
        lea     rbp, 80[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 7
        ja      .L1211
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L1213[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L1213[rip]
        add     rax, rdx
        jmp     rax
.L1213:
        .long   .L1220-.L1213
        .long   .L1219-.L1213
        .long   .L1218-.L1213
        .long   .L1217-.L1213
        .long   .L1216-.L1213
        .long   .L1215-.L1213
        .long   .L1214-.L1213
        .long   .L1212-.L1213
.L1220:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        jmp     .L1221
.L1219:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    tac_variable
        jmp     .L1221
.L1218:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_if
        jmp     .L1221
.L1217:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_while
        jmp     .L1221
.L1216:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_for
        jmp     .L1221
.L1215:
        mov     edx, 0
        mov     ecx, 5
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1222
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
.L1222:
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 21
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L1221
.L1214:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        test    rax, rax
        je      .L1223
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1223
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1223
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -32[rbp], rax
        cmp     QWORD PTR -32[rbp], 0
        je      .L1223
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L1221
.L1223:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 49
        mov     edx, 1
        lea     rax, .LC375[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L1221
.L1212:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        test    rax, rax
        je      .L1224
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1224
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1224
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L1224
        mov     rax, QWORD PTR -16[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L1221
.L1224:
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 52
        mov     edx, 1
        lea     rax, .LC376[rip]
        mov     rcx, rax
        call    fwrite
        jmp     .L1221
.L1211:
        mov     rax, QWORD PTR 32[rbp]
        mov     ebx, DWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC377[rip]
        mov     rdx, rax
        call    fprintf
        nop
.L1221:
        nop
        add     rsp, 88
        pop     rbx
        pop     rbp
        ret
tac_if:
        push    rbp
        push    rbx
        sub     rsp, 200
        lea     rbp, 192[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L1226
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1226
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L1227
.L1226:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L1228
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1228
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L1227
.L1228:
        mov     rax, QWORD PTR -8[rbp]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1229
.L1227:
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -16[rbp], rax
.L1229:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -64[rbp], rax
        jmp     .L1230
.L1231:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    tac_statement
.L1230:
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L1231
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L1232
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1232
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1232
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -88[rbp], rax
        jmp     .L1233
.L1239:
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -104[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -104[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -96[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        je      .L1234
        mov     rax, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1234
        mov     rax, QWORD PTR -88[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L1235
.L1234:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L1236
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1236
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L1235
.L1236:
        mov     rax, QWORD PTR -16[rbp]
        mov     QWORD PTR -8[rbp], rax
.L1235:
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -96[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -112[rbp], rax
        jmp     .L1237
.L1238:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -120[rbp]
        mov     rcx, rax
        call    tac_statement
.L1237:
        mov     rax, QWORD PTR -112[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -120[rbp], rax
        cmp     QWORD PTR -120[rbp], 0
        jne     .L1238
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
.L1233:
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -96[rbp], rax
        cmp     QWORD PTR -96[rbp], 0
        jne     .L1239
.L1232:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        test    rax, rax
        je      .L1240
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1240
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1240
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -128[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -128[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -128[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -136[rbp], rax
        jmp     .L1241
.L1242:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -144[rbp]
        mov     rcx, rax
        call    tac_statement
.L1241:
        mov     rax, QWORD PTR -136[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -144[rbp], rax
        cmp     QWORD PTR -144[rbp], 0
        jne     .L1242
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
.L1240:
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -152[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -152[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -152[rbp]
        mov     QWORD PTR 16[rax], rdx
        nop
        add     rsp, 200
        pop     rbx
        pop     rbp
        ret
tac_for:
        push    rbp
        push    rbx
        sub     rsp, 168
        lea     rbp, 160[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L1244
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    tac_variable
.L1244:
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1245
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -64[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        jmp     .L1246
.L1245:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    list_append
.L1246:
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -72[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -72[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L1247
        mov     rax, QWORD PTR -80[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L1248
.L1247:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1249
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
        jmp     .L1248
.L1249:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
.L1248:
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -88[rbp], rax
        jmp     .L1250
.L1251:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -96[rbp]
        mov     rcx, rax
        call    tac_statement
.L1250:
        mov     rax, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -96[rbp], rax
        cmp     QWORD PTR -96[rbp], 0
        jne     .L1251
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        test    rax, rax
        je      .L1252
        mov     rax, QWORD PTR -80[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -104[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -104[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -112[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -112[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -112[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
.L1252:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        jne     .L1253
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
.L1253:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -120[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -120[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -120[rbp]
        mov     QWORD PTR 16[rax], rdx
        nop
        add     rsp, 168
        pop     rbx
        pop     rbp
        ret
tac_while:
        push    rbp
        push    rbx
        sub     rsp, 120
        lea     rbp, 112[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -24[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     r9, rax
        mov     r8d, 98
        mov     edx, 0
        mov     ecx, 0
        call    create_var
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rbx, rax
        mov     rax, QWORD PTR -32[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rbx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 19
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -56[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -64[rbp], rax
        jmp     .L1255
.L1256:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    tac_statement
.L1255:
        mov     rax, QWORD PTR -64[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -72[rbp], rax
        cmp     QWORD PTR -72[rbp], 0
        jne     .L1256
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 40[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 32[rax]
        mov     rcx, rax
        call    list_pop_back
        mov     rax, QWORD PTR -8[rbp]
        mov     rdx, rax
        mov     ecx, 6
        call    create_arg
        mov     r9d, 0
        mov     r8d, 0
        mov     rdx, rax
        mov     ecx, 20
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    create_block
        mov     QWORD PTR -80[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rax]
        mov     rdx, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, QWORD PTR -80[rbp]
        mov     QWORD PTR 16[rax], rdx
        nop
        add     rsp, 120
        pop     rbx
        pop     rbp
        ret
.LC378:
        .ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
tac_expression:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 19
        jne     .L1258
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_primary
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -56[rbp]
        jmp     .L1259
.L1258:
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        mov     ecx, eax
        call    get_instruction_type
        mov     DWORD PTR -20[rbp], eax
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 13
        je      .L1260
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 14
        je      .L1260
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 15
        je      .L1260
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 16
        je      .L1260
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 17
        je      .L1260
        mov     rax, QWORD PTR 16[rbp]
        mov     eax, DWORD PTR 24[rax]
        cmp     eax, 18
        jne     .L1261
.L1260:
        cmp     DWORD PTR -20[rbp], 14
        je      .L1262
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -48[rbp], rax
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    load_rvalue
        mov     rcx, rax
        mov     r8, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR -48[rbp]
        mov     eax, DWORD PTR -20[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     ecx, eax
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -48[rbp]
        mov     QWORD PTR -8[rbp], rax
.L1262:
        mov     rax, QWORD PTR -32[rbp]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        je      .L1263
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 57
        mov     edx, 1
        lea     rax, .LC378[rip]
        mov     rcx, rax
        call    fwrite
.L1263:
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 14
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        movzx   eax, BYTE PTR 20[rax]
        test    al, al
        je      .L1265
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 24
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        jmp     .L1265
.L1261:
        mov     rax, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 24[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -40[rbp], rax
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    load_rvalue
        mov     rcx, rax
        mov     r8, QWORD PTR -8[rbp]
        mov     rdx, QWORD PTR -40[rbp]
        mov     eax, DWORD PTR -20[rbp]
        mov     r9, r8
        mov     r8, rcx
        mov     ecx, eax
        call    create_instruction
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     QWORD PTR -8[rbp], rax
.L1265:
        mov     rax, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -8[rbp]
.L1259:
        add     rsp, 96
        pop     rbp
        ret
.LC380:
        .ascii "[Warning] Unsupported type for negation: %s\12\0"
.LC381:
        .ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
tac_primary:
        push    rbp
        push    rbx
        sub     rsp, 136
        lea     rbp, 128[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 8[rax]
        cmp     eax, 8
        ja      .L1267
        mov     eax, eax
        lea     rdx, 0[0+rax*4]
        lea     rax, .L1269[rip]
        mov     eax, DWORD PTR [rdx+rax]
        cdqe
        lea     rdx, .L1269[rip]
        add     rax, rdx
        jmp     rax
.L1269:
        .long   .L1277-.L1269
        .long   .L1276-.L1269
        .long   .L1275-.L1269
        .long   .L1274-.L1269
        .long   .L1273-.L1269
        .long   .L1272-.L1269
        .long   .L1271-.L1269
        .long   .L1270-.L1269
        .long   .L1268-.L1269
.L1277:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     r8d, 10
        mov     edx, 0
        mov     rcx, rax
        call    strtoll
        mov     QWORD PTR -56[rbp], rax
        lea     rax, -56[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        jmp     .L1278
.L1276:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     edx, 0
        mov     rcx, rax
        call    strtod
        movq    rax, xmm0
        mov     QWORD PTR -64[rbp], rax
        lea     rax, -64[rbp]
        mov     rdx, rax
        mov     ecx, 2
        call    create_arg
        jmp     .L1278
.L1275:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, rax
        mov     ecx, 3
        call    create_arg
        jmp     .L1278
.L1274:
        mov     BYTE PTR -65[rbp], 1
        lea     rax, -65[rbp]
        mov     rdx, rax
        mov     ecx, 4
        call    create_arg
        jmp     .L1278
.L1273:
        mov     BYTE PTR -66[rbp], 0
        lea     rax, -66[rbp]
        mov     rdx, rax
        mov     ecx, 4
        call    create_arg
        jmp     .L1278
.L1272:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        jmp     .L1278
.L1271:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_primary
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR name_bool[rip]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -40[rbp], rax
        mov     rdx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 13
        call    create_instruction
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -48[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -40[rbp]
        jmp     .L1278
.L1270:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_primary
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -24[rbp], rax
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -80[rbp], 0
        movsd   xmm0, QWORD PTR .LC379[rip]
        movsd   QWORD PTR -88[rbp], xmm0
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR name_int[rip]
        cmp     rdx, rax
        jne     .L1279
        lea     rax, -80[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 1
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1280
.L1279:
        mov     rax, QWORD PTR -16[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR name_float[rip]
        cmp     rdx, rax
        jne     .L1281
        lea     rax, -88[rbp]
        mov     rdx, rax
        mov     ecx, 2
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -24[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 2
        call    create_instruction
        mov     QWORD PTR -8[rbp], rax
        jmp     .L1280
.L1281:
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC380[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1278
.L1280:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L1278
.L1268:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_variable_access
        jmp     .L1278
.L1267:
        mov     rax, QWORD PTR 32[rbp]
        mov     ebx, DWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC381[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
.L1278:
        add     rsp, 136
        pop     rbx
        pop     rbp
        ret
.LC382:
        .ascii "[Warning] Unsupported variable access with NULL base\12\0"
.LC383:
        .ascii "[Warning] Failed to generate variable access for base\12\0"
.LC384:
        .ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
.LC385:
        .ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
.LC386:
        .ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
.LC387:
        .ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC388:
        .ascii "arr\0"
.LC389:
        .ascii "[Warning] Attempting to index non-array type: %s\12\0"
.LC390:
        .ascii "[Warning] Failed to generate variable access for index\12\0"
.LC391:
        .ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
.LC392:
        .ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
tac_variable_access:
        push    rbp
        push    rsi
        push    rbx
        sub     rsp, 224
        lea     rbp, 224[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     QWORD PTR 40[rbp], rdx
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        jne     .L1284
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1284
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L1285
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L1286
.L1285:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 7
        call    create_arg
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        jmp     .L1287
.L1286:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1288
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -32[rbp]
        jmp     .L1287
.L1288:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 118
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        jmp     .L1287
.L1284:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L1289
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 53
        mov     edx, 1
        lea     rax, .LC382[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L1287
.L1289:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_variable_access
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -8[rbp], rax
        cmp     QWORD PTR -8[rbp], 0
        jne     .L1290
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 54
        mov     edx, 1
        lea     rax, .LC383[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L1287
.L1290:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 2
        jne     .L1291
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        je      .L1292
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L1293
.L1292:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC384[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1287
.L1293:
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     QWORD PTR -16[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1294
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -16[rbp], rax
.L1294:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -136[rbp], rax
        cmp     QWORD PTR -136[rbp], 0
        jne     .L1295
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC385[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1287
.L1295:
        mov     rax, QWORD PTR -136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 1
        jne     .L1296
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC386[rip]
        mov     rdx, rax
        call    fprintf
        mov     rax, QWORD PTR -136[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -136[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 7
        call    create_arg
        jmp     .L1287
.L1296:
        mov     rax, QWORD PTR -136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 2
        jne     .L1297
        mov     rax, QWORD PTR -136[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -136[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 8
        call    create_arg
        jmp     .L1287
.L1297:
        mov     rax, QWORD PTR -136[rbp]
        mov     eax, DWORD PTR 32[rax]
        cmp     eax, 5
        je      .L1298
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8, rbx
        lea     rax, .LC387[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1287
.L1298:
        mov     rax, QWORD PTR -136[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -144[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     r9, rcx
        mov     r8d, 97
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -144[rbp]
        mov     r9, rdx
        mov     r8, rcx
        mov     rdx, rax
        mov     ecx, 15
        call    create_instruction
        mov     QWORD PTR -152[rbp], rax
        mov     rax, QWORD PTR -144[rbp]
        mov     BYTE PTR 20[rax], 1
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -152[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -144[rbp]
        jmp     .L1287
.L1291:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 3
        jne     .L1299
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        lea     rdx, .LC388[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L1300
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rbx, QWORD PTR 8[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC389[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1287
.L1300:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -112[rbp], rax
        cmp     QWORD PTR -112[rbp], 0
        jne     .L1301
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     r9, rax
        mov     r8d, 55
        mov     edx, 1
        lea     rax, .LC390[rip]
        mov     rcx, rax
        call    fwrite
        mov     eax, 0
        jmp     .L1287
.L1301:
        mov     rax, QWORD PTR name_int[rip]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -120[rbp], rax
        mov     rcx, QWORD PTR -112[rbp]
        mov     rdx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -120[rbp]
        mov     r9, rcx
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 16
        call    create_instruction
        mov     QWORD PTR -128[rbp], rax
        mov     rax, QWORD PTR -120[rbp]
        mov     BYTE PTR 20[rax], 1
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -128[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -120[rbp]
        jmp     .L1287
.L1299:
        mov     rax, QWORD PTR 32[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 1
        jne     .L1302
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        test    eax, eax
        jne     .L1303
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     eax, DWORD PTR 32[rax]
        test    eax, eax
        jne     .L1303
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    search_name_use_strcmp
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -48[rbp]
        mov     r9, rcx
        mov     r8d, 102
        mov     rcx, rax
        call    create_var
        mov     rdx, rax
        mov     ecx, 8
        call    create_arg
        mov     QWORD PTR -8[rbp], rax
.L1303:
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 8
        je      .L1304
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 7
        je      .L1304
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rsi, QWORD PTR 8[rax]
        mov     rax, QWORD PTR -8[rbp]
        mov     ebx, DWORD PTR 16[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r9, rsi
        mov     r8d, ebx
        lea     rax, .LC391[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
        jmp     .L1287
.L1304:
        mov     QWORD PTR -160[rbp], 0
        call    create_list
        mov     QWORD PTR -56[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     eax, DWORD PTR 16[rax]
        cmp     eax, 8
        jne     .L1306
        mov     rdx, QWORD PTR DEFAULT_CONSTRUCTOR_NAME[rip]
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    make_method_name
        mov     rdx, rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L1306
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR 32[rsp], rax
        mov     r9d, 0
        mov     r8d, 0
        mov     edx, 0
        mov     ecx, 8
        call    create_primary
        mov     r9d, 0
        mov     r8, rax
        mov     edx, 0
        mov     ecx, 19
        call    create_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -64[rbp], rax
        mov     rax, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    get_type_size
        mov     QWORD PTR -168[rbp], rax
        lea     rax, -168[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, QWORD PTR -64[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 17
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -160[rbp]
        add     rax, 1
        mov     QWORD PTR -160[rbp], rax
.L1306:
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_copy
        mov     QWORD PTR -72[rbp], rax
        jmp     .L1307
.L1308:
        mov     rdx, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     rcx, rax
        call    tac_expression
        mov     rcx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rdx, rax
        call    load_rvalue
        mov     QWORD PTR -104[rbp], rax
        mov     rax, QWORD PTR -104[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    get_type_size
        mov     QWORD PTR -176[rbp], rax
        lea     rax, -176[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, QWORD PTR -104[rbp]
        mov     r9d, 0
        mov     r8, rdx
        mov     rdx, rax
        mov     ecx, 17
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -160[rbp]
        add     rax, 1
        mov     QWORD PTR -160[rbp], rax
.L1307:
        mov     rax, QWORD PTR -72[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -80[rbp], rax
        cmp     QWORD PTR -80[rbp], 0
        jne     .L1308
        jmp     .L1309
.L1310:
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR -88[rbp]
        mov     rcx, rax
        call    list_append
.L1309:
        mov     rax, QWORD PTR -56[rbp]
        mov     rcx, rax
        call    list_pop
        mov     QWORD PTR -88[rbp], rax
        cmp     QWORD PTR -88[rbp], 0
        jne     .L1310
        mov     rax, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     rdx, QWORD PTR 40[rbp]
        mov     r9, rdx
        mov     r8d, 116
        mov     rdx, rax
        mov     ecx, 0
        call    create_var
        mov     rdx, rax
        mov     ecx, 0
        call    create_arg
        mov     QWORD PTR -96[rbp], rax
        lea     rax, -160[rbp]
        mov     rdx, rax
        mov     ecx, 1
        call    create_arg
        mov     rdx, rax
        mov     rcx, QWORD PTR -8[rbp]
        mov     rax, QWORD PTR -96[rbp]
        mov     r9, rdx
        mov     r8, rcx
        mov     rdx, rax
        mov     ecx, 22
        call    create_instruction
        mov     rdx, rax
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rax, QWORD PTR 8[rax]
        mov     rcx, rax
        call    list_append
        mov     rax, QWORD PTR -96[rbp]
        jmp     .L1287
.L1302:
        mov     rax, QWORD PTR 32[rbp]
        mov     ebx, DWORD PTR 16[rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8d, ebx
        lea     rax, .LC392[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 0
.L1287:
        add     rsp, 224
        pop     rbx
        pop     rsi
        pop     rbp
        ret
create_file:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        mov     ecx, 32
        call    alloc_memory
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     edx, 0
        mov     rcx, rax
        call    absolute_path
        mov     rdx, QWORD PTR -8[rbp]
        mov     QWORD PTR 24[rdx], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     rcx, rax
        call    normalize_path
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
.LC393:
        .ascii "%s/%s\0"
absolute_path:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 16[rbp]
        mov     r8d, 0
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR 16[rbp], rax
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -8[rbp], rax
        mov     QWORD PTR -16[rbp], 0
        jmp     .L1314
.L1318:
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 92
        jne     .L1315
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 47
.L1315:
        cmp     QWORD PTR -16[rbp], 1
        jbe     .L1316
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1316
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 46
        jne     .L1316
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, -2[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1316
        mov     rax, QWORD PTR -8[rbp]
        sub     rax, QWORD PTR -16[rbp]
        mov     rcx, rax
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rdx, rax
        mov     rax, QWORD PTR -16[rbp]
        lea     r8, -1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, r8
        mov     r8, rcx
        mov     rcx, rax
        call    memmove
        sub     QWORD PTR -8[rbp], 2
        sub     QWORD PTR -16[rbp], 2
.L1316:
        cmp     QWORD PTR -16[rbp], 0
        je      .L1317
        mov     rdx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1317
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1317
        mov     rax, QWORD PTR -8[rbp]
        sub     rax, QWORD PTR -16[rbp]
        mov     r8, rax
        mov     rax, QWORD PTR -16[rbp]
        lea     rdx, 1[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rdx, rax
        mov     rcx, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR -16[rbp]
        add     rax, rcx
        mov     rcx, rax
        call    memmove
        sub     QWORD PTR -8[rbp], 1
        sub     QWORD PTR -16[rbp], 1
.L1317:
        add     QWORD PTR -16[rbp], 1
.L1314:
        mov     rax, QWORD PTR -16[rbp]
        cmp     rax, QWORD PTR -8[rbp]
        jb      .L1318
        cmp     QWORD PTR -8[rbp], 2
        jbe     .L1319
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1319
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 96
        jle     .L1319
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 122
        jg      .L1319
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 2
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1319
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 96
        jle     .L1320
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 122
        jg      .L1320
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        sub     eax, 32
        jmp     .L1321
.L1320:
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR 1[rax]
.L1321:
        mov     rdx, QWORD PTR 16[rbp]
        mov     BYTE PTR [rdx], al
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        mov     BYTE PTR [rax], 58
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L1322
.L1319:
        cmp     QWORD PTR -8[rbp], 1
        jbe     .L1323
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 64
        jle     .L1323
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 90
        jg      .L1323
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 1
        movzx   eax, BYTE PTR [rax]
        cmp     al, 58
        jne     .L1323
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L1322
.L1323:
        cmp     QWORD PTR -8[rbp], 0
        je      .L1324
        mov     rax, QWORD PTR 16[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1324
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L1322
.L1324:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L1325
        mov     edx, 0
        mov     ecx, 0
        call    getcwd
        mov     QWORD PTR 24[rbp], rax
.L1325:
        cmp     QWORD PTR 24[rbp], 0
        jne     .L1326
        mov     rax, QWORD PTR 16[rbp]
        jmp     .L1322
.L1326:
        mov     rax, QWORD PTR 24[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, QWORD PTR -8[rbp]
        add     rax, rdx
        add     rax, 2
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     r8d, 0
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -32[rbp], rax
        mov     rcx, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC393[rip]
        mov     rcx, rax
        call    sprintf
        mov     rdx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -32[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     edx, 0
        mov     rcx, rax
        call    absolute_path
.L1322:
        add     rsp, 64
        pop     rbp
        ret
get_file_dir:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR 16[rbp], rcx
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        jne     .L1328
        mov     eax, 0
        jmp     .L1329
.L1328:
        mov     QWORD PTR -8[rbp], 0
        mov     QWORD PTR -16[rbp], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        jmp     .L1330
.L1332:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1331
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR -48[rbp], rax
        mov     rax, QWORD PTR -48[rbp]
        add     QWORD PTR -8[rbp], rax
        add     QWORD PTR -16[rbp], 1
.L1331:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
.L1330:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1332
        cmp     QWORD PTR -16[rbp], 0
        jne     .L1333
        mov     eax, 0
        jmp     .L1329
.L1333:
        cmp     QWORD PTR -16[rbp], 1
        jbe     .L1334
        mov     rdx, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR -8[rbp]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR -8[rbp], rax
.L1334:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     r8d, 0
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -40[rbp], rax
        mov     rax, QWORD PTR -40[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 16[rbp]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR -24[rbp], rax
        mov     BYTE PTR -25[rbp], 1
        jmp     .L1335
.L1338:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1336
        cmp     BYTE PTR -25[rbp], 0
        jne     .L1337
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC36[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L1337
        mov     rax, QWORD PTR -40[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L1337
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L1337
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L1337:
        mov     rax, QWORD PTR -24[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strcat
        mov     BYTE PTR -25[rbp], 0
.L1336:
        mov     rax, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -24[rbp], rax
.L1335:
        cmp     QWORD PTR -24[rbp], 0
        jne     .L1338
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
.L1329:
        add     rsp, 80
        pop     rbp
        ret
.LC394:
        .ascii "%s/%s%s\0"
.LC395:
        .ascii "%s%s\0"
rebuild_full_path:
        push    rbp
        push    rbx
        sub     rsp, 104
        lea     rbp, 96[rsp]
        mov     QWORD PTR 32[rbp], rcx
        mov     rax, QWORD PTR 32[rbp]
        mov     rcx, rax
        call    get_file_dir
        mov     QWORD PTR -16[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L1340
        mov     rax, QWORD PTR -16[rbp]
        jmp     .L1341
.L1340:
        lea     rax, .LC57[rip]
.L1341:
        mov     QWORD PTR -24[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1342
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        jmp     .L1343
.L1342:
        lea     rax, .LC57[rip]
.L1343:
        mov     QWORD PTR -32[rbp], rax
        mov     rax, QWORD PTR -24[rbp]
        mov     rcx, rax
        call    strlen
        mov     rbx, rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     rcx, rax
        call    strlen
        add     rax, rbx
        add     rax, 1
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR 32[rbp]
        mov     rax, QWORD PTR 8[rax]
        test    rax, rax
        je      .L1344
        mov     rax, QWORD PTR -32[rbp]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR -8[rbp], rax
.L1344:
        mov     rax, QWORD PTR -8[rbp]
        add     rax, 1
        mov     r8d, 0
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR -40[rbp], rax
        cmp     QWORD PTR -16[rbp], 0
        je      .L1345
        mov     rax, QWORD PTR -24[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L1345
        mov     rax, QWORD PTR 32[rbp]
        mov     r8, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR -24[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     rdx, QWORD PTR -32[rbp]
        mov     QWORD PTR 32[rsp], rdx
        mov     r9, r8
        mov     r8, rcx
        lea     rdx, .LC394[rip]
        mov     rcx, rax
        call    sprintf
        jmp     .L1346
.L1345:
        mov     rax, QWORD PTR 32[rbp]
        mov     rdx, QWORD PTR 16[rax]
        mov     rcx, QWORD PTR -32[rbp]
        mov     rax, QWORD PTR -40[rbp]
        mov     r9, rcx
        mov     r8, rdx
        lea     rdx, .LC395[rip]
        mov     rcx, rax
        call    sprintf
.L1346:
        mov     rax, QWORD PTR -40[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR -40[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 32[rbp]
        mov     QWORD PTR 24[rdx], rax
        nop
        add     rsp, 104
        pop     rbx
        pop     rbp
        ret
change_file_extension:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rdx, QWORD PTR 24[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    rebuild_full_path
        nop
        add     rsp, 32
        pop     rbp
        ret
.LC396:
        .ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC397:
        .ascii "..\0"
normalize_path:
        push    rbp
        sub     rsp, 448
        lea     rbp, 128[rsp]
        mov     QWORD PTR 336[rbp], rcx
        mov     rax, QWORD PTR 336[rbp]
        mov     rax, QWORD PTR 24[rax]
        mov     rcx, rax
        call    strlen
        mov     QWORD PTR 232[rbp], rax
        mov     rax, QWORD PTR 232[rbp]
        add     rax, 1
        mov     r8d, 0
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR 224[rbp], rax
        mov     rax, QWORD PTR 336[rbp]
        mov     rdx, QWORD PTR 24[rax]
        mov     rax, QWORD PTR 224[rbp]
        mov     rcx, rax
        call    strcpy
        mov     QWORD PTR 312[rbp], 0
        mov     QWORD PTR 304[rbp], 0
        mov     QWORD PTR 296[rbp], 0
        cmp     QWORD PTR 232[rbp], 0
        je      .L1349
        mov     rax, QWORD PTR 224[rbp]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1349
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 216[rbp], rax
        mov     r8d, 1
        mov     edx, 1
        lea     rax, .LC36[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 216[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 216[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 216[rbp]
        mov     QWORD PTR 312[rbp], rax
        mov     rax, QWORD PTR 216[rbp]
        mov     QWORD PTR 304[rbp], rax
        mov     QWORD PTR 296[rbp], 1
.L1349:
        mov     rax, QWORD PTR 296[rbp]
        mov     QWORD PTR 288[rbp], rax
        jmp     .L1350
.L1365:
        mov     rax, QWORD PTR 288[rbp]
        cmp     rax, QWORD PTR 232[rbp]
        je      .L1351
        mov     rdx, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR 288[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L1352
.L1351:
        mov     rax, QWORD PTR 288[rbp]
        cmp     QWORD PTR 296[rbp], rax
        jnb     .L1353
        mov     rax, QWORD PTR 288[rbp]
        sub     rax, QWORD PTR 296[rbp]
        mov     QWORD PTR 280[rbp], rax
        cmp     QWORD PTR 280[rbp], 255
        jbe     .L1354
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     rax, QWORD PTR 280[rbp]
        mov     r8, rax
        lea     rax, .LC396[rip]
        mov     rdx, rax
        call    fprintf
        mov     QWORD PTR 280[rbp], 255
.L1354:
        mov     rdx, QWORD PTR 224[rbp]
        mov     rax, QWORD PTR 296[rbp]
        add     rdx, rax
        mov     rcx, QWORD PTR 280[rbp]
        lea     rax, -96[rbp]
        mov     r8, rcx
        mov     rcx, rax
        call    strncpy
        lea     rdx, -96[rbp]
        mov     rax, QWORD PTR 280[rbp]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        lea     rax, -96[rbp]
        lea     rdx, .LC28[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L1353
        lea     rax, -96[rbp]
        lea     rdx, .LC397[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L1356
        cmp     QWORD PTR 304[rbp], 0
        je      .L1357
        mov     rax, QWORD PTR 304[rbp]
        cmp     rax, QWORD PTR 312[rbp]
        je      .L1357
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC397[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        jne     .L1358
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 176[rbp], rax
        mov     r8d, 1
        mov     edx, 2
        lea     rax, .LC397[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 176[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 176[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR 176[rbp]
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR 176[rbp]
        mov     QWORD PTR 304[rbp], rax
        jmp     .L1376
.L1358:
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 272[rbp], rax
        jmp     .L1360
.L1362:
        mov     rax, QWORD PTR 272[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 272[rbp], rax
.L1360:
        cmp     QWORD PTR 272[rbp], 0
        je      .L1361
        mov     rax, QWORD PTR 272[rbp]
        mov     rax, QWORD PTR 8[rax]
        cmp     QWORD PTR 304[rbp], rax
        jne     .L1362
.L1361:
        cmp     QWORD PTR 272[rbp], 0
        je      .L1376
        mov     rax, QWORD PTR 272[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 272[rbp]
        mov     QWORD PTR 304[rbp], rax
        jmp     .L1376
.L1357:
        cmp     QWORD PTR 312[rbp], 0
        jne     .L1353
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 168[rbp], rax
        mov     r8d, 1
        mov     edx, 2
        lea     rax, .LC397[rip]
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 168[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 168[rbp]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR 168[rbp]
        mov     QWORD PTR 312[rbp], rax
        mov     rax, QWORD PTR 168[rbp]
        mov     QWORD PTR 304[rbp], rax
        jmp     .L1353
.L1356:
        lea     rax, -96[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L1353
        mov     ecx, 16
        call    alloc_memory
        mov     QWORD PTR 184[rbp], rax
        mov     rdx, QWORD PTR 280[rbp]
        lea     rax, -96[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 184[rbp]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 8[rax], 0
        cmp     QWORD PTR 304[rbp], 0
        je      .L1364
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR 184[rbp]
        mov     QWORD PTR 8[rax], rdx
.L1364:
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 304[rbp], rax
        cmp     QWORD PTR 312[rbp], 0
        jne     .L1353
        mov     rax, QWORD PTR 184[rbp]
        mov     QWORD PTR 312[rbp], rax
        jmp     .L1353
.L1376:
        nop
.L1353:
        mov     rax, QWORD PTR 288[rbp]
        add     rax, 1
        mov     QWORD PTR 296[rbp], rax
.L1352:
        add     QWORD PTR 288[rbp], 1
.L1350:
        mov     rax, QWORD PTR 288[rbp]
        cmp     QWORD PTR 232[rbp], rax
        jnb     .L1365
        mov     rax, QWORD PTR 336[rbp]
        mov     rdx, QWORD PTR 312[rbp]
        mov     QWORD PTR [rax], rdx
        cmp     QWORD PTR 304[rbp], 0
        je      .L1366
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     edx, 46
        mov     rcx, rax
        call    strrchr
        mov     QWORD PTR 208[rbp], rax
        cmp     QWORD PTR 208[rbp], 0
        je      .L1367
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR 208[rbp], rax
        je      .L1367
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 208[rbp]
        sub     rdx, rax
        mov     QWORD PTR 200[rbp], rdx
        mov     rax, QWORD PTR 304[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR 200[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rdx], rax
        mov     rax, QWORD PTR 208[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 208[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rdx], rax
        jmp     .L1369
.L1367:
        mov     rax, QWORD PTR 304[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rax], rdx
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rax], 0
        jmp     .L1369
.L1366:
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 16[rax], 0
        mov     rax, QWORD PTR 336[rbp]
        mov     QWORD PTR 8[rax], 0
.L1369:
        mov     QWORD PTR 264[rbp], 0
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 256[rbp], rax
        mov     QWORD PTR 248[rbp], 0
        jmp     .L1370
.L1371:
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR [rax]
        mov     rcx, rax
        call    strlen
        add     QWORD PTR 264[rbp], rax
        add     QWORD PTR 248[rbp], 1
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 256[rbp], rax
.L1370:
        cmp     QWORD PTR 256[rbp], 0
        jne     .L1371
        cmp     QWORD PTR 248[rbp], 1
        jbe     .L1372
        mov     rdx, QWORD PTR 248[rbp]
        mov     rax, QWORD PTR 264[rbp]
        add     rax, rdx
        sub     rax, 1
        mov     QWORD PTR 264[rbp], rax
.L1372:
        mov     rax, QWORD PTR 264[rbp]
        add     rax, 1
        mov     r8d, 0
        mov     rdx, rax
        lea     rax, .LC57[rip]
        mov     rcx, rax
        call    create_string_check
        mov     QWORD PTR 192[rbp], rax
        mov     rax, QWORD PTR 192[rbp]
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR 312[rbp]
        mov     QWORD PTR 256[rbp], rax
        mov     BYTE PTR 247[rbp], 1
        jmp     .L1373
.L1375:
        cmp     BYTE PTR 247[rbp], 0
        jne     .L1374
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR [rax]
        lea     rdx, .LC36[rip]
        mov     rcx, rax
        call    strcmp
        test    eax, eax
        je      .L1374
        mov     rax, QWORD PTR 192[rbp]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L1374
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strlen
        lea     rdx, -1[rax]
        mov     rax, QWORD PTR 192[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L1374
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 192[rbp]
        add     rax, rdx
        mov     WORD PTR [rax], 47
.L1374:
        mov     rax, QWORD PTR 256[rbp]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strcat
        mov     BYTE PTR 247[rbp], 0
        mov     rax, QWORD PTR 256[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR 256[rbp], rax
.L1373:
        cmp     QWORD PTR 256[rbp], 0
        jne     .L1375
        mov     rax, QWORD PTR 192[rbp]
        mov     rcx, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR 192[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        mov     rdx, QWORD PTR 336[rbp]
        mov     QWORD PTR 24[rdx], rax
        nop
        add     rsp, 448
        pop     rbp
        ret
.LC398:
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
        jg      .L1378
        mov     rax, QWORD PTR 40[rbp]
        mov     rbx, QWORD PTR [rax]
        mov     ecx, 2
        mov     rax, QWORD PTR __imp___acrt_iob_func[rip]
        call    rax
        mov     rcx, rax
        mov     r8, rbx
        lea     rax, .LC398[rip]
        mov     rdx, rax
        call    fprintf
        mov     eax, 1
        jmp     .L1379
.L1378:
        call    init
        mov     rax, QWORD PTR 40[rbp]
        mov     rax, QWORD PTR 8[rax]
        mov     QWORD PTR -8[rbp], rax
        mov     rax, QWORD PTR -8[rbp]
        mov     r9d, 1
        mov     r8d, 1
        mov     edx, 1
        mov     rcx, rax
        call    parse_file
        mov     eax, 0
.L1379:
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret
.LC379:
        .long   0
        .long   -1074790400

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
keywordList:
        .space 176
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
symbolList:
        .space 240
struct_memory:
        .space 8
string_memory:
        .space 8
initialized:
        .space 1
all_string_list:
        .space 8
IMPORT_KEYWORD:
        .space 8
FROM_KEYWORD:
        .space 8
FUNC_KEYWORD:
        .space 8
CLASS_KEYWORD:
        .space 8
METHOD_KEYWORD:
        .space 8
SELF_KEYWORD:
        .space 8
IF_KEYWORD:
        .space 8
ELIF_KEYWORD:
        .space 8
ELSE_KEYWORD:
        .space 8
WHILE_KEYWORD:
        .space 8
FOR_KEYWORD:
        .space 8
TRUE_KEYWORD:
        .space 8
FALSE_KEYWORD:
        .space 8
RETURN_KEYWORD:
        .space 8
BREAK_KEYWORD:
        .space 8
CONTINUE_KEYWORD:
        .space 8
INT_KEYWORD:
        .space 8
FLOAT_KEYWORD:
        .space 8
STRING_KEYWORD:
        .space 8
BOOL_KEYWORD:
        .space 8
VOID_KEYWORD:
        .space 8
VAR_KEYWORD:
        .space 8
L_PAREN_SYMBOL:
        .space 8
R_PAREN_SYMBOL:
        .space 8
L_BRACE_SYMBOL:
        .space 8
R_BRACE_SYMBOL:
        .space 8
COMMA_SYMBOL:
        .space 8
NOT_SYMBOL:
        .space 8
DOT_SYMBOL:
        .space 8
L_BRACKET_SYMBOL:
        .space 8
R_BRACKET_SYMBOL:
        .space 8
SEMICOLON_SYMBOL:
        .space 8
UNDERLINE_SYMBOL:
        .space 8
ADD_SYMBOL:
        .space 8
SUB_SYMBOL:
        .space 8
MUL_SYMBOL:
        .space 8
DIV_SYMBOL:
        .space 8
MOD_SYMBOL:
        .space 8
LT_SYMBOL:
        .space 8
GT_SYMBOL:
        .space 8
ASSIGN_SYMBOL:
        .space 8
EQ_SYMBOL:
        .space 8
NE_SYMBOL:
        .space 8
LE_SYMBOL:
        .space 8
GE_SYMBOL:
        .space 8
ADD_ASSIGN_SYMBOL:
        .space 8
SUB_ASSIGN_SYMBOL:
        .space 8
MUL_ASSIGN_SYMBOL:
        .space 8
DIV_ASSIGN_SYMBOL:
        .space 8
MOD_ASSIGN_SYMBOL:
        .space 8
AND_SYMBOL:
        .space 8
OR_SYMBOL:
        .space 8
name_void:
        .space 8
name_int:
        .space 8
name_float:
        .space 8
name_string:
        .space 8
name_bool:
        .space 8
builtin_scope:
        .space 8
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
create_string:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rdx, QWORD PTR 24[rbp]
        mov     rax, QWORD PTR 16[rbp]
        mov     r8d, 1
        mov     rcx, rax
        call    create_string_check
        add     rsp, 32
        pop     rbp
        ret
init:
        push    rbp
        push    rbx
        sub     rsp, 56
        lea     rbp, 48[rsp]
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L36
        mov     rax, QWORD PTR struct_memory[rip]
        test    rax, rax
        jne     .L28
        mov     ecx, 32
        call    malloc
        mov     QWORD PTR struct_memory[rip], rax
        mov     rax, QWORD PTR struct_memory[rip]
        test    rax, rax
        jne     .L29
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
.L29:
        mov     rbx, QWORD PTR struct_memory[rip]
        mov     ecx, 1024
        call    malloc
        mov     QWORD PTR 24[rbx], rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     QWORD PTR [rax], 1024
        mov     rax, QWORD PTR struct_memory[rip]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR struct_memory[rip]
        mov     QWORD PTR 16[rax], 0
        mov     QWORD PTR struct_memory_count[rip], 1024
.L28:
        mov     rax, QWORD PTR string_memory[rip]
        test    rax, rax
        jne     .L30
        mov     ecx, 32
        call    malloc
        mov     QWORD PTR string_memory[rip], rax
        mov     rax, QWORD PTR string_memory[rip]
        test    rax, rax
        jne     .L31
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
.L31:
        mov     rbx, QWORD PTR string_memory[rip]
        mov     ecx, 1024
        call    malloc
        mov     QWORD PTR 24[rbx], rax
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR [rax], 1024
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR 8[rax], 0
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR 16[rax], 0
        mov     QWORD PTR string_memory_count[rip], 1024
.L30:
        mov     BYTE PTR initialized[rip], 1
        mov     QWORD PTR -8[rbp], 0
        jmp     .L32
.L33:
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
.L32:
        cmp     QWORD PTR -8[rbp], 21
        jbe     .L33
        mov     QWORD PTR -16[rbp], 0
        jmp     .L34
.L35:
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
.L34:
        cmp     QWORD PTR -16[rbp], 29
        jbe     .L35
        mov     rax, QWORD PTR keywordList[rip]
        mov     QWORD PTR IMPORT_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+8]
        mov     QWORD PTR FROM_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+16]
        mov     QWORD PTR FUNC_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+24]
        mov     QWORD PTR CLASS_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+32]
        mov     QWORD PTR METHOD_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+40]
        mov     QWORD PTR SELF_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+48]
        mov     QWORD PTR IF_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+56]
        mov     QWORD PTR ELIF_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+64]
        mov     QWORD PTR ELSE_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+72]
        mov     QWORD PTR WHILE_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+80]
        mov     QWORD PTR FOR_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+88]
        mov     QWORD PTR TRUE_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+96]
        mov     QWORD PTR FALSE_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+104]
        mov     QWORD PTR RETURN_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+112]
        mov     QWORD PTR BREAK_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+120]
        mov     QWORD PTR CONTINUE_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+128]
        mov     QWORD PTR INT_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+136]
        mov     QWORD PTR FLOAT_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+144]
        mov     QWORD PTR STRING_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+152]
        mov     QWORD PTR BOOL_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+160]
        mov     QWORD PTR VOID_KEYWORD[rip], rax
        mov     rax, QWORD PTR keywordList[rip+168]
        mov     QWORD PTR VAR_KEYWORD[rip], rax
        mov     rax, QWORD PTR symbolList[rip]
        mov     QWORD PTR L_PAREN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+8]
        mov     QWORD PTR R_PAREN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+16]
        mov     QWORD PTR L_BRACE_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+24]
        mov     QWORD PTR R_BRACE_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+32]
        mov     QWORD PTR COMMA_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+40]
        mov     QWORD PTR NOT_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+48]
        mov     QWORD PTR DOT_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+56]
        mov     QWORD PTR L_BRACKET_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+64]
        mov     QWORD PTR R_BRACKET_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+72]
        mov     QWORD PTR SEMICOLON_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+80]
        mov     QWORD PTR UNDERLINE_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+88]
        mov     QWORD PTR ADD_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+96]
        mov     QWORD PTR SUB_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+104]
        mov     QWORD PTR MUL_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+112]
        mov     QWORD PTR DIV_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+120]
        mov     QWORD PTR MOD_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+128]
        mov     QWORD PTR LT_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+136]
        mov     QWORD PTR GT_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+144]
        mov     QWORD PTR ASSIGN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+152]
        mov     QWORD PTR EQ_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+160]
        mov     QWORD PTR NE_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+168]
        mov     QWORD PTR LE_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+176]
        mov     QWORD PTR GE_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+184]
        mov     QWORD PTR ADD_ASSIGN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+192]
        mov     QWORD PTR SUB_ASSIGN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+200]
        mov     QWORD PTR MUL_ASSIGN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+208]
        mov     QWORD PTR DIV_ASSIGN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+216]
        mov     QWORD PTR MOD_ASSIGN_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+224]
        mov     QWORD PTR AND_SYMBOL[rip], rax
        mov     rax, QWORD PTR symbolList[rip+232]
        mov     QWORD PTR OR_SYMBOL[rip], rax
        jmp     .L25
.L36:
        nop
.L25:
        add     rsp, 56
        pop     rbx
        pop     rbp
        ret
.LC54:
        .ascii "C:\\Windows\\TEMP\\compiler-explorer-compiler4fFsnT\\example.c\0"
.LC55:
        .ascii "struct_memory->used % sizeof(size_t) == 0\0"
alloc_memory:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L38
        call    init
.L38:
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR 8[rax]
        mov     rax, QWORD PTR 16[rbp]
        add     rdx, rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jb      .L39
        mov     ecx, 1
        call    increase_memory_size
.L39:
        mov     rax, QWORD PTR 16[rbp]
        add     rax, 7
        and     rax, -8
        mov     QWORD PTR 16[rbp], rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR 8[rax]
        and     eax, 7
        test    rax, rax
        je      .L40
        mov     r8d, 332
        lea     rax, .LC54[rip]
        mov     rdx, rax
        lea     rax, .LC55[rip]
        mov     rcx, rax
        mov     rax, QWORD PTR __imp__assert[rip]
        call    rax
.L40:
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
        mov     rdx, QWORD PTR 16[rbp]
        add     rdx, rcx
        mov     QWORD PTR 8[rax], rdx
        mov     rax, QWORD PTR memoryBlockCount[rip]
        add     rax, 1
        mov     QWORD PTR memoryBlockCount[rip], rax
        mov     rax, QWORD PTR -8[rbp]
        add     rsp, 48
        pop     rbp
        ret
is_keyword:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR 16[rbp], rcx
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L43
        call    init
.L43:
        mov     QWORD PTR -8[rbp], 0
        jmp     .L44
.L47:
        mov     rax, QWORD PTR -8[rbp]
        lea     rdx, 0[0+rax*8]
        lea     rax, keywordList[rip]
        mov     rdx, QWORD PTR [rdx+rax]
        mov     rax, QWORD PTR 16[rbp]
        mov     rcx, rax
        call    string_equal
        test    al, al
        je      .L45
        mov     eax, 1
        jmp     .L46
.L45:
        add     QWORD PTR -8[rbp], 1
.L44:
        cmp     QWORD PTR -8[rbp], 21
        jbe     .L47
        mov     eax, 0
.L46:
        add     rsp, 48
        pop     rbp
        ret
string_equal:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR 16[rbp], rcx
        mov     QWORD PTR 24[rbp], rdx
        mov     rax, QWORD PTR 16[rbp]
        cmp     rax, QWORD PTR 24[rbp]
        sete    al
        pop     rbp
        ret
.LC56:
        .ascii "\0"
.LC57:
        .ascii "%zu/%zu bytes\0"
.LC58:
        .ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
get_info:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR -8[rbp], 0
        mov     rax, QWORD PTR all_string_list[rip]
        mov     QWORD PTR -16[rbp], rax
        jmp     .L51
.L52:
        add     QWORD PTR -8[rbp], 1
        mov     rax, QWORD PTR -16[rbp]
        mov     rax, QWORD PTR 16[rax]
        mov     QWORD PTR -16[rbp], rax
.L51:
        cmp     QWORD PTR -16[rbp], 0
        jne     .L52
        mov     r8d, 0
        mov     edx, 48
        lea     rax, .LC56[rip]
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
        lea     rdx, .LC57[rip]
        mov     rcx, rax
        call    sprintf
        mov     r8d, 0
        mov     edx, 48
        lea     rax, .LC56[rip]
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
        lea     rdx, .LC57[rip]
        mov     rcx, rax
        call    sprintf
        mov     r8d, 0
        mov     edx, 240
        lea     rax, .LC56[rip]
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
        lea     rdx, .LC58[rip]
        mov     rcx, rax
        call    sprintf
        mov     rax, QWORD PTR -40[rbp]
        add     rsp, 112
        pop     rbp
        ret

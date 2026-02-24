.LC0:
        .string "import"
.LC1:
        .string "from"
.LC2:
        .string "func"
.LC3:
        .string "class"
.LC4:
        .string "method"
.LC5:
        .string "self"
.LC6:
        .string "if"
.LC7:
        .string "elif"
.LC8:
        .string "else"
.LC9:
        .string "while"
.LC10:
        .string "for"
.LC11:
        .string "true"
.LC12:
        .string "false"
.LC13:
        .string "return"
.LC14:
        .string "break"
.LC15:
        .string "continue"
.LC16:
        .string "int"
.LC17:
        .string "float"
.LC18:
        .string "string"
.LC19:
        .string "bool"
.LC20:
        .string "void"
.LC21:
        .string "var"
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
        .zero   176
.LC22:
        .string "("
.LC23:
        .string ")"
.LC24:
        .string "{"
.LC25:
        .string "}"
.LC26:
        .string ","
.LC27:
        .string "!"
.LC28:
        .string "."
.LC29:
        .string "["
.LC30:
        .string "]"
.LC31:
        .string ";"
.LC32:
        .string "_"
.LC33:
        .string "+"
.LC34:
        .string "-"
.LC35:
        .string "*"
.LC36:
        .string "/"
.LC37:
        .string "%"
.LC38:
        .string "<"
.LC39:
        .string ">"
.LC40:
        .string "="
.LC41:
        .string "=="
.LC42:
        .string "!="
.LC43:
        .string "<="
.LC44:
        .string ">="
.LC45:
        .string "+="
.LC46:
        .string "-="
.LC47:
        .string "*="
.LC48:
        .string "/="
.LC49:
        .string "%="
.LC50:
        .string "&&"
.LC51:
        .string "||"
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
        .zero   240
struct_memory:
        .zero   8
string_memory:
        .zero   8
initialized:
        .zero   1
all_string_list:
        .zero   8
IMPORT_KEYWORD:
        .zero   8
FROM_KEYWORD:
        .zero   8
FUNC_KEYWORD:
        .zero   8
CLASS_KEYWORD:
        .zero   8
METHOD_KEYWORD:
        .zero   8
SELF_KEYWORD:
        .zero   8
IF_KEYWORD:
        .zero   8
ELIF_KEYWORD:
        .zero   8
ELSE_KEYWORD:
        .zero   8
WHILE_KEYWORD:
        .zero   8
FOR_KEYWORD:
        .zero   8
TRUE_KEYWORD:
        .zero   8
FALSE_KEYWORD:
        .zero   8
RETURN_KEYWORD:
        .zero   8
BREAK_KEYWORD:
        .zero   8
CONTINUE_KEYWORD:
        .zero   8
INT_KEYWORD:
        .zero   8
FLOAT_KEYWORD:
        .zero   8
STRING_KEYWORD:
        .zero   8
BOOL_KEYWORD:
        .zero   8
VOID_KEYWORD:
        .zero   8
VAR_KEYWORD:
        .zero   8
L_PAREN_SYMBOL:
        .zero   8
R_PAREN_SYMBOL:
        .zero   8
L_BRACE_SYMBOL:
        .zero   8
R_BRACE_SYMBOL:
        .zero   8
COMMA_SYMBOL:
        .zero   8
NOT_SYMBOL:
        .zero   8
DOT_SYMBOL:
        .zero   8
L_BRACKET_SYMBOL:
        .zero   8
R_BRACKET_SYMBOL:
        .zero   8
SEMICOLON_SYMBOL:
        .zero   8
UNDERLINE_SYMBOL:
        .zero   8
ADD_SYMBOL:
        .zero   8
SUB_SYMBOL:
        .zero   8
MUL_SYMBOL:
        .zero   8
DIV_SYMBOL:
        .zero   8
MOD_SYMBOL:
        .zero   8
LT_SYMBOL:
        .zero   8
GT_SYMBOL:
        .zero   8
ASSIGN_SYMBOL:
        .zero   8
EQ_SYMBOL:
        .zero   8
NE_SYMBOL:
        .zero   8
LE_SYMBOL:
        .zero   8
GE_SYMBOL:
        .zero   8
ADD_ASSIGN_SYMBOL:
        .zero   8
SUB_ASSIGN_SYMBOL:
        .zero   8
MUL_ASSIGN_SYMBOL:
        .zero   8
DIV_ASSIGN_SYMBOL:
        .zero   8
MOD_ASSIGN_SYMBOL:
        .zero   8
AND_SYMBOL:
        .zero   8
OR_SYMBOL:
        .zero   8
name_void:
        .zero   8
name_int:
        .zero   8
name_float:
        .zero   8
name_string:
        .zero   8
name_bool:
        .zero   8
builtin_scope:
        .zero   8
.LC52:
        .string "Fatal: Cannot allocate memory\n"
increase_memory_size:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     eax, edi
        mov     BYTE PTR [rbp-36], al
        mov     edi, 32
        call    malloc
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L2
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 30
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC52
        call    fwrite
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L3
.L4:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+24]
        mov     rdi, rax
        call    free
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    free
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
.L3:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L4
        mov     BYTE PTR initialized[rip], 0
        mov     edi, 1
        call    exit
.L2:
        mov     edi, 1024
        call    malloc
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+24], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax], 1024
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+16], 0
        cmp     BYTE PTR [rbp-36], 0
        je      .L5
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR struct_memory_used[rip]
        add     rax, rdx
        mov     QWORD PTR struct_memory_used[rip], rax
        mov     rdx, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR struct_memory[rip], rax
        mov     rax, QWORD PTR struct_memory_count[rip]
        add     rax, 1024
        mov     QWORD PTR struct_memory_count[rip], rax
        jmp     .L7
.L5:
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR string_memory_used[rip]
        add     rax, rdx
        mov     QWORD PTR string_memory_used[rip], rax
        mov     rdx, QWORD PTR string_memory[rip]
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR string_memory[rip], rax
        mov     rax, QWORD PTR string_memory_count[rip]
        add     rax, 1024
        mov     QWORD PTR string_memory_count[rip], rax
.L7:
        nop
        leave
        ret
.LC53:
        .string "Info: Allocate big memory block of size %zu bytes\n"
alloc_big_memory:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     rdx, QWORD PTR string_memory_count[rip]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     QWORD PTR string_memory_count[rip], rax
        mov     rdx, QWORD PTR string_memory_used[rip]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     QWORD PTR string_memory_used[rip], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC53
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        cmp     QWORD PTR [rbp-8], 0
        jne     .L9
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 30
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC52
        call    fwrite
        mov     edi, 1
        call    exit
.L9:
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
create_string_check:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     eax, edx
        mov     BYTE PTR [rbp-52], al
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L12
        call    init
.L12:
        cmp     QWORD PTR [rbp-40], 0
        je      .L13
        cmp     QWORD PTR [rbp-48], 0
        jne     .L14
.L13:
        mov     eax, 0
        jmp     .L15
.L14:
        cmp     BYTE PTR [rbp-52], 0
        je      .L16
        mov     rax, QWORD PTR all_string_list[rip]
        mov     QWORD PTR [rbp-8], rax
        mov     QWORD PTR [rbp-16], 0
        jmp     .L17
.L19:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        cmp     QWORD PTR [rbp-48], rax
        jne     .L18
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        test    rax, rax
        je      .L18
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    strncmp
        test    eax, eax
        jne     .L18
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
.L18:
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-8], rax
.L17:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L19
        cmp     QWORD PTR [rbp-16], 0
        je      .L16
        mov     rax, QWORD PTR [rbp-16]
        jmp     .L15
.L16:
        cmp     QWORD PTR [rbp-48], 1022
        jbe     .L20
        mov     rax, QWORD PTR [rbp-48]
        add     rax, 1
        mov     rdi, rax
        call    alloc_big_memory
        mov     QWORD PTR [rbp-24], rax
        jmp     .L21
.L20:
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-48]
        add     rdx, rax
        mov     rax, QWORD PTR string_memory[rip]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jb      .L22
        mov     edi, 0
        call    increase_memory_size
.L22:
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR string_memory[rip]
        mov     rax, QWORD PTR [rax+8]
        add     rax, rdx
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR string_memory[rip]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-48]
        add     rdx, rax
        mov     rax, QWORD PTR string_memory[rip]
        add     rdx, 1
        mov     QWORD PTR [rax+8], rdx
.L21:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    strncpy
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-48]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        mov     edi, 24
        call    alloc_memory
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax+8], rdx
        mov     rdx, QWORD PTR all_string_list[rip]
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR all_string_list[rip], rax
        mov     rax, QWORD PTR [rbp-24]
.L15:
        leave
        ret
create_string:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, 1
        mov     rsi, rcx
        mov     rdi, rax
        call    create_string_check
        leave
        ret
init:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 24
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L36
        mov     rax, QWORD PTR struct_memory[rip]
        test    rax, rax
        jne     .L28
        mov     edi, 32
        call    malloc
        mov     QWORD PTR struct_memory[rip], rax
        mov     rax, QWORD PTR struct_memory[rip]
        test    rax, rax
        jne     .L29
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 30
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC52
        call    fwrite
        mov     BYTE PTR initialized[rip], 0
        mov     edi, 1
        call    exit
.L29:
        mov     rbx, QWORD PTR struct_memory[rip]
        mov     edi, 1024
        call    malloc
        mov     QWORD PTR [rbx+24], rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     QWORD PTR [rax], 1024
        mov     rax, QWORD PTR struct_memory[rip]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR struct_memory[rip]
        mov     QWORD PTR [rax+16], 0
        mov     QWORD PTR struct_memory_count[rip], 1024
.L28:
        mov     rax, QWORD PTR string_memory[rip]
        test    rax, rax
        jne     .L30
        mov     edi, 32
        call    malloc
        mov     QWORD PTR string_memory[rip], rax
        mov     rax, QWORD PTR string_memory[rip]
        test    rax, rax
        jne     .L31
        mov     rax, QWORD PTR stderr[rip]
        mov     rcx, rax
        mov     edx, 30
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC52
        call    fwrite
        mov     BYTE PTR initialized[rip], 0
        mov     edi, 1
        call    exit
.L31:
        mov     rbx, QWORD PTR string_memory[rip]
        mov     edi, 1024
        call    malloc
        mov     QWORD PTR [rbx+24], rax
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR [rax], 1024
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR string_memory[rip]
        mov     QWORD PTR [rax+16], 0
        mov     QWORD PTR string_memory_count[rip], 1024
.L30:
        mov     BYTE PTR initialized[rip], 1
        mov     QWORD PTR [rbp-24], 0
        jmp     .L32
.L33:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR keywordStrings[0+rax*8]
        mov     rdi, rax
        call    strlen
        mov     rcx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR keywordStrings[0+rax*8]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    create_string_check
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR keywordList[0+rdx*8], rax
        add     QWORD PTR [rbp-24], 1
.L32:
        cmp     QWORD PTR [rbp-24], 21
        jbe     .L33
        mov     QWORD PTR [rbp-32], 0
        jmp     .L34
.L35:
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR symbolStrings[0+rax*8]
        mov     rdi, rax
        call    strlen
        mov     rcx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR symbolStrings[0+rax*8]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    create_string_check
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR symbolList[0+rdx*8], rax
        add     QWORD PTR [rbp-32], 1
.L34:
        cmp     QWORD PTR [rbp-32], 29
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
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC54:
        .string "/app/example.c"
.LC55:
        .string "struct_memory->used % ALIGN_SIZE == 0"
alloc_memory:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L38
        call    init
.L38:
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-24]
        add     rdx, rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jb      .L39
        mov     edi, 1
        call    increase_memory_size
.L39:
        mov     rax, QWORD PTR [rbp-24]
        add     rax, 7
        and     rax, -8
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR [rax+8]
        and     eax, 7
        test    rax, rax
        je      .L40
        mov     ecx, OFFSET FLAT:__PRETTY_FUNCTION__.0
        mov     edx, 392
        mov     esi, OFFSET FLAT:.LC54
        mov     edi, OFFSET FLAT:.LC55
        call    __assert_fail
.L40:
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR [rax+24]
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rax, QWORD PTR [rax+8]
        and     rax, -8
        add     rax, rdx
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rdx, QWORD PTR [rbp-24]
        add     rdx, rcx
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR memoryBlockCount[rip]
        add     rax, 1
        mov     QWORD PTR memoryBlockCount[rip], rax
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
is_keyword:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        movzx   eax, BYTE PTR initialized[rip]
        test    al, al
        jne     .L43
        call    init
.L43:
        mov     QWORD PTR [rbp-8], 0
        jmp     .L44
.L47:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR keywordList[0+rax*8]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    string_equal
        test    al, al
        je      .L45
        mov     eax, 1
        jmp     .L46
.L45:
        add     QWORD PTR [rbp-8], 1
.L44:
        cmp     QWORD PTR [rbp-8], 21
        jbe     .L47
        mov     eax, 0
.L46:
        leave
        ret
string_equal:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        cmp     rax, QWORD PTR [rbp-16]
        sete    al
        pop     rbp
        ret
.LC56:
        .string ""
.LC57:
        .string "%zu/%zu bytes"
.LC58:
        .string "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu"
get_info:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-8], 0
        mov     rax, QWORD PTR all_string_list[rip]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L51
.L52:
        add     QWORD PTR [rbp-8], 1
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+16]
        mov     QWORD PTR [rbp-16], rax
.L51:
        cmp     QWORD PTR [rbp-16], 0
        jne     .L52
        mov     edx, 0
        mov     esi, 48
        mov     edi, OFFSET FLAT:.LC56
        call    create_string_check
        mov     QWORD PTR [rbp-24], rax
        mov     rdx, QWORD PTR struct_memory_count[rip]
        mov     rax, QWORD PTR struct_memory[rip]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR struct_memory_used[rip]
        lea     rsi, [rcx+rax]
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rdx
        mov     rdx, rsi
        mov     esi, OFFSET FLAT:.LC57
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     edx, 0
        mov     esi, 48
        mov     edi, OFFSET FLAT:.LC56
        call    create_string_check
        mov     QWORD PTR [rbp-32], rax
        mov     rdx, QWORD PTR string_memory_count[rip]
        mov     rax, QWORD PTR string_memory[rip]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR string_memory_used[rip]
        lea     rsi, [rcx+rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     rcx, rdx
        mov     rdx, rsi
        mov     esi, OFFSET FLAT:.LC57
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        mov     edx, 0
        mov     esi, 240
        mov     edi, OFFSET FLAT:.LC56
        call    create_string_check
        mov     QWORD PTR [rbp-40], rax
        mov     rcx, QWORD PTR memoryBlockCount[rip]
        mov     rdi, QWORD PTR [rbp-8]
        mov     rsi, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-40]
        sub     rsp, 8
        push    rcx
        mov     r9, rdi
        mov     r8, rsi
        mov     rcx, rdx
        mov     edx, 3
        mov     esi, OFFSET FLAT:.LC58
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        add     rsp, 16
        mov     rax, QWORD PTR [rbp-40]
        leave
        ret
__PRETTY_FUNCTION__.0:
        .string "alloc_memory"

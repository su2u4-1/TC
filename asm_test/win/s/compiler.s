.LC0:
        .string "%.*s%s"
.LC1:
        .string "%s%s"
string_append:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-16], rax
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        cmp     rax, QWORD PTR [rbp-48]
        jb      .L2
        mov     rax, QWORD PTR [rbp-48]
        sub     rax, QWORD PTR [rbp-16]
        sub     rax, 1
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     edi, eax
        mov     rcx, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     r9, rcx
        mov     r8, rdx
        mov     ecx, edi
        mov     edx, OFFSET FLAT:.LC0
        mov     rdi, rax
        mov     eax, 0
        call    snprintf
        jmp     .L4
.L2:
        mov     rcx, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
.L4:
        nop
        leave
        ret
.LC2:
        .string ""
read_source:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     rax, QWORD PTR [rbp-24]
        mov     edx, 2
        mov     esi, 0
        mov     rdi, rax
        call    fseek
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    ftell
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    fseek
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC2
        call    create_string
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 1
        mov     rdi, rax
        call    fread
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        mov     QWORD PTR [rbp-8], 0
        jmp     .L6
.L9:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 13
        je      .L7
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 9
        jne     .L8
.L7:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        mov     BYTE PTR [rax], 32
.L8:
        add     QWORD PTR [rbp-8], 1
.L6:
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-8], rax
        jb      .L9
        mov     rax, QWORD PTR [rbp-16]
        leave
        ret
.LC3:
        .string "Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC4:
        .string "Token(Type: identifier,  Line: "
.LC5:
        .string "Token(Type: integer,     Line: "
.LC6:
        .string "Token(Type: float,       Line: "
.LC7:
        .string "Token(Type: string,      Line: "
.LC8:
        .string "Token(Type: symbol,      Line: "
.LC9:
        .string "Token(Type: keyword,     Line: "
.LC10:
        .string "Token(Type: comment,     Line: "
.LC11:
        .string "%zu, Column: %zu)\tLexeme: '"
.LC12:
        .string "\\0"
.LC13:
        .string "\\n"
.LC14:
        .string "\\t"
.LC15:
        .string "\\r"
.LC16:
        .string "'\n"
.LC17:
        .string "\ninfo by lib:\n    %s\n"
output_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        mov     QWORD PTR [rbp-64], rsi
        mov     rax, QWORD PTR [rbp-64]
        mov     esi, 0
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L12
.L29:
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        jne     .L13
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L14
.L13:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        jne     .L15
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC4
        call    fwrite
        jmp     .L16
.L15:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 2
        jne     .L17
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC5
        call    fwrite
        jmp     .L16
.L17:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 3
        jne     .L18
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC6
        call    fwrite
        jmp     .L16
.L18:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        jne     .L19
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        jmp     .L16
.L19:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L20
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC8
        call    fwrite
        jmp     .L16
.L20:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L21
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC9
        call    fwrite
        jmp     .L16
.L21:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 7
        jne     .L16
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
.L16:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC11
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-32], rax
        mov     QWORD PTR [rbp-16], 0
        jmp     .L22
.L28:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-33], al
        cmp     BYTE PTR [rbp-33], 0
        jne     .L23
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC12
        call    fwrite
        jmp     .L24
.L23:
        cmp     BYTE PTR [rbp-33], 10
        jne     .L25
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC13
        call    fwrite
        jmp     .L24
.L25:
        cmp     BYTE PTR [rbp-33], 9
        jne     .L26
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC14
        call    fwrite
        jmp     .L24
.L26:
        cmp     BYTE PTR [rbp-33], 13
        jne     .L27
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        jmp     .L24
.L27:
        movsx   eax, BYTE PTR [rbp-33]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     edi, eax
        call    fputc
.L24:
        add     QWORD PTR [rbp-16], 1
.L22:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    strlen
        cmp     QWORD PTR [rbp-16], rax
        jb      .L28
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        mov     rax, QWORD PTR [rbp-64]
        mov     esi, 0
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L12:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L29
.L14:
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC17
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
output_ast:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     rcx, QWORD PTR builtin_scope[rip]
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_code
        mov     QWORD PTR [rbp-8], rax
        mov     rdx, QWORD PTR [rbp-40]
        mov     rsi, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    output_code
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC17
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
.LC18:
        .string "r"
.LC19:
        .string "Error opening file: %s"
.LC20:
        .string ".token"
.LC21:
        .string "w"
.LC22:
        .string "Error opening file: %s\n"
.LC23:
        .string ".ast"
parse_file:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     QWORD PTR [rbp-104], rdi
        mov     ecx, esi
        mov     eax, edx
        mov     edx, ecx
        mov     BYTE PTR [rbp-108], dl
        mov     BYTE PTR [rbp-112], al
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    create_file
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    get_full_path
        mov     QWORD PTR [rbp-16], rax
        mov     QWORD PTR [rbp-88], 0
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L32
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC19
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L31
.L32:
        lea     rdx, [rbp-88]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    read_source
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    fclose
        mov     rdx, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    create_lexer
        mov     QWORD PTR [rbp-40], rax
        cmp     BYTE PTR [rbp-108], 0
        je      .L34
        mov     esi, 6
        mov     edi, OFFSET FLAT:.LC20
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    change_file_extension
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    get_full_path
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC21
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-56], 0
        jne     .L35
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC22
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L36
.L35:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_token
.L36:
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    fclose
.L34:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    reset_lexer
        call    create_parser
        mov     QWORD PTR [rbp-64], rax
        cmp     BYTE PTR [rbp-112], 0
        je      .L31
        mov     esi, 4
        mov     edi, OFFSET FLAT:.LC23
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    change_file_extension
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    get_full_path
        mov     QWORD PTR [rbp-72], rax
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, OFFSET FLAT:.LC21
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L38
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-72]
        mov     esi, OFFSET FLAT:.LC22
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L39
.L38:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_ast
.L39:
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    fclose
.L31:
        leave
        ret

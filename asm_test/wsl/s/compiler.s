.LC0:
        .string "%.*s%s"
.LC1:
        .string "%s"
.LC2:
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
        jmp     .L5
.L2:
        mov     rax, QWORD PTR [rbp-56]
        cmp     rax, QWORD PTR [rbp-40]
        jne     .L4
        mov     rax, QWORD PTR [rbp-48]
        sub     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-8]
        lea     rdi, [rcx+rdx]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rcx, rdx
        mov     edx, OFFSET FLAT:.LC1
        mov     rsi, rax
        mov     eax, 0
        call    snprintf
        jmp     .L5
.L4:
        mov     rcx, QWORD PTR [rbp-64]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     r8, rcx
        mov     rcx, rdx
        mov     edx, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    snprintf
.L5:
        nop
        leave
        ret
.LC3:
        .string ""
read_source:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     rax, QWORD PTR [rbp-40]
        mov     edx, 2
        mov     esi, 0
        mov     rdi, rax
        call    fseek
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    ftell
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     edx, 0
        mov     esi, 0
        mov     rdi, rax
        call    fseek
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        add     rax, 1
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC3
        call    create_string
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rax]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, 1
        mov     rdi, rax
        call    fread
        mov     QWORD PTR [rbp-24], rax
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     BYTE PTR [rax], 0
        mov     rax, QWORD PTR [rbp-48]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax], rdx
        mov     QWORD PTR [rbp-8], 0
        jmp     .L7
.L10:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 13
        je      .L8
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 9
        jne     .L9
.L8:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        mov     BYTE PTR [rax], 32
.L9:
        add     QWORD PTR [rbp-8], 1
.L7:
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-8], rax
        jb      .L10
        mov     rax, QWORD PTR [rbp-16]
        leave
        ret
.LC4:
        .string "Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC5:
        .string "Token(Type: identifier,  Line: "
.LC6:
        .string "Token(Type: integer,     Line: "
.LC7:
        .string "Token(Type: float,       Line: "
.LC8:
        .string "Token(Type: string,      Line: "
.LC9:
        .string "Token(Type: symbol,      Line: "
.LC10:
        .string "Token(Type: keyword,     Line: "
.LC11:
        .string "Token(Type: comment,     Line: "
.LC12:
        .string "%zu, Column: %zu)\tLexeme: '"
.LC13:
        .string "\\0"
.LC14:
        .string "\\n"
.LC15:
        .string "\\t"
.LC16:
        .string "\\r"
.LC17:
        .string "'\n"
.LC18:
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
        jmp     .L13
.L30:
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        jne     .L14
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L15
.L14:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        jne     .L16
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC5
        call    fwrite
        jmp     .L17
.L16:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 2
        jne     .L18
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC6
        call    fwrite
        jmp     .L17
.L18:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 3
        jne     .L19
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC7
        call    fwrite
        jmp     .L17
.L19:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        jne     .L20
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC8
        call    fwrite
        jmp     .L17
.L20:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L21
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC9
        call    fwrite
        jmp     .L17
.L21:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L22
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L17
.L22:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 7
        jne     .L17
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 31
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC11
        call    fwrite
.L17:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC12
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-32], rax
        mov     QWORD PTR [rbp-16], 0
        jmp     .L23
.L29:
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-33], al
        cmp     BYTE PTR [rbp-33], 0
        jne     .L24
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC13
        call    fwrite
        jmp     .L25
.L24:
        cmp     BYTE PTR [rbp-33], 10
        jne     .L26
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC14
        call    fwrite
        jmp     .L25
.L26:
        cmp     BYTE PTR [rbp-33], 9
        jne     .L27
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC15
        call    fwrite
        jmp     .L25
.L27:
        cmp     BYTE PTR [rbp-33], 13
        jne     .L28
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC16
        call    fwrite
        jmp     .L25
.L28:
        movsx   eax, BYTE PTR [rbp-33]
        mov     rdx, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     edi, eax
        call    fputc
.L25:
        add     QWORD PTR [rbp-16], 1
.L23:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    strlen
        cmp     QWORD PTR [rbp-16], rax
        jb      .L29
        mov     rax, QWORD PTR [rbp-56]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC17
        call    fwrite
        mov     rax, QWORD PTR [rbp-64]
        mov     esi, 0
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L13:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L30
.L15:
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC18
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
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
.LC19:
        .string "r"
.LC20:
        .string "Error opening file: %s"
.LC21:
        .string ".token"
.LC22:
        .string "w"
.LC23:
        .string "Error opening file: %s\n"
.LC24:
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
        mov     esi, OFFSET FLAT:.LC19
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-24], rax
        cmp     QWORD PTR [rbp-24], 0
        jne     .L33
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-16]
        mov     esi, OFFSET FLAT:.LC20
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L32
.L33:
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
        je      .L35
        mov     esi, 6
        mov     edi, OFFSET FLAT:.LC21
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
        mov     esi, OFFSET FLAT:.LC22
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-56], rax
        cmp     QWORD PTR [rbp-56], 0
        jne     .L36
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-48]
        mov     esi, OFFSET FLAT:.LC23
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L35
.L36:
        mov     rdx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_token
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    fclose
.L35:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    reset_lexer
        call    create_parser
        mov     QWORD PTR [rbp-64], rax
        cmp     BYTE PTR [rbp-112], 0
        je      .L32
        mov     esi, 4
        mov     edi, OFFSET FLAT:.LC24
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
        mov     esi, OFFSET FLAT:.LC22
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-80], rax
        cmp     QWORD PTR [rbp-80], 0
        jne     .L38
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-72]
        mov     esi, OFFSET FLAT:.LC23
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L32
.L38:
        mov     rdx, QWORD PTR [rbp-64]
        mov     rcx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-80]
        mov     rsi, rcx
        mov     rdi, rax
        call    output_ast
        mov     rax, QWORD PTR [rbp-80]
        mov     rdi, rax
        call    fclose
.L32:
        leave
        ret

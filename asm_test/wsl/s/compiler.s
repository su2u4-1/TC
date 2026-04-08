.LC0:
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
        mov     edi, OFFSET FLAT:.LC0
        call    create_string_not_check
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
        jmp     .L2
.L5:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 13
        je      .L3
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        cmp     al, 9
        jne     .L4
.L3:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        mov     BYTE PTR [rax], 32
.L4:
        add     QWORD PTR [rbp-8], 1
.L2:
        mov     rax, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-8], rax
        jb      .L5
        mov     rax, QWORD PTR [rbp-16]
        leave
        ret
.LC1:
        .string "Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC2:
        .string "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '"
.LC3:
        .string "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '"
.LC4:
        .string "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '"
.LC5:
        .string "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '"
.LC6:
        .string "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '"
.LC7:
        .string "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '"
.LC8:
        .string "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '"
.LC9:
        .string "\\0"
.LC10:
        .string "\\n"
.LC11:
        .string "\\t"
.LC12:
        .string "\\r"
.LC13:
        .string "'\n"
output_one_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        jne     .L8
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L7
.L8:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 1
        jne     .L10
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L11
.L10:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 2
        jne     .L12
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L11
.L12:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 3
        jne     .L13
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L11
.L13:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 4
        jne     .L14
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC5
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L11
.L14:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 5
        jne     .L15
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC6
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L11
.L15:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 6
        jne     .L16
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC7
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L11
.L16:
        mov     rax, QWORD PTR [rbp-32]
        mov     eax, DWORD PTR [rax+24]
        cmp     eax, 7
        jne     .L11
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+16]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+1]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC8
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L11:
        mov     QWORD PTR [rbp-8], 0
        jmp     .L17
.L23:
        mov     rax, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rbp-9], al
        cmp     BYTE PTR [rbp-9], 0
        jne     .L18
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC9
        call    fwrite
        jmp     .L19
.L18:
        cmp     BYTE PTR [rbp-9], 10
        jne     .L20
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC10
        call    fwrite
        jmp     .L19
.L20:
        cmp     BYTE PTR [rbp-9], 9
        jne     .L21
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC11
        call    fwrite
        jmp     .L19
.L21:
        cmp     BYTE PTR [rbp-9], 13
        jne     .L22
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC12
        call    fwrite
        jmp     .L19
.L22:
        movsx   eax, BYTE PTR [rbp-9]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     edi, eax
        call    fputc
.L19:
        add     QWORD PTR [rbp-8], 1
.L17:
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    strlen
        cmp     QWORD PTR [rbp-8], rax
        jb      .L23
        mov     rax, QWORD PTR [rbp-24]
        mov     rcx, rax
        mov     edx, 2
        mov     esi, 1
        mov     edi, OFFSET FLAT:.LC13
        call    fwrite
.L7:
        leave
        ret
.LC14:
        .string "\ninfo by lib:\n    %s\n"
output_token:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 0
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
        jmp     .L25
.L28:
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_one_token
        mov     rax, QWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rax+24]
        test    eax, eax
        je      .L29
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, 0
        mov     rdi, rax
        call    get_next_token
        mov     QWORD PTR [rbp-8], rax
.L25:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L28
        jmp     .L27
.L29:
        nop
.L27:
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC14
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
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        lea     rdx, [rbp-32]
        mov     rsi, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rdx
        mov     edx, 0
        mov     rdi, rax
        call    output_code
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC14
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
output_tac:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rcx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    output_TAC
        call    get_info
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     esi, OFFSET FLAT:.LC14
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret
.LC15:
        .string "r"
.LC16:
        .string "Error opening file: %s\n"
.LC17:
        .string ".token"
.LC18:
        .string "w"
.LC19:
        .string ".ast"
.LC20:
        .string ".tc"
.LC21:
        .string ".tac"
parse_file:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 160
        mov     QWORD PTR [rbp-136], rdi
        mov     eax, ecx
        mov     ecx, esi
        mov     BYTE PTR [rbp-140], cl
        mov     BYTE PTR [rbp-144], dl
        mov     BYTE PTR [rbp-148], al
        mov     rax, QWORD PTR [rbp-136]
        mov     rdi, rax
        call    create_file
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    get_full_path
        mov     QWORD PTR [rbp-24], rax
        mov     QWORD PTR [rbp-120], 0
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC15
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-32], rax
        cmp     QWORD PTR [rbp-32], 0
        jne     .L33
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L32
.L33:
        lea     rdx, [rbp-120]
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    read_source
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    fclose
        mov     rcx, QWORD PTR [rbp-120]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    create_lexer
        mov     QWORD PTR [rbp-48], rax
        cmp     BYTE PTR [rbp-140], 0
        je      .L35
        mov     esi, 6
        mov     edi, OFFSET FLAT:.LC17
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    change_file_extension
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    get_full_path
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-64], rax
        cmp     QWORD PTR [rbp-64], 0
        jne     .L36
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-56]
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L35
.L36:
        mov     rdx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_token
        mov     rax, QWORD PTR [rbp-64]
        mov     rdi, rax
        call    fclose
.L35:
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    reset_lexer
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    create_parser
        mov     QWORD PTR [rbp-72], rax
        mov     QWORD PTR [rbp-8], 0
        cmp     BYTE PTR [rbp-144], 0
        jne     .L37
        cmp     BYTE PTR [rbp-148], 0
        je      .L38
.L37:
        mov     rcx, QWORD PTR builtin_scope[rip]
        mov     rdx, QWORD PTR [rbp-72]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rcx
        mov     rdi, rax
        call    parse_code
        mov     QWORD PTR [rbp-8], rax
.L38:
        cmp     BYTE PTR [rbp-144], 0
        je      .L39
        mov     esi, 4
        mov     edi, OFFSET FLAT:.LC19
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    change_file_extension
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    get_full_path
        mov     QWORD PTR [rbp-80], rax
        mov     esi, 3
        mov     edi, OFFSET FLAT:.LC20
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    change_file_extension
        mov     rax, QWORD PTR [rbp-80]
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-88], rax
        cmp     QWORD PTR [rbp-88], 0
        jne     .L40
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-80]
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L39
.L40:
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_ast
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    fclose
.L39:
        cmp     BYTE PTR [rbp-148], 0
        je      .L32
        mov     esi, 4
        mov     edi, OFFSET FLAT:.LC21
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    change_file_extension
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    get_full_path
        mov     QWORD PTR [rbp-96], rax
        mov     esi, 3
        mov     edi, OFFSET FLAT:.LC20
        call    create_string
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    change_file_extension
        mov     rax, QWORD PTR [rbp-96]
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-104], rax
        cmp     QWORD PTR [rbp-104], 0
        jne     .L42
        mov     rax, QWORD PTR stderr[rip]
        mov     rdx, QWORD PTR [rbp-96]
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L32
.L42:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    tac_code
        mov     QWORD PTR [rbp-112], rax
        mov     rdx, QWORD PTR [rbp-112]
        mov     rax, QWORD PTR [rbp-104]
        mov     rsi, rdx
        mov     rdi, rax
        call    output_tac
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    fclose
.L32:
        leave
        ret

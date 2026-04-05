	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp103, file
; src/compiler.c:8:     fseek(file, 0, SEEK_END);
	movl	$2, %edx	;,
; src/compiler.c:7: string read_source(FILE* file, size_t* length) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp104, length
; src/compiler.c:8:     fseek(file, 0, SEEK_END);
	xorl	%esi, %esi	;
; src/compiler.c:7: string read_source(FILE* file, size_t* length) {
	pushq	%rbx	;
; src/compiler.c:8:     fseek(file, 0, SEEK_END);
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	%r12, %rdi	; file,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:10:     fseek(file, 0, SEEK_SET);
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movq	%r12, %rdi	; file,
; src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	%rax, 0(%rbp)	; tmp105, *length_19(D)
; src/compiler.c:10:     fseek(file, 0, SEEK_SET);
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	0(%rbp), %rax	; *length_19(D), tmp110
	leaq	.LC0(%rip), %rdi	;, tmp98
	leaq	1(%rax), %rsi	;, tmp96
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	0(%rbp), %rdx	; *length_19(D),
	movq	%r12, %rcx	; file,
	movl	$1, %esi	;,
; src/compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	%rax, %rbx	; tmp106, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	%rax, %rdi	; <retval>,
	call	*fread@GOTPCREL(%rip)	;
; src/compiler.c:14:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	;, *_6
; src/compiler.c:15:     *length = bytes_read;
	movq	%rax, 0(%rbp)	; _34, *length_19(D)
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	; i
.L2:
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	cmpq	0(%rbp), %rax	; *length_19(D), i
	jnb	.L7	;,
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	movb	(%rbx,%rax), %dl	; MEM[(char *)source_23 + i_12 * 1], tmp99
	andl	$-5, %edx	;, tmp99
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	;, tmp99
	jne	.L3	;,
; src/compiler.c:19:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	;, MEM[(char *)source_23 + i_12 * 1]
.L3:
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	incq	%rax	; i
	jmp	.L2	;
.L7:
; src/compiler.c:22: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	read_source, .-read_source
	.section	.rodata.str1.1
.LC1:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC2:
	.string	"Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '"
.LC3:
	.string	"Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '"
.LC4:
	.string	"Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '"
.LC5:
	.string	"Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '"
.LC6:
	.string	"Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '"
.LC7:
	.string	"Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '"
.LC8:
	.string	"Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '"
.LC9:
	.string	"\\0"
.LC10:
	.string	"\\n"
.LC11:
	.string	"\\t"
.LC12:
	.string	"\\r"
.LC13:
	.string	"'\n"
	.text
	.globl	output_one_token
	.type	output_one_token, @function
output_one_token:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp182, token
	pushq	%rbx	;
	cmpl	$7, 24(%rsi)	;, token_45(D)->type
; src/compiler.c:23: void output_one_token(FILE* file, Token* token) {
	movq	%rdi, %rbx	; tmp181, file
	ja	.L9	;,
	movl	24(%rsi), %edx	; token_45(D)->type, token_45(D)->type
	leaq	.L11(%rip), %rax	;, tmp124
	movq	8(%rsi), %rcx	; token_45(D)->line, token_45(D)->line
	movslq	(%rax,%rdx,4), %rdx	;, tmp126
; src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	incq	%rcx	; tmp166
	addq	%rax, %rdx	; tmp124, tmp127
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	jmp	*%rdx	; tmp127
	.section	.rodata
	.align 4
	.align 4
.L11:
	.long	.L18-.L11
	.long	.L17-.L11
	.long	.L16-.L11
	.long	.L15-.L11
	.long	.L14-.L11
	.long	.L13-.L11
	.long	.L12-.L11
	.long	.L10-.L11
	.text
.L18:
; src/compiler.c:55: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %rdx	;, tmp133
; src/compiler.c:55: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/compiler.c:55: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/compiler.c:55: }
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L17:
	leaq	.LC2(%rip), %rdx	;, tmp138
	jmp	.L27	;
.L16:
	leaq	.LC3(%rip), %rdx	;, tmp143
.L27:
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; file,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L9:
; src/compiler.c:23: void output_one_token(FILE* file, Token* token) {
	xorl	%r12d, %r12d	; i
; src/compiler.c:50:             fputs("\\r", file);
	leaq	.LC12(%rip), %r13	;, tmp180
	jmp	.L19	;
.L15:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC4(%rip), %rdx	;, tmp148
	jmp	.L27	;
.L14:
	leaq	.LC5(%rip), %rdx	;, tmp153
	jmp	.L27	;
.L13:
	leaq	.LC6(%rip), %rdx	;, tmp158
	jmp	.L27	;
.L12:
	leaq	.LC7(%rip), %rdx	;, tmp163
	jmp	.L27	;
.L10:
	leaq	.LC8(%rip), %rdx	;, tmp168
	jmp	.L27	;
.L25:
; src/compiler.c:42:         char c = token->lexeme[i];
	movsbl	(%r14,%r12), %edi	; *_35,
; src/compiler.c:44:             fputs("\\0", file);
	movq	%rbx, %rsi	; file,
; src/compiler.c:43:         if (c == '\0')
	testb	%dil, %dil	; c
	jne	.L20	;,
; src/compiler.c:44:             fputs("\\0", file);
	leaq	.LC9(%rip), %rdi	;, tmp169
.L28:
; src/compiler.c:46:             fputs("\\n", file);
	call	*fputs@GOTPCREL(%rip)	;
.L21:
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	incq	%r12	; i
.L19:
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	0(%rbp), %r14	; token_45(D)->lexeme, _37
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%r14, %rdi	; _37,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %r12	; tmp183, i
	jb	.L25	;,
	jmp	.L29	;
.L20:
; src/compiler.c:45:         else if (c == '\n')
	cmpb	$10, %dil	;, c
	jne	.L22	;,
; src/compiler.c:46:             fputs("\\n", file);
	leaq	.LC10(%rip), %rdi	;, tmp170
	jmp	.L28	;
.L22:
; src/compiler.c:47:         else if (c == '\t')
	cmpb	$9, %dil	;, c
	jne	.L23	;,
; src/compiler.c:48:             fputs("\\t", file);
	leaq	.LC11(%rip), %rdi	;, tmp171
	jmp	.L28	;
.L23:
; src/compiler.c:49:         else if (c == '\r')
	cmpb	$13, %dil	;, c
	jne	.L24	;,
; src/compiler.c:50:             fputs("\\r", file);
	movq	%r13, %rdi	; tmp180,
	jmp	.L28	;
.L24:
; src/compiler.c:52:             fputc(c, file);
	call	*fputc@GOTPCREL(%rip)	;
	jmp	.L21	;
.L29:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; file,
	leaq	.LC13(%rip), %rdi	;, tmp177
; src/compiler.c:55: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
	.size	output_one_token, .-output_one_token
	.section	.rodata.str1.1
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, lexer
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp88, file
	pushq	%rbx	;
.L32:
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%esi, %esi	;
	movq	%r12, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp92, current
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	je	.L34	;,
; src/compiler.c:58:         output_one_token(file, current);
	movq	%rbx, %rsi	; current,
	movq	%rbp, %rdi	; file,
	call	output_one_token	;
; src/compiler.c:59:         if (current->type == EOF_TOKEN)
	cmpl	$0, 24(%rbx)	;, current_3->type
	jne	.L32	;,
.L34:
; src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; src/compiler.c:63: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rdi	; file,
	leaq	.LC14(%rip), %rdx	;, tmp87
; src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp91, _2
; src/compiler.c:63: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:63: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp87, file
; src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	xorl	%edx, %edx	;
; src/compiler.c:64: void output_ast(FILE* file, Code* ast) {
	movq	%rsi, %rdi	; tmp88, ast
; src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	movq	%rbx, %rsi	; file,
; src/compiler.c:64: void output_ast(FILE* file, Code* ast) {
	subq	$32, %rsp	;,
; src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	movq	%rsp, %rcx	;, tmp85
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; file,
	movl	$2, %esi	;,
	leaq	.LC14(%rip), %rdx	;, tmp86
; src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp89, _1
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:68: }
	addq	$32, %rsp	;,
	popq	%rbx	;
	ret	
	.size	output_ast, .-output_ast
	.globl	output_tac
	.type	output_tac, @function
output_tac:
	pushq	%rbx	;
; src/compiler.c:69: void output_tac(FILE* file, TAC* tac) {
	movq	%rdi, %rbx	; tmp86, file
; src/compiler.c:70:     output_TAC(tac, file, 0);
	xorl	%edx, %edx	;
; src/compiler.c:69: void output_tac(FILE* file, TAC* tac) {
	movq	%rsi, %rdi	; tmp87, tac
; src/compiler.c:70:     output_TAC(tac, file, 0);
	movq	%rbx, %rsi	; file,
	call	*output_TAC@GOTPCREL(%rip)	;
; src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; file,
	movl	$2, %esi	;,
; src/compiler.c:72: }
	popq	%rbx	;
; src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp88, _1
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC14(%rip), %rdx	;, tmp85
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_tac, .-output_tac
	.section	.rodata.str1.1
.LC15:
	.string	"r"
.LC16:
	.string	"Error opening file: %s"
.LC17:
	.string	".token"
.LC18:
	.string	"w"
.LC19:
	.string	"Error opening file: %s\n"
.LC20:
	.string	".ast"
.LC21:
	.string	".tc"
.LC22:
	.string	".tac"
	.text
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r15	;
	pushq	%r14	;
	movl	%edx, %r14d	; tmp142, o_ast
	pushq	%r13	;
	movl	%ecx, %r13d	; tmp143, o_tac
	pushq	%r12	;
	movl	%esi, %r12d	; tmp141, o_token
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/compiler.c:74:     File* file = create_file(name);
	call	*create_file@GOTPCREL(%rip)	;
; src/compiler.c:75:     string filename = get_full_path(file);
	movq	%rax, %rdi	; file,
; src/compiler.c:74:     File* file = create_file(name);
	movq	%rax, %rbx	; tmp144, file
; src/compiler.c:75:     string filename = get_full_path(file);
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:76:     size_t length = 0;
	xorl	%edx, %edx	;
; src/compiler.c:77:     FILE* source_file = fopen(filename, "r");
	leaq	.LC15(%rip), %rsi	;, tmp115
; src/compiler.c:76:     size_t length = 0;
	movq	%rdx, 8(%rsp)	;, length
; src/compiler.c:75:     string filename = get_full_path(file);
	movq	%rax, %r15	; tmp145, filename
; src/compiler.c:77:     FILE* source_file = fopen(filename, "r");
	movq	%rax, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; filename,
	leaq	.LC16(%rip), %rdx	;, tmp118
; src/compiler.c:78:     if (source_file == NULL) {
	testq	%rax, %rax	; tmp116
	je	.L51	;,
; src/compiler.c:82:     string source = read_source(source_file, &length);
	leaq	8(%rsp), %rsi	;, tmp119
	movq	%rax, %rdi	; tmp116,
	movq	%rax, %rbp	; tmp146, tmp116
	call	read_source	;
; src/compiler.c:83:     fclose(source_file);
	movq	%rbp, %rdi	; tmp116,
; src/compiler.c:82:     string source = read_source(source_file, &length);
	movq	%rax, %r15	; tmp147, source
; src/compiler.c:83:     fclose(source_file);
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:84:     Lexer* lexer = create_lexer(source, length);
	movq	8(%rsp), %rsi	; length,
	movq	%r15, %rdi	; source,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp148, lexer
; src/compiler.c:85:     if (o_token) {
	testb	%r12b, %r12b	; o_token
	je	.L42	;,
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp121
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rdi	; file,
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rsi	; tmp149, _3
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:87:         string out_token_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:88:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp122
; src/compiler.c:87:         string out_token_name = get_full_path(file);
	movq	%rax, %r15	; tmp150, out_token_name
; src/compiler.c:88:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	%rax, %rdi	; out_token_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp151, tmp123
; src/compiler.c:89:         if (out_token_file == NULL)
	testq	%rax, %rax	; tmp123
	jne	.L43	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r15, %rcx	; out_token_name,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC19(%rip), %rdx	;, tmp125
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L42	;
.L43:
; src/compiler.c:92:             output_token(out_token_file, lexer);
	movq	%rax, %rdi	; tmp123,
	movq	%rbp, %rsi	; lexer,
	call	output_token	;
; src/compiler.c:93:             fclose(out_token_file);
	movq	%r12, %rdi	; tmp123,
	call	*fclose@GOTPCREL(%rip)	;
.L42:
; src/compiler.c:96:     reset_lexer(lexer);
	movq	%rbp, %rdi	; lexer,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:97:     Parser* parser = create_parser(file);
	movq	%rbx, %rdi	; file,
	call	*create_parser@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp152, parser
; src/compiler.c:99:     if (o_ast || o_tac)
	movl	%r13d, %eax	; o_tac, tmp163
	orb	%r14b, %al	; o_ast, tmp163
	je	.L40	;,
; src/compiler.c:100:         ast = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	movq	%rbp, %rdi	; lexer,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp153, ast
; src/compiler.c:101:     if (o_ast) {
	testb	%r14b, %r14b	; o_ast
	je	.L46	;,
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp128
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rdi	; file,
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rsi	; tmp154, _7
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:103:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp129
; src/compiler.c:103:         string out_ast_name = get_full_path(file);
	movq	%rax, %r14	; tmp155, out_ast_name
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rdi	; file,
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movq	%rax, %rsi	; tmp156, _8
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp130
	movq	%r14, %rdi	; out_ast_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp157, tmp131
; src/compiler.c:106:         if (out_ast_file == NULL)
	testq	%rax, %rax	; tmp131
	jne	.L47	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r14, %rcx	; out_ast_name,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC19(%rip), %rdx	;, tmp133
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L46	;
.L47:
; src/compiler.c:109:             output_ast(out_ast_file, ast);
	movq	%rax, %rdi	; tmp131,
	movq	%r12, %rsi	; ast,
	call	output_ast	;
; src/compiler.c:110:             fclose(out_ast_file);
	movq	%rbp, %rdi	; tmp131,
	call	*fclose@GOTPCREL(%rip)	;
.L46:
; src/compiler.c:113:     if (o_tac) {
	testb	%r13b, %r13b	; o_tac
	je	.L40	;,
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movl	$4, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp134
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movq	%rbx, %rdi	; file,
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movq	%rax, %rsi	; tmp158, _10
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:115:         string out_tac_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp135
; src/compiler.c:115:         string out_tac_name = get_full_path(file);
	movq	%rax, %rbp	; tmp159, out_tac_name
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rdi	; file,
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movq	%rax, %rsi	; tmp160, _11
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:117:         FILE* out_tac_file = fopen(out_tac_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp136
	movq	%rbp, %rdi	; out_tac_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp161, tmp137
; src/compiler.c:118:         if (out_tac_file == NULL)
	testq	%rax, %rax	; tmp137
	jne	.L49	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; out_tac_name,
	leaq	.LC19(%rip), %rdx	;, tmp139
.L51:
	movq	stderr(%rip), %rdi	; stderr,
; src/compiler.c:126: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:126: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L49:
; src/compiler.c:121:             TAC* tac = tac_code(ast);
	movq	%r12, %rdi	; ast,
	call	*tac_code@GOTPCREL(%rip)	;
; src/compiler.c:122:             output_tac(out_tac_file, tac);
	movq	%rbx, %rdi	; tmp137,
; src/compiler.c:121:             TAC* tac = tac_code(ast);
	movq	%rax, %rsi	; tmp162, tac
; src/compiler.c:122:             output_tac(out_tac_file, tac);
	call	output_tac	;
; src/compiler.c:126: }
	addq	$24, %rsp	;,
; src/compiler.c:123:             fclose(out_tac_file);
	movq	%rbx, %rdi	; tmp137,
; src/compiler.c:126: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/compiler.c:123:             fclose(out_tac_file);
	jmp	*fclose@GOTPCREL(%rip)	;
.L40:
; src/compiler.c:126: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

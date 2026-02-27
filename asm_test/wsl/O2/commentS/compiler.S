	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.*s%s"
.LC1:
	.string	"%s"
.LC2:
	.string	"%s%s"
	.text
	.p2align 4
	.globl	string_append
	.type	string_append, @function
string_append:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp106, dest
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rdx, %rdi	; src,
; src/compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	pushq	%r12	;
	movq	%rcx, %r12	; tmp109, new
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp107, dest_length
	pushq	%rbx	;
; src/compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	movq	%rdx, %rbx	; tmp108, src
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%r12, %rdi	; new,
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rax, %r14	; tmp110, tmp95
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	leaq	(%r14,%rax), %rdx	;, tmp100
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	%rbp, %rdx	; dest_length, tmp100
	jnb	.L7	;,
; src/compiler.c:12:     } else if (src == dest)
	cmpq	%r13, %rbx	; dest, src
	je	.L8	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	subq	$8, %rsp	;,
	movq	%rbx, %r9	; src,
	movl	$2, %edx	;,
	movq	%rbp, %rsi	; dest_length,
	pushq	%r12	; new
	movq	%r13, %rdi	; dest,
	leaq	.LC2(%rip), %r8	;,
	xorl	%eax, %eax	;
	movq	$-1, %rcx	;,
	call	*__snprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	popq	%rax	;
	popq	%rdx	;
; src/compiler.c:16: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L8:
; src/compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	movq	%rbp, %rsi	; dest_length, dest_length
	leaq	(%rbx,%r14), %rdi	;, tmp104
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %rcx	; new,
; src/compiler.c:16: }
	popq	%rbx	;
; src/compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	subq	%r14, %rsi	; tmp95, dest_length
; src/compiler.c:16: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC1(%rip), %rdx	;, tmp105
; src/compiler.c:16: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	xorl	%eax, %eax	;
; src/compiler.c:16: }
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	jmp	*snprintf@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L7:
; src/compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	leaq	-1(%rbp), %r9	;, tmp101
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	pushq	%r12	; new
	movq	%rbp, %rsi	; dest_length,
	movq	$-1, %rcx	;,
	pushq	%rbx	; src
	subl	%eax, %r9d	; tmp98,
	movq	%r13, %rdi	; dest,
	leaq	.LC0(%rip), %r8	;,
	movl	$2, %edx	;,
	xorl	%eax, %eax	;
	call	*__snprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	popq	%rcx	;
	popq	%rsi	;
; src/compiler.c:16: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
	.p2align 4
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp104, file
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	movl	$2, %edx	;,
; src/compiler.c:17: string read_source(FILE* file, size_t* length) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp105, length
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	xorl	%esi, %esi	;
; src/compiler.c:17: string read_source(FILE* file, size_t* length) {
	pushq	%rbx	;
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	%r12, %rdi	; file,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:20:     fseek(file, 0, SEEK_SET);
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movq	%r12, %rdi	; file,
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	%rax, 0(%rbp)	; tmp106, *length_19(D)
; src/compiler.c:20:     fseek(file, 0, SEEK_SET);
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:22:     string source = create_string("", *length + 1);
	movq	0(%rbp), %rax	; *length_19(D), tmp111
	leaq	.LC3(%rip), %rdi	;, tmp98
	leaq	1(%rax), %rsi	;, tmp96
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	0(%rbp), %rdx	; *length_19(D), *length_19(D)
	movq	%r12, %rcx	; file,
	movl	$1, %esi	;,
; src/compiler.c:22:     string source = create_string("", *length + 1);
	movq	%rax, %rbx	; tmp107, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	%rax, %rdi	; <retval>,
	call	*fread@GOTPCREL(%rip)	;
; src/compiler.c:24:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	;, *_6
; src/compiler.c:25:     *length = bytes_read;
	movq	%rax, 0(%rbp)	; _34, *length_19(D)
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	testq	%rax, %rax	; _34
	je	.L9	;,
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	; i
	.p2align 4,,10
	.p2align 3
.L12:
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	; MEM[(char *)source_23 + i_40 * 1], tmp100
	andl	$-5, %edx	;, tmp100
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	;, tmp100
	jne	.L11	;,
; src/compiler.c:29:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	;, MEM[(char *)source_23 + i_40 * 1]
.L11:
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	;, i
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	cmpq	0(%rbp), %rax	; *length_19(D), i
	jb	.L12	;,
.L9:
; src/compiler.c:32: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	read_source, .-read_source
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
	.align 8
.LC5:
	.string	"Token(Type: identifier,  Line: "
	.align 8
.LC6:
	.string	"Token(Type: integer,     Line: "
	.align 8
.LC7:
	.string	"Token(Type: float,       Line: "
	.align 8
.LC8:
	.string	"Token(Type: string,      Line: "
	.align 8
.LC9:
	.string	"Token(Type: symbol,      Line: "
	.align 8
.LC10:
	.string	"Token(Type: keyword,     Line: "
	.align 8
.LC11:
	.string	"Token(Type: comment,     Line: "
	.section	.rodata.str1.1
.LC12:
	.string	"%zu, Column: %zu)\tLexeme: '"
.LC13:
	.string	"\\0"
.LC14:
	.string	"\\n"
.LC15:
	.string	"\\t"
.LC16:
	.string	"\\r"
.LC17:
	.string	"'\n"
.LC18:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.p2align 4
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp140, file
	movq	%rsi, %rdi	; tmp141, lexer
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/compiler.c:33: void output_token(FILE* file, Lexer* lexer) {
	movq	%rsi, 8(%rsp)	; lexer, %sfp
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%esi, %esi	;
	call	*get_next_token@GOTPCREL(%rip)	;
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	je	.L30	;,
	movq	%rax, %rbx	; tmp142, current
	leaq	.L22(%rip), %r14	;, tmp136
	.p2align 4,,10
	.p2align 3
.L38:
	cmpl	$7, 24(%rbx)	;, current_50->type
	ja	.L20	;,
	movl	24(%rbx), %eax	; current_50->type, current_50->type
	movslq	(%r14,%rax,4), %rax	;, tmp103
	addq	%r14, %rax	; tmp136, tmp104
	jmp	*%rax	; tmp104
	.section	.rodata
	.align 4
	.align 4
.L22:
	.long	.L29-.L22
	.long	.L28-.L22
	.long	.L27-.L22
	.long	.L26-.L22
	.long	.L25-.L22
	.long	.L24-.L22
	.long	.L23-.L22
	.long	.L21-.L22
	.text
	.p2align 4,,10
	.p2align 3
.L23:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L20:
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	; current_50->column, current_50->column
	movq	8(%rbx), %rdx	; current_50->line, tmp147
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; file,
; src/compiler.c:60:                 fputs("\\n", file);
	leaq	.LC14(%rip), %r15	;, tmp134
; src/compiler.c:58:                 fputs("\\0", file);
	leaq	.LC13(%rip), %r13	;, tmp135
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rdx), %rcx	;, tmp120
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	xorl	%eax, %eax	;
	leaq	.LC12(%rip), %rdx	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:54:         string lexeme_ptr = token->lexeme;
	movq	(%rbx), %rbp	; current_50->lexeme, lexeme_ptr
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	xorl	%ebx, %ebx	; i
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	jmp	.L31	;
	.p2align 4,,10
	.p2align 3
.L32:
; src/compiler.c:59:             else if (c == '\n')
	cmpb	$10, %dil	;, c
	je	.L44	;,
; src/compiler.c:61:             else if (c == '\t')
	cmpb	$9, %dil	;, c
	je	.L45	;,
; src/compiler.c:63:             else if (c == '\r')
	cmpb	$13, %dil	;, c
	je	.L46	;,
; src/compiler.c:66:                 fputc(c, file);
	movq	%r12, %rsi	; file,
	call	*fputc@GOTPCREL(%rip)	;
.L33:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	addq	$1, %rbx	;, i
.L31:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	%rbp, %rdi	; lexeme_ptr,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, %rbx	; tmp143, i
	jnb	.L47	;,
; src/compiler.c:56:             char c = lexeme_ptr[i];
	movsbl	0(%rbp,%rbx), %edi	; MEM[(char *)lexeme_ptr_27 + i_16 * 1],
; src/compiler.c:57:             if (c == '\0')
	testb	%dil, %dil	; c
	jne	.L32	;,
; src/compiler.c:58:                 fputs("\\0", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r13, %rdi	; tmp135,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L33	;
	.p2align 4,,10
	.p2align 3
.L24:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp113
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L29:
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	; current_50->column, current_50->column
	movq	8(%rbx), %rcx	; current_50->line, current_50->line
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; file,
	leaq	.LC4(%rip), %rdx	;, tmp110
	leaq	1(%rax), %r8	;,
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp108
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L30:
; src/compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; src/compiler.c:71: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdi	; file,
	leaq	.LC18(%rip), %rdx	;, tmp132
; src/compiler.c:71: }
	popq	%rbx	;
; src/compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp145, _14
; src/compiler.c:71: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/compiler.c:71: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/compiler.c:71: }
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp112
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L46:
; src/compiler.c:64:                 fputs("\\r", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L33	;
	.p2align 4,,10
	.p2align 3
.L44:
; src/compiler.c:60:                 fputs("\\n", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r15, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L33	;
	.p2align 4,,10
	.p2align 3
.L47:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%esi, %esi	;
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp144, current
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	jne	.L38	;,
	jmp	.L30	;
	.p2align 4,,10
	.p2align 3
.L45:
; src/compiler.c:62:                 fputs("\\t", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp125
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L33	;
	.size	output_token, .-output_token
	.p2align 4
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp92, parser
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp90, file
	movq	%rsi, %rdi	; tmp91, lexer
	subq	$8, %rsp	;,
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	call	*parse_code@GOTPCREL(%rip)	;
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; file,
	xorl	%edx, %edx	;
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rdi	; tmp93, ast_root
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; src/compiler.c:76: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; file,
	leaq	.LC18(%rip), %rdx	;, tmp89
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp94, _2
; src/compiler.c:76: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:76: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_ast, .-output_ast
	.section	.rodata.str1.1
.LC19:
	.string	"r"
.LC20:
	.string	"Error opening file: %s"
.LC21:
	.string	".token"
.LC22:
	.string	"w"
.LC23:
	.string	"Error opening file: %s\n"
.LC24:
	.string	".ast"
	.text
	.p2align 4
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r14	;
	pushq	%r13	;
	movl	%esi, %r13d	; tmp125, o_token
	pushq	%r12	;
	movl	%edx, %r12d	; tmp126, o_ast
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
; src/compiler.c:78:     File* file = create_file(name);
	call	*create_file@GOTPCREL(%rip)	;
; src/compiler.c:79:     string filename = get_full_path(file);
	movq	%rax, %rdi	; file,
; src/compiler.c:78:     File* file = create_file(name);
	movq	%rax, %rbp	; tmp127, file
; src/compiler.c:79:     string filename = get_full_path(file);
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:81:     FILE* source_file = fopen(filename, "r");
	leaq	.LC19(%rip), %rsi	;, tmp106
; src/compiler.c:80:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/compiler.c:79:     string filename = get_full_path(file);
	movq	%rax, %r14	; tmp128, filename
; src/compiler.c:81:     FILE* source_file = fopen(filename, "r");
	movq	%rax, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
; src/compiler.c:82:     if (source_file == NULL) {
	testq	%rax, %rax	; tmp107
	je	.L58	;,
; src/compiler.c:86:     string source = read_source(source_file, &length);
	leaq	8(%rsp), %rsi	;, tmp110
	movq	%rax, %rdi	; tmp107,
	movq	%rax, %rbx	; tmp129, tmp107
	call	read_source	;
; src/compiler.c:87:     fclose(source_file);
	movq	%rbx, %rdi	; tmp107,
; src/compiler.c:86:     string source = read_source(source_file, &length);
	movq	%rax, %r14	; tmp130, source
; src/compiler.c:87:     fclose(source_file);
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:88:     Lexer* lexer = create_lexer(source, length);
	movq	8(%rsp), %rsi	; length,
	movq	%r14, %rdi	; source,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp131, lexer
; src/compiler.c:89:     if (o_token) {
	testb	%r13b, %r13b	; o_token
	jne	.L59	;,
.L52:
; src/compiler.c:100:     reset_lexer(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:101:     Parser* parser = create_parser();
	call	*create_parser@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp135, parser
; src/compiler.c:102:     if (o_ast) {
	testb	%r12b, %r12b	; o_ast
	jne	.L60	;,
; src/compiler.c:113: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L59:
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp112
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	%rbp, %rdi	; file,
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rsi	; tmp132, _3
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:91:         string out_token_name = get_full_path(file);
	movq	%rbp, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC22(%rip), %rsi	;, tmp113
; src/compiler.c:91:         string out_token_name = get_full_path(file);
	movq	%rax, %r14	; tmp133, out_token_name
; src/compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	%rax, %rdi	; out_token_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp134, tmp114
; src/compiler.c:93:         if (out_token_file == NULL)
	testq	%rax, %rax	; tmp114
	je	.L61	;,
; src/compiler.c:96:             output_token(out_token_file, lexer);
	movq	%rbx, %rsi	; lexer,
	movq	%rax, %rdi	; tmp114,
	call	output_token	;
; src/compiler.c:97:             fclose(out_token_file);
	movq	%r13, %rdi	; tmp114,
	call	*fclose@GOTPCREL(%rip)	;
	jmp	.L52	;
	.p2align 4,,10
	.p2align 3
.L60:
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC24(%rip), %rdi	;, tmp117
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbp, %rdi	; file,
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rsi	; tmp136, _5
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	%rbp, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC22(%rip), %rsi	;, tmp118
; src/compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	%rax, %r12	; tmp137, out_ast_name
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	%rax, %rdi	; out_ast_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp138, tmp119
; src/compiler.c:106:         if (out_ast_file == NULL)
	testq	%rax, %rax	; tmp119
	je	.L62	;,
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%rbx, %rdi	; lexer,
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	call	*parse_code@GOTPCREL(%rip)	;
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	movq	%r13, %rcx	; parser,
	movq	%rbp, %rsi	; tmp119,
	xorl	%edx, %edx	;
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rdi	; tmp139, ast_root
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rdi	; tmp119,
	movl	$2, %esi	;,
	leaq	.LC18(%rip), %rdx	;, tmp123
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp140, _52
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:113: }
	addq	$16, %rsp	;,
; src/compiler.c:110:             fclose(out_ast_file);
	movq	%rbp, %rdi	; tmp119,
; src/compiler.c:113: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/compiler.c:110:             fclose(out_ast_file);
	jmp	*fclose@GOTPCREL(%rip)	;
.L58:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; filename,
	leaq	.LC20(%rip), %rdx	;, tmp109
.L57:
	movq	stderr(%rip), %rdi	; stderr,
; src/compiler.c:113: }
	addq	$16, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:113: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L61:
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r14, %rcx	; out_token_name,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC23(%rip), %rdx	;, tmp116
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L52	;
.L62:
	movq	%r12, %rcx	; out_ast_name,
	leaq	.LC23(%rip), %rdx	;, tmp121
	jmp	.L57	;
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

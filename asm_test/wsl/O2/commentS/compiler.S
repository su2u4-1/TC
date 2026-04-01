	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
	.text
	.p2align 4
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp104, file
; src/compiler.c:7:     fseek(file, 0, SEEK_END);
	movl	$2, %edx	;,
; src/compiler.c:6: string read_source(FILE* file, size_t* length) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp105, length
; src/compiler.c:7:     fseek(file, 0, SEEK_END);
	xorl	%esi, %esi	;
; src/compiler.c:6: string read_source(FILE* file, size_t* length) {
	pushq	%rbx	;
; src/compiler.c:7:     fseek(file, 0, SEEK_END);
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:8:     *length = (size_t)ftell(file);
	movq	%r12, %rdi	; file,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:9:     fseek(file, 0, SEEK_SET);
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movq	%r12, %rdi	; file,
; src/compiler.c:8:     *length = (size_t)ftell(file);
	movq	%rax, 0(%rbp)	; tmp106, *length_19(D)
; src/compiler.c:9:     fseek(file, 0, SEEK_SET);
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:11:     string source = create_string_not_check("", *length + 1);
	movq	0(%rbp), %rax	; *length_19(D), tmp111
	leaq	.LC0(%rip), %rdi	;, tmp98
	leaq	1(%rax), %rsi	;, tmp96
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	0(%rbp), %rdx	; *length_19(D), *length_19(D)
	movq	%r12, %rcx	; file,
	movl	$1, %esi	;,
; src/compiler.c:11:     string source = create_string_not_check("", *length + 1);
	movq	%rax, %rbx	; tmp107, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	%rax, %rdi	; <retval>,
	call	*fread@GOTPCREL(%rip)	;
; src/compiler.c:13:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	;, *_6
; src/compiler.c:14:     *length = bytes_read;
	movq	%rax, 0(%rbp)	; _34, *length_19(D)
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	testq	%rax, %rax	; _34
	je	.L1	;,
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	; i
	.p2align 4,,10
	.p2align 3
.L4:
; src/compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	; MEM[(char *)source_23 + i_40 * 1], tmp100
	andl	$-5, %edx	;, tmp100
; src/compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	;, tmp100
	jne	.L3	;,
; src/compiler.c:18:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	;, MEM[(char *)source_23 + i_40 * 1]
.L3:
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	;, i
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	cmpq	0(%rbp), %rax	; *length_19(D), i
	jb	.L4	;,
.L1:
; src/compiler.c:21: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	read_source, .-read_source
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
	.align 8
.LC2:
	.string	"Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC3:
	.string	"Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC4:
	.string	"Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC5:
	.string	"Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC6:
	.string	"Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC7:
	.string	"Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC8:
	.string	"Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '"
	.section	.rodata.str1.1
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
	.p2align 4
	.globl	output_one_token
	.type	output_one_token, @function
output_one_token:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp181, file
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp182, token
	pushq	%rbx	;
	subq	$8, %rsp	;,
	cmpl	$7, 24(%rsi)	;, token_45(D)->type
	ja	.L12	;,
	movl	24(%rsi), %eax	; token_45(D)->type, token_45(D)->type
	leaq	.L14(%rip), %rdx	;, tmp124
	movslq	(%rdx,%rax,4), %rax	;, tmp126
	addq	%rdx, %rax	; tmp124, tmp127
	jmp	*%rax	; tmp127
	.section	.rodata
	.align 4
	.align 4
.L14:
	.long	.L21-.L14
	.long	.L20-.L14
	.long	.L19-.L14
	.long	.L18-.L14
	.long	.L17-.L14
	.long	.L16-.L14
	.long	.L15-.L14
	.long	.L13-.L14
	.text
	.p2align 4,,10
	.p2align 3
.L19:
; src/compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp186
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC3(%rip), %rdx	;, tmp143
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp141
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L12:
; src/compiler.c:22: void output_one_token(FILE* file, Token* token) {
	xorl	%ebx, %ebx	; i
; src/compiler.c:49:             fputs("\\r", file);
	leaq	.LC12(%rip), %r14	;, tmp178
; src/compiler.c:43:             fputs("\\0", file);
	leaq	.LC9(%rip), %r13	;, tmp180
	jmp	.L22	;
	.p2align 4,,10
	.p2align 3
.L23:
; src/compiler.c:44:         else if (c == '\n')
	cmpb	$10, %dil	;, c
	je	.L30	;,
; src/compiler.c:46:         else if (c == '\t')
	cmpb	$9, %dil	;, c
	je	.L31	;,
; src/compiler.c:48:         else if (c == '\r')
	cmpb	$13, %dil	;, c
	je	.L32	;,
; src/compiler.c:51:             fputc(c, file);
	movq	%r12, %rsi	; file,
	call	*fputc@GOTPCREL(%rip)	;
.L24:
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, %rbx	;, i
.L22:
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	0(%rbp), %r15	; token_45(D)->lexeme, _37
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%r15, %rdi	; _37,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %rbx	; tmp183, i
	jnb	.L33	;,
; src/compiler.c:41:         char c = token->lexeme[i];
	movsbl	(%r15,%rbx), %edi	; *_35,
; src/compiler.c:42:         if (c == '\0')
	testb	%dil, %dil	; c
	jne	.L23	;,
; src/compiler.c:43:             fputs("\\0", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r13, %rdi	; tmp180,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L32:
; src/compiler.c:49:             fputs("\\r", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r14, %rdi	; tmp178,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L30:
; src/compiler.c:45:             fputs("\\n", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L33:
; src/compiler.c:54: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
; src/compiler.c:54: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC13(%rip), %rdi	;, tmp177
; src/compiler.c:54: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L31:
; src/compiler.c:47:             fputs("\\t", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp171
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L15:
; src/compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp190
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC7(%rip), %rdx	;, tmp163
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp161
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L13:
; src/compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp191
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC8(%rip), %rdx	;, tmp168
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp166
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L21:
; src/compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, token_45(D)->line
; src/compiler.c:54: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %rdx	;, tmp133
; src/compiler.c:54: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/compiler.c:54: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
; src/compiler.c:54: }
	popq	%r12	;
; src/compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp131
; src/compiler.c:54: }
	popq	%r13	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/compiler.c:54: }
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L20:
; src/compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp185
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC2(%rip), %rdx	;, tmp138
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp136
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L18:
; src/compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp187
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC4(%rip), %rdx	;, tmp148
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp146
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L17:
; src/compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp188
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC5(%rip), %rdx	;, tmp153
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp151
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L16:
; src/compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp189
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC6(%rip), %rdx	;, tmp158
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	addq	$1, %rcx	;, tmp156
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L12	;
	.size	output_one_token, .-output_one_token
	.section	.rodata.str1.1
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.p2align 4
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, lexer
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%esi, %esi	;
; src/compiler.c:55: void output_token(FILE* file, Lexer* lexer) {
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp88, file
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	%r12, %rdi	; lexer,
; src/compiler.c:55: void output_token(FILE* file, Lexer* lexer) {
	pushq	%rbx	;
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	call	*get_next_token@GOTPCREL(%rip)	;
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	je	.L35	;,
	movq	%rax, %rbx	; tmp90, current
	jmp	.L36	;
	.p2align 4,,10
	.p2align 3
.L42:
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%esi, %esi	;
	movq	%r12, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp91, current
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	je	.L35	;,
.L36:
; src/compiler.c:57:         output_one_token(file, current);
	movq	%rbx, %rsi	; current,
	movq	%rbp, %rdi	; file,
	call	output_one_token	;
; src/compiler.c:58:         if (current->type == EOF_TOKEN)
	movl	24(%rbx), %eax	; current_18->type,
	testl	%eax, %eax	;
	jne	.L42	;,
.L35:
; src/compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; src/compiler.c:62: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rdi	; file,
	leaq	.LC14(%rip), %rdx	;, tmp87
; src/compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp92, _2
; src/compiler.c:62: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:62: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
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
; src/compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	call	*parse_code@GOTPCREL(%rip)	;
; src/compiler.c:65:     output_code(ast_root, file, 0, parser);
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; file,
	xorl	%edx, %edx	;
; src/compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rdi	; tmp93, ast_root
; src/compiler.c:65:     output_code(ast_root, file, 0, parser);
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; src/compiler.c:67: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; file,
	leaq	.LC14(%rip), %rdx	;, tmp89
; src/compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp94, _2
; src/compiler.c:67: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:67: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	output_ast, .-output_ast
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
	.text
	.p2align 4
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%r14	;
	pushq	%r13	;
	movl	%esi, %r13d	; tmp127, o_token
	pushq	%r12	;
	movl	%edx, %r12d	; tmp128, o_ast
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
; src/compiler.c:69:     File* file = create_file(name);
	call	*create_file@GOTPCREL(%rip)	;
; src/compiler.c:70:     string filename = get_full_path(file);
	movq	%rax, %rdi	; file,
; src/compiler.c:69:     File* file = create_file(name);
	movq	%rax, %rbx	; tmp129, file
; src/compiler.c:70:     string filename = get_full_path(file);
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:72:     FILE* source_file = fopen(filename, "r");
	leaq	.LC15(%rip), %rsi	;, tmp107
; src/compiler.c:71:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/compiler.c:70:     string filename = get_full_path(file);
	movq	%rax, %r14	; tmp130, filename
; src/compiler.c:72:     FILE* source_file = fopen(filename, "r");
	movq	%rax, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
; src/compiler.c:73:     if (source_file == NULL) {
	testq	%rax, %rax	; tmp108
	je	.L53	;,
; src/compiler.c:77:     string source = read_source(source_file, &length);
	leaq	8(%rsp), %rsi	;, tmp111
	movq	%rax, %rdi	; tmp108,
	movq	%rax, %rbp	; tmp131, tmp108
	call	read_source	;
; src/compiler.c:78:     fclose(source_file);
	movq	%rbp, %rdi	; tmp108,
; src/compiler.c:77:     string source = read_source(source_file, &length);
	movq	%rax, %r14	; tmp132, source
; src/compiler.c:78:     fclose(source_file);
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:79:     Lexer* lexer = create_lexer(source, length);
	movq	8(%rsp), %rsi	; length,
	movq	%r14, %rdi	; source,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp133, lexer
; src/compiler.c:80:     if (o_token) {
	testb	%r13b, %r13b	; o_token
	jne	.L54	;,
.L47:
; src/compiler.c:91:     reset_lexer(lexer);
	movq	%rbp, %rdi	; lexer,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:92:     Parser* parser = create_parser(file);
	movq	%rbx, %rdi	; file,
	call	*create_parser@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp137, parser
; src/compiler.c:93:     if (o_ast) {
	testb	%r12b, %r12b	; o_ast
	jne	.L55	;,
; src/compiler.c:105: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L54:
; src/compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp113
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rdi	; file,
; src/compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rsi	; tmp134, _3
; src/compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:82:         string out_token_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:83:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp114
; src/compiler.c:82:         string out_token_name = get_full_path(file);
	movq	%rax, %r14	; tmp135, out_token_name
; src/compiler.c:83:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	%rax, %rdi	; out_token_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp136, tmp115
; src/compiler.c:84:         if (out_token_file == NULL)
	testq	%rax, %rax	; tmp115
	je	.L56	;,
; src/compiler.c:87:             output_token(out_token_file, lexer);
	movq	%rbp, %rsi	; lexer,
	movq	%rax, %rdi	; tmp115,
	call	output_token	;
; src/compiler.c:88:             fclose(out_token_file);
	movq	%r13, %rdi	; tmp115,
	call	*fclose@GOTPCREL(%rip)	;
	jmp	.L47	;
	.p2align 4,,10
	.p2align 3
.L55:
; src/compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp118
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rdi	; file,
; src/compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rsi	; tmp138, _5
; src/compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:95:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp119
; src/compiler.c:95:         string out_ast_name = get_full_path(file);
	movq	%rax, %r12	; tmp139, out_ast_name
; src/compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	call	*create_string@GOTPCREL(%rip)	;
; src/compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rdi	; file,
; src/compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movq	%rax, %rsi	; tmp140, _6
; src/compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:97:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp120
	movq	%r12, %rdi	; out_ast_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp141, tmp121
; src/compiler.c:98:         if (out_ast_file == NULL)
	testq	%rax, %rax	; tmp121
	je	.L57	;,
; src/compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%rbp, %rdi	; lexer,
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	call	*parse_code@GOTPCREL(%rip)	;
; src/compiler.c:65:     output_code(ast_root, file, 0, parser);
	movq	%r13, %rcx	; parser,
	movq	%rbx, %rsi	; tmp121,
	xorl	%edx, %edx	;
; src/compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rdi	; tmp142, ast_root
; src/compiler.c:65:     output_code(ast_root, file, 0, parser);
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; tmp121,
	movl	$2, %esi	;,
	leaq	.LC14(%rip), %rdx	;, tmp125
; src/compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp143, _55
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:105: }
	addq	$16, %rsp	;,
; src/compiler.c:102:             fclose(out_ast_file);
	movq	%rbx, %rdi	; tmp121,
; src/compiler.c:105: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/compiler.c:102:             fclose(out_ast_file);
	jmp	*fclose@GOTPCREL(%rip)	;
.L53:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; filename,
	leaq	.LC16(%rip), %rdx	;, tmp110
.L52:
	movq	stderr(%rip), %rdi	; stderr,
; src/compiler.c:105: }
	addq	$16, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:105: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L56:
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r14, %rcx	; out_token_name,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC19(%rip), %rdx	;, tmp117
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L47	;
.L57:
	movq	%r12, %rcx	; out_ast_name,
	leaq	.LC19(%rip), %rdx	;, tmp123
	jmp	.L52	;
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

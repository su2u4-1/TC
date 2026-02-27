	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	get_current_char, @function
get_current_char:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rdi), %rax	; lexer_11(D)->position, _1
; src/lexer.c:33:         return '\0';
	movl	$0, %edx	;, <retval>
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	16(%rdi), %rax	; lexer_11(D)->length, _1
	jnb	.L1	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rdi)	;, lexer_11(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rdi), %rdx	; lexer_11(D)->source, _5
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, tmp91
	movq	%rcx, 8(%rdi)	; tmp91, lexer_11(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rdx,%rax), %edx	; *_7, <retval>
.L1:
; src/lexer.c:36: }
	movl	%edx, %eax	; <retval>,
	ret	
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %r13d	; tmp88, type
	movq	%rsi, %r12	; tmp89, lexeme
	movq	%rdx, %rbp	; tmp90, line
	movq	%rcx, %rbx	; tmp91, column
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:20:     token->type = type;
	movl	%r13d, 24(%rax)	; type, token_3->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%r12, (%rax)	; lexeme, token_3->lexeme
; src/lexer.c:22:     token->line = line;
	movq	%rbp, 8(%rax)	; line, token_3->line
; src/lexer.c:23:     token->column = column;
	movq	%rbx, 16(%rax)	; column, token_3->column
; src/lexer.c:25: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_token, .-create_token
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	subq	$8, %rsp	;,
	movq	%rdi, %r9	; message, tmp92
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rsi), %rcx	;, tmp89
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rdx), %r8	;,
	leaq	.LC0(%rip), %rdx	;, tmp91
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:29: }
	addq	$8, %rsp	;,
	ret	
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Unterminated string literal"
.LC2:
	.string	"src/lexer.c"
.LC3:
	.string	"c != '\\0'"
.LC4:
	.string	"Unterminated comment"
.LC5:
	.string	"Unexpected character"
	.text
	.type	next_token, @function
next_token:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp635, lexer
	movl	%esi, %ebp	; tmp636, skip_comment
; src/lexer.c:60:     char c = get_current_char(lexer);
	call	get_current_char	;
	cmpb	$32, %al	;, c
	ja	.L9	;,
	movzbl	%al, %edx	; c, c
	leaq	.L11(%rip), %rcx	;, tmp383
	movslq	(%rcx,%rdx,4), %rdx	;, tmp385
	addq	%rcx, %rdx	; tmp383, tmp386
	jmp	*%rdx	; tmp386
	.section	.rodata
	.align 4
	.align 4
.L11:
	.long	.L13-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.long	.L12-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.text
.L13:
; src/lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	32(%rbx), %rcx	; lexer_265(D)->column, lexer_265(D)->column
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
.L8:
; src/lexer.c:214: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L10:
; src/lexer.c:64:         return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L12:
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_265(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_265(D)->column
; src/lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L9:
	cmpb	$57, %al	;, c
	jg	.L15	;,
	cmpb	$47, %al	;, c
	jg	.L16	;,
	cmpb	$34, %al	;, c
	jne	.L103	;,
; src/lexer.c:95:         size_t start = lexer->position;
	movq	8(%rbx), %r12	; lexer_265(D)->position, start
; src/lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp704
	leaq	-1(%rax), %r14	;, column_start
; src/lexer.c:97:         c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	movl	%eax, %ebp	; tmp651, c
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	;, c
	ja	.L31	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %rax	;, tmp421
	btq	%rbp, %rax	; c, tmp421
	jc	.L32	;,
.L31:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %r13	;, tmp633
.L96:
; src/lexer.c:99:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	movl	%eax, %ebp	; tmp652, c
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	;, c
	ja	.L96	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rbp, %r13	; c, tmp633
	jnc	.L96	;,
.L32:
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %bpl	;, c
	je	.L34	;,
; src/lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	leaq	-1(%r12), %rdx	;, tmp427
	movq	24(%rbx), %rsi	; lexer_265(D)->line, lexer_265(D)->line
	leaq	.LC1(%rip), %rdi	;, tmp429
	call	lexer_error	;
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %bpl	;, c
	je	.L104	;,
.L35:
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	24(%rbx), %rbp	; lexer_265(D)->line, _46
	movq	%r12, %rsi	; start, tmp430
	notq	%rsi	; tmp430
	addq	8(%rbx), %rsi	; lexer_265(D)->position, tmp432
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r12, %rdi	; start, start
	addq	(%rbx), %rdi	; lexer_265(D)->source, start
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp653, _52
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r14, %rcx	; column_start,
	movq	%rbp, %rdx	; _46,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L8	;
.L15:
	leal	-65(%rax), %edx	;, _48
	cmpb	$57, %dl	;, _48
	ja	.L20	;,
	movabsq	$288230372997595135, %rcx	;, tmp394
	btq	%rdx, %rcx	; _48, tmp394
	jnc	.L20	;,
; src/lexer.c:69:         size_t start = lexer->position - 1;
	movq	8(%rbx), %r14	; lexer_265(D)->position, _11
; src/lexer.c:69:         size_t start = lexer->position - 1;
	leaq	-1(%r14), %r13	;, start
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rcx	; lexer_265(D)->column, tmp700
	leaq	-1(%rcx), %r12	;, column_start
	movabsq	$288230372997595135, %rbp	;, tmp634
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L22	;
.L105:
	cmpb	$47, %al	;, c
	jle	.L25	;,
.L24:
; src/lexer.c:72:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
.L22:
	cmpb	$57, %al	;, c
	jle	.L105	;,
	subl	$65, %eax	;, _19
	cmpb	$57, %al	;, _19
	ja	.L25	;,
	btq	%rax, %rbp	; _19, tmp634
	jc	.L24	;,
.L25:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rsi	; lexer_265(D)->position, _425
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp401
	movq	%rax, 8(%rbx)	; tmp401, lexer_265(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_265(D)->column
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r14, %rsi	; _11, tmp402
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r13, %rdi	; start, start
	addq	(%rbx), %rdi	; lexer_265(D)->source, start
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp642, content
; src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	call	*is_keyword@GOTPCREL(%rip)	;
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; tmp643
	je	.L27	;,
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	%r12, %rcx	; column_start,
	movq	%rbp, %rsi	; content,
	movl	$6, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L27:
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	%r12, %rcx	; column_start,
	movq	%rbp, %rsi	; content,
	movl	$1, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L16:
; src/lexer.c:80:         size_t start = lexer->position - 1;
	movq	8(%rbx), %r13	; lexer_265(D)->position, _26
; src/lexer.c:80:         size_t start = lexer->position - 1;
	leaq	-1(%r13), %r12	;, start
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp702
	leaq	-1(%rax), %rbp	;, column_start
.L28:
; src/lexer.c:83:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	;, tmp408
	cmpb	$9, %dl	;, tmp408
	jbe	.L28	;,
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	; lexer_265(D)->position, _431
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r14d	;, type
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	16(%rbx), %rdx	; lexer_265(D)->length, _431
	jnb	.L29	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	je	.L106	;,
.L29:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rsi	; lexer_265(D)->position, _442
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp414
	movq	%rax, 8(%rbx)	; tmp414, lexer_265(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_265(D)->column
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %r15	; lexer_265(D)->line, _34
	subq	%r13, %rsi	; _26, tmp415
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r12, %rdi	; start, start
	addq	(%rbx), %rdi	; lexer_265(D)->source, start
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp649, _39
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbp, %rcx	; column_start,
	movq	%r15, %rdx	; _34,
	movl	%r14d, %edi	; type,
	call	create_token	;
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	;
.L106:
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rax	; lexer_265(D)->source, lexer_265(D)->source
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rax,%rdx), %eax	; *_434, *_434
	subl	$48, %eax	;, tmp410
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp410
	ja	.L29	;,
; src/lexer.c:87:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp412
	cmpb	$9, %al	;, tmp412
	ja	.L89	;,
.L30:
; src/lexer.c:89:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp413
	cmpb	$9, %al	;, tmp413
	jbe	.L30	;,
; src/lexer.c:90:             type = FLOAT;
	movl	$3, %r14d	;, type
	jmp	.L29	;
.L89:
	movl	$3, %r14d	;, type
	jmp	.L29	;
.L104:
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_265(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_265(D)->column
; src/lexer.c:47: }
	jmp	.L35	;
.L34:
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	24(%rbx), %rbp	; lexer_265(D)->line, _53
	movq	%r12, %rsi	; start, tmp435
	notq	%rsi	; tmp435
	addq	8(%rbx), %rsi	; lexer_265(D)->position, tmp437
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r12, %rdi	; start, start
	addq	(%rbx), %rdi	; lexer_265(D)->source, start
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp655, _59
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r14, %rcx	; column_start,
	movq	%rbp, %rdx	; _53,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L8	;
.L103:
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %r13	; lexer_265(D)->position, _411
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %r12	; lexer_265(D)->length, _424
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r12, %r13	; _424, _411
	jnb	.L36	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %r14	; lexer_265(D)->source, _452
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	(%r14,%r13), %edx	; *_453, _8
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%cl	;, _243
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %dl	;, _8
	jne	.L37	;,
	testb	%cl, %cl	; _243
	je	.L37	;,
; src/lexer.c:110:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %r12	; lexer_265(D)->column, _64
.L38:
; src/lexer.c:112:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, c
	je	.L91	;,
	testb	%al, %al	; c
	jne	.L38	;,
.L91:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rax	; lexer_265(D)->position, tmp709
	leaq	-1(%rax), %rsi	;, _464
	movq	%rsi, 8(%rbx)	; _464, lexer_265(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_265(D)->column
; src/lexer.c:114:             if (skip_comment)
	testb	%bpl, %bpl	; skip_comment
	je	.L40	;,
; src/lexer.c:115:                 return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L40:
; src/lexer.c:109:             size_t start = lexer->position + 1;
	addq	$1, %r13	;, start
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %rbx	; lexer_265(D)->line, _69
	subq	%r13, %rsi	; start, tmp449
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r14,%r13), %rdi	;, tmp450
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp659, _74
; src/lexer.c:110:             size_t column_start = lexer->column - 1;
	leaq	-1(%r12), %rcx	;, column_start
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbx, %rdx	; _69,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	;
.L46:
; src/lexer.c:121:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	; lexer_265(D)->position, _467
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r12, %rdx	; _424, _467
	jnb	.L43	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rcx	; lexer_265(D)->source, lexer_265(D)->source
	movzbl	(%rcx,%rdx), %edx	; *_470, p
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	je	.L80	;,
.L44:
; src/lexer.c:124:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	je	.L45	;,
; src/lexer.c:125:                 assert(c != '\0');
	testb	%al, %al	; c
	je	.L107	;,
.L42:
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	jne	.L46	;,
	cmpb	$47, %dl	;, p
	jne	.L46	;,
; src/lexer.c:134:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:135:             if (skip_comment)
	testb	%bpl, %bpl	; skip_comment
	jne	.L83	;,
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	24(%rbx), %rbp	; lexer_265(D)->line, _91
	movq	8(%rbx), %rax	; lexer_265(D)->position, tmp713
	leaq	-2(%rax), %rsi	;, tmp471
	subq	%r13, %rsi	; start, tmp473
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r13, %rdi	; start, start
	addq	(%rbx), %rdi	; lexer_265(D)->source, start
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp666, _97
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r15, %rcx	; column_start,
	movq	%rbp, %rdx	; _91,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L8	;
.L107:
; src/lexer.c:125:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp456
	movl	$125, %edx	;,
	leaq	.LC2(%rip), %rsi	;, tmp457
	leaq	.LC3(%rip), %rdi	;, tmp458
	call	*__assert_fail@GOTPCREL(%rip)	;
.L108:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	;, lexer_265(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_265(D)->column
; src/lexer.c:57: }
	jmp	.L82	;
.L48:
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %rbp	; lexer_265(D)->line, _84
	movq	8(%rbx), %rsi	; lexer_265(D)->position, tmp466
	subq	%r13, %rsi	; start, tmp466
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r13, %rdi	; start, start
	addq	(%rbx), %rdi	; lexer_265(D)->source, start
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp663, _89
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r15, %rcx	; column_start,
	movq	%rbp, %rdx	; _84,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	;
.L83:
; src/lexer.c:136:                 return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L110:
; src/lexer.c:139:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp715
	leaq	-2(%rax), %rcx	;, tmp479
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L111:
; src/lexer.c:142:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp716
	leaq	-2(%rax), %rcx	;, tmp485
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L112:
; src/lexer.c:145:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp717
	leaq	-2(%rax), %rcx	;, tmp491
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L113:
; src/lexer.c:148:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp718
	leaq	-2(%rax), %rcx	;, tmp497
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L114:
; src/lexer.c:151:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp719
	leaq	-2(%rax), %rcx	;, tmp503
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L115:
; src/lexer.c:154:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp720
	leaq	-2(%rax), %rcx	;, tmp509
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L116:
; src/lexer.c:157:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp721
	leaq	-2(%rax), %rcx	;, tmp515
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L117:
; src/lexer.c:160:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp722
	leaq	-2(%rax), %rcx	;, tmp519
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L118:
; src/lexer.c:163:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp723
	leaq	-2(%rax), %rcx	;, tmp525
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L119:
; src/lexer.c:166:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp724
	leaq	-2(%rax), %rcx	;, tmp533
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L120:
; src/lexer.c:169:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp725
	leaq	-2(%rax), %rcx	;, tmp541
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L77:
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp726
	leaq	-1(%rax), %rcx	;, tmp552
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L76:
; src/lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp727
	leaq	-1(%rax), %rcx	;, tmp556
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L63:
; src/lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp728
	leaq	-1(%rax), %rcx	;, tmp560
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L61:
; src/lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp729
	leaq	-1(%rax), %rcx	;, tmp564
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L73:
; src/lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp730
	leaq	-1(%rax), %rcx	;, tmp568
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L79:
; src/lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp731
	leaq	-1(%rax), %rcx	;, tmp572
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L71:
; src/lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp732
	leaq	-1(%rax), %rcx	;, tmp576
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L65:
; src/lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp733
	leaq	-1(%rax), %rcx	;, tmp580
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L64:
; src/lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp734
	leaq	-1(%rax), %rcx	;, tmp584
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L69:
; src/lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp735
	leaq	-1(%rax), %rcx	;, tmp588
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L74:
; src/lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp736
	leaq	-1(%rax), %rcx	;, tmp592
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L72:
; src/lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp737
	leaq	-1(%rax), %rcx	;, tmp596
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L75:
; src/lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp738
	leaq	-1(%rax), %rcx	;, tmp600
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L70:
; src/lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp739
	leaq	-1(%rax), %rcx	;, tmp604
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L78:
; src/lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp740
	leaq	-1(%rax), %rcx	;, tmp608
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L68:
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp741
	leaq	-1(%rax), %rcx	;, tmp612
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L66:
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp742
	leaq	-1(%rax), %rcx	;, tmp616
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L67:
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp743
	leaq	-1(%rax), %rcx	;, tmp620
	movq	24(%rbx), %rdx	; lexer_265(D)->line, lexer_265(D)->line
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L60:
; src/lexer.c:210:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp744
	leaq	-1(%rax), %rdx	;, tmp624
	movq	24(%rbx), %rsi	; lexer_265(D)->line, lexer_265(D)->line
	leaq	.LC5(%rip), %rdi	;, tmp627
	call	lexer_error	;
; src/lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L43:
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L45	;,
; src/lexer.c:40:         return '\0';
	movl	%r14d, %edx	; p, p
.L80:
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_265(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_265(D)->column
; src/lexer.c:47: }
	jmp	.L44	;
.L45:
; src/lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	je	.L108	;,
.L82:
; src/lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rsi	; lexer_265(D)->line, lexer_265(D)->line
	movq	%r13, %rdx	; start,
	leaq	.LC4(%rip), %rdi	;, tmp464
	call	lexer_error	;
; src/lexer.c:130:                 if (skip_comment)
	testb	%bpl, %bpl	; skip_comment
	je	.L48	;,
; src/lexer.c:131:                     return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L109:
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rdx	; lexer_265(D)->source, lexer_265(D)->source
	movzbl	(%rdx,%r13), %edx	; *_440, _8
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%cl	;, _243
.L37:
; src/lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, %dl	;, _8
	jne	.L41	;,
	testb	%cl, %cl	; _243
	je	.L41	;,
; src/lexer.c:118:             size_t start = lexer->position + 1;
	addq	$1, %r13	;, start
; src/lexer.c:119:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rax	; lexer_265(D)->column, tmp710
	leaq	-1(%rax), %r15	;, column_start
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	;, c
; src/lexer.c:40:         return '\0';
	movl	$0, %r14d	;, p
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	jmp	.L42	;
.L20:
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %r13	; lexer_265(D)->position, _411
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %r12	; lexer_265(D)->length, _424
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r12, %r13	; _424, _411
	jb	.L109	;,
.L36:
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%cl	;, _243
; src/lexer.c:40:         return '\0';
	movl	$0, %edx	;, _8
.L41:
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %dl	;, _8
	sete	%sil	;, _99
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L49	;,
	testb	%sil, %sil	; _99
	jne	.L110	;,
.L49:
; src/lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L50	;,
	testb	%sil, %sil	; _99
	jne	.L111	;,
.L50:
; src/lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L51	;,
	testb	%sil, %sil	; _99
	jne	.L112	;,
.L51:
; src/lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L52	;,
	testb	%sil, %sil	; _99
	jne	.L113	;,
.L52:
; src/lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L53	;,
	testb	%sil, %sil	; _99
	jne	.L114	;,
.L53:
; src/lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L54	;,
	testb	%sil, %sil	; _99
	jne	.L115	;,
.L54:
; src/lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L55	;,
	testb	%sil, %sil	; _99
	jne	.L116	;,
.L55:
; src/lexer.c:159:         } else if (c == '/' && p == '=') {
	testb	%sil, %sil	; _99
	je	.L56	;,
	testb	%cl, %cl	; _243
	jne	.L117	;,
.L56:
; src/lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L57	;,
	testb	%sil, %sil	; _99
	jne	.L118	;,
.L57:
; src/lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L58	;,
	cmpb	$38, %dl	;, _8
	je	.L119	;,
.L58:
; src/lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L59	;,
	cmpb	$124, %dl	;, _8
	je	.L120	;,
.L59:
	subl	$33, %eax	;, tmp545
	cmpb	$92, %al	;, tmp545
	ja	.L60	;,
	movzbl	%al, %eax	; tmp545, tmp546
	leaq	.L62(%rip), %rdx	;, tmp547
	movslq	(%rdx,%rax,4), %rax	;, tmp549
	addq	%rdx, %rax	; tmp547, tmp550
	jmp	*%rax	; tmp550
	.section	.rodata
	.align 4
	.align 4
.L62:
	.long	.L79-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L78-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L77-.L62
	.long	.L76-.L62
	.long	.L75-.L62
	.long	.L74-.L62
	.long	.L73-.L62
	.long	.L72-.L62
	.long	.L71-.L62
	.long	.L70-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L69-.L62
	.long	.L68-.L62
	.long	.L67-.L62
	.long	.L66-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L65-.L62
	.long	.L60-.L62
	.long	.L64-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L63-.L62
	.long	.L60-.L62
	.long	.L61-.L62
	.text
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, source
	movq	%rsi, %rbx	; tmp87, length
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:5:     lexer->source = source;
	movq	%rbp, (%rax)	; source, lexer_3->source
; src/lexer.c:6:     lexer->position = 0;
	movq	$0, 8(%rax)	;, lexer_3->position
; src/lexer.c:7:     lexer->length = length;
	movq	%rbx, 16(%rax)	; length, lexer_3->length
; src/lexer.c:8:     lexer->line = 0;
	movq	$0, 24(%rax)	;, lexer_3->line
; src/lexer.c:9:     lexer->column = 0;
	movq	$0, 32(%rax)	;, lexer_3->column
; src/lexer.c:10:     lexer->peeked_token = 0;
	movq	$0, 40(%rax)	;, lexer_3->peeked_token
; src/lexer.c:11:     lexer->peeked_position = 0;
	movq	$0, 48(%rax)	;, lexer_3->peeked_position
; src/lexer.c:12:     lexer->peeked_line = 0;
	movq	$0, 56(%rax)	;, lexer_3->peeked_line
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 64(%rax)	;, lexer_3->peeked_column
; src/lexer.c:14:     lexer->current_token = 0;
	movq	$0, 72(%rax)	;, lexer_3->current_token
; src/lexer.c:16: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp95, lexer
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	40(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	; <retval>
	je	.L124	;,
; src/lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rdi)	; <retval>, lexer_9(D)->current_token
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	48(%rdi), %rdx	; lexer_9(D)->peeked_position, lexer_9(D)->peeked_position
	movq	%rdx, 8(%rdi)	; lexer_9(D)->peeked_position, lexer_9(D)->position
; src/lexer.c:220:         lexer->line = lexer->peeked_line;
	movq	56(%rdi), %rdx	; lexer_9(D)->peeked_line, lexer_9(D)->peeked_line
	movq	%rdx, 24(%rdi)	; lexer_9(D)->peeked_line, lexer_9(D)->line
; src/lexer.c:221:         lexer->column = lexer->peeked_column;
	movq	64(%rdi), %rdx	; lexer_9(D)->peeked_column, lexer_9(D)->peeked_column
	movq	%rdx, 32(%rdi)	; lexer_9(D)->peeked_column, lexer_9(D)->column
; src/lexer.c:222:         lexer->peeked_token = 0;
	movq	$0, 40(%rdi)	;, lexer_9(D)->peeked_token
.L123:
; src/lexer.c:227: }
	popq	%rbx	;
	ret	
.L124:
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_9(D)->current_token
	jmp	.L123	;
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	movq	40(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	; <retval>
	je	.L133	;,
; src/lexer.c:244: }
	ret	
.L133:
; src/lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp98, lexer
; src/lexer.c:232:     size_t saved_position = lexer->position;
	movq	8(%rdi), %r13	; lexer_9(D)->position, saved_position
; src/lexer.c:233:     size_t saved_line = lexer->line;
	movq	24(%rdi), %r12	; lexer_9(D)->line, saved_line
; src/lexer.c:234:     size_t saved_column = lexer->column;
	movq	32(%rdi), %rbp	; lexer_9(D)->column, saved_column
; src/lexer.c:235:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	get_next_token	;
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	8(%rbx), %rdx	; lexer_9(D)->position, lexer_9(D)->position
	movq	%rdx, 48(%rbx)	; lexer_9(D)->position, lexer_9(D)->peeked_position
; src/lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	24(%rbx), %rdx	; lexer_9(D)->line, lexer_9(D)->line
	movq	%rdx, 56(%rbx)	; lexer_9(D)->line, lexer_9(D)->peeked_line
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
	movq	%rdx, 64(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:239:     lexer->position = saved_position;
	movq	%r13, 8(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:240:     lexer->line = saved_line;
	movq	%r12, 24(%rbx)	; saved_line, lexer_9(D)->line
; src/lexer.c:241:     lexer->column = saved_column;
	movq	%rbp, 32(%rbx)	; saved_column, lexer_9(D)->column
; src/lexer.c:242:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:244: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
; src/lexer.c:247:     return lexer->current_token;
	movq	72(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:248: }
	ret	
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
; src/lexer.c:251:     lexer->position = 0;
	movq	$0, 8(%rdi)	;, lexer_2(D)->position
; src/lexer.c:252:     lexer->line = 0;
	movq	$0, 24(%rdi)	;, lexer_2(D)->line
; src/lexer.c:253:     lexer->column = 0;
	movq	$0, 32(%rdi)	;, lexer_2(D)->column
; src/lexer.c:254:     lexer->peeked_token = 0;
	movq	$0, 40(%rdi)	;, lexer_2(D)->peeked_token
; src/lexer.c:255:     lexer->peeked_position = 0;
	movq	$0, 48(%rdi)	;, lexer_2(D)->peeked_position
; src/lexer.c:256:     lexer->peeked_line = 0;
	movq	$0, 56(%rdi)	;, lexer_2(D)->peeked_line
; src/lexer.c:257:     lexer->peeked_column = 0;
	movq	$0, 64(%rdi)	;, lexer_2(D)->peeked_column
; src/lexer.c:258:     lexer->current_token = 0;
	movq	$0, 72(%rdi)	;, lexer_2(D)->current_token
; src/lexer.c:259: }
	ret	
	.size	reset_lexer, .-reset_lexer
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_token"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

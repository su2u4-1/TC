	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	get_current_char, @function
get_current_char:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rdi), %rax	; lexer_11(D)->position, _1
; src/lexer.c:34:         return '\0';
	movl	$0, %edx	;, <retval>
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	24(%rdi), %rax	; lexer_11(D)->length, _1
	jnb	.L1	;,
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rdi)	;, lexer_11(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rdi), %rdx	; lexer_11(D)->source, _5
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, tmp91
	movq	%rcx, 16(%rdi)	; tmp91, lexer_11(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rdx,%rax), %edx	; *_7, <retval>
.L1:
; src/lexer.c:37: }
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
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:21:     token->type = type;
	movl	%r13d, 24(%rax)	; type, token_3->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%r12, (%rax)	; lexeme, token_3->lexeme
; src/lexer.c:23:     token->line = line;
	movq	%rbp, 8(%rax)	; line, token_3->line
; src/lexer.c:24:     token->column = column;
	movq	%rbx, 16(%rax)	; column, token_3->column
; src/lexer.c:26: }
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
	.string	"[Lexer Error] at %s:%zu:%zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	subq	$16, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rdi	; tmp93
	leaq	1(%rdx), %r9	;,
	leaq	1(%rsi), %r8	;,
	leaq	.LC0(%rip), %rdx	;, tmp92
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:30: }
	addq	$24, %rsp	;,
	ret	
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Unterminated string literal"
	.section	.rodata
.LC2:
	.string	""
	.string	""
	.section	.rodata.str1.1
.LC3:
	.string	"src/lexer.c"
.LC4:
	.string	"c != '\\0'"
.LC5:
	.string	"Unterminated comment"
.LC6:
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
	movq	%rdi, %rbx	; tmp630, lexer
	movl	%esi, %ebp	; tmp631, skip_comment
; src/lexer.c:61:     char c = get_current_char(lexer);
	call	get_current_char	;
	cmpb	$32, %al	;, c
	ja	.L9	;,
	movzbl	%al, %edx	; c, c
	leaq	.L11(%rip), %rcx	;, tmp381
	movslq	(%rcx,%rdx,4), %rdx	;, tmp383
	addq	%rcx, %rdx	; tmp381, tmp384
	jmp	*%rdx	; tmp384
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
; src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	40(%rbx), %rcx	; lexer_263(D)->column, lexer_263(D)->column
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
.L8:
; src/lexer.c:216: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L10:
; src/lexer.c:65:         return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L12:
; src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	;, lexer_263(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_263(D)->column
; src/lexer.c:68:         return next_token(lexer, skip_comment);
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
; src/lexer.c:96:         size_t start = lexer->position;
	movq	16(%rbx), %r12	; lexer_263(D)->position, start
; src/lexer.c:97:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp699
	leaq	-1(%rax), %r13	;, column_start
; src/lexer.c:98:         c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	movl	%eax, %ebp	; tmp646, c
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	;, c
	ja	.L31	;,
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %rax	;, tmp419
	btq	%rbp, %rax	; c, tmp419
	jc	.L32	;,
.L31:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %r14	;, tmp628
.L96:
; src/lexer.c:100:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	movl	%eax, %ebp	; tmp647, c
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	;, c
	ja	.L96	;,
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rbp, %r14	; c, tmp628
	jnc	.L96	;,
.L32:
; src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %bpl	;, c
	jne	.L104	;,
.L34:
; src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rsi	; lexer_263(D)->position, _48
	subq	%r12, %rsi	; start, _48
; src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rsi	;, _48
	je	.L105	;,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbx), %rbp	; lexer_263(D)->line, _51
	subq	$1, %rsi	;, tmp431
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r12, %rdi	; start, start
	addq	8(%rbx), %rdi	; lexer_263(D)->source, start
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp650, _55
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%rbp, %rdx	; _51,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L8	;
.L15:
	leal	-65(%rax), %edx	;, _90
	cmpb	$57, %dl	;, _90
	ja	.L20	;,
	movabsq	$288230372997595135, %rcx	;, tmp392
	btq	%rdx, %rcx	; _90, tmp392
	jnc	.L20	;,
; src/lexer.c:70:         size_t start = lexer->position - 1;
	movq	16(%rbx), %r14	; lexer_263(D)->position, _11
; src/lexer.c:70:         size_t start = lexer->position - 1;
	leaq	-1(%r14), %r13	;, start
; src/lexer.c:71:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rcx	; lexer_263(D)->column, tmp695
	leaq	-1(%rcx), %r12	;, column_start
	movabsq	$288230372997595135, %rbp	;, tmp629
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L22	;
.L106:
	cmpb	$47, %al	;, c
	jle	.L25	;,
.L24:
; src/lexer.c:73:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
.L22:
	cmpb	$57, %al	;, c
	jle	.L106	;,
	subl	$65, %eax	;, _19
	cmpb	$57, %al	;, _19
	ja	.L25	;,
	btq	%rax, %rbp	; _19, tmp629
	jc	.L24	;,
.L25:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rsi	; lexer_263(D)->position, _423
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp399
	movq	%rax, 16(%rbx)	; tmp399, lexer_263(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	;, lexer_263(D)->column
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r14, %rsi	; _11, tmp400
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r13, %rdi	; start, start
	addq	8(%rbx), %rdi	; lexer_263(D)->source, start
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp637, content
; src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	call	*is_keyword@GOTPCREL(%rip)	;
; src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	; tmp638
	je	.L27	;,
; src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	%r12, %rcx	; column_start,
	movq	%rbp, %rsi	; content,
	movl	$6, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L27:
; src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	%r12, %rcx	; column_start,
	movq	%rbp, %rsi	; content,
	movl	$1, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L16:
; src/lexer.c:81:         size_t start = lexer->position - 1;
	movq	16(%rbx), %r13	; lexer_263(D)->position, _26
; src/lexer.c:81:         size_t start = lexer->position - 1;
	leaq	-1(%r13), %r12	;, start
; src/lexer.c:82:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp697
	leaq	-1(%rax), %rbp	;, column_start
.L28:
; src/lexer.c:84:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	;, tmp406
	cmpb	$9, %dl	;, tmp406
	jbe	.L28	;,
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	; lexer_263(D)->position, _429
; src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r14d	;, type
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	24(%rbx), %rdx	; lexer_263(D)->length, _429
	jnb	.L29	;,
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	je	.L107	;,
.L29:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rsi	; lexer_263(D)->position, _440
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp412
	movq	%rax, 16(%rbx)	; tmp412, lexer_263(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	;, lexer_263(D)->column
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %r15	; lexer_263(D)->line, _34
	subq	%r13, %rsi	; _26, tmp413
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r12, %rdi	; start, start
	addq	8(%rbx), %rdi	; lexer_263(D)->source, start
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp644, _39
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbp, %rcx	; column_start,
	movq	%r15, %rdx	; _34,
	movl	%r14d, %edi	; type,
	call	create_token	;
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	;
.L107:
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rax	; lexer_263(D)->source, lexer_263(D)->source
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rax,%rdx), %eax	; *_432, *_432
	subl	$48, %eax	;, tmp408
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp408
	ja	.L29	;,
; src/lexer.c:88:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp410
	cmpb	$9, %al	;, tmp410
	ja	.L89	;,
.L30:
; src/lexer.c:90:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp411
	cmpb	$9, %al	;, tmp411
	jbe	.L30	;,
; src/lexer.c:91:             type = FLOAT;
	movl	$3, %r14d	;, type
	jmp	.L29	;
.L89:
	movl	$3, %r14d	;, type
	jmp	.L29	;
.L104:
; src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	(%rbx), %rcx	; lexer_263(D)->filename, lexer_263(D)->filename
	leaq	-1(%r12), %rdx	;, tmp426
	movq	32(%rbx), %rsi	; lexer_263(D)->line, lexer_263(D)->line
	leaq	.LC1(%rip), %rdi	;, tmp428
	call	lexer_error	;
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, %bpl	;, c
	jne	.L34	;,
; src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	;, lexer_263(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_263(D)->column
; src/lexer.c:48: }
	jmp	.L34	;
.L105:
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	32(%rbx), %rbx	; lexer_263(D)->line, _49
	leaq	.LC2(%rip), %rdi	;, tmp430
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp648, _50
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%rbx, %rdx	; _49,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	jmp	.L8	;
.L103:
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %r13	; lexer_263(D)->position, _391
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %r12	; lexer_263(D)->length, _399
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%r12, %r13	; _399, _391
	jnb	.L36	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %r14	; lexer_263(D)->source, _450
; src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	(%r14,%r13), %edx	; *_451, _8
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%cl	;, _241
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %dl	;, _8
	jne	.L37	;,
	testb	%cl, %cl	; _241
	je	.L37	;,
; src/lexer.c:112:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %r12	; lexer_263(D)->column, _60
.L38:
; src/lexer.c:114:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, c
	je	.L91	;,
	testb	%al, %al	; c
	jne	.L38	;,
.L91:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rax	; lexer_263(D)->position, tmp702
	leaq	-1(%rax), %rsi	;, _462
	movq	%rsi, 16(%rbx)	; _462, lexer_263(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	;, lexer_263(D)->column
; src/lexer.c:116:             if (skip_comment)
	testb	%bpl, %bpl	; skip_comment
	je	.L40	;,
; src/lexer.c:117:                 return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L40:
; src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$1, %r13	;, start
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %rbx	; lexer_263(D)->line, _65
	subq	%r13, %rsi	; start, tmp443
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r14,%r13), %rdi	;, tmp444
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp654, _70
; src/lexer.c:112:             size_t column_start = lexer->column - 1;
	leaq	-1(%r12), %rcx	;, column_start
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbx, %rdx	; _65,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	;
.L46:
; src/lexer.c:123:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	; lexer_263(D)->position, _465
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%r12, %rdx	; _399, _465
	jnb	.L43	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rcx	; lexer_263(D)->source, lexer_263(D)->source
	movzbl	(%rcx,%rdx), %edx	; *_468, p
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	je	.L80	;,
.L44:
; src/lexer.c:126:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	je	.L45	;,
; src/lexer.c:127:                 assert(c != '\0');
	testb	%al, %al	; c
	je	.L108	;,
.L42:
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	jne	.L46	;,
	cmpb	$47, %dl	;, p
	jne	.L46	;,
; src/lexer.c:136:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:137:             if (skip_comment)
	testb	%bpl, %bpl	; skip_comment
	jne	.L83	;,
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rbx), %rbp	; lexer_263(D)->line, _88
	movq	16(%rbx), %rax	; lexer_263(D)->position, tmp706
	leaq	-2(%rax), %rsi	;, tmp466
	subq	%r13, %rsi	; start, tmp468
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r13, %rdi	; start, start
	addq	8(%rbx), %rdi	; lexer_263(D)->source, start
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp661, _94
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r15, %rcx	; column_start,
	movq	%rbp, %rdx	; _88,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L8	;
.L108:
; src/lexer.c:127:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp450
	movl	$127, %edx	;,
	leaq	.LC3(%rip), %rsi	;, tmp451
	leaq	.LC4(%rip), %rdi	;, tmp452
	call	*__assert_fail@GOTPCREL(%rip)	;
.L109:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	$1, 16(%rbx)	;, lexer_263(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	;, lexer_263(D)->column
; src/lexer.c:58: }
	jmp	.L82	;
.L48:
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %rbp	; lexer_263(D)->line, _81
	movq	16(%rbx), %rsi	; lexer_263(D)->position, tmp461
	subq	%r13, %rsi	; start, tmp461
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r13, %rdi	; start, start
	addq	8(%rbx), %rdi	; lexer_263(D)->source, start
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp658, _86
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r15, %rcx	; column_start,
	movq	%rbp, %rdx	; _81,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	;
.L83:
; src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L111:
; src/lexer.c:141:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp708
	leaq	-2(%rax), %rcx	;, tmp474
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L112:
; src/lexer.c:144:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp709
	leaq	-2(%rax), %rcx	;, tmp480
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L113:
; src/lexer.c:147:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp710
	leaq	-2(%rax), %rcx	;, tmp486
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L114:
; src/lexer.c:150:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp711
	leaq	-2(%rax), %rcx	;, tmp492
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L115:
; src/lexer.c:153:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp712
	leaq	-2(%rax), %rcx	;, tmp498
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L116:
; src/lexer.c:156:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp713
	leaq	-2(%rax), %rcx	;, tmp504
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L117:
; src/lexer.c:159:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp714
	leaq	-2(%rax), %rcx	;, tmp510
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L118:
; src/lexer.c:162:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp715
	leaq	-2(%rax), %rcx	;, tmp514
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L119:
; src/lexer.c:165:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp716
	leaq	-2(%rax), %rcx	;, tmp520
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L120:
; src/lexer.c:168:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp717
	leaq	-2(%rax), %rcx	;, tmp528
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L121:
; src/lexer.c:171:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp718
	leaq	-2(%rax), %rcx	;, tmp536
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L77:
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp719
	leaq	-1(%rax), %rcx	;, tmp547
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L76:
; src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp720
	leaq	-1(%rax), %rcx	;, tmp551
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L63:
; src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp721
	leaq	-1(%rax), %rcx	;, tmp555
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L61:
; src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp722
	leaq	-1(%rax), %rcx	;, tmp559
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L73:
; src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp723
	leaq	-1(%rax), %rcx	;, tmp563
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L79:
; src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp724
	leaq	-1(%rax), %rcx	;, tmp567
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L71:
; src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp725
	leaq	-1(%rax), %rcx	;, tmp571
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L65:
; src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp726
	leaq	-1(%rax), %rcx	;, tmp575
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L64:
; src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp727
	leaq	-1(%rax), %rcx	;, tmp579
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L69:
; src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp728
	leaq	-1(%rax), %rcx	;, tmp583
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L74:
; src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp729
	leaq	-1(%rax), %rcx	;, tmp587
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L72:
; src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp730
	leaq	-1(%rax), %rcx	;, tmp591
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L75:
; src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp731
	leaq	-1(%rax), %rcx	;, tmp595
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L70:
; src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp732
	leaq	-1(%rax), %rcx	;, tmp599
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L78:
; src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp733
	leaq	-1(%rax), %rcx	;, tmp603
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L68:
; src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp734
	leaq	-1(%rax), %rcx	;, tmp607
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L66:
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp735
	leaq	-1(%rax), %rcx	;, tmp611
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L67:
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp736
	leaq	-1(%rax), %rcx	;, tmp615
	movq	32(%rbx), %rdx	; lexer_263(D)->line, lexer_263(D)->line
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L60:
; src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp737
	leaq	-1(%rax), %rdx	;, tmp619
	movq	32(%rbx), %rsi	; lexer_263(D)->line, lexer_263(D)->line
	movq	(%rbx), %rcx	; lexer_263(D)->filename,
	leaq	.LC6(%rip), %rdi	;, tmp622
	call	lexer_error	;
; src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
	jmp	.L8	;
.L43:
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L45	;,
; src/lexer.c:41:         return '\0';
	movl	%r14d, %edx	; p, p
.L80:
; src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	;, lexer_263(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_263(D)->column
; src/lexer.c:48: }
	jmp	.L44	;
.L45:
; src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	je	.L109	;,
.L82:
; src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	(%rbx), %rcx	; lexer_263(D)->filename, lexer_263(D)->filename
	movq	32(%rbx), %rsi	; lexer_263(D)->line, lexer_263(D)->line
	movq	%r13, %rdx	; start,
	leaq	.LC5(%rip), %rdi	;, tmp459
	call	lexer_error	;
; src/lexer.c:132:                 if (skip_comment)
	testb	%bpl, %bpl	; skip_comment
	je	.L48	;,
; src/lexer.c:133:                     return next_token(lexer, skip_comment);
	movsbl	%bpl, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
	call	next_token	;
	jmp	.L8	;
.L110:
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rdx	; lexer_263(D)->source, lexer_263(D)->source
	movzbl	(%rdx,%r13), %edx	; *_436, _8
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%cl	;, _241
.L37:
; src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %dl	;, _8
	jne	.L41	;,
	testb	%cl, %cl	; _241
	je	.L41	;,
; src/lexer.c:120:             size_t start = lexer->position + 1;
	addq	$1, %r13	;, start
; src/lexer.c:121:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	; lexer_263(D)->column, tmp703
	leaq	-1(%rax), %r15	;, column_start
; src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %eax	;, c
; src/lexer.c:41:         return '\0';
	movl	$0, %r14d	;, p
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	jmp	.L42	;
.L20:
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %r13	; lexer_263(D)->position, _391
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %r12	; lexer_263(D)->length, _399
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%r12, %r13	; _399, _391
	jb	.L110	;,
.L36:
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%cl	;, _241
; src/lexer.c:41:         return '\0';
	movl	$0, %edx	;, _8
.L41:
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %dl	;, _8
	sete	%sil	;, _96
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L49	;,
	testb	%sil, %sil	; _96
	jne	.L111	;,
.L49:
; src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L50	;,
	testb	%sil, %sil	; _96
	jne	.L112	;,
.L50:
; src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L51	;,
	testb	%sil, %sil	; _96
	jne	.L113	;,
.L51:
; src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L52	;,
	testb	%sil, %sil	; _96
	jne	.L114	;,
.L52:
; src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L53	;,
	testb	%sil, %sil	; _96
	jne	.L115	;,
.L53:
; src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L54	;,
	testb	%sil, %sil	; _96
	jne	.L116	;,
.L54:
; src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L55	;,
	testb	%sil, %sil	; _96
	jne	.L117	;,
.L55:
; src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%sil, %sil	; _96
	je	.L56	;,
	testb	%cl, %cl	; _241
	jne	.L118	;,
.L56:
; src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L57	;,
	testb	%sil, %sil	; _96
	jne	.L119	;,
.L57:
; src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L58	;,
	cmpb	$38, %dl	;, _8
	je	.L120	;,
.L58:
; src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L59	;,
	cmpb	$124, %dl	;, _8
	je	.L121	;,
.L59:
	subl	$33, %eax	;, tmp540
	cmpb	$92, %al	;, tmp540
	ja	.L60	;,
	movzbl	%al, %eax	; tmp540, tmp541
	leaq	.L62(%rip), %rdx	;, tmp542
	movslq	(%rdx,%rax,4), %rax	;, tmp544
	addq	%rdx, %rax	; tmp542, tmp545
	jmp	*%rax	; tmp545
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
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r12	; tmp87, source
	movq	%rsi, %rbp	; tmp88, length
	movq	%rdx, %rbx	; tmp89, filename
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:5:     lexer->source = source;
	movq	%r12, 8(%rax)	; source, lexer_3->source
; src/lexer.c:6:     lexer->position = 0;
	movq	$0, 16(%rax)	;, lexer_3->position
; src/lexer.c:7:     lexer->length = length;
	movq	%rbp, 24(%rax)	; length, lexer_3->length
; src/lexer.c:8:     lexer->line = 0;
	movq	$0, 32(%rax)	;, lexer_3->line
; src/lexer.c:9:     lexer->column = 0;
	movq	$0, 40(%rax)	;, lexer_3->column
; src/lexer.c:10:     lexer->peeked_token = NULL;
	movq	$0, 48(%rax)	;, lexer_3->peeked_token
; src/lexer.c:11:     lexer->peeked_position = 0;
	movq	$0, 56(%rax)	;, lexer_3->peeked_position
; src/lexer.c:12:     lexer->peeked_line = 0;
	movq	$0, 64(%rax)	;, lexer_3->peeked_line
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 72(%rax)	;, lexer_3->peeked_column
; src/lexer.c:14:     lexer->current_token = NULL;
	movq	$0, 80(%rax)	;, lexer_3->current_token
; src/lexer.c:15:     lexer->filename = filename;
	movq	%rbx, (%rax)	; filename, lexer_3->filename
; src/lexer.c:17: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp95, lexer
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	48(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L125	;,
; src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rdi)	; <retval>, lexer_9(D)->current_token
; src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	56(%rdi), %rdx	; lexer_9(D)->peeked_position, lexer_9(D)->peeked_position
	movq	%rdx, 16(%rdi)	; lexer_9(D)->peeked_position, lexer_9(D)->position
; src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	64(%rdi), %rdx	; lexer_9(D)->peeked_line, lexer_9(D)->peeked_line
	movq	%rdx, 32(%rdi)	; lexer_9(D)->peeked_line, lexer_9(D)->line
; src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	72(%rdi), %rdx	; lexer_9(D)->peeked_column, lexer_9(D)->peeked_column
	movq	%rdx, 40(%rdi)	; lexer_9(D)->peeked_column, lexer_9(D)->column
; src/lexer.c:224:         lexer->peeked_token = 0;
	movq	$0, 48(%rdi)	;, lexer_9(D)->peeked_token
.L124:
; src/lexer.c:229: }
	popq	%rbx	;
	ret	
.L125:
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	; <retval>, lexer_9(D)->current_token
	jmp	.L124	;
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	48(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; <retval>
	je	.L134	;,
; src/lexer.c:246: }
	ret	
.L134:
; src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp98, lexer
; src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rdi), %r13	; lexer_9(D)->position, saved_position
; src/lexer.c:235:     size_t saved_line = lexer->line;
	movq	32(%rdi), %r12	; lexer_9(D)->line, saved_line
; src/lexer.c:236:     size_t saved_column = lexer->column;
	movq	40(%rdi), %rbp	; lexer_9(D)->column, saved_column
; src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	get_next_token	;
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	16(%rbx), %rdx	; lexer_9(D)->position, lexer_9(D)->position
	movq	%rdx, 56(%rbx)	; lexer_9(D)->position, lexer_9(D)->peeked_position
; src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	32(%rbx), %rdx	; lexer_9(D)->line, lexer_9(D)->line
	movq	%rdx, 64(%rbx)	; lexer_9(D)->line, lexer_9(D)->peeked_line
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
	movq	%rdx, 72(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:241:     lexer->position = saved_position;
	movq	%r13, 16(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:242:     lexer->line = saved_line;
	movq	%r12, 32(%rbx)	; saved_line, lexer_9(D)->line
; src/lexer.c:243:     lexer->column = saved_column;
	movq	%rbp, 40(%rbx)	; saved_column, lexer_9(D)->column
; src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:246: }
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
; src/lexer.c:249:     return lexer->current_token;
	movq	80(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:250: }
	ret	
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
; src/lexer.c:253:     lexer->position = 0;
	movq	$0, 16(%rdi)	;, lexer_2(D)->position
; src/lexer.c:254:     lexer->line = 0;
	movq	$0, 32(%rdi)	;, lexer_2(D)->line
; src/lexer.c:255:     lexer->column = 0;
	movq	$0, 40(%rdi)	;, lexer_2(D)->column
; src/lexer.c:256:     lexer->peeked_token = NULL;
	movq	$0, 48(%rdi)	;, lexer_2(D)->peeked_token
; src/lexer.c:257:     lexer->peeked_position = 0;
	movq	$0, 56(%rdi)	;, lexer_2(D)->peeked_position
; src/lexer.c:258:     lexer->peeked_line = 0;
	movq	$0, 64(%rdi)	;, lexer_2(D)->peeked_line
; src/lexer.c:259:     lexer->peeked_column = 0;
	movq	$0, 72(%rdi)	;, lexer_2(D)->peeked_column
; src/lexer.c:260:     lexer->current_token = NULL;
	movq	$0, 80(%rdi)	;, lexer_2(D)->current_token
; src/lexer.c:261: }
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

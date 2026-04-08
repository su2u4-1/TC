	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	get_current_char, @function
get_current_char:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rdi), %rax	; lexer_11(D)->position, _1
; src/lexer.c:34:         return '\0';
	xorl	%edx, %edx	; <retval>
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	24(%rdi), %rax	; lexer_11(D)->length, _1
	jnb	.L1	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rdi), %rdx	; lexer_11(D)->source, _5
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, tmp91
; src/lexer.c:35:     lexer->column++;
	incq	40(%rdi)	; lexer_11(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rcx, 16(%rdi)	; tmp91, lexer_11(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movb	(%rdx,%rax), %dl	; *_7, <retval>
.L1:
; src/lexer.c:37: }
	movl	%edx, %eax	; <retval>,
	ret	
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
	pushq	%r13	;
	movl	%edi, %r13d	; tmp88, type
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:19: static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, lexeme
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, line
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, column
	pushq	%rax	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
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
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_token, .-create_token
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"[Lexer Error] at %s:%zu:%zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	subq	$16, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rdx), %r9	;,
	leaq	1(%rsi), %r8	;,
	xorl	%eax, %eax	;
	pushq	%rdi	; tmp93
	leaq	.LC0(%rip), %rdx	;, tmp92
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:30: }
	addq	$24, %rsp	;,
	ret	
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1
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
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp500, lexer
	subq	$24, %rsp	;,
; src/lexer.c:61:     char c = get_current_char(lexer);
	call	get_current_char	;
; src/lexer.c:62:     if (c == '\0')
	testb	%al, %al	; c
	jne	.L10	;,
; src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	40(%rdi), %rcx	; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rdi), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	jmp	.L186	;
.L10:
; src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	movl	%eax, %edx	; c, tmp319
	movl	%esi, %r12d	; tmp501, skip_comment
	andl	$-5, %edx	;, tmp319
; src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, %dl	;, tmp319
	je	.L187	;,
	cmpb	$32, %al	;, c
	je	.L187	;,
; src/lexer.c:66:     else if (c == '\n') {
	cmpb	$10, %al	;, c
	jne	.L13	;,
; src/lexer.c:46:     lexer->line++;
	incq	32(%rdi)	; lexer_267(D)->line
; src/lexer.c:47:     lexer->column = 0;
	xorl	%edi, %edi	;
	movq	%rdi, 40(%rbx)	;, lexer_267(D)->column
.L187:
; src/lexer.c:216: }
	addq	$24, %rsp	;,
; src/lexer.c:68:         return next_token(lexer, skip_comment);
	movsbl	%r12b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:216: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/lexer.c:68:         return next_token(lexer, skip_comment);
	jmp	next_token	;
.L13:
; src/lexer.c:70:         size_t start = lexer->position - 1;
	movq	16(%rdi), %rbp	; lexer_267(D)->position, pretmp_451
	cmpb	$57, %al	;, c
	jg	.L14	;,
	cmpb	$47, %al	;, c
	jg	.L15	;,
	cmpb	$34, %al	;, c
	jne	.L17	;,
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rsi	;, tmp498
; src/lexer.c:97:         size_t column_start = lexer->column - 1;
	movq	40(%rdi), %rax	; lexer_267(D)->column, tmp524
	leaq	-1(%rax), %r13	;, column_start
; src/lexer.c:98:         c = get_current_char(lexer);
	call	get_current_char	;
	movl	%eax, %r12d	; tmp510, c
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L30	;
.L14:
	leal	-65(%rax), %edx	;, _232
	cmpb	$57, %dl	;, _232
	ja	.L17	;,
	movabsq	$288230372997595135, %rsi	;, tmp328
	btq	%rdx, %rsi	; _232, tmp328
	jnc	.L17	;,
; src/lexer.c:71:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rcx	; lexer_267(D)->column, tmp521
; src/lexer.c:70:         size_t start = lexer->position - 1;
	leaq	-1(%rbp), %r8	;, start
; src/lexer.c:71:         size_t column_start = lexer->column - 1;
	leaq	-1(%rcx), %r12	;, column_start
.L20:
	cmpb	$57, %al	;, c
	jg	.L21	;,
	cmpb	$47, %al	;, c
	jle	.L23	;,
.L22:
; src/lexer.c:73:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	jmp	.L20	;
.L21:
	subl	$65, %eax	;, _236
	cmpb	$57, %al	;, _236
	ja	.L23	;,
	btq	%rax, %rsi	; _236, tmp328
	jc	.L22	;,
.L23:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rsi	; lexer_267(D)->position, _423
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	8(%rbx), %rdi	; lexer_267(D)->source, start
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	; lexer_267(D)->column
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp335
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	addq	%r8, %rdi	; start, start
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rbp, %rsi	; pretmp_451, tmp336
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rax, 16(%rbx)	; tmp335, lexer_267(D)->position
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	movq	%rax, 8(%rsp)	; content, %sfp
	call	*is_keyword@GOTPCREL(%rip)	;
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
; src/lexer.c:76:         if (is_keyword(content))
	movq	8(%rsp), %rsi	; %sfp, content
; src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	%r12, %rcx	; column_start,
; src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	; tmp505
; src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	movl	$6, %edi	;,
; src/lexer.c:76:         if (is_keyword(content))
	jne	.L188	;,
; src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movl	$1, %edi	;,
	jmp	.L188	;
.L15:
; src/lexer.c:82:         size_t column_start = lexer->column - 1;
	movq	40(%rdi), %rax	; lexer_267(D)->column, tmp523
; src/lexer.c:81:         size_t start = lexer->position - 1;
	leaq	-1(%rbp), %r9	;, start
; src/lexer.c:82:         size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %r12	;, column_start
.L26:
; src/lexer.c:84:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	;, tmp342
	cmpb	$9, %dl	;, tmp342
	jbe	.L26	;,
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	; lexer_267(D)->position, _429
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	8(%rbx), %r8	; lexer_267(D)->source, pretmp_270
; src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	24(%rbx), %rdx	; lexer_267(D)->length, _429
	jnb	.L27	;,
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	jne	.L27	;,
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movb	(%r8,%rdx), %al	; *_432, *_432
	subl	$48, %eax	;, tmp343
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp343
	ja	.L27	;,
.L185:
; src/lexer.c:90:                 c = get_current_char(lexer);
	call	get_current_char	;
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp345
	cmpb	$9, %al	;, tmp345
	ja	.L193	;,
; src/lexer.c:90:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	jmp	.L185	;
.L193:
; src/lexer.c:91:             type = FLOAT;
	movl	$3, %r13d	;, type
.L27:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rsi	; lexer_267(D)->position, _435
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	; lexer_267(D)->column
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r8,%r9), %rdi	;, tmp348
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp346
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rbp, %rsi	; pretmp_451, tmp347
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rax, 16(%rbx)	; tmp346, lexer_267(D)->position
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %rbx	; lexer_267(D)->line, _37
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r12, %rcx	; column_start,
	movl	%r13d, %edi	; type,
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; tmp509, _42
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbx, %rdx	; _37,
	jmp	.L188	;
.L195:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r12, %rsi	; c, tmp498
	jnc	.L194	;,
.L31:
; src/lexer.c:100:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	movl	%eax, %r12d	; tmp511, c
.L30:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r12b	;, c
	ja	.L31	;,
	jmp	.L195	;
.L194:
; src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	32(%rbx), %rsi	; lexer_267(D)->line, pretmp_348
; src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %r12b	;, c
	je	.L33	;,
; src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	(%rbx), %rcx	; lexer_267(D)->filename,
	leaq	-1(%rbp), %rdx	;, tmp354
	leaq	.LC1(%rip), %rdi	;, tmp355
	call	lexer_error	;
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, %r12b	;, c
	jne	.L33	;,
; src/lexer.c:47:     lexer->column = 0;
	xorl	%esi, %esi	;
; src/lexer.c:46:     lexer->line++;
	incq	32(%rbx)	; lexer_267(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	%rsi, 40(%rbx)	;, lexer_267(D)->column
.L33:
; src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rsi	; lexer_267(D)->position, _51
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	32(%rbx), %r12	; lexer_267(D)->line, pretmp_481
	leaq	.LC2(%rip), %rdi	;, tmp357
; src/lexer.c:105:         if (lexer->position - start == 1)
	subq	%rbp, %rsi	; pretmp_451, _51
; src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rsi	;, _51
	je	.L190	;,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	8(%rbx), %rdi	; lexer_267(D)->source, pretmp_451
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	decq	%rsi	; tmp358
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; pretmp_451, pretmp_451
.L190:
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%r12, %rdx	; pretmp_481,
	movl	$4, %edi	;,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rsi	; tmp513, _58
	jmp	.L188	;
.L17:
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %r8	; lexer_267(D)->length, _444
; src/lexer.c:41:         return '\0';
	xorl	%ecx, %ecx	; _448
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%r8, %rbp	; _444, pretmp_451
	jnb	.L36	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rdx	; lexer_267(D)->source, lexer_267(D)->source
	movb	(%rdx,%rbp), %cl	; *_446, _448
.L36:
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%sil	;, tmp362
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %cl	;, _448
	jne	.L37	;,
	testb	%sil, %sil	; tmp362
	je	.L37	;,
; src/lexer.c:112:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %r13	; lexer_267(D)->column, _63
.L38:
; src/lexer.c:114:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, c
	je	.L93	;,
	testb	%al, %al	; c
	jne	.L38	;,
.L93:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rax	; lexer_267(D)->position, tmp527
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	; lexer_267(D)->column
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rax), %rsi	;, _452
	movq	%rsi, 16(%rbx)	; _452, lexer_267(D)->position
; src/lexer.c:116:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L187	;,
; src/lexer.c:111:             size_t start = lexer->position + 1;
	leaq	1(%rbp), %rdi	;, start
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %rbp	; lexer_267(D)->line, _68
	subq	%rdi, %rsi	; start, tmp371
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	8(%rbx), %rdi	; lexer_267(D)->source, tmp372
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:112:             size_t column_start = lexer->column - 1;
	leaq	-1(%r13), %rcx	;, column_start
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbp, %rdx	; _68,
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; tmp515, _73
	jmp	.L191	;
.L37:
; src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %cl	;, _448
	jne	.L41	;,
	testb	%sil, %sil	; tmp362
	je	.L41	;,
; src/lexer.c:121:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp528
; src/lexer.c:120:             size_t start = lexer->position + 1;
	incq	%rbp	; start
; src/lexer.c:109:         char p = peek_next_char(lexer);
	movb	$42, %dl	;, p
; src/lexer.c:121:             size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %r13	;, column_start
; src/lexer.c:61:     char c = get_current_char(lexer);
	movb	$47, %al	;, c
.L42:
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	je	.L196	;,
.L46:
; src/lexer.c:123:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	; lexer_267(D)->position, _455
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%r8, %rdx	; _444, _455
	jnb	.L43	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rcx	; lexer_267(D)->source, lexer_267(D)->source
	movb	(%rcx,%rdx), %dl	; *_458, p
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L44	;,
	jmp	.L82	;
.L43:
	cmpb	$10, %al	;, c
	jne	.L45	;,
; src/lexer.c:41:         return '\0';
	xorl	%edx, %edx	; p
.L82:
; src/lexer.c:47:     lexer->column = 0;
	xorl	%ecx, %ecx	;
; src/lexer.c:46:     lexer->line++;
	incq	32(%rbx)	; lexer_267(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	%rcx, 40(%rbx)	;, lexer_267(D)->column
.L44:
; src/lexer.c:126:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	je	.L45	;,
; src/lexer.c:127:                 assert(c != '\0');
	testb	%al, %al	; c
	jne	.L42	;,
; src/lexer.c:127:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp379
	movl	$127, %edx	;,
	leaq	.LC3(%rip), %rsi	;, tmp380
	leaq	.LC4(%rip), %rdi	;, tmp381
	call	*__assert_fail@GOTPCREL(%rip)	;
.L196:
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$47, %dl	;, p
	jne	.L46	;,
	jmp	.L197	;
.L45:
; src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	jne	.L86	;,
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	decq	16(%rbx)	; lexer_267(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	; lexer_267(D)->column
.L86:
; src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	32(%rbx), %rsi	; lexer_267(D)->line, lexer_267(D)->line
	movq	(%rbx), %rcx	; lexer_267(D)->filename,
	movq	%rbp, %rdx	; start,
	leaq	.LC5(%rip), %rdi	;, tmp387
	call	lexer_error	;
; src/lexer.c:132:                 if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L187	;,
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %r12	; lexer_267(D)->line, _84
	movq	16(%rbx), %rsi	; lexer_267(D)->position, tmp389
.L192:
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	8(%rbx), %rdi	; lexer_267(D)->source, start
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rbp, %rsi	; start, tmp396
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rbp, %rdi	; start, start
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%r12, %rdx	; _91,
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rsi	; tmp518, _97
.L191:
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movl	$7, %edi	;,
	jmp	.L188	;
.L41:
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %cl	;, _448
	sete	%dl	;, tmp399
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L49	;,
	testb	%dl, %dl	; tmp399
	je	.L49	;,
; src/lexer.c:141:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp533
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp402
	jmp	.L189	;
.L49:
; src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L50	;,
	testb	%dl, %dl	; tmp399
	je	.L50	;,
; src/lexer.c:144:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp534
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp408
	jmp	.L189	;
.L50:
; src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L51	;,
	testb	%dl, %dl	; tmp399
	je	.L51	;,
; src/lexer.c:147:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp535
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp414
	jmp	.L189	;
.L51:
; src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L52	;,
	testb	%dl, %dl	; tmp399
	je	.L52	;,
; src/lexer.c:150:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp536
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp420
	jmp	.L189	;
.L52:
; src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L53	;,
	testb	%dl, %dl	; tmp399
	je	.L53	;,
; src/lexer.c:153:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp537
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp426
	jmp	.L189	;
.L53:
; src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L54	;,
	testb	%dl, %dl	; tmp399
	je	.L54	;,
; src/lexer.c:156:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp538
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp432
	jmp	.L189	;
.L54:
; src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L55	;,
	testb	%dl, %dl	; tmp399
	je	.L55	;,
; src/lexer.c:159:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp539
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp438
	jmp	.L189	;
.L55:
; src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%sil, %sil	; tmp362
	je	.L56	;,
	testb	%dl, %dl	; tmp399
	je	.L56	;,
; src/lexer.c:162:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp540
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp442
	jmp	.L189	;
.L56:
; src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L57	;,
	testb	%dl, %dl	; tmp399
	je	.L57	;,
; src/lexer.c:165:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp541
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp448
	jmp	.L189	;
.L57:
; src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L58	;,
	cmpb	$38, %cl	;, _448
	jne	.L58	;,
; src/lexer.c:168:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp542
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp456
	jmp	.L189	;
.L58:
; src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L59	;,
	cmpb	$124, %cl	;, _448
	jne	.L59	;,
; src/lexer.c:171:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_267(D)->column, tmp543
	movq	32(%rbx), %rdx	; lexer_267(D)->line, lexer_267(D)->line
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp464
	jmp	.L189	;
.L59:
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rcx	; lexer_267(D)->column, tmp544
; src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	32(%rbx), %rsi	; lexer_267(D)->line, pretmp_450
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rcx), %rdx	;, _465
	cmpb	$62, %al	;, c
	jg	.L60	;,
	cmpb	$32, %al	;, c
	jle	.L61	;,
	subl	$33, %eax	;, tmp469
	cmpb	$29, %al	;, tmp469
	ja	.L61	;,
	leaq	.L63(%rip), %rcx	;, tmp471
	movzbl	%al, %eax	; tmp469, tmp470
	movslq	(%rcx,%rax,4), %rax	;, tmp473
	addq	%rcx, %rax	; tmp471, tmp474
	jmp	*%rax	; tmp474
	.section	.rodata
	.align 4
	.align 4
.L63:
	.long	.L76-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L75-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L74-.L63
	.long	.L73-.L63
	.long	.L72-.L63
	.long	.L71-.L63
	.long	.L70-.L63
	.long	.L69-.L63
	.long	.L68-.L63
	.long	.L67-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L66-.L63
	.long	.L65-.L63
	.long	.L64-.L63
	.long	.L62-.L63
	.text
.L60:
	cmpb	$123, %al	;, c
	je	.L77	;,
	jg	.L78	;,
	cmpb	$91, %al	;, c
	je	.L79	;,
	cmpb	$93, %al	;, c
	jne	.L61	;,
; src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	jmp	.L189	;
.L78:
	cmpb	$125, %al	;, c
	jne	.L61	;,
; src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	jmp	.L189	;
.L74:
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	jmp	.L189	;
.L73:
; src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	jmp	.L189	;
.L77:
; src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	jmp	.L189	;
.L70:
; src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	jmp	.L189	;
.L76:
; src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	jmp	.L189	;
.L68:
; src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	jmp	.L189	;
.L79:
; src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	jmp	.L189	;
.L66:
; src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	jmp	.L189	;
.L71:
; src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	jmp	.L189	;
.L69:
; src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	jmp	.L189	;
.L72:
; src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	jmp	.L189	;
.L67:
; src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	jmp	.L189	;
.L75:
; src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	jmp	.L189	;
.L65:
; src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	jmp	.L189	;
.L62:
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	jmp	.L189	;
.L64:
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rdx, %rcx	; _465,
	movq	%rsi, %rdx	; pretmp_450,
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
.L189:
	movl	$5, %edi	;,
	jmp	.L188	;
.L61:
; src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	(%rbx), %rcx	; lexer_267(D)->filename,
	leaq	.LC6(%rip), %rdi	;, tmp494
	call	lexer_error	;
; src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
.L186:
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
.L188:
; src/lexer.c:216: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	create_token	;
.L197:
; src/lexer.c:136:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:137:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L187	;,
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbx), %rax	; lexer_267(D)->position, tmp531
	movq	32(%rbx), %r12	; lexer_267(D)->line, _91
	leaq	-2(%rax), %rsi	;, tmp394
	jmp	.L192	;
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp87, source
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %edi	;,
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length, string filename) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp88, length
	pushq	%rbx	;
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length, string filename) {
	movq	%rdx, %rbx	; tmp89, filename
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:11:     lexer->peeked_position = 0;
	xorl	%ecx, %ecx	;
; src/lexer.c:6:     lexer->position = 0;
	xorl	%edx, %edx	;
; src/lexer.c:5:     lexer->source = source;
	movq	%r12, 8(%rax)	; source, lexer_3->source
; src/lexer.c:6:     lexer->position = 0;
	movq	%rdx, 16(%rax)	;, lexer_3->position
; src/lexer.c:7:     lexer->length = length;
	movq	%rbp, 24(%rax)	; length, lexer_3->length
; src/lexer.c:11:     lexer->peeked_position = 0;
	movq	%rcx, 32(%rax)	;, lexer_3->line
	movq	%rcx, 40(%rax)	;, lexer_3->column
	movq	%rcx, 48(%rax)	;, lexer_3->peeked_token
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	%rcx, 56(%rax)	;, lexer_3->peeked_position
	movq	%rcx, 64(%rax)	;, lexer_3->peeked_line
; src/lexer.c:14:     lexer->current_token = NULL;
	movq	%rcx, 72(%rax)	;, lexer_3->peeked_column
	movq	%rcx, 80(%rax)	;, lexer_3->current_token
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
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	48(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:218: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
; src/lexer.c:218: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rdi, %rbx	; tmp95, lexer
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L201	;,
; src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	56(%rdi), %rdx	; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
; src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rdi)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	%rdx, 16(%rdi)	; lexer_8(D)->peeked_position, lexer_8(D)->position
; src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	64(%rdi), %rdx	; lexer_8(D)->peeked_line, lexer_8(D)->peeked_line
	movq	%rdx, 32(%rdi)	; lexer_8(D)->peeked_line, lexer_8(D)->line
; src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	72(%rdi), %rdx	; lexer_8(D)->peeked_column, lexer_8(D)->peeked_column
	movq	%rdx, 40(%rdi)	; lexer_8(D)->peeked_column, lexer_8(D)->column
; src/lexer.c:224:         lexer->peeked_token = 0;
	xorl	%edx, %edx	;
	movq	%rdx, 48(%rdi)	;, lexer_8(D)->peeked_token
; src/lexer.c:225:         return lexer->current_token;
	jmp	.L200	;
.L201:
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	; <retval>, lexer_8(D)->current_token
.L200:
; src/lexer.c:229: }
	popq	%rbx	;
	ret	
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	48(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; <retval>
	jne	.L207	;,
; src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r13	;
; src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp98, lexer
	pushq	%rax	;
; src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rdi), %r13	; lexer_9(D)->position, saved_position
; src/lexer.c:235:     size_t saved_line = lexer->line;
	movq	32(%rdi), %r12	; lexer_9(D)->line, saved_line
; src/lexer.c:236:     size_t saved_column = lexer->column;
	movq	40(%rdi), %rbp	; lexer_9(D)->column, saved_column
; src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	call	get_next_token	;
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	16(%rbx), %rdx	; lexer_9(D)->position, lexer_9(D)->position
; src/lexer.c:241:     lexer->position = saved_position;
	movq	%r13, 16(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	%rdx, 56(%rbx)	; lexer_9(D)->position, lexer_9(D)->peeked_position
; src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	32(%rbx), %rdx	; lexer_9(D)->line, lexer_9(D)->line
; src/lexer.c:242:     lexer->line = saved_line;
	movq	%r12, 32(%rbx)	; saved_line, lexer_9(D)->line
; src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	%rdx, 64(%rbx)	; lexer_9(D)->line, lexer_9(D)->peeked_line
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
; src/lexer.c:243:     lexer->column = saved_column;
	movq	%rbp, 40(%rbx)	; saved_column, lexer_9(D)->column
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	%rdx, 72(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:246: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L207:
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
; src/lexer.c:256:     lexer->peeked_token = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 16(%rdi)	;, lexer_2(D)->position
	movq	%rax, 32(%rdi)	;, lexer_2(D)->line
	movq	%rax, 40(%rdi)	;, lexer_2(D)->column
; src/lexer.c:260:     lexer->current_token = NULL;
	movq	%rax, 48(%rdi)	;, lexer_2(D)->peeked_token
	movq	%rax, 56(%rdi)	;, lexer_2(D)->peeked_position
	movq	%rax, 64(%rdi)	;, lexer_2(D)->peeked_line
	movq	%rax, 72(%rdi)	;, lexer_2(D)->peeked_column
	movq	%rax, 80(%rdi)	;, lexer_2(D)->current_token
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

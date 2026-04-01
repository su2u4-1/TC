	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	get_current_char, @function
get_current_char:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rdi), %rax	; lexer_11(D)->position, _1
; src/lexer.c:33:         return '\0';
	xorl	%edx, %edx	; <retval>
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	16(%rdi), %rax	; lexer_11(D)->length, _1
	jnb	.L1	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rdi), %rdx	; lexer_11(D)->source, _5
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, tmp91
; src/lexer.c:34:     lexer->column++;
	incq	32(%rdi)	; lexer_11(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rdi)	; tmp91, lexer_11(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movb	(%rdx,%rax), %dl	; *_7, <retval>
.L1:
; src/lexer.c:36: }
	movl	%edx, %eax	; <retval>,
	ret	
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
	pushq	%r13	;
	movl	%edi, %r13d	; tmp88, type
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:18: static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, lexeme
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, line
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, column
	pushq	%rax	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
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
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_token, .-create_token
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
; src/lexer.c:27: static void lexer_error(const string message, size_t line, size_t column) {
	movq	%rdi, %r9	; message, tmp92
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rsi), %rcx	;, tmp89
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rdx), %r8	;,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC0(%rip), %rdx	;, tmp91
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
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
	movq	%rdi, %rbx	; tmp497, lexer
	subq	$24, %rsp	;,
; src/lexer.c:60:     char c = get_current_char(lexer);
	call	get_current_char	;
; src/lexer.c:61:     if (c == '\0')
	testb	%al, %al	; c
	jne	.L9	;,
; src/lexer.c:62:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	32(%rdi), %rcx	; lexer_264(D)->column, lexer_264(D)->column
	movq	24(%rdi), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	jmp	.L185	;
.L9:
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	movl	%eax, %edx	; c, tmp316
	movl	%esi, %r12d	; tmp498, skip_comment
	andl	$-5, %edx	;, tmp316
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, %dl	;, tmp316
	je	.L186	;,
	cmpb	$32, %al	;, c
	je	.L186	;,
; src/lexer.c:65:     else if (c == '\n') {
	cmpb	$10, %al	;, c
	jne	.L12	;,
; src/lexer.c:45:     lexer->line++;
	incq	24(%rdi)	; lexer_264(D)->line
; src/lexer.c:46:     lexer->column = 0;
	xorl	%edi, %edi	;
	movq	%rdi, 32(%rbx)	;, lexer_264(D)->column
.L186:
; src/lexer.c:215: }
	addq	$24, %rsp	;,
; src/lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	%r12b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:215: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/lexer.c:67:         return next_token(lexer, skip_comment);
	jmp	next_token	;
.L12:
; src/lexer.c:69:         size_t start = lexer->position - 1;
	movq	8(%rdi), %rbp	; lexer_264(D)->position, pretmp_448
	cmpb	$57, %al	;, c
	jg	.L13	;,
	cmpb	$47, %al	;, c
	jg	.L14	;,
	cmpb	$34, %al	;, c
	jne	.L16	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rsi	;, tmp495
; src/lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	32(%rdi), %rax	; lexer_264(D)->column, tmp521
	leaq	-1(%rax), %r13	;, column_start
; src/lexer.c:97:         c = get_current_char(lexer);
	call	get_current_char	;
	movl	%eax, %r12d	; tmp507, c
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L29	;
.L13:
	leal	-65(%rax), %edx	;, _230
	cmpb	$57, %dl	;, _230
	ja	.L16	;,
	movabsq	$288230372997595135, %rsi	;, tmp325
	btq	%rdx, %rsi	; _230, tmp325
	jnc	.L16	;,
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rcx	; lexer_264(D)->column, tmp518
; src/lexer.c:69:         size_t start = lexer->position - 1;
	leaq	-1(%rbp), %r8	;, start
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	leaq	-1(%rcx), %r12	;, column_start
.L19:
	cmpb	$57, %al	;, c
	jg	.L20	;,
	cmpb	$47, %al	;, c
	jle	.L22	;,
.L21:
; src/lexer.c:72:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	jmp	.L19	;
.L20:
	subl	$65, %eax	;, _234
	cmpb	$57, %al	;, _234
	ja	.L22	;,
	btq	%rax, %rsi	; _234, tmp325
	jc	.L21	;,
.L22:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rsi	; lexer_264(D)->position, _420
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	(%rbx), %rdi	; lexer_264(D)->source, start
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_264(D)->column
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp332
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	addq	%r8, %rdi	; start, start
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rbp, %rsi	; pretmp_448, tmp333
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rax, 8(%rbx)	; tmp332, lexer_264(D)->position
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	movq	%rax, 8(%rsp)	; content, %sfp
	call	*is_keyword@GOTPCREL(%rip)	;
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
; src/lexer.c:75:         if (is_keyword(content))
	movq	8(%rsp), %rsi	; %sfp, content
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	%r12, %rcx	; column_start,
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; tmp502
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movl	$6, %edi	;,
; src/lexer.c:75:         if (is_keyword(content))
	jne	.L187	;,
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movl	$1, %edi	;,
	jmp	.L187	;
.L14:
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	32(%rdi), %rax	; lexer_264(D)->column, tmp520
; src/lexer.c:80:         size_t start = lexer->position - 1;
	leaq	-1(%rbp), %r9	;, start
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %r12	;, column_start
.L25:
; src/lexer.c:83:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	;, tmp339
	cmpb	$9, %dl	;, tmp339
	jbe	.L25	;,
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	; lexer_264(D)->position, _426
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	(%rbx), %r8	; lexer_264(D)->source, pretmp_267
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	16(%rbx), %rdx	; lexer_264(D)->length, _426
	jnb	.L26	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	jne	.L26	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movb	(%r8,%rdx), %al	; *_429, *_429
	subl	$48, %eax	;, tmp340
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp340
	ja	.L26	;,
.L184:
; src/lexer.c:89:                 c = get_current_char(lexer);
	call	get_current_char	;
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp342
	cmpb	$9, %al	;, tmp342
	ja	.L192	;,
; src/lexer.c:89:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	jmp	.L184	;
.L192:
; src/lexer.c:90:             type = FLOAT;
	movl	$3, %r13d	;, type
.L26:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rsi	; lexer_264(D)->position, _432
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_264(D)->column
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r8,%r9), %rdi	;, tmp345
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp343
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rbp, %rsi	; pretmp_448, tmp344
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rax, 8(%rbx)	; tmp343, lexer_264(D)->position
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %rbx	; lexer_264(D)->line, _37
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r12, %rcx	; column_start,
	movl	%r13d, %edi	; type,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; tmp506, _42
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbx, %rdx	; _37,
	jmp	.L187	;
.L194:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r12, %rsi	; c, tmp495
	jnc	.L193	;,
.L30:
; src/lexer.c:99:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	movl	%eax, %r12d	; tmp508, c
.L29:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r12b	;, c
	ja	.L30	;,
	jmp	.L194	;
.L193:
; src/lexer.c:62:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	24(%rbx), %rsi	; lexer_264(D)->line, pretmp_345
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %r12b	;, c
	je	.L32	;,
; src/lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	leaq	-1(%rbp), %rdx	;, tmp351
	leaq	.LC1(%rip), %rdi	;, tmp352
	call	lexer_error	;
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r12b	;, c
	jne	.L32	;,
; src/lexer.c:46:     lexer->column = 0;
	xorl	%esi, %esi	;
; src/lexer.c:45:     lexer->line++;
	incq	24(%rbx)	; lexer_264(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	%rsi, 32(%rbx)	;, lexer_264(D)->column
.L32:
; src/lexer.c:104:         if (lexer->position - start == 1)
	movq	8(%rbx), %rsi	; lexer_264(D)->position, _50
; src/lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	24(%rbx), %r12	; lexer_264(D)->line, pretmp_478
	leaq	.LC2(%rip), %rdi	;, tmp354
; src/lexer.c:104:         if (lexer->position - start == 1)
	subq	%rbp, %rsi	; pretmp_448, _50
; src/lexer.c:104:         if (lexer->position - start == 1)
	cmpq	$1, %rsi	;, _50
	je	.L189	;,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_264(D)->source, pretmp_448
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	decq	%rsi	; tmp355
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; pretmp_448, pretmp_448
.L189:
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%r12, %rdx	; pretmp_478,
	movl	$4, %edi	;,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rsi	; tmp510, _57
	jmp	.L187	;
.L16:
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %r8	; lexer_264(D)->length, _441
; src/lexer.c:40:         return '\0';
	xorl	%ecx, %ecx	; _445
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r8, %rbp	; _441, pretmp_448
	jnb	.L35	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rdx	; lexer_264(D)->source, lexer_264(D)->source
	movb	(%rdx,%rbp), %cl	; *_443, _445
.L35:
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%sil	;, tmp359
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %cl	;, _445
	jne	.L36	;,
	testb	%sil, %sil	; tmp359
	je	.L36	;,
; src/lexer.c:111:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %r13	; lexer_264(D)->column, _62
.L37:
; src/lexer.c:113:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:112:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, c
	je	.L92	;,
	testb	%al, %al	; c
	jne	.L37	;,
.L92:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rax	; lexer_264(D)->position, tmp524
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_264(D)->column
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rax), %rsi	;, _449
	movq	%rsi, 8(%rbx)	; _449, lexer_264(D)->position
; src/lexer.c:115:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L186	;,
; src/lexer.c:110:             size_t start = lexer->position + 1;
	leaq	1(%rbp), %rdi	;, start
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %rbp	; lexer_264(D)->line, _67
	subq	%rdi, %rsi	; start, tmp368
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	(%rbx), %rdi	; lexer_264(D)->source, tmp369
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:111:             size_t column_start = lexer->column - 1;
	leaq	-1(%r13), %rcx	;, column_start
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbp, %rdx	; _67,
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; tmp512, _72
	jmp	.L190	;
.L36:
; src/lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$42, %cl	;, _445
	jne	.L40	;,
	testb	%sil, %sil	; tmp359
	je	.L40	;,
; src/lexer.c:120:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp525
; src/lexer.c:119:             size_t start = lexer->position + 1;
	incq	%rbp	; start
; src/lexer.c:108:         char p = peek_next_char(lexer);
	movb	$42, %dl	;, p
; src/lexer.c:120:             size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %r13	;, column_start
; src/lexer.c:60:     char c = get_current_char(lexer);
	movb	$47, %al	;, c
.L41:
; src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	je	.L195	;,
.L45:
; src/lexer.c:122:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	; lexer_264(D)->position, _452
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r8, %rdx	; _441, _452
	jnb	.L42	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rcx	; lexer_264(D)->source, lexer_264(D)->source
	movb	(%rcx,%rdx), %dl	; *_455, p
; src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L43	;,
	jmp	.L81	;
.L42:
	cmpb	$10, %al	;, c
	jne	.L44	;,
; src/lexer.c:40:         return '\0';
	xorl	%edx, %edx	; p
.L81:
; src/lexer.c:46:     lexer->column = 0;
	xorl	%ecx, %ecx	;
; src/lexer.c:45:     lexer->line++;
	incq	24(%rbx)	; lexer_264(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	%rcx, 32(%rbx)	;, lexer_264(D)->column
.L43:
; src/lexer.c:125:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	je	.L44	;,
; src/lexer.c:126:                 assert(c != '\0');
	testb	%al, %al	; c
	jne	.L41	;,
; src/lexer.c:126:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp376
	movl	$126, %edx	;,
	leaq	.LC3(%rip), %rsi	;, tmp377
	leaq	.LC4(%rip), %rdi	;, tmp378
	call	*__assert_fail@GOTPCREL(%rip)	;
.L195:
; src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$47, %dl	;, p
	jne	.L45	;,
	jmp	.L196	;
.L44:
; src/lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	jne	.L85	;,
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	decq	8(%rbx)	; lexer_264(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_264(D)->column
.L85:
; src/lexer.c:130:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rsi	; lexer_264(D)->line, lexer_264(D)->line
	movq	%rbp, %rdx	; start,
	leaq	.LC5(%rip), %rdi	;, tmp384
	call	lexer_error	;
; src/lexer.c:131:                 if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L186	;,
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %r12	; lexer_264(D)->line, _82
	movq	8(%rbx), %rsi	; lexer_264(D)->position, tmp386
.L191:
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_264(D)->source, start
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rbp, %rsi	; start, tmp393
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rbp, %rdi	; start, start
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%r12, %rdx	; _89,
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rsi	; tmp515, _95
.L190:
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movl	$7, %edi	;,
	jmp	.L187	;
.L40:
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %cl	;, _445
	sete	%dl	;, tmp396
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L48	;,
	testb	%dl, %dl	; tmp396
	je	.L48	;,
; src/lexer.c:140:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp530
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp399
	jmp	.L188	;
.L48:
; src/lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L49	;,
	testb	%dl, %dl	; tmp396
	je	.L49	;,
; src/lexer.c:143:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp531
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp405
	jmp	.L188	;
.L49:
; src/lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L50	;,
	testb	%dl, %dl	; tmp396
	je	.L50	;,
; src/lexer.c:146:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp532
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp411
	jmp	.L188	;
.L50:
; src/lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L51	;,
	testb	%dl, %dl	; tmp396
	je	.L51	;,
; src/lexer.c:149:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp533
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp417
	jmp	.L188	;
.L51:
; src/lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L52	;,
	testb	%dl, %dl	; tmp396
	je	.L52	;,
; src/lexer.c:152:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp534
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp423
	jmp	.L188	;
.L52:
; src/lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L53	;,
	testb	%dl, %dl	; tmp396
	je	.L53	;,
; src/lexer.c:155:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp535
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp429
	jmp	.L188	;
.L53:
; src/lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L54	;,
	testb	%dl, %dl	; tmp396
	je	.L54	;,
; src/lexer.c:158:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp536
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp435
	jmp	.L188	;
.L54:
; src/lexer.c:160:         } else if (c == '/' && p == '=') {
	testb	%sil, %sil	; tmp359
	je	.L55	;,
	testb	%dl, %dl	; tmp396
	je	.L55	;,
; src/lexer.c:161:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp537
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp439
	jmp	.L188	;
.L55:
; src/lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L56	;,
	testb	%dl, %dl	; tmp396
	je	.L56	;,
; src/lexer.c:164:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp538
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp445
	jmp	.L188	;
.L56:
; src/lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L57	;,
	cmpb	$38, %cl	;, _445
	jne	.L57	;,
; src/lexer.c:167:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp539
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp453
	jmp	.L188	;
.L57:
; src/lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L58	;,
	cmpb	$124, %cl	;, _445
	jne	.L58	;,
; src/lexer.c:170:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_264(D)->column, tmp540
	movq	24(%rbx), %rdx	; lexer_264(D)->line, lexer_264(D)->line
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp461
	jmp	.L188	;
.L58:
; src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rcx	; lexer_264(D)->column, tmp541
; src/lexer.c:62:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	24(%rbx), %rsi	; lexer_264(D)->line, pretmp_447
; src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	decq	%rcx	; _462
	cmpb	$62, %al	;, c
	jg	.L59	;,
	cmpb	$32, %al	;, c
	jle	.L60	;,
	subl	$33, %eax	;, tmp466
	cmpb	$29, %al	;, tmp466
	ja	.L60	;,
	leaq	.L62(%rip), %rdx	;, tmp468
	movzbl	%al, %eax	; tmp466, tmp467
	movslq	(%rdx,%rax,4), %rax	;, tmp470
	addq	%rdx, %rax	; tmp468, tmp471
	jmp	*%rax	; tmp471
	.section	.rodata
	.align 4
	.align 4
.L62:
	.long	.L75-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L74-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L73-.L62
	.long	.L72-.L62
	.long	.L71-.L62
	.long	.L70-.L62
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
	.long	.L65-.L62
	.long	.L64-.L62
	.long	.L63-.L62
	.long	.L61-.L62
	.text
.L59:
	cmpb	$123, %al	;, c
	je	.L76	;,
	jg	.L77	;,
	cmpb	$91, %al	;, c
	je	.L78	;,
	cmpb	$93, %al	;, c
	jne	.L60	;,
; src/lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	jmp	.L188	;
.L77:
	cmpb	$125, %al	;, c
	jne	.L60	;,
; src/lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	jmp	.L188	;
.L73:
; src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	jmp	.L188	;
.L72:
; src/lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	jmp	.L188	;
.L76:
; src/lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	jmp	.L188	;
.L69:
; src/lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	jmp	.L188	;
.L75:
; src/lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	jmp	.L188	;
.L67:
; src/lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	jmp	.L188	;
.L78:
; src/lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	jmp	.L188	;
.L65:
; src/lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	jmp	.L188	;
.L70:
; src/lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	jmp	.L188	;
.L68:
; src/lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	jmp	.L188	;
.L71:
; src/lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	jmp	.L188	;
.L66:
; src/lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	jmp	.L188	;
.L74:
; src/lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	jmp	.L188	;
.L64:
; src/lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	jmp	.L188	;
.L61:
; src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	jmp	.L188	;
.L63:
; src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_447,
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
.L188:
	movl	$5, %edi	;,
	jmp	.L187	;
.L60:
; src/lexer.c:211:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	%rcx, %rdx	; _462,
	leaq	.LC6(%rip), %rdi	;, tmp491
	call	lexer_error	;
; src/lexer.c:212:             return create_token(EOF_TOKEN, NULL, 0, 0);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
.L185:
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
.L187:
; src/lexer.c:215: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/lexer.c:212:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	create_token	;
.L196:
; src/lexer.c:135:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:136:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L186	;,
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	8(%rbx), %rax	; lexer_264(D)->position, tmp528
	movq	24(%rbx), %r12	; lexer_264(D)->line, _89
	leaq	-2(%rax), %rsi	;, tmp391
	jmp	.L191	;
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, source
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %edi	;,
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp87, length
	pushq	%rax	;
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:11:     lexer->peeked_position = 0;
	xorl	%ecx, %ecx	;
; src/lexer.c:6:     lexer->position = 0;
	xorl	%edx, %edx	;
; src/lexer.c:5:     lexer->source = source;
	movq	%rbp, (%rax)	; source, lexer_3->source
; src/lexer.c:6:     lexer->position = 0;
	movq	%rdx, 8(%rax)	;, lexer_3->position
; src/lexer.c:7:     lexer->length = length;
	movq	%rbx, 16(%rax)	; length, lexer_3->length
; src/lexer.c:11:     lexer->peeked_position = 0;
	movq	%rcx, 24(%rax)	;, lexer_3->line
	movq	%rcx, 32(%rax)	;, lexer_3->column
	movq	%rcx, 40(%rax)	;, lexer_3->peeked_token
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	%rcx, 48(%rax)	;, lexer_3->peeked_position
	movq	%rcx, 56(%rax)	;, lexer_3->peeked_line
; src/lexer.c:14:     lexer->current_token = NULL;
	movq	%rcx, 64(%rax)	;, lexer_3->peeked_column
	movq	%rcx, 72(%rax)	;, lexer_3->current_token
; src/lexer.c:16: }
	popq	%rsi	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
; src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	movq	40(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:217: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
; src/lexer.c:217: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rdi, %rbx	; tmp95, lexer
; src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L200	;,
; src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	48(%rdi), %rdx	; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
; src/lexer.c:219:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rdi)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	%rdx, 8(%rdi)	; lexer_8(D)->peeked_position, lexer_8(D)->position
; src/lexer.c:221:         lexer->line = lexer->peeked_line;
	movq	56(%rdi), %rdx	; lexer_8(D)->peeked_line, lexer_8(D)->peeked_line
	movq	%rdx, 24(%rdi)	; lexer_8(D)->peeked_line, lexer_8(D)->line
; src/lexer.c:222:         lexer->column = lexer->peeked_column;
	movq	64(%rdi), %rdx	; lexer_8(D)->peeked_column, lexer_8(D)->peeked_column
	movq	%rdx, 32(%rdi)	; lexer_8(D)->peeked_column, lexer_8(D)->column
; src/lexer.c:223:         lexer->peeked_token = 0;
	xorl	%edx, %edx	;
	movq	%rdx, 40(%rdi)	;, lexer_8(D)->peeked_token
; src/lexer.c:224:         return lexer->current_token;
	jmp	.L199	;
.L200:
; src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:227:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_8(D)->current_token
.L199:
; src/lexer.c:228: }
	popq	%rbx	;
	ret	
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
; src/lexer.c:231:     if (lexer->peeked_token != NULL)
	movq	40(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:231:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; <retval>
	jne	.L206	;,
; src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r13	;
; src/lexer.c:236:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp98, lexer
	pushq	%rax	;
; src/lexer.c:233:     size_t saved_position = lexer->position;
	movq	8(%rdi), %r13	; lexer_9(D)->position, saved_position
; src/lexer.c:234:     size_t saved_line = lexer->line;
	movq	24(%rdi), %r12	; lexer_9(D)->line, saved_line
; src/lexer.c:235:     size_t saved_column = lexer->column;
	movq	32(%rdi), %rbp	; lexer_9(D)->column, saved_column
; src/lexer.c:236:     Token* token = get_next_token(lexer, skip_comment);
	call	get_next_token	;
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movq	8(%rbx), %rdx	; lexer_9(D)->position, lexer_9(D)->position
; src/lexer.c:240:     lexer->position = saved_position;
	movq	%r13, 8(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:243:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movq	%rdx, 48(%rbx)	; lexer_9(D)->position, lexer_9(D)->peeked_position
; src/lexer.c:238:     lexer->peeked_line = lexer->line;
	movq	24(%rbx), %rdx	; lexer_9(D)->line, lexer_9(D)->line
; src/lexer.c:241:     lexer->line = saved_line;
	movq	%r12, 24(%rbx)	; saved_line, lexer_9(D)->line
; src/lexer.c:238:     lexer->peeked_line = lexer->line;
	movq	%rdx, 56(%rbx)	; lexer_9(D)->line, lexer_9(D)->peeked_line
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
; src/lexer.c:242:     lexer->column = saved_column;
	movq	%rbp, 32(%rbx)	; saved_column, lexer_9(D)->column
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:245: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L206:
	ret	
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
; src/lexer.c:248:     return lexer->current_token;
	movq	72(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:249: }
	ret	
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
; src/lexer.c:255:     lexer->peeked_token = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rdi)	;, lexer_2(D)->position
	movq	%rax, 24(%rdi)	;, lexer_2(D)->line
	movq	%rax, 32(%rdi)	;, lexer_2(D)->column
; src/lexer.c:259:     lexer->current_token = NULL;
	movq	%rax, 40(%rdi)	;, lexer_2(D)->peeked_token
	movq	%rax, 48(%rdi)	;, lexer_2(D)->peeked_position
	movq	%rax, 56(%rdi)	;, lexer_2(D)->peeked_line
	movq	%rax, 64(%rdi)	;, lexer_2(D)->peeked_column
	movq	%rax, 72(%rdi)	;, lexer_2(D)->current_token
; src/lexer.c:260: }
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

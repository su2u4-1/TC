	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.type	get_current_char, @function
get_current_char:
.LFB53:
	.cfi_startproc
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
	.cfi_endproc
.LFE53:
	.size	get_current_char, .-get_current_char
	.type	create_token, @function
create_token:
.LFB51:
	.cfi_startproc
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r13d	; tmp88, type
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:18: static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12	; tmp89, lexeme
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp	; tmp90, line
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rcx, %rbx	; tmp91, column
	pushq	%rax	;
	.cfi_def_cfa_offset 48
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory@PLT	;
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
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE51:
	.size	create_token, .-create_token
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
.LFB52:
	.cfi_startproc
; src/lexer.c:27: static void lexer_error(const string message, size_t line, size_t column) {
	movq	%rdi, %r9	; message, tmp92
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rsi), %rcx	;, tmp89
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	leaq	1(%rdx), %r8	;,
	movl	$2, %esi	;,
	leaq	.LC0(%rip), %rdx	;, tmp91
	jmp	__fprintf_chk@PLT	;
	.cfi_endproc
.LFE52:
	.size	lexer_error, .-lexer_error
	.section	.rodata.str1.1
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
.LFB57:
	.cfi_startproc
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx	; tmp507, lexer
	subq	$16, %rsp	;,
	.cfi_def_cfa_offset 64
; src/lexer.c:60:     char c = get_current_char(lexer);
	call	get_current_char	;
; src/lexer.c:61:     if (c == '\0')
	testb	%al, %al	; c
	jne	.L9	;,
; src/lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	32(%rdi), %rcx	; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rdi), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	jmp	.L183	;
.L9:
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	movl	%eax, %edx	; c, tmp321
	movl	%esi, %r12d	; tmp508, skip_comment
	andl	$-5, %edx	;, tmp321
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, %dl	;, tmp321
	je	.L184	;,
	cmpb	$32, %al	;, c
	je	.L184	;,
; src/lexer.c:65:     else if (c == '\n') {
	cmpb	$10, %al	;, c
	jne	.L12	;,
; src/lexer.c:46:     lexer->column = 0;
	xorl	%ebp, %ebp	;
; src/lexer.c:45:     lexer->line++;
	incq	24(%rdi)	; lexer_269(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	%rbp, 32(%rdi)	;, lexer_269(D)->column
.L184:
; src/lexer.c:214: }
	addq	$16, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
; src/lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	%r12b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:214: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; src/lexer.c:67:         return next_token(lexer, skip_comment);
	jmp	next_token	;
.L12:
	.cfi_restore_state
; src/lexer.c:69:         size_t start = lexer->position - 1;
	movq	8(%rdi), %rbp	; lexer_269(D)->position, pretmp_452
	cmpb	$57, %al	;, c
	jg	.L13	;,
	cmpb	$47, %al	;, c
	jg	.L14	;,
	cmpb	$34, %al	;, c
	jne	.L16	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rsi	;, tmp505
; src/lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	32(%rdi), %rax	; lexer_269(D)->column, tmp531
	leaq	-1(%rax), %r13	;, column_start
; src/lexer.c:97:         c = get_current_char(lexer);
	call	get_current_char	;
	movl	%eax, %r12d	; tmp517, c
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L29	;
.L13:
	leal	-65(%rax), %edx	;, _230
	cmpb	$57, %dl	;, _230
	ja	.L16	;,
	movabsq	$288230372997595135, %rsi	;, tmp330
	btq	%rdx, %rsi	; _230, tmp330
	jnc	.L16	;,
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rcx	; lexer_269(D)->column, tmp528
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
	btq	%rax, %rsi	; _234, tmp330
	jc	.L21	;,
.L22:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rsi	; lexer_269(D)->position, _425
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_269(D)->column
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	(%rbx), %rdi	; lexer_269(D)->source, start
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp337
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rbp, %rsi	; pretmp_452, tmp338
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rax, 8(%rbx)	; tmp337, lexer_269(D)->position
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	addq	%r8, %rdi	; start, start
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string@PLT	;
; src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	movq	%rax, 8(%rsp)	; content, %sfp
	call	is_keyword@PLT	;
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
; src/lexer.c:75:         if (is_keyword(content))
	movq	8(%rsp), %rsi	; %sfp, content
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	%r12, %rcx	; column_start,
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; tmp512
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movl	$6, %edi	;,
; src/lexer.c:75:         if (is_keyword(content))
	jne	.L185	;,
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movl	$1, %edi	;,
	jmp	.L185	;
.L14:
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	32(%rdi), %rax	; lexer_269(D)->column, tmp530
; src/lexer.c:80:         size_t start = lexer->position - 1;
	leaq	-1(%rbp), %r9	;, start
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %r12	;, column_start
.L25:
; src/lexer.c:83:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	;, tmp344
	cmpb	$9, %dl	;, tmp344
	jbe	.L25	;,
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	; lexer_269(D)->position, _431
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	(%rbx), %r8	; lexer_269(D)->source, pretmp_272
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	16(%rbx), %rdx	; lexer_269(D)->length, _431
	jnb	.L26	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	jne	.L26	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movb	(%r8,%rdx), %al	; *_434, *_434
	subl	$48, %eax	;, tmp345
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp345
	ja	.L26	;,
.L182:
; src/lexer.c:89:                 c = get_current_char(lexer);
	call	get_current_char	;
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp347
	cmpb	$9, %al	;, tmp347
	ja	.L190	;,
; src/lexer.c:89:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	jmp	.L182	;
.L190:
; src/lexer.c:90:             type = FLOAT;
	movl	$3, %r13d	;, type
.L26:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rsi	; lexer_269(D)->position, _437
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_269(D)->column
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r8,%r9), %rdi	;, tmp350
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rax	;, tmp348
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rbp, %rsi	; pretmp_452, tmp349
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rax, 8(%rbx)	; tmp348, lexer_269(D)->position
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %rbx	; lexer_269(D)->line, _37
	call	create_string@PLT	;
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r12, %rcx	; column_start,
	movq	%rbx, %rdx	; _37,
	movl	%r13d, %edi	; type,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; tmp516, _42
	jmp	.L185	;
.L192:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r12, %rsi	; c, tmp505
	jnc	.L191	;,
.L30:
; src/lexer.c:99:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
	movl	%eax, %r12d	; tmp518, c
.L29:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r12b	;, c
	ja	.L30	;,
	jmp	.L192	;
.L191:
; src/lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	24(%rbx), %r14	; lexer_269(D)->line, pretmp_483
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %r12b	;, c
	je	.L31	;,
; src/lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	leaq	-1(%rbp), %rdx	;, tmp356
	movq	%r14, %rsi	; pretmp_483,
	leaq	.LC1(%rip), %rdi	;, tmp357
	call	lexer_error	;
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r12b	;, c
	jne	.L32	;,
; src/lexer.c:46:     lexer->column = 0;
	xorl	%r10d, %r10d	;
; src/lexer.c:45:     lexer->line++;
	incq	24(%rbx)	; lexer_269(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	%r10, 32(%rbx)	;, lexer_269(D)->column
.L32:
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_269(D)->source, pretmp_452
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %rsi	; pretmp_452, tmp358
	movq	24(%rbx), %r12	; lexer_269(D)->line, _49
	notq	%rsi	; tmp358
	addq	8(%rbx), %rsi	; lexer_269(D)->position, tmp360
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; pretmp_452, pretmp_452
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string@PLT	;
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%r12, %rdx	; _49,
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rsi	; tmp519, _55
	jmp	.L187	;
.L31:
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_269(D)->source, pretmp_452
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %rsi	; pretmp_452, tmp363
	notq	%rsi	; tmp363
	addq	8(%rbx), %rsi	; lexer_269(D)->position, tmp365
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; pretmp_452, pretmp_452
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string@PLT	;
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%r14, %rdx	; pretmp_483,
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rsi	; tmp520, _62
.L187:
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movl	$4, %edi	;,
	jmp	.L185	;
.L16:
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %r8	; lexer_269(D)->length, _446
; src/lexer.c:40:         return '\0';
	xorl	%ecx, %ecx	; _450
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r8, %rbp	; _446, pretmp_452
	jnb	.L33	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rdx	; lexer_269(D)->source, lexer_269(D)->source
	movb	(%rdx,%rbp), %cl	; *_448, _450
.L33:
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%sil	;, tmp369
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %cl	;, _450
	jne	.L34	;,
	testb	%sil, %sil	; tmp369
	je	.L34	;,
; src/lexer.c:110:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %r13	; lexer_269(D)->column, _67
.L35:
; src/lexer.c:112:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, c
	je	.L90	;,
	testb	%al, %al	; c
	jne	.L35	;,
.L90:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rax	; lexer_269(D)->position, tmp536
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_269(D)->column
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rax), %rsi	;, _454
	movq	%rsi, 8(%rbx)	; _454, lexer_269(D)->position
; src/lexer.c:114:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L184	;,
; src/lexer.c:109:             size_t start = lexer->position + 1;
	leaq	1(%rbp), %rdi	;, start
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %rbp	; lexer_269(D)->line, _72
	subq	%rdi, %rsi	; start, tmp378
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	(%rbx), %rdi	; lexer_269(D)->source, tmp379
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string@PLT	;
; src/lexer.c:110:             size_t column_start = lexer->column - 1;
	leaq	-1(%r13), %rcx	;, column_start
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbp, %rdx	; _72,
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; tmp522, _77
	jmp	.L188	;
.L34:
; src/lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, %cl	;, _450
	jne	.L38	;,
	testb	%sil, %sil	; tmp369
	je	.L38	;,
; src/lexer.c:119:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp537
; src/lexer.c:118:             size_t start = lexer->position + 1;
	incq	%rbp	; start
; src/lexer.c:107:         char p = peek_next_char(lexer);
	movb	$42, %dl	;, p
; src/lexer.c:119:             size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %r13	;, column_start
; src/lexer.c:60:     char c = get_current_char(lexer);
	movb	$47, %al	;, c
.L39:
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	je	.L193	;,
.L43:
; src/lexer.c:121:                 c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	; lexer_269(D)->position, _457
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r8, %rdx	; _446, _457
	jnb	.L40	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rcx	; lexer_269(D)->source, lexer_269(D)->source
	movb	(%rcx,%rdx), %dl	; *_460, p
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L41	;,
	jmp	.L79	;
.L40:
	cmpb	$10, %al	;, c
	jne	.L42	;,
; src/lexer.c:40:         return '\0';
	xorl	%edx, %edx	; p
.L79:
; src/lexer.c:46:     lexer->column = 0;
	xorl	%r9d, %r9d	;
; src/lexer.c:45:     lexer->line++;
	incq	24(%rbx)	; lexer_269(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	%r9, 32(%rbx)	;, lexer_269(D)->column
.L41:
; src/lexer.c:124:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	je	.L42	;,
; src/lexer.c:125:                 assert(c != '\0');
	testb	%al, %al	; c
	jne	.L39	;,
; src/lexer.c:125:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp386
	movl	$125, %edx	;,
	leaq	.LC2(%rip), %rsi	;, tmp387
	leaq	.LC3(%rip), %rdi	;, tmp388
	call	__assert_fail@PLT	;
.L193:
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$47, %dl	;, p
	jne	.L43	;,
	jmp	.L194	;
.L42:
; src/lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	jne	.L83	;,
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	decq	8(%rbx)	; lexer_269(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	; lexer_269(D)->column
.L83:
; src/lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rsi	; lexer_269(D)->line, lexer_269(D)->line
	movq	%rbp, %rdx	; start,
	leaq	.LC4(%rip), %rdi	;, tmp394
	call	lexer_error	;
; src/lexer.c:130:                 if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L184	;,
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %r12	; lexer_269(D)->line, _87
	movq	8(%rbx), %rsi	; lexer_269(D)->position, tmp396
.L189:
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_269(D)->source, start
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rbp, %rsi	; start, tmp403
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rbp, %rdi	; start, start
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	create_string@PLT	;
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r13, %rcx	; column_start,
	movq	%r12, %rdx	; _94,
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rsi	; tmp525, _100
.L188:
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movl	$7, %edi	;,
	jmp	.L185	;
.L38:
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %cl	;, _450
	sete	%dl	;, tmp406
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L46	;,
	testb	%dl, %dl	; tmp406
	je	.L46	;,
; src/lexer.c:139:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp542
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp409
	jmp	.L186	;
.L46:
; src/lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L47	;,
	testb	%dl, %dl	; tmp406
	je	.L47	;,
; src/lexer.c:142:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp543
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp415
	jmp	.L186	;
.L47:
; src/lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L48	;,
	testb	%dl, %dl	; tmp406
	je	.L48	;,
; src/lexer.c:145:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp544
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp421
	jmp	.L186	;
.L48:
; src/lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L49	;,
	testb	%dl, %dl	; tmp406
	je	.L49	;,
; src/lexer.c:148:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp545
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp427
	jmp	.L186	;
.L49:
; src/lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L50	;,
	testb	%dl, %dl	; tmp406
	je	.L50	;,
; src/lexer.c:151:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp546
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp433
	jmp	.L186	;
.L50:
; src/lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L51	;,
	testb	%dl, %dl	; tmp406
	je	.L51	;,
; src/lexer.c:154:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp547
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp439
	jmp	.L186	;
.L51:
; src/lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L52	;,
	testb	%dl, %dl	; tmp406
	je	.L52	;,
; src/lexer.c:157:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp548
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp445
	jmp	.L186	;
.L52:
; src/lexer.c:159:         } else if (c == '/' && p == '=') {
	testb	%sil, %sil	; tmp369
	je	.L53	;,
	testb	%dl, %dl	; tmp406
	je	.L53	;,
; src/lexer.c:160:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp549
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp449
	jmp	.L186	;
.L53:
; src/lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L54	;,
	testb	%dl, %dl	; tmp406
	je	.L54	;,
; src/lexer.c:163:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp550
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp455
	jmp	.L186	;
.L54:
; src/lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L55	;,
	cmpb	$38, %cl	;, _450
	jne	.L55	;,
; src/lexer.c:166:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp551
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp463
	jmp	.L186	;
.L55:
; src/lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L56	;,
	cmpb	$124, %cl	;, _450
	jne	.L56	;,
; src/lexer.c:169:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_269(D)->column, tmp552
	movq	24(%rbx), %rdx	; lexer_269(D)->line, lexer_269(D)->line
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	leaq	-2(%rax), %rcx	;, tmp471
	jmp	.L186	;
.L56:
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rcx	; lexer_269(D)->column, tmp553
; src/lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	24(%rbx), %rsi	; lexer_269(D)->line, pretmp_467
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	decq	%rcx	; _466
	cmpb	$62, %al	;, c
	jg	.L57	;,
	cmpb	$32, %al	;, c
	jle	.L58	;,
	subl	$33, %eax	;, tmp476
	cmpb	$29, %al	;, tmp476
	ja	.L58	;,
	leaq	.L60(%rip), %rdx	;, tmp478
	movzbl	%al, %eax	; tmp476, tmp477
	movslq	(%rdx,%rax,4), %rax	;, tmp480
	addq	%rdx, %rax	; tmp478, tmp481
	notrack jmp	*%rax	; tmp481
	.section	.rodata
	.align 4
	.align 4
.L60:
	.long	.L73-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L72-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L71-.L60
	.long	.L70-.L60
	.long	.L69-.L60
	.long	.L68-.L60
	.long	.L67-.L60
	.long	.L66-.L60
	.long	.L65-.L60
	.long	.L64-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L58-.L60
	.long	.L63-.L60
	.long	.L62-.L60
	.long	.L61-.L60
	.long	.L59-.L60
	.text
.L57:
	cmpb	$123, %al	;, c
	je	.L74	;,
	jg	.L75	;,
	cmpb	$91, %al	;, c
	je	.L76	;,
	cmpb	$93, %al	;, c
	jne	.L58	;,
; src/lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	jmp	.L186	;
.L75:
	cmpb	$125, %al	;, c
	jne	.L58	;,
; src/lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	jmp	.L186	;
.L71:
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	jmp	.L186	;
.L70:
; src/lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	jmp	.L186	;
.L74:
; src/lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	jmp	.L186	;
.L67:
; src/lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	jmp	.L186	;
.L73:
; src/lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	jmp	.L186	;
.L65:
; src/lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	jmp	.L186	;
.L76:
; src/lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	jmp	.L186	;
.L63:
; src/lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	jmp	.L186	;
.L68:
; src/lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	jmp	.L186	;
.L66:
; src/lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	jmp	.L186	;
.L69:
; src/lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	jmp	.L186	;
.L64:
; src/lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	jmp	.L186	;
.L72:
; src/lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	jmp	.L186	;
.L62:
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	jmp	.L186	;
.L59:
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	jmp	.L186	;
.L61:
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%rsi, %rdx	; pretmp_467,
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
.L186:
	movl	$5, %edi	;,
	jmp	.L185	;
.L58:
; src/lexer.c:210:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	%rcx, %rdx	; _466,
	leaq	.LC5(%rip), %rdi	;, tmp501
	call	lexer_error	;
; src/lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
.L183:
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
.L185:
; src/lexer.c:214: }
	addq	$16, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; src/lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	jmp	create_token	;
.L194:
	.cfi_restore_state
; src/lexer.c:134:             c = get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char	;
; src/lexer.c:135:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L184	;,
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	8(%rbx), %rax	; lexer_269(D)->position, tmp540
	movq	24(%rbx), %r12	; lexer_269(D)->line, _94
	leaq	-2(%rax), %rsi	;, tmp401
	jmp	.L189	;
	.cfi_endproc
.LFE57:
	.size	next_token, .-next_token
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
.LFB50:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp	; tmp86, source
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %edi	;,
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx	; tmp87, length
	pushq	%rax	;
	.cfi_def_cfa_offset 32
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory@PLT	;
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
; src/lexer.c:14:     lexer->current_token = 0;
	movq	%rcx, 64(%rax)	;, lexer_3->peeked_column
	movq	%rcx, 72(%rax)	;, lexer_3->current_token
; src/lexer.c:16: }
	popq	%rsi	;
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE50:
	.size	create_lexer, .-create_lexer
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
.LFB58:
	.cfi_startproc
	endbr64	
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	40(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:216: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
; src/lexer.c:216: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rdi, %rbx	; tmp95, lexer
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	; <retval>
	je	.L198	;,
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	48(%rdi), %rdx	; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
; src/lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rdi)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	%rdx, 8(%rdi)	; lexer_8(D)->peeked_position, lexer_8(D)->position
; src/lexer.c:220:         lexer->line = lexer->peeked_line;
	movq	56(%rdi), %rdx	; lexer_8(D)->peeked_line, lexer_8(D)->peeked_line
	movq	%rdx, 24(%rdi)	; lexer_8(D)->peeked_line, lexer_8(D)->line
; src/lexer.c:221:         lexer->column = lexer->peeked_column;
	movq	64(%rdi), %rdx	; lexer_8(D)->peeked_column, lexer_8(D)->peeked_column
	movq	%rdx, 32(%rdi)	; lexer_8(D)->peeked_column, lexer_8(D)->column
; src/lexer.c:222:         lexer->peeked_token = 0;
	xorl	%edx, %edx	;
	movq	%rdx, 40(%rdi)	;, lexer_8(D)->peeked_token
; src/lexer.c:223:         return lexer->current_token;
	jmp	.L197	;
.L198:
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_8(D)->current_token
.L197:
; src/lexer.c:227: }
	popq	%rbx	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE58:
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
.LFB59:
	.cfi_startproc
	endbr64	
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	movq	40(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	; <retval>
	jne	.L204	;,
; src/lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
; src/lexer.c:235:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx	; tmp98, lexer
	pushq	%rax	;
	.cfi_def_cfa_offset 48
; src/lexer.c:232:     size_t saved_position = lexer->position;
	movq	8(%rdi), %r13	; lexer_9(D)->position, saved_position
; src/lexer.c:233:     size_t saved_line = lexer->line;
	movq	24(%rdi), %r12	; lexer_9(D)->line, saved_line
; src/lexer.c:234:     size_t saved_column = lexer->column;
	movq	32(%rdi), %rbp	; lexer_9(D)->column, saved_column
; src/lexer.c:235:     Token* token = get_next_token(lexer, skip_comment);
	call	get_next_token	;
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	8(%rbx), %rdx	; lexer_9(D)->position, lexer_9(D)->position
; src/lexer.c:239:     lexer->position = saved_position;
	movq	%r13, 8(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:242:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	%rdx, 48(%rbx)	; lexer_9(D)->position, lexer_9(D)->peeked_position
; src/lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	24(%rbx), %rdx	; lexer_9(D)->line, lexer_9(D)->line
; src/lexer.c:240:     lexer->line = saved_line;
	movq	%r12, 24(%rbx)	; saved_line, lexer_9(D)->line
; src/lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	%rdx, 56(%rbx)	; lexer_9(D)->line, lexer_9(D)->peeked_line
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
; src/lexer.c:241:     lexer->column = saved_column;
	movq	%rbp, 32(%rbx)	; saved_column, lexer_9(D)->column
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:244: }
	popq	%rdx	;
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
.L204:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret	
	.cfi_endproc
.LFE59:
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
.LFB60:
	.cfi_startproc
	endbr64	
; src/lexer.c:247:     return lexer->current_token;
	movq	72(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:248: }
	ret	
	.cfi_endproc
.LFE60:
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
.LFB61:
	.cfi_startproc
	endbr64	
; src/lexer.c:254:     lexer->peeked_token = 0;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rdi)	;, lexer_2(D)->position
	movq	%rax, 24(%rdi)	;, lexer_2(D)->line
	movq	%rax, 32(%rdi)	;, lexer_2(D)->column
; src/lexer.c:258:     lexer->current_token = 0;
	movq	%rax, 40(%rdi)	;, lexer_2(D)->peeked_token
	movq	%rax, 48(%rdi)	;, lexer_2(D)->peeked_position
	movq	%rax, 56(%rdi)	;, lexer_2(D)->peeked_line
	movq	%rax, 64(%rdi)	;, lexer_2(D)->peeked_column
	movq	%rax, 72(%rdi)	;, lexer_2(D)->current_token
; src/lexer.c:259: }
	ret	
	.cfi_endproc
.LFE61:
	.size	reset_lexer, .-reset_lexer
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_token"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

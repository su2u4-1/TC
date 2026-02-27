	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.type	get_current_char.isra.0, @function
get_current_char.isra.0:
.LFB79:
	.cfi_startproc
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rdi), %rax	; lexer_1(D)->position, _2
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	16(%rdi), %rax	; lexer_1(D)->length, _2
	jnb	.L1	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, tmp88
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rdi)	;, lexer_1(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rdi)	; tmp88, lexer_1(D)->position
.L1:
; src/lexer.c:36: }
	ret	
	.cfi_endproc
.LFE79:
	.size	get_current_char.isra.0, .-get_current_char.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Unterminated string literal"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.section	.rodata.str1.1
.LC2:
	.string	"src/lexer.c"
.LC3:
	.string	"c != '\\0'"
.LC4:
	.string	"Unterminated comment"
.LC5:
	.string	"Unexpected character"
	.text
	.p2align 4
	.type	next_token, @function
next_token:
.LFB72:
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
	movq	%rdi, %rbx	; tmp516, lexer
	subq	$16, %rsp	;,
	.cfi_def_cfa_offset 64
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rdi), %rcx	; lexer_217(D)->position, _233
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rdi), %rdx	; lexer_217(D)->length, _219
; src/lexer.c:34:     lexer->column++;
	movq	32(%rdi), %r12	; lexer_217(D)->column, prephitmp_694
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rcx	; _219, _233
	jnb	.L5	;,
; src/lexer.c:34:     lexer->column++;
	leaq	1(%r12), %r8	;, prephitmp_400
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rcx), %rbp	;, prephitmp_248
	movl	%esi, %r13d	; tmp517, skip_comment
; src/lexer.c:34:     lexer->column++;
	movq	%r8, 32(%rdi)	; prephitmp_400, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rdi), %rdi	; lexer_217(D)->source, _260
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_248, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	(%rdi,%rcx), %r9	;, _262
	movzbl	(%r9), %eax	; *_262, c
	cmpb	$32, %al	;, c
	ja	.L6	;,
	leaq	.L8(%rip), %r10	;, tmp335
	movzbl	%al, %esi	; c, c
	movslq	(%r10,%rsi,4), %rsi	;, tmp337
	addq	%r10, %rsi	; tmp335, tmp338
	notrack jmp	*%rsi	; tmp338
	.section	.rodata
	.align 4
	.align 4
.L8:
	.long	.L93-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L196-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L196-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L196-.L8
	.text
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r8, %r12	; prephitmp_400, prephitmp_694
	.p2align 4,,10
	.p2align 3
.L5:
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	%r12, %xmm1	; prephitmp_694, prephitmp_694
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm1, %xmm0	; prephitmp_694, tmp340
	movaps	%xmm0, (%rsp)	; tmp340, %sfp
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp340
; src/lexer.c:20:     token->type = type;
	movl	$0, 24(%rax)	;, token_264->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	$0, (%rax)	;, token_264->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp340,
.L4:
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
	ret	
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_217(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_217(D)->column
.L196:
; src/lexer.c:214: }
	addq	$16, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
; src/lexer.c:136:                 return next_token(lexer, skip_comment);
	movsbl	%r13b, %esi	; skip_comment, skip_comment
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
; src/lexer.c:136:                 return next_token(lexer, skip_comment);
	jmp	next_token	;
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	cmpb	$90, %al	;, c
	jg	.L11	;,
	cmpb	$64, %al	;, c
	jg	.L12	;,
	cmpb	$34, %al	;, c
	je	.L13	;,
	leal	-48(%rax), %esi	;, tmp344
	cmpb	$9, %sil	;, tmp344
	jbe	.L15	;,
	jmp	.L197	;
	.p2align 4,,10
	.p2align 3
.L199:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_248
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_400
	movq	%r8, 32(%rbx)	; prephitmp_400, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_248, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_260 + -1B + _279 * 1], c
.L15:
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %esi	;, tmp356
	cmpb	$9, %sil	;, tmp356
	ja	.L198	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jb	.L199	;,
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
.L23:
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r8	;, tmp360
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _621
	movq	%r12, %xmm4	; prephitmp_694, prephitmp_694
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r9, %rdi	; _262,
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _621, lexer_217(D)->position
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rcx, %rsi	; _233, tmp363
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r8, 32(%rbx)	; tmp360, lexer_217(D)->column
	punpcklqdq	%xmm4, %xmm0	; prephitmp_694, tmp361
	movaps	%xmm0, (%rsp)	; tmp361, %sfp
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string@PLT	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp523, _35
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp361
; src/lexer.c:20:     token->type = type;
	movl	%r13d, 24(%rax)	; type, token_299->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _35,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp361,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al	;, c
	jne	.L200	;,
.L12:
	movabsq	$288230372997595135, %rsi	;, tmp515
	jmp	.L17	;
	.p2align 4,,10
	.p2align 3
.L202:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_248
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_400
	movq	%r8, 32(%rbx)	; prephitmp_400, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_248, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_260 + -1B + _270 * 1], c
.L17:
	cmpb	$57, %al	;, c
	jle	.L201	;,
	subl	$65, %eax	;, _208
	cmpb	$57, %al	;, _208
	ja	.L18	;,
	btq	%rax, %rsi	; _208, tmp515
	jnc	.L18	;,
.L20:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jb	.L202	;,
.L18:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _615
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r8	;, tmp350
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r9, %rdi	; _262,
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _615, lexer_217(D)->position
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rcx, %rsi	; _233, tmp351
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r8, 32(%rbx)	; tmp350, lexer_217(D)->column
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string@PLT	;
; src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rbp	; tmp519, content
; src/lexer.c:75:         if (is_keyword(content))
	call	is_keyword@PLT	;
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; tmp520
	je	.L22	;,
	movq	%r12, %xmm2	; prephitmp_694, prephitmp_694
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm2, %xmm0	; prephitmp_694, tmp352
	movaps	%xmm0, (%rsp)	; tmp352, %sfp
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp352
; src/lexer.c:20:     token->type = type;
	movl	$6, 24(%rax)	;, token_274->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp352,
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L200:
	leal	-97(%rax), %esi	;, tmp345
	cmpb	$25, %sil	;, tmp345
	jbe	.L12	;,
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jnb	.L203	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rdi,%rcx), %r9d	; *_421, _420
; src/lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _472
.L43:
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	;, _420
	sete	%sil	;, tmp509
	movl	%esi, %edx	; tmp509, _512
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L85	;,
	testb	%sil, %sil	; tmp509
	je	.L85	;,
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r12), %rax	;, tmp428
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rcx	;, tmp429
	movq	%r12, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; tmp428, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp429, lexer_217(D)->position
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp430
; src/lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	EQ_SYMBOL(%rip), %rbx	; EQ_SYMBOL, EQ_SYMBOL.9_92
	movaps	%xmm0, (%rsp)	; tmp430, %sfp
.L192:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp436
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; NE_SYMBOL.10_98,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp436,
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%r12, %xmm3	; prephitmp_694, prephitmp_694
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm3, %xmm0	; prephitmp_694, tmp354
	movaps	%xmm0, (%rsp)	; tmp354, %sfp
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp354
; src/lexer.c:20:     token->type = type;
	movl	$1, 24(%rax)	;, token_275->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp354,
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L13:
; src/lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	; _310
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jnb	.L27	;,
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r12), %rax	;, tmp364
	movq	%rax, 32(%rbx)	; tmp364, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	2(%rcx), %rax	;, tmp365
	movq	%rax, 8(%rbx)	; tmp365, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	1(%rdi,%rcx), %r13d	; *_302, _310
.L27:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rsi	;, tmp514
	jmp	.L28	;
	.p2align 4,,10
	.p2align 3
.L205:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, tmp366
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp366, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rdi,%rax), %r13d	; *_309, _310
.L28:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r13b	;, _310
	jbe	.L204	;,
.L30:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_217(D)->position, _305
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _219, _305
	jb	.L205	;,
; src/lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	; _310
.L29:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %r14	; lexer_217(D)->line, pretmp_695
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %r13b	;, _310
	je	.L31	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%r14), %rcx	;, tmp371
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %r8	; prephitmp_248,
	leaq	.LC0(%rip), %r9	;,
	leaq	.LC1(%rip), %rdx	;, tmp373
	movl	$2, %esi	;,
	call	__fprintf_chk@PLT	;
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r13b	;, _310
	je	.L32	;,
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, prephitmp_63
.L33:
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_217(D)->source, prephitmp_248
	movq	%r12, %xmm5	; prephitmp_694, prephitmp_694
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %rsi	; prephitmp_248, tmp376
	punpcklqdq	%xmm5, %xmm0	; prephitmp_694, tmp375
	notq	%rsi	; tmp376
	addq	8(%rbx), %rsi	; lexer_217(D)->position, tmp378
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; prephitmp_248, prephitmp_248
	movaps	%xmm0, (%rsp)	; tmp375, %sfp
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string@PLT	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp525, _46
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp375
; src/lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	;, token_313->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _46,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp375,
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L204:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r13, %rsi	; _310, tmp514
	jc	.L30	;,
	jmp	.L29	;
.L197:
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%sil	;, tmp386
	movl	%esi, %r10d	; tmp386, _472
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jnb	.L91	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rdi,%rcx), %r9d	; *_315, _420
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	;, _420
	jne	.L38	;,
	testb	%sil, %sil	; tmp386
	je	.L38	;,
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	;, _323
	jmp	.L36	;
	.p2align 4,,10
	.p2align 3
.L206:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_248
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_400
	movq	%r8, 32(%rbx)	; prephitmp_400, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_248, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_260 + -1B + _321 * 1], _323
.L36:
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, _323
	je	.L39	;,
	testb	%al, %al	; _323
	je	.L39	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jb	.L206	;,
.L39:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _630
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r8	;, tmp393
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _630, lexer_217(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r8, 32(%rbx)	; tmp393, lexer_217(D)->column
; src/lexer.c:114:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L196	;,
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	%r12, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:109:             size_t start = lexer->position + 1;
	addq	$2, %rcx	;, start
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rcx, %rsi	; start, tmp397
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rcx, %rdi	; start, tmp398
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp395
	movaps	%xmm0, (%rsp)	; tmp395, %sfp
.L191:
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string@PLT	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp531, _78
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp414
; src/lexer.c:20:     token->type = type;
	movl	$7, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _78,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp414,
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	;
.L198:
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jnb	.L23	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	jne	.L23	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	leaq	(%rdi,%rbp), %rsi	;, _284
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rsi), %eax	; *_284, tmp570
	subl	$48, %eax	;, tmp357
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp357
	ja	.L23	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_400
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_248
; src/lexer.c:34:     lexer->column++;
	movq	%r8, 32(%rbx)	; prephitmp_400, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_248, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rsi), %eax	; *_284, _297
	jmp	.L25	;
	.p2align 4,,10
	.p2align 3
.L207:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_248
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_400
	movq	%r8, 32(%rbx)	; prephitmp_400, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_248, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_260 + -1B + _295 * 1], _297
.L25:
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp359
	cmpb	$9, %al	;, tmp359
	ja	.L98	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _219, prephitmp_248
	jb	.L207	;,
.L98:
; src/lexer.c:90:             type = FLOAT;
	movl	$3, %r13d	;, type
	jmp	.L23	;
.L31:
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %rsi	; prephitmp_248, tmp381
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; prephitmp_248, tmp384
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	notq	%rsi	; tmp381
	addq	8(%rbx), %rsi	; lexer_217(D)->position, tmp383
	call	create_string@PLT	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp527, _52
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movq	%r14, %xmm0	; pretmp_695, tmp385
	movq	%r12, %xmm6	; prephitmp_694, prephitmp_694
	punpcklqdq	%xmm6, %xmm0	; prephitmp_694, tmp385
; src/lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	;, token_314->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _52, token_314->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp385,
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L4	;
.L32:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_217(D)->line, tmp573
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_217(D)->column
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, prephitmp_63
	movq	%rax, 24(%rbx)	; prephitmp_63, lexer_217(D)->line
	movq	%rax, %xmm0	; prephitmp_63, prephitmp_63
; src/lexer.c:47: }
	jmp	.L33	;
.L203:
; src/lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _472
.L91:
; src/lexer.c:40:         return '\0';
	xorl	%r9d, %r9d	; _420
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	xorl	%edx, %edx	; _512
.L35:
; src/lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L56	;,
	testb	%dl, %dl	; _512
	jne	.L208	;,
.L56:
; src/lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L57	;,
	testb	%dl, %dl	; _512
	jne	.L209	;,
.L57:
; src/lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L58	;,
	testb	%dl, %dl	; _512
	jne	.L210	;,
.L59:
; src/lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L60	;,
	testb	%dl, %dl	; _512
	jne	.L211	;,
.L60:
; src/lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L61	;,
	cmpb	$38, %r9b	;, _420
	je	.L212	;,
.L61:
; src/lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L62	;,
	cmpb	$124, %r9b	;, _420
	je	.L213	;,
.L62:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rdx	; lexer_217(D)->line, pretmp_696
	movq	%r12, %xmm6	; prephitmp_694, prephitmp_694
	subl	$33, %eax	;, tmp497
	movq	%rdx, %xmm7	; pretmp_696, _616
	punpcklqdq	%xmm6, %xmm7	; prephitmp_694, _616
	movaps	%xmm7, (%rsp)	; _616, %sfp
	cmpb	$92, %al	;, tmp497
	ja	.L63	;,
	leaq	.L65(%rip), %rcx	;, tmp499
	movzbl	%al, %eax	; tmp497, tmp498
	movslq	(%rcx,%rax,4), %rax	;, tmp501
	addq	%rcx, %rax	; tmp499, tmp502
	notrack jmp	*%rax	; tmp502
	.section	.rodata
	.align 4
	.align 4
.L65:
	.long	.L82-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L81-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L80-.L65
	.long	.L79-.L65
	.long	.L78-.L65
	.long	.L77-.L65
	.long	.L76-.L65
	.long	.L75-.L65
	.long	.L74-.L65
	.long	.L73-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L72-.L65
	.long	.L71-.L65
	.long	.L70-.L65
	.long	.L69-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L68-.L65
	.long	.L63-.L65
	.long	.L67-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L63-.L65
	.long	.L66-.L65
	.long	.L63-.L65
	.long	.L64-.L65
	.text
.L63:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rdx), %rcx	;, tmp504
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC1(%rip), %rdx	;, tmp506
	leaq	.LC5(%rip), %r9	;,
	call	__fprintf_chk@PLT	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
; src/lexer.c:20:     token->type = type;
	xorl	%edx, %edx	;
; src/lexer.c:21:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	;
; src/lexer.c:22:     token->line = line;
	pxor	%xmm0, %xmm0	; tmp507
; src/lexer.c:20:     token->type = type;
	movl	%edx, 24(%rax)	;, token_377->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	;, token_377->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp507,
; src/lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	jmp	.L4	;
.L38:
; src/lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	;, _420
	jne	.L43	;,
	testb	%sil, %sil	; tmp386
	je	.L43	;,
; src/lexer.c:118:             size_t start = lexer->position + 1;
	leaq	2(%rcx), %rbp	;, start
; src/lexer.c:107:         char p = peek_next_char(lexer);
	movl	$42, %eax	;, p
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %esi	;, c
	.p2align 4,,10
	.p2align 3
.L44:
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %sil	;, c
	jne	.L158	;,
	cmpb	$47, %al	;, p
	je	.L214	;,
.L158:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_217(D)->position, _329
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _219, _329
	jnb	.L45	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	;, _332
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	; _332, lexer_217(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rdi,%rax), %esi	; *_333, c
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r8	; _219, _332
	jnb	.L215	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rdi,%rax), %eax	; *_326, p
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %sil	;, c
	jne	.L49	;,
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_217(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_217(D)->column
; src/lexer.c:124:                 if (p == '\0') break;
	testb	%al, %al	; p
	jne	.L158	;,
	jmp	.L190	;
	.p2align 4,,10
	.p2align 3
.L49:
	testb	%al, %al	; p
	je	.L47	;,
; src/lexer.c:125:                 assert(c != '\0');
	testb	%sil, %sil	; c
	jne	.L44	;,
; src/lexer.c:125:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp402
	movl	$125, %edx	;,
	leaq	.LC2(%rip), %rsi	;, tmp403
	leaq	.LC3(%rip), %rdi	;, tmp404
	call	__assert_fail@PLT	;
	.p2align 4,,10
	.p2align 3
.L215:
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %sil	;, c
	jne	.L47	;,
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_217(D)->line, tmp581
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_217(D)->column
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, prephitmp_9
	movq	%rax, 24(%rbx)	; prephitmp_9, lexer_217(D)->line
.L48:
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	addq	$1, %rax	;, tmp410
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	3(%rcx), %r8	;,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC4(%rip), %r9	;,
	movq	%rax, %rcx	; tmp410,
	leaq	.LC1(%rip), %rdx	;, tmp412
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	__fprintf_chk@PLT	;
; src/lexer.c:130:                 if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L196	;,
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, tmp414
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rsi	; lexer_217(D)->position, tmp416
	movq	%r12, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_217(D)->source, start
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp414
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rbp, %rsi	; start, tmp416
	movaps	%xmm0, (%rsp)	; tmp414, %sfp
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rbp, %rdi	; start, start
	jmp	.L191	;
.L214:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_217(D)->position, _339
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _219, _339
	jnb	.L89	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, tmp420
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_217(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	; tmp420, lexer_217(D)->position
.L89:
; src/lexer.c:135:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L196	;,
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, tmp422
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	8(%rbx), %rsi	; lexer_217(D)->position, lexer_217(D)->position
	movq	%r12, %xmm6	; prephitmp_694, prephitmp_694
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rbp, %rdi	; start, tmp427
	punpcklqdq	%xmm6, %xmm0	; prephitmp_694, tmp422
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	$2, %rsi	;, tmp424
	movaps	%xmm0, (%rsp)	; tmp422, %sfp
	subq	%rbp, %rsi	; start, tmp426
	jmp	.L191	;
.L47:
; src/lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	testb	%sil, %sil	; c
	jne	.L190	;,
	.p2align 4,,10
	.p2align 3
.L45:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	;, lexer_217(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_217(D)->column
.L190:
; src/lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rax	; lexer_217(D)->line, prephitmp_9
; src/lexer.c:57: }
	jmp	.L48	;
.L58:
; src/lexer.c:159:         } else if (c == '/' && p == '=') {
	testb	%dl, %dl	; _512
	je	.L59	;,
	testb	%r10b, %r10b	; _472
	je	.L59	;,
; src/lexer.c:160:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp599
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.16_133
	subq	$2, %rax	;, tmp471
	movq	%rax, %xmm6	; tmp471, tmp471
	punpcklqdq	%xmm6, %xmm0	; tmp471, tmp470
	movaps	%xmm0, (%rsp)	; tmp470, %sfp
	jmp	.L192	;
.L208:
; src/lexer.c:151:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp593
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.13_116
	subq	$2, %rax	;, tmp455
	movq	%rax, %xmm7	; tmp455, tmp455
	punpcklqdq	%xmm7, %xmm0	; tmp455, tmp454
	movaps	%xmm0, (%rsp)	; tmp454, %sfp
	jmp	.L192	;
.L209:
; src/lexer.c:154:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp595
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.14_122
	subq	$2, %rax	;, tmp461
	movq	%rax, %xmm6	; tmp461, tmp461
	punpcklqdq	%xmm6, %xmm0	; tmp461, tmp460
	movaps	%xmm0, (%rsp)	; tmp460, %sfp
	jmp	.L192	;
.L210:
; src/lexer.c:157:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp597
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.15_128
	subq	$2, %rax	;, tmp467
	movq	%rax, %xmm7	; tmp467, tmp467
	punpcklqdq	%xmm7, %xmm0	; tmp467, tmp466
	movaps	%xmm0, (%rsp)	; tmp466, %sfp
	jmp	.L192	;
.L211:
; src/lexer.c:163:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp601
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.17_139
	subq	$2, %rax	;, tmp477
	movq	%rax, %xmm7	; tmp477, tmp477
	punpcklqdq	%xmm7, %xmm0	; tmp477, tmp476
	movaps	%xmm0, (%rsp)	; tmp476, %sfp
	jmp	.L192	;
.L212:
; src/lexer.c:166:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp603
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	AND_SYMBOL(%rip), %rbx	; AND_SYMBOL, AND_SYMBOL.18_146
	subq	$2, %rax	;, tmp485
	movq	%rax, %xmm6	; tmp485, tmp485
	punpcklqdq	%xmm6, %xmm0	; tmp485, tmp484
	movaps	%xmm0, (%rsp)	; tmp484, %sfp
	jmp	.L192	;
.L213:
; src/lexer.c:169:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp605
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	OR_SYMBOL(%rip), %rbx	; OR_SYMBOL, OR_SYMBOL.19_153
	subq	$2, %rax	;, tmp493
	movq	%rax, %xmm7	; tmp493, tmp493
	punpcklqdq	%xmm7, %xmm0	; tmp493, tmp492
	movaps	%xmm0, (%rsp)	; tmp492, %sfp
	jmp	.L192	;
.L85:
; src/lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L55	;,
	testb	%sil, %sil	; tmp509
	jne	.L216	;,
.L55:
; src/lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L88	;,
	testb	%sil, %sil	; tmp509
	je	.L88	;,
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	%r12, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r12), %rax	;, tmp440
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rcx	;, tmp441
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; tmp440, lexer_217(D)->column
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp442
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp441, lexer_217(D)->position
; src/lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	LE_SYMBOL(%rip), %rbx	; LE_SYMBOL, LE_SYMBOL.11_104
	movaps	%xmm0, (%rsp)	; tmp442, %sfp
	jmp	.L192	;
.L216:
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	%r12, %xmm6	; prephitmp_694, prephitmp_694
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r12), %rax	;, tmp434
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rcx	;, tmp435
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; tmp434, lexer_217(D)->column
	punpcklqdq	%xmm6, %xmm0	; prephitmp_694, tmp436
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp435, lexer_217(D)->position
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	NE_SYMBOL(%rip), %rbx	; NE_SYMBOL, NE_SYMBOL.10_98
	movaps	%xmm0, (%rsp)	; tmp436, %sfp
	jmp	.L192	;
.L88:
; src/lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L35	;,
	testb	%sil, %sil	; tmp509
	je	.L35	;,
; src/lexer.c:148:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_217(D)->column, tmp591
	movq	24(%rbx), %xmm0	; lexer_217(D)->line, lexer_217(D)->line
	movq	GE_SYMBOL(%rip), %rbx	; GE_SYMBOL, GE_SYMBOL.12_110
	subq	$2, %rax	;, tmp449
	movq	%rax, %xmm6	; tmp449, tmp449
	punpcklqdq	%xmm6, %xmm0	; tmp449, tmp448
	movaps	%xmm0, (%rsp)	; tmp448, %sfp
	jmp	.L192	;
.L64:
; src/lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACE_SYMBOL(%rip), %rbx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.23_161
.L195:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm6	; %sfp, _616
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; LT_SYMBOL.36_187,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	; _616,
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	;
.L66:
; src/lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACE_SYMBOL(%rip), %rbx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.22_159
.L194:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm7	; %sfp, _616
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; GT_SYMBOL.37_189,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm7, 8(%rax)	; _616,
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	;
.L201:
	cmpb	$47, %al	;, c
	jg	.L20	;,
	jmp	.L18	;
.L67:
; src/lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACKET_SYMBOL(%rip), %rbx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.28_171
.L193:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm5	; %sfp, _616
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ASSIGN_SYMBOL.38_191,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm5, 8(%rax)	; _616,
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	;
.L68:
; src/lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACKET_SYMBOL(%rip), %rbx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.27_169
	jmp	.L194	;
.L69:
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	GT_SYMBOL(%rip), %rbx	; GT_SYMBOL, GT_SYMBOL.37_189
	jmp	.L194	;
.L70:
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	ASSIGN_SYMBOL(%rip), %rbx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_191
	jmp	.L193	;
.L71:
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	LT_SYMBOL(%rip), %rbx	; LT_SYMBOL, LT_SYMBOL.36_187
	jmp	.L195	;
.L72:
; src/lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	SEMICOLON_SYMBOL(%rip), %rbx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.29_173
	jmp	.L195	;
.L73:
; src/lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	DIV_SYMBOL(%rip), %rbx	; DIV_SYMBOL, DIV_SYMBOL.34_183
	jmp	.L194	;
.L74:
; src/lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	DOT_SYMBOL(%rip), %rbx	; DOT_SYMBOL, DOT_SYMBOL.26_167
	jmp	.L195	;
.L75:
; src/lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	SUB_SYMBOL(%rip), %rbx	; SUB_SYMBOL, SUB_SYMBOL.32_179
	jmp	.L193	;
.L76:
; src/lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	COMMA_SYMBOL(%rip), %rbx	; COMMA_SYMBOL, COMMA_SYMBOL.24_163
	jmp	.L194	;
.L77:
; src/lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	ADD_SYMBOL(%rip), %rbx	; ADD_SYMBOL, ADD_SYMBOL.31_177
	jmp	.L194	;
.L78:
; src/lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	MUL_SYMBOL(%rip), %rbx	; MUL_SYMBOL, MUL_SYMBOL.33_181
	jmp	.L195	;
.L79:
; src/lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_PAREN_SYMBOL(%rip), %rbx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.21_157
	jmp	.L195	;
.L80:
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_PAREN_SYMBOL(%rip), %rbx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.20_155
	jmp	.L194	;
.L81:
; src/lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	MOD_SYMBOL(%rip), %rbx	; MOD_SYMBOL, MOD_SYMBOL.35_185
	jmp	.L193	;
.L82:
; src/lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	NOT_SYMBOL(%rip), %rbx	; NOT_SYMBOL, NOT_SYMBOL.25_165
	jmp	.L193	;
	.cfi_endproc
.LFE72:
	.size	next_token, .-next_token
	.p2align 4
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
.LFB65:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp	; tmp87, source
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %edi	;,
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx	; tmp88, length
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 32
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory@PLT	;
; src/lexer.c:11:     lexer->peeked_position = 0;
	pxor	%xmm0, %xmm0	; tmp85
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
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 64(%rax)	;, lexer_3->peeked_column
; src/lexer.c:14:     lexer->current_token = 0;
	movq	$0, 72(%rax)	;, lexer_3->current_token
; src/lexer.c:11:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rax)	; tmp85, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_3 + 48B]
; src/lexer.c:16: }
	addq	$8, %rsp	;,
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE65:
	.size	create_lexer, .-create_lexer
	.p2align 4
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
.LFB73:
	.cfi_startproc
	endbr64	
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	40(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:216: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
; src/lexer.c:216: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rdi, %rbx	; tmp93, lexer
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	; <retval>
	je	.L220	;,
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	48(%rdi), %rdx	; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
; src/lexer.c:227: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 8
; src/lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rdi)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:220:         lexer->line = lexer->peeked_line;
	movdqu	56(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 56B], tmp97
; src/lexer.c:222:         lexer->peeked_token = 0;
	movq	$0, 40(%rdi)	;, lexer_8(D)->peeked_token
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	%rdx, 8(%rdi)	; lexer_8(D)->peeked_position, lexer_8(D)->position
; src/lexer.c:220:         lexer->line = lexer->peeked_line;
	movups	%xmm0, 24(%rdi)	; tmp97, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
; src/lexer.c:227: }
	ret	
	.p2align 4,,10
	.p2align 3
.L220:
	.cfi_restore_state
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:227: }
	popq	%rbx	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE73:
	.size	get_next_token, .-get_next_token
	.p2align 4
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
.LFB74:
	.cfi_startproc
	endbr64	
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	movq	40(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	; <retval>
	je	.L229	;,
; src/lexer.c:244: }
	ret	
	.p2align 4,,10
	.p2align 3
.L229:
; src/lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx	; tmp100, lexer
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 48
; src/lexer.c:233:     size_t saved_line = lexer->line;
	movdqu	24(%rdi), %xmm1	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
; src/lexer.c:232:     size_t saved_position = lexer->position;
	movq	8(%rdi), %rbp	; lexer_9(D)->position, saved_position
; src/lexer.c:233:     size_t saved_line = lexer->line;
	movaps	%xmm1, (%rsp)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], %sfp
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	call	next_token	;
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movdqu	8(%rbx), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 8B], vect__3.202
	movdqu	24(%rbx), %xmm2	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], tmp105
; src/lexer.c:239:     lexer->position = saved_position;
	movq	%rbp, 8(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
; src/lexer.c:240:     lexer->line = saved_line;
	movdqa	(%rsp), %xmm1	; %sfp, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
; src/lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_9(D)->current_token
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm2, %xmm0	; tmp105, vect__3.202
; src/lexer.c:242:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 48(%rbx)	; vect__3.202, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 48B]
; src/lexer.c:240:     lexer->line = saved_line;
	movups	%xmm1, 24(%rbx)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
; src/lexer.c:244: }
	addq	$24, %rsp	;,
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE74:
	.size	peek_next_token, .-peek_next_token
	.p2align 4
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
.LFB75:
	.cfi_startproc
	endbr64	
; src/lexer.c:247:     return lexer->current_token;
	movq	72(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:248: }
	ret	
	.cfi_endproc
.LFE75:
	.size	peek_current_token, .-peek_current_token
	.p2align 4
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
.LFB76:
	.cfi_startproc
	endbr64	
; src/lexer.c:252:     lexer->line = 0;
	pxor	%xmm0, %xmm0	; tmp83
; src/lexer.c:251:     lexer->position = 0;
	movq	$0, 8(%rdi)	;, lexer_2(D)->position
; src/lexer.c:254:     lexer->peeked_token = 0;
	movq	$0, 40(%rdi)	;, lexer_2(D)->peeked_token
; src/lexer.c:257:     lexer->peeked_column = 0;
	movq	$0, 64(%rdi)	;, lexer_2(D)->peeked_column
; src/lexer.c:258:     lexer->current_token = 0;
	movq	$0, 72(%rdi)	;, lexer_2(D)->current_token
; src/lexer.c:252:     lexer->line = 0;
	movups	%xmm0, 24(%rdi)	; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 24B]
; src/lexer.c:255:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rdi)	; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 48B]
; src/lexer.c:259: }
	ret	
	.cfi_endproc
.LFE76:
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

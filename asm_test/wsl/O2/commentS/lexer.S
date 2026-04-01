	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.p2align 4
	.type	get_current_char.isra.0, @function
get_current_char.isra.0:
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
	.size	get_current_char.isra.0, .-get_current_char.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Unterminated string literal"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
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
	.p2align 4
	.type	next_token, @function
next_token:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp505, lexer
	subq	$24, %rsp	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rdi), %rcx	; lexer_213(D)->position, _229
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rdi), %rdx	; lexer_213(D)->length, _215
; src/lexer.c:34:     lexer->column++;
	movq	32(%rdi), %r13	; lexer_213(D)->column, prephitmp_691
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rcx	; _215, _229
	jnb	.L5	;,
; src/lexer.c:34:     lexer->column++;
	leaq	1(%r13), %r8	;, prephitmp_597
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rcx), %rbp	;, prephitmp_396
	movl	%esi, %r12d	; tmp506, skip_comment
; src/lexer.c:34:     lexer->column++;
	movq	%r8, 32(%rdi)	; prephitmp_597, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rdi), %rdi	; lexer_213(D)->source, _256
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_396, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	(%rdi,%rcx), %r9	;, _258
	movzbl	(%r9), %eax	; *_258, c
	cmpb	$32, %al	;, c
	ja	.L6	;,
	leaq	.L8(%rip), %r10	;, tmp329
	movzbl	%al, %esi	; c, c
	movslq	(%r10,%rsi,4), %rsi	;, tmp331
	addq	%r10, %rsi	; tmp329, tmp332
	jmp	*%rsi	; tmp332
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
	.long	.L199-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L199-.L8
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
	.long	.L199-.L8
	.text
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r8, %r13	; prephitmp_597, prephitmp_691
	.p2align 4,,10
	.p2align 3
.L5:
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	%r13, %xmm1	; prephitmp_691, prephitmp_691
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm1, %xmm0	; prephitmp_691, tmp334
	movaps	%xmm0, (%rsp)	; tmp334, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp334
; src/lexer.c:20:     token->type = type;
	movl	$0, 24(%rax)	;, token_260->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	$0, (%rax)	;, token_260->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp334,
.L4:
; src/lexer.c:215: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L9:
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_213(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_213(D)->column
.L199:
; src/lexer.c:215: }
	addq	$24, %rsp	;,
; src/lexer.c:137:                 return next_token(lexer, skip_comment);
	movsbl	%r12b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:215: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/lexer.c:137:                 return next_token(lexer, skip_comment);
	jmp	next_token	;
	.p2align 4,,10
	.p2align 3
.L6:
	cmpb	$90, %al	;, c
	jg	.L11	;,
	cmpb	$64, %al	;, c
	jg	.L12	;,
	cmpb	$34, %al	;, c
	je	.L13	;,
	leal	-48(%rax), %esi	;, tmp338
	cmpb	$9, %sil	;, tmp338
	jbe	.L15	;,
	jmp	.L200	;
	.p2align 4,,10
	.p2align 3
.L202:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_396
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_597
	movq	%r8, 32(%rbx)	; prephitmp_597, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_396, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_256 + -1B + _275 * 1], c
.L15:
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %esi	;, tmp350
	cmpb	$9, %sil	;, tmp350
	ja	.L201	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jb	.L202	;,
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r12d	;, type
.L23:
	movq	%r13, %xmm4	; prephitmp_691, prephitmp_691
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r8	;, tmp354
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _617
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r9, %rdi	; _258,
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _617, lexer_213(D)->position
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rcx, %rsi	; _229, tmp357
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r8, 32(%rbx)	; tmp354, lexer_213(D)->column
	punpcklqdq	%xmm4, %xmm0	; prephitmp_691, tmp355
	movaps	%xmm0, (%rsp)	; tmp355, %sfp
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp512, _35
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp355
; src/lexer.c:20:     token->type = type;
	movl	%r12d, 24(%rax)	; type, token_295->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _35,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp355,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al	;, c
	jne	.L203	;,
.L12:
	movabsq	$288230372997595135, %rsi	;, tmp504
	jmp	.L17	;
	.p2align 4,,10
	.p2align 3
.L205:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_396
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_597
	movq	%r8, 32(%rbx)	; prephitmp_597, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_396, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_256 + -1B + _266 * 1], c
.L17:
	cmpb	$57, %al	;, c
	jle	.L204	;,
	subl	$65, %eax	;, _313
	cmpb	$57, %al	;, _313
	ja	.L18	;,
	btq	%rax, %rsi	; _313, tmp504
	jnc	.L18	;,
.L20:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jb	.L205	;,
.L18:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _611
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r8	;, tmp344
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r9, %rdi	; _258,
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _611, lexer_213(D)->position
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rcx, %rsi	; _229, tmp345
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r8, 32(%rbx)	; tmp344, lexer_213(D)->column
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp508, content
; src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	call	*is_keyword@GOTPCREL(%rip)	;
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; tmp509
	je	.L22	;,
	movq	%r13, %xmm2	; prephitmp_691, prephitmp_691
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm2, %xmm0	; prephitmp_691, tmp346
	movaps	%xmm0, (%rsp)	; tmp346, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp346
; src/lexer.c:20:     token->type = type;
	movl	$6, 24(%rax)	;, token_270->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp346,
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L203:
	leal	-97(%rax), %esi	;, tmp339
	cmpb	$25, %sil	;, tmp339
	jbe	.L12	;,
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jnb	.L206	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rdi,%rcx), %r9d	; *_400, _412
; src/lexer.c:109:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _457
.L43:
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	;, _412
	sete	%sil	;, tmp498
	movl	%esi, %edx	; tmp498, _503
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L85	;,
	testb	%sil, %sil	; tmp498
	je	.L85	;,
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp417
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rcx	;, tmp418
	movq	%r13, %xmm7	; prephitmp_691, prephitmp_691
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; tmp417, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp418, lexer_213(D)->position
	punpcklqdq	%xmm7, %xmm0	; prephitmp_691, tmp419
; src/lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	EQ_SYMBOL(%rip), %rbx	; EQ_SYMBOL, EQ_SYMBOL.9_88
	movaps	%xmm0, (%rsp)	; tmp419, %sfp
.L198:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp481
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; OR_SYMBOL.19_149,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp481,
; src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%r13, %xmm3	; prephitmp_691, prephitmp_691
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm3, %xmm0	; prephitmp_691, tmp348
	movaps	%xmm0, (%rsp)	; tmp348, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp348
; src/lexer.c:20:     token->type = type;
	movl	$1, 24(%rax)	;, token_271->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp348,
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L13:
; src/lexer.c:33:         return '\0';
	xorl	%r12d, %r12d	; _306
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jnb	.L27	;,
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp358
	movq	%rax, 32(%rbx)	; tmp358, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	2(%rcx), %rax	;, tmp359
	movq	%rax, 8(%rbx)	; tmp359, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	1(%rdi,%rcx), %r12d	; *_298, _306
.L27:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rsi	;, tmp503
	jmp	.L28	;
	.p2align 4,,10
	.p2align 3
.L208:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, tmp360
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp360, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rdi,%rax), %r12d	; *_305, _306
.L28:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r12b	;, _306
	jbe	.L207	;,
.L30:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_213(D)->position, _301
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _215, _301
	jb	.L208	;,
; src/lexer.c:33:         return '\0';
	xorl	%r12d, %r12d	; _306
.L29:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_213(D)->line, prephitmp_620
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %r12b	;, _306
	je	.L31	;,
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rax), %rcx	;, tmp365
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbp, %r8	; prephitmp_396,
	xorl	%eax, %eax	;
	leaq	.LC0(%rip), %r9	;,
	leaq	.LC1(%rip), %rdx	;, tmp367
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_213(D)->line, tmp561
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r12b	;, _306
	jne	.L31	;,
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, prephitmp_620
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_213(D)->column
; src/lexer.c:45:     lexer->line++;
	movq	%rax, 24(%rbx)	; prephitmp_620, lexer_213(D)->line
	.p2align 4,,10
	.p2align 3
.L31:
; src/lexer.c:104:         if (lexer->position - start == 1)
	movq	8(%rbx), %rsi	; lexer_213(D)->position, _41
	movq	%rax, %xmm0	; prephitmp_620, tmp369
	movq	%r13, %xmm5	; prephitmp_691, prephitmp_691
; src/lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	leaq	.LC2(%rip), %rdi	;, tmp371
	punpcklqdq	%xmm5, %xmm0	; prephitmp_691, tmp369
; src/lexer.c:104:         if (lexer->position - start == 1)
	subq	%rbp, %rsi	; prephitmp_396, _41
	movaps	%xmm0, (%rsp)	; tmp369, %sfp
; src/lexer.c:104:         if (lexer->position - start == 1)
	cmpq	$1, %rsi	;, _41
	je	.L194	;,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_213(D)->source, prephitmp_396
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	$1, %rsi	;, tmp372
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; prephitmp_396, prephitmp_396
.L194:
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp516, _48
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp369
; src/lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _48,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp369,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L207:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r12, %rsi	; _306, tmp503
	jc	.L30	;,
	jmp	.L29	;
.L200:
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%sil	;, tmp375
	movl	%esi, %r10d	; tmp375, _457
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jnb	.L91	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rdi,%rcx), %r9d	; *_311, _412
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	;, _412
	jne	.L38	;,
	testb	%sil, %sil	; tmp375
	je	.L38	;,
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	;, _319
	jmp	.L36	;
	.p2align 4,,10
	.p2align 3
.L209:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_396
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_597
	movq	%r8, 32(%rbx)	; prephitmp_597, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_396, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_256 + -1B + _317 * 1], _319
.L36:
; src/lexer.c:112:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, _319
	je	.L39	;,
	testb	%al, %al	; _319
	je	.L39	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jb	.L209	;,
.L39:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _626
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r8	;, tmp382
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _626, lexer_213(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r8, 32(%rbx)	; tmp382, lexer_213(D)->column
; src/lexer.c:115:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L199	;,
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	%r13, %xmm6	; prephitmp_691, prephitmp_691
; src/lexer.c:110:             size_t start = lexer->position + 1;
	addq	$2, %rcx	;, start
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rcx, %rsi	; start, tmp386
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rcx, %rdi	; start, tmp387
	punpcklqdq	%xmm6, %xmm0	; prephitmp_691, tmp384
	movaps	%xmm0, (%rsp)	; tmp384, %sfp
.L195:
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp520, _74
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp403
; src/lexer.c:20:     token->type = type;
	movl	$7, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _74,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp403,
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	;
.L201:
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r12d	;, type
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jnb	.L23	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	jne	.L23	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	leaq	(%rdi,%rbp), %rsi	;, _280
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rsi), %eax	; *_280, tmp559
	subl	$48, %eax	;, tmp351
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp351
	ja	.L23	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_597
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_396
; src/lexer.c:34:     lexer->column++;
	movq	%r8, 32(%rbx)	; prephitmp_597, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_396, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rsi), %eax	; *_280, _293
	jmp	.L25	;
	.p2align 4,,10
	.p2align 3
.L210:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_396
; src/lexer.c:34:     lexer->column++;
	addq	$1, %r8	;, prephitmp_597
	movq	%r8, 32(%rbx)	; prephitmp_597, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; prephitmp_396, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rdi,%rbp), %eax	; MEM[(char *)_256 + -1B + _291 * 1], _293
.L25:
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp353
	cmpb	$9, %al	;, tmp353
	ja	.L98	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _215, prephitmp_396
	jb	.L210	;,
.L98:
; src/lexer.c:90:             type = FLOAT;
	movl	$3, %r12d	;, type
	jmp	.L23	;
.L206:
; src/lexer.c:109:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _457
.L91:
; src/lexer.c:40:         return '\0';
	xorl	%r9d, %r9d	; _412
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	xorl	%edx, %edx	; _503
.L35:
; src/lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L56	;,
	testb	%dl, %dl	; _503
	jne	.L211	;,
.L56:
; src/lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L57	;,
	testb	%dl, %dl	; _503
	jne	.L212	;,
.L57:
; src/lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L58	;,
	testb	%dl, %dl	; _503
	jne	.L213	;,
.L59:
; src/lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L60	;,
	testb	%dl, %dl	; _503
	jne	.L214	;,
.L60:
; src/lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L61	;,
	cmpb	$38, %r9b	;, _412
	je	.L215	;,
.L61:
; src/lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L62	;,
	cmpb	$124, %r9b	;, _412
	je	.L216	;,
.L62:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rdx	; lexer_213(D)->line, pretmp_693
	movq	%r13, %xmm6	; prephitmp_691, prephitmp_691
	subl	$33, %eax	;, tmp486
	movq	%rdx, %xmm7	; pretmp_693, _608
	punpcklqdq	%xmm6, %xmm7	; prephitmp_691, _608
	movaps	%xmm7, (%rsp)	; _608, %sfp
	cmpb	$92, %al	;, tmp486
	ja	.L63	;,
	leaq	.L65(%rip), %rcx	;, tmp488
	movzbl	%al, %eax	; tmp486, tmp487
	movslq	(%rcx,%rax,4), %rax	;, tmp490
	addq	%rcx, %rax	; tmp488, tmp491
	jmp	*%rax	; tmp491
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
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rdx), %rcx	;, tmp493
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC1(%rip), %rdx	;, tmp495
	xorl	%eax, %eax	;
	leaq	.LC6(%rip), %r9	;,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:20:     token->type = type;
	xorl	%edx, %edx	;
; src/lexer.c:21:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	;
; src/lexer.c:22:     token->line = line;
	pxor	%xmm0, %xmm0	; tmp496
; src/lexer.c:20:     token->type = type;
	movl	%edx, 24(%rax)	;, token_373->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	;, token_373->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp496,
; src/lexer.c:212:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	.L4	;
.L38:
; src/lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	;, _412
	jne	.L43	;,
	testb	%sil, %sil	; tmp375
	je	.L43	;,
; src/lexer.c:119:             size_t start = lexer->position + 1;
	leaq	2(%rcx), %rbp	;, start
; src/lexer.c:108:         char p = peek_next_char(lexer);
	movl	$42, %eax	;, p
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %esi	;, c
	.p2align 4,,10
	.p2align 3
.L44:
; src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %sil	;, c
	jne	.L160	;,
	cmpb	$47, %al	;, p
	je	.L217	;,
.L160:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_213(D)->position, _325
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _215, _325
	jnb	.L45	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	;, _328
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	; _328, lexer_213(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rdi,%rax), %esi	; *_329, c
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r8	; _215, _328
	jnb	.L218	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rdi,%rax), %eax	; *_322, p
; src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, %sil	;, c
	jne	.L49	;,
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_213(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_213(D)->column
; src/lexer.c:125:                 if (p == '\0') break;
	testb	%al, %al	; p
	jne	.L160	;,
	jmp	.L193	;
	.p2align 4,,10
	.p2align 3
.L49:
	testb	%al, %al	; p
	je	.L47	;,
; src/lexer.c:126:                 assert(c != '\0');
	testb	%sil, %sil	; c
	jne	.L44	;,
; src/lexer.c:126:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp391
	movl	$126, %edx	;,
	leaq	.LC3(%rip), %rsi	;, tmp392
	leaq	.LC4(%rip), %rdi	;, tmp393
	call	*__assert_fail@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L218:
; src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, %sil	;, c
	jne	.L47	;,
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_213(D)->line, tmp567
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_213(D)->column
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, prephitmp_9
	movq	%rax, 24(%rbx)	; prephitmp_9, lexer_213(D)->line
.L48:
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	addq	$1, %rax	;, tmp399
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	3(%rcx), %r8	;,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC5(%rip), %r9	;,
	movq	%rax, %rcx	; tmp399,
	leaq	.LC1(%rip), %rdx	;, tmp401
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:131:                 if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L199	;,
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, tmp403
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rsi	; lexer_213(D)->position, tmp405
	movq	%r13, %xmm7	; prephitmp_691, prephitmp_691
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_213(D)->source, start
	punpcklqdq	%xmm7, %xmm0	; prephitmp_691, tmp403
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rbp, %rsi	; start, tmp405
	movaps	%xmm0, (%rsp)	; tmp403, %sfp
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rbp, %rdi	; start, start
	jmp	.L195	;
.L217:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_213(D)->position, _335
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _215, _335
	jnb	.L89	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, tmp409
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_213(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	; tmp409, lexer_213(D)->position
.L89:
; src/lexer.c:136:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L199	;,
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, tmp411
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	8(%rbx), %rsi	; lexer_213(D)->position, lexer_213(D)->position
	movq	%r13, %xmm7	; prephitmp_691, prephitmp_691
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rbp, %rdi	; start, tmp416
	punpcklqdq	%xmm7, %xmm0	; prephitmp_691, tmp411
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	$2, %rsi	;, tmp413
	movaps	%xmm0, (%rsp)	; tmp411, %sfp
	subq	%rbp, %rsi	; start, tmp415
	jmp	.L195	;
.L47:
; src/lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	testb	%sil, %sil	; c
	jne	.L193	;,
	.p2align 4,,10
	.p2align 3
.L45:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	;, lexer_213(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_213(D)->column
.L193:
; src/lexer.c:130:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rax	; lexer_213(D)->line, prephitmp_9
; src/lexer.c:57: }
	jmp	.L48	;
.L58:
; src/lexer.c:160:         } else if (c == '/' && p == '=') {
	testb	%dl, %dl	; _503
	je	.L59	;,
	testb	%r10b, %r10b	; _457
	je	.L59	;,
; src/lexer.c:161:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp585
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.16_129
	subq	$2, %rax	;, tmp460
	movq	%rax, %xmm7	; tmp460, tmp460
	punpcklqdq	%xmm7, %xmm0	; tmp460, tmp459
	movaps	%xmm0, (%rsp)	; tmp459, %sfp
	jmp	.L198	;
.L211:
; src/lexer.c:152:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp579
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.13_112
	subq	$2, %rax	;, tmp444
	movq	%rax, %xmm6	; tmp444, tmp444
	punpcklqdq	%xmm6, %xmm0	; tmp444, tmp443
	movaps	%xmm0, (%rsp)	; tmp443, %sfp
	jmp	.L198	;
.L212:
; src/lexer.c:155:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp581
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.14_118
	subq	$2, %rax	;, tmp450
	movq	%rax, %xmm7	; tmp450, tmp450
	punpcklqdq	%xmm7, %xmm0	; tmp450, tmp449
	movaps	%xmm0, (%rsp)	; tmp449, %sfp
	jmp	.L198	;
.L213:
; src/lexer.c:158:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp583
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.15_124
	subq	$2, %rax	;, tmp456
	movq	%rax, %xmm6	; tmp456, tmp456
	punpcklqdq	%xmm6, %xmm0	; tmp456, tmp455
	movaps	%xmm0, (%rsp)	; tmp455, %sfp
	jmp	.L198	;
.L214:
; src/lexer.c:164:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp587
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.17_135
	subq	$2, %rax	;, tmp466
	movq	%rax, %xmm6	; tmp466, tmp466
	punpcklqdq	%xmm6, %xmm0	; tmp466, tmp465
	movaps	%xmm0, (%rsp)	; tmp465, %sfp
	jmp	.L198	;
.L215:
; src/lexer.c:167:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp589
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	AND_SYMBOL(%rip), %rbx	; AND_SYMBOL, AND_SYMBOL.18_142
	subq	$2, %rax	;, tmp474
	movq	%rax, %xmm7	; tmp474, tmp474
	punpcklqdq	%xmm7, %xmm0	; tmp474, tmp473
	movaps	%xmm0, (%rsp)	; tmp473, %sfp
	jmp	.L198	;
.L216:
; src/lexer.c:170:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp591
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	OR_SYMBOL(%rip), %rbx	; OR_SYMBOL, OR_SYMBOL.19_149
	subq	$2, %rax	;, tmp482
	movq	%rax, %xmm6	; tmp482, tmp482
	punpcklqdq	%xmm6, %xmm0	; tmp482, tmp481
	movaps	%xmm0, (%rsp)	; tmp481, %sfp
	jmp	.L198	;
.L85:
; src/lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L55	;,
	testb	%sil, %sil	; tmp498
	jne	.L219	;,
.L55:
; src/lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L88	;,
	testb	%sil, %sil	; tmp498
	je	.L88	;,
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	%r13, %xmm6	; prephitmp_691, prephitmp_691
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp429
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rcx	;, tmp430
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; tmp429, lexer_213(D)->column
	punpcklqdq	%xmm6, %xmm0	; prephitmp_691, tmp431
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp430, lexer_213(D)->position
; src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	LE_SYMBOL(%rip), %rbx	; LE_SYMBOL, LE_SYMBOL.11_100
	movaps	%xmm0, (%rsp)	; tmp431, %sfp
	jmp	.L198	;
.L219:
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	%r13, %xmm7	; prephitmp_691, prephitmp_691
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp423
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rcx	;, tmp424
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; tmp423, lexer_213(D)->column
	punpcklqdq	%xmm7, %xmm0	; prephitmp_691, tmp425
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rcx, 8(%rbx)	; tmp424, lexer_213(D)->position
; src/lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	NE_SYMBOL(%rip), %rbx	; NE_SYMBOL, NE_SYMBOL.10_94
	movaps	%xmm0, (%rsp)	; tmp425, %sfp
	jmp	.L198	;
.L88:
; src/lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L35	;,
	testb	%sil, %sil	; tmp498
	je	.L35	;,
; src/lexer.c:149:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_213(D)->column, tmp577
	movq	24(%rbx), %xmm0	; lexer_213(D)->line, lexer_213(D)->line
	movq	GE_SYMBOL(%rip), %rbx	; GE_SYMBOL, GE_SYMBOL.12_106
	subq	$2, %rax	;, tmp438
	movq	%rax, %xmm7	; tmp438, tmp438
	punpcklqdq	%xmm7, %xmm0	; tmp438, tmp437
	movaps	%xmm0, (%rsp)	; tmp437, %sfp
	jmp	.L198	;
.L64:
; src/lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACE_SYMBOL(%rip), %rbx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.23_157
.L196:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm7	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ASSIGN_SYMBOL.38_187,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm7, 8(%rax)	; _608,
; src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	;
.L66:
; src/lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACE_SYMBOL(%rip), %rbx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.22_155
.L197:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm6	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; GT_SYMBOL.37_185,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	; _608,
; src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	;
.L204:
	cmpb	$47, %al	;, c
	jg	.L20	;,
	jmp	.L18	;
.L67:
; src/lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACKET_SYMBOL(%rip), %rbx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.28_167
	jmp	.L197	;
.L68:
; src/lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACKET_SYMBOL(%rip), %rbx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.27_165
	jmp	.L196	;
.L69:
; src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	GT_SYMBOL(%rip), %rbx	; GT_SYMBOL, GT_SYMBOL.37_185
	jmp	.L197	;
.L70:
; src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	ASSIGN_SYMBOL(%rip), %rbx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_187
	jmp	.L196	;
.L71:
; src/lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	LT_SYMBOL(%rip), %rbx	; LT_SYMBOL, LT_SYMBOL.36_183
	jmp	.L196	;
.L72:
; src/lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	SEMICOLON_SYMBOL(%rip), %rbx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.29_169
	jmp	.L196	;
.L73:
; src/lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	DIV_SYMBOL(%rip), %rbx	; DIV_SYMBOL, DIV_SYMBOL.34_179
	jmp	.L196	;
.L74:
; src/lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	DOT_SYMBOL(%rip), %rbx	; DOT_SYMBOL, DOT_SYMBOL.26_163
	jmp	.L197	;
.L75:
; src/lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	SUB_SYMBOL(%rip), %rbx	; SUB_SYMBOL, SUB_SYMBOL.32_175
	jmp	.L196	;
.L76:
; src/lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	COMMA_SYMBOL(%rip), %rbx	; COMMA_SYMBOL, COMMA_SYMBOL.24_159
	jmp	.L197	;
.L77:
; src/lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	ADD_SYMBOL(%rip), %rbx	; ADD_SYMBOL, ADD_SYMBOL.31_173
	jmp	.L197	;
.L78:
; src/lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	MUL_SYMBOL(%rip), %rbx	; MUL_SYMBOL, MUL_SYMBOL.33_177
	jmp	.L197	;
.L79:
; src/lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_PAREN_SYMBOL(%rip), %rbx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.21_153
	jmp	.L196	;
.L80:
; src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_PAREN_SYMBOL(%rip), %rbx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.20_151
	jmp	.L196	;
.L81:
; src/lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	MOD_SYMBOL(%rip), %rbx	; MOD_SYMBOL, MOD_SYMBOL.35_181
	jmp	.L197	;
.L82:
; src/lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	NOT_SYMBOL(%rip), %rbx	; NOT_SYMBOL, NOT_SYMBOL.25_161
	jmp	.L196	;
	.size	next_token, .-next_token
	.p2align 4
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp87, source
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %edi	;,
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp88, length
	subq	$8, %rsp	;,
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	*alloc_memory@GOTPCREL(%rip)	;
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
; src/lexer.c:10:     lexer->peeked_token = NULL;
	movq	$0, 40(%rax)	;, lexer_3->peeked_token
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 64(%rax)	;, lexer_3->peeked_column
; src/lexer.c:14:     lexer->current_token = NULL;
	movq	$0, 72(%rax)	;, lexer_3->current_token
; src/lexer.c:11:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rax)	; tmp85, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_3 + 48B]
; src/lexer.c:16: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_lexer, .-create_lexer
	.p2align 4
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
; src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	movq	40(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:217: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
; src/lexer.c:217: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rdi, %rbx	; tmp93, lexer
; src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L223	;,
; src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	48(%rdi), %rdx	; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
; src/lexer.c:228: }
	popq	%rbx	;
; src/lexer.c:219:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rdi)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:221:         lexer->line = lexer->peeked_line;
	movdqu	56(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 56B], tmp97
; src/lexer.c:223:         lexer->peeked_token = 0;
	movq	$0, 40(%rdi)	;, lexer_8(D)->peeked_token
; src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	%rdx, 8(%rdi)	; lexer_8(D)->peeked_position, lexer_8(D)->position
; src/lexer.c:221:         lexer->line = lexer->peeked_line;
	movups	%xmm0, 24(%rdi)	; tmp97, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
; src/lexer.c:228: }
	ret	
	.p2align 4,,10
	.p2align 3
.L223:
; src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:227:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:228: }
	popq	%rbx	;
	ret	
	.size	get_next_token, .-get_next_token
	.p2align 4
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
; src/lexer.c:231:     if (lexer->peeked_token != NULL)
	movq	40(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:231:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; <retval>
	je	.L232	;,
; src/lexer.c:245: }
	ret	
	.p2align 4,,10
	.p2align 3
.L232:
; src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	;
; src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp100, lexer
	subq	$24, %rsp	;,
; src/lexer.c:234:     size_t saved_line = lexer->line;
	movdqu	24(%rdi), %xmm1	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
; src/lexer.c:233:     size_t saved_position = lexer->position;
	movq	8(%rdi), %rbp	; lexer_9(D)->position, saved_position
; src/lexer.c:234:     size_t saved_line = lexer->line;
	movaps	%xmm1, (%rsp)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], %sfp
; src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	call	next_token	;
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movdqu	8(%rbx), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 8B], vect__3.202
	movdqu	24(%rbx), %xmm2	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], tmp105
; src/lexer.c:240:     lexer->position = saved_position;
	movq	%rbp, 8(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
; src/lexer.c:241:     lexer->line = saved_line;
	movdqa	(%rsp), %xmm1	; %sfp, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
; src/lexer.c:227:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_9(D)->current_token
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm2, %xmm0	; tmp105, vect__3.202
; src/lexer.c:243:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 48(%rbx)	; vect__3.202, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 48B]
; src/lexer.c:241:     lexer->line = saved_line;
	movups	%xmm1, 24(%rbx)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
; src/lexer.c:245: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	peek_next_token, .-peek_next_token
	.p2align 4
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
; src/lexer.c:248:     return lexer->current_token;
	movq	72(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:249: }
	ret	
	.size	peek_current_token, .-peek_current_token
	.p2align 4
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
; src/lexer.c:253:     lexer->line = 0;
	pxor	%xmm0, %xmm0	; tmp83
; src/lexer.c:252:     lexer->position = 0;
	movq	$0, 8(%rdi)	;, lexer_2(D)->position
; src/lexer.c:255:     lexer->peeked_token = NULL;
	movq	$0, 40(%rdi)	;, lexer_2(D)->peeked_token
; src/lexer.c:258:     lexer->peeked_column = 0;
	movq	$0, 64(%rdi)	;, lexer_2(D)->peeked_column
; src/lexer.c:259:     lexer->current_token = NULL;
	movq	$0, 72(%rdi)	;, lexer_2(D)->current_token
; src/lexer.c:253:     lexer->line = 0;
	movups	%xmm0, 24(%rdi)	; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 24B]
; src/lexer.c:256:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rdi)	; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 48B]
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

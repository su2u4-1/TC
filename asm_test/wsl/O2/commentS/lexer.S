	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.p2align 4
	.type	get_current_char.isra.0, @function
get_current_char.isra.0:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rdi), %rax	; lexer_1(D)->position, _2
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	24(%rdi), %rax	; lexer_1(D)->length, _2
	jnb	.L1	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, tmp88
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rdi)	;, lexer_1(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, 16(%rdi)	; tmp88, lexer_1(D)->position
.L1:
; src/lexer.c:37: }
	ret	
	.size	get_current_char.isra.0, .-get_current_char.isra.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"[Lexer Error] at %s:%zu:%zu: %s\n"
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
	.p2align 4
	.type	next_token, @function
next_token:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp513, lexer
	subq	$24, %rsp	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rdi), %rdi	; lexer_216(D)->position, _232
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %rdx	; lexer_216(D)->length, _218
; src/lexer.c:35:     lexer->column++;
	movq	40(%rbx), %r13	; lexer_216(D)->column, prephitmp_694
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	; _218, _232
	jnb	.L5	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rbx), %rcx	; lexer_216(D)->source, _259
; src/lexer.c:35:     lexer->column++;
	leaq	1(%r13), %r9	;, prephitmp_600
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rdi), %rbp	;, prephitmp_399
	movl	%esi, %r12d	; tmp514, skip_comment
; src/lexer.c:35:     lexer->column++;
	movq	%r9, 40(%rbx)	; prephitmp_600, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	(%rcx,%rdi), %r8	;, _261
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; prephitmp_399, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%r8), %eax	; *_261, c
	cmpb	$32, %al	;, c
	ja	.L6	;,
	leaq	.L8(%rip), %r10	;, tmp332
	movzbl	%al, %esi	; c, c
	movslq	(%r10,%rsi,4), %rsi	;, tmp334
	addq	%r10, %rsi	; tmp332, tmp335
	jmp	*%rsi	; tmp335
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
	movq	%r9, %r13	; prephitmp_600, prephitmp_694
	.p2align 4,,10
	.p2align 3
.L5:
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	%r13, %xmm1	; prephitmp_694, prephitmp_694
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm1, %xmm0	; prephitmp_694, tmp337
	movaps	%xmm0, (%rsp)	; tmp337, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp337
; src/lexer.c:21:     token->type = type;
	movl	$0, 24(%rax)	;, token_263->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	$0, (%rax)	;, token_263->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp337,
.L4:
; src/lexer.c:216: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L9:
; src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	;, lexer_216(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_216(D)->column
.L199:
; src/lexer.c:216: }
	addq	$24, %rsp	;,
; src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	%r12b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:216: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/lexer.c:138:                 return next_token(lexer, skip_comment);
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
	leal	-48(%rax), %esi	;, tmp341
	cmpb	$9, %sil	;, tmp341
	jbe	.L15	;,
	jmp	.L200	;
	.p2align 4,,10
	.p2align 3
.L202:
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_399
; src/lexer.c:35:     lexer->column++;
	addq	$1, %r9	;, prephitmp_600
	movq	%r9, 40(%rbx)	; prephitmp_600, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; prephitmp_399, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %eax	; MEM[(char *)_259 + -1B + _278 * 1], c
.L15:
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %esi	;, tmp353
	cmpb	$9, %sil	;, tmp353
	ja	.L201	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jb	.L202	;,
; src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r12d	;, type
.L23:
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	%r13, %xmm4	; prephitmp_694, prephitmp_694
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %r9	;, tmp357
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _620
	movq	%rsi, 16(%rbx)	; _620, lexer_216(D)->position
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; _232, tmp360
	movq	%r8, %rdi	; _261,
	punpcklqdq	%xmm4, %xmm0	; prephitmp_694, tmp358
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%r9, 40(%rbx)	; tmp357, lexer_216(D)->column
	movaps	%xmm0, (%rsp)	; tmp358, %sfp
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp520, _35
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp358
; src/lexer.c:21:     token->type = type;
	movl	%r12d, 24(%rax)	; type, token_298->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _35,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp358,
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al	;, c
	jne	.L203	;,
.L12:
	movabsq	$288230372997595135, %rsi	;, tmp512
	jmp	.L17	;
	.p2align 4,,10
	.p2align 3
.L205:
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_399
; src/lexer.c:35:     lexer->column++;
	addq	$1, %r9	;, prephitmp_600
	movq	%r9, 40(%rbx)	; prephitmp_600, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; prephitmp_399, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %eax	; MEM[(char *)_259 + -1B + _269 * 1], c
.L17:
	cmpb	$57, %al	;, c
	jle	.L204	;,
	subl	$65, %eax	;, _316
	cmpb	$57, %al	;, _316
	ja	.L18	;,
	btq	%rax, %rsi	; _316, tmp512
	jnc	.L18	;,
.L20:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jb	.L205	;,
.L18:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _614
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %r9	;, tmp347
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rsi, 16(%rbx)	; _614, lexer_216(D)->position
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rdi, %rsi	; _232, tmp348
	movq	%r8, %rdi	; _261,
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%r9, 40(%rbx)	; tmp347, lexer_216(D)->column
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp516, content
; src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	call	*is_keyword@GOTPCREL(%rip)	;
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
; src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	; tmp517
	je	.L22	;,
	movq	%r13, %xmm2	; prephitmp_694, prephitmp_694
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm2, %xmm0	; prephitmp_694, tmp349
	movaps	%xmm0, (%rsp)	; tmp349, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp349
; src/lexer.c:21:     token->type = type;
	movl	$6, 24(%rax)	;, token_273->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp349,
; src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L203:
	leal	-97(%rax), %esi	;, tmp342
	cmpb	$25, %sil	;, tmp342
	jbe	.L12	;,
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jnb	.L206	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rdi), %r8d	; *_403, _415
; src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _460
.L43:
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r8b	;, _415
	sete	%cl	;, tmp506
	movl	%ecx, %edx	; tmp506, _506
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	;, c
	jne	.L85	;,
	testb	%cl, %cl	; tmp506
	je	.L85	;,
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
; src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp424
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp425
	movq	%r13, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	; tmp424, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp425, lexer_216(D)->position
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp426
; src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	EQ_SYMBOL(%rip), %rbx	; EQ_SYMBOL, EQ_SYMBOL.9_90
	movaps	%xmm0, (%rsp)	; tmp426, %sfp
.L198:
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp488
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; OR_SYMBOL.19_151,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp488,
; src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%r13, %xmm3	; prephitmp_694, prephitmp_694
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm3, %xmm0	; prephitmp_694, tmp351
	movaps	%xmm0, (%rsp)	; tmp351, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp351
; src/lexer.c:21:     token->type = type;
	movl	$1, 24(%rax)	;, token_274->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp351,
; src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L13:
; src/lexer.c:34:         return '\0';
	xorl	%r12d, %r12d	; _309
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jnb	.L27	;,
; src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp361
	movq	%rax, 40(%rbx)	; tmp361, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	2(%rdi), %rax	;, tmp362
	movq	%rax, 16(%rbx)	; tmp362, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%rdi), %r12d	; *_301, _309
.L27:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rdi	;, tmp511
	jmp	.L28	;
	.p2align 4,,10
	.p2align 3
.L208:
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rsi	;, tmp363
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	;, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	; tmp363, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %r12d	; *_308, _309
.L28:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r12b	;, _309
	jbe	.L207	;,
.L30:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	; lexer_216(D)->position, _304
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _218, _304
	jb	.L208	;,
; src/lexer.c:34:         return '\0';
	xorl	%r12d, %r12d	; _309
.L29:
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	; lexer_216(D)->line, prephitmp_623
; src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %r12b	;, _309
	je	.L31	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	movq	(%rbx), %rcx	; lexer_216(D)->filename, lexer_216(D)->filename
	leaq	1(%rax), %r8	;,
	movq	%rbp, %r9	; prephitmp_399,
	leaq	.LC1(%rip), %rdx	;, tmp569
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	pushq	%rdx	; tmp569
	leaq	.LC0(%rip), %rdx	;, tmp372
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	popq	%r10	;
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	; lexer_216(D)->line, tmp570
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	popq	%r11	;
	cmpb	$10, %r12b	;, _309
	jne	.L31	;,
; src/lexer.c:46:     lexer->line++;
	addq	$1, %rax	;, prephitmp_623
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_216(D)->column
; src/lexer.c:46:     lexer->line++;
	movq	%rax, 32(%rbx)	; prephitmp_623, lexer_216(D)->line
	.p2align 4,,10
	.p2align 3
.L31:
; src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rsi	; lexer_216(D)->position, _42
	movq	%rax, %xmm0	; prephitmp_623, tmp374
	movq	%r13, %xmm5	; prephitmp_694, prephitmp_694
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	leaq	.LC2(%rip), %rdi	;, tmp376
	punpcklqdq	%xmm5, %xmm0	; prephitmp_694, tmp374
; src/lexer.c:105:         if (lexer->position - start == 1)
	subq	%rbp, %rsi	; prephitmp_399, _42
	movaps	%xmm0, (%rsp)	; tmp374, %sfp
; src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rsi	;, _42
	je	.L194	;,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	8(%rbx), %rdi	; lexer_216(D)->source, prephitmp_399
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	$1, %rsi	;, tmp377
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; prephitmp_399, prephitmp_399
.L194:
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp524, _49
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp374
; src/lexer.c:21:     token->type = type;
	movl	$4, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _49,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp374,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L4	;
	.p2align 4,,10
	.p2align 3
.L207:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r12, %rdi	; _309, tmp511
	jc	.L30	;,
	jmp	.L29	;
.L200:
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	;, c
	sete	%sil	;, tmp380
	movl	%esi, %r10d	; tmp380, _460
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jnb	.L91	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rdi), %r8d	; *_314, _415
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %r8b	;, _415
	jne	.L38	;,
	testb	%sil, %sil	; tmp380
	je	.L38	;,
; src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %eax	;, _322
	jmp	.L36	;
	.p2align 4,,10
	.p2align 3
.L209:
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_399
; src/lexer.c:35:     lexer->column++;
	addq	$1, %r9	;, prephitmp_600
	movq	%r9, 40(%rbx)	; prephitmp_600, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; prephitmp_399, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %eax	; MEM[(char *)_259 + -1B + _320 * 1], _322
.L36:
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	;, _322
	je	.L39	;,
	testb	%al, %al	; _322
	je	.L39	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jb	.L209	;,
.L39:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _629
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %r9	;, tmp387
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rsi, 16(%rbx)	; _629, lexer_216(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%r9, 40(%rbx)	; tmp387, lexer_216(D)->column
; src/lexer.c:116:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L199	;,
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	%r13, %xmm6	; prephitmp_694, prephitmp_694
; src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$2, %rdi	;, start
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; start, tmp391
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rcx, %rdi	; _259, tmp392
	punpcklqdq	%xmm6, %xmm0	; prephitmp_694, tmp389
	movaps	%xmm0, (%rsp)	; tmp389, %sfp
.L195:
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp528, _76
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp410
; src/lexer.c:21:     token->type = type;
	movl	$7, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _76,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp410,
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	;
.L201:
; src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r12d	;, type
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jnb	.L23	;,
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	;, c
	jne	.L23	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	leaq	(%rcx,%rbp), %rsi	;, _283
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rsi), %eax	; *_283, tmp567
	subl	$48, %eax	;, tmp354
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	;, tmp354
	ja	.L23	;,
; src/lexer.c:35:     lexer->column++;
	addq	$1, %r9	;, prephitmp_600
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_399
; src/lexer.c:35:     lexer->column++;
	movq	%r9, 40(%rbx)	; prephitmp_600, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; prephitmp_399, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rsi), %eax	; *_283, _296
	jmp	.L25	;
	.p2align 4,,10
	.p2align 3
.L210:
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, prephitmp_399
; src/lexer.c:35:     lexer->column++;
	addq	$1, %r9	;, prephitmp_600
	movq	%r9, 40(%rbx)	; prephitmp_600, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; prephitmp_399, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %eax	; MEM[(char *)_259 + -1B + _294 * 1], _296
.L25:
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	;, tmp356
	cmpb	$9, %al	;, tmp356
	ja	.L98	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rbp	; _218, prephitmp_399
	jb	.L210	;,
.L98:
; src/lexer.c:91:             type = FLOAT;
	movl	$3, %r12d	;, type
	jmp	.L23	;
.L206:
; src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _460
.L91:
; src/lexer.c:41:         return '\0';
	xorl	%r8d, %r8d	; _415
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	xorl	%edx, %edx	; _506
.L35:
; src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	;, c
	jne	.L56	;,
	testb	%dl, %dl	; _506
	jne	.L211	;,
.L56:
; src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	;, c
	jne	.L57	;,
	testb	%dl, %dl	; _506
	jne	.L212	;,
.L57:
; src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	;, c
	jne	.L58	;,
	testb	%dl, %dl	; _506
	jne	.L213	;,
.L59:
; src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	;, c
	jne	.L60	;,
	testb	%dl, %dl	; _506
	jne	.L214	;,
.L60:
; src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	;, c
	jne	.L61	;,
	cmpb	$38, %r8b	;, _415
	je	.L215	;,
.L61:
; src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	;, c
	jne	.L62	;,
	cmpb	$124, %r8b	;, _415
	je	.L216	;,
.L62:
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rdx	; lexer_216(D)->line, pretmp_696
	movq	%r13, %xmm6	; prephitmp_694, prephitmp_694
	subl	$33, %eax	;, tmp493
	movq	%rdx, %xmm7	; pretmp_696, _611
	punpcklqdq	%xmm6, %xmm7	; prephitmp_694, _611
	movaps	%xmm7, (%rsp)	; _611, %sfp
	cmpb	$92, %al	;, tmp493
	ja	.L63	;,
	leaq	.L65(%rip), %rcx	;, tmp495
	movzbl	%al, %eax	; tmp493, tmp494
	movslq	(%rcx,%rax,4), %rax	;, tmp497
	addq	%rcx, %rax	; tmp495, tmp498
	jmp	*%rax	; tmp498
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
	pushq	%rax	;
	leaq	1(%rdx), %r8	;,
	leaq	.LC6(%rip), %rax	;, tmp623
	movl	$2, %esi	;,
	pushq	%rax	; tmp623
	leaq	.LC0(%rip), %rdx	;, tmp503
	movq	(%rbx), %rcx	; lexer_216(D)->filename,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:21:     token->type = type;
	xorl	%edx, %edx	;
; src/lexer.c:22:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	;
; src/lexer.c:23:     token->line = line;
	pxor	%xmm0, %xmm0	; tmp504
; src/lexer.c:21:     token->type = type;
	movl	%edx, 24(%rax)	;, token_376->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	;, token_376->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp504, MEM <vector(2) long unsigned int> [(long unsigned int *)token_376 + 8B]
; src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	popq	%rsi	;
	popq	%rdi	;
	jmp	.L4	;
.L38:
; src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r8b	;, _415
	jne	.L43	;,
	testb	%sil, %sil	; tmp380
	je	.L43	;,
; src/lexer.c:120:             size_t start = lexer->position + 1;
	leaq	2(%rdi), %rbp	;, start
; src/lexer.c:109:         char p = peek_next_char(lexer);
	movl	$42, %eax	;, p
; src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %esi	;, c
	.p2align 4,,10
	.p2align 3
.L44:
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %sil	;, c
	jne	.L160	;,
	cmpb	$47, %al	;, p
	je	.L217	;,
.L160:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	; lexer_216(D)->position, _328
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _218, _328
	jnb	.L45	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	;, _331
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	;, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, 16(%rbx)	; _331, lexer_216(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %esi	; *_332, c
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r8	; _218, _331
	jnb	.L218	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rax), %eax	; *_325, p
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %sil	;, c
	jne	.L49	;,
; src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	;, lexer_216(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_216(D)->column
; src/lexer.c:126:                 if (p == '\0') break;
	testb	%al, %al	; p
	jne	.L160	;,
	jmp	.L193	;
	.p2align 4,,10
	.p2align 3
.L49:
	testb	%al, %al	; p
	je	.L47	;,
; src/lexer.c:127:                 assert(c != '\0');
	testb	%sil, %sil	; c
	jne	.L44	;,
; src/lexer.c:127:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp396
	movl	$127, %edx	;,
	leaq	.LC3(%rip), %rsi	;, tmp397
	leaq	.LC4(%rip), %rdi	;, tmp398
	call	*__assert_fail@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L218:
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %sil	;, c
	jne	.L47	;,
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	; lexer_216(D)->line, tmp576
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_216(D)->column
; src/lexer.c:46:     lexer->line++;
	addq	$1, %rax	;, prephitmp_9
	movq	%rax, 32(%rbx)	; prephitmp_9, lexer_216(D)->line
.L48:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	leaq	3(%rdi), %r9	;,
	leaq	1(%rax), %r8	;,
	movq	(%rbx), %rcx	; lexer_216(D)->filename, lexer_216(D)->filename
	leaq	.LC5(%rip), %rdx	;, tmp577
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	pushq	%rdx	; tmp577
	leaq	.LC0(%rip), %rdx	;, tmp408
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:132:                 if (skip_comment)
	popq	%r8	;
	popq	%r9	;
	testb	%r12b, %r12b	; skip_comment
	jne	.L199	;,
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, tmp410
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbx), %rsi	; lexer_216(D)->position, tmp412
	movq	%r13, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rdi	; lexer_216(D)->source, start
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp410
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rbp, %rsi	; start, tmp412
	movaps	%xmm0, (%rsp)	; tmp410, %sfp
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rbp, %rdi	; start, start
	jmp	.L195	;
.L217:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	; lexer_216(D)->position, _338
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	; _218, _338
	jnb	.L89	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, tmp416
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	;, lexer_216(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, 16(%rbx)	; tmp416, lexer_216(D)->position
.L89:
; src/lexer.c:137:             if (skip_comment)
	testb	%r12b, %r12b	; skip_comment
	jne	.L199	;,
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, tmp418
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbx), %rsi	; lexer_216(D)->position, lexer_216(D)->position
	movq	%r13, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	(%rcx,%rbp), %rdi	;, tmp423
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp418
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	$2, %rsi	;, tmp420
	movaps	%xmm0, (%rsp)	; tmp418, %sfp
	subq	%rbp, %rsi	; start, tmp422
	jmp	.L195	;
.L47:
; src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%sil, %sil	; c
	jne	.L193	;,
	.p2align 4,,10
	.p2align 3
.L45:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	$1, 16(%rbx)	;, lexer_216(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	;, lexer_216(D)->column
.L193:
; src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	32(%rbx), %rax	; lexer_216(D)->line, prephitmp_9
; src/lexer.c:58: }
	jmp	.L48	;
.L58:
; src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%dl, %dl	; _506
	je	.L59	;,
	testb	%r10b, %r10b	; _460
	je	.L59	;,
; src/lexer.c:162:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp595
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.16_131
	subq	$2, %rax	;, tmp467
	movq	%rax, %xmm7	; tmp467, tmp467
	punpcklqdq	%xmm7, %xmm0	; tmp467, tmp466
	movaps	%xmm0, (%rsp)	; tmp466, %sfp
	jmp	.L198	;
.L211:
; src/lexer.c:153:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp589
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.13_114
	subq	$2, %rax	;, tmp451
	movq	%rax, %xmm6	; tmp451, tmp451
	punpcklqdq	%xmm6, %xmm0	; tmp451, tmp450
	movaps	%xmm0, (%rsp)	; tmp450, %sfp
	jmp	.L198	;
.L212:
; src/lexer.c:156:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp591
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.14_120
	subq	$2, %rax	;, tmp457
	movq	%rax, %xmm7	; tmp457, tmp457
	punpcklqdq	%xmm7, %xmm0	; tmp457, tmp456
	movaps	%xmm0, (%rsp)	; tmp456, %sfp
	jmp	.L198	;
.L213:
; src/lexer.c:159:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp593
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.15_126
	subq	$2, %rax	;, tmp463
	movq	%rax, %xmm6	; tmp463, tmp463
	punpcklqdq	%xmm6, %xmm0	; tmp463, tmp462
	movaps	%xmm0, (%rsp)	; tmp462, %sfp
	jmp	.L198	;
.L214:
; src/lexer.c:165:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp597
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.17_137
	subq	$2, %rax	;, tmp473
	movq	%rax, %xmm6	; tmp473, tmp473
	punpcklqdq	%xmm6, %xmm0	; tmp473, tmp472
	movaps	%xmm0, (%rsp)	; tmp472, %sfp
	jmp	.L198	;
.L215:
; src/lexer.c:168:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp599
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	AND_SYMBOL(%rip), %rbx	; AND_SYMBOL, AND_SYMBOL.18_144
	subq	$2, %rax	;, tmp481
	movq	%rax, %xmm7	; tmp481, tmp481
	punpcklqdq	%xmm7, %xmm0	; tmp481, tmp480
	movaps	%xmm0, (%rsp)	; tmp480, %sfp
	jmp	.L198	;
.L216:
; src/lexer.c:171:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp601
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	OR_SYMBOL(%rip), %rbx	; OR_SYMBOL, OR_SYMBOL.19_151
	subq	$2, %rax	;, tmp489
	movq	%rax, %xmm6	; tmp489, tmp489
	punpcklqdq	%xmm6, %xmm0	; tmp489, tmp488
	movaps	%xmm0, (%rsp)	; tmp488, %sfp
	jmp	.L198	;
.L85:
; src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	;, c
	jne	.L55	;,
	testb	%cl, %cl	; tmp506
	jne	.L219	;,
.L55:
; src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	;, c
	jne	.L88	;,
	testb	%cl, %cl	; tmp506
	je	.L88	;,
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	%r13, %xmm6	; prephitmp_694, prephitmp_694
; src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp436
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp437
; src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	; tmp436, lexer_216(D)->column
	punpcklqdq	%xmm6, %xmm0	; prephitmp_694, tmp438
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp437, lexer_216(D)->position
; src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	LE_SYMBOL(%rip), %rbx	; LE_SYMBOL, LE_SYMBOL.11_102
	movaps	%xmm0, (%rsp)	; tmp438, %sfp
	jmp	.L198	;
.L219:
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	%r13, %xmm7	; prephitmp_694, prephitmp_694
; src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	;, tmp430
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp431
; src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	; tmp430, lexer_216(D)->column
	punpcklqdq	%xmm7, %xmm0	; prephitmp_694, tmp432
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp431, lexer_216(D)->position
; src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	NE_SYMBOL(%rip), %rbx	; NE_SYMBOL, NE_SYMBOL.10_96
	movaps	%xmm0, (%rsp)	; tmp432, %sfp
	jmp	.L198	;
.L88:
; src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	;, c
	jne	.L35	;,
	testb	%cl, %cl	; tmp506
	je	.L35	;,
; src/lexer.c:150:             get_current_char(lexer);
	movq	%rbx, %rdi	; lexer,
	call	get_current_char.isra.0	;
; src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_216(D)->column, tmp587
	movq	32(%rbx), %xmm0	; lexer_216(D)->line, lexer_216(D)->line
	movq	GE_SYMBOL(%rip), %rbx	; GE_SYMBOL, GE_SYMBOL.12_108
	subq	$2, %rax	;, tmp445
	movq	%rax, %xmm7	; tmp445, tmp445
	punpcklqdq	%xmm7, %xmm0	; tmp445, tmp444
	movaps	%xmm0, (%rsp)	; tmp444, %sfp
	jmp	.L198	;
.L64:
; src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACE_SYMBOL(%rip), %rbx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.23_159
.L196:
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm7	; %sfp, _611
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ASSIGN_SYMBOL.38_189,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm7, 8(%rax)	; _611,
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	;
.L66:
; src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACE_SYMBOL(%rip), %rbx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.22_157
.L197:
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm6	; %sfp, _611
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; GT_SYMBOL.37_187,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	; _611,
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	;
.L204:
	cmpb	$47, %al	;, c
	jg	.L20	;,
	jmp	.L18	;
.L67:
; src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACKET_SYMBOL(%rip), %rbx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.28_169
	jmp	.L197	;
.L68:
; src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACKET_SYMBOL(%rip), %rbx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.27_167
	jmp	.L196	;
.L69:
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	GT_SYMBOL(%rip), %rbx	; GT_SYMBOL, GT_SYMBOL.37_187
	jmp	.L197	;
.L70:
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	ASSIGN_SYMBOL(%rip), %rbx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_189
	jmp	.L196	;
.L71:
; src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	LT_SYMBOL(%rip), %rbx	; LT_SYMBOL, LT_SYMBOL.36_185
	jmp	.L196	;
.L72:
; src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	SEMICOLON_SYMBOL(%rip), %rbx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.29_171
	jmp	.L196	;
.L73:
; src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	DIV_SYMBOL(%rip), %rbx	; DIV_SYMBOL, DIV_SYMBOL.34_181
	jmp	.L196	;
.L74:
; src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	DOT_SYMBOL(%rip), %rbx	; DOT_SYMBOL, DOT_SYMBOL.26_165
	jmp	.L197	;
.L75:
; src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	SUB_SYMBOL(%rip), %rbx	; SUB_SYMBOL, SUB_SYMBOL.32_177
	jmp	.L196	;
.L76:
; src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	COMMA_SYMBOL(%rip), %rbx	; COMMA_SYMBOL, COMMA_SYMBOL.24_161
	jmp	.L197	;
.L77:
; src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	ADD_SYMBOL(%rip), %rbx	; ADD_SYMBOL, ADD_SYMBOL.31_175
	jmp	.L197	;
.L78:
; src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	MUL_SYMBOL(%rip), %rbx	; MUL_SYMBOL, MUL_SYMBOL.33_179
	jmp	.L197	;
.L79:
; src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_PAREN_SYMBOL(%rip), %rbx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.21_155
	jmp	.L196	;
.L80:
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_PAREN_SYMBOL(%rip), %rbx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.20_153
	jmp	.L196	;
.L81:
; src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	MOD_SYMBOL(%rip), %rbx	; MOD_SYMBOL, MOD_SYMBOL.35_183
	jmp	.L197	;
.L82:
; src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	NOT_SYMBOL(%rip), %rbx	; NOT_SYMBOL, NOT_SYMBOL.25_163
	jmp	.L196	;
	.size	next_token, .-next_token
	.p2align 4
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp88, source
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %edi	;,
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length, string filename) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp89, length
	pushq	%rbx	;
; src/lexer.c:3: Lexer* create_lexer(string source, size_t length, string filename) {
	movq	%rdx, %rbx	; tmp90, filename
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:11:     lexer->peeked_position = 0;
	pxor	%xmm0, %xmm0	; tmp86
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
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 72(%rax)	;, lexer_3->peeked_column
; src/lexer.c:14:     lexer->current_token = NULL;
	movq	$0, 80(%rax)	;, lexer_3->current_token
; src/lexer.c:15:     lexer->filename = filename;
	movq	%rbx, (%rax)	; filename, lexer_3->filename
; src/lexer.c:11:     lexer->peeked_position = 0;
	movups	%xmm0, 56(%rax)	; tmp86, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_3 + 56B]
; src/lexer.c:17: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_lexer, .-create_lexer
	.p2align 4
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	48(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:218: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
; src/lexer.c:218: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rdi, %rbx	; tmp93, lexer
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L223	;,
; src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	56(%rdi), %rdx	; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
; src/lexer.c:229: }
	popq	%rbx	;
; src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rdi)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movdqu	64(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 64B], tmp97
; src/lexer.c:224:         lexer->peeked_token = 0;
	movq	$0, 48(%rdi)	;, lexer_8(D)->peeked_token
; src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	%rdx, 16(%rdi)	; lexer_8(D)->peeked_position, lexer_8(D)->position
; src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movups	%xmm0, 32(%rdi)	; tmp97, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B]
; src/lexer.c:229: }
	ret	
	.p2align 4,,10
	.p2align 3
.L223:
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:229: }
	popq	%rbx	;
	ret	
	.size	get_next_token, .-get_next_token
	.p2align 4
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	48(%rdi), %rax	; lexer_9(D)->peeked_token, <retval>
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; <retval>
	je	.L232	;,
; src/lexer.c:246: }
	ret	
	.p2align 4,,10
	.p2align 3
.L232:
; src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	;
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp100, lexer
	subq	$24, %rsp	;,
; src/lexer.c:235:     size_t saved_line = lexer->line;
	movdqu	32(%rdi), %xmm1	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B]
; src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rdi), %rbp	; lexer_9(D)->position, saved_position
; src/lexer.c:235:     size_t saved_line = lexer->line;
	movaps	%xmm1, (%rsp)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B], %sfp
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	call	next_token	;
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movdqu	16(%rbx), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 16B], vect__3.202
	movdqu	32(%rbx), %xmm2	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B], tmp105
; src/lexer.c:241:     lexer->position = saved_position;
	movq	%rbp, 16(%rbx)	; saved_position, lexer_9(D)->position
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	; lexer_9(D)->column, lexer_9(D)->column
; src/lexer.c:242:     lexer->line = saved_line;
	movdqa	(%rsp), %xmm1	; %sfp, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B]
; src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	; <retval>, lexer_9(D)->current_token
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm2, %xmm0	; tmp105, vect__3.202
; src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	; <retval>, lexer_9(D)->peeked_token
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	%rdx, 72(%rbx)	; lexer_9(D)->column, lexer_9(D)->peeked_column
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 56(%rbx)	; vect__3.202, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 56B]
; src/lexer.c:242:     lexer->line = saved_line;
	movups	%xmm1, 32(%rbx)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B]
; src/lexer.c:246: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	peek_next_token, .-peek_next_token
	.p2align 4
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
; src/lexer.c:249:     return lexer->current_token;
	movq	80(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:250: }
	ret	
	.size	peek_current_token, .-peek_current_token
	.p2align 4
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
; src/lexer.c:254:     lexer->line = 0;
	pxor	%xmm0, %xmm0	; tmp83
; src/lexer.c:253:     lexer->position = 0;
	movq	$0, 16(%rdi)	;, lexer_2(D)->position
; src/lexer.c:256:     lexer->peeked_token = NULL;
	movq	$0, 48(%rdi)	;, lexer_2(D)->peeked_token
; src/lexer.c:259:     lexer->peeked_column = 0;
	movq	$0, 72(%rdi)	;, lexer_2(D)->peeked_column
; src/lexer.c:260:     lexer->current_token = NULL;
	movq	$0, 80(%rdi)	;, lexer_2(D)->current_token
; src/lexer.c:254:     lexer->line = 0;
	movups	%xmm0, 32(%rdi)	; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 32B]
; src/lexer.c:257:     lexer->peeked_position = 0;
	movups	%xmm0, 56(%rdi)	; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 56B]
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

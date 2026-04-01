	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
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
	pushq	%r14	;
	pushq	%r13	;
	movl	%esi, %r13d	; tmp523, skip_comment
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp522, lexer
	subq	$32, %rsp	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rdi), %rdi	; lexer_211(D)->position, _214
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rsi	; lexer_211(D)->length, _212
; src/lexer.c:34:     lexer->column++;
	movq	32(%rbx), %r12	; lexer_211(D)->column, prephitmp_742
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rdi	; _212, _214
	jnb	.L2	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rbx), %rcx	; lexer_211(D)->source, _239
; src/lexer.c:34:     lexer->column++;
	leaq	1(%r12), %rax	;, _248
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rdi), %rbp	;, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _248, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	(%rcx,%rdi), %r9	;, _241
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; ivtmp.172, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%r9), %edx	; *_241, _242
	cmpb	$32, %dl	;, _242
	ja	.L3	;,
	leaq	.L5(%rip), %r10	;, tmp339
	movzbl	%dl, %r8d	; _242, _242
	movslq	(%r10,%r8,4), %r8	;, tmp341
	addq	%r10, %r8	; tmp339, tmp342
	jmp	*%r8	; tmp342
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L99-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L208-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L208-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L208-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rax, %r12	; _248, prephitmp_742
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, lexer_211(D)->line
	movq	%r12, %xmm1	; prephitmp_742, prephitmp_742
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm1, %xmm0	; prephitmp_742, tmp344
	movaps	%xmm0, (%rsp)	; tmp344, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp344
; src/lexer.c:20:     token->type = type;
	movl	$0, 24(%rax)	;, token_243->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	$0, (%rax)	;, token_243->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp344,
.L1:
; src/lexer.c:215: }
	addq	$32, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_211(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_211(D)->column
.L208:
; src/lexer.c:215: }
	addq	$32, %rsp	;,
; src/lexer.c:137:                 return next_token(lexer, skip_comment);
	movsbl	%r13b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:215: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/lexer.c:137:                 return next_token(lexer, skip_comment);
	jmp	next_token	;
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$90, %dl	;, _242
	jg	.L8	;,
	cmpb	$64, %dl	;, _242
	jg	.L9	;,
	cmpb	$34, %dl	;, _242
	je	.L10	;,
	leal	-48(%rdx), %r8d	;, tmp348
	cmpb	$9, %r8b	;, tmp348
	ja	.L11	;,
	leaq	(%rsi,%r12), %r11	;, tmp349
	subq	%rdi, %r11	; _214, _443
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L210:
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rdx), %r10d	;, tmp362
	leaq	1(%rbp), %r8	;, ivtmp.172
	cmpb	$9, %r10b	;, tmp362
	ja	.L22	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _248
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	; ivtmp.172, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rbp	; ivtmp.172, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _248, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %edx	; MEM[(char *)_239 + -1B + ivtmp.172_439 * 1], _242
.L12:
	cmpq	%rax, %r11	; _248, _443
	jne	.L210	;,
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rdx), %r8d	;, tmp363
	cmpb	$9, %r8b	;, tmp363
	ja	.L22	;,
.L103:
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
.L23:
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, lexer_211(D)->line
	movq	%r12, %xmm4	; prephitmp_742, prephitmp_742
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _668
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp368
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _668, lexer_211(D)->position
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; _214, tmp371
	movq	%r9, %rdi	; _241,
	punpcklqdq	%xmm4, %xmm0	; prephitmp_742, tmp369
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rax, 32(%rbx)	; tmp368, lexer_211(D)->column
	movaps	%xmm0, (%rsp)	; tmp369, %sfp
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp529, _35
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp369
; src/lexer.c:20:     token->type = type;
	movl	%r13d, 24(%rax)	; type, token_275->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _35,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp369,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %dl	;, _242
	jne	.L211	;,
.L9:
	movabsq	$288230372997595135, %r8	;, tmp521
	addq	%r12, %rsi	; prephitmp_742, tmp351
	subq	%rdi, %rsi	; _214, _412
	jmp	.L14	;
	.p2align 4,,10
	.p2align 3
.L213:
	cmpb	$57, %dl	;, _242
	jle	.L212	;,
	subl	$65, %edx	;, _506
	cmpb	$57, %dl	;, _506
	ja	.L15	;,
	btq	%rdx, %r8	; _506, tmp521
	jnc	.L15	;,
.L17:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _248
	movq	%rax, 32(%rbx)	; _248, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; ivtmp.172, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %edx	; MEM[(char *)_239 + -1B + _249 * 1], _242
.L14:
	cmpq	%rax, %rsi	; _248, _412
	jne	.L213	;,
.L15:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _662
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp356
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _662, lexer_211(D)->position
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rdi, %rsi	; _214, tmp357
	movq	%r9, %rdi	; _241,
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rax, 32(%rbx)	; tmp356, lexer_211(D)->column
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp525, content
; src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	call	*is_keyword@GOTPCREL(%rip)	;
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, lexer_211(D)->line
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; tmp526
	je	.L19	;,
	movq	%r12, %xmm2	; prephitmp_742, prephitmp_742
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm2, %xmm0	; prephitmp_742, tmp358
	movaps	%xmm0, (%rsp)	; tmp358, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp358
; src/lexer.c:20:     token->type = type;
	movl	$6, 24(%rax)	;, token_252->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp358,
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L212:
	cmpb	$47, %dl	;, _242
	jg	.L17	;,
	jmp	.L15	;
	.p2align 4,,10
	.p2align 3
.L211:
	leal	-97(%rdx), %r8d	;, tmp350
	cmpb	$25, %r8b	;, tmp350
	jbe	.L9	;,
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L214	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rdi), %r9d	; *_396, _588
; src/lexer.c:109:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _558
.L41:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, pretmp_186
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	;, _588
	movq	%r12, %xmm5	; prephitmp_742, prephitmp_742
	sete	%r8b	;, tmp513
	movdqa	%xmm0, %xmm6	; pretmp_186, tmp519
	movl	%r8d, %ecx	; tmp513, _582
	punpcklqdq	%xmm5, %xmm6	; prephitmp_742, tmp519
	movaps	%xmm6, 16(%rsp)	; tmp519, %sfp
	movaps	%xmm6, (%rsp)	; tmp519, %sfp
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %dl	;, _242
	jne	.L91	;,
	testb	%r8b, %r8b	; tmp513
	je	.L91	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp432
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp433
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp432, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp433, lexer_211(D)->position
; src/lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	EQ_SYMBOL(%rip), %rbx	; EQ_SYMBOL, EQ_SYMBOL.9_88
.L204:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	16(%rsp), %xmm7	; %sfp, tmp519
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; NE_SYMBOL.10_94,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm7, 8(%rax)	; tmp519,
; src/lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %xmm3	; prephitmp_742, prephitmp_742
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm3, %xmm0	; prephitmp_742, tmp360
	movaps	%xmm0, (%rsp)	; tmp360, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp360
; src/lexer.c:20:     token->type = type;
	movl	$1, 24(%rax)	;, token_253->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp360,
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L10:
; src/lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	; _285
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L26	;,
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r12), %rax	;, tmp372
	movq	%rax, 32(%rbx)	; tmp372, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	2(%rdi), %rax	;, tmp373
	movq	%rax, 8(%rbx)	; tmp373, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%rdi), %r13d	; *_278, _285
.L26:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rdi	;, tmp520
	jmp	.L27	;
	.p2align 4,,10
	.p2align 3
.L216:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rdx	;, tmp374
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdx, 8(%rbx)	; tmp374, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %r13d	; *_284, _285
.L27:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r13b	;, _285
	jbe	.L215	;,
.L29:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_211(D)->position, _280
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rax	; _212, _280
	jb	.L216	;,
; src/lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	; _285
.L28:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_211(D)->line, prephitmp_727
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %r13b	;, _285
	je	.L30	;,
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rax), %rcx	;, tmp379
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbp, %r8	; ivtmp.172,
	xorl	%eax, %eax	;
	leaq	.LC0(%rip), %r9	;,
	leaq	.LC1(%rip), %rdx	;, tmp381
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_211(D)->line, tmp578
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r13b	;, _285
	jne	.L30	;,
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, prephitmp_727
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_211(D)->column
; src/lexer.c:45:     lexer->line++;
	movq	%rax, 24(%rbx)	; prephitmp_727, lexer_211(D)->line
	.p2align 4,,10
	.p2align 3
.L30:
; src/lexer.c:104:         if (lexer->position - start == 1)
	movq	8(%rbx), %rsi	; lexer_211(D)->position, _41
	movq	%rax, %xmm0	; prephitmp_727, tmp383
	movq	%r12, %xmm5	; prephitmp_742, prephitmp_742
; src/lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	leaq	.LC2(%rip), %rdi	;, tmp385
	punpcklqdq	%xmm5, %xmm0	; prephitmp_742, tmp383
; src/lexer.c:104:         if (lexer->position - start == 1)
	subq	%rbp, %rsi	; ivtmp.172, _41
	movaps	%xmm0, (%rsp)	; tmp383, %sfp
; src/lexer.c:104:         if (lexer->position - start == 1)
	cmpq	$1, %rsi	;, _41
	je	.L202	;,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_211(D)->source, ivtmp.172
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	$1, %rsi	;, tmp386
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; ivtmp.172, ivtmp.172
.L202:
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp533, _48
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp383
; src/lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _48,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp383,
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L215:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r13, %rdi	; _285, tmp520
	jc	.L29	;,
	jmp	.L28	;
.L11:
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %dl	;, _242
	sete	%r8b	;, tmp389
	movl	%r8d, %r10d	; tmp389, _558
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L97	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rdi), %r9d	; *_292, _588
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	;, _588
	jne	.L35	;,
	testb	%r8b, %r8b	; tmp389
	je	.L35	;,
	addq	%r12, %rsi	; prephitmp_742, tmp393
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %r8d	;, _300
	subq	%rdi, %rsi	; _214, _499
; src/lexer.c:112:             while (c != '\n' && c != '\0')
	jmp	.L36	;
	.p2align 4,,10
	.p2align 3
.L217:
; src/lexer.c:112:             while (c != '\n' && c != '\0')
	leaq	1(%rbp), %rdx	;, ivtmp.188
	testb	%r8b, %r8b	; _300
	je	.L37	;,
	cmpb	$10, %r8b	;, _300
	je	.L37	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _248
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdx, 8(%rbx)	; ivtmp.188, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdx, %rbp	; ivtmp.188, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _248, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdx), %r8d	; MEM[(char *)_239 + -1B + ivtmp.188_484 * 1], _300
.L36:
	cmpq	%rsi, %rax	; _499, _248
	jne	.L217	;,
.L37:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _674
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp398
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _674, lexer_211(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rax, 32(%rbx)	; tmp398, lexer_211(D)->column
; src/lexer.c:115:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L208	;,
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, lexer_211(D)->line
	movq	%r12, %xmm7	; prephitmp_742, prephitmp_742
; src/lexer.c:110:             size_t start = lexer->position + 1;
	addq	$2, %rdi	;, start
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; start, tmp402
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rcx, %rdi	; _239, tmp403
	punpcklqdq	%xmm7, %xmm0	; prephitmp_742, tmp400
	movaps	%xmm0, (%rsp)	; tmp400, %sfp
.L203:
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp537, _74
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp419
; src/lexer.c:20:     token->type = type;
	movl	$7, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _74,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp419,
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	;
.L214:
; src/lexer.c:109:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _558
.L97:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, pretmp_186
	movq	%r12, %xmm7	; prephitmp_742, prephitmp_742
; src/lexer.c:40:         return '\0';
	xorl	%r9d, %r9d	; _588
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	xorl	%ecx, %ecx	; _582
	movdqa	%xmm0, %xmm6	; pretmp_186, _593
	punpcklqdq	%xmm7, %xmm6	; prephitmp_742, _593
	movaps	%xmm6, (%rsp)	; _593, %sfp
.L34:
; src/lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$43, %dl	;, _242
	jne	.L55	;,
	testb	%cl, %cl	; _582
	je	.L55	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L56	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp452
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp453
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp452, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp453, lexer_211(D)->position
.L56:
; src/lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.13_112
	subq	$2, %rax	;, tmp455
	movq	%rax, %xmm6	; tmp455, tmp455
	punpcklqdq	%xmm6, %xmm0	; tmp455, tmp454
	movaps	%xmm0, (%rsp)	; tmp454, %sfp
.L205:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp454
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ADD_ASSIGN_SYMBOL.13_112,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp454,
; src/lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
.L55:
; src/lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$45, %dl	;, _242
	jne	.L57	;,
	testb	%cl, %cl	; _582
	je	.L57	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L58	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp459
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp460
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp459, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp460, lexer_211(D)->position
.L58:
; src/lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.14_118
	subq	$2, %rax	;, tmp462
	movq	%rax, %xmm7	; tmp462, tmp462
	punpcklqdq	%xmm7, %xmm0	; tmp462, tmp461
	movaps	%xmm0, (%rsp)	; tmp461, %sfp
	jmp	.L205	;
.L35:
; src/lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	;, _588
	jne	.L41	;,
	testb	%r8b, %r8b	; tmp389
	je	.L41	;,
; src/lexer.c:119:             size_t start = lexer->position + 1;
	leaq	2(%rdi), %r14	;, start
; src/lexer.c:108:         char p = peek_next_char(lexer);
	movl	$42, %edx	;, p
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	;, c
	.p2align 4,,10
	.p2align 3
.L42:
; src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	jne	.L167	;,
	cmpb	$47, %dl	;, p
	je	.L218	;,
.L167:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rbp, %rsi	; ivtmp.172, _212
	je	.L43	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; ivtmp.172, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %eax	; MEM[(char *)_239 + -1B + _309 * 1], c
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L219	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	(%rcx,%rbp), %edx	; MEM[(char *)_239 + _309 * 1], p
; src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L47	;,
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_211(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_211(D)->column
; src/lexer.c:125:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	jne	.L167	;,
	jmp	.L201	;
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%dl, %dl	; p
	je	.L45	;,
; src/lexer.c:126:                 assert(c != '\0');
	testb	%al, %al	; c
	jne	.L42	;,
; src/lexer.c:126:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp407
	movl	$126, %edx	;,
	leaq	.LC3(%rip), %rsi	;, tmp408
	leaq	.LC4(%rip), %rdi	;, tmp409
	call	*__assert_fail@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L219:
; src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L45	;,
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_211(D)->line, tmp586
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_211(D)->column
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, prephitmp_19
	movq	%rax, 24(%rbx)	; prephitmp_19, lexer_211(D)->line
.L46:
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rax), %rcx	;, tmp415
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	3(%rdi), %r8	;,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC5(%rip), %r9	;,
	leaq	.LC1(%rip), %rdx	;, tmp417
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:131:                 if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L208	;,
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, tmp419
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rsi	; lexer_211(D)->position, tmp421
	movq	%r12, %xmm7	; prephitmp_742, prephitmp_742
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_211(D)->source, start
	punpcklqdq	%xmm7, %xmm0	; prephitmp_742, tmp419
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rsi	; start, tmp421
	movaps	%xmm0, (%rsp)	; tmp419, %sfp
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r14, %rdi	; start, start
	jmp	.L203	;
.L218:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_211(D)->position, prephitmp_16
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rax	; _212, prephitmp_16
	jnb	.L95	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, prephitmp_16
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	; prephitmp_16, lexer_211(D)->position
.L95:
; src/lexer.c:136:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L208	;,
	movq	24(%rbx), %xmm0	; lexer_211(D)->line, lexer_211(D)->line
	movq	%r12, %xmm7	; prephitmp_742, prephitmp_742
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%r14, %rax	; start, tmp428
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	(%rcx,%r14), %rdi	;, tmp431
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rsi	;, tmp430
	punpcklqdq	%xmm7, %xmm0	; prephitmp_742, tmp426
	movaps	%xmm0, (%rsp)	; tmp426, %sfp
	jmp	.L203	;
.L45:
; src/lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	jne	.L201	;,
	.p2align 4,,10
	.p2align 3
.L43:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	;, lexer_211(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_211(D)->column
.L201:
; src/lexer.c:130:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rax	; lexer_211(D)->line, prephitmp_19
; src/lexer.c:57: }
	jmp	.L46	;
.L57:
; src/lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$42, %dl	;, _242
	jne	.L59	;,
	testb	%cl, %cl	; _582
	je	.L61	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L60	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp466
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp467
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp466, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp467, lexer_211(D)->position
.L60:
; src/lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.15_124
	subq	$2, %rax	;, tmp469
	movq	%rax, %xmm6	; tmp469, tmp469
	punpcklqdq	%xmm6, %xmm0	; tmp469, tmp468
	movaps	%xmm0, (%rsp)	; tmp468, %sfp
	jmp	.L205	;
.L61:
; src/lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$37, %dl	;, _242
	jne	.L63	;,
	testb	%cl, %cl	; _582
	je	.L63	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L64	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp478
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp479
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp478, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp479, lexer_211(D)->position
.L64:
; src/lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.17_135
	subq	$2, %rax	;, tmp481
	movq	%rax, %xmm6	; tmp481, tmp481
	punpcklqdq	%xmm6, %xmm0	; tmp481, tmp480
	movaps	%xmm0, (%rsp)	; tmp480, %sfp
	jmp	.L205	;
.L63:
; src/lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, %dl	;, _242
	jne	.L65	;,
	cmpb	$38, %r9b	;, _588
	jne	.L65	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L66	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp487
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp488
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp487, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp488, lexer_211(D)->position
.L66:
; src/lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	AND_SYMBOL(%rip), %rbx	; AND_SYMBOL, AND_SYMBOL.18_142
	subq	$2, %rax	;, tmp490
	movq	%rax, %xmm7	; tmp490, tmp490
	punpcklqdq	%xmm7, %xmm0	; tmp490, tmp489
	movaps	%xmm0, (%rsp)	; tmp489, %sfp
	jmp	.L205	;
.L59:
; src/lexer.c:160:         } else if (c == '/' && p == '=') {
	testb	%cl, %cl	; _582
	je	.L61	;,
	testb	%r10b, %r10b	; _558
	je	.L61	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L62	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp471
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp472
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp471, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp472, lexer_211(D)->position
.L62:
; src/lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.16_129
	subq	$2, %rax	;, tmp474
	movq	%rax, %xmm7	; tmp474, tmp474
	punpcklqdq	%xmm7, %xmm0	; tmp474, tmp473
	movaps	%xmm0, (%rsp)	; tmp473, %sfp
	jmp	.L205	;
.L65:
; src/lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, %dl	;, _242
	jne	.L67	;,
	cmpb	$124, %r9b	;, _588
	jne	.L67	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L68	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp496
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp497
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp496, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp497, lexer_211(D)->position
.L68:
; src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	OR_SYMBOL(%rip), %rbx	; OR_SYMBOL, OR_SYMBOL.19_149
	subq	$2, %rax	;, tmp499
	movq	%rax, %xmm6	; tmp499, tmp499
	punpcklqdq	%xmm6, %xmm0	; tmp499, tmp498
	movaps	%xmm0, (%rsp)	; tmp498, %sfp
	jmp	.L205	;
.L67:
	subl	$33, %edx	;, tmp501
	cmpb	$92, %dl	;, tmp501
	ja	.L69	;,
	leaq	.L71(%rip), %rcx	;, tmp503
	movzbl	%dl, %edx	; tmp501, tmp502
	movslq	(%rcx,%rdx,4), %rdx	;, tmp505
	addq	%rcx, %rdx	; tmp503, tmp506
	jmp	*%rdx	; tmp506
	.section	.rodata
	.align 4
	.align 4
.L71:
	.long	.L88-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L87-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L86-.L71
	.long	.L85-.L71
	.long	.L84-.L71
	.long	.L83-.L71
	.long	.L82-.L71
	.long	.L81-.L71
	.long	.L80-.L71
	.long	.L79-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L78-.L71
	.long	.L77-.L71
	.long	.L76-.L71
	.long	.L75-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L74-.L71
	.long	.L69-.L71
	.long	.L73-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L69-.L71
	.long	.L72-.L71
	.long	.L69-.L71
	.long	.L70-.L71
	.text
.L91:
; src/lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$33, %dl	;, _242
	jne	.L53	;,
	testb	%r8b, %r8b	; tmp513
	jne	.L220	;,
.L53:
; src/lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$60, %dl	;, _242
	jne	.L94	;,
	testb	%r8b, %r8b	; tmp513
	je	.L94	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp439
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp438
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp439, lexer_211(D)->position
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp438, lexer_211(D)->column
; src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	LE_SYMBOL(%rip), %rbx	; LE_SYMBOL, LE_SYMBOL.11_100
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	16(%rsp), %xmm6	; %sfp, tmp519
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_330->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; LE_SYMBOL.11_100, token_330->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	; tmp519,
; src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
.L220:
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp436
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp437
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp436, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp437, lexer_211(D)->position
; src/lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	NE_SYMBOL(%rip), %rbx	; NE_SYMBOL, NE_SYMBOL.10_94
	jmp	.L204	;
.L70:
; src/lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACE_SYMBOL(%rip), %rbx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.23_157
.L207:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm6	; %sfp, _593
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; DIV_SYMBOL.34_177,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	; _593,
; src/lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L94:
; src/lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$62, %dl	;, _242
	jne	.L34	;,
	testb	%r8b, %r8b	; tmp513
	je	.L34	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L54	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp445
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp446
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp445, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp446, lexer_211(D)->position
.L54:
; src/lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_211(D)->column, lexer_211(D)->column
	movq	GE_SYMBOL(%rip), %rbx	; GE_SYMBOL, GE_SYMBOL.12_106
	subq	$2, %rax	;, tmp448
	movq	%rax, %xmm7	; tmp448, tmp448
	punpcklqdq	%xmm7, %xmm0	; tmp448, tmp447
	movaps	%xmm0, (%rsp)	; tmp447, %sfp
	jmp	.L205	;
.L72:
; src/lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACE_SYMBOL(%rip), %rbx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.22_155
.L206:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm7	; %sfp, _593
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; MOD_SYMBOL.35_179,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm7, 8(%rax)	; _593,
; src/lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L73:
; src/lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACKET_SYMBOL(%rip), %rbx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.28_167
	jmp	.L206	;
.L74:
; src/lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACKET_SYMBOL(%rip), %rbx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.27_165
	jmp	.L207	;
.L75:
; src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	GT_SYMBOL(%rip), %rbx	; GT_SYMBOL, GT_SYMBOL.37_183
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm3	; %sfp, _593
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_389->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; GT_SYMBOL.37_183, token_389->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm3, 8(%rax)	; _593, MEM <vector(2) long unsigned int> [(long unsigned int *)token_389 + 8B]
; src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L76:
; src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	ASSIGN_SYMBOL(%rip), %rbx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_185
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm4	; %sfp, _593
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_390->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ASSIGN_SYMBOL.38_185, token_390->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm4, 8(%rax)	; _593, MEM <vector(2) long unsigned int> [(long unsigned int *)token_390 + 8B]
; src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L77:
; src/lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	LT_SYMBOL(%rip), %rbx	; LT_SYMBOL, LT_SYMBOL.36_181
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm2	; %sfp, _593
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_388->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; LT_SYMBOL.36_181, token_388->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm2, 8(%rax)	; _593, MEM <vector(2) long unsigned int> [(long unsigned int *)token_388 + 8B]
; src/lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L78:
; src/lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	SEMICOLON_SYMBOL(%rip), %rbx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.29_169
	jmp	.L207	;
.L79:
; src/lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	DIV_SYMBOL(%rip), %rbx	; DIV_SYMBOL, DIV_SYMBOL.34_177
	jmp	.L207	;
.L80:
; src/lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	DOT_SYMBOL(%rip), %rbx	; DOT_SYMBOL, DOT_SYMBOL.26_163
	jmp	.L206	;
.L81:
; src/lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	SUB_SYMBOL(%rip), %rbx	; SUB_SYMBOL, SUB_SYMBOL.32_173
	jmp	.L207	;
.L82:
; src/lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	COMMA_SYMBOL(%rip), %rbx	; COMMA_SYMBOL, COMMA_SYMBOL.24_159
	jmp	.L206	;
.L83:
; src/lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	ADD_SYMBOL(%rip), %rbx	; ADD_SYMBOL, ADD_SYMBOL.31_171
	jmp	.L206	;
.L84:
; src/lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	MUL_SYMBOL(%rip), %rbx	; MUL_SYMBOL, MUL_SYMBOL.33_175
	jmp	.L206	;
.L85:
; src/lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_PAREN_SYMBOL(%rip), %rbx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.21_153
	jmp	.L207	;
.L86:
; src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_PAREN_SYMBOL(%rip), %rbx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.20_151
	jmp	.L206	;
.L87:
; src/lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	MOD_SYMBOL(%rip), %rbx	; MOD_SYMBOL, MOD_SYMBOL.35_179
	jmp	.L206	;
.L88:
; src/lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	NOT_SYMBOL(%rip), %rbx	; NOT_SYMBOL, NOT_SYMBOL.25_161
	jmp	.L207	;
.L69:
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	%xmm0, %rcx	; pretmp_186, pretmp_186
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rax, %r8	; _248,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	addq	$1, %rcx	;, pretmp_186
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %rdx	;, tmp510
	movl	$2, %esi	;,
	leaq	.LC6(%rip), %r9	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:20:     token->type = type;
	xorl	%edx, %edx	;
; src/lexer.c:21:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	;
; src/lexer.c:22:     token->line = line;
	pxor	%xmm0, %xmm0	; tmp511
; src/lexer.c:20:     token->type = type;
	movl	%edx, 24(%rax)	;, token_391->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	;, token_391->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp511,
; src/lexer.c:212:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	.L1	;
.L22:
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _212, ivtmp.172
	jnb	.L103	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %dl	;, _242
	jne	.L103	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	leaq	(%rcx,%rbp), %r8	;, _261
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%r8), %edx	; *_261, tmp576
	subl	$48, %edx	;, tmp364
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %dl	;, tmp364
	ja	.L103	;,
; src/lexer.c:34:     lexer->column++;
	leaq	1(%rax), %r10	;, _265
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rbp), %r11	;, _266
	addq	%rax, %rsi	; _248, tmp366
; src/lexer.c:34:     lexer->column++;
	movq	%r10, 32(%rbx)	; _265, lexer_211(D)->column
	subq	%rbp, %rsi	; ivtmp.172, _427
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r10, %rax	; _265, _248
	movq	%r11, %rbp	; _266, ivtmp.172
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r11, 8(%rbx)	; _266, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%r8), %edx	; *_261, _274
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L221:
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %edx	;, tmp367
	leaq	1(%rbp), %r8	;, ivtmp.152
	cmpb	$9, %dl	;, tmp367
	ja	.L104	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _248
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	; ivtmp.152, lexer_211(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rbp	; ivtmp.152, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _248, lexer_211(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %edx	; MEM[(char *)_239 + -1B + ivtmp.152_652 * 1], _274
.L24:
	cmpq	%rax, %rsi	; _248, _427
	jne	.L221	;,
.L104:
; src/lexer.c:90:             type = FLOAT;
	movl	$3, %r13d	;, type
	jmp	.L23	;
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
	je	.L225	;,
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
.L225:
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
	movq	40(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:231:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; <retval>
	je	.L234	;,
; src/lexer.c:245: }
	ret	
	.p2align 4,,10
	.p2align 3
.L234:
; src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	;
; src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp100, lexer
	subq	$24, %rsp	;,
; src/lexer.c:234:     size_t saved_line = lexer->line;
	movdqu	24(%rdi), %xmm1	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
; src/lexer.c:233:     size_t saved_position = lexer->position;
	movq	8(%rdi), %rbp	; lexer_8(D)->position, saved_position
; src/lexer.c:234:     size_t saved_line = lexer->line;
	movaps	%xmm1, (%rsp)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], %sfp
; src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	call	next_token	;
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movdqu	8(%rbx), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 8B], vect__2.237
	movdqu	24(%rbx), %xmm2	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], tmp105
; src/lexer.c:240:     lexer->position = saved_position;
	movq	%rbp, 8(%rbx)	; saved_position, lexer_8(D)->position
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	; lexer_8(D)->column, lexer_8(D)->column
; src/lexer.c:241:     lexer->line = saved_line;
	movdqa	(%rsp), %xmm1	; %sfp, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
; src/lexer.c:227:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm2, %xmm0	; tmp105, vect__2.237
; src/lexer.c:243:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	; <retval>, lexer_8(D)->peeked_token
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	; lexer_8(D)->column, lexer_8(D)->peeked_column
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 48(%rbx)	; vect__2.237, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 48B]
; src/lexer.c:241:     lexer->line = saved_line;
	movups	%xmm1, 24(%rbx)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
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

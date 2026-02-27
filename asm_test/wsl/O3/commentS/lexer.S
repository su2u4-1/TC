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
	pushq	%r14	;
	pushq	%r13	;
	movl	%esi, %r13d	; tmp534, skip_comment
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp533, lexer
	subq	$32, %rsp	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rdi), %rdi	; lexer_215(D)->position, _218
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rsi	; lexer_215(D)->length, _216
; src/lexer.c:34:     lexer->column++;
	movq	32(%rbx), %r12	; lexer_215(D)->column, prephitmp_744
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rdi	; _216, _218
	jnb	.L2	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rbx), %rcx	; lexer_215(D)->source, _243
; src/lexer.c:34:     lexer->column++;
	leaq	1(%r12), %rax	;, _252
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rdi), %rbp	;, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _252, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	(%rcx,%rdi), %r9	;, _245
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; ivtmp.172, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%r9), %edx	; *_245, _246
	cmpb	$32, %dl	;, _246
	ja	.L3	;,
	leaq	.L5(%rip), %r10	;, tmp345
	movzbl	%dl, %r8d	; _246, _246
	movslq	(%r10,%r8,4), %r8	;, tmp347
	addq	%r10, %r8	; tmp345, tmp348
	jmp	*%r8	; tmp348
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
	.long	.L205-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L205-.L5
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
	.long	.L205-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rax, %r12	; _252, prephitmp_744
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, lexer_215(D)->line
	movq	%r12, %xmm1	; prephitmp_744, prephitmp_744
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm1, %xmm0	; prephitmp_744, tmp350
	movaps	%xmm0, (%rsp)	; tmp350, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp350
; src/lexer.c:20:     token->type = type;
	movl	$0, 24(%rax)	;, token_247->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	$0, (%rax)	;, token_247->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp350,
.L1:
; src/lexer.c:214: }
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
	addq	$1, 24(%rbx)	;, lexer_215(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_215(D)->column
.L205:
; src/lexer.c:214: }
	addq	$32, %rsp	;,
; src/lexer.c:136:                 return next_token(lexer, skip_comment);
	movsbl	%r13b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:214: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/lexer.c:136:                 return next_token(lexer, skip_comment);
	jmp	next_token	;
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$90, %dl	;, _246
	jg	.L8	;,
	cmpb	$64, %dl	;, _246
	jg	.L9	;,
	cmpb	$34, %dl	;, _246
	je	.L10	;,
	leal	-48(%rdx), %r8d	;, tmp354
	cmpb	$9, %r8b	;, tmp354
	ja	.L11	;,
	leaq	(%rsi,%r12), %r11	;, tmp355
	subq	%rdi, %r11	; _218, _447
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L207:
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rdx), %r10d	;, tmp368
	leaq	1(%rbp), %r8	;, ivtmp.172
	cmpb	$9, %r10b	;, tmp368
	ja	.L22	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _252
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	; ivtmp.172, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rbp	; ivtmp.172, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _252, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %edx	; MEM[(char *)_243 + -1B + ivtmp.172_443 * 1], _246
.L12:
	cmpq	%rax, %r11	; _252, _447
	jne	.L207	;,
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rdx), %r8d	;, tmp369
	cmpb	$9, %r8b	;, tmp369
	ja	.L22	;,
.L103:
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
.L23:
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, lexer_215(D)->line
	movq	%r12, %xmm4	; prephitmp_744, prephitmp_744
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _672
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp374
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _672, lexer_215(D)->position
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; _218, tmp377
	movq	%r9, %rdi	; _245,
	punpcklqdq	%xmm4, %xmm0	; prephitmp_744, tmp375
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rax, 32(%rbx)	; tmp374, lexer_215(D)->column
	movaps	%xmm0, (%rsp)	; tmp375, %sfp
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp540, _35
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp375
; src/lexer.c:20:     token->type = type;
	movl	%r13d, 24(%rax)	; type, token_279->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _35,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp375,
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %dl	;, _246
	jne	.L208	;,
.L9:
	movabsq	$288230372997595135, %r8	;, tmp532
	addq	%r12, %rsi	; prephitmp_744, tmp357
	subq	%rdi, %rsi	; _218, _416
	jmp	.L14	;
	.p2align 4,,10
	.p2align 3
.L210:
	cmpb	$57, %dl	;, _246
	jle	.L209	;,
	subl	$65, %edx	;, _517
	cmpb	$57, %dl	;, _517
	ja	.L15	;,
	btq	%rdx, %r8	; _517, tmp532
	jnc	.L15	;,
.L17:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _252
	movq	%rax, 32(%rbx)	; _252, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; ivtmp.172, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %edx	; MEM[(char *)_243 + -1B + _253 * 1], _246
.L14:
	cmpq	%rax, %rsi	; _252, _416
	jne	.L210	;,
.L15:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _666
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp362
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _666, lexer_215(D)->position
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rdi, %rsi	; _218, tmp363
	movq	%r9, %rdi	; _245,
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rax, 32(%rbx)	; tmp362, lexer_215(D)->column
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp536, content
; src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	call	*is_keyword@GOTPCREL(%rip)	;
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, lexer_215(D)->line
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; tmp537
	je	.L19	;,
	movq	%r12, %xmm2	; prephitmp_744, prephitmp_744
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm2, %xmm0	; prephitmp_744, tmp364
	movaps	%xmm0, (%rsp)	; tmp364, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp364
; src/lexer.c:20:     token->type = type;
	movl	$6, 24(%rax)	;, token_256->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp364,
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L209:
	cmpb	$47, %dl	;, _246
	jg	.L17	;,
	jmp	.L15	;
	.p2align 4,,10
	.p2align 3
.L208:
	leal	-97(%rdx), %r8d	;, tmp356
	cmpb	$25, %r8b	;, tmp356
	jbe	.L9	;,
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L211	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rdi), %r9d	; *_267, _545
; src/lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _566
.L41:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, pretmp_602
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	;, _545
	movq	%r12, %xmm5	; prephitmp_744, prephitmp_744
	sete	%r8b	;, tmp524
	movdqa	%xmm0, %xmm6	; pretmp_602, tmp530
	movl	%r8d, %ecx	; tmp524, _601
	punpcklqdq	%xmm5, %xmm6	; prephitmp_744, tmp530
	movaps	%xmm6, 16(%rsp)	; tmp530, %sfp
	movaps	%xmm6, (%rsp)	; tmp530, %sfp
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %dl	;, _246
	jne	.L91	;,
	testb	%r8b, %r8b	; tmp524
	je	.L91	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp443
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp444
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp443, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp444, lexer_215(D)->position
; src/lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	EQ_SYMBOL(%rip), %rbx	; EQ_SYMBOL, EQ_SYMBOL.9_92
.L200:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	16(%rsp), %xmm6	; %sfp, tmp530
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; NE_SYMBOL.10_98,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	; tmp530,
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %xmm3	; prephitmp_744, prephitmp_744
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm3, %xmm0	; prephitmp_744, tmp366
	movaps	%xmm0, (%rsp)	; tmp366, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp366
; src/lexer.c:20:     token->type = type;
	movl	$1, 24(%rax)	;, token_257->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp366,
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L10:
; src/lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	; _289
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L26	;,
; src/lexer.c:34:     lexer->column++;
	leaq	2(%r12), %rax	;, tmp378
	movq	%rax, 32(%rbx)	; tmp378, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	2(%rdi), %rax	;, tmp379
	movq	%rax, 8(%rbx)	; tmp379, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%rdi), %r13d	; *_282, _289
.L26:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rdi	;, tmp531
	jmp	.L27	;
	.p2align 4,,10
	.p2align 3
.L213:
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rdx	;, tmp380
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdx, 8(%rbx)	; tmp380, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %r13d	; *_288, _289
.L27:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r13b	;, _289
	jbe	.L212	;,
.L29:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_215(D)->position, _284
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rax	; _216, _284
	jb	.L213	;,
; src/lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	; _289
.L28:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %r14	; lexer_215(D)->line, pretmp_745
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %r13b	;, _289
	je	.L30	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%r14), %rcx	;, tmp385
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %r8	; ivtmp.172,
	leaq	.LC0(%rip), %r9	;,
	leaq	.LC1(%rip), %rdx	;, tmp387
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r13b	;, _289
	je	.L31	;,
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, pretmp_729
.L32:
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_215(D)->source, ivtmp.172
	movq	%r12, %xmm5	; prephitmp_744, prephitmp_744
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %rsi	; ivtmp.172, tmp390
	punpcklqdq	%xmm5, %xmm0	; prephitmp_744, tmp389
	notq	%rsi	; tmp390
	addq	8(%rbx), %rsi	; lexer_215(D)->position, tmp392
	movaps	%xmm0, (%rsp)	; tmp389, %sfp
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; ivtmp.172, ivtmp.172
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp542, _46
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp389
; src/lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	;, token_294->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _46,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp389,
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L212:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r13, %rdi	; _289, tmp531
	jc	.L29	;,
	jmp	.L28	;
.L11:
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %dl	;, _246
	sete	%r8b	;, tmp400
	movl	%r8d, %r10d	; tmp400, _566
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L97	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rdi), %r9d	; *_296, _545
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	;, _545
	jne	.L35	;,
	testb	%r8b, %r8b	; tmp400
	je	.L35	;,
	addq	%r12, %rsi	; prephitmp_744, tmp404
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %r8d	;, _304
	subq	%rdi, %rsi	; _218, _503
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	jmp	.L36	;
	.p2align 4,,10
	.p2align 3
.L214:
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	leaq	1(%rbp), %rdx	;, ivtmp.188
	testb	%r8b, %r8b	; _304
	je	.L37	;,
	cmpb	$10, %r8b	;, _304
	je	.L37	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _252
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdx, 8(%rbx)	; ivtmp.188, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdx, %rbp	; ivtmp.188, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _252, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdx), %r8d	; MEM[(char *)_243 + -1B + ivtmp.188_488 * 1], _304
.L36:
	cmpq	%rsi, %rax	; _503, _252
	jne	.L214	;,
.L37:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _678
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp409
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rsi, 8(%rbx)	; _678, lexer_215(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rax, 32(%rbx)	; tmp409, lexer_215(D)->column
; src/lexer.c:114:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L205	;,
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, lexer_215(D)->line
	movq	%r12, %xmm7	; prephitmp_744, prephitmp_744
; src/lexer.c:109:             size_t start = lexer->position + 1;
	addq	$2, %rdi	;, start
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; start, tmp413
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rcx, %rdi	; _243, tmp414
	punpcklqdq	%xmm7, %xmm0	; prephitmp_744, tmp411
	movaps	%xmm0, (%rsp)	; tmp411, %sfp
.L199:
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp548, _78
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp430
; src/lexer.c:20:     token->type = type;
	movl	$7, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _78,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp430,
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	;
.L30:
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %rsi	; ivtmp.172, tmp395
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	(%rcx,%rbp), %rdi	;, tmp398
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	notq	%rsi	; tmp395
	addq	8(%rbx), %rsi	; lexer_215(D)->position, tmp397
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp544, _52
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movq	%r14, %xmm0	; pretmp_745, tmp399
	movq	%r12, %xmm7	; prephitmp_744, prephitmp_744
	punpcklqdq	%xmm7, %xmm0	; prephitmp_744, tmp399
; src/lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	;, token_295->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _52, token_295->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp399,
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	;
.L31:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_215(D)->line, tmp590
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_215(D)->column
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, pretmp_729
	movq	%rax, 24(%rbx)	; pretmp_729, lexer_215(D)->line
	movq	%rax, %xmm0	; pretmp_729, pretmp_729
; src/lexer.c:47: }
	jmp	.L32	;
.L211:
; src/lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _566
.L97:
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, pretmp_602
	movq	%r12, %xmm7	; prephitmp_744, prephitmp_744
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	xorl	%ecx, %ecx	; _601
; src/lexer.c:40:         return '\0';
	xorl	%r9d, %r9d	; _545
	movdqa	%xmm0, %xmm6	; pretmp_602, _608
	punpcklqdq	%xmm7, %xmm6	; prephitmp_744, _608
	movaps	%xmm6, (%rsp)	; _608, %sfp
.L34:
; src/lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, %dl	;, _246
	jne	.L55	;,
	testb	%cl, %cl	; _601
	je	.L55	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L56	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp463
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp464
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp463, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp464, lexer_215(D)->position
.L56:
; src/lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.13_116
	subq	$2, %rax	;, tmp466
	movq	%rax, %xmm7	; tmp466, tmp466
	punpcklqdq	%xmm7, %xmm0	; tmp466, tmp465
	movaps	%xmm0, (%rsp)	; tmp465, %sfp
.L201:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp465
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ADD_ASSIGN_SYMBOL.13_116,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp465,
; src/lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
.L55:
; src/lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, %dl	;, _246
	jne	.L57	;,
	testb	%cl, %cl	; _601
	je	.L57	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L58	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp470
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp471
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp470, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp471, lexer_215(D)->position
.L58:
; src/lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.14_122
	subq	$2, %rax	;, tmp473
	movq	%rax, %xmm5	; tmp473, tmp473
	punpcklqdq	%xmm5, %xmm0	; tmp473, tmp472
	movaps	%xmm0, (%rsp)	; tmp472, %sfp
	jmp	.L201	;
.L35:
; src/lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	;, _545
	jne	.L41	;,
	testb	%r8b, %r8b	; tmp400
	je	.L41	;,
; src/lexer.c:118:             size_t start = lexer->position + 1;
	leaq	2(%rdi), %r14	;, start
; src/lexer.c:107:         char p = peek_next_char(lexer);
	movl	$42, %edx	;, p
; src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	;, c
	.p2align 4,,10
	.p2align 3
.L42:
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	jne	.L165	;,
	cmpb	$47, %dl	;, p
	je	.L215	;,
.L165:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rbp, %rsi	; ivtmp.172, _216
	je	.L43	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rbp, 8(%rbx)	; ivtmp.172, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rbp), %eax	; MEM[(char *)_243 + -1B + _313 * 1], c
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L216	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	(%rcx,%rbp), %edx	; MEM[(char *)_243 + _313 * 1], p
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L47	;,
; src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	;, lexer_215(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_215(D)->column
; src/lexer.c:124:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	jne	.L165	;,
	jmp	.L198	;
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%dl, %dl	; p
	je	.L45	;,
; src/lexer.c:125:                 assert(c != '\0');
	testb	%al, %al	; c
	jne	.L42	;,
; src/lexer.c:125:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp418
	movl	$125, %edx	;,
	leaq	.LC2(%rip), %rsi	;, tmp419
	leaq	.LC3(%rip), %rdi	;, tmp420
	call	*__assert_fail@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L216:
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L45	;,
; src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	; lexer_215(D)->line, tmp600
; src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	;, lexer_215(D)->column
; src/lexer.c:45:     lexer->line++;
	addq	$1, %rax	;, prephitmp_19
	movq	%rax, 24(%rbx)	; prephitmp_19, lexer_215(D)->line
.L46:
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rax), %rcx	;, tmp426
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	3(%rdi), %r8	;,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC4(%rip), %r9	;,
	leaq	.LC1(%rip), %rdx	;, tmp428
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:130:                 if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L205	;,
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, tmp430
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rsi	; lexer_215(D)->position, tmp432
	movq	%r12, %xmm6	; prephitmp_744, prephitmp_744
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	(%rbx), %rdi	; lexer_215(D)->source, start
	punpcklqdq	%xmm6, %xmm0	; prephitmp_744, tmp430
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rsi	; start, tmp432
	movaps	%xmm0, (%rsp)	; tmp430, %sfp
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r14, %rdi	; start, start
	jmp	.L199	;
.L215:
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	; lexer_215(D)->position, prephitmp_16
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rax	; _216, prephitmp_16
	jnb	.L95	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, prephitmp_16
; src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	;, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	; prephitmp_16, lexer_215(D)->position
.L95:
; src/lexer.c:135:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L205	;,
	movq	24(%rbx), %xmm0	; lexer_215(D)->line, lexer_215(D)->line
	movq	%r12, %xmm5	; prephitmp_744, prephitmp_744
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%r14, %rax	; start, tmp439
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	(%rcx,%r14), %rdi	;, tmp442
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rsi	;, tmp441
	punpcklqdq	%xmm5, %xmm0	; prephitmp_744, tmp437
	movaps	%xmm0, (%rsp)	; tmp437, %sfp
	jmp	.L199	;
.L45:
; src/lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	jne	.L198	;,
	.p2align 4,,10
	.p2align 3
.L43:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	;, lexer_215(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	;, lexer_215(D)->column
.L198:
; src/lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rax	; lexer_215(D)->line, prephitmp_19
; src/lexer.c:57: }
	jmp	.L46	;
.L57:
; src/lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, %dl	;, _246
	jne	.L59	;,
	testb	%cl, %cl	; _601
	je	.L61	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L60	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp477
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp478
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp477, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp478, lexer_215(D)->position
.L60:
; src/lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.15_128
	subq	$2, %rax	;, tmp480
	movq	%rax, %xmm6	; tmp480, tmp480
	punpcklqdq	%xmm6, %xmm0	; tmp480, tmp479
	movaps	%xmm0, (%rsp)	; tmp479, %sfp
	jmp	.L201	;
.L61:
; src/lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, %dl	;, _246
	jne	.L63	;,
	testb	%cl, %cl	; _601
	je	.L63	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L64	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp489
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp490
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp489, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp490, lexer_215(D)->position
.L64:
; src/lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.17_139
	subq	$2, %rax	;, tmp492
	movq	%rax, %xmm5	; tmp492, tmp492
	punpcklqdq	%xmm5, %xmm0	; tmp492, tmp491
	movaps	%xmm0, (%rsp)	; tmp491, %sfp
	jmp	.L201	;
.L63:
; src/lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, %dl	;, _246
	jne	.L65	;,
	cmpb	$38, %r9b	;, _545
	jne	.L65	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L66	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp498
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp499
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp498, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp499, lexer_215(D)->position
.L66:
; src/lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	AND_SYMBOL(%rip), %rbx	; AND_SYMBOL, AND_SYMBOL.18_146
	subq	$2, %rax	;, tmp501
	movq	%rax, %xmm6	; tmp501, tmp501
	punpcklqdq	%xmm6, %xmm0	; tmp501, tmp500
	movaps	%xmm0, (%rsp)	; tmp500, %sfp
	jmp	.L201	;
.L59:
; src/lexer.c:159:         } else if (c == '/' && p == '=') {
	testb	%cl, %cl	; _601
	je	.L61	;,
	testb	%r10b, %r10b	; _566
	je	.L61	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L62	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp482
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp483
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp482, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp483, lexer_215(D)->position
.L62:
; src/lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.16_133
	subq	$2, %rax	;, tmp485
	movq	%rax, %xmm7	; tmp485, tmp485
	punpcklqdq	%xmm7, %xmm0	; tmp485, tmp484
	movaps	%xmm0, (%rsp)	; tmp484, %sfp
	jmp	.L201	;
.L65:
; src/lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, %dl	;, _246
	jne	.L67	;,
	cmpb	$124, %r9b	;, _545
	jne	.L67	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L68	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp507
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp508
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp507, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp508, lexer_215(D)->position
.L68:
; src/lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	OR_SYMBOL(%rip), %rbx	; OR_SYMBOL, OR_SYMBOL.19_153
	subq	$2, %rax	;, tmp510
	movq	%rax, %xmm7	; tmp510, tmp510
	punpcklqdq	%xmm7, %xmm0	; tmp510, tmp509
	movaps	%xmm0, (%rsp)	; tmp509, %sfp
	jmp	.L201	;
.L67:
	subl	$33, %edx	;, tmp512
	cmpb	$92, %dl	;, tmp512
	ja	.L69	;,
	leaq	.L71(%rip), %rcx	;, tmp514
	movzbl	%dl, %edx	; tmp512, tmp513
	movslq	(%rcx,%rdx,4), %rdx	;, tmp516
	addq	%rcx, %rdx	; tmp514, tmp517
	jmp	*%rdx	; tmp517
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
; src/lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, %dl	;, _246
	jne	.L53	;,
	testb	%r8b, %r8b	; tmp524
	jne	.L217	;,
.L53:
; src/lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, %dl	;, _246
	jne	.L94	;,
	testb	%r8b, %r8b	; tmp524
	je	.L94	;,
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp450
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp449
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp450, lexer_215(D)->position
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp449, lexer_215(D)->column
; src/lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	LE_SYMBOL(%rip), %rbx	; LE_SYMBOL, LE_SYMBOL.11_104
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	16(%rsp), %xmm5	; %sfp, tmp530
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_334->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; LE_SYMBOL.11_104, token_334->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm5, 8(%rax)	; tmp530,
; src/lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
.L217:
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp447
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp448
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp447, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp448, lexer_215(D)->position
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	NE_SYMBOL(%rip), %rbx	; NE_SYMBOL, NE_SYMBOL.10_98
	jmp	.L200	;
.L70:
; src/lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACE_SYMBOL(%rip), %rbx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.23_161
.L204:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm5	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; MUL_SYMBOL.33_179,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm5, 8(%rax)	; _608,
; src/lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L94:
; src/lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, %dl	;, _246
	jne	.L34	;,
	testb	%r8b, %r8b	; tmp524
	je	.L34	;,
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L54	;,
; src/lexer.c:34:     lexer->column++;
	addq	$2, %r12	;, tmp456
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp457
; src/lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	; tmp456, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	; tmp457, lexer_215(D)->position
.L54:
; src/lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	; lexer_215(D)->column, lexer_215(D)->column
	movq	GE_SYMBOL(%rip), %rbx	; GE_SYMBOL, GE_SYMBOL.12_110
	subq	$2, %rax	;, tmp459
	movq	%rax, %xmm6	; tmp459, tmp459
	punpcklqdq	%xmm6, %xmm0	; tmp459, tmp458
	movaps	%xmm0, (%rsp)	; tmp458, %sfp
	jmp	.L201	;
.L72:
; src/lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACE_SYMBOL(%rip), %rbx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.22_159
.L202:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm7	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; MOD_SYMBOL.35_183,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm7, 8(%rax)	; _608,
; src/lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L73:
; src/lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACKET_SYMBOL(%rip), %rbx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.28_171
	jmp	.L202	;
.L74:
; src/lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACKET_SYMBOL(%rip), %rbx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.27_169
.L203:
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm6	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; DIV_SYMBOL.34_181,* <retval>
; src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	; _608,
; src/lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L75:
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	GT_SYMBOL(%rip), %rbx	; GT_SYMBOL, GT_SYMBOL.37_187
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm3	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_393->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; GT_SYMBOL.37_187, token_393->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm3, 8(%rax)	; _608, MEM <vector(2) long unsigned int> [(long unsigned int *)token_393 + 8B]
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L76:
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	ASSIGN_SYMBOL(%rip), %rbx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_189
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm4	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_394->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ASSIGN_SYMBOL.38_189, token_394->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm4, 8(%rax)	; _608, MEM <vector(2) long unsigned int> [(long unsigned int *)token_394 + 8B]
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L77:
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	LT_SYMBOL(%rip), %rbx	; LT_SYMBOL, LT_SYMBOL.36_185
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:22:     token->line = line;
	movdqa	(%rsp), %xmm2	; %sfp, _608
; src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	;, token_392->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; LT_SYMBOL.36_185, token_392->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm2, 8(%rax)	; _608, MEM <vector(2) long unsigned int> [(long unsigned int *)token_392 + 8B]
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L78:
; src/lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	SEMICOLON_SYMBOL(%rip), %rbx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.29_173
	jmp	.L204	;
.L79:
; src/lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	DIV_SYMBOL(%rip), %rbx	; DIV_SYMBOL, DIV_SYMBOL.34_181
	jmp	.L203	;
.L80:
; src/lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	DOT_SYMBOL(%rip), %rbx	; DOT_SYMBOL, DOT_SYMBOL.26_167
	jmp	.L204	;
.L81:
; src/lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	SUB_SYMBOL(%rip), %rbx	; SUB_SYMBOL, SUB_SYMBOL.32_177
	jmp	.L202	;
.L82:
; src/lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	COMMA_SYMBOL(%rip), %rbx	; COMMA_SYMBOL, COMMA_SYMBOL.24_163
	jmp	.L203	;
.L83:
; src/lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	ADD_SYMBOL(%rip), %rbx	; ADD_SYMBOL, ADD_SYMBOL.31_175
	jmp	.L203	;
.L84:
; src/lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	MUL_SYMBOL(%rip), %rbx	; MUL_SYMBOL, MUL_SYMBOL.33_179
	jmp	.L204	;
.L85:
; src/lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_PAREN_SYMBOL(%rip), %rbx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.21_157
	jmp	.L203	;
.L86:
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_PAREN_SYMBOL(%rip), %rbx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.20_155
	jmp	.L204	;
.L87:
; src/lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	MOD_SYMBOL(%rip), %rbx	; MOD_SYMBOL, MOD_SYMBOL.35_183
	jmp	.L202	;
.L88:
; src/lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	NOT_SYMBOL(%rip), %rbx	; NOT_SYMBOL, NOT_SYMBOL.25_165
	jmp	.L202	;
.L69:
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	%xmm0, %rcx	; pretmp_602, pretmp_602
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rax, %r8	; _252,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	addq	$1, %rcx	;, pretmp_602
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %rdx	;, tmp521
	movl	$2, %esi	;,
	leaq	.LC5(%rip), %r9	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:20:     token->type = type;
	xorl	%edx, %edx	;
; src/lexer.c:21:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	;
; src/lexer.c:22:     token->line = line;
	pxor	%xmm0, %xmm0	; tmp522
; src/lexer.c:20:     token->type = type;
	movl	%edx, 24(%rax)	;, token_395->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	;, token_395->lexeme
; src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp522,
; src/lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	jmp	.L1	;
.L22:
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rsi, %rbp	; _216, ivtmp.172
	jnb	.L103	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %dl	;, _246
	jne	.L103	;,
; src/lexer.c:41:     return lexer->source[lexer->position];
	leaq	(%rcx,%rbp), %r8	;, _265
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%r8), %edx	; *_265, tmp587
	subl	$48, %edx	;, tmp370
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %dl	;, tmp370
	ja	.L103	;,
; src/lexer.c:34:     lexer->column++;
	leaq	1(%rax), %r10	;, _269
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rbp), %r11	;, _270
	addq	%rax, %rsi	; _252, tmp372
; src/lexer.c:34:     lexer->column++;
	movq	%r10, 32(%rbx)	; _269, lexer_215(D)->column
	subq	%rbp, %rsi	; ivtmp.172, _431
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r10, %rax	; _269, _252
	movq	%r11, %rbp	; _270, ivtmp.172
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r11, 8(%rbx)	; _270, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%r8), %edx	; *_265, _278
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L218:
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %edx	;, tmp373
	leaq	1(%rbp), %r8	;, ivtmp.152
	cmpb	$9, %dl	;, tmp373
	ja	.L104	;,
; src/lexer.c:34:     lexer->column++;
	addq	$1, %rax	;, _252
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	; ivtmp.152, lexer_215(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rbp	; ivtmp.152, ivtmp.172
; src/lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	; _252, lexer_215(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %edx	; MEM[(char *)_243 + -1B + ivtmp.152_656 * 1], _278
.L24:
	cmpq	%rax, %rsi	; _252, _431
	jne	.L218	;,
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
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_lexer, .-create_lexer
	.p2align 4
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	40(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:216: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
; src/lexer.c:216: Token* get_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rdi, %rbx	; tmp93, lexer
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	; <retval>
	je	.L222	;,
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	48(%rdi), %rdx	; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
; src/lexer.c:227: }
	popq	%rbx	;
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
.L222:
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
	call	next_token	;
; src/lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:227: }
	popq	%rbx	;
	ret	
	.size	get_next_token, .-get_next_token
	.p2align 4
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	movq	40(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	; <retval>
	je	.L231	;,
; src/lexer.c:244: }
	ret	
	.p2align 4,,10
	.p2align 3
.L231:
; src/lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	;
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp100, lexer
	subq	$24, %rsp	;,
; src/lexer.c:233:     size_t saved_line = lexer->line;
	movdqu	24(%rdi), %xmm1	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
; src/lexer.c:232:     size_t saved_position = lexer->position;
	movq	8(%rdi), %rbp	; lexer_8(D)->position, saved_position
; src/lexer.c:233:     size_t saved_line = lexer->line;
	movaps	%xmm1, (%rsp)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], %sfp
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	call	next_token	;
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movdqu	8(%rbx), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 8B], vect__2.237
	movdqu	24(%rbx), %xmm2	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], tmp105
; src/lexer.c:239:     lexer->position = saved_position;
	movq	%rbp, 8(%rbx)	; saved_position, lexer_8(D)->position
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	; lexer_8(D)->column, lexer_8(D)->column
; src/lexer.c:240:     lexer->line = saved_line;
	movdqa	(%rsp), %xmm1	; %sfp, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
; src/lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm2, %xmm0	; tmp105, vect__2.237
; src/lexer.c:242:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	; <retval>, lexer_8(D)->peeked_token
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	; lexer_8(D)->column, lexer_8(D)->peeked_column
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 48(%rbx)	; vect__2.237, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 48B]
; src/lexer.c:240:     lexer->line = saved_line;
	movups	%xmm1, 24(%rbx)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
; src/lexer.c:244: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	peek_next_token, .-peek_next_token
	.p2align 4
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
; src/lexer.c:247:     return lexer->current_token;
	movq	72(%rdi), %rax	; lexer_2(D)->current_token, lexer_2(D)->current_token
; src/lexer.c:248: }
	ret	
	.size	peek_current_token, .-peek_current_token
	.p2align 4
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
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
	.size	reset_lexer, .-reset_lexer
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_token"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

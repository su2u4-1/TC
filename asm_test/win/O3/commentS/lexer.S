	.file	"D:\\TC\\src\\lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
.LC1:
	.ascii "Unterminated string literal\0"
.LC2:
	.ascii "c != '\\0'\0"
.LC3:
	.ascii "D:\\TC\\src\\lexer.c\0"
.LC4:
	.ascii "Unterminated comment\0"
.LC5:
	.ascii "Unexpected character\0"
	.text
	.p2align 4
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r14	 ;
	pushq	%r13	 ;
	movl	%edx, %r13d	 ; tmp567, skip_comment
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp566, lexer
	subq	$48, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rcx), %r14	 ; lexer_215(D)->position, _219
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rdx	 ; lexer_215(D)->length, _216
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	32(%rcx), %r12	 ; lexer_215(D)->column, prephitmp_750
 ; D:\TC\src\lexer.c:59: static Token* next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 48(%rsp)	 ;,
	movaps	%xmm7, 64(%rsp)	 ;,
	movaps	%xmm8, 80(%rsp)	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r14	 ; _216, _219
	jnb	.L2	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	1(%r12), %rsi	 ;, _255
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%r14), %rdi	 ;, ivtmp.170
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rcx)	 ; _255, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rcx), %rcx	 ; lexer_215(D)->source, _246
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	 ; ivtmp.170, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	(%rcx,%r14), %r9	 ;, _248
	movzbl	(%r9), %eax	 ; *_248, _249
	cmpb	$32, %al	 ;, _249
	ja	.L3	 ;,
	leaq	.L5(%rip), %r10	 ;, tmp348
	movzbl	%al, %r8d	 ; _249, _249
	movslq	(%r10,%r8,4), %r8	 ;, tmp350
	addq	%r10, %r8	 ; tmp348, tmp351
	jmp	*%r8	 ; tmp351
	.section .rdata,"dr"
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
	.long	.L203-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L203-.L5
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
	.long	.L203-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rsi, %r12	 ; _255, prephitmp_750
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, lexer_215(D)->line
	movq	%r12, %xmm1	 ; prephitmp_750, prephitmp_750
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm1, %xmm6	 ; prephitmp_750, tmp353
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$0, 24(%rax)	 ;, token_250->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	$0, (%rax)	 ;, token_250->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp353,
.L1:
 ; D:\TC\src\lexer.c:214: }
	movaps	48(%rsp), %xmm6	 ;,
	movaps	64(%rsp), %xmm7	 ;,
	movaps	80(%rsp), %xmm8	 ;,
	leaq	-48(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	 ;, lexer_215(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_215(D)->column
.L203:
 ; D:\TC\src\lexer.c:214: }
	movaps	48(%rsp), %xmm6	 ;,
	movaps	64(%rsp), %xmm7	 ;,
 ; D:\TC\src\lexer.c:136:                 return next_token(lexer, skip_comment);
	movsbl	%r13b, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\lexer.c:214: }
	movaps	80(%rsp), %xmm8	 ;,
	leaq	-48(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
 ; D:\TC\src\lexer.c:136:                 return next_token(lexer, skip_comment);
	jmp	next_token	 ;
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$90, %al	 ;, _249
	jg	.L8	 ;,
	cmpb	$64, %al	 ;, _249
	jg	.L9	 ;,
	cmpb	$34, %al	 ;, _249
	je	.L10	 ;,
	leal	-48(%rax), %r8d	 ;, tmp357
	cmpb	$9, %r8b	 ;, tmp357
	ja	.L11	 ;,
	leaq	(%rdx,%r12), %r11	 ;, tmp358
	subq	%r14, %r11	 ; _219, _442
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L205:
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r10d	 ;, tmp371
	leaq	1(%rdi), %r8	 ;, ivtmp.170
	cmpb	$9, %r10b	 ;, tmp371
	ja	.L22	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _255
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	 ; ivtmp.170, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rdi	 ; ivtmp.170, ivtmp.170
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rbx)	 ; _255, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %eax	 ; MEM[(char *)_246 + -1B + ivtmp.170_438 * 1], _249
.L12:
	cmpq	%rsi, %r11	 ; _255, _442
	jne	.L205	 ;,
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r8d	 ;, tmp372
	cmpb	$9, %r8b	 ;, tmp372
	ja	.L22	 ;,
.L103:
 ; D:\TC\src\lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	 ;, type
.L23:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _665
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp377
	movq	%r12, %xmm4	 ; prephitmp_750, prephitmp_750
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r9, %rcx	 ; _248,
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _665, lexer_215(D)->position
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, lexer_215(D)->line
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rdx	 ; _219, tmp380
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rsi, 32(%rbx)	 ; tmp377, lexer_215(D)->column
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_750, tmp378
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp573, _35
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	%r13d, 24(%rax)	 ; type, token_282->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _35,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp378,
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %al	 ;, _249
	jne	.L206	 ;,
.L9:
	movabsq	$288230372997595135, %r8	 ;, tmp565
	addq	%r12, %rdx	 ; prephitmp_750, tmp360
	subq	%r14, %rdx	 ; _219, _412
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L208:
	cmpb	$57, %al	 ;, _249
	jle	.L207	 ;,
	subl	$65, %eax	 ;, _511
	cmpb	$57, %al	 ;, _511
	ja	.L15	 ;,
	btq	%rax, %r8	 ; _511, tmp565
	jnc	.L15	 ;,
.L17:
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rdi	 ;, ivtmp.170
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _255
	movq	%rsi, 32(%rbx)	 ; _255, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	 ; ivtmp.170, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdi), %eax	 ; MEM[(char *)_246 + -1B + _256 * 1], _249
.L14:
	cmpq	%rsi, %rdx	 ; _255, _412
	jne	.L208	 ;,
.L15:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _659
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp365
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r9, %rcx	 ; _248,
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _659, lexer_215(D)->position
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r14, %rdx	 ; _219, tmp366
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rsi, 32(%rbx)	 ; tmp365, lexer_215(D)->column
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	 ; tmp569, content
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	call	is_keyword	 ;
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, lexer_215(D)->line
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	 ; tmp570
	je	.L19	 ;,
	movq	%r12, %xmm2	 ; prephitmp_750, prephitmp_750
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm2, %xmm6	 ; prephitmp_750, tmp367
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$6, 24(%rax)	 ;, token_259->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp367,
 ; D:\TC\src\lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L207:
	cmpb	$47, %al	 ;, _249
	jg	.L17	 ;,
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L206:
	leal	-97(%rax), %r8d	 ;, tmp359
	cmpb	$25, %r8b	 ;, tmp359
	jbe	.L9	 ;,
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L209	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r14), %r9d	 ; *_270, _539
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _560
.L41:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, pretmp_596
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	 ;, _539
	movq	%r12, %xmm5	 ; prephitmp_750, prephitmp_750
	sete	%r8b	 ;, tmp557
	movdqa	%xmm6, %xmm8	 ; pretmp_596, tmp563
	movl	%r8d, %ecx	 ; tmp557, _595
	punpcklqdq	%xmm5, %xmm8	 ; prephitmp_750, tmp563
	movdqa	%xmm8, %xmm7	 ; tmp563, _602
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, _249
	jne	.L91	 ;,
	testb	%r8b, %r8b	 ; tmp557
	je	.L91	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp446
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp447
 ; D:\TC\src\lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp448
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp446, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp447, lexer_215(D)->position
.L202:
 ; D:\TC\src\lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	(%rax), %rbx	 ;, LE_SYMBOL.11_104
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; LE_SYMBOL.11_104,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm8, 8(%rax)	 ; tmp563,
 ; D:\TC\src\lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %xmm3	 ; prephitmp_750, prephitmp_750
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_750, tmp369
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$1, 24(%rax)	 ;, token_260->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp369,
 ; D:\TC\src\lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	 ; _292
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L26	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	2(%r12), %rax	 ;, tmp381
	movq	%rax, 32(%rbx)	 ; tmp381, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	2(%r14), %rax	 ;, tmp382
	movq	%rax, 8(%rbx)	 ; tmp382, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%r14), %r13d	 ; *_285, _292
.L26:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp564
	jmp	.L27	 ;
	.p2align 4,,10
	.p2align 3
.L211:
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp383
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	 ; tmp383, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %r13d	 ; *_291, _292
.L27:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r13b	 ;, _292
	jbe	.L210	 ;,
.L29:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	 ; lexer_215(D)->position, _287
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _216, _287
	jb	.L211	 ;,
 ; D:\TC\src\lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	 ; _292
.L28:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rsi	 ; lexer_215(D)->line, pretmp_751
 ; D:\TC\src\lexer.c:100:         if (c != '"') {
	cmpb	$34, %r13b	 ;, _292
	je	.L30	 ;,
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	%rdi, %r9	 ; ivtmp.170,
	leaq	1(%rsi), %r8	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp391
	movq	24(%rax), %rcx	 ; _670->_stderr, _670->_stderr
	leaq	.LC1(%rip), %rax	 ;, tmp625
	movq	%rax, 32(%rsp)	 ; tmp625,
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r13b	 ;, _292
	je	.L31	 ;,
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, pretmp_735
.L32:
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdi, %rdx	 ; ivtmp.170, tmp394
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	(%rbx), %rdi	 ; lexer_215(D)->source, ivtmp.170
	movq	%r12, %xmm5	 ; prephitmp_750, prephitmp_750
	movq	%rdi, %rcx	 ; ivtmp.170, tmp397
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	notq	%rdx	 ; tmp394
	punpcklqdq	%xmm5, %xmm6	 ; prephitmp_750, tmp393
	addq	8(%rbx), %rdx	 ; lexer_215(D)->position, tmp396
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp576, _46
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	 ;, token_295->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _46,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp393,
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L210:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r13, %r9	 ; _292, tmp564
	jc	.L29	 ;,
	jmp	.L28	 ;
.L11:
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, _249
	sete	%r8b	 ;, tmp404
	movl	%r8d, %r10d	 ; tmp404, _560
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L97	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r14), %r9d	 ; *_297, _539
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	 ;, _539
	jne	.L35	 ;,
	testb	%r8b, %r8b	 ; tmp404
	je	.L35	 ;,
	addq	%r12, %rdx	 ; prephitmp_750, tmp408
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %r8d	 ;, _305
	subq	%r14, %rdx	 ; _219, _497
 ; D:\TC\src\lexer.c:111:             while (c != '\n' && c != '\0')
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:\TC\src\lexer.c:111:             while (c != '\n' && c != '\0')
	leaq	1(%rdi), %rax	 ;, ivtmp.186
	testb	%r8b, %r8b	 ; _305
	je	.L37	 ;,
	cmpb	$10, %r8b	 ;, _305
	je	.L37	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _255
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	 ; ivtmp.186, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, %rdi	 ; ivtmp.186, ivtmp.170
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rbx)	 ; _255, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rax), %r8d	 ; MEM[(char *)_246 + -1B + ivtmp.186_482 * 1], _305
.L36:
	cmpq	%rdx, %rsi	 ; _497, _255
	jne	.L212	 ;,
.L37:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _675
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp413
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _675, lexer_215(D)->position
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rsi, 32(%rbx)	 ; tmp413, lexer_215(D)->column
 ; D:\TC\src\lexer.c:114:             if (skip_comment)
	testb	%r13b, %r13b	 ; skip_comment
	jne	.L203	 ;,
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, lexer_215(D)->line
 ; D:\TC\src\lexer.c:109:             size_t start = lexer->position + 1;
	addq	$2, %r14	 ;, start
	movq	%r12, %xmm7	 ; prephitmp_750, prephitmp_750
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rdx	 ; start, tmp417
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r14, %rcx	 ; start, tmp418
	punpcklqdq	%xmm7, %xmm6	 ; prephitmp_750, tmp415
.L200:
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp583, _78
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$7, 24(%rax)	 ;,
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _78,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp433,
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	 ;
.L30:
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdi, %rdx	 ; ivtmp.170, tmp399
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rdi, %rcx	 ; ivtmp.170, tmp402
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	notq	%rdx	 ; tmp399
	addq	8(%rbx), %rdx	 ; lexer_215(D)->position, tmp401
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp578, _52
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movq	%rsi, %xmm0	 ; pretmp_751, tmp403
	movq	%r12, %xmm5	 ; prephitmp_750, prephitmp_750
	punpcklqdq	%xmm5, %xmm0	 ; prephitmp_750, tmp403
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	 ;, token_296->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _52, token_296->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	 ; tmp403,
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	 ;
.L31:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	 ; lexer_215(D)->line, tmp627
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_215(D)->column
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	addq	$1, %rax	 ;, pretmp_735
	movq	%rax, 24(%rbx)	 ; pretmp_735, lexer_215(D)->line
	movq	%rax, %xmm6	 ; pretmp_735, pretmp_735
 ; D:\TC\src\lexer.c:47: }
	jmp	.L32	 ;
.L209:
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _560
.L97:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, pretmp_596
	movq	%r12, %xmm2	 ; prephitmp_750, prephitmp_750
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	xorl	%ecx, %ecx	 ; _595
 ; D:\TC\src\lexer.c:40:         return '\0';
	xorl	%r9d, %r9d	 ; _539
	movdqa	%xmm6, %xmm7	 ; pretmp_596, _602
	punpcklqdq	%xmm2, %xmm7	 ; prephitmp_750, _602
.L34:
 ; D:\TC\src\lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, _249
	jne	.L55	 ;,
	testb	%cl, %cl	 ; _595
	je	.L55	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L56	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp470
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp471
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp470, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp471, lexer_215(D)->position
.L56:
 ; D:\TC\src\lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp473
	movq	%rax, %xmm7	 ; tmp473, tmp473
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp475
	punpcklqdq	%xmm7, %xmm6	 ; tmp473, tmp472
.L201:
 ; D:\TC\src\lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	(%rax), %rbx	 ;, OR_SYMBOL.19_153
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; OR_SYMBOL.19_153,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp522,
 ; D:\TC\src\lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	 ;
.L55:
 ; D:\TC\src\lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, _249
	jne	.L57	 ;,
	testb	%cl, %cl	 ; _595
	je	.L57	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L58	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp478
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp479
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp478, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp479, lexer_215(D)->position
.L58:
 ; D:\TC\src\lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp481
	movq	%rax, %xmm3	 ; tmp481, tmp481
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp483
	punpcklqdq	%xmm3, %xmm6	 ; tmp481, tmp480
	jmp	.L201	 ;
.L35:
 ; D:\TC\src\lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	 ;, _539
	jne	.L41	 ;,
	testb	%r8b, %r8b	 ; tmp404
	je	.L41	 ;,
 ; D:\TC\src\lexer.c:118:             size_t start = lexer->position + 1;
	leaq	2(%r14), %rsi	 ;, start
 ; D:\TC\src\lexer.c:107:         char p = peek_next_char(lexer);
	movl	$42, %r8d	 ;, p
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	 ;, c
	.p2align 4,,10
	.p2align 3
.L42:
 ; D:\TC\src\lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	jne	.L165	 ;,
	cmpb	$47, %r8b	 ;, p
	je	.L213	 ;,
.L165:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdi, %rdx	 ; ivtmp.170, _216
	je	.L43	 ;,
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rdi	 ;, ivtmp.170
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	 ; ivtmp.170, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdi), %eax	 ; MEM[(char *)_246 + -1B + _314 * 1], c
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L214	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movzbl	(%rcx,%rdi), %r8d	 ; MEM[(char *)_246 + _314 * 1], p
 ; D:\TC\src\lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L47	 ;,
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	 ;, lexer_215(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_215(D)->column
 ; D:\TC\src\lexer.c:124:                 if (p == '\0') break;
	testb	%r8b, %r8b	 ; p
	jne	.L165	 ;,
	jmp	.L198	 ;
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%r8b, %r8b	 ; p
	je	.L45	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	testb	%al, %al	 ; c
	jne	.L42	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	leaq	.LC2(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$125, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp422
	call	__assert_func	 ;
	.p2align 4,,10
	.p2align 3
.L214:
 ; D:\TC\src\lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L45	 ;,
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	 ; lexer_215(D)->line, tmp637
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_215(D)->column
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	leaq	1(%rax), %rdi	 ;, prephitmp_34
	movq	%rdi, 24(%rbx)	 ; prephitmp_34, lexer_215(D)->line
.L46:
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	3(%r14), %r9	 ;,
	leaq	1(%rdi), %r8	 ;,
	movq	24(%rax), %rcx	 ; _686->_stderr, _686->_stderr
	leaq	.LC4(%rip), %rax	 ;, tmp638
	leaq	.LC0(%rip), %rdx	 ;, tmp431
	movq	%rax, 32(%rsp)	 ; tmp638,
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:130:                 if (skip_comment)
	testb	%r13b, %r13b	 ; skip_comment
	jne	.L203	 ;,
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rdx	 ; lexer_215(D)->position, tmp435
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, tmp433
	movq	%r12, %xmm3	 ; prephitmp_750, prephitmp_750
	subq	%rsi, %rdx	 ; start, tmp435
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	(%rbx), %rsi	 ; lexer_215(D)->source, start
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_750, tmp433
	movq	%rsi, %rcx	 ; start, tmp437
	jmp	.L200	 ;
.L213:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	 ; lexer_215(D)->position, prephitmp_16
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _216, prephitmp_16
	jnb	.L95	 ;,
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	 ;, prephitmp_16
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	 ; prephitmp_16, lexer_215(D)->position
.L95:
 ; D:\TC\src\lexer.c:135:             if (skip_comment)
	testb	%r13b, %r13b	 ; skip_comment
	jne	.L203	 ;,
	movq	24(%rbx), %xmm6	 ; lexer_215(D)->line, lexer_215(D)->line
	movq	%r12, %xmm4	 ; prephitmp_750, prephitmp_750
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rsi, %rax	 ; start, tmp442
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rsi, %rcx	 ; start, tmp445
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	 ;, tmp444
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_750, tmp440
	jmp	.L200	 ;
.L45:
 ; D:\TC\src\lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	jne	.L198	 ;,
	.p2align 4,,10
	.p2align 3
.L43:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	 ;, lexer_215(D)->position
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	 ;, lexer_215(D)->column
.L198:
 ; D:\TC\src\lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rdi	 ; lexer_215(D)->line, prephitmp_34
 ; D:\TC\src\lexer.c:57: }
	jmp	.L46	 ;
.L57:
 ; D:\TC\src\lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, _249
	jne	.L59	 ;,
	testb	%cl, %cl	 ; _595
	je	.L61	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L60	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp486
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp487
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp486, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp487, lexer_215(D)->position
.L60:
 ; D:\TC\src\lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp489
	movq	%rax, %xmm4	 ; tmp489, tmp489
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp491
	punpcklqdq	%xmm4, %xmm6	 ; tmp489, tmp488
	jmp	.L201	 ;
.L61:
 ; D:\TC\src\lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, _249
	jne	.L63	 ;,
	testb	%cl, %cl	 ; _595
	je	.L63	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L64	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp500
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp501
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp500, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp501, lexer_215(D)->position
.L64:
 ; D:\TC\src\lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp503
	movq	%rax, %xmm7	 ; tmp503, tmp503
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp505
	punpcklqdq	%xmm7, %xmm6	 ; tmp503, tmp502
	jmp	.L201	 ;
.L63:
 ; D:\TC\src\lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, _249
	jne	.L65	 ;,
	cmpb	$38, %r9b	 ;, _539
	jne	.L65	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L66	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp510
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp511
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp510, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp511, lexer_215(D)->position
.L66:
 ; D:\TC\src\lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp513
	movq	%rax, %xmm3	 ; tmp513, tmp513
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp515
	punpcklqdq	%xmm3, %xmm6	 ; tmp513, tmp512
	jmp	.L201	 ;
.L59:
 ; D:\TC\src\lexer.c:159:         } else if (c == '/' && p == '=') {
	testb	%cl, %cl	 ; _595
	je	.L61	 ;,
	testb	%r10b, %r10b	 ; _560
	je	.L61	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L62	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp492
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp493
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp492, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp493, lexer_215(D)->position
.L62:
 ; D:\TC\src\lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp495
	movq	%rax, %xmm5	 ; tmp495, tmp495
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp497
	punpcklqdq	%xmm5, %xmm6	 ; tmp495, tmp494
	jmp	.L201	 ;
.L65:
 ; D:\TC\src\lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, _249
	jne	.L67	 ;,
	cmpb	$124, %r9b	 ;, _539
	jne	.L67	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L68	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp520
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp521
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp520, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp521, lexer_215(D)->position
.L68:
 ; D:\TC\src\lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp523
	movq	%rax, %xmm4	 ; tmp523, tmp523
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp525
	punpcklqdq	%xmm4, %xmm6	 ; tmp523, tmp522
	jmp	.L201	 ;
.L67:
	subl	$33, %eax	 ;, tmp526
	cmpb	$92, %al	 ;, tmp526
	ja	.L69	 ;,
	leaq	.L71(%rip), %rdx	 ;, tmp528
	movzbl	%al, %eax	 ; tmp526, tmp527
	movslq	(%rdx,%rax,4), %rax	 ;, tmp530
	addq	%rdx, %rax	 ; tmp528, tmp531
	jmp	*%rax	 ; tmp531
	.section .rdata,"dr"
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
 ; D:\TC\src\lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, _249
	jne	.L53	 ;,
	testb	%r8b, %r8b	 ; tmp557
	jne	.L215	 ;,
.L53:
 ; D:\TC\src\lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, _249
	jne	.L94	 ;,
	testb	%r8b, %r8b	 ; tmp557
	je	.L94	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp454
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp455
 ; D:\TC\src\lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp459
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp454, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp455, lexer_215(D)->position
	jmp	.L202	 ;
.L215:
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp451
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp452
 ; D:\TC\src\lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp453
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp451, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp452, lexer_215(D)->position
	jmp	.L202	 ;
.L70:
 ; D:\TC\src\lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp536
.L199:
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	(%rax), %rbx	 ;, ASSIGN_SYMBOL.38_189
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; ASSIGN_SYMBOL.38_189,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm7, 8(%rax)	 ; _602,
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	 ;
.L94:
 ; D:\TC\src\lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, _249
	jne	.L34	 ;,
	testb	%r8b, %r8b	 ; tmp557
	je	.L34	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L54	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$2, %r12	 ;, tmp462
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp463
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r12, 32(%rbx)	 ; tmp462, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp463, lexer_215(D)->position
.L54:
 ; D:\TC\src\lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_215(D)->column, lexer_215(D)->column
	subq	$2, %rax	 ;, tmp465
	movq	%rax, %xmm5	 ; tmp465, tmp465
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp467
	punpcklqdq	%xmm5, %xmm6	 ; tmp465, tmp464
	jmp	.L201	 ;
.L72:
 ; D:\TC\src\lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp535
	jmp	.L199	 ;
.L73:
 ; D:\TC\src\lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp541
	jmp	.L199	 ;
.L74:
 ; D:\TC\src\lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp540
	jmp	.L199	 ;
.L75:
 ; D:\TC\src\lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp549
	jmp	.L199	 ;
.L76:
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp550
	jmp	.L199	 ;
.L77:
 ; D:\TC\src\lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp548
	jmp	.L199	 ;
.L78:
 ; D:\TC\src\lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp542
	jmp	.L199	 ;
.L79:
 ; D:\TC\src\lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp546
	jmp	.L199	 ;
.L80:
 ; D:\TC\src\lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp539
	jmp	.L199	 ;
.L81:
 ; D:\TC\src\lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp544
	jmp	.L199	 ;
.L82:
 ; D:\TC\src\lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp537
	jmp	.L199	 ;
.L83:
 ; D:\TC\src\lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp543
	jmp	.L199	 ;
.L84:
 ; D:\TC\src\lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp545
	jmp	.L199	 ;
.L85:
 ; D:\TC\src\lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp534
	jmp	.L199	 ;
.L86:
 ; D:\TC\src\lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp533
	jmp	.L199	 ;
.L87:
 ; D:\TC\src\lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp547
	jmp	.L199	 ;
.L88:
 ; D:\TC\src\lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp538
	jmp	.L199	 ;
.L69:
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	.LC0(%rip), %rdx	 ;, tmp554
	movq	%rsi, %r9	 ; _255,
	movq	24(%rax), %rcx	 ; _690->_stderr, _690->_stderr
	leaq	.LC5(%rip), %rax	 ;, tmp652
	movq	%rax, 32(%rsp)	 ; tmp652,
	movq	%xmm6, %rax	 ; pretmp_596, pretmp_596
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	xorl	%edx, %edx	 ;
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\lexer.c:22:     token->line = line;
	pxor	%xmm0, %xmm0	 ; tmp555
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	%edx, 24(%rax)	 ;, token_393->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	 ;, token_393->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	 ; tmp555,
 ; D:\TC\src\lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	jmp	.L1	 ;
.L22:
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _216, ivtmp.170
	jnb	.L103	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, _249
	jne	.L103	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	leaq	(%rcx,%rdi), %r8	 ;, _268
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%r8), %eax	 ; *_268, tmp623
	subl	$48, %eax	 ;, tmp373
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp373
	ja	.L103	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	1(%rsi), %r10	 ;, _272
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rdi), %r11	 ;, _273
	addq	%rsi, %rdx	 ; _255, tmp375
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r10, 32(%rbx)	 ; _272, lexer_215(D)->column
	subq	%rdi, %rdx	 ; ivtmp.170, _427
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r10, %rsi	 ; _272, _255
	movq	%r11, %rdi	 ; _273, ivtmp.170
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r11, 8(%rbx)	 ; _273, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%r8), %eax	 ; *_268, _281
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L216:
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp376
	leaq	1(%rdi), %r8	 ;, ivtmp.150
	cmpb	$9, %al	 ;, tmp376
	ja	.L104	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _255
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	 ; ivtmp.150, lexer_215(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rdi	 ; ivtmp.150, ivtmp.170
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rbx)	 ; _255, lexer_215(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %eax	 ; MEM[(char *)_246 + -1B + ivtmp.150_649 * 1], _281
.L24:
	cmpq	%rsi, %rdx	 ; _255, _427
	jne	.L216	 ;,
.L104:
 ; D:\TC\src\lexer.c:90:             type = FLOAT;
	movl	$3, %r13d	 ;, type
	jmp	.L23	 ;
	.p2align 4
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp87, source
 ; D:\TC\src\lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %ecx	 ;,
 ; D:\TC\src\lexer.c:3: Lexer* create_lexer(string source, size_t length) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp88, length
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\src\lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:11:     lexer->peeked_position = 0;
	pxor	%xmm0, %xmm0	 ; tmp85
 ; D:\TC\src\lexer.c:5:     lexer->source = source;
	movq	%rsi, (%rax)	 ; source, lexer_3->source
 ; D:\TC\src\lexer.c:6:     lexer->position = 0;
	movq	$0, 8(%rax)	 ;, lexer_3->position
 ; D:\TC\src\lexer.c:7:     lexer->length = length;
	movq	%rbx, 16(%rax)	 ; length, lexer_3->length
 ; D:\TC\src\lexer.c:8:     lexer->line = 0;
	movq	$0, 24(%rax)	 ;, lexer_3->line
 ; D:\TC\src\lexer.c:9:     lexer->column = 0;
	movq	$0, 32(%rax)	 ;, lexer_3->column
 ; D:\TC\src\lexer.c:10:     lexer->peeked_token = 0;
	movq	$0, 40(%rax)	 ;, lexer_3->peeked_token
 ; D:\TC\src\lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 64(%rax)	 ;, lexer_3->peeked_column
 ; D:\TC\src\lexer.c:14:     lexer->current_token = 0;
	movq	$0, 72(%rax)	 ;, lexer_3->current_token
 ; D:\TC\src\lexer.c:11:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rax)	 ; tmp85, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_3 + 48B]
 ; D:\TC\src\lexer.c:16: }
	leaq	-16(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp93, lexer
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\src\lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	40(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:\TC\src\lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	 ; <retval>
	je	.L220	 ;,
 ; D:\TC\src\lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	48(%rcx), %rdx	 ; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
 ; D:\TC\src\lexer.c:227: }
	movq	-8(%rbp), %rbx	 ;,
 ; D:\TC\src\lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rcx)	 ; <retval>, lexer_8(D)->current_token
 ; D:\TC\src\lexer.c:220:         lexer->line = lexer->peeked_line;
	movdqu	56(%rcx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 56B], tmp97
 ; D:\TC\src\lexer.c:222:         lexer->peeked_token = 0;
	movq	$0, 40(%rcx)	 ;, lexer_8(D)->peeked_token
 ; D:\TC\src\lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	%rdx, 8(%rcx)	 ; lexer_8(D)->peeked_position, lexer_8(D)->position
 ; D:\TC\src\lexer.c:220:         lexer->line = lexer->peeked_line;
	movups	%xmm0, 24(%rcx)	 ; tmp97, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
 ; D:\TC\src\lexer.c:227: }
	leave	
	ret	
	.p2align 4,,10
	.p2align 3
.L220:
 ; D:\TC\src\lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; D:\TC\src\lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	 ; <retval>, lexer_8(D)->current_token
 ; D:\TC\src\lexer.c:227: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.p2align 4
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
 ; D:\TC\src\lexer.c:230:     if (lexer->peeked_token != 0)
	movq	40(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:\TC\src\lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	 ; <retval>
	je	.L229	 ;,
 ; D:\TC\src\lexer.c:244: }
	ret	
	.p2align 4,,10
	.p2align 3
.L229:
 ; D:\TC\src\lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	 ;
 ; D:\TC\src\lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
 ; D:\TC\src\lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp100, lexer
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\src\lexer.c:232:     size_t saved_position = lexer->position;
	movq	8(%rcx), %rsi	 ; lexer_8(D)->position, saved_position
 ; D:\TC\src\lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\src\lexer.c:233:     size_t saved_line = lexer->line;
	movdqu	24(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
 ; D:\TC\src\lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	call	next_token	 ;
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movdqu	8(%rbx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 8B], vect__2.235
	movdqu	24(%rbx), %xmm1	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], tmp105
 ; D:\TC\src\lexer.c:239:     lexer->position = saved_position;
	movq	%rsi, 8(%rbx)	 ; saved_position, lexer_8(D)->position
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	 ; lexer_8(D)->column, lexer_8(D)->column
 ; D:\TC\src\lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	 ; <retval>, lexer_8(D)->current_token
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm1, %xmm0	 ; tmp105, vect__2.235
 ; D:\TC\src\lexer.c:242:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	 ; <retval>, lexer_8(D)->peeked_token
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	 ; lexer_8(D)->column, lexer_8(D)->peeked_column
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 48(%rbx)	 ; vect__2.235, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 48B]
 ; D:\TC\src\lexer.c:240:     lexer->line = saved_line;
	movups	%xmm6, 24(%rbx)	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
 ; D:\TC\src\lexer.c:244: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-16(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
 ; D:\TC\src\lexer.c:247:     return lexer->current_token;
	movq	72(%rcx), %rax	 ; lexer_2(D)->current_token, lexer_2(D)->current_token
 ; D:\TC\src\lexer.c:248: }
	ret	
	.p2align 4
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	pushq	%rbp	 ;
 ; D:\TC\src\lexer.c:252:     lexer->line = 0;
	pxor	%xmm0, %xmm0	 ; tmp83
 ; D:\TC\src\lexer.c:251:     lexer->position = 0;
	movq	$0, 8(%rcx)	 ;, lexer_2(D)->position
 ; D:\TC\src\lexer.c:254:     lexer->peeked_token = 0;
	movq	$0, 40(%rcx)	 ;, lexer_2(D)->peeked_token
 ; D:\TC\src\lexer.c:250: void reset_lexer(Lexer* lexer) {
	movq	%rsp, %rbp	 ;,
 ; D:\TC\src\lexer.c:257:     lexer->peeked_column = 0;
	movq	$0, 64(%rcx)	 ;, lexer_2(D)->peeked_column
 ; D:\TC\src\lexer.c:250: void reset_lexer(Lexer* lexer) {
	andq	$-16, %rsp	 ;,
 ; D:\TC\src\lexer.c:258:     lexer->current_token = 0;
	movq	$0, 72(%rcx)	 ;, lexer_2(D)->current_token
 ; D:\TC\src\lexer.c:252:     lexer->line = 0;
	movups	%xmm0, 24(%rcx)	 ; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 24B]
 ; D:\TC\src\lexer.c:255:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rcx)	 ; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 48B]
 ; D:\TC\src\lexer.c:259: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "next_token\0"
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	is_keyword;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.GT_SYMBOL, "dr"
	.globl	.refptr.GT_SYMBOL
	.linkonce	discard
.refptr.GT_SYMBOL:
	.quad	GT_SYMBOL
	.section	.rdata$.refptr.LT_SYMBOL, "dr"
	.globl	.refptr.LT_SYMBOL
	.linkonce	discard
.refptr.LT_SYMBOL:
	.quad	LT_SYMBOL
	.section	.rdata$.refptr.MOD_SYMBOL, "dr"
	.globl	.refptr.MOD_SYMBOL
	.linkonce	discard
.refptr.MOD_SYMBOL:
	.quad	MOD_SYMBOL
	.section	.rdata$.refptr.DIV_SYMBOL, "dr"
	.globl	.refptr.DIV_SYMBOL
	.linkonce	discard
.refptr.DIV_SYMBOL:
	.quad	DIV_SYMBOL
	.section	.rdata$.refptr.MUL_SYMBOL, "dr"
	.globl	.refptr.MUL_SYMBOL
	.linkonce	discard
.refptr.MUL_SYMBOL:
	.quad	MUL_SYMBOL
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.ADD_SYMBOL, "dr"
	.globl	.refptr.ADD_SYMBOL
	.linkonce	discard
.refptr.ADD_SYMBOL:
	.quad	ADD_SYMBOL
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
	.section	.rdata$.refptr.R_BRACKET_SYMBOL, "dr"
	.globl	.refptr.R_BRACKET_SYMBOL
	.linkonce	discard
.refptr.R_BRACKET_SYMBOL:
	.quad	R_BRACKET_SYMBOL
	.section	.rdata$.refptr.L_BRACKET_SYMBOL, "dr"
	.globl	.refptr.L_BRACKET_SYMBOL
	.linkonce	discard
.refptr.L_BRACKET_SYMBOL:
	.quad	L_BRACKET_SYMBOL
	.section	.rdata$.refptr.DOT_SYMBOL, "dr"
	.globl	.refptr.DOT_SYMBOL
	.linkonce	discard
.refptr.DOT_SYMBOL:
	.quad	DOT_SYMBOL
	.section	.rdata$.refptr.NOT_SYMBOL, "dr"
	.globl	.refptr.NOT_SYMBOL
	.linkonce	discard
.refptr.NOT_SYMBOL:
	.quad	NOT_SYMBOL
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
	.section	.rdata$.refptr.R_BRACE_SYMBOL, "dr"
	.globl	.refptr.R_BRACE_SYMBOL
	.linkonce	discard
.refptr.R_BRACE_SYMBOL:
	.quad	R_BRACE_SYMBOL
	.section	.rdata$.refptr.L_BRACE_SYMBOL, "dr"
	.globl	.refptr.L_BRACE_SYMBOL
	.linkonce	discard
.refptr.L_BRACE_SYMBOL:
	.quad	L_BRACE_SYMBOL
	.section	.rdata$.refptr.R_PAREN_SYMBOL, "dr"
	.globl	.refptr.R_PAREN_SYMBOL
	.linkonce	discard
.refptr.R_PAREN_SYMBOL:
	.quad	R_PAREN_SYMBOL
	.section	.rdata$.refptr.L_PAREN_SYMBOL, "dr"
	.globl	.refptr.L_PAREN_SYMBOL
	.linkonce	discard
.refptr.L_PAREN_SYMBOL:
	.quad	L_PAREN_SYMBOL
	.section	.rdata$.refptr.OR_SYMBOL, "dr"
	.globl	.refptr.OR_SYMBOL
	.linkonce	discard
.refptr.OR_SYMBOL:
	.quad	OR_SYMBOL
	.section	.rdata$.refptr.AND_SYMBOL, "dr"
	.globl	.refptr.AND_SYMBOL
	.linkonce	discard
.refptr.AND_SYMBOL:
	.quad	AND_SYMBOL
	.section	.rdata$.refptr.MOD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MOD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MOD_ASSIGN_SYMBOL:
	.quad	MOD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.DIV_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.DIV_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.DIV_ASSIGN_SYMBOL:
	.quad	DIV_ASSIGN_SYMBOL
	.section	.rdata$.refptr.MUL_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MUL_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MUL_ASSIGN_SYMBOL:
	.quad	MUL_ASSIGN_SYMBOL
	.section	.rdata$.refptr.SUB_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.SUB_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.SUB_ASSIGN_SYMBOL:
	.quad	SUB_ASSIGN_SYMBOL
	.section	.rdata$.refptr.ADD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ADD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ADD_ASSIGN_SYMBOL:
	.quad	ADD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.GE_SYMBOL, "dr"
	.globl	.refptr.GE_SYMBOL
	.linkonce	discard
.refptr.GE_SYMBOL:
	.quad	GE_SYMBOL
	.section	.rdata$.refptr.LE_SYMBOL, "dr"
	.globl	.refptr.LE_SYMBOL
	.linkonce	discard
.refptr.LE_SYMBOL:
	.quad	LE_SYMBOL
	.section	.rdata$.refptr.NE_SYMBOL, "dr"
	.globl	.refptr.NE_SYMBOL
	.linkonce	discard
.refptr.NE_SYMBOL:
	.quad	NE_SYMBOL
	.section	.rdata$.refptr.EQ_SYMBOL, "dr"
	.globl	.refptr.EQ_SYMBOL
	.linkonce	discard
.refptr.EQ_SYMBOL:
	.quad	EQ_SYMBOL

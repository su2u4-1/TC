	.file	"lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.p2align 4
	.def	get_current_char.isra.0;	.scl	3;	.type	32;	.endef
get_current_char.isra.0:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rax	 ; lexer_1(D)->position, _2
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	24(%rcx), %rax	 ; lexer_1(D)->length, _2
	jnb	.L1	 ;,
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rax	 ;, tmp88
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rcx)	 ;, lexer_1(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, 16(%rcx)	 ; tmp88, lexer_1(D)->position
.L1:
 ; D:/TC/src/lexer.c:37: }
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[Lexer Error] at %s:%zu:%zu: %s\12\0"
.LC1:
	.ascii "Unterminated string literal\0"
.LC2:
	.ascii "\0\0"
.LC3:
	.ascii "c != '\\0'\0"
.LC4:
	.ascii "D:/TC/src/lexer.c\0"
.LC5:
	.ascii "Unterminated comment\0"
.LC6:
	.ascii "Unexpected character\0"
	.text
	.p2align 4
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	movl	%edx, %r14d	 ; tmp542, skip_comment
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp541, lexer
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %r12	 ; lexer_216(D)->position, _232
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	24(%rcx), %rdx	 ; lexer_216(D)->length, _218
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	40(%rcx), %r13	 ; lexer_216(D)->column, prephitmp_700
 ; D:/TC/src/lexer.c:60: static Token* next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 48(%rsp)	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r12	 ; _218, _232
	jnb	.L5	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	1(%r13), %rdi	 ;, prephitmp_600
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%r12), %rsi	 ;, prephitmp_399
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rdi, 40(%rcx)	 ; prephitmp_600, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rcx), %rcx	 ; lexer_216(D)->source, _259
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	 ; prephitmp_399, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	(%rcx,%r12), %r9	 ;, _261
	movzbl	(%r9), %eax	 ; *_261, c
	cmpb	$32, %al	 ;, c
	ja	.L6	 ;,
	leaq	.L8(%rip), %r10	 ;, tmp335
	movzbl	%al, %r8d	 ; c, c
	movslq	(%r10,%r8,4), %r8	 ;, tmp337
	addq	%r10, %r8	 ; tmp335, tmp338
	jmp	*%r8	 ; tmp338
	.section .rdata,"dr"
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
	.long	.L197-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L197-.L8
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
	.long	.L197-.L8
	.text
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%rdi, %r13	 ; prephitmp_600, prephitmp_700
	.p2align 4,,10
	.p2align 3
.L5:
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	movq	%r13, %xmm1	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm1, %xmm6	 ; prephitmp_700, tmp340
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$0, 24(%rax)	 ;, token_263->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	$0, (%rax)	 ;, token_263->lexeme
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp340,
.L4:
 ; D:/TC/src/lexer.c:216: }
	movaps	48(%rsp), %xmm6	 ;,
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	 ;, lexer_216(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_216(D)->column
.L197:
 ; D:/TC/src/lexer.c:216: }
	movaps	48(%rsp), %xmm6	 ;,
	leaq	-56(%rbp), %rsp	 ;,
 ; D:/TC/src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	%r14b, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/lexer.c:216: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:/TC/src/lexer.c:138:                 return next_token(lexer, skip_comment);
	jmp	next_token	 ;
	.p2align 4,,10
	.p2align 3
.L6:
	cmpb	$90, %al	 ;, c
	jg	.L11	 ;,
	cmpb	$64, %al	 ;, c
	jg	.L12	 ;,
	cmpb	$34, %al	 ;, c
	je	.L13	 ;,
	leal	-48(%rax), %r8d	 ;, tmp344
	cmpb	$9, %r8b	 ;, tmp344
	jbe	.L15	 ;,
	jmp	.L198	 ;
	.p2align 4,,10
	.p2align 3
.L200:
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_399
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rdi	 ;, prephitmp_600
	movq	%rdi, 40(%rbx)	 ; prephitmp_600, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	 ; prephitmp_399, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_259 + -1B + _278 * 1], c
.L15:
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r8d	 ;, tmp356
	cmpb	$9, %r8b	 ;, tmp356
	ja	.L199	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jb	.L200	 ;,
 ; D:/TC/src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r14d	 ;, type
.L23:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rdx	 ;, _620
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rdi	 ;, tmp360
	movq	%r13, %xmm4	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r9, %rcx	 ; _261,
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rdx, 16(%rbx)	 ; _620, lexer_216(D)->position
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r12, %rdx	 ; _232, tmp363
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rdi, 40(%rbx)	 ; tmp360, lexer_216(D)->column
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_700, tmp361
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp548, _35
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	%r14d, 24(%rax)	 ; type, token_298->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _35,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp361,
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al	 ;, c
	jne	.L201	 ;,
.L12:
	movabsq	$288230372997595135, %r8	 ;, tmp540
	jmp	.L17	 ;
	.p2align 4,,10
	.p2align 3
.L203:
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_399
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rdi	 ;, prephitmp_600
	movq	%rdi, 40(%rbx)	 ; prephitmp_600, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	 ; prephitmp_399, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_259 + -1B + _269 * 1], c
.L17:
	cmpb	$57, %al	 ;, c
	jle	.L202	 ;,
	subl	$65, %eax	 ;, _316
	cmpb	$57, %al	 ;, _316
	ja	.L18	 ;,
	btq	%rax, %r8	 ; _316, tmp540
	jnc	.L18	 ;,
.L20:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jb	.L203	 ;,
.L18:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rdx	 ;, _614
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rdi	 ;, tmp350
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r9, %rcx	 ; _261,
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rdx, 16(%rbx)	 ; _614, lexer_216(D)->position
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r12, %rdx	 ; _232, tmp351
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rdi, 40(%rbx)	 ; tmp350, lexer_216(D)->column
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	 ; tmp544, content
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	call	is_keyword	 ;
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	 ; tmp545
	je	.L22	 ;,
	movq	%r13, %xmm2	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm2, %xmm6	 ; prephitmp_700, tmp352
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$6, 24(%rax)	 ;, token_273->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp352,
 ; D:/TC/src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L201:
	leal	-97(%rax), %r8d	 ;, tmp345
	cmpb	$25, %r8b	 ;, tmp345
	jbe	.L12	 ;,
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jnb	.L204	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r12), %r9d	 ; *_403, _415
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _460
.L43:
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	 ;, _415
	sete	%cl	 ;, tmp534
	movl	%ecx, %edx	 ; tmp534, _506
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, c
	jne	.L85	 ;,
	testb	%cl, %cl	 ; tmp534
	je	.L85	 ;,
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r12	 ;, tmp424
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	 ;, tmp423
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	movq	%r13, %xmm0	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r12, 16(%rbx)	 ; tmp424, lexer_216(D)->position
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	 ; tmp423, lexer_216(D)->column
 ; D:/TC/src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp427
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_700, tmp425
.L194:
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	(%rax), %rbx	 ;, ASSIGN_SYMBOL.38_189
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; ASSIGN_SYMBOL.38_189,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; _611,
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%r13, %xmm3	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_700, tmp354
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$1, 24(%rax)	 ;, token_274->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp354,
 ; D:/TC/src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:/TC/src/lexer.c:34:         return '\0';
	xorl	%edi, %edi	 ; _309
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jnb	.L27	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	 ;, tmp364
	movq	%rax, 40(%rbx)	 ; tmp364, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	2(%r12), %rax	 ;, tmp365
	movq	%rax, 16(%rbx)	 ; tmp365, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%r12), %edi	 ; *_301, _309
.L27:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp539
	jmp	.L28	 ;
	.p2align 4,,10
	.p2align 3
.L206:
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp366
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	 ;, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, 16(%rbx)	 ; tmp366, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %edi	 ; *_308, _309
.L28:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %dil	 ;, _309
	jbe	.L205	 ;,
.L30:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	 ; lexer_216(D)->position, _304
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _218, _304
	jb	.L206	 ;,
 ; D:/TC/src/lexer.c:34:         return '\0';
	xorl	%edi, %edi	 ; _309
.L29:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %r12	 ; lexer_216(D)->line, prephitmp_623
 ; D:/TC/src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %dil	 ;, _309
	je	.L31	 ;,
 ; D:/TC/src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	(%rbx), %r14	 ; lexer_216(D)->filename, _39
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	leaq	1(%r12), %r9	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp374
	movq	24(%rax), %rcx	 ; _625->_stderr, _625->_stderr
	leaq	.LC1(%rip), %rax	 ;, tmp600
	movq	%rsi, 32(%rsp)	 ; prephitmp_399,
	movq	%r14, %r8	 ; _39,
	movq	%rax, 40(%rsp)	 ; tmp600,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, %dil	 ;, _309
	je	.L32	 ;,
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %r12	 ; lexer_216(D)->line, prephitmp_623
.L31:
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rdx	 ; lexer_216(D)->position, _42
	movq	%r12, %xmm6	 ; prephitmp_623, tmp376
	movq	%r13, %xmm5	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	leaq	.LC2(%rip), %rcx	 ;, tmp378
	punpcklqdq	%xmm5, %xmm6	 ; prephitmp_700, tmp376
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	subq	%rsi, %rdx	 ; prephitmp_399, _42
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rdx	 ;, _42
	je	.L195	 ;,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	8(%rbx), %rcx	 ; lexer_216(D)->source, prephitmp_399
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	$1, %rdx	 ;, tmp379
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rsi, %rcx	 ; prephitmp_399, prephitmp_399
.L195:
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp553, _49
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$4, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _49,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp376,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L205:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rdi, %r9	 ; _309, tmp539
	jc	.L30	 ;,
	jmp	.L29	 ;
.L198:
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%r8b	 ;, tmp382
	movl	%r8d, %r10d	 ; tmp382, _460
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jnb	.L91	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r12), %r9d	 ; *_314, _415
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	 ;, _415
	jne	.L38	 ;,
	testb	%r8b, %r8b	 ; tmp382
	je	.L38	 ;,
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %eax	 ;, _322
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L207:
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_399
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rdi	 ;, prephitmp_600
	movq	%rdi, 40(%rbx)	 ; prephitmp_600, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	 ; prephitmp_399, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_259 + -1B + _320 * 1], _322
.L36:
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	 ;, _322
	je	.L39	 ;,
	testb	%al, %al	 ; _322
	je	.L39	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jb	.L207	 ;,
.L39:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rdx	 ;, _630
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rdi	 ;, tmp389
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rdx, 16(%rbx)	 ; _630, lexer_216(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rdi, 40(%rbx)	 ; tmp389, lexer_216(D)->column
 ; D:/TC/src/lexer.c:116:             if (skip_comment)
	testb	%r14b, %r14b	 ; skip_comment
	jne	.L197	 ;,
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
 ; D:/TC/src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$2, %r12	 ;, start
	movq	%r13, %xmm0	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r12, %rdx	 ; start, tmp393
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r12, %rcx	 ; start, tmp394
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_700, tmp391
.L196:
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp560, _83
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$7, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _83,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp417,
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L4	 ;
.L199:
 ; D:/TC/src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r14d	 ;, type
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jnb	.L23	 ;,
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, c
	jne	.L23	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	leaq	(%rcx,%rsi), %r8	 ;, _283
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%r8), %eax	 ; *_283, tmp598
	subl	$48, %eax	 ;, tmp357
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp357
	ja	.L23	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rdi	 ;, prephitmp_600
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_399
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rdi, 40(%rbx)	 ; prephitmp_600, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	 ; prephitmp_399, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%r8), %eax	 ; *_283, _296
	jmp	.L25	 ;
	.p2align 4,,10
	.p2align 3
.L208:
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_399
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rdi	 ;, prephitmp_600
	movq	%rdi, 40(%rbx)	 ; prephitmp_600, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	 ; prephitmp_399, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_259 + -1B + _294 * 1], _296
.L25:
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp359
	cmpb	$9, %al	 ;, tmp359
	ja	.L98	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _218, prephitmp_399
	jb	.L208	 ;,
.L98:
 ; D:/TC/src/lexer.c:91:             type = FLOAT;
	movl	$3, %r14d	 ;, type
	jmp	.L23	 ;
.L204:
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _460
.L91:
 ; D:/TC/src/lexer.c:41:         return '\0';
	xorl	%r9d, %r9d	 ; _415
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	xorl	%edx, %edx	 ; _506
.L35:
 ; D:/TC/src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, c
	jne	.L56	 ;,
	testb	%dl, %dl	 ; _506
	jne	.L209	 ;,
.L56:
 ; D:/TC/src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, c
	jne	.L57	 ;,
	testb	%dl, %dl	 ; _506
	jne	.L210	 ;,
.L57:
 ; D:/TC/src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, c
	jne	.L58	 ;,
	testb	%dl, %dl	 ; _506
	jne	.L211	 ;,
.L59:
 ; D:/TC/src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, c
	jne	.L60	 ;,
	testb	%dl, %dl	 ; _506
	jne	.L212	 ;,
.L60:
 ; D:/TC/src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, c
	jne	.L61	 ;,
	cmpb	$38, %r9b	 ;, _415
	je	.L213	 ;,
.L61:
 ; D:/TC/src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, c
	jne	.L62	 ;,
	cmpb	$124, %r9b	 ;, _415
	je	.L214	 ;,
.L62:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rsi	 ; lexer_216(D)->line, pretmp_702
	movq	%r13, %xmm0	 ; prephitmp_700, prephitmp_700
	subl	$33, %eax	 ;, tmp503
	movq	%rsi, %xmm6	 ; pretmp_702, _611
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_700, _611
	cmpb	$92, %al	 ;, tmp503
	ja	.L63	 ;,
	leaq	.L65(%rip), %rdx	 ;, tmp505
	movzbl	%al, %eax	 ; tmp503, tmp504
	movslq	(%rdx,%rax,4), %rax	 ;, tmp507
	addq	%rdx, %rax	 ; tmp505, tmp508
	jmp	*%rax	 ; tmp508
	.section .rdata,"dr"
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
 ; D:/TC/src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	(%rbx), %rbx	 ; lexer_216(D)->filename, _190
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	leaq	.LC0(%rip), %rdx	 ;, tmp531
	leaq	1(%rsi), %r9	 ;,
	movq	24(%rax), %rcx	 ; _672->_stderr, _672->_stderr
	leaq	.LC6(%rip), %rax	 ;, tmp636
	movq	%rdi, 32(%rsp)	 ; prephitmp_600,
	movq	%rbx, %r8	 ; _190,
	movq	%rax, 40(%rsp)	 ; tmp636,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/lexer.c:23:     token->line = line;
	pxor	%xmm0, %xmm0	 ; tmp532
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	%edx, 24(%rax)	 ;, token_376->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	 ;, token_376->lexeme
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	 ; tmp532, MEM <vector(2) long unsigned int> [(long unsigned int *)token_376 + 8B]
 ; D:/TC/src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	 ; lexer_216(D)->line, tmp601
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_216(D)->column
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	leaq	1(%rax), %r12	 ;, prephitmp_623
	movq	%r12, 32(%rbx)	 ; prephitmp_623, lexer_216(D)->line
 ; D:/TC/src/lexer.c:48: }
	jmp	.L31	 ;
.L38:
 ; D:/TC/src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	 ;, _415
	jne	.L43	 ;,
	testb	%r8b, %r8b	 ; tmp382
	je	.L43	 ;,
 ; D:/TC/src/lexer.c:120:             size_t start = lexer->position + 1;
	leaq	2(%r12), %rsi	 ;, start
 ; D:/TC/src/lexer.c:109:         char p = peek_next_char(lexer);
	movl	$42, %eax	 ;, p
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %r8d	 ;, c
	.p2align 4,,10
	.p2align 3
.L44:
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %r8b	 ;, c
	jne	.L160	 ;,
	cmpb	$47, %al	 ;, p
	je	.L215	 ;,
.L160:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	 ; lexer_216(D)->position, _328
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _218, _328
	jnb	.L45	 ;,
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r9	 ;, _331
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	 ;, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r9, 16(%rbx)	 ; _331, lexer_216(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %r8d	 ; *_332, c
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r9	 ; _218, _331
	jnb	.L216	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rax), %eax	 ; *_325, p
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %r8b	 ;, c
	jne	.L49	 ;,
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	 ;, lexer_216(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_216(D)->column
 ; D:/TC/src/lexer.c:126:                 if (p == '\0') break;
	testb	%al, %al	 ; p
	jne	.L160	 ;,
	jmp	.L193	 ;
	.p2align 4,,10
	.p2align 3
.L49:
	testb	%al, %al	 ; p
	je	.L47	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	testb	%r8b, %r8b	 ; c
	jne	.L44	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$127, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp398
	call	__assert_func	 ;
	.p2align 4,,10
	.p2align 3
.L216:
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %r8b	 ;, c
	jne	.L47	 ;,
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	 ; lexer_216(D)->line, tmp607
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_216(D)->column
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	leaq	1(%rax), %rdi	 ;, prephitmp_9
	movq	%rdi, 32(%rbx)	 ; prephitmp_9, lexer_216(D)->line
.L48:
 ; D:/TC/src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	(%rbx), %r15	 ; lexer_216(D)->filename, _68
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	addq	$3, %r12	 ;, tmp406
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	leaq	1(%rdi), %r9	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp407
	movq	24(%rax), %rcx	 ; _641->_stderr, _641->_stderr
	leaq	.LC5(%rip), %rax	 ;, tmp608
	movq	%r12, 32(%rsp)	 ; tmp406,
	movq	%r15, %r8	 ; _68,
	movq	%rax, 40(%rsp)	 ; tmp608,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:132:                 if (skip_comment)
	testb	%r14b, %r14b	 ; skip_comment
	jne	.L197	 ;,
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, tmp409
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbx), %rdx	 ; lexer_216(D)->position, tmp411
	movq	%r13, %xmm0	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rcx	 ; lexer_216(D)->source, start
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_700, tmp409
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rsi, %rdx	 ; start, tmp411
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rsi, %rcx	 ; start, start
	jmp	.L196	 ;
.L215:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	 ; lexer_216(D)->position, _338
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _218, _338
	jnb	.L89	 ;,
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rax	 ;, tmp415
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	 ;, lexer_216(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, 16(%rbx)	 ; tmp415, lexer_216(D)->position
.L89:
 ; D:/TC/src/lexer.c:137:             if (skip_comment)
	testb	%r14b, %r14b	 ; skip_comment
	jne	.L197	 ;,
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbx), %rdx	 ; lexer_216(D)->position, lexer_216(D)->position
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, tmp417
	movq	%r13, %xmm0	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rsi, %rcx	 ; start, tmp422
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	$2, %rdx	 ;, tmp419
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_700, tmp417
	subq	%rsi, %rdx	 ; start, tmp421
	jmp	.L196	 ;
.L47:
 ; D:/TC/src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%r8b, %r8b	 ; c
	jne	.L193	 ;,
	.p2align 4,,10
	.p2align 3
.L45:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	$1, 16(%rbx)	 ;, lexer_216(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_216(D)->column
.L193:
 ; D:/TC/src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	32(%rbx), %rdi	 ; lexer_216(D)->line, prephitmp_9
 ; D:/TC/src/lexer.c:58: }
	jmp	.L48	 ;
.L58:
 ; D:/TC/src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%dl, %dl	 ; _506
	je	.L59	 ;,
	testb	%r10b, %r10b	 ; _460
	je	.L59	 ;,
 ; D:/TC/src/lexer.c:162:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp626
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp473
	movq	%rax, %xmm0	 ; tmp473, tmp473
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp476
	punpcklqdq	%xmm0, %xmm6	 ; tmp473, tmp472
	jmp	.L194	 ;
.L209:
 ; D:/TC/src/lexer.c:153:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp620
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp454
	movq	%rax, %xmm0	 ; tmp454, tmp454
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp457
	punpcklqdq	%xmm0, %xmm6	 ; tmp454, tmp453
	jmp	.L194	 ;
.L211:
 ; D:/TC/src/lexer.c:159:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp624
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp468
	movq	%rax, %xmm0	 ; tmp468, tmp468
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp471
	punpcklqdq	%xmm0, %xmm6	 ; tmp468, tmp467
	jmp	.L194	 ;
.L210:
 ; D:/TC/src/lexer.c:156:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp622
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp461
	movq	%rax, %xmm0	 ; tmp461, tmp461
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp464
	punpcklqdq	%xmm0, %xmm6	 ; tmp461, tmp460
	jmp	.L194	 ;
.L212:
 ; D:/TC/src/lexer.c:165:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp628
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp480
	movq	%rax, %xmm0	 ; tmp480, tmp480
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp483
	punpcklqdq	%xmm0, %xmm6	 ; tmp480, tmp479
	jmp	.L194	 ;
.L213:
 ; D:/TC/src/lexer.c:168:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp630
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp489
	movq	%rax, %xmm0	 ; tmp489, tmp489
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp492
	punpcklqdq	%xmm0, %xmm6	 ; tmp489, tmp488
	jmp	.L194	 ;
.L214:
 ; D:/TC/src/lexer.c:171:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp632
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp498
	movq	%rax, %xmm0	 ; tmp498, tmp498
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp501
	punpcklqdq	%xmm0, %xmm6	 ; tmp498, tmp497
	jmp	.L194	 ;
.L202:
	cmpb	$47, %al	 ;, c
	jg	.L20	 ;,
	jmp	.L18	 ;
.L85:
 ; D:/TC/src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, c
	jne	.L55	 ;,
	testb	%cl, %cl	 ; tmp534
	jne	.L217	 ;,
.L55:
 ; D:/TC/src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, c
	jne	.L88	 ;,
	testb	%cl, %cl	 ; tmp534
	je	.L88	 ;,
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	 ;, tmp437
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r12	 ;, tmp438
	movq	%r13, %xmm0	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	 ; tmp437, lexer_216(D)->column
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp443
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r12, 16(%rbx)	 ; tmp438, lexer_216(D)->position
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_700, tmp439
	jmp	.L194	 ;
.L217:
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	 ;, tmp430
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r12	 ;, tmp431
	movq	%r13, %xmm0	 ; prephitmp_700, prephitmp_700
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	 ; tmp430, lexer_216(D)->column
 ; D:/TC/src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp436
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r12, 16(%rbx)	 ; tmp431, lexer_216(D)->position
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_700, tmp432
	jmp	.L194	 ;
.L88:
 ; D:/TC/src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, c
	jne	.L35	 ;,
	testb	%cl, %cl	 ; tmp534
	je	.L35	 ;,
 ; D:/TC/src/lexer.c:150:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:/TC/src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_216(D)->column, tmp618
	movq	32(%rbx), %xmm6	 ; lexer_216(D)->line, lexer_216(D)->line
	subq	$2, %rax	 ;, tmp447
	movq	%rax, %xmm0	 ; tmp447, tmp447
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp450
	punpcklqdq	%xmm0, %xmm6	 ; tmp447, tmp446
	jmp	.L194	 ;
.L64:
 ; D:/TC/src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp513
	jmp	.L194	 ;
.L66:
 ; D:/TC/src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp512
	jmp	.L194	 ;
.L67:
 ; D:/TC/src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp518
	jmp	.L194	 ;
.L68:
 ; D:/TC/src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp517
	jmp	.L194	 ;
.L69:
 ; D:/TC/src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp526
	jmp	.L194	 ;
.L70:
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp527
	jmp	.L194	 ;
.L71:
 ; D:/TC/src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp525
	jmp	.L194	 ;
.L72:
 ; D:/TC/src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp519
	jmp	.L194	 ;
.L73:
 ; D:/TC/src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp523
	jmp	.L194	 ;
.L74:
 ; D:/TC/src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp516
	jmp	.L194	 ;
.L75:
 ; D:/TC/src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp521
	jmp	.L194	 ;
.L76:
 ; D:/TC/src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp514
	jmp	.L194	 ;
.L77:
 ; D:/TC/src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp520
	jmp	.L194	 ;
.L78:
 ; D:/TC/src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp522
	jmp	.L194	 ;
.L79:
 ; D:/TC/src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp511
	jmp	.L194	 ;
.L80:
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp510
	jmp	.L194	 ;
.L81:
 ; D:/TC/src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp524
	jmp	.L194	 ;
.L82:
 ; D:/TC/src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp515
	jmp	.L194	 ;
	.p2align 4
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp88, source
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %ecx	 ;,
 ; D:/TC/src/lexer.c:3: Lexer* create_lexer(string source, size_t length, string filename) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp89, length
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp90, filename
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	pxor	%xmm0, %xmm0	 ; tmp86
 ; D:/TC/src/lexer.c:5:     lexer->source = source;
	movq	%rdi, 8(%rax)	 ; source, lexer_3->source
 ; D:/TC/src/lexer.c:6:     lexer->position = 0;
	movq	$0, 16(%rax)	 ;, lexer_3->position
 ; D:/TC/src/lexer.c:7:     lexer->length = length;
	movq	%rsi, 24(%rax)	 ; length, lexer_3->length
 ; D:/TC/src/lexer.c:8:     lexer->line = 0;
	movq	$0, 32(%rax)	 ;, lexer_3->line
 ; D:/TC/src/lexer.c:9:     lexer->column = 0;
	movq	$0, 40(%rax)	 ;, lexer_3->column
 ; D:/TC/src/lexer.c:10:     lexer->peeked_token = NULL;
	movq	$0, 48(%rax)	 ;, lexer_3->peeked_token
 ; D:/TC/src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 72(%rax)	 ;, lexer_3->peeked_column
 ; D:/TC/src/lexer.c:14:     lexer->current_token = NULL;
	movq	$0, 80(%rax)	 ;, lexer_3->current_token
 ; D:/TC/src/lexer.c:15:     lexer->filename = filename;
	movq	%rbx, (%rax)	 ; filename, lexer_3->filename
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	movups	%xmm0, 56(%rax)	 ; tmp86, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_3 + 56B]
 ; D:/TC/src/lexer.c:17: }
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
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
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	48(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L221	 ;,
 ; D:/TC/src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	56(%rcx), %rdx	 ; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
 ; D:/TC/src/lexer.c:229: }
	movq	-8(%rbp), %rbx	 ;,
 ; D:/TC/src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rcx)	 ; <retval>, lexer_8(D)->current_token
 ; D:/TC/src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movdqu	64(%rcx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 64B], tmp97
 ; D:/TC/src/lexer.c:224:         lexer->peeked_token = 0;
	movq	$0, 48(%rcx)	 ;, lexer_8(D)->peeked_token
 ; D:/TC/src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	%rdx, 16(%rcx)	 ; lexer_8(D)->peeked_position, lexer_8(D)->position
 ; D:/TC/src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movups	%xmm0, 32(%rcx)	 ; tmp97, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B]
 ; D:/TC/src/lexer.c:229: }
	leave	
	ret	
	.p2align 4,,10
	.p2align 3
.L221:
 ; D:/TC/src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; D:/TC/src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	 ; <retval>, lexer_8(D)->current_token
 ; D:/TC/src/lexer.c:229: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.p2align 4
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	48(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L230	 ;,
 ; D:/TC/src/lexer.c:246: }
	ret	
	.p2align 4,,10
	.p2align 3
.L230:
 ; D:/TC/src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	 ;
 ; D:/TC/src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
 ; D:/TC/src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp100, lexer
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rcx), %rsi	 ; lexer_9(D)->position, saved_position
 ; D:/TC/src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/lexer.c:235:     size_t saved_line = lexer->line;
	movdqu	32(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B]
 ; D:/TC/src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	call	next_token	 ;
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movdqu	16(%rbx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 16B], vect__3.200
	movdqu	32(%rbx), %xmm1	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B], tmp105
 ; D:/TC/src/lexer.c:241:     lexer->position = saved_position;
	movq	%rsi, 16(%rbx)	 ; saved_position, lexer_9(D)->position
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	 ; lexer_9(D)->column, lexer_9(D)->column
 ; D:/TC/src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	 ; <retval>, lexer_9(D)->current_token
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm1, %xmm0	 ; tmp105, vect__3.200
 ; D:/TC/src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	 ; <retval>, lexer_9(D)->peeked_token
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	%rdx, 72(%rbx)	 ; lexer_9(D)->column, lexer_9(D)->peeked_column
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 56(%rbx)	 ; vect__3.200, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 56B]
 ; D:/TC/src/lexer.c:242:     lexer->line = saved_line;
	movups	%xmm6, 32(%rbx)	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 32B]
 ; D:/TC/src/lexer.c:246: }
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
 ; D:/TC/src/lexer.c:249:     return lexer->current_token;
	movq	80(%rcx), %rax	 ; lexer_2(D)->current_token, lexer_2(D)->current_token
 ; D:/TC/src/lexer.c:250: }
	ret	
	.p2align 4
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	pushq	%rbp	 ;
 ; D:/TC/src/lexer.c:254:     lexer->line = 0;
	pxor	%xmm0, %xmm0	 ; tmp83
 ; D:/TC/src/lexer.c:253:     lexer->position = 0;
	movq	$0, 16(%rcx)	 ;, lexer_2(D)->position
 ; D:/TC/src/lexer.c:256:     lexer->peeked_token = NULL;
	movq	$0, 48(%rcx)	 ;, lexer_2(D)->peeked_token
 ; D:/TC/src/lexer.c:252: void reset_lexer(Lexer* lexer) {
	movq	%rsp, %rbp	 ;,
 ; D:/TC/src/lexer.c:259:     lexer->peeked_column = 0;
	movq	$0, 72(%rcx)	 ;, lexer_2(D)->peeked_column
 ; D:/TC/src/lexer.c:252: void reset_lexer(Lexer* lexer) {
	andq	$-16, %rsp	 ;,
 ; D:/TC/src/lexer.c:260:     lexer->current_token = NULL;
	movq	$0, 80(%rcx)	 ;, lexer_2(D)->current_token
 ; D:/TC/src/lexer.c:254:     lexer->line = 0;
	movups	%xmm0, 32(%rcx)	 ; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 32B]
 ; D:/TC/src/lexer.c:257:     lexer->peeked_position = 0;
	movups	%xmm0, 56(%rcx)	 ; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 56B]
 ; D:/TC/src/lexer.c:261: }
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

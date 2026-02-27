	.file	"D:\\TC\\src\\lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.p2align 4
	.def	get_current_char.isra.0;	.scl	3;	.type	32;	.endef
get_current_char.isra.0:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rcx), %rax	 ; lexer_1(D)->position, _2
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	16(%rcx), %rax	 ; lexer_1(D)->length, _2
	jnb	.L1	 ;,
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	 ;, tmp88
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, 32(%rcx)	 ;, lexer_1(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rcx)	 ; tmp88, lexer_1(D)->position
.L1:
 ; D:\TC\src\lexer.c:36: }
	ret	
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
	movl	%edx, %r13d	 ; tmp550, skip_comment
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp549, lexer
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$64, %rsp	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rcx), %r12	 ; lexer_217(D)->position, _233
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rdx	 ; lexer_217(D)->length, _219
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	32(%rcx), %rdi	 ; lexer_217(D)->column, prephitmp_700
 ; D:\TC\src\lexer.c:59: static Token* next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 64(%rsp)	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r12	 ; _219, _233
	jnb	.L5	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	1(%rdi), %r9	 ;, prephitmp_400
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%r12), %rsi	 ;, prephitmp_248
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r9, 32(%rcx)	 ; prephitmp_400, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rcx), %rcx	 ; lexer_217(D)->source, _260
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rsi, 8(%rbx)	 ; prephitmp_248, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	(%rcx,%r12), %r10	 ;, _262
	movzbl	(%r10), %eax	 ; *_262, c
	cmpb	$32, %al	 ;, c
	ja	.L6	 ;,
	leaq	.L8(%rip), %r11	 ;, tmp338
	movzbl	%al, %r8d	 ; c, c
	movslq	(%r11,%r8,4), %r8	 ;, tmp340
	addq	%r11, %r8	 ; tmp338, tmp341
	jmp	*%r8	 ; tmp341
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
	.long	.L193-.L8
	.long	.L9-.L8
	.long	.L6-.L8
	.long	.L6-.L8
	.long	.L193-.L8
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
	.long	.L193-.L8
	.text
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%r9, %rdi	 ; prephitmp_400, prephitmp_700
	.p2align 4,,10
	.p2align 3
.L5:
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	movq	%rdi, %xmm1	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm1, %xmm6	 ; prephitmp_700, tmp343
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$0, 24(%rax)	 ;, token_264->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	$0, (%rax)	 ;, token_264->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp343,
.L4:
 ; D:\TC\src\lexer.c:214: }
	movaps	64(%rsp), %xmm6	 ;,
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
.L9:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	 ;, lexer_217(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_217(D)->column
.L193:
 ; D:\TC\src\lexer.c:214: }
	movaps	64(%rsp), %xmm6	 ;,
	leaq	-48(%rbp), %rsp	 ;,
 ; D:\TC\src\lexer.c:136:                 return next_token(lexer, skip_comment);
	movsbl	%r13b, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\lexer.c:214: }
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
.L6:
	cmpb	$90, %al	 ;, c
	jg	.L11	 ;,
	cmpb	$64, %al	 ;, c
	jg	.L12	 ;,
	cmpb	$34, %al	 ;, c
	je	.L13	 ;,
	leal	-48(%rax), %r8d	 ;, tmp347
	cmpb	$9, %r8b	 ;, tmp347
	jbe	.L15	 ;,
	jmp	.L194	 ;
	.p2align 4,,10
	.p2align 3
.L196:
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_248
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %r9	 ;, prephitmp_400
	movq	%r9, 32(%rbx)	 ; prephitmp_400, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rsi, 8(%rbx)	 ; prephitmp_248, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_260 + -1B + _279 * 1], c
.L15:
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r8d	 ;, tmp359
	cmpb	$9, %r8b	 ;, tmp359
	ja	.L195	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jb	.L196	 ;,
 ; D:\TC\src\lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	 ;, type
.L23:
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r9	 ;, tmp363
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rdx	 ;, _621
	movq	%rdi, %xmm4	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r10, %rcx	 ; _262,
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _621, lexer_217(D)->position
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r12, %rdx	 ; _233, tmp366
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r9, 32(%rbx)	 ; tmp363, lexer_217(D)->column
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_700, tmp364
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp556, _35
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	%r13d, 24(%rax)	 ; type, token_299->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _35,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp364,
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$95, %al	 ;, c
	jne	.L197	 ;,
.L12:
	movabsq	$288230372997595135, %r8	 ;, tmp548
	jmp	.L17	 ;
	.p2align 4,,10
	.p2align 3
.L199:
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_248
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %r9	 ;, prephitmp_400
	movq	%r9, 32(%rbx)	 ; prephitmp_400, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rsi, 8(%rbx)	 ; prephitmp_248, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_260 + -1B + _270 * 1], c
.L17:
	cmpb	$57, %al	 ;, c
	jle	.L198	 ;,
	subl	$65, %eax	 ;, _208
	cmpb	$57, %al	 ;, _208
	ja	.L18	 ;,
	btq	%rax, %r8	 ; _208, tmp548
	jnc	.L18	 ;,
.L20:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jb	.L199	 ;,
.L18:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rdx	 ;, _615
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r9	 ;, tmp353
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r10, %rcx	 ; _262,
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _615, lexer_217(D)->position
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r12, %rdx	 ; _233, tmp354
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r9, 32(%rbx)	 ; tmp353, lexer_217(D)->column
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	 ; tmp552, content
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	call	is_keyword	 ;
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	 ; tmp553
	je	.L22	 ;,
	movq	%rdi, %xmm2	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm2, %xmm6	 ; prephitmp_700, tmp355
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$6, 24(%rax)	 ;, token_274->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp355,
 ; D:\TC\src\lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L197:
	leal	-97(%rax), %r8d	 ;, tmp348
	cmpb	$25, %r8b	 ;, tmp348
	jbe	.L12	 ;,
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jnb	.L200	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r12), %r10d	 ; *_421, _420
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r11d, %r11d	 ; _472
.L43:
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r10b	 ;, _420
	sete	%cl	 ;, tmp542
	movl	%ecx, %edx	 ; tmp542, _512
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, c
	jne	.L85	 ;,
	testb	%cl, %cl	 ; tmp542
	je	.L85	 ;,
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r12	 ;, tmp432
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	2(%rdi), %rax	 ;, tmp431
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	movq	%rdi, %xmm5	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r12, 8(%rbx)	 ; tmp432, lexer_217(D)->position
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	 ; tmp431, lexer_217(D)->column
 ; D:\TC\src\lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp435
	punpcklqdq	%xmm5, %xmm6	 ; prephitmp_700, tmp433
.L191:
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	(%rax), %rbx	 ;, ASSIGN_SYMBOL.38_191
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; ASSIGN_SYMBOL.38_191,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; _616,
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L22:
	movq	%rdi, %xmm3	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_700, tmp357
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$1, 24(%rax)	 ;, token_275->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp357,
 ; D:\TC\src\lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:\TC\src\lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	 ; _310
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jnb	.L27	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	2(%rdi), %rax	 ;, tmp367
	movq	%rax, 32(%rbx)	 ; tmp367, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	2(%r12), %rax	 ;, tmp368
	movq	%rax, 8(%rbx)	 ; tmp368, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%r12), %r13d	 ; *_302, _310
.L27:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp547
	jmp	.L28	 ;
	.p2align 4,,10
	.p2align 3
.L202:
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp369
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	 ; tmp369, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %r13d	 ; *_309, _310
.L28:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r13b	 ;, _310
	jbe	.L201	 ;,
.L30:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	 ; lexer_217(D)->position, _305
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _219, _305
	jb	.L202	 ;,
 ; D:\TC\src\lexer.c:33:         return '\0';
	xorl	%r13d, %r13d	 ; _310
.L29:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %r12	 ; lexer_217(D)->line, pretmp_701
 ; D:\TC\src\lexer.c:100:         if (c != '"') {
	cmpb	$34, %r13b	 ;, _310
	je	.L31	 ;,
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	%rsi, %r9	 ; prephitmp_248,
	leaq	1(%r12), %r8	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp377
	movq	24(%rax), %rcx	 ; _626->_stderr, _626->_stderr
	leaq	.LC1(%rip), %rax	 ;, tmp608
	movq	%rax, 32(%rsp)	 ; tmp608,
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %r13b	 ;, _310
	je	.L32	 ;,
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, prephitmp_63
.L33:
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	(%rbx), %rcx	 ; lexer_217(D)->source, prephitmp_248
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rsi, %rdx	 ; prephitmp_248, tmp380
	movq	%rdi, %xmm5	 ; prephitmp_700, prephitmp_700
	notq	%rdx	 ; tmp380
	addq	8(%rbx), %rdx	 ; lexer_217(D)->position, tmp382
	punpcklqdq	%xmm5, %xmm6	 ; prephitmp_700, tmp379
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rsi, %rcx	 ; prephitmp_248, prephitmp_248
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp559, _46
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	 ;, token_313->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _46,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp379,
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L4	 ;
	.p2align 4,,10
	.p2align 3
.L201:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r13, %r9	 ; _310, tmp547
	jc	.L30	 ;,
	jmp	.L29	 ;
.L194:
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%r8b	 ;, tmp390
	movl	%r8d, %r11d	 ; tmp390, _472
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jnb	.L91	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r12), %r10d	 ; *_315, _420
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %r10b	 ;, _420
	jne	.L38	 ;,
	testb	%r8b, %r8b	 ; tmp390
	je	.L38	 ;,
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	 ;, _323
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L203:
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_248
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %r9	 ;, prephitmp_400
	movq	%r9, 32(%rbx)	 ; prephitmp_400, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rsi, 8(%rbx)	 ; prephitmp_248, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_260 + -1B + _321 * 1], _323
.L36:
 ; D:\TC\src\lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	 ;, _323
	je	.L39	 ;,
	testb	%al, %al	 ; _323
	je	.L39	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jb	.L203	 ;,
.L39:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rsi), %rdx	 ;, _631
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %r9	 ;, tmp397
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _631, lexer_217(D)->position
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%r9, 32(%rbx)	 ; tmp397, lexer_217(D)->column
 ; D:\TC\src\lexer.c:114:             if (skip_comment)
	testb	%r13b, %r13b	 ; skip_comment
	jne	.L193	 ;,
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
 ; D:\TC\src\lexer.c:109:             size_t start = lexer->position + 1;
	addq	$2, %r12	 ;, start
	movq	%rdi, %xmm2	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r12, %rdx	 ; start, tmp401
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r12, %rcx	 ; start, tmp402
	punpcklqdq	%xmm2, %xmm6	 ; prephitmp_700, tmp399
.L192:
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp566, _78
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$7, 24(%rax)	 ;,
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _78,* <retval>
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp417,
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L4	 ;
.L195:
 ; D:\TC\src\lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r13d	 ;, type
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jnb	.L23	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, c
	jne	.L23	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	leaq	(%rcx,%rsi), %r8	 ;, _284
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%r8), %eax	 ; *_284, tmp606
	subl	$48, %eax	 ;, tmp360
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp360
	ja	.L23	 ;,
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %r9	 ;, prephitmp_400
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_248
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%r9, 32(%rbx)	 ; prephitmp_400, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rsi, 8(%rbx)	 ; prephitmp_248, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%r8), %eax	 ; *_284, _297
	jmp	.L25	 ;
	.p2align 4,,10
	.p2align 3
.L204:
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rsi	 ;, prephitmp_248
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, %r9	 ;, prephitmp_400
	movq	%r9, 32(%rbx)	 ; prephitmp_400, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rsi, 8(%rbx)	 ; prephitmp_248, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rsi), %eax	 ; MEM[(char *)_260 + -1B + _295 * 1], _297
.L25:
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp362
	cmpb	$9, %al	 ;, tmp362
	ja	.L98	 ;,
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rsi	 ; _219, prephitmp_248
	jb	.L204	 ;,
.L98:
 ; D:\TC\src\lexer.c:90:             type = FLOAT;
	movl	$3, %r13d	 ;, type
	jmp	.L23	 ;
.L31:
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rsi, %rdx	 ; prephitmp_248, tmp385
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rsi, %rcx	 ; prephitmp_248, tmp388
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	notq	%rdx	 ; tmp385
	addq	8(%rbx), %rdx	 ; lexer_217(D)->position, tmp387
	call	create_string	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp561, _52
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movq	%r12, %xmm0	 ; pretmp_701, tmp389
	movq	%rdi, %xmm5	 ; prephitmp_700, prephitmp_700
	punpcklqdq	%xmm5, %xmm0	 ; prephitmp_700, tmp389
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	 ;, token_314->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _52, token_314->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	 ; tmp389,
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L4	 ;
.L32:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	 ; lexer_217(D)->line, tmp610
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_217(D)->column
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	addq	$1, %rax	 ;, prephitmp_63
	movq	%rax, 24(%rbx)	 ; prephitmp_63, lexer_217(D)->line
	movq	%rax, %xmm6	 ; prephitmp_63, prephitmp_63
 ; D:\TC\src\lexer.c:47: }
	jmp	.L33	 ;
.L200:
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	xorl	%r11d, %r11d	 ; _472
.L91:
 ; D:\TC\src\lexer.c:40:         return '\0';
	xorl	%r10d, %r10d	 ; _420
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	xorl	%edx, %edx	 ; _512
.L35:
 ; D:\TC\src\lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, c
	jne	.L56	 ;,
	testb	%dl, %dl	 ; _512
	jne	.L205	 ;,
.L56:
 ; D:\TC\src\lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, c
	jne	.L57	 ;,
	testb	%dl, %dl	 ; _512
	jne	.L206	 ;,
.L57:
 ; D:\TC\src\lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, c
	jne	.L58	 ;,
	testb	%dl, %dl	 ; _512
	jne	.L207	 ;,
.L59:
 ; D:\TC\src\lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, c
	jne	.L60	 ;,
	testb	%dl, %dl	 ; _512
	jne	.L208	 ;,
.L60:
 ; D:\TC\src\lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, c
	jne	.L61	 ;,
	cmpb	$38, %r10b	 ;, _420
	je	.L209	 ;,
.L61:
 ; D:\TC\src\lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, c
	jne	.L62	 ;,
	cmpb	$124, %r10b	 ;, _420
	je	.L210	 ;,
.L62:
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rbx	 ; lexer_217(D)->line, pretmp_702
	movq	%rdi, %xmm4	 ; prephitmp_700, prephitmp_700
	subl	$33, %eax	 ;, tmp511
	movq	%rbx, %xmm6	 ; pretmp_702, _616
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_700, _616
	cmpb	$92, %al	 ;, tmp511
	ja	.L63	 ;,
	leaq	.L65(%rip), %rdx	 ;, tmp513
	movzbl	%al, %eax	 ; tmp511, tmp512
	movslq	(%rdx,%rax,4), %rax	 ;, tmp515
	addq	%rdx, %rax	 ; tmp513, tmp516
	jmp	*%rax	 ; tmp516
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
	movq	%r9, 56(%rsp)	 ; prephitmp_400, %sfp
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	56(%rsp), %r9	 ; %sfp, prephitmp_400
	leaq	.LC0(%rip), %rdx	 ;, tmp539
	leaq	1(%rbx), %r8	 ;,
	movq	24(%rax), %rcx	 ; _673->_stderr, _673->_stderr
	leaq	.LC5(%rip), %rax	 ;, tmp647
	movq	%rax, 32(%rsp)	 ; tmp647,
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	xorl	%edx, %edx	 ;
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\lexer.c:22:     token->line = line;
	pxor	%xmm0, %xmm0	 ; tmp540
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	%edx, 24(%rax)	 ;, token_377->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	 ;, token_377->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	 ; tmp540,
 ; D:\TC\src\lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	jmp	.L4	 ;
.L38:
 ; D:\TC\src\lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r10b	 ;, _420
	jne	.L43	 ;,
	testb	%r8b, %r8b	 ; tmp390
	je	.L43	 ;,
 ; D:\TC\src\lexer.c:118:             size_t start = lexer->position + 1;
	leaq	2(%r12), %rsi	 ;, start
 ; D:\TC\src\lexer.c:107:         char p = peek_next_char(lexer);
	movl	$42, %eax	 ;, p
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %r8d	 ;, c
	.p2align 4,,10
	.p2align 3
.L44:
 ; D:\TC\src\lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %r8b	 ;, c
	jne	.L158	 ;,
	cmpb	$47, %al	 ;, p
	je	.L211	 ;,
.L158:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	 ; lexer_217(D)->position, _329
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _219, _329
	jnb	.L45	 ;,
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r9	 ;, _332
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r9, 8(%rbx)	 ; _332, lexer_217(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %r8d	 ; *_333, c
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r9	 ; _219, _332
	jnb	.L212	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%rax), %eax	 ; *_326, p
 ; D:\TC\src\lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %r8b	 ;, c
	jne	.L49	 ;,
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	 ;, lexer_217(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_217(D)->column
 ; D:\TC\src\lexer.c:124:                 if (p == '\0') break;
	testb	%al, %al	 ; p
	jne	.L158	 ;,
	jmp	.L190	 ;
	.p2align 4,,10
	.p2align 3
.L49:
	testb	%al, %al	 ; p
	je	.L47	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	testb	%r8b, %r8b	 ; c
	jne	.L44	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	leaq	.LC2(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$125, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp406
	call	__assert_func	 ;
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:\TC\src\lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %r8b	 ;, c
	jne	.L47	 ;,
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	 ; lexer_217(D)->line, tmp618
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_217(D)->column
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	leaq	1(%rax), %r14	 ;, prephitmp_9
	movq	%r14, 24(%rbx)	 ; prephitmp_9, lexer_217(D)->line
.L48:
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	3(%r12), %r9	 ;,
	leaq	1(%r14), %r8	 ;,
	movq	24(%rax), %rcx	 ; _642->_stderr, _642->_stderr
	leaq	.LC4(%rip), %rax	 ;, tmp619
	leaq	.LC0(%rip), %rdx	 ;, tmp415
	movq	%rax, 32(%rsp)	 ; tmp619,
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:130:                 if (skip_comment)
	testb	%r13b, %r13b	 ; skip_comment
	jne	.L193	 ;,
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, tmp417
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rdx	 ; lexer_217(D)->position, tmp419
	movq	%rdi, %xmm3	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	(%rbx), %rcx	 ; lexer_217(D)->source, start
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_700, tmp417
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rsi, %rdx	 ; start, tmp419
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%rsi, %rcx	 ; start, start
	jmp	.L192	 ;
.L211:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	 ; lexer_217(D)->position, _339
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _219, _339
	jnb	.L89	 ;,
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	 ;, tmp423
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_217(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	 ; tmp423, lexer_217(D)->position
.L89:
 ; D:\TC\src\lexer.c:135:             if (skip_comment)
	testb	%r13b, %r13b	 ; skip_comment
	jne	.L193	 ;,
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	8(%rbx), %rdx	 ; lexer_217(D)->position, lexer_217(D)->position
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, tmp425
	movq	%rdi, %xmm4	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rsi, %rcx	 ; start, tmp430
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	$2, %rdx	 ;, tmp427
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_700, tmp425
	subq	%rsi, %rdx	 ; start, tmp429
	jmp	.L192	 ;
.L47:
 ; D:\TC\src\lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	testb	%r8b, %r8b	 ; c
	jne	.L190	 ;,
	.p2align 4,,10
	.p2align 3
.L45:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	 ;, lexer_217(D)->position
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	 ;, lexer_217(D)->column
.L190:
 ; D:\TC\src\lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %r14	 ; lexer_217(D)->line, prephitmp_9
 ; D:\TC\src\lexer.c:57: }
	jmp	.L48	 ;
.L58:
 ; D:\TC\src\lexer.c:159:         } else if (c == '/' && p == '=') {
	testb	%dl, %dl	 ; _512
	je	.L59	 ;,
	testb	%r11b, %r11b	 ; _472
	je	.L59	 ;,
 ; D:\TC\src\lexer.c:160:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp637
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp481
	movq	%rax, %xmm3	 ; tmp481, tmp481
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp484
	punpcklqdq	%xmm3, %xmm6	 ; tmp481, tmp480
	jmp	.L191	 ;
.L205:
 ; D:\TC\src\lexer.c:151:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp631
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp462
	movq	%rax, %xmm3	 ; tmp462, tmp462
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp465
	punpcklqdq	%xmm3, %xmm6	 ; tmp462, tmp461
	jmp	.L191	 ;
.L206:
 ; D:\TC\src\lexer.c:154:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp633
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp469
	movq	%rax, %xmm4	 ; tmp469, tmp469
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp472
	punpcklqdq	%xmm4, %xmm6	 ; tmp469, tmp468
	jmp	.L191	 ;
.L207:
 ; D:\TC\src\lexer.c:157:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp635
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp476
	movq	%rax, %xmm5	 ; tmp476, tmp476
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp479
	punpcklqdq	%xmm5, %xmm6	 ; tmp476, tmp475
	jmp	.L191	 ;
.L208:
 ; D:\TC\src\lexer.c:163:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp639
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp488
	movq	%rax, %xmm4	 ; tmp488, tmp488
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp491
	punpcklqdq	%xmm4, %xmm6	 ; tmp488, tmp487
	jmp	.L191	 ;
.L209:
 ; D:\TC\src\lexer.c:166:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp641
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp497
	movq	%rax, %xmm5	 ; tmp497, tmp497
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp500
	punpcklqdq	%xmm5, %xmm6	 ; tmp497, tmp496
	jmp	.L191	 ;
.L210:
 ; D:\TC\src\lexer.c:169:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp643
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp506
	movq	%rax, %xmm3	 ; tmp506, tmp506
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp509
	punpcklqdq	%xmm3, %xmm6	 ; tmp506, tmp505
	jmp	.L191	 ;
.L85:
 ; D:\TC\src\lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, c
	jne	.L55	 ;,
	testb	%cl, %cl	 ; tmp542
	jne	.L213	 ;,
.L55:
 ; D:\TC\src\lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, c
	jne	.L88	 ;,
	testb	%cl, %cl	 ; tmp542
	je	.L88	 ;,
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	2(%rdi), %rax	 ;, tmp445
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r12	 ;, tmp446
	movq	%rdi, %xmm4	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	 ; tmp445, lexer_217(D)->column
 ; D:\TC\src\lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp451
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r12, 8(%rbx)	 ; tmp446, lexer_217(D)->position
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_700, tmp447
	jmp	.L191	 ;
.L213:
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	2(%rdi), %rax	 ;, tmp438
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r12	 ;, tmp439
	movq	%rdi, %xmm3	 ; prephitmp_700, prephitmp_700
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	%rax, 32(%rbx)	 ; tmp438, lexer_217(D)->column
 ; D:\TC\src\lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp444
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r12, 8(%rbx)	 ; tmp439, lexer_217(D)->position
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_700, tmp440
	jmp	.L191	 ;
.L88:
 ; D:\TC\src\lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, c
	jne	.L35	 ;,
	testb	%cl, %cl	 ; tmp542
	je	.L35	 ;,
 ; D:\TC\src\lexer.c:148:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char.isra.0	 ;
 ; D:\TC\src\lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_217(D)->column, tmp629
	movq	24(%rbx), %xmm6	 ; lexer_217(D)->line, lexer_217(D)->line
	subq	$2, %rax	 ;, tmp455
	movq	%rax, %xmm5	 ; tmp455, tmp455
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp458
	punpcklqdq	%xmm5, %xmm6	 ; tmp455, tmp454
	jmp	.L191	 ;
.L64:
 ; D:\TC\src\lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp521
	jmp	.L191	 ;
.L66:
 ; D:\TC\src\lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp520
	jmp	.L191	 ;
.L198:
	cmpb	$47, %al	 ;, c
	jg	.L20	 ;,
	jmp	.L18	 ;
.L67:
 ; D:\TC\src\lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp526
	jmp	.L191	 ;
.L68:
 ; D:\TC\src\lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp525
	jmp	.L191	 ;
.L69:
 ; D:\TC\src\lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp534
	jmp	.L191	 ;
.L70:
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp535
	jmp	.L191	 ;
.L71:
 ; D:\TC\src\lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp533
	jmp	.L191	 ;
.L72:
 ; D:\TC\src\lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp527
	jmp	.L191	 ;
.L73:
 ; D:\TC\src\lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp531
	jmp	.L191	 ;
.L74:
 ; D:\TC\src\lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp524
	jmp	.L191	 ;
.L75:
 ; D:\TC\src\lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp529
	jmp	.L191	 ;
.L76:
 ; D:\TC\src\lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp522
	jmp	.L191	 ;
.L77:
 ; D:\TC\src\lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp528
	jmp	.L191	 ;
.L78:
 ; D:\TC\src\lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp530
	jmp	.L191	 ;
.L79:
 ; D:\TC\src\lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp519
	jmp	.L191	 ;
.L80:
 ; D:\TC\src\lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp518
	jmp	.L191	 ;
.L81:
 ; D:\TC\src\lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp532
	jmp	.L191	 ;
.L82:
 ; D:\TC\src\lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp523
	jmp	.L191	 ;
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
	je	.L217	 ;,
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
.L217:
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
	movq	40(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; D:\TC\src\lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	 ; <retval>
	je	.L226	 ;,
 ; D:\TC\src\lexer.c:244: }
	ret	
	.p2align 4,,10
	.p2align 3
.L226:
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
	movq	8(%rcx), %rsi	 ; lexer_9(D)->position, saved_position
 ; D:\TC\src\lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\src\lexer.c:233:     size_t saved_line = lexer->line;
	movdqu	24(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
 ; D:\TC\src\lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	call	next_token	 ;
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movdqu	8(%rbx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 8B], vect__3.200
	movdqu	24(%rbx), %xmm1	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], tmp105
 ; D:\TC\src\lexer.c:239:     lexer->position = saved_position;
	movq	%rsi, 8(%rbx)	 ; saved_position, lexer_9(D)->position
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	 ; lexer_9(D)->column, lexer_9(D)->column
 ; D:\TC\src\lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	 ; <retval>, lexer_9(D)->current_token
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm1, %xmm0	 ; tmp105, vect__3.200
 ; D:\TC\src\lexer.c:242:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	 ; <retval>, lexer_9(D)->peeked_token
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	 ; lexer_9(D)->column, lexer_9(D)->peeked_column
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 48(%rbx)	 ; vect__3.200, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 48B]
 ; D:\TC\src\lexer.c:240:     lexer->line = saved_line;
	movups	%xmm6, 24(%rbx)	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_9(D) + 24B]
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

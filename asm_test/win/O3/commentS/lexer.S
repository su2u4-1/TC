	.file	"lexer.c"
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
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movl	%edx, %r12d	 ; tmp556, skip_comment
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp555, lexer
	subq	$48, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rcx), %r14	 ; lexer_211(D)->position, _215
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rdx	 ; lexer_211(D)->length, _212
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	32(%rcx), %r13	 ; lexer_211(D)->column, prephitmp_748
 ; D:/TC/src/lexer.c:59: static Token* next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 48(%rsp)	 ;,
	movaps	%xmm7, 64(%rsp)	 ;,
	movaps	%xmm8, 80(%rsp)	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r14	 ; _212, _215
	jnb	.L2	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	leaq	1(%r13), %rsi	 ;, _251
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%r14), %rdi	 ;, ivtmp.170
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rcx)	 ; _251, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rcx), %rcx	 ; lexer_211(D)->source, _242
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	 ; ivtmp.170, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	(%rcx,%r14), %r9	 ;, _244
	movzbl	(%r9), %eax	 ; *_244, _245
	cmpb	$32, %al	 ;, _245
	ja	.L3	 ;,
	leaq	.L5(%rip), %r10	 ;, tmp342
	movzbl	%al, %r8d	 ; _245, _245
	movslq	(%r10,%r8,4), %r8	 ;, tmp344
	addq	%r10, %r8	 ; tmp342, tmp345
	jmp	*%r8	 ; tmp345
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
	.long	.L207-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.long	.L3-.L5
	.long	.L207-.L5
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
	.long	.L207-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%rsi, %r13	 ; _251, prephitmp_748
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, lexer_211(D)->line
	movq	%r13, %xmm1	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm1, %xmm6	 ; prephitmp_748, tmp347
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$0, 24(%rax)	 ;, token_246->type
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	$0, (%rax)	 ;, token_246->lexeme
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp347,
.L1:
 ; D:/TC/src/lexer.c:215: }
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
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	 ;, lexer_211(D)->line
 ; D:/TC/src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_211(D)->column
.L207:
 ; D:/TC/src/lexer.c:215: }
	movaps	48(%rsp), %xmm6	 ;,
	movaps	64(%rsp), %xmm7	 ;,
 ; D:/TC/src/lexer.c:137:                 return next_token(lexer, skip_comment);
	movsbl	%r12b, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/lexer.c:215: }
	movaps	80(%rsp), %xmm8	 ;,
	leaq	-48(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
 ; D:/TC/src/lexer.c:137:                 return next_token(lexer, skip_comment);
	jmp	next_token	 ;
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$90, %al	 ;, _245
	jg	.L8	 ;,
	cmpb	$64, %al	 ;, _245
	jg	.L9	 ;,
	cmpb	$34, %al	 ;, _245
	je	.L10	 ;,
	leal	-48(%rax), %r8d	 ;, tmp351
	cmpb	$9, %r8b	 ;, tmp351
	ja	.L11	 ;,
	leaq	(%rdx,%r13), %r11	 ;, tmp352
	subq	%r14, %r11	 ; _215, _438
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L209:
 ; D:/TC/src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r10d	 ;, tmp365
	leaq	1(%rdi), %r8	 ;, ivtmp.170
	cmpb	$9, %r10b	 ;, tmp365
	ja	.L22	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _251
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	 ; ivtmp.170, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rdi	 ; ivtmp.170, ivtmp.170
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rbx)	 ; _251, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %eax	 ; MEM[(char *)_242 + -1B + ivtmp.170_434 * 1], _245
.L12:
	cmpq	%rsi, %r11	 ; _251, _438
	jne	.L209	 ;,
 ; D:/TC/src/lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r8d	 ;, tmp366
	cmpb	$9, %r8b	 ;, tmp366
	ja	.L22	 ;,
.L103:
 ; D:/TC/src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %r12d	 ;, type
.L23:
 ; D:/TC/src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _661
 ; D:/TC/src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp371
	movq	%r13, %xmm4	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r9, %rcx	 ; _244,
 ; D:/TC/src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _661, lexer_211(D)->position
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, lexer_211(D)->line
 ; D:/TC/src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rdx	 ; _215, tmp374
 ; D:/TC/src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rsi, 32(%rbx)	 ; tmp371, lexer_211(D)->column
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_748, tmp372
 ; D:/TC/src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp562, _35
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	%r12d, 24(%rax)	 ; type, token_278->type
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _35,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp372,
 ; D:/TC/src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %al	 ;, _245
	jne	.L210	 ;,
.L9:
	movabsq	$288230372997595135, %r8	 ;, tmp554
	addq	%r13, %rdx	 ; prephitmp_748, tmp354
	subq	%r14, %rdx	 ; _215, _408
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L212:
	cmpb	$57, %al	 ;, _245
	jle	.L211	 ;,
	subl	$65, %eax	 ;, _500
	cmpb	$57, %al	 ;, _500
	ja	.L15	 ;,
	btq	%rax, %r8	 ; _500, tmp554
	jnc	.L15	 ;,
.L17:
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rdi	 ;, ivtmp.170
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _251
	movq	%rsi, 32(%rbx)	 ; _251, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	 ; ivtmp.170, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdi), %eax	 ; MEM[(char *)_242 + -1B + _252 * 1], _245
.L14:
	cmpq	%rsi, %rdx	 ; _251, _408
	jne	.L212	 ;,
.L15:
 ; D:/TC/src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _655
 ; D:/TC/src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp359
 ; D:/TC/src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r9, %rcx	 ; _244,
 ; D:/TC/src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _655, lexer_211(D)->position
 ; D:/TC/src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r14, %rdx	 ; _215, tmp360
 ; D:/TC/src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rsi, 32(%rbx)	 ; tmp359, lexer_211(D)->column
 ; D:/TC/src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
 ; D:/TC/src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	 ; tmp558, content
 ; D:/TC/src/lexer.c:75:         if (is_keyword(content))
	call	is_keyword	 ;
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, lexer_211(D)->line
 ; D:/TC/src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	 ; tmp559
	je	.L19	 ;,
	movq	%r13, %xmm2	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm2, %xmm6	 ; prephitmp_748, tmp361
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$6, 24(%rax)	 ;, token_255->type
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp361,
 ; D:/TC/src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L211:
	cmpb	$47, %al	 ;, _245
	jg	.L17	 ;,
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L210:
	leal	-97(%rax), %r8d	 ;, tmp353
	cmpb	$25, %r8b	 ;, tmp353
	jbe	.L9	 ;,
 ; D:/TC/src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L213	 ;,
 ; D:/TC/src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r14), %r9d	 ; *_313, _443
 ; D:/TC/src/lexer.c:109:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _552
.L41:
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, pretmp_186
 ; D:/TC/src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	 ;, _443
	movq	%r13, %xmm0	 ; prephitmp_748, prephitmp_748
	sete	%r8b	 ;, tmp546
	movdqa	%xmm6, %xmm8	 ; pretmp_186, tmp552
	movl	%r8d, %ecx	 ; tmp546, _577
	punpcklqdq	%xmm0, %xmm8	 ; prephitmp_748, tmp552
	movdqa	%xmm8, %xmm7	 ; tmp552, _581
 ; D:/TC/src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, _245
	jne	.L91	 ;,
	testb	%r8b, %r8b	 ; tmp546
	je	.L91	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp435
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp436
 ; D:/TC/src/lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp437
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp435, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp436, lexer_211(D)->position
.L206:
 ; D:/TC/src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	(%rax), %rbx	 ;, LE_SYMBOL.11_100
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; LE_SYMBOL.11_100,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm8, 8(%rax)	 ; tmp552,
 ; D:/TC/src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r13, %xmm3	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_748, tmp363
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$1, 24(%rax)	 ;, token_256->type
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp363,
 ; D:/TC/src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:/TC/src/lexer.c:33:         return '\0';
	xorl	%esi, %esi	 ; _288
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L26	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	leaq	2(%r13), %rax	 ;, tmp375
	movq	%rax, 32(%rbx)	 ; tmp375, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	2(%r14), %rax	 ;, tmp376
	movq	%rax, 8(%rbx)	 ; tmp376, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%r14), %esi	 ; *_281, _288
.L26:
 ; D:/TC/src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp553
	jmp	.L27	 ;
	.p2align 4,,10
	.p2align 3
.L215:
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp377
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	 ; tmp377, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %esi	 ; *_287, _288
.L27:
 ; D:/TC/src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %sil	 ;, _288
	jbe	.L214	 ;,
.L29:
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	 ; lexer_211(D)->position, _283
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _212, _283
	jb	.L215	 ;,
 ; D:/TC/src/lexer.c:33:         return '\0';
	xorl	%esi, %esi	 ; _288
.L28:
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %r12	 ; lexer_211(D)->line, prephitmp_733
 ; D:/TC/src/lexer.c:100:         if (c != '"') {
	cmpb	$34, %sil	 ;, _288
	je	.L30	 ;,
 ; D:/TC/src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	%rdi, %r9	 ; ivtmp.170,
	leaq	1(%r12), %r8	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp385
	movq	24(%rax), %rcx	 ; _666->_stderr, _666->_stderr
	leaq	.LC1(%rip), %rax	 ;, tmp614
	movq	%rax, 32(%rsp)	 ; tmp614,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %sil	 ;, _288
	je	.L31	 ;,
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %r12	 ; lexer_211(D)->line, prephitmp_733
.L30:
 ; D:/TC/src/lexer.c:104:         if (lexer->position - start == 1)
	movq	8(%rbx), %rdx	 ; lexer_211(D)->position, _41
	movq	%r12, %xmm6	 ; prephitmp_733, tmp387
	movq	%r13, %xmm5	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	leaq	.LC2(%rip), %rcx	 ;, tmp389
	punpcklqdq	%xmm5, %xmm6	 ; prephitmp_748, tmp387
 ; D:/TC/src/lexer.c:104:         if (lexer->position - start == 1)
	subq	%rdi, %rdx	 ; ivtmp.170, _41
 ; D:/TC/src/lexer.c:104:         if (lexer->position - start == 1)
	cmpq	$1, %rdx	 ;, _41
	je	.L203	 ;,
 ; D:/TC/src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	(%rbx), %rdi	 ; lexer_211(D)->source, ivtmp.170
 ; D:/TC/src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	$1, %rdx	 ;, tmp390
 ; D:/TC/src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdi, %rcx	 ; ivtmp.170, tmp391
.L203:
 ; D:/TC/src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp567, _48
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$4, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _48,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp387,
 ; D:/TC/src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L214:
 ; D:/TC/src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rsi, %r9	 ; _288, tmp553
	jc	.L29	 ;,
	jmp	.L28	 ;
.L11:
 ; D:/TC/src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, _245
	sete	%r8b	 ;, tmp393
	movl	%r8d, %r10d	 ; tmp393, _552
 ; D:/TC/src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L97	 ;,
 ; D:/TC/src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r14), %r9d	 ; *_293, _443
 ; D:/TC/src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	 ;, _443
	jne	.L35	 ;,
	testb	%r8b, %r8b	 ; tmp393
	je	.L35	 ;,
	addq	%r13, %rdx	 ; prephitmp_748, tmp397
 ; D:/TC/src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %r8d	 ;, _301
	subq	%r14, %rdx	 ; _215, _493
 ; D:/TC/src/lexer.c:112:             while (c != '\n' && c != '\0')
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L216:
 ; D:/TC/src/lexer.c:112:             while (c != '\n' && c != '\0')
	leaq	1(%rdi), %rax	 ;, ivtmp.186
	testb	%r8b, %r8b	 ; _301
	je	.L37	 ;,
	cmpb	$10, %r8b	 ;, _301
	je	.L37	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _251
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	 ; ivtmp.186, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, %rdi	 ; ivtmp.186, ivtmp.170
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rbx)	 ; _251, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rax), %r8d	 ; MEM[(char *)_242 + -1B + ivtmp.186_478 * 1], _301
.L36:
	cmpq	%rdx, %rsi	 ; _493, _251
	jne	.L216	 ;,
.L37:
 ; D:/TC/src/lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _671
 ; D:/TC/src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp402
 ; D:/TC/src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rdx, 8(%rbx)	 ; _671, lexer_211(D)->position
 ; D:/TC/src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	%rsi, 32(%rbx)	 ; tmp402, lexer_211(D)->column
 ; D:/TC/src/lexer.c:115:             if (skip_comment)
	testb	%r12b, %r12b	 ; skip_comment
	jne	.L207	 ;,
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, lexer_211(D)->line
 ; D:/TC/src/lexer.c:110:             size_t start = lexer->position + 1;
	addq	$2, %r14	 ;, start
	movq	%r13, %xmm0	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rdx	 ; start, tmp406
 ; D:/TC/src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r14, %rcx	 ; start, tmp407
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_748, tmp404
.L204:
 ; D:/TC/src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp572, _74
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$7, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _74,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp422,
 ; D:/TC/src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	 ;
.L31:
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	 ; lexer_211(D)->line, tmp615
 ; D:/TC/src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_211(D)->column
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	leaq	1(%rax), %r12	 ;, prephitmp_733
	movq	%r12, 24(%rbx)	 ; prephitmp_733, lexer_211(D)->line
 ; D:/TC/src/lexer.c:47: }
	jmp	.L30	 ;
.L213:
 ; D:/TC/src/lexer.c:109:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _552
.L97:
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, pretmp_186
	movq	%r13, %xmm0	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:40:         return '\0';
	xorl	%r9d, %r9d	 ; _443
 ; D:/TC/src/lexer.c:139:         } else if (c == '=' && p == '=') {
	xorl	%ecx, %ecx	 ; _577
	movdqa	%xmm6, %xmm7	 ; pretmp_186, _581
	punpcklqdq	%xmm0, %xmm7	 ; prephitmp_748, _581
.L34:
 ; D:/TC/src/lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, _245
	jne	.L55	 ;,
	testb	%cl, %cl	 ; _577
	je	.L55	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L56	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp459
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp460
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp459, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp460, lexer_211(D)->position
.L56:
 ; D:/TC/src/lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp462
	movq	%rax, %xmm0	 ; tmp462, tmp462
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp464
	punpcklqdq	%xmm0, %xmm6	 ; tmp462, tmp461
.L205:
 ; D:/TC/src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	(%rax), %rbx	 ;, OR_SYMBOL.19_149
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; OR_SYMBOL.19_149,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp511,
 ; D:/TC/src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	 ;
.L55:
 ; D:/TC/src/lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, _245
	jne	.L57	 ;,
	testb	%cl, %cl	 ; _577
	je	.L57	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L58	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp467
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp468
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp467, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp468, lexer_211(D)->position
.L58:
 ; D:/TC/src/lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp470
	movq	%rax, %xmm0	 ; tmp470, tmp470
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp472
	punpcklqdq	%xmm0, %xmm6	 ; tmp470, tmp469
	jmp	.L205	 ;
.L35:
 ; D:/TC/src/lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	 ;, _443
	jne	.L41	 ;,
	testb	%r8b, %r8b	 ; tmp393
	je	.L41	 ;,
 ; D:/TC/src/lexer.c:119:             size_t start = lexer->position + 1;
	leaq	2(%r14), %rsi	 ;, start
 ; D:/TC/src/lexer.c:108:         char p = peek_next_char(lexer);
	movl	$42, %r8d	 ;, p
 ; D:/TC/src/lexer.c:60:     char c = get_current_char(lexer);
	movl	$47, %eax	 ;, c
	.p2align 4,,10
	.p2align 3
.L42:
 ; D:/TC/src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	jne	.L167	 ;,
	cmpb	$47, %r8b	 ;, p
	je	.L217	 ;,
.L167:
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdi, %rdx	 ; ivtmp.170, _212
	je	.L43	 ;,
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rdi	 ;, ivtmp.170
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rdi, 8(%rbx)	 ; ivtmp.170, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdi), %eax	 ; MEM[(char *)_242 + -1B + _310 * 1], c
 ; D:/TC/src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L218	 ;,
 ; D:/TC/src/lexer.c:41:     return lexer->source[lexer->position];
	movzbl	(%rcx,%rdi), %r8d	 ; MEM[(char *)_242 + _310 * 1], p
 ; D:/TC/src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L47	 ;,
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	addq	$1, 24(%rbx)	 ;, lexer_211(D)->line
 ; D:/TC/src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_211(D)->column
 ; D:/TC/src/lexer.c:125:                 if (p == '\0') break;
	testb	%r8b, %r8b	 ; p
	jne	.L167	 ;,
	jmp	.L201	 ;
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%r8b, %r8b	 ; p
	je	.L45	 ;,
 ; D:/TC/src/lexer.c:126:                 assert(c != '\0');
	testb	%al, %al	 ; c
	jne	.L42	 ;,
 ; D:/TC/src/lexer.c:126:                 assert(c != '\0');
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$126, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp411
	call	__assert_func	 ;
	.p2align 4,,10
	.p2align 3
.L218:
 ; D:/TC/src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L45	 ;,
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	movq	24(%rbx), %rax	 ; lexer_211(D)->line, tmp623
 ; D:/TC/src/lexer.c:46:     lexer->column = 0;
	movq	$0, 32(%rbx)	 ;, lexer_211(D)->column
 ; D:/TC/src/lexer.c:45:     lexer->line++;
	leaq	1(%rax), %rdi	 ;, prephitmp_34
	movq	%rdi, 24(%rbx)	 ; prephitmp_34, lexer_211(D)->line
.L46:
 ; D:/TC/src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	3(%r14), %r9	 ;,
	leaq	1(%rdi), %r8	 ;,
	movq	24(%rax), %rcx	 ; _682->_stderr, _682->_stderr
	leaq	.LC5(%rip), %rax	 ;, tmp624
	leaq	.LC0(%rip), %rdx	 ;, tmp420
	movq	%rax, 32(%rsp)	 ; tmp624,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:131:                 if (skip_comment)
	testb	%r12b, %r12b	 ; skip_comment
	jne	.L207	 ;,
 ; D:/TC/src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rdx	 ; lexer_211(D)->position, tmp424
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, tmp422
	movq	%r13, %xmm0	 ; prephitmp_748, prephitmp_748
	subq	%rsi, %rdx	 ; start, tmp424
 ; D:/TC/src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	(%rbx), %rsi	 ; lexer_211(D)->source, start
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_748, tmp422
	movq	%rsi, %rcx	 ; start, tmp426
	jmp	.L204	 ;
.L217:
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rax	 ; lexer_211(D)->position, prephitmp_16
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _212, prephitmp_16
	jnb	.L95	 ;,
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$1, %rax	 ;, prephitmp_16
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$1, 32(%rbx)	 ;, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%rax, 8(%rbx)	 ; prephitmp_16, lexer_211(D)->position
.L95:
 ; D:/TC/src/lexer.c:136:             if (skip_comment)
	testb	%r12b, %r12b	 ; skip_comment
	jne	.L207	 ;,
	movq	24(%rbx), %xmm6	 ; lexer_211(D)->line, lexer_211(D)->line
	movq	%r13, %xmm0	 ; prephitmp_748, prephitmp_748
 ; D:/TC/src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rsi, %rax	 ; start, tmp431
 ; D:/TC/src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rsi, %rcx	 ; start, tmp434
 ; D:/TC/src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	 ;, tmp433
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_748, tmp429
	jmp	.L204	 ;
.L45:
 ; D:/TC/src/lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	jne	.L201	 ;,
	.p2align 4,,10
	.p2align 3
.L43:
 ; D:/TC/src/lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	$1, 8(%rbx)	 ;, lexer_211(D)->position
 ; D:/TC/src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	$1, 32(%rbx)	 ;, lexer_211(D)->column
.L201:
 ; D:/TC/src/lexer.c:130:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rdi	 ; lexer_211(D)->line, prephitmp_34
 ; D:/TC/src/lexer.c:57: }
	jmp	.L46	 ;
.L57:
 ; D:/TC/src/lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, _245
	jne	.L59	 ;,
	testb	%cl, %cl	 ; _577
	je	.L61	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L60	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp475
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp476
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp475, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp476, lexer_211(D)->position
.L60:
 ; D:/TC/src/lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp478
	movq	%rax, %xmm0	 ; tmp478, tmp478
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp480
	punpcklqdq	%xmm0, %xmm6	 ; tmp478, tmp477
	jmp	.L205	 ;
.L61:
 ; D:/TC/src/lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, _245
	jne	.L63	 ;,
	testb	%cl, %cl	 ; _577
	je	.L63	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L64	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp489
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp490
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp489, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp490, lexer_211(D)->position
.L64:
 ; D:/TC/src/lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp492
	movq	%rax, %xmm0	 ; tmp492, tmp492
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp494
	punpcklqdq	%xmm0, %xmm6	 ; tmp492, tmp491
	jmp	.L205	 ;
.L63:
 ; D:/TC/src/lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, _245
	jne	.L65	 ;,
	cmpb	$38, %r9b	 ;, _443
	jne	.L65	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L66	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp499
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp500
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp499, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp500, lexer_211(D)->position
.L66:
 ; D:/TC/src/lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp502
	movq	%rax, %xmm0	 ; tmp502, tmp502
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp504
	punpcklqdq	%xmm0, %xmm6	 ; tmp502, tmp501
	jmp	.L205	 ;
.L59:
 ; D:/TC/src/lexer.c:160:         } else if (c == '/' && p == '=') {
	testb	%cl, %cl	 ; _577
	je	.L61	 ;,
	testb	%r10b, %r10b	 ; _552
	je	.L61	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L62	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp481
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp482
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp481, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp482, lexer_211(D)->position
.L62:
 ; D:/TC/src/lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp484
	movq	%rax, %xmm0	 ; tmp484, tmp484
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp486
	punpcklqdq	%xmm0, %xmm6	 ; tmp484, tmp483
	jmp	.L205	 ;
.L65:
 ; D:/TC/src/lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, _245
	jne	.L67	 ;,
	cmpb	$124, %r9b	 ;, _443
	jne	.L67	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L68	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp509
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp510
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp509, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp510, lexer_211(D)->position
.L68:
 ; D:/TC/src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp512
	movq	%rax, %xmm0	 ; tmp512, tmp512
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp514
	punpcklqdq	%xmm0, %xmm6	 ; tmp512, tmp511
	jmp	.L205	 ;
.L67:
	subl	$33, %eax	 ;, tmp515
	cmpb	$92, %al	 ;, tmp515
	ja	.L69	 ;,
	leaq	.L71(%rip), %rdx	 ;, tmp517
	movzbl	%al, %eax	 ; tmp515, tmp516
	movslq	(%rdx,%rax,4), %rax	 ;, tmp519
	addq	%rdx, %rax	 ; tmp517, tmp520
	jmp	*%rax	 ; tmp520
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
 ; D:/TC/src/lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, _245
	jne	.L53	 ;,
	testb	%r8b, %r8b	 ; tmp546
	jne	.L219	 ;,
.L53:
 ; D:/TC/src/lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, _245
	jne	.L94	 ;,
	testb	%r8b, %r8b	 ; tmp546
	je	.L94	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp443
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp444
 ; D:/TC/src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp448
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp443, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp444, lexer_211(D)->position
	jmp	.L206	 ;
.L219:
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp440
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp441
 ; D:/TC/src/lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp442
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp440, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp441, lexer_211(D)->position
	jmp	.L206	 ;
.L70:
 ; D:/TC/src/lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp525
.L202:
 ; D:/TC/src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	(%rax), %rbx	 ;, ASSIGN_SYMBOL.38_185
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; ASSIGN_SYMBOL.38_185,* <retval>
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm7, 8(%rax)	 ; _581,
 ; D:/TC/src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	 ;
.L94:
 ; D:/TC/src/lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, _245
	jne	.L34	 ;,
	testb	%r8b, %r8b	 ; tmp546
	je	.L34	 ;,
 ; D:/TC/src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L54	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$2, %r13	 ;, tmp451
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp452
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r13, 32(%rbx)	 ; tmp451, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r14, 8(%rbx)	 ; tmp452, lexer_211(D)->position
.L54:
 ; D:/TC/src/lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_211(D)->column, lexer_211(D)->column
	subq	$2, %rax	 ;, tmp454
	movq	%rax, %xmm0	 ; tmp454, tmp454
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp456
	punpcklqdq	%xmm0, %xmm6	 ; tmp454, tmp453
	jmp	.L205	 ;
.L72:
 ; D:/TC/src/lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp524
	jmp	.L202	 ;
.L73:
 ; D:/TC/src/lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp530
	jmp	.L202	 ;
.L74:
 ; D:/TC/src/lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp529
	jmp	.L202	 ;
.L75:
 ; D:/TC/src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp538
	jmp	.L202	 ;
.L76:
 ; D:/TC/src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp539
	jmp	.L202	 ;
.L77:
 ; D:/TC/src/lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp537
	jmp	.L202	 ;
.L78:
 ; D:/TC/src/lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp531
	jmp	.L202	 ;
.L79:
 ; D:/TC/src/lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp535
	jmp	.L202	 ;
.L80:
 ; D:/TC/src/lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp528
	jmp	.L202	 ;
.L81:
 ; D:/TC/src/lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp533
	jmp	.L202	 ;
.L82:
 ; D:/TC/src/lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp526
	jmp	.L202	 ;
.L83:
 ; D:/TC/src/lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp532
	jmp	.L202	 ;
.L84:
 ; D:/TC/src/lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp534
	jmp	.L202	 ;
.L85:
 ; D:/TC/src/lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp523
	jmp	.L202	 ;
.L86:
 ; D:/TC/src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp522
	jmp	.L202	 ;
.L87:
 ; D:/TC/src/lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp536
	jmp	.L202	 ;
.L88:
 ; D:/TC/src/lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp527
	jmp	.L202	 ;
.L69:
 ; D:/TC/src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	.LC0(%rip), %rdx	 ;, tmp543
	movq	%rsi, %r9	 ; _251,
	movq	24(%rax), %rcx	 ; _686->_stderr, _686->_stderr
	leaq	.LC6(%rip), %rax	 ;, tmp638
	movq	%rax, 32(%rsp)	 ; tmp638,
	movq	%xmm6, %rax	 ; pretmp_186, pretmp_186
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:20:     token->type = type;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/lexer.c:22:     token->line = line;
	pxor	%xmm0, %xmm0	 ; tmp544
 ; D:/TC/src/lexer.c:20:     token->type = type;
	movl	%edx, 24(%rax)	 ;, token_389->type
 ; D:/TC/src/lexer.c:21:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	 ;, token_389->lexeme
 ; D:/TC/src/lexer.c:22:     token->line = line;
	movups	%xmm0, 8(%rax)	 ; tmp544, MEM <vector(2) long unsigned int> [(long unsigned int *)token_389 + 8B]
 ; D:/TC/src/lexer.c:212:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	.L1	 ;
.L22:
 ; D:/TC/src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _212, ivtmp.170
	jnb	.L103	 ;,
 ; D:/TC/src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, _245
	jne	.L103	 ;,
 ; D:/TC/src/lexer.c:41:     return lexer->source[lexer->position];
	leaq	(%rcx,%rdi), %r8	 ;, _264
 ; D:/TC/src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%r8), %eax	 ; *_264, tmp612
	subl	$48, %eax	 ;, tmp367
 ; D:/TC/src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp367
	ja	.L103	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	leaq	1(%rsi), %r10	 ;, _268
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rdi), %r11	 ;, _269
	addq	%rsi, %rdx	 ; _251, tmp369
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%r10, 32(%rbx)	 ; _268, lexer_211(D)->column
	subq	%rdi, %rdx	 ; ivtmp.170, _423
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r10, %rsi	 ; _268, _251
	movq	%r11, %rdi	 ; _269, ivtmp.170
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r11, 8(%rbx)	 ; _269, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	(%r8), %eax	 ; *_264, _277
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L220:
 ; D:/TC/src/lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp370
	leaq	1(%rdi), %r8	 ;, ivtmp.150
	cmpb	$9, %al	 ;, tmp370
	ja	.L104	 ;,
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	addq	$1, %rsi	 ;, _251
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rbx)	 ; ivtmp.150, lexer_211(D)->position
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, %rdi	 ; ivtmp.150, ivtmp.170
 ; D:/TC/src/lexer.c:34:     lexer->column++;
	movq	%rsi, 32(%rbx)	 ; _251, lexer_211(D)->column
 ; D:/TC/src/lexer.c:35:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %eax	 ; MEM[(char *)_242 + -1B + ivtmp.150_645 * 1], _277
.L24:
	cmpq	%rsi, %rdx	 ; _251, _423
	jne	.L220	 ;,
.L104:
 ; D:/TC/src/lexer.c:90:             type = FLOAT;
	movl	$3, %r12d	 ;, type
	jmp	.L23	 ;
	.p2align 4
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp87, source
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %ecx	 ;,
 ; D:/TC/src/lexer.c:3: Lexer* create_lexer(string source, size_t length) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp88, length
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	pxor	%xmm0, %xmm0	 ; tmp85
 ; D:/TC/src/lexer.c:5:     lexer->source = source;
	movq	%rsi, (%rax)	 ; source, lexer_3->source
 ; D:/TC/src/lexer.c:6:     lexer->position = 0;
	movq	$0, 8(%rax)	 ;, lexer_3->position
 ; D:/TC/src/lexer.c:7:     lexer->length = length;
	movq	%rbx, 16(%rax)	 ; length, lexer_3->length
 ; D:/TC/src/lexer.c:8:     lexer->line = 0;
	movq	$0, 24(%rax)	 ;, lexer_3->line
 ; D:/TC/src/lexer.c:9:     lexer->column = 0;
	movq	$0, 32(%rax)	 ;, lexer_3->column
 ; D:/TC/src/lexer.c:10:     lexer->peeked_token = NULL;
	movq	$0, 40(%rax)	 ;, lexer_3->peeked_token
 ; D:/TC/src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 64(%rax)	 ;, lexer_3->peeked_column
 ; D:/TC/src/lexer.c:14:     lexer->current_token = NULL;
	movq	$0, 72(%rax)	 ;, lexer_3->current_token
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rax)	 ; tmp85, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_3 + 48B]
 ; D:/TC/src/lexer.c:16: }
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
 ; D:/TC/src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	movq	40(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L224	 ;,
 ; D:/TC/src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	48(%rcx), %rdx	 ; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
 ; D:/TC/src/lexer.c:228: }
	movq	-8(%rbp), %rbx	 ;,
 ; D:/TC/src/lexer.c:219:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rcx)	 ; <retval>, lexer_8(D)->current_token
 ; D:/TC/src/lexer.c:221:         lexer->line = lexer->peeked_line;
	movdqu	56(%rcx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 56B], tmp97
 ; D:/TC/src/lexer.c:223:         lexer->peeked_token = 0;
	movq	$0, 40(%rcx)	 ;, lexer_8(D)->peeked_token
 ; D:/TC/src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	%rdx, 8(%rcx)	 ; lexer_8(D)->peeked_position, lexer_8(D)->position
 ; D:/TC/src/lexer.c:221:         lexer->line = lexer->peeked_line;
	movups	%xmm0, 24(%rcx)	 ; tmp97, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
 ; D:/TC/src/lexer.c:228: }
	leave	
	ret	
	.p2align 4,,10
	.p2align 3
.L224:
 ; D:/TC/src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; D:/TC/src/lexer.c:227:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	 ; <retval>, lexer_8(D)->current_token
 ; D:/TC/src/lexer.c:228: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.p2align 4
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
 ; D:/TC/src/lexer.c:231:     if (lexer->peeked_token != NULL)
	movq	40(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:231:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L233	 ;,
 ; D:/TC/src/lexer.c:245: }
	ret	
	.p2align 4,,10
	.p2align 3
.L233:
 ; D:/TC/src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	 ;
 ; D:/TC/src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
 ; D:/TC/src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp100, lexer
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/lexer.c:233:     size_t saved_position = lexer->position;
	movq	8(%rcx), %rsi	 ; lexer_8(D)->position, saved_position
 ; D:/TC/src/lexer.c:230: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/lexer.c:234:     size_t saved_line = lexer->line;
	movdqu	24(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
 ; D:/TC/src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	call	next_token	 ;
 ; D:/TC/src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movdqu	8(%rbx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 8B], vect__2.235
	movdqu	24(%rbx), %xmm1	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], tmp105
 ; D:/TC/src/lexer.c:240:     lexer->position = saved_position;
	movq	%rsi, 8(%rbx)	 ; saved_position, lexer_8(D)->position
 ; D:/TC/src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	 ; lexer_8(D)->column, lexer_8(D)->column
 ; D:/TC/src/lexer.c:227:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	 ; <retval>, lexer_8(D)->current_token
 ; D:/TC/src/lexer.c:237:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm1, %xmm0	 ; tmp105, vect__2.235
 ; D:/TC/src/lexer.c:243:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	 ; <retval>, lexer_8(D)->peeked_token
 ; D:/TC/src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	 ; lexer_8(D)->column, lexer_8(D)->peeked_column
 ; D:/TC/src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 48(%rbx)	 ; vect__2.235, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 48B]
 ; D:/TC/src/lexer.c:241:     lexer->line = saved_line;
	movups	%xmm6, 24(%rbx)	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 24B]
 ; D:/TC/src/lexer.c:245: }
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
 ; D:/TC/src/lexer.c:248:     return lexer->current_token;
	movq	72(%rcx), %rax	 ; lexer_2(D)->current_token, lexer_2(D)->current_token
 ; D:/TC/src/lexer.c:249: }
	ret	
	.p2align 4
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	pushq	%rbp	 ;
 ; D:/TC/src/lexer.c:253:     lexer->line = 0;
	pxor	%xmm0, %xmm0	 ; tmp83
 ; D:/TC/src/lexer.c:252:     lexer->position = 0;
	movq	$0, 8(%rcx)	 ;, lexer_2(D)->position
 ; D:/TC/src/lexer.c:255:     lexer->peeked_token = NULL;
	movq	$0, 40(%rcx)	 ;, lexer_2(D)->peeked_token
 ; D:/TC/src/lexer.c:251: void reset_lexer(Lexer* lexer) {
	movq	%rsp, %rbp	 ;,
 ; D:/TC/src/lexer.c:258:     lexer->peeked_column = 0;
	movq	$0, 64(%rcx)	 ;, lexer_2(D)->peeked_column
 ; D:/TC/src/lexer.c:251: void reset_lexer(Lexer* lexer) {
	andq	$-16, %rsp	 ;,
 ; D:/TC/src/lexer.c:259:     lexer->current_token = NULL;
	movq	$0, 72(%rcx)	 ;, lexer_2(D)->current_token
 ; D:/TC/src/lexer.c:253:     lexer->line = 0;
	movups	%xmm0, 24(%rcx)	 ; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 24B]
 ; D:/TC/src/lexer.c:256:     lexer->peeked_position = 0;
	movups	%xmm0, 48(%rcx)	 ; tmp83, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_2(D) + 48B]
 ; D:/TC/src/lexer.c:260: }
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

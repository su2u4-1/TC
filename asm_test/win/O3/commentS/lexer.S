	.file	"lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
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
	pushq	%r13	 ;
	pushq	%r12	 ;
	movl	%edx, %r12d	 ; tmp559, skip_comment
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp558, lexer
	subq	$48, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %r14	 ; lexer_214(D)->position, _218
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	24(%rcx), %rdx	 ; lexer_214(D)->length, _215
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	40(%rcx), %r13	 ; lexer_214(D)->column, prephitmp_751
 ; D:/TC/src/lexer.c:60: static Token* next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 48(%rsp)	 ;,
	movaps	%xmm7, 64(%rsp)	 ;,
	movaps	%xmm8, 80(%rsp)	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %r14	 ; _215, _218
	jnb	.L2	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	1(%r13), %rsi	 ;, _254
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%r14), %rdi	 ;, ivtmp.170
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rsi, 40(%rcx)	 ; _254, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rcx), %rcx	 ; lexer_214(D)->source, _245
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	 ; ivtmp.170, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	(%rcx,%r14), %r9	 ;, _247
	movzbl	(%r9), %eax	 ; *_247, _248
	cmpb	$32, %al	 ;, _248
	ja	.L3	 ;,
	leaq	.L5(%rip), %r10	 ;, tmp345
	movzbl	%al, %r8d	 ; _248, _248
	movslq	(%r10,%r8,4), %r8	 ;, tmp347
	addq	%r10, %r8	 ; tmp345, tmp348
	jmp	*%r8	 ; tmp348
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
	movq	%rsi, %r13	 ; _254, prephitmp_751
	.p2align 4,,10
	.p2align 3
.L2:
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, lexer_214(D)->line
	movq	%r13, %xmm1	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm1, %xmm6	 ; prephitmp_751, tmp350
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$0, 24(%rax)	 ;, token_249->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	$0, (%rax)	 ;, token_249->lexeme
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp350,
.L1:
 ; D:/TC/src/lexer.c:216: }
	movaps	48(%rsp), %xmm6	 ;,
	movaps	64(%rsp), %xmm7	 ;,
	movaps	80(%rsp), %xmm8	 ;,
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
.L6:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	 ;, lexer_214(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_214(D)->column
.L207:
 ; D:/TC/src/lexer.c:216: }
	movaps	48(%rsp), %xmm6	 ;,
	movaps	64(%rsp), %xmm7	 ;,
 ; D:/TC/src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	%r12b, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/lexer.c:216: }
	movaps	80(%rsp), %xmm8	 ;,
	leaq	-56(%rbp), %rsp	 ;,
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
.L3:
	cmpb	$90, %al	 ;, _248
	jg	.L8	 ;,
	cmpb	$64, %al	 ;, _248
	jg	.L9	 ;,
	cmpb	$34, %al	 ;, _248
	je	.L10	 ;,
	leal	-48(%rax), %r8d	 ;, tmp354
	cmpb	$9, %r8b	 ;, tmp354
	ja	.L11	 ;,
	leaq	(%rdx,%r13), %r11	 ;, tmp355
	subq	%r14, %r11	 ; _218, _441
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L209:
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r10d	 ;, tmp368
	leaq	1(%rdi), %r8	 ;, ivtmp.170
	cmpb	$9, %r10b	 ;, tmp368
	ja	.L22	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rsi	 ;, _254
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, 16(%rbx)	 ; ivtmp.170, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, %rdi	 ; ivtmp.170, ivtmp.170
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rsi, 40(%rbx)	 ; _254, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %eax	 ; MEM[(char *)_245 + -1B + ivtmp.170_437 * 1], _248
.L12:
	cmpq	%rsi, %r11	 ; _254, _441
	jne	.L209	 ;,
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %r8d	 ;, tmp369
	cmpb	$9, %r8b	 ;, tmp369
	ja	.L22	 ;,
.L103:
 ; D:/TC/src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r12d	 ;, type
.L23:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _664
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp374
	movq	%r13, %xmm4	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r9, %rcx	 ; _247,
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rdx, 16(%rbx)	 ; _664, lexer_214(D)->position
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, lexer_214(D)->line
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rdx	 ; _218, tmp377
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rsi, 40(%rbx)	 ; tmp374, lexer_214(D)->column
	punpcklqdq	%xmm4, %xmm6	 ; prephitmp_751, tmp375
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp565, _35
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	%r12d, 24(%rax)	 ; type, token_281->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _35,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp375,
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %al	 ;, _248
	jne	.L210	 ;,
.L9:
	movabsq	$288230372997595135, %r8	 ;, tmp557
	addq	%r13, %rdx	 ; prephitmp_751, tmp357
	subq	%r14, %rdx	 ; _218, _411
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L212:
	cmpb	$57, %al	 ;, _248
	jle	.L211	 ;,
	subl	$65, %eax	 ;, _503
	cmpb	$57, %al	 ;, _503
	ja	.L15	 ;,
	btq	%rax, %r8	 ; _503, tmp557
	jnc	.L15	 ;,
.L17:
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rdi	 ;, ivtmp.170
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rsi	 ;, _254
	movq	%rsi, 40(%rbx)	 ; _254, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	 ; ivtmp.170, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdi), %eax	 ; MEM[(char *)_245 + -1B + _255 * 1], _248
.L14:
	cmpq	%rsi, %rdx	 ; _254, _411
	jne	.L212	 ;,
.L15:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _658
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp362
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%r9, %rcx	 ; _247,
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rdx, 16(%rbx)	 ; _658, lexer_214(D)->position
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r14, %rdx	 ; _218, tmp363
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rsi, 40(%rbx)	 ; tmp362, lexer_214(D)->column
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	 ; tmp561, content
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	call	is_keyword	 ;
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, lexer_214(D)->line
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	 ; tmp562
	je	.L19	 ;,
	movq	%r13, %xmm2	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm2, %xmm6	 ; prephitmp_751, tmp364
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$6, 24(%rax)	 ;, token_258->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp364,
 ; D:/TC/src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L211:
	cmpb	$47, %al	 ;, _248
	jg	.L17	 ;,
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L210:
	leal	-97(%rax), %r8d	 ;, tmp356
	cmpb	$25, %r8b	 ;, tmp356
	jbe	.L9	 ;,
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L213	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r14), %r9d	 ; *_316, _446
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _555
.L41:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, pretmp_189
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	 ;, _446
	movq	%r13, %xmm0	 ; prephitmp_751, prephitmp_751
	sete	%r8b	 ;, tmp549
	movdqa	%xmm6, %xmm8	 ; pretmp_189, tmp555
	movl	%r8d, %ecx	 ; tmp549, _580
	punpcklqdq	%xmm0, %xmm8	 ; prephitmp_751, tmp555
	movdqa	%xmm8, %xmm7	 ; tmp555, _584
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, _248
	jne	.L91	 ;,
	testb	%r8b, %r8b	 ; tmp549
	je	.L91	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp438
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp439
 ; D:/TC/src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp440
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp438, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp439, lexer_214(D)->position
.L206:
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	(%rax), %rbx	 ;, LE_SYMBOL.11_102
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; LE_SYMBOL.11_102,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm8, 8(%rax)	 ; tmp555,
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r13, %xmm3	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	punpcklqdq	%xmm3, %xmm6	 ; prephitmp_751, tmp366
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$1, 24(%rax)	 ;, token_259->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	 ; content,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp366,
 ; D:/TC/src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:/TC/src/lexer.c:34:         return '\0';
	xorl	%esi, %esi	 ; _291
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L26	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	2(%r13), %rax	 ;, tmp378
	movq	%rax, 40(%rbx)	 ; tmp378, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	2(%r14), %rax	 ;, tmp379
	movq	%rax, 16(%rbx)	 ; tmp379, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	1(%rcx,%r14), %esi	 ; *_284, _291
.L26:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp556
	jmp	.L27	 ;
	.p2align 4,,10
	.p2align 3
.L215:
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp380
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	 ;, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, 16(%rbx)	 ; tmp380, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rcx,%rax), %esi	 ; *_290, _291
.L27:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %sil	 ;, _291
	jbe	.L214	 ;,
.L29:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	 ; lexer_214(D)->position, _286
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _215, _286
	jb	.L215	 ;,
 ; D:/TC/src/lexer.c:34:         return '\0';
	xorl	%esi, %esi	 ; _291
.L28:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %r12	 ; lexer_214(D)->line, prephitmp_736
 ; D:/TC/src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %sil	 ;, _291
	je	.L30	 ;,
 ; D:/TC/src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	(%rbx), %r14	 ; lexer_214(D)->filename, _39
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	leaq	1(%r12), %r9	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp388
	movq	24(%rax), %rcx	 ; _669->_stderr, _669->_stderr
	leaq	.LC1(%rip), %rax	 ;, tmp617
	movq	%rdi, 32(%rsp)	 ; ivtmp.170,
	movq	%r14, %r8	 ; _39,
	movq	%rax, 40(%rsp)	 ; tmp617,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, %sil	 ;, _291
	je	.L31	 ;,
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %r12	 ; lexer_214(D)->line, prephitmp_736
.L30:
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rdx	 ; lexer_214(D)->position, _42
	movq	%r12, %xmm6	 ; prephitmp_736, tmp390
	movq	%r13, %xmm5	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	leaq	.LC2(%rip), %rcx	 ;, tmp392
	punpcklqdq	%xmm5, %xmm6	 ; prephitmp_751, tmp390
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	subq	%rdi, %rdx	 ; ivtmp.170, _42
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rdx	 ;, _42
	je	.L203	 ;,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	8(%rbx), %rdi	 ; lexer_214(D)->source, ivtmp.170
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	$1, %rdx	 ;, tmp393
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdi, %rcx	 ; ivtmp.170, tmp394
.L203:
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp570, _49
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$4, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _49,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp390,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L214:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rsi, %r9	 ; _291, tmp556
	jc	.L29	 ;,
	jmp	.L28	 ;
.L11:
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, _248
	sete	%r8b	 ;, tmp396
	movl	%r8d, %r10d	 ; tmp396, _555
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L97	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%rcx,%r14), %r9d	 ; *_296, _446
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	 ;, _446
	jne	.L35	 ;,
	testb	%r8b, %r8b	 ; tmp396
	je	.L35	 ;,
	addq	%r13, %rdx	 ; prephitmp_751, tmp400
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %r8d	 ;, _304
	subq	%r14, %rdx	 ; _218, _496
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L216:
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	leaq	1(%rdi), %rax	 ;, ivtmp.186
	testb	%r8b, %r8b	 ; _304
	je	.L37	 ;,
	cmpb	$10, %r8b	 ;, _304
	je	.L37	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rsi	 ;, _254
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, 16(%rbx)	 ; ivtmp.186, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, %rdi	 ; ivtmp.186, ivtmp.170
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rsi, 40(%rbx)	 ; _254, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rax), %r8d	 ; MEM[(char *)_245 + -1B + ivtmp.186_481 * 1], _304
.L36:
	cmpq	%rdx, %rsi	 ; _496, _254
	jne	.L216	 ;,
.L37:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdi), %rdx	 ;, _674
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rsi	 ;, tmp405
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rdx, 16(%rbx)	 ; _674, lexer_214(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rsi, 40(%rbx)	 ; tmp405, lexer_214(D)->column
 ; D:/TC/src/lexer.c:116:             if (skip_comment)
	testb	%r12b, %r12b	 ; skip_comment
	jne	.L207	 ;,
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, lexer_214(D)->line
 ; D:/TC/src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$2, %r14	 ;, start
	movq	%r13, %xmm0	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rdx	 ; start, tmp409
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r14, %rcx	 ; start, tmp410
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_751, tmp407
.L204:
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	 ; tmp575, _76
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$7, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; _76,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp425,
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	 ;
.L31:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	 ; lexer_214(D)->line, tmp618
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_214(D)->column
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	leaq	1(%rax), %r12	 ;, prephitmp_736
	movq	%r12, 32(%rbx)	 ; prephitmp_736, lexer_214(D)->line
 ; D:/TC/src/lexer.c:48: }
	jmp	.L30	 ;
.L213:
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	 ; _555
.L97:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, pretmp_189
	movq	%r13, %xmm0	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:41:         return '\0';
	xorl	%r9d, %r9d	 ; _446
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	xorl	%ecx, %ecx	 ; _580
	movdqa	%xmm6, %xmm7	 ; pretmp_189, _584
	punpcklqdq	%xmm0, %xmm7	 ; prephitmp_751, _584
.L34:
 ; D:/TC/src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, _248
	jne	.L55	 ;,
	testb	%cl, %cl	 ; _580
	je	.L55	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L56	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp462
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp463
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp462, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp463, lexer_214(D)->position
.L56:
 ; D:/TC/src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp465
	movq	%rax, %xmm0	 ; tmp465, tmp465
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp467
	punpcklqdq	%xmm0, %xmm6	 ; tmp465, tmp464
.L205:
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	(%rax), %rbx	 ;, OR_SYMBOL.19_151
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; OR_SYMBOL.19_151,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	 ; tmp514,
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	 ;
.L55:
 ; D:/TC/src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, _248
	jne	.L57	 ;,
	testb	%cl, %cl	 ; _580
	je	.L57	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L58	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp470
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp471
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp470, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp471, lexer_214(D)->position
.L58:
 ; D:/TC/src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp473
	movq	%rax, %xmm0	 ; tmp473, tmp473
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp475
	punpcklqdq	%xmm0, %xmm6	 ; tmp473, tmp472
	jmp	.L205	 ;
.L35:
 ; D:/TC/src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	 ;, _446
	jne	.L41	 ;,
	testb	%r8b, %r8b	 ; tmp396
	je	.L41	 ;,
 ; D:/TC/src/lexer.c:120:             size_t start = lexer->position + 1;
	leaq	2(%r14), %rsi	 ;, start
 ; D:/TC/src/lexer.c:109:         char p = peek_next_char(lexer);
	movl	$42, %r8d	 ;, p
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %eax	 ;, c
	.p2align 4,,10
	.p2align 3
.L42:
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	jne	.L167	 ;,
	cmpb	$47, %r8b	 ;, p
	je	.L217	 ;,
.L167:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdi, %rdx	 ; ivtmp.170, _215
	je	.L43	 ;,
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rdi	 ;, ivtmp.170
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	 ;, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	 ; ivtmp.170, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%rdi), %eax	 ; MEM[(char *)_245 + -1B + _313 * 1], c
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L218	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	(%rcx,%rdi), %r8d	 ; MEM[(char *)_245 + _313 * 1], p
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L47	 ;,
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	 ;, lexer_214(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_214(D)->column
 ; D:/TC/src/lexer.c:126:                 if (p == '\0') break;
	testb	%r8b, %r8b	 ; p
	jne	.L167	 ;,
	jmp	.L201	 ;
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%r8b, %r8b	 ; p
	je	.L45	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	testb	%al, %al	 ; c
	jne	.L42	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$127, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp414
	call	__assert_func	 ;
	.p2align 4,,10
	.p2align 3
.L218:
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L45	 ;,
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	 ; lexer_214(D)->line, tmp626
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_214(D)->column
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	leaq	1(%rax), %rdi	 ;, prephitmp_34
	movq	%rdi, 32(%rbx)	 ; prephitmp_34, lexer_214(D)->line
.L46:
 ; D:/TC/src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	(%rbx), %r15	 ; lexer_214(D)->filename, _68
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	addq	$3, %r14	 ;, tmp422
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	leaq	1(%rdi), %r9	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp423
	movq	24(%rax), %rcx	 ; _685->_stderr, _685->_stderr
	leaq	.LC5(%rip), %rax	 ;, tmp627
	movq	%r14, 32(%rsp)	 ; tmp422,
	movq	%r15, %r8	 ; _68,
	movq	%rax, 40(%rsp)	 ; tmp627,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:132:                 if (skip_comment)
	testb	%r12b, %r12b	 ; skip_comment
	jne	.L207	 ;,
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbx), %rdx	 ; lexer_214(D)->position, tmp427
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, tmp425
	movq	%r13, %xmm0	 ; prephitmp_751, prephitmp_751
	subq	%rsi, %rdx	 ; start, tmp427
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	8(%rbx), %rsi	 ; lexer_214(D)->source, start
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_751, tmp425
	movq	%rsi, %rcx	 ; start, tmp429
	jmp	.L204	 ;
.L217:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	 ; lexer_214(D)->position, prephitmp_16
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rax	 ; _215, prephitmp_16
	jnb	.L95	 ;,
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rax	 ;, prephitmp_16
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	 ;, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, 16(%rbx)	 ; prephitmp_16, lexer_214(D)->position
.L95:
 ; D:/TC/src/lexer.c:137:             if (skip_comment)
	testb	%r12b, %r12b	 ; skip_comment
	jne	.L207	 ;,
	movq	32(%rbx), %xmm6	 ; lexer_214(D)->line, lexer_214(D)->line
	movq	%r13, %xmm0	 ; prephitmp_751, prephitmp_751
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rsi, %rax	 ; start, tmp434
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	%rsi, %rcx	 ; start, tmp437
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	 ;, tmp436
	punpcklqdq	%xmm0, %xmm6	 ; prephitmp_751, tmp432
	jmp	.L204	 ;
.L45:
 ; D:/TC/src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	jne	.L201	 ;,
	.p2align 4,,10
	.p2align 3
.L43:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	$1, 16(%rbx)	 ;, lexer_214(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_214(D)->column
.L201:
 ; D:/TC/src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	32(%rbx), %rdi	 ; lexer_214(D)->line, prephitmp_34
 ; D:/TC/src/lexer.c:58: }
	jmp	.L46	 ;
.L57:
 ; D:/TC/src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, _248
	jne	.L59	 ;,
	testb	%cl, %cl	 ; _580
	je	.L61	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L60	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp478
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp479
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp478, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp479, lexer_214(D)->position
.L60:
 ; D:/TC/src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp481
	movq	%rax, %xmm0	 ; tmp481, tmp481
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp483
	punpcklqdq	%xmm0, %xmm6	 ; tmp481, tmp480
	jmp	.L205	 ;
.L61:
 ; D:/TC/src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, _248
	jne	.L63	 ;,
	testb	%cl, %cl	 ; _580
	je	.L63	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L64	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp492
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp493
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp492, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp493, lexer_214(D)->position
.L64:
 ; D:/TC/src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp495
	movq	%rax, %xmm0	 ; tmp495, tmp495
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp497
	punpcklqdq	%xmm0, %xmm6	 ; tmp495, tmp494
	jmp	.L205	 ;
.L63:
 ; D:/TC/src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, _248
	jne	.L65	 ;,
	cmpb	$38, %r9b	 ;, _446
	jne	.L65	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L66	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp502
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp503
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp502, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp503, lexer_214(D)->position
.L66:
 ; D:/TC/src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp505
	movq	%rax, %xmm0	 ; tmp505, tmp505
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp507
	punpcklqdq	%xmm0, %xmm6	 ; tmp505, tmp504
	jmp	.L205	 ;
.L59:
 ; D:/TC/src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%cl, %cl	 ; _580
	je	.L61	 ;,
	testb	%r10b, %r10b	 ; _555
	je	.L61	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L62	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp484
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp485
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp484, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp485, lexer_214(D)->position
.L62:
 ; D:/TC/src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp487
	movq	%rax, %xmm0	 ; tmp487, tmp487
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp489
	punpcklqdq	%xmm0, %xmm6	 ; tmp487, tmp486
	jmp	.L205	 ;
.L65:
 ; D:/TC/src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, _248
	jne	.L67	 ;,
	cmpb	$124, %r9b	 ;, _446
	jne	.L67	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L68	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp512
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp513
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp512, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp513, lexer_214(D)->position
.L68:
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp515
	movq	%rax, %xmm0	 ; tmp515, tmp515
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp517
	punpcklqdq	%xmm0, %xmm6	 ; tmp515, tmp514
	jmp	.L205	 ;
.L67:
	subl	$33, %eax	 ;, tmp518
	cmpb	$92, %al	 ;, tmp518
	ja	.L69	 ;,
	leaq	.L71(%rip), %rdx	 ;, tmp520
	movzbl	%al, %eax	 ; tmp518, tmp519
	movslq	(%rdx,%rax,4), %rax	 ;, tmp522
	addq	%rdx, %rax	 ; tmp520, tmp523
	jmp	*%rax	 ; tmp523
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
 ; D:/TC/src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, _248
	jne	.L53	 ;,
	testb	%r8b, %r8b	 ; tmp549
	jne	.L219	 ;,
.L53:
 ; D:/TC/src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, _248
	jne	.L94	 ;,
	testb	%r8b, %r8b	 ; tmp549
	je	.L94	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp446
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp447
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp451
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp446, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp447, lexer_214(D)->position
	jmp	.L206	 ;
.L219:
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp443
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp444
 ; D:/TC/src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp445
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp443, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp444, lexer_214(D)->position
	jmp	.L206	 ;
.L70:
 ; D:/TC/src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp528
.L202:
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	(%rax), %rbx	 ;, ASSIGN_SYMBOL.38_187
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	 ;,
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	 ; ASSIGN_SYMBOL.38_187,* <retval>
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm7, 8(%rax)	 ; _584,
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	 ;
.L94:
 ; D:/TC/src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, _248
	jne	.L34	 ;,
	testb	%r8b, %r8b	 ; tmp549
	je	.L34	 ;,
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L54	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$2, %r13	 ;, tmp454
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %r14	 ;, tmp455
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r13, 40(%rbx)	 ; tmp454, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r14, 16(%rbx)	 ; tmp455, lexer_214(D)->position
.L54:
 ; D:/TC/src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_214(D)->column, lexer_214(D)->column
	subq	$2, %rax	 ;, tmp457
	movq	%rax, %xmm0	 ; tmp457, tmp457
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp459
	punpcklqdq	%xmm0, %xmm6	 ; tmp457, tmp456
	jmp	.L205	 ;
.L72:
 ; D:/TC/src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp527
	jmp	.L202	 ;
.L73:
 ; D:/TC/src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp533
	jmp	.L202	 ;
.L74:
 ; D:/TC/src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp532
	jmp	.L202	 ;
.L75:
 ; D:/TC/src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp541
	jmp	.L202	 ;
.L76:
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp542
	jmp	.L202	 ;
.L77:
 ; D:/TC/src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp540
	jmp	.L202	 ;
.L78:
 ; D:/TC/src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp534
	jmp	.L202	 ;
.L79:
 ; D:/TC/src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp538
	jmp	.L202	 ;
.L80:
 ; D:/TC/src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp531
	jmp	.L202	 ;
.L81:
 ; D:/TC/src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp536
	jmp	.L202	 ;
.L82:
 ; D:/TC/src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp529
	jmp	.L202	 ;
.L83:
 ; D:/TC/src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp535
	jmp	.L202	 ;
.L84:
 ; D:/TC/src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp537
	jmp	.L202	 ;
.L85:
 ; D:/TC/src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp526
	jmp	.L202	 ;
.L86:
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp525
	jmp	.L202	 ;
.L87:
 ; D:/TC/src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp539
	jmp	.L202	 ;
.L88:
 ; D:/TC/src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp530
	jmp	.L202	 ;
.L69:
 ; D:/TC/src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	(%rbx), %rbx	 ; lexer_214(D)->filename, _188
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	leaq	.LC0(%rip), %rdx	 ;, tmp546
	movq	24(%rax), %rcx	 ; _689->_stderr, _689->_stderr
	leaq	.LC6(%rip), %rax	 ;, tmp641
	movq	%rsi, 32(%rsp)	 ; _254,
	movq	%rbx, %r8	 ; _188,
	movq	%rax, 40(%rsp)	 ; tmp641,
	movq	%xmm6, %rax	 ; pretmp_189, pretmp_189
	leaq	1(%rax), %r9	 ;,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/lexer.c:23:     token->line = line;
	pxor	%xmm0, %xmm0	 ; tmp547
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	%edx, 24(%rax)	 ;, token_392->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rcx, (%rax)	 ;, token_392->lexeme
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	 ; tmp547, MEM <vector(2) long unsigned int> [(long unsigned int *)token_392 + 8B]
 ; D:/TC/src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	.L1	 ;
.L22:
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdx, %rdi	 ; _215, ivtmp.170
	jnb	.L103	 ;,
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, _248
	jne	.L103	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	leaq	(%rcx,%rdi), %r8	 ;, _267
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%r8), %eax	 ; *_267, tmp615
	subl	$48, %eax	 ;, tmp370
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp370
	ja	.L103	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	1(%rsi), %r10	 ;, _271
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rdi), %r11	 ;, _272
	addq	%rsi, %rdx	 ; _254, tmp372
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%r10, 40(%rbx)	 ; _271, lexer_214(D)->column
	subq	%rdi, %rdx	 ; ivtmp.170, _426
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r10, %rsi	 ; _271, _254
	movq	%r11, %rdi	 ; _272, ivtmp.170
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r11, 16(%rbx)	 ; _272, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%r8), %eax	 ; *_267, _280
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L220:
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp373
	leaq	1(%rdi), %r8	 ;, ivtmp.150
	cmpb	$9, %al	 ;, tmp373
	ja	.L104	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, %rsi	 ;, _254
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, 16(%rbx)	 ; ivtmp.150, lexer_214(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, %rdi	 ; ivtmp.150, ivtmp.170
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	%rsi, 40(%rbx)	 ; _254, lexer_214(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%rcx,%r8), %eax	 ; MEM[(char *)_245 + -1B + ivtmp.150_648 * 1], _280
.L24:
	cmpq	%rsi, %rdx	 ; _254, _426
	jne	.L220	 ;,
.L104:
 ; D:/TC/src/lexer.c:91:             type = FLOAT;
	movl	$3, %r12d	 ;, type
	jmp	.L23	 ;
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
	je	.L224	 ;,
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
.L224:
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
	movq	48(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L233	 ;,
 ; D:/TC/src/lexer.c:246: }
	ret	
	.p2align 4,,10
	.p2align 3
.L233:
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
	movq	16(%rcx), %rsi	 ; lexer_8(D)->position, saved_position
 ; D:/TC/src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/lexer.c:235:     size_t saved_line = lexer->line;
	movdqu	32(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B]
 ; D:/TC/src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	call	next_token	 ;
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movdqu	16(%rbx), %xmm0	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 16B], vect__2.235
	movdqu	32(%rbx), %xmm1	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B], tmp105
 ; D:/TC/src/lexer.c:241:     lexer->position = saved_position;
	movq	%rsi, 16(%rbx)	 ; saved_position, lexer_8(D)->position
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	 ; lexer_8(D)->column, lexer_8(D)->column
 ; D:/TC/src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	 ; <retval>, lexer_8(D)->current_token
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm1, %xmm0	 ; tmp105, vect__2.235
 ; D:/TC/src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	 ; <retval>, lexer_8(D)->peeked_token
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	%rdx, 72(%rbx)	 ; lexer_8(D)->column, lexer_8(D)->peeked_column
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 56(%rbx)	 ; vect__2.235, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 56B]
 ; D:/TC/src/lexer.c:242:     lexer->line = saved_line;
	movups	%xmm6, 32(%rbx)	 ; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B]
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

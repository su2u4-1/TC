	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp530, lexer
	subq	$32, %rsp	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rdi), %rdi	; lexer_214(D)->position, _217
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %rcx	; lexer_214(D)->length, _215
; src/lexer.c:35:     lexer->column++;
	movq	40(%rbx), %r12	; lexer_214(D)->column, prephitmp_745
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rdi	; _215, _217
	jnb	.L2	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rbx), %r8	; lexer_214(D)->source, _242
; src/lexer.c:35:     lexer->column++;
	leaq	1(%r12), %rax	;, _251
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rdi), %rbp	;, ivtmp.172
	movl	%esi, %r13d	; tmp531, skip_comment
; src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	; _251, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	(%r8,%rdi), %r9	;, _244
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; ivtmp.172, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%r9), %edx	; *_244, _245
	cmpb	$32, %dl	;, _245
	ja	.L3	;,
	leaq	.L5(%rip), %r10	;, tmp342
	movzbl	%dl, %esi	; _245, _245
	movslq	(%r10,%rsi,4), %rsi	;, tmp344
	addq	%r10, %rsi	; tmp342, tmp345
	jmp	*%rsi	; tmp345
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
	movq	%rax, %r12	; _251, prephitmp_745
	.p2align 4,,10
	.p2align 3
.L2:
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, lexer_214(D)->line
	movq	%r12, %xmm1	; prephitmp_745, prephitmp_745
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm1, %xmm0	; prephitmp_745, tmp347
	movaps	%xmm0, (%rsp)	; tmp347, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp347
; src/lexer.c:21:     token->type = type;
	movl	$0, 24(%rax)	;, token_246->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	$0, (%rax)	;, token_246->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp347,
.L1:
; src/lexer.c:216: }
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
; src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	;, lexer_214(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_214(D)->column
.L208:
; src/lexer.c:216: }
	addq	$32, %rsp	;,
; src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	%r13b, %esi	; skip_comment, skip_comment
	movq	%rbx, %rdi	; lexer,
; src/lexer.c:216: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/lexer.c:138:                 return next_token(lexer, skip_comment);
	jmp	next_token	;
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$90, %dl	;, _245
	jg	.L8	;,
	cmpb	$64, %dl	;, _245
	jg	.L9	;,
	cmpb	$34, %dl	;, _245
	je	.L10	;,
	leal	-48(%rdx), %esi	;, tmp351
	cmpb	$9, %sil	;, tmp351
	ja	.L11	;,
	leaq	(%rcx,%r12), %r11	;, tmp352
	subq	%rdi, %r11	; _217, _446
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L210:
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rdx), %r10d	;, tmp365
	leaq	1(%rbp), %rsi	;, ivtmp.172
	cmpb	$9, %r10b	;, tmp365
	ja	.L22	;,
; src/lexer.c:35:     lexer->column++;
	addq	$1, %rax	;, _251
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	; ivtmp.172, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, %rbp	; ivtmp.172, ivtmp.172
; src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	; _251, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%r8,%rsi), %edx	; MEM[(char *)_242 + -1B + ivtmp.172_442 * 1], _245
.L12:
	cmpq	%rax, %r11	; _251, _446
	jne	.L210	;,
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rdx), %esi	;, tmp366
	cmpb	$9, %sil	;, tmp366
	ja	.L22	;,
.L103:
; src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r13d	;, type
.L23:
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, lexer_214(D)->line
	movq	%r12, %xmm4	; prephitmp_745, prephitmp_745
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _671
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp371
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rsi, 16(%rbx)	; _671, lexer_214(D)->position
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; _217, tmp374
	movq	%r9, %rdi	; _244,
	punpcklqdq	%xmm4, %xmm0	; prephitmp_745, tmp372
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rax, 40(%rbx)	; tmp371, lexer_214(D)->column
	movaps	%xmm0, (%rsp)	; tmp372, %sfp
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp537, _35
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp372
; src/lexer.c:21:     token->type = type;
	movl	%r13d, 24(%rax)	; type, token_278->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _35,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp372,
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L8:
	cmpb	$95, %dl	;, _245
	jne	.L211	;,
.L9:
	movabsq	$288230372997595135, %rsi	;, tmp529
	addq	%r12, %rcx	; prephitmp_745, tmp354
	subq	%rdi, %rcx	; _217, _415
	jmp	.L14	;
	.p2align 4,,10
	.p2align 3
.L213:
	cmpb	$57, %dl	;, _245
	jle	.L212	;,
	subl	$65, %edx	;, _509
	cmpb	$57, %dl	;, _509
	ja	.L15	;,
	btq	%rdx, %rsi	; _509, tmp529
	jnc	.L15	;,
.L17:
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, ivtmp.172
; src/lexer.c:35:     lexer->column++;
	addq	$1, %rax	;, _251
	movq	%rax, 40(%rbx)	; _251, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; ivtmp.172, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%r8,%rbp), %edx	; MEM[(char *)_242 + -1B + _252 * 1], _245
.L14:
	cmpq	%rax, %rcx	; _251, _415
	jne	.L213	;,
.L15:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _665
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp359
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rsi, 16(%rbx)	; _665, lexer_214(D)->position
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rdi, %rsi	; _217, tmp360
	movq	%r9, %rdi	; _244,
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rax, 40(%rbx)	; tmp359, lexer_214(D)->column
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp533, content
; src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rdi	; content,
	call	*is_keyword@GOTPCREL(%rip)	;
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, lexer_214(D)->line
; src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	; tmp534
	je	.L19	;,
	movq	%r12, %xmm2	; prephitmp_745, prephitmp_745
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm2, %xmm0	; prephitmp_745, tmp361
	movaps	%xmm0, (%rsp)	; tmp361, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp361
; src/lexer.c:21:     token->type = type;
	movl	$6, 24(%rax)	;, token_255->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp361,
; src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L212:
	cmpb	$47, %dl	;, _245
	jg	.L17	;,
	jmp	.L15	;
	.p2align 4,,10
	.p2align 3
.L211:
	leal	-97(%rdx), %esi	;, tmp353
	cmpb	$25, %sil	;, tmp353
	jbe	.L9	;,
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L214	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%r8,%rdi), %r9d	; *_399, _591
; src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _561
.L41:
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, pretmp_189
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %r9b	;, _591
	movq	%r12, %xmm5	; prephitmp_745, prephitmp_745
	sete	%r8b	;, tmp521
	movdqa	%xmm0, %xmm6	; pretmp_189, tmp527
	movl	%r8d, %esi	; tmp521, _585
	punpcklqdq	%xmm5, %xmm6	; prephitmp_745, tmp527
	movaps	%xmm6, 16(%rsp)	; tmp527, %sfp
	movaps	%xmm6, (%rsp)	; tmp527, %sfp
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %dl	;, _245
	jne	.L91	;,
	testb	%r8b, %r8b	; tmp521
	je	.L91	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp439
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp440
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp439, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp440, lexer_214(D)->position
; src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	EQ_SYMBOL(%rip), %rbx	; EQ_SYMBOL, EQ_SYMBOL.9_90
.L204:
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	16(%rsp), %xmm7	; %sfp, tmp527
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; NE_SYMBOL.10_96,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm7, 8(%rax)	; tmp527,
; src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%r12, %xmm3	; prephitmp_745, prephitmp_745
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	punpcklqdq	%xmm3, %xmm0	; prephitmp_745, tmp363
	movaps	%xmm0, (%rsp)	; tmp363, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp363
; src/lexer.c:21:     token->type = type;
	movl	$1, 24(%rax)	;, token_256->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbp, (%rax)	; content,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp363,
; src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L10:
; src/lexer.c:34:         return '\0';
	xorl	%r13d, %r13d	; _288
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L26	;,
; src/lexer.c:35:     lexer->column++;
	leaq	2(%r12), %rax	;, tmp375
	movq	%rax, 40(%rbx)	; tmp375, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	2(%rdi), %rax	;, tmp376
	movq	%rax, 16(%rbx)	; tmp376, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	1(%r8,%rdi), %r13d	; *_281, _288
.L26:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %rsi	;, tmp528
	jmp	.L27	;
	.p2align 4,,10
	.p2align 3
.L216:
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rdx	;, tmp377
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	;, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdx, 16(%rbx)	; tmp377, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%r8,%rax), %r13d	; *_287, _288
.L27:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %r13b	;, _288
	jbe	.L215	;,
.L29:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	; lexer_214(D)->position, _283
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rax	; _215, _283
	jb	.L216	;,
; src/lexer.c:34:         return '\0';
	xorl	%r13d, %r13d	; _288
.L28:
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	; lexer_214(D)->line, prephitmp_730
; src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %r13b	;, _288
	je	.L30	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	movq	(%rbx), %rcx	; lexer_214(D)->filename, lexer_214(D)->filename
	leaq	1(%rax), %r8	;,
	movq	%rbp, %r9	; ivtmp.172,
	leaq	.LC1(%rip), %rdi	;, tmp586
	leaq	.LC0(%rip), %rdx	;, tmp386
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	pushq	%rdi	; tmp586
	movq	stderr(%rip), %rdi	; stderr,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	popq	%r11	;
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	; lexer_214(D)->line, tmp587
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	popq	%r14	;
	cmpb	$10, %r13b	;, _288
	jne	.L30	;,
; src/lexer.c:46:     lexer->line++;
	addq	$1, %rax	;, prephitmp_730
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_214(D)->column
; src/lexer.c:46:     lexer->line++;
	movq	%rax, 32(%rbx)	; prephitmp_730, lexer_214(D)->line
	.p2align 4,,10
	.p2align 3
.L30:
; src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rsi	; lexer_214(D)->position, _42
	movq	%rax, %xmm0	; prephitmp_730, tmp388
	movq	%r12, %xmm5	; prephitmp_745, prephitmp_745
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	leaq	.LC2(%rip), %rdi	;, tmp390
	punpcklqdq	%xmm5, %xmm0	; prephitmp_745, tmp388
; src/lexer.c:105:         if (lexer->position - start == 1)
	subq	%rbp, %rsi	; ivtmp.172, _42
	movaps	%xmm0, (%rsp)	; tmp388, %sfp
; src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rsi	;, _42
	je	.L202	;,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	8(%rbx), %rdi	; lexer_214(D)->source, ivtmp.172
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	$1, %rsi	;, tmp391
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	%rbp, %rdi	; ivtmp.172, ivtmp.172
.L202:
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rbx	; tmp541, _49
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp388
; src/lexer.c:21:     token->type = type;
	movl	$4, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _49,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp388,
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L215:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%r13, %rsi	; _288, tmp528
	jc	.L29	;,
	jmp	.L28	;
.L11:
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %dl	;, _245
	sete	%sil	;, tmp394
	movl	%esi, %r10d	; tmp394, _561
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L97	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	1(%r8,%rdi), %r9d	; *_295, _591
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %r9b	;, _591
	jne	.L35	;,
	testb	%sil, %sil	; tmp394
	je	.L35	;,
	addq	%r12, %rcx	; prephitmp_745, tmp398
; src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %esi	;, _303
	subq	%rdi, %rcx	; _217, _502
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	jmp	.L36	;
	.p2align 4,,10
	.p2align 3
.L217:
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	leaq	1(%rbp), %rdx	;, ivtmp.188
	testb	%sil, %sil	; _303
	je	.L37	;,
	cmpb	$10, %sil	;, _303
	je	.L37	;,
; src/lexer.c:35:     lexer->column++;
	addq	$1, %rax	;, _251
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdx, 16(%rbx)	; ivtmp.188, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdx, %rbp	; ivtmp.188, ivtmp.172
; src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	; _251, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%r8,%rdx), %esi	; MEM[(char *)_242 + -1B + ivtmp.188_487 * 1], _303
.L36:
	cmpq	%rcx, %rax	; _502, _251
	jne	.L217	;,
.L37:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rbp), %rsi	;, _677
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, %rax	;, tmp403
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rsi, 16(%rbx)	; _677, lexer_214(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	%rax, 40(%rbx)	; tmp403, lexer_214(D)->column
; src/lexer.c:116:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L208	;,
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, lexer_214(D)->line
	movq	%r12, %xmm7	; prephitmp_745, prephitmp_745
; src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$2, %rdi	;, start
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rdi, %rsi	; start, tmp407
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r8, %rdi	; _242, tmp408
	punpcklqdq	%xmm7, %xmm0	; prephitmp_745, tmp405
	movaps	%xmm0, (%rsp)	; tmp405, %sfp
.L203:
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	*create_string@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rbx	; tmp545, _76
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp426
; src/lexer.c:21:     token->type = type;
	movl	$7, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; _76,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp426,
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L1	;
.L214:
; src/lexer.c:110:         if (c == '/' && p == '/') {
	xorl	%r10d, %r10d	; _561
.L97:
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, pretmp_189
	movq	%r12, %xmm7	; prephitmp_745, prephitmp_745
; src/lexer.c:41:         return '\0';
	xorl	%r9d, %r9d	; _591
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	xorl	%esi, %esi	; _585
	movdqa	%xmm0, %xmm6	; pretmp_189, _596
	punpcklqdq	%xmm7, %xmm6	; prephitmp_745, _596
	movaps	%xmm6, (%rsp)	; _596, %sfp
.L34:
; src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %dl	;, _245
	jne	.L55	;,
	testb	%sil, %sil	; _585
	je	.L55	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L56	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp459
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp460
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp459, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp460, lexer_214(D)->position
.L56:
; src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	ADD_ASSIGN_SYMBOL(%rip), %rbx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.13_114
	subq	$2, %rax	;, tmp462
	movq	%rax, %xmm6	; tmp462, tmp462
	punpcklqdq	%xmm6, %xmm0	; tmp462, tmp461
	movaps	%xmm0, (%rsp)	; tmp461, %sfp
.L205:
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm0	; %sfp, tmp461
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ADD_ASSIGN_SYMBOL.13_114,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp461,
; src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
.L55:
; src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %dl	;, _245
	jne	.L57	;,
	testb	%sil, %sil	; _585
	je	.L57	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L58	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp466
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp467
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp466, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp467, lexer_214(D)->position
.L58:
; src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	SUB_ASSIGN_SYMBOL(%rip), %rbx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.14_120
	subq	$2, %rax	;, tmp469
	movq	%rax, %xmm7	; tmp469, tmp469
	punpcklqdq	%xmm7, %xmm0	; tmp469, tmp468
	movaps	%xmm0, (%rsp)	; tmp468, %sfp
	jmp	.L205	;
.L35:
; src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %r9b	;, _591
	jne	.L41	;,
	testb	%sil, %sil	; tmp394
	je	.L41	;,
; src/lexer.c:120:             size_t start = lexer->position + 1;
	leaq	2(%rdi), %r14	;, start
; src/lexer.c:109:         char p = peek_next_char(lexer);
	movl	$42, %edx	;, p
; src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %eax	;, c
	.p2align 4,,10
	.p2align 3
.L42:
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	;, c
	jne	.L167	;,
	cmpb	$47, %dl	;, p
	je	.L218	;,
.L167:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rbp, %rcx	; ivtmp.172, _215
	je	.L43	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rbp	;, ivtmp.172
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	;, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rbp, 16(%rbx)	; ivtmp.172, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%r8,%rbp), %eax	; MEM[(char *)_242 + -1B + _312 * 1], c
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L219	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	(%r8,%rbp), %edx	; MEM[(char *)_242 + _312 * 1], p
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L47	;,
; src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	;, lexer_214(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_214(D)->column
; src/lexer.c:126:                 if (p == '\0') break;
	testb	%dl, %dl	; p
	jne	.L167	;,
	jmp	.L201	;
	.p2align 4,,10
	.p2align 3
.L47:
	testb	%dl, %dl	; p
	je	.L45	;,
; src/lexer.c:127:                 assert(c != '\0');
	testb	%al, %al	; c
	jne	.L42	;,
; src/lexer.c:127:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp412
	movl	$127, %edx	;,
	leaq	.LC3(%rip), %rsi	;, tmp413
	leaq	.LC4(%rip), %rdi	;, tmp414
	call	*__assert_fail@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L219:
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	;, c
	jne	.L45	;,
; src/lexer.c:46:     lexer->line++;
	movq	32(%rbx), %rax	; lexer_214(D)->line, tmp595
; src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	;, lexer_214(D)->column
; src/lexer.c:46:     lexer->line++;
	addq	$1, %rax	;, prephitmp_19
	movq	%rax, 32(%rbx)	; prephitmp_19, lexer_214(D)->line
.L46:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	leaq	3(%rdi), %r9	;,
	movq	(%rbx), %rcx	; lexer_214(D)->filename, lexer_214(D)->filename
	leaq	1(%rax), %r8	;,
	leaq	.LC5(%rip), %rdx	;, tmp596
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	pushq	%rdx	; tmp596
	leaq	.LC0(%rip), %rdx	;, tmp424
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:132:                 if (skip_comment)
	popq	%r9	;
	popq	%r10	;
	testb	%r13b, %r13b	; skip_comment
	jne	.L208	;,
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, tmp426
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbx), %rsi	; lexer_214(D)->position, tmp428
	movq	%r12, %xmm7	; prephitmp_745, prephitmp_745
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	8(%rbx), %rdi	; lexer_214(D)->source, start
	punpcklqdq	%xmm7, %xmm0	; prephitmp_745, tmp426
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%r14, %rsi	; start, tmp428
	movaps	%xmm0, (%rsp)	; tmp426, %sfp
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	%r14, %rdi	; start, start
	jmp	.L203	;
.L218:
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rax	; lexer_214(D)->position, prephitmp_16
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rax	; _215, prephitmp_16
	jnb	.L95	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$1, %rax	;, prephitmp_16
; src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rbx)	;, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rax, 16(%rbx)	; prephitmp_16, lexer_214(D)->position
.L95:
; src/lexer.c:137:             if (skip_comment)
	testb	%r13b, %r13b	; skip_comment
	jne	.L208	;,
	movq	32(%rbx), %xmm0	; lexer_214(D)->line, lexer_214(D)->line
	movq	%r12, %xmm7	; prephitmp_745, prephitmp_745
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%r14, %rax	; start, tmp435
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	(%r8,%r14), %rdi	;, tmp438
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rsi	;, tmp437
	punpcklqdq	%xmm7, %xmm0	; prephitmp_745, tmp433
	movaps	%xmm0, (%rsp)	; tmp433, %sfp
	jmp	.L203	;
.L45:
; src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	; c
	jne	.L201	;,
	.p2align 4,,10
	.p2align 3
.L43:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	$1, 16(%rbx)	;, lexer_214(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	;, lexer_214(D)->column
.L201:
; src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	32(%rbx), %rax	; lexer_214(D)->line, prephitmp_19
; src/lexer.c:58: }
	jmp	.L46	;
.L57:
; src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %dl	;, _245
	jne	.L59	;,
	testb	%sil, %sil	; _585
	je	.L61	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L60	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp473
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp474
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp473, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp474, lexer_214(D)->position
.L60:
; src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	MUL_ASSIGN_SYMBOL(%rip), %rbx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.15_126
	subq	$2, %rax	;, tmp476
	movq	%rax, %xmm6	; tmp476, tmp476
	punpcklqdq	%xmm6, %xmm0	; tmp476, tmp475
	movaps	%xmm0, (%rsp)	; tmp475, %sfp
	jmp	.L205	;
.L61:
; src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %dl	;, _245
	jne	.L63	;,
	testb	%sil, %sil	; _585
	je	.L63	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L64	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp485
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp486
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp485, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp486, lexer_214(D)->position
.L64:
; src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	MOD_ASSIGN_SYMBOL(%rip), %rbx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.17_137
	subq	$2, %rax	;, tmp488
	movq	%rax, %xmm6	; tmp488, tmp488
	punpcklqdq	%xmm6, %xmm0	; tmp488, tmp487
	movaps	%xmm0, (%rsp)	; tmp487, %sfp
	jmp	.L205	;
.L63:
; src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %dl	;, _245
	jne	.L65	;,
	cmpb	$38, %r9b	;, _591
	jne	.L65	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L66	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp494
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp495
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp494, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp495, lexer_214(D)->position
.L66:
; src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	AND_SYMBOL(%rip), %rbx	; AND_SYMBOL, AND_SYMBOL.18_144
	subq	$2, %rax	;, tmp497
	movq	%rax, %xmm7	; tmp497, tmp497
	punpcklqdq	%xmm7, %xmm0	; tmp497, tmp496
	movaps	%xmm0, (%rsp)	; tmp496, %sfp
	jmp	.L205	;
.L59:
; src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%sil, %sil	; _585
	je	.L61	;,
	testb	%r10b, %r10b	; _561
	je	.L61	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L62	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp478
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp479
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp478, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp479, lexer_214(D)->position
.L62:
; src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	DIV_ASSIGN_SYMBOL(%rip), %rbx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.16_131
	subq	$2, %rax	;, tmp481
	movq	%rax, %xmm7	; tmp481, tmp481
	punpcklqdq	%xmm7, %xmm0	; tmp481, tmp480
	movaps	%xmm0, (%rsp)	; tmp480, %sfp
	jmp	.L205	;
.L65:
; src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %dl	;, _245
	jne	.L67	;,
	cmpb	$124, %r9b	;, _591
	jne	.L67	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L68	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp503
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp504
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp503, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp504, lexer_214(D)->position
.L68:
; src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	OR_SYMBOL(%rip), %rbx	; OR_SYMBOL, OR_SYMBOL.19_151
	subq	$2, %rax	;, tmp506
	movq	%rax, %xmm6	; tmp506, tmp506
	punpcklqdq	%xmm6, %xmm0	; tmp506, tmp505
	movaps	%xmm0, (%rsp)	; tmp505, %sfp
	jmp	.L205	;
.L67:
	subl	$33, %edx	;, tmp508
	cmpb	$92, %dl	;, tmp508
	ja	.L69	;,
	leaq	.L71(%rip), %rcx	;, tmp510
	movzbl	%dl, %edx	; tmp508, tmp509
	movslq	(%rcx,%rdx,4), %rdx	;, tmp512
	addq	%rcx, %rdx	; tmp510, tmp513
	jmp	*%rdx	; tmp513
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
; src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %dl	;, _245
	jne	.L53	;,
	testb	%r8b, %r8b	; tmp521
	jne	.L220	;,
.L53:
; src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %dl	;, _245
	jne	.L94	;,
	testb	%r8b, %r8b	; tmp521
	je	.L94	;,
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp446
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp445
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp446, lexer_214(D)->position
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp445, lexer_214(D)->column
; src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	LE_SYMBOL(%rip), %rbx	; LE_SYMBOL, LE_SYMBOL.11_102
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	16(%rsp), %xmm6	; %sfp, tmp527
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;, token_333->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; LE_SYMBOL.11_102, token_333->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	; tmp527,
; src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	jmp	.L1	;
.L220:
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp443
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp444
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp443, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp444, lexer_214(D)->position
; src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	NE_SYMBOL(%rip), %rbx	; NE_SYMBOL, NE_SYMBOL.10_96
	jmp	.L204	;
.L70:
; src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACE_SYMBOL(%rip), %rbx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.23_159
.L207:
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm6	; %sfp, _596
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; DIV_SYMBOL.34_179,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm6, 8(%rax)	; _596,
; src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L94:
; src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %dl	;, _245
	jne	.L34	;,
	testb	%r8b, %r8b	; tmp521
	je	.L34	;,
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L54	;,
; src/lexer.c:35:     lexer->column++;
	addq	$2, %r12	;, tmp452
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	$2, %rdi	;, tmp453
; src/lexer.c:35:     lexer->column++;
	movq	%r12, 40(%rbx)	; tmp452, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rdi, 16(%rbx)	; tmp453, lexer_214(D)->position
.L54:
; src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	; lexer_214(D)->column, lexer_214(D)->column
	movq	GE_SYMBOL(%rip), %rbx	; GE_SYMBOL, GE_SYMBOL.12_108
	subq	$2, %rax	;, tmp455
	movq	%rax, %xmm7	; tmp455, tmp455
	punpcklqdq	%xmm7, %xmm0	; tmp455, tmp454
	movaps	%xmm0, (%rsp)	; tmp454, %sfp
	jmp	.L205	;
.L72:
; src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACE_SYMBOL(%rip), %rbx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.22_157
.L206:
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm7	; %sfp, _596
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;,
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; MOD_SYMBOL.35_181,* <retval>
; src/lexer.c:23:     token->line = line;
	movups	%xmm7, 8(%rax)	; _596,
; src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L73:
; src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_BRACKET_SYMBOL(%rip), %rbx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.28_169
	jmp	.L206	;
.L74:
; src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_BRACKET_SYMBOL(%rip), %rbx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.27_167
	jmp	.L207	;
.L75:
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	GT_SYMBOL(%rip), %rbx	; GT_SYMBOL, GT_SYMBOL.37_185
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm3	; %sfp, _596
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;, token_392->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; GT_SYMBOL.37_185, token_392->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm3, 8(%rax)	; _596, MEM <vector(2) long unsigned int> [(long unsigned int *)token_392 + 8B]
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L76:
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	ASSIGN_SYMBOL(%rip), %rbx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_187
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm4	; %sfp, _596
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;, token_393->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; ASSIGN_SYMBOL.38_187, token_393->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm4, 8(%rax)	; _596, MEM <vector(2) long unsigned int> [(long unsigned int *)token_393 + 8B]
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L77:
; src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	LT_SYMBOL(%rip), %rbx	; LT_SYMBOL, LT_SYMBOL.36_183
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:23:     token->line = line;
	movdqa	(%rsp), %xmm2	; %sfp, _596
; src/lexer.c:21:     token->type = type;
	movl	$5, 24(%rax)	;, token_391->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rbx, (%rax)	; LT_SYMBOL.36_183, token_391->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm2, 8(%rax)	; _596, MEM <vector(2) long unsigned int> [(long unsigned int *)token_391 + 8B]
; src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	jmp	.L1	;
.L78:
; src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	SEMICOLON_SYMBOL(%rip), %rbx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.29_171
	jmp	.L207	;
.L79:
; src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	DIV_SYMBOL(%rip), %rbx	; DIV_SYMBOL, DIV_SYMBOL.34_179
	jmp	.L207	;
.L80:
; src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	DOT_SYMBOL(%rip), %rbx	; DOT_SYMBOL, DOT_SYMBOL.26_165
	jmp	.L206	;
.L81:
; src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	SUB_SYMBOL(%rip), %rbx	; SUB_SYMBOL, SUB_SYMBOL.32_175
	jmp	.L207	;
.L82:
; src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	COMMA_SYMBOL(%rip), %rbx	; COMMA_SYMBOL, COMMA_SYMBOL.24_161
	jmp	.L206	;
.L83:
; src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	ADD_SYMBOL(%rip), %rbx	; ADD_SYMBOL, ADD_SYMBOL.31_173
	jmp	.L206	;
.L84:
; src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	MUL_SYMBOL(%rip), %rbx	; MUL_SYMBOL, MUL_SYMBOL.33_177
	jmp	.L206	;
.L85:
; src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	R_PAREN_SYMBOL(%rip), %rbx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.21_155
	jmp	.L207	;
.L86:
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	L_PAREN_SYMBOL(%rip), %rbx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.20_153
	jmp	.L206	;
.L87:
; src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	MOD_SYMBOL(%rip), %rbx	; MOD_SYMBOL, MOD_SYMBOL.35_181
	jmp	.L206	;
.L88:
; src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	NOT_SYMBOL(%rip), %rbx	; NOT_SYMBOL, NOT_SYMBOL.25_163
	jmp	.L207	;
.L69:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rax, %r9	; _251,
	leaq	.LC6(%rip), %rcx	;, tmp631
	movq	%xmm0, %rax	; pretmp_189, pretmp_189
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
	pushq	%rdx	;
	leaq	.LC0(%rip), %rdx	;, tmp518
	pushq	%rcx	; tmp631
	movq	(%rbx), %rcx	; lexer_214(D)->filename,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/lexer.c:21:     token->type = type;
	xorl	%ecx, %ecx	;
; src/lexer.c:22:     token->lexeme = lexeme;
	xorl	%esi, %esi	;
; src/lexer.c:23:     token->line = line;
	pxor	%xmm0, %xmm0	; tmp519
; src/lexer.c:21:     token->type = type;
	movl	%ecx, 24(%rax)	;, token_394->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rsi, (%rax)	;, token_394->lexeme
; src/lexer.c:23:     token->line = line;
	movups	%xmm0, 8(%rax)	; tmp519, MEM <vector(2) long unsigned int> [(long unsigned int *)token_394 + 8B]
; src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	popq	%rdi	;
	popq	%r8	;
	jmp	.L1	;
.L22:
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rcx, %rbp	; _215, ivtmp.172
	jnb	.L103	;,
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %dl	;, _245
	jne	.L103	;,
; src/lexer.c:42:     return lexer->source[lexer->position];
	leaq	(%r8,%rbp), %rsi	;, _264
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rsi), %edx	; *_264, tmp584
	subl	$48, %edx	;, tmp367
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %dl	;, tmp367
	ja	.L103	;,
; src/lexer.c:35:     lexer->column++;
	leaq	1(%rax), %r10	;, _268
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rbp), %r11	;, _269
	addq	%rax, %rcx	; _251, tmp369
; src/lexer.c:35:     lexer->column++;
	movq	%r10, 40(%rbx)	; _268, lexer_214(D)->column
	subq	%rbp, %rcx	; ivtmp.172, _430
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r10, %rax	; _268, _251
	movq	%r11, %rbp	; _269, ivtmp.172
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r11, 16(%rbx)	; _269, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rsi), %edx	; *_264, _277
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L221:
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %edx	;, tmp370
	leaq	1(%rbp), %rsi	;, ivtmp.152
	cmpb	$9, %dl	;, tmp370
	ja	.L104	;,
; src/lexer.c:35:     lexer->column++;
	addq	$1, %rax	;, _251
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, 16(%rbx)	; ivtmp.152, lexer_214(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%rsi, %rbp	; ivtmp.152, ivtmp.172
; src/lexer.c:35:     lexer->column++;
	movq	%rax, 40(%rbx)	; _251, lexer_214(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	-1(%r8,%rsi), %edx	; MEM[(char *)_242 + -1B + ivtmp.152_655 * 1], _277
.L24:
	cmpq	%rax, %rcx	; _251, _430
	jne	.L221	;,
.L104:
; src/lexer.c:91:             type = FLOAT;
	movl	$3, %r13d	;, type
	jmp	.L23	;
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
	je	.L225	;,
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
.L225:
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
	movq	48(%rdi), %rax	; lexer_8(D)->peeked_token, <retval>
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; <retval>
	je	.L234	;,
; src/lexer.c:246: }
	ret	
	.p2align 4,,10
	.p2align 3
.L234:
; src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	;
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%sil, %esi	; skip_comment, skip_comment
; src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp100, lexer
	subq	$24, %rsp	;,
; src/lexer.c:235:     size_t saved_line = lexer->line;
	movdqu	32(%rdi), %xmm1	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B]
; src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rdi), %rbp	; lexer_8(D)->position, saved_position
; src/lexer.c:235:     size_t saved_line = lexer->line;
	movaps	%xmm1, (%rsp)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B], %sfp
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	call	next_token	;
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movdqu	16(%rbx), %xmm0	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 16B], vect__2.237
	movdqu	32(%rbx), %xmm2	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B], tmp105
; src/lexer.c:241:     lexer->position = saved_position;
	movq	%rbp, 16(%rbx)	; saved_position, lexer_8(D)->position
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	; lexer_8(D)->column, lexer_8(D)->column
; src/lexer.c:242:     lexer->line = saved_line;
	movdqa	(%rsp), %xmm1	; %sfp, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B]
; src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	; <retval>, lexer_8(D)->current_token
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	punpcklqdq	%xmm2, %xmm0	; tmp105, vect__2.237
; src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	; <retval>, lexer_8(D)->peeked_token
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	%rdx, 72(%rbx)	; lexer_8(D)->column, lexer_8(D)->peeked_column
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movups	%xmm0, 56(%rbx)	; vect__2.237, MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 56B]
; src/lexer.c:242:     lexer->line = saved_line;
	movups	%xmm1, 32(%rbx)	; MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B], MEM <vector(2) long unsigned int> [(long unsigned int *)lexer_8(D) + 32B]
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

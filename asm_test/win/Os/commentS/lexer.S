	.file	"D:\\TC\\src\\lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	8(%rcx), %rax	 ; lexer_11(D)->position, _1
 ; D:\TC\src\lexer.c:33:         return '\0';
	xorl	%edx, %edx	 ; <retval>
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	16(%rcx), %rax	 ; lexer_11(D)->length, _1
	jnb	.L1	 ;,
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	(%rcx), %rdx	 ; lexer_11(D)->source, _5
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp91
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	incq	32(%rcx)	 ; lexer_11(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	%r8, 8(%rcx)	 ; tmp91, lexer_11(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movb	(%rdx,%rax), %dl	 ; *_7, <retval>
.L1:
 ; D:\TC\src\lexer.c:36: }
	movl	%edx, %eax	 ; <retval>,
	ret	
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp	 ;
	movl	%ecx, %ebp	 ; tmp88, type
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\lexer.c:18: static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, lexeme
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, line
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, column
	subq	$40, %rsp	 ;,
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movl	%ebp, 24(%rax)	 ; type, token_3->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	%rdi, (%rax)	 ; lexeme, token_3->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movq	%rsi, 8(%rax)	 ; line, token_3->line
 ; D:\TC\src\lexer.c:23:     token->column = column;
	movq	%rbx, 16(%rax)	 ; column, token_3->column
 ; D:\TC\src\lexer.c:25: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
lexer_error:
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp93, message
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp95, column
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp94, line
	subq	$48, %rsp	 ;,
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	leaq	1(%rsi), %r9	 ;,
	leaq	1(%rbx), %r8	 ;,
	movq	24(%rax), %rcx	 ; _3->_stderr, _3->_stderr
	movq	%rdi, 32(%rsp)	 ; message,
	leaq	.LC0(%rip), %rdx	 ;, tmp92
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:29: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
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
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movl	%edx, %edi	 ; tmp506, skip_comment
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp505, lexer
	subq	$48, %rsp	 ;,
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:61:     if (c == '\0')
	testb	%al, %al	 ; c
	jne	.L10	 ;,
 ; D:\TC\src\lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	32(%rcx), %r9	 ; lexer_269(D)->column,
	movq	24(%rcx), %r8	 ; lexer_269(D)->line,
	jmp	.L184	 ;
.L10:
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	movl	%eax, %edx	 ; c, tmp321
	andl	$-5, %edx	 ;, tmp321
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, %dl	 ;, tmp321
	je	.L185	 ;,
	cmpb	$32, %al	 ;, c
	je	.L185	 ;,
 ; D:\TC\src\lexer.c:65:     else if (c == '\n') {
	cmpb	$10, %al	 ;, c
	jne	.L13	 ;,
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	xorl	%r9d, %r9d	 ;
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	incq	24(%rcx)	 ; lexer_269(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	%r9, 32(%rcx)	 ;, lexer_269(D)->column
.L185:
 ; D:\TC\src\lexer.c:214: }
	addq	$48, %rsp	 ;,
 ; D:\TC\src\lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	%dil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\lexer.c:214: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\lexer.c:67:         return next_token(lexer, skip_comment);
	jmp	next_token	 ;
.L13:
 ; D:\TC\src\lexer.c:69:         size_t start = lexer->position - 1;
	movq	8(%rcx), %rsi	 ; lexer_269(D)->position, pretmp_452
	cmpb	$57, %al	 ;, c
	jg	.L14	 ;,
	cmpb	$47, %al	 ;, c
	jg	.L15	 ;,
	cmpb	$34, %al	 ;, c
	jne	.L17	 ;,
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp503
 ; D:\TC\src\lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	32(%rcx), %rax	 ; lexer_269(D)->column, tmp529
	leaq	-1(%rax), %rbp	 ;, column_start
 ; D:\TC\src\lexer.c:97:         c = get_current_char(lexer);
	call	get_current_char	 ;
	movl	%eax, %edi	 ; tmp515, c
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L30	 ;
.L14:
	leal	-65(%rax), %edx	 ;, _230
	cmpb	$57, %dl	 ;, _230
	ja	.L17	 ;,
	movabsq	$288230372997595135, %r11	 ;, tmp330
	btq	%rdx, %r11	 ; _230, tmp330
	jnc	.L17	 ;,
 ; D:\TC\src\lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rdi	 ; lexer_269(D)->column, tmp526
 ; D:\TC\src\lexer.c:69:         size_t start = lexer->position - 1;
	leaq	-1(%rsi), %r10	 ;, start
 ; D:\TC\src\lexer.c:70:         size_t column_start = lexer->column - 1;
	leaq	-1(%rdi), %r9	 ;, column_start
.L20:
	cmpb	$57, %al	 ;, c
	jg	.L21	 ;,
	cmpb	$47, %al	 ;, c
	jle	.L23	 ;,
.L22:
 ; D:\TC\src\lexer.c:72:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	jmp	.L20	 ;
.L21:
	subl	$65, %eax	 ;, _234
	cmpb	$57, %al	 ;, _234
	ja	.L23	 ;,
	btq	%rax, %r11	 ; _234, tmp330
	jc	.L22	 ;,
.L23:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rdx	 ; lexer_269(D)->position, _425
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	(%rbx), %rcx	 ; lexer_269(D)->source, start
	movq	%r9, 40(%rsp)	 ; column_start, %sfp
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	 ; lexer_269(D)->column
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp337
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	addq	%r10, %rcx	 ; start, start
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rsi, %rdx	 ; pretmp_452, tmp338
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rax, 8(%rbx)	 ; tmp337, lexer_269(D)->position
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
	movq	%rax, 32(%rsp)	 ; content, %sfp
	call	is_keyword	 ;
	movq	24(%rbx), %r8	 ; lexer_269(D)->line, lexer_269(D)->line
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	movq	32(%rsp), %rdx	 ; %sfp, content
 ; D:\TC\src\lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movl	$6, %ecx	 ;,
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	 ; tmp510
	movq	40(%rsp), %r9	 ; %sfp, column_start
	jne	.L186	 ;,
 ; D:\TC\src\lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movl	$1, %ecx	 ;,
	jmp	.L186	 ;
.L15:
 ; D:\TC\src\lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	32(%rcx), %rax	 ; lexer_269(D)->column, tmp528
 ; D:\TC\src\lexer.c:80:         size_t start = lexer->position - 1;
	leaq	-1(%rsi), %r10	 ;, start
 ; D:\TC\src\lexer.c:81:         size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %rdi	 ;, column_start
.L26:
 ; D:\TC\src\lexer.c:83:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	 ;, tmp344
	cmpb	$9, %dl	 ;, tmp344
	jbe	.L26	 ;,
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	 ; lexer_269(D)->position, _431
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	(%rbx), %r9	 ; lexer_269(D)->source, pretmp_272
 ; D:\TC\src\lexer.c:84:         TokenType type = INTEGER;
	movl	$2, %ebp	 ;, type
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	16(%rbx), %rdx	 ; lexer_269(D)->length, _431
	jnb	.L27	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, c
	jne	.L27	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	movb	(%r9,%rdx), %al	 ; *_434, *_434
	subl	$48, %eax	 ;, tmp345
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp345
	ja	.L27	 ;,
.L183:
 ; D:\TC\src\lexer.c:89:                 c = get_current_char(lexer);
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp347
	cmpb	$9, %al	 ;, tmp347
	ja	.L191	 ;,
 ; D:\TC\src\lexer.c:89:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	jmp	.L183	 ;
.L191:
 ; D:\TC\src\lexer.c:90:             type = FLOAT;
	movl	$3, %ebp	 ;, type
.L27:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rdx	 ; lexer_269(D)->position, _437
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	 ; lexer_269(D)->column
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r9,%r10), %rcx	 ;, tmp350
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %r8	 ; lexer_269(D)->line, _37
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp348
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rsi, %rdx	 ; pretmp_452, tmp349
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	%rax, 8(%rbx)	 ; tmp348, lexer_269(D)->position
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r8, 32(%rsp)	 ; _37, %sfp
	call	create_string	 ;
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rsp), %r8	 ; %sfp, _37
	movq	%rdi, %r9	 ; column_start,
	movl	%ebp, %ecx	 ; type,
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp514, _42
	jmp	.L186	 ;
.L193:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rdi, %r9	 ; c, tmp503
	jnc	.L192	 ;,
.L31:
 ; D:\TC\src\lexer.c:99:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	movl	%eax, %edi	 ; tmp516, c
.L30:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %dil	 ;, c
	ja	.L31	 ;,
	jmp	.L193	 ;
.L192:
 ; D:\TC\src\lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	24(%rbx), %r12	 ; lexer_269(D)->line, pretmp_483
 ; D:\TC\src\lexer.c:100:         if (c != '"') {
	cmpb	$34, %dil	 ;, c
	je	.L32	 ;,
 ; D:\TC\src\lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	leaq	-1(%rsi), %r8	 ;,
	movq	%r12, %rdx	 ; pretmp_483,
	leaq	.LC1(%rip), %rcx	 ;, tmp357
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, %dil	 ;, c
	jne	.L33	 ;,
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	incq	24(%rbx)	 ; lexer_269(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	%r8, 32(%rbx)	 ;, lexer_269(D)->column
.L33:
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	24(%rbx), %r8	 ; lexer_269(D)->line, _49
	movq	%rsi, %rdx	 ; pretmp_452, tmp358
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	(%rbx), %rsi	 ; lexer_269(D)->source, pretmp_452
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	notq	%rdx	 ; tmp358
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rsi, %rcx	 ; pretmp_452, tmp361
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	8(%rbx), %rdx	 ; lexer_269(D)->position, tmp360
	movq	%r8, 32(%rsp)	 ; _49, %sfp
	call	create_string	 ;
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rsp), %r8	 ; %sfp, _49
	movq	%rbp, %r9	 ; column_start,
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp517, _55
	jmp	.L188	 ;
.L32:
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rsi, %rdx	 ; pretmp_452, tmp363
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	(%rbx), %rsi	 ; lexer_269(D)->source, pretmp_452
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	notq	%rdx	 ; tmp363
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rsi, %rcx	 ; pretmp_452, tmp366
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	8(%rbx), %rdx	 ; lexer_269(D)->position, tmp365
	call	create_string	 ;
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %r9	 ; column_start,
	movq	%r12, %r8	 ; pretmp_483,
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp518, _62
.L188:
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movl	$4, %ecx	 ;,
	jmp	.L186	 ;
.L17:
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %r9	 ; lexer_269(D)->length, _446
 ; D:\TC\src\lexer.c:40:         return '\0';
	xorl	%ecx, %ecx	 ; _450
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r9, %rsi	 ; _446, pretmp_452
	jnb	.L34	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rdx	 ; lexer_269(D)->source, lexer_269(D)->source
	movb	(%rdx,%rsi), %cl	 ; *_448, _450
.L34:
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%r8b	 ;, tmp369
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, %cl	 ;, _450
	jne	.L35	 ;,
	testb	%r8b, %r8b	 ; tmp369
	je	.L35	 ;,
 ; D:\TC\src\lexer.c:110:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rbp	 ; lexer_269(D)->column, _67
.L36:
 ; D:\TC\src\lexer.c:112:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	 ;, c
	je	.L91	 ;,
	testb	%al, %al	 ; c
	jne	.L36	 ;,
.L91:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	8(%rbx), %rax	 ; lexer_269(D)->position, tmp534
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	 ; lexer_269(D)->column
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	leaq	-1(%rax), %rdx	 ;, _454
	movq	%rdx, 8(%rbx)	 ; _454, lexer_269(D)->position
 ; D:\TC\src\lexer.c:114:             if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L185	 ;,
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %r8	 ; lexer_269(D)->line, _72
 ; D:\TC\src\lexer.c:109:             size_t start = lexer->position + 1;
	leaq	1(%rsi), %rcx	 ;, start
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rcx, %rdx	 ; start, tmp378
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	(%rbx), %rcx	 ; lexer_269(D)->source, tmp379
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r8, 32(%rsp)	 ; _72, %sfp
	call	create_string	 ;
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	-1(%rbp), %r9	 ;,
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp520, _77
	jmp	.L189	 ;
.L35:
 ; D:\TC\src\lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, %cl	 ;, _450
	jne	.L39	 ;,
	testb	%r8b, %r8b	 ; tmp369
	je	.L39	 ;,
 ; D:\TC\src\lexer.c:119:             size_t column_start = lexer->column - 1;
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, tmp535
 ; D:\TC\src\lexer.c:118:             size_t start = lexer->position + 1;
	incq	%rsi	 ; start
 ; D:\TC\src\lexer.c:107:         char p = peek_next_char(lexer);
	movb	$42, %dl	 ;, p
 ; D:\TC\src\lexer.c:119:             size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %rbp	 ;, column_start
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	movb	$47, %al	 ;, c
.L40:
 ; D:\TC\src\lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	je	.L194	 ;,
.L44:
 ; D:\TC\src\lexer.c:121:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	movq	8(%rbx), %rdx	 ; lexer_269(D)->position, _457
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%r9, %rdx	 ; _446, _457
	jnb	.L41	 ;,
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movq	(%rbx), %rcx	 ; lexer_269(D)->source, lexer_269(D)->source
	movb	(%rcx,%rdx), %dl	 ; *_460, p
 ; D:\TC\src\lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L42	 ;,
	jmp	.L80	 ;
.L41:
	cmpb	$10, %al	 ;, c
	jne	.L43	 ;,
 ; D:\TC\src\lexer.c:40:         return '\0';
	xorl	%edx, %edx	 ; p
.L80:
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	incq	24(%rbx)	 ; lexer_269(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	%rcx, 32(%rbx)	 ;, lexer_269(D)->column
.L42:
 ; D:\TC\src\lexer.c:124:                 if (p == '\0') break;
	testb	%dl, %dl	 ; p
	je	.L43	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	testb	%al, %al	 ; c
	jne	.L40	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	leaq	.LC2(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$125, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp386
	call	__assert_func	 ;
.L194:
 ; D:\TC\src\lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$47, %dl	 ;, p
	jne	.L44	 ;,
	jmp	.L195	 ;
.L43:
 ; D:\TC\src\lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	jne	.L84	 ;,
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	decq	8(%rbx)	 ; lexer_269(D)->position
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	decq	32(%rbx)	 ; lexer_269(D)->column
.L84:
 ; D:\TC\src\lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	24(%rbx), %rdx	 ; lexer_269(D)->line, lexer_269(D)->line
	movq	%rsi, %r8	 ; start,
	leaq	.LC4(%rip), %rcx	 ;, tmp392
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:130:                 if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L185	 ;,
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	24(%rbx), %r8	 ; lexer_269(D)->line, _87
	movq	8(%rbx), %rdx	 ; lexer_269(D)->position, tmp394
	movq	%r8, 32(%rsp)	 ; _87, %sfp
.L190:
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rsi, %rdx	 ; start, tmp401
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	(%rbx), %rsi	 ; lexer_269(D)->source, start
	movq	%rsi, %rcx	 ; start, tmp402
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	create_string	 ;
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rbp, %r9	 ; column_start,
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp523, _100
.L189:
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rsp), %r8	 ; %sfp, _94
	movl	$7, %ecx	 ;,
	jmp	.L186	 ;
.L39:
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %cl	 ;, _450
	sete	%dl	 ;, tmp404
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, c
	jne	.L47	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L47	 ;,
 ; D:\TC\src\lexer.c:139:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp410
	jmp	.L187	 ;
.L47:
 ; D:\TC\src\lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, c
	jne	.L48	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L48	 ;,
 ; D:\TC\src\lexer.c:142:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp416
	jmp	.L187	 ;
.L48:
 ; D:\TC\src\lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, c
	jne	.L49	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L49	 ;,
 ; D:\TC\src\lexer.c:145:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp422
	jmp	.L187	 ;
.L49:
 ; D:\TC\src\lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, c
	jne	.L50	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L50	 ;,
 ; D:\TC\src\lexer.c:148:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp428
	jmp	.L187	 ;
.L50:
 ; D:\TC\src\lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, c
	jne	.L51	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L51	 ;,
 ; D:\TC\src\lexer.c:151:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp434
	jmp	.L187	 ;
.L51:
 ; D:\TC\src\lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, c
	jne	.L52	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L52	 ;,
 ; D:\TC\src\lexer.c:154:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp440
	jmp	.L187	 ;
.L52:
 ; D:\TC\src\lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, c
	jne	.L53	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L53	 ;,
 ; D:\TC\src\lexer.c:157:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp446
	jmp	.L187	 ;
.L53:
 ; D:\TC\src\lexer.c:159:         } else if (c == '/' && p == '=') {
	testb	%r8b, %r8b	 ; tmp369
	je	.L54	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L54	 ;,
 ; D:\TC\src\lexer.c:160:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp450
	jmp	.L187	 ;
.L54:
 ; D:\TC\src\lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, c
	jne	.L55	 ;,
	testb	%dl, %dl	 ; tmp404
	je	.L55	 ;,
 ; D:\TC\src\lexer.c:163:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp456
	jmp	.L187	 ;
.L55:
 ; D:\TC\src\lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, c
	jne	.L56	 ;,
	cmpb	$38, %cl	 ;, _450
	jne	.L56	 ;,
 ; D:\TC\src\lexer.c:166:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp464
	jmp	.L187	 ;
.L56:
 ; D:\TC\src\lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, c
	jne	.L57	 ;,
	cmpb	$124, %cl	 ;, _450
	jne	.L57	 ;,
 ; D:\TC\src\lexer.c:169:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbx), %rax	 ; lexer_269(D)->column, lexer_269(D)->column
	movq	24(%rbx), %r8	 ; lexer_269(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp472
	jmp	.L187	 ;
.L57:
 ; D:\TC\src\lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbx), %rdi	 ; lexer_269(D)->column, tmp540
 ; D:\TC\src\lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	24(%rbx), %rdx	 ; lexer_269(D)->line, pretmp_467
 ; D:\TC\src\lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rdi), %r9	 ;, _466
	cmpb	$62, %al	 ;, c
	jg	.L58	 ;,
	cmpb	$32, %al	 ;, c
	jle	.L59	 ;,
	subl	$33, %eax	 ;, tmp474
	cmpb	$29, %al	 ;, tmp474
	ja	.L59	 ;,
	leaq	.L61(%rip), %rcx	 ;, tmp476
	movzbl	%al, %eax	 ; tmp474, tmp475
	movslq	(%rcx,%rax,4), %rax	 ;, tmp478
	addq	%rcx, %rax	 ; tmp476, tmp479
	jmp	*%rax	 ; tmp479
	.section .rdata,"dr"
	.align 4
.L61:
	.long	.L74-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L73-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L72-.L61
	.long	.L71-.L61
	.long	.L70-.L61
	.long	.L69-.L61
	.long	.L68-.L61
	.long	.L67-.L61
	.long	.L66-.L61
	.long	.L65-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L59-.L61
	.long	.L64-.L61
	.long	.L63-.L61
	.long	.L62-.L61
	.long	.L60-.L61
	.text
.L58:
	cmpb	$123, %al	 ;, c
	je	.L75	 ;,
	jg	.L76	 ;,
	cmpb	$91, %al	 ;, c
	je	.L77	 ;,
	cmpb	$93, %al	 ;, c
	jne	.L59	 ;,
 ; D:\TC\src\lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp489
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L76:
	cmpb	$125, %al	 ;, c
	jne	.L59	 ;,
 ; D:\TC\src\lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp484
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L72:
 ; D:\TC\src\lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp481
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L71:
 ; D:\TC\src\lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp482
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L75:
 ; D:\TC\src\lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp483
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L68:
 ; D:\TC\src\lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp485
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L74:
 ; D:\TC\src\lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp486
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L66:
 ; D:\TC\src\lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp487
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L77:
 ; D:\TC\src\lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp488
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L64:
 ; D:\TC\src\lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp490
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L69:
 ; D:\TC\src\lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp491
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L67:
 ; D:\TC\src\lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp492
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L70:
 ; D:\TC\src\lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp493
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L65:
 ; D:\TC\src\lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp494
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L73:
 ; D:\TC\src\lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp495
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L63:
 ; D:\TC\src\lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp496
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L60:
 ; D:\TC\src\lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp497
	movq	%rdx, %r8	 ; pretmp_467,
	jmp	.L187	 ;
.L62:
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp498
	movq	%rdx, %r8	 ; pretmp_467,
.L187:
	movq	(%rax), %rdx	 ;,
	movl	$5, %ecx	 ;,
	jmp	.L186	 ;
.L59:
 ; D:\TC\src\lexer.c:210:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	%r9, %r8	 ; _466,
	leaq	.LC5(%rip), %rcx	 ;, tmp499
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
.L184:
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
.L186:
 ; D:\TC\src\lexer.c:214: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	jmp	create_token	 ;
.L195:
 ; D:\TC\src\lexer.c:134:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:135:             if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L185	 ;,
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	24(%rbx), %r8	 ; lexer_269(D)->line, _94
	movq	8(%rbx), %rax	 ; lexer_269(D)->position, tmp538
	movq	%r8, 32(%rsp)	 ; _94, %sfp
	leaq	-2(%rax), %rdx	 ;, tmp399
	jmp	.L190	 ;
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, source
 ; D:\TC\src\lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %ecx	 ;,
 ; D:\TC\src\lexer.c:3: Lexer* create_lexer(string source, size_t length) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp87, length
	subq	$40, %rsp	 ;,
 ; D:\TC\src\lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory	 ;
 ; D:\TC\src\lexer.c:11:     lexer->peeked_position = 0;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\lexer.c:6:     lexer->position = 0;
	xorl	%edx, %edx	 ;
 ; D:\TC\src\lexer.c:5:     lexer->source = source;
	movq	%rsi, (%rax)	 ; source, lexer_3->source
 ; D:\TC\src\lexer.c:6:     lexer->position = 0;
	movq	%rdx, 8(%rax)	 ;, lexer_3->position
 ; D:\TC\src\lexer.c:7:     lexer->length = length;
	movq	%rbx, 16(%rax)	 ; length, lexer_3->length
 ; D:\TC\src\lexer.c:11:     lexer->peeked_position = 0;
	movq	%rcx, 24(%rax)	 ;, lexer_3->line
	movq	%rcx, 32(%rax)	 ;, lexer_3->column
	movq	%rcx, 40(%rax)	 ;, lexer_3->peeked_token
 ; D:\TC\src\lexer.c:13:     lexer->peeked_column = 0;
	movq	%rcx, 48(%rax)	 ;, lexer_3->peeked_position
	movq	%rcx, 56(%rax)	 ;, lexer_3->peeked_line
 ; D:\TC\src\lexer.c:14:     lexer->current_token = 0;
	movq	%rcx, 64(%rax)	 ;, lexer_3->peeked_column
	movq	%rcx, 72(%rax)	 ;, lexer_3->current_token
 ; D:\TC\src\lexer.c:16: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp95, lexer
	subq	$32, %rsp	 ;,
 ; D:\TC\src\lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	40(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:\TC\src\lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	 ; <retval>
	je	.L199	 ;,
 ; D:\TC\src\lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	48(%rcx), %rdx	 ; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
 ; D:\TC\src\lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 72(%rcx)	 ; <retval>, lexer_8(D)->current_token
 ; D:\TC\src\lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	%rdx, 8(%rcx)	 ; lexer_8(D)->peeked_position, lexer_8(D)->position
 ; D:\TC\src\lexer.c:220:         lexer->line = lexer->peeked_line;
	movq	56(%rcx), %rdx	 ; lexer_8(D)->peeked_line, lexer_8(D)->peeked_line
	movq	%rdx, 24(%rcx)	 ; lexer_8(D)->peeked_line, lexer_8(D)->line
 ; D:\TC\src\lexer.c:221:         lexer->column = lexer->peeked_column;
	movq	64(%rcx), %rdx	 ; lexer_8(D)->peeked_column, lexer_8(D)->peeked_column
	movq	%rdx, 32(%rcx)	 ; lexer_8(D)->peeked_column, lexer_8(D)->column
 ; D:\TC\src\lexer.c:222:         lexer->peeked_token = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, 40(%rcx)	 ;, lexer_8(D)->peeked_token
 ; D:\TC\src\lexer.c:223:         return lexer->current_token;
	jmp	.L198	 ;
.L199:
 ; D:\TC\src\lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; D:\TC\src\lexer.c:226:     return lexer->current_token = token;
	movq	%rax, 72(%rbx)	 ; <retval>, lexer_8(D)->current_token
.L198:
 ; D:\TC\src\lexer.c:227: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
 ; D:\TC\src\lexer.c:230:     if (lexer->peeked_token != 0)
	movq	40(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; D:\TC\src\lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	 ; <retval>
	jne	.L205	 ;,
 ; D:\TC\src\lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	 ;
 ; D:\TC\src\lexer.c:235:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
 ; D:\TC\src\lexer.c:229: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp98, lexer
	subq	$40, %rsp	 ;,
 ; D:\TC\src\lexer.c:232:     size_t saved_position = lexer->position;
	movq	8(%rcx), %rbp	 ; lexer_9(D)->position, saved_position
 ; D:\TC\src\lexer.c:233:     size_t saved_line = lexer->line;
	movq	24(%rcx), %rdi	 ; lexer_9(D)->line, saved_line
 ; D:\TC\src\lexer.c:234:     size_t saved_column = lexer->column;
	movq	32(%rcx), %rsi	 ; lexer_9(D)->column, saved_column
 ; D:\TC\src\lexer.c:235:     Token* token = get_next_token(lexer, skip_comment);
	call	get_next_token	 ;
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	8(%rbx), %rdx	 ; lexer_9(D)->position, lexer_9(D)->position
 ; D:\TC\src\lexer.c:239:     lexer->position = saved_position;
	movq	%rbp, 8(%rbx)	 ; saved_position, lexer_9(D)->position
 ; D:\TC\src\lexer.c:242:     lexer->peeked_token = token;
	movq	%rax, 40(%rbx)	 ; <retval>, lexer_9(D)->peeked_token
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	%rdx, 48(%rbx)	 ; lexer_9(D)->position, lexer_9(D)->peeked_position
 ; D:\TC\src\lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	24(%rbx), %rdx	 ; lexer_9(D)->line, lexer_9(D)->line
 ; D:\TC\src\lexer.c:240:     lexer->line = saved_line;
	movq	%rdi, 24(%rbx)	 ; saved_line, lexer_9(D)->line
 ; D:\TC\src\lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	%rdx, 56(%rbx)	 ; lexer_9(D)->line, lexer_9(D)->peeked_line
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	32(%rbx), %rdx	 ; lexer_9(D)->column, lexer_9(D)->column
 ; D:\TC\src\lexer.c:241:     lexer->column = saved_column;
	movq	%rsi, 32(%rbx)	 ; saved_column, lexer_9(D)->column
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	%rdx, 64(%rbx)	 ; lexer_9(D)->column, lexer_9(D)->peeked_column
 ; D:\TC\src\lexer.c:244: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L205:
	ret	
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
 ; D:\TC\src\lexer.c:247:     return lexer->current_token;
	movq	72(%rcx), %rax	 ; lexer_2(D)->current_token, lexer_2(D)->current_token
 ; D:\TC\src\lexer.c:248: }
	ret	
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
 ; D:\TC\src\lexer.c:254:     lexer->peeked_token = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rcx)	 ;, lexer_2(D)->position
	movq	%rax, 24(%rcx)	 ;, lexer_2(D)->line
	movq	%rax, 32(%rcx)	 ;, lexer_2(D)->column
 ; D:\TC\src\lexer.c:258:     lexer->current_token = 0;
	movq	%rax, 40(%rcx)	 ;, lexer_2(D)->peeked_token
	movq	%rax, 48(%rcx)	 ;, lexer_2(D)->peeked_position
	movq	%rax, 56(%rcx)	 ;, lexer_2(D)->peeked_line
	movq	%rax, 64(%rcx)	 ;, lexer_2(D)->peeked_column
	movq	%rax, 72(%rcx)	 ;, lexer_2(D)->current_token
 ; D:\TC\src\lexer.c:259: }
	ret	
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "next_token\0"
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	is_keyword;	.scl	2;	.type	32;	.endef
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

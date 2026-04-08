	.file	"lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rax	 ; lexer_11(D)->position, _1
 ; D:/TC/src/lexer.c:34:         return '\0';
	movl	$0, %edx	 ;, <retval>
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	24(%rcx), %rax	 ; lexer_11(D)->length, _1
	jnb	.L1	 ;,
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	addq	$1, 40(%rcx)	 ;, lexer_11(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rcx), %rdx	 ; lexer_11(D)->source, _5
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp91
	movq	%r8, 16(%rcx)	 ; tmp91, lexer_11(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movzbl	(%rdx,%rax), %edx	 ; *_7, <retval>
.L1:
 ; D:/TC/src/lexer.c:37: }
	movl	%edx, %eax	 ; <retval>,
	ret	
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movl	%ecx, %ebp	 ; tmp88, type
	movq	%rdx, %rdi	 ; tmp89, lexeme
	movq	%r8, %rsi	 ; tmp90, line
	movq	%r9, %rbx	 ; tmp91, column
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movl	%ebp, 24(%rax)	 ; type, token_3->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	%rdi, (%rax)	 ; lexeme, token_3->lexeme
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movq	%rsi, 8(%rax)	 ; line, token_3->line
 ; D:/TC/src/lexer.c:24:     token->column = column;
	movq	%rbx, 16(%rax)	 ; column, token_3->column
 ; D:/TC/src/lexer.c:26: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[Lexer Error] at %s:%zu:%zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
lexer_error:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp94, message
	movq	%rdx, %rdi	 ; tmp95, line
	movq	%r8, %rbx	 ; tmp96, column
	movq	%r9, %rsi	 ; tmp97, filename
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	movq	24(%rax), %rcx	 ; _3->_stderr, _3->_stderr
	movq	%rbp, 40(%rsp)	 ; message,
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	addq	$1, %rbx	 ;, tmp92
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	movq	%rbx, 32(%rsp)	 ; tmp92,
	leaq	1(%rdi), %r9	 ;,
	movq	%rsi, %r8	 ; filename,
	leaq	.LC0(%rip), %rdx	 ;, tmp93
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:30: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
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
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp634, lexer
	movl	%edx, %esi	 ; tmp635, skip_comment
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	call	get_current_char	 ;
	cmpb	$32, %al	 ;, c
	ja	.L9	 ;,
	movzbl	%al, %edx	 ; c, c
	leaq	.L11(%rip), %rcx	 ;, tmp381
	movslq	(%rcx,%rdx,4), %rdx	 ;, tmp383
	addq	%rcx, %rdx	 ; tmp381, tmp384
	jmp	*%rdx	 ; tmp384
	.section .rdata,"dr"
	.align 4
.L11:
	.long	.L13-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.long	.L12-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L9-.L11
	.long	.L10-.L11
	.text
.L13:
 ; D:/TC/src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	40(%rbx), %r9	 ; lexer_263(D)->column,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
.L8:
 ; D:/TC/src/lexer.c:216: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
.L10:
 ; D:/TC/src/lexer.c:65:         return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L8	 ;
.L12:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	 ;, lexer_263(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_263(D)->column
 ; D:/TC/src/lexer.c:68:         return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L8	 ;
.L9:
	cmpb	$57, %al	 ;, c
	jg	.L15	 ;,
	cmpb	$47, %al	 ;, c
	jg	.L16	 ;,
	cmpb	$34, %al	 ;, c
	jne	.L103	 ;,
 ; D:/TC/src/lexer.c:96:         size_t start = lexer->position;
	movq	16(%rbx), %rdi	 ; lexer_263(D)->position, start
 ; D:/TC/src/lexer.c:97:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, tmp703
	leaq	-1(%rax), %rbp	 ;, column_start
 ; D:/TC/src/lexer.c:98:         c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	movl	%eax, %esi	 ; tmp650, c
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	 ;, c
	ja	.L31	 ;,
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %rax	 ;, tmp419
	btq	%rsi, %rax	 ; c, tmp419
	jc	.L32	 ;,
.L31:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %r12	 ;, tmp632
.L96:
 ; D:/TC/src/lexer.c:100:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	movl	%eax, %esi	 ; tmp651, c
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	 ;, c
	ja	.L96	 ;,
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rsi, %r12	 ; c, tmp632
	jnc	.L96	 ;,
.L32:
 ; D:/TC/src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %sil	 ;, c
	jne	.L104	 ;,
.L34:
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rdx	 ; lexer_263(D)->position, _48
	subq	%rdi, %rdx	 ; start, _48
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rdx	 ;, _48
	je	.L105	 ;,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_263(D)->line, _51
	subq	$1, %rdx	 ;, tmp431
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	8(%rbx), %rdi	 ; lexer_263(D)->source, start
	movq	%rdi, %rcx	 ; start, tmp432
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp654, _55
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rbp, %r9	 ; column_start,
	movq	%rsi, %r8	 ; _51,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L8	 ;
.L15:
	leal	-65(%rax), %edx	 ;, _90
	cmpb	$57, %dl	 ;, _90
	ja	.L20	 ;,
	movabsq	$288230372997595135, %rcx	 ;, tmp392
	btq	%rdx, %rcx	 ; _90, tmp392
	jnc	.L20	 ;,
 ; D:/TC/src/lexer.c:70:         size_t start = lexer->position - 1;
	movq	16(%rbx), %r12	 ; lexer_263(D)->position, _11
 ; D:/TC/src/lexer.c:70:         size_t start = lexer->position - 1;
	leaq	-1(%r12), %rbp	 ;, start
 ; D:/TC/src/lexer.c:71:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rdi	 ; lexer_263(D)->column, tmp699
	subq	$1, %rdi	 ;, column_start
	movabsq	$288230372997595135, %rsi	 ;, tmp633
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L22	 ;
.L106:
	cmpb	$47, %al	 ;, c
	jle	.L25	 ;,
.L24:
 ; D:/TC/src/lexer.c:73:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
.L22:
	cmpb	$57, %al	 ;, c
	jle	.L106	 ;,
	subl	$65, %eax	 ;, _19
	cmpb	$57, %al	 ;, _19
	ja	.L25	 ;,
	btq	%rax, %rsi	 ; _19, tmp633
	jc	.L24	 ;,
.L25:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_263(D)->position, _423
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp399
	movq	%rax, 16(%rbx)	 ; tmp399, lexer_263(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_263(D)->column
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%r12, %rdx	 ; _11, tmp400
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rbp, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_263(D)->source, start
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
	movq	%rax, %rsi	 ; tmp641, content
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
	call	is_keyword	 ;
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	 ; tmp642
	je	.L27	 ;,
 ; D:/TC/src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	%rdi, %r9	 ; column_start,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	%rsi, %rdx	 ; content,
	movl	$6, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L27:
 ; D:/TC/src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	%rdi, %r9	 ; column_start,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	%rsi, %rdx	 ; content,
	movl	$1, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L16:
 ; D:/TC/src/lexer.c:81:         size_t start = lexer->position - 1;
	movq	16(%rbx), %rbp	 ; lexer_263(D)->position, _26
 ; D:/TC/src/lexer.c:81:         size_t start = lexer->position - 1;
	leaq	-1(%rbp), %rdi	 ;, start
 ; D:/TC/src/lexer.c:82:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, tmp701
	leaq	-1(%rax), %rsi	 ;, column_start
.L28:
 ; D:/TC/src/lexer.c:84:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	 ;, tmp406
	cmpb	$9, %dl	 ;, tmp406
	jbe	.L28	 ;,
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_263(D)->position, _429
 ; D:/TC/src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %r12d	 ;, type
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	24(%rbx), %rdx	 ; lexer_263(D)->length, _429
	jnb	.L29	 ;,
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, c
	je	.L107	 ;,
.L29:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_263(D)->position, _440
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp412
	movq	%rax, 16(%rbx)	 ; tmp412, lexer_263(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_263(D)->column
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %r13	 ; lexer_263(D)->line, _34
	subq	%rbp, %rdx	 ; _26, tmp413
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	8(%rbx), %rdi	 ; lexer_263(D)->source, start
	movq	%rdi, %rcx	 ; start, tmp414
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp648, _39
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rsi, %r9	 ; column_start,
	movq	%r13, %r8	 ; _34,
	movl	%r12d, %ecx	 ; type,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	 ;
.L107:
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rax	 ; lexer_263(D)->source, lexer_263(D)->source
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rax,%rdx), %eax	 ; *_432, *_432
	subl	$48, %eax	 ;, tmp408
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp408
	ja	.L29	 ;,
 ; D:/TC/src/lexer.c:88:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp410
	cmpb	$9, %al	 ;, tmp410
	ja	.L89	 ;,
.L30:
 ; D:/TC/src/lexer.c:90:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp411
	cmpb	$9, %al	 ;, tmp411
	jbe	.L30	 ;,
 ; D:/TC/src/lexer.c:91:             type = FLOAT;
	movl	$3, %r12d	 ;, type
	jmp	.L29	 ;
.L89:
	movl	$3, %r12d	 ;, type
	jmp	.L29	 ;
.L104:
 ; D:/TC/src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	32(%rbx), %rdx	 ; lexer_263(D)->line, lexer_263(D)->line
	movq	(%rbx), %r9	 ; lexer_263(D)->filename,
	leaq	-1(%rdi), %r8	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp428
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, %sil	 ;, c
	jne	.L34	 ;,
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	 ;, lexer_263(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_263(D)->column
 ; D:/TC/src/lexer.c:48: }
	jmp	.L34	 ;
.L105:
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	32(%rbx), %rbx	 ; lexer_263(D)->line, _49
	leaq	.LC2(%rip), %rcx	 ;, tmp430
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp652, _50
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	%rbp, %r9	 ; column_start,
	movq	%rbx, %r8	 ; _49,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	jmp	.L8	 ;
.L103:
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rbp	 ; lexer_263(D)->position, _391
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %rdi	 ; lexer_263(D)->length, _399
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdi, %rbp	 ; _399, _391
	jnb	.L36	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %r12	 ; lexer_263(D)->source, _450
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movzbl	(%r12,%rbp), %edx	 ; *_451, _8
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%cl	 ;, _241
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %dl	 ;, _8
	jne	.L37	 ;,
	testb	%cl, %cl	 ; _241
	je	.L37	 ;,
 ; D:/TC/src/lexer.c:112:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rdi	 ; lexer_263(D)->column, _60
.L38:
 ; D:/TC/src/lexer.c:114:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	 ;, c
	je	.L91	 ;,
	testb	%al, %al	 ; c
	jne	.L38	 ;,
.L91:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rax	 ; lexer_263(D)->position, tmp706
	leaq	-1(%rax), %rdx	 ;, _462
	movq	%rdx, 16(%rbx)	 ; _462, lexer_263(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_263(D)->column
 ; D:/TC/src/lexer.c:116:             if (skip_comment)
	testb	%sil, %sil	 ; skip_comment
	je	.L40	 ;,
 ; D:/TC/src/lexer.c:117:                 return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L8	 ;
.L40:
 ; D:/TC/src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$1, %rbp	 ;, start
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %rbx	 ; lexer_263(D)->line, _65
	subq	%rbp, %rdx	 ; start, tmp443
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r12,%rbp), %rcx	 ;, tmp444
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp658, _70
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	-1(%rdi), %r9	 ;,
	movq	%rbx, %r8	 ; _65,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	 ;
.L46:
 ; D:/TC/src/lexer.c:123:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_263(D)->position, _465
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdi, %rdx	 ; _399, _465
	jnb	.L43	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rcx	 ; lexer_263(D)->source, lexer_263(D)->source
	movzbl	(%rcx,%rdx), %edx	 ; *_468, p
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	je	.L80	 ;,
.L44:
 ; D:/TC/src/lexer.c:126:                 if (p == '\0') break;
	testb	%dl, %dl	 ; p
	je	.L45	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	testb	%al, %al	 ; c
	je	.L108	 ;,
.L42:
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	jne	.L46	 ;,
	cmpb	$47, %dl	 ;, p
	jne	.L46	 ;,
 ; D:/TC/src/lexer.c:136:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:137:             if (skip_comment)
	testb	%sil, %sil	 ; skip_comment
	jne	.L83	 ;,
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_263(D)->line, _88
	movq	16(%rbx), %rax	 ; lexer_263(D)->position, tmp710
	leaq	-2(%rax), %rdx	 ;, tmp464
	subq	%rbp, %rdx	 ; start, tmp466
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rbp, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_263(D)->source, start
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp665, _94
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%r13, %r9	 ; column_start,
	movq	%rsi, %r8	 ; _88,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L8	 ;
.L108:
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$127, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp450
	call	__assert_func	 ;
.L109:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	$1, 16(%rbx)	 ;, lexer_263(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_263(D)->column
 ; D:/TC/src/lexer.c:58: }
	jmp	.L82	 ;
.L48:
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_263(D)->line, _81
	movq	16(%rbx), %rdx	 ; lexer_263(D)->position, tmp459
	subq	%rbp, %rdx	 ; start, tmp459
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rbp, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_263(D)->source, start
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp662, _86
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r13, %r9	 ; column_start,
	movq	%rsi, %r8	 ; _81,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L8	 ;
.L83:
 ; D:/TC/src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L8	 ;
.L111:
 ; D:/TC/src/lexer.c:141:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	movq	.refptr.EQ_SYMBOL(%rip), %rdx	 ;, tmp475
	movq	(%rdx), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L112:
 ; D:/TC/src/lexer.c:144:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	movq	.refptr.NE_SYMBOL(%rip), %rdx	 ;, tmp482
	movq	(%rdx), %rdx	 ; NE_SYMBOL, NE_SYMBOL
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L113:
 ; D:/TC/src/lexer.c:147:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	movq	.refptr.LE_SYMBOL(%rip), %rdx	 ;, tmp489
	movq	(%rdx), %rdx	 ; LE_SYMBOL, LE_SYMBOL
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L114:
 ; D:/TC/src/lexer.c:150:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	movq	.refptr.GE_SYMBOL(%rip), %rdx	 ;, tmp496
	movq	(%rdx), %rdx	 ; GE_SYMBOL, GE_SYMBOL
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L115:
 ; D:/TC/src/lexer.c:153:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp503
	movq	(%rdx), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L116:
 ; D:/TC/src/lexer.c:156:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp510
	movq	(%rdx), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L117:
 ; D:/TC/src/lexer.c:159:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp517
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L118:
 ; D:/TC/src/lexer.c:162:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp521
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L119:
 ; D:/TC/src/lexer.c:165:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp527
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L120:
 ; D:/TC/src/lexer.c:168:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp535
	movq	(%rax), %rdx	 ; AND_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L121:
 ; D:/TC/src/lexer.c:171:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp543
	movq	(%rax), %rdx	 ; OR_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L77:
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp554
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L76:
 ; D:/TC/src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp558
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L63:
 ; D:/TC/src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp562
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L61:
 ; D:/TC/src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp566
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L73:
 ; D:/TC/src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp570
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L79:
 ; D:/TC/src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp574
	movq	(%rax), %rdx	 ; NOT_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L71:
 ; D:/TC/src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp578
	movq	(%rax), %rdx	 ; DOT_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L65:
 ; D:/TC/src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp582
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L64:
 ; D:/TC/src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp586
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L69:
 ; D:/TC/src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp590
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L74:
 ; D:/TC/src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp594
	movq	(%rax), %rdx	 ; ADD_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L72:
 ; D:/TC/src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp598
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L75:
 ; D:/TC/src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp602
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L70:
 ; D:/TC/src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp606
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L78:
 ; D:/TC/src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp610
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L68:
 ; D:/TC/src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp614
	movq	(%rax), %rdx	 ; LT_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L66:
 ; D:/TC/src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp618
	movq	(%rax), %rdx	 ; GT_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L67:
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_263(D)->line,
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp622
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L60:
 ; D:/TC/src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, lexer_263(D)->column
	movq	32(%rbx), %rdx	 ; lexer_263(D)->line, lexer_263(D)->line
	movq	(%rbx), %r9	 ; lexer_263(D)->filename,
	leaq	-1(%rax), %r8	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp626
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
	jmp	.L8	 ;
.L43:
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L45	 ;,
 ; D:/TC/src/lexer.c:41:         return '\0';
	movl	%r12d, %edx	 ; p, p
.L80:
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	addq	$1, 32(%rbx)	 ;, lexer_263(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_263(D)->column
 ; D:/TC/src/lexer.c:48: }
	jmp	.L44	 ;
.L45:
 ; D:/TC/src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	je	.L109	 ;,
.L82:
 ; D:/TC/src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	32(%rbx), %rdx	 ; lexer_263(D)->line, lexer_263(D)->line
	movq	(%rbx), %r9	 ; lexer_263(D)->filename,
	movq	%rbp, %r8	 ; start,
	leaq	.LC5(%rip), %rcx	 ;, tmp457
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:132:                 if (skip_comment)
	testb	%sil, %sil	 ; skip_comment
	je	.L48	 ;,
 ; D:/TC/src/lexer.c:133:                     return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L8	 ;
.L110:
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rdx	 ; lexer_263(D)->source, lexer_263(D)->source
	movzbl	(%rdx,%rbp), %edx	 ; *_436, _8
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%cl	 ;, _241
.L37:
 ; D:/TC/src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %dl	 ;, _8
	jne	.L41	 ;,
	testb	%cl, %cl	 ; _241
	je	.L41	 ;,
 ; D:/TC/src/lexer.c:120:             size_t start = lexer->position + 1;
	addq	$1, %rbp	 ;, start
 ; D:/TC/src/lexer.c:121:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_263(D)->column, tmp707
	leaq	-1(%rax), %r13	 ;, column_start
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	movl	$47, %eax	 ;, c
 ; D:/TC/src/lexer.c:41:         return '\0';
	movl	$0, %r12d	 ;, p
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	jmp	.L42	 ;
.L20:
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rbp	 ; lexer_263(D)->position, _391
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %rdi	 ; lexer_263(D)->length, _399
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rdi, %rbp	 ; _399, _391
	jb	.L110	 ;,
.L36:
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%cl	 ;, _241
 ; D:/TC/src/lexer.c:41:         return '\0';
	movl	$0, %edx	 ;, _8
.L41:
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %dl	 ;, _8
	sete	%r8b	 ;, _96
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, c
	jne	.L49	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L111	 ;,
.L49:
 ; D:/TC/src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, c
	jne	.L50	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L112	 ;,
.L50:
 ; D:/TC/src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, c
	jne	.L51	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L113	 ;,
.L51:
 ; D:/TC/src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, c
	jne	.L52	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L114	 ;,
.L52:
 ; D:/TC/src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, c
	jne	.L53	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L115	 ;,
.L53:
 ; D:/TC/src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, c
	jne	.L54	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L116	 ;,
.L54:
 ; D:/TC/src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, c
	jne	.L55	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L117	 ;,
.L55:
 ; D:/TC/src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%r8b, %r8b	 ; _96
	je	.L56	 ;,
	testb	%cl, %cl	 ; _241
	jne	.L118	 ;,
.L56:
 ; D:/TC/src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, c
	jne	.L57	 ;,
	testb	%r8b, %r8b	 ; _96
	jne	.L119	 ;,
.L57:
 ; D:/TC/src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, c
	jne	.L58	 ;,
	cmpb	$38, %dl	 ;, _8
	je	.L120	 ;,
.L58:
 ; D:/TC/src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, c
	jne	.L59	 ;,
	cmpb	$124, %dl	 ;, _8
	je	.L121	 ;,
.L59:
	subl	$33, %eax	 ;, tmp544
	cmpb	$92, %al	 ;, tmp544
	ja	.L60	 ;,
	movzbl	%al, %eax	 ; tmp544, tmp545
	leaq	.L62(%rip), %rdx	 ;, tmp546
	movslq	(%rdx,%rax,4), %rax	 ;, tmp548
	addq	%rdx, %rax	 ; tmp546, tmp549
	jmp	*%rax	 ; tmp549
	.section .rdata,"dr"
	.align 4
.L62:
	.long	.L79-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L78-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L77-.L62
	.long	.L76-.L62
	.long	.L75-.L62
	.long	.L74-.L62
	.long	.L73-.L62
	.long	.L72-.L62
	.long	.L71-.L62
	.long	.L70-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L69-.L62
	.long	.L68-.L62
	.long	.L67-.L62
	.long	.L66-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L65-.L62
	.long	.L60-.L62
	.long	.L64-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L60-.L62
	.long	.L63-.L62
	.long	.L60-.L62
	.long	.L61-.L62
	.text
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp87, source
	movq	%rdx, %rsi	 ; tmp88, length
	movq	%r8, %rbx	 ; tmp89, filename
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %ecx	 ;,
	call	alloc_memory	 ;
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
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	movq	$0, 56(%rax)	 ;, lexer_3->peeked_position
 ; D:/TC/src/lexer.c:12:     lexer->peeked_line = 0;
	movq	$0, 64(%rax)	 ;, lexer_3->peeked_line
 ; D:/TC/src/lexer.c:13:     lexer->peeked_column = 0;
	movq	$0, 72(%rax)	 ;, lexer_3->peeked_column
 ; D:/TC/src/lexer.c:14:     lexer->current_token = NULL;
	movq	$0, 80(%rax)	 ;, lexer_3->current_token
 ; D:/TC/src/lexer.c:15:     lexer->filename = filename;
	movq	%rbx, (%rax)	 ; filename, lexer_3->filename
 ; D:/TC/src/lexer.c:17: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp95, lexer
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	48(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L125	 ;,
 ; D:/TC/src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rcx)	 ; <retval>, lexer_9(D)->current_token
 ; D:/TC/src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	56(%rcx), %rdx	 ; lexer_9(D)->peeked_position, lexer_9(D)->peeked_position
	movq	%rdx, 16(%rcx)	 ; lexer_9(D)->peeked_position, lexer_9(D)->position
 ; D:/TC/src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	64(%rcx), %rdx	 ; lexer_9(D)->peeked_line, lexer_9(D)->peeked_line
	movq	%rdx, 32(%rcx)	 ; lexer_9(D)->peeked_line, lexer_9(D)->line
 ; D:/TC/src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	72(%rcx), %rdx	 ; lexer_9(D)->peeked_column, lexer_9(D)->peeked_column
	movq	%rdx, 40(%rcx)	 ; lexer_9(D)->peeked_column, lexer_9(D)->column
 ; D:/TC/src/lexer.c:224:         lexer->peeked_token = 0;
	movq	$0, 48(%rcx)	 ;, lexer_9(D)->peeked_token
.L124:
 ; D:/TC/src/lexer.c:229: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L125:
 ; D:/TC/src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; D:/TC/src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	 ; <retval>, lexer_9(D)->current_token
	jmp	.L124	 ;
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	48(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L134	 ;,
 ; D:/TC/src/lexer.c:246: }
	ret	
.L134:
 ; D:/TC/src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp98, lexer
 ; D:/TC/src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rcx), %rbp	 ; lexer_9(D)->position, saved_position
 ; D:/TC/src/lexer.c:235:     size_t saved_line = lexer->line;
	movq	32(%rcx), %rdi	 ; lexer_9(D)->line, saved_line
 ; D:/TC/src/lexer.c:236:     size_t saved_column = lexer->column;
	movq	40(%rcx), %rsi	 ; lexer_9(D)->column, saved_column
 ; D:/TC/src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	get_next_token	 ;
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	16(%rbx), %rdx	 ; lexer_9(D)->position, lexer_9(D)->position
	movq	%rdx, 56(%rbx)	 ; lexer_9(D)->position, lexer_9(D)->peeked_position
 ; D:/TC/src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	32(%rbx), %rdx	 ; lexer_9(D)->line, lexer_9(D)->line
	movq	%rdx, 64(%rbx)	 ; lexer_9(D)->line, lexer_9(D)->peeked_line
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	 ; lexer_9(D)->column, lexer_9(D)->column
	movq	%rdx, 72(%rbx)	 ; lexer_9(D)->column, lexer_9(D)->peeked_column
 ; D:/TC/src/lexer.c:241:     lexer->position = saved_position;
	movq	%rbp, 16(%rbx)	 ; saved_position, lexer_9(D)->position
 ; D:/TC/src/lexer.c:242:     lexer->line = saved_line;
	movq	%rdi, 32(%rbx)	 ; saved_line, lexer_9(D)->line
 ; D:/TC/src/lexer.c:243:     lexer->column = saved_column;
	movq	%rsi, 40(%rbx)	 ; saved_column, lexer_9(D)->column
 ; D:/TC/src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	 ; <retval>, lexer_9(D)->peeked_token
 ; D:/TC/src/lexer.c:246: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
 ; D:/TC/src/lexer.c:249:     return lexer->current_token;
	movq	80(%rcx), %rax	 ; lexer_2(D)->current_token, lexer_2(D)->current_token
 ; D:/TC/src/lexer.c:250: }
	ret	
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
 ; D:/TC/src/lexer.c:253:     lexer->position = 0;
	movq	$0, 16(%rcx)	 ;, lexer_2(D)->position
 ; D:/TC/src/lexer.c:254:     lexer->line = 0;
	movq	$0, 32(%rcx)	 ;, lexer_2(D)->line
 ; D:/TC/src/lexer.c:255:     lexer->column = 0;
	movq	$0, 40(%rcx)	 ;, lexer_2(D)->column
 ; D:/TC/src/lexer.c:256:     lexer->peeked_token = NULL;
	movq	$0, 48(%rcx)	 ;, lexer_2(D)->peeked_token
 ; D:/TC/src/lexer.c:257:     lexer->peeked_position = 0;
	movq	$0, 56(%rcx)	 ;, lexer_2(D)->peeked_position
 ; D:/TC/src/lexer.c:258:     lexer->peeked_line = 0;
	movq	$0, 64(%rcx)	 ;, lexer_2(D)->peeked_line
 ; D:/TC/src/lexer.c:259:     lexer->peeked_column = 0;
	movq	$0, 72(%rcx)	 ;, lexer_2(D)->peeked_column
 ; D:/TC/src/lexer.c:260:     lexer->current_token = NULL;
	movq	$0, 80(%rcx)	 ;, lexer_2(D)->current_token
 ; D:/TC/src/lexer.c:261: }
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

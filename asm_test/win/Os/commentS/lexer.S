	.file	"lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rax	 ; lexer_11(D)->position, _1
 ; D:/TC/src/lexer.c:34:         return '\0';
	xorl	%edx, %edx	 ; <retval>
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	24(%rcx), %rax	 ; lexer_11(D)->length, _1
	jnb	.L1	 ;,
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	8(%rcx), %rdx	 ; lexer_11(D)->source, _5
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp91
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	incq	40(%rcx)	 ; lexer_11(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	%r8, 16(%rcx)	 ; tmp91, lexer_11(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movb	(%rdx,%rax), %dl	 ; *_7, <retval>
.L1:
 ; D:/TC/src/lexer.c:37: }
	movl	%edx, %eax	 ; <retval>,
	ret	
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp	 ;
	movl	%ecx, %ebp	 ; tmp88, type
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/lexer.c:19: static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, lexeme
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, line
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, column
	subq	$40, %rsp	 ;,
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
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
.LC0:
	.ascii "[Lexer Error] at %s:%zu:%zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
lexer_error:
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp94, message
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp95, line
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp96, column
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	incq	%rbx	 ; tmp92
 ; D:/TC/src/lexer.c:28: static void lexer_error(const string message, size_t line, size_t column, string filename) {
	subq	$48, %rsp	 ;,
 ; D:/TC/src/lexer.c:28: static void lexer_error(const string message, size_t line, size_t column, string filename) {
	movq	%r9, 104(%rsp)	 ; filename, filename
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	movq	104(%rsp), %r8	 ; filename, filename
	leaq	1(%rsi), %r9	 ;,
	leaq	.LC0(%rip), %rdx	 ;, tmp93
	movq	24(%rax), %rcx	 ; _3->_stderr, _3->_stderr
	movq	%rdi, 40(%rsp)	 ; message,
	movq	%rbx, 32(%rsp)	 ; tmp92,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:30: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
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
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movl	%edx, %edi	 ; tmp499, skip_comment
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp498, lexer
	subq	$56, %rsp	 ;,
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:62:     if (c == '\0')
	testb	%al, %al	 ; c
	jne	.L10	 ;,
 ; D:/TC/src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	40(%rcx), %r9	 ; lexer_267(D)->column,
	movq	32(%rcx), %r8	 ; lexer_267(D)->line,
	jmp	.L186	 ;
.L10:
 ; D:/TC/src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	movl	%eax, %edx	 ; c, tmp319
	andl	$-5, %edx	 ;, tmp319
 ; D:/TC/src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, %dl	 ;, tmp319
	je	.L187	 ;,
	cmpb	$32, %al	 ;, c
	je	.L187	 ;,
 ; D:/TC/src/lexer.c:66:     else if (c == '\n') {
	cmpb	$10, %al	 ;, c
	jne	.L13	 ;,
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	xorl	%r9d, %r9d	 ;
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	incq	32(%rcx)	 ; lexer_267(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	%r9, 40(%rcx)	 ;, lexer_267(D)->column
.L187:
 ; D:/TC/src/lexer.c:216: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/lexer.c:68:         return next_token(lexer, skip_comment);
	movsbl	%dil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/lexer.c:216: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/lexer.c:68:         return next_token(lexer, skip_comment);
	jmp	next_token	 ;
.L13:
 ; D:/TC/src/lexer.c:70:         size_t start = lexer->position - 1;
	movq	16(%rcx), %rsi	 ; lexer_267(D)->position, pretmp_451
	cmpb	$57, %al	 ;, c
	jg	.L14	 ;,
	cmpb	$47, %al	 ;, c
	jg	.L15	 ;,
	cmpb	$34, %al	 ;, c
	jne	.L17	 ;,
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp496
 ; D:/TC/src/lexer.c:97:         size_t column_start = lexer->column - 1;
	movq	40(%rcx), %rax	 ; lexer_267(D)->column, tmp522
	leaq	-1(%rax), %rbp	 ;, column_start
 ; D:/TC/src/lexer.c:98:         c = get_current_char(lexer);
	call	get_current_char	 ;
	movl	%eax, %edi	 ; tmp508, c
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L30	 ;
.L14:
	leal	-65(%rax), %edx	 ;, _232
	cmpb	$57, %dl	 ;, _232
	ja	.L17	 ;,
	movabsq	$288230372997595135, %r11	 ;, tmp328
	btq	%rdx, %r11	 ; _232, tmp328
	jnc	.L17	 ;,
 ; D:/TC/src/lexer.c:71:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rdi	 ; lexer_267(D)->column, tmp519
 ; D:/TC/src/lexer.c:70:         size_t start = lexer->position - 1;
	leaq	-1(%rsi), %r10	 ;, start
 ; D:/TC/src/lexer.c:71:         size_t column_start = lexer->column - 1;
	leaq	-1(%rdi), %r9	 ;, column_start
.L20:
	cmpb	$57, %al	 ;, c
	jg	.L21	 ;,
	cmpb	$47, %al	 ;, c
	jle	.L23	 ;,
.L22:
 ; D:/TC/src/lexer.c:73:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	jmp	.L20	 ;
.L21:
	subl	$65, %eax	 ;, _236
	cmpb	$57, %al	 ;, _236
	ja	.L23	 ;,
	btq	%rax, %r11	 ; _236, tmp328
	jc	.L22	 ;,
.L23:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_267(D)->position, _423
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	8(%rbx), %rcx	 ; lexer_267(D)->source, start
	movq	%r9, 40(%rsp)	 ; column_start, %sfp
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_267(D)->column
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp335
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	addq	%r10, %rcx	 ; start, start
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	%rsi, %rdx	 ; pretmp_451, tmp336
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rax, 16(%rbx)	 ; tmp335, lexer_267(D)->position
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	movq	%rax, %rcx	 ; content,
	movq	%rax, 32(%rsp)	 ; content, %sfp
	call	is_keyword	 ;
	movq	32(%rbx), %r8	 ; lexer_267(D)->line, lexer_267(D)->line
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	movq	32(%rsp), %rdx	 ; %sfp, content
 ; D:/TC/src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	movl	$6, %ecx	 ;,
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	 ; tmp503
	movq	40(%rsp), %r9	 ; %sfp, column_start
	jne	.L188	 ;,
 ; D:/TC/src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movl	$1, %ecx	 ;,
	jmp	.L188	 ;
.L15:
 ; D:/TC/src/lexer.c:82:         size_t column_start = lexer->column - 1;
	movq	40(%rcx), %rax	 ; lexer_267(D)->column, tmp521
 ; D:/TC/src/lexer.c:81:         size_t start = lexer->position - 1;
	leaq	-1(%rsi), %r10	 ;, start
 ; D:/TC/src/lexer.c:82:         size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %rdi	 ;, column_start
.L26:
 ; D:/TC/src/lexer.c:84:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	 ;, tmp342
	cmpb	$9, %dl	 ;, tmp342
	jbe	.L26	 ;,
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_267(D)->position, _429
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	8(%rbx), %r9	 ; lexer_267(D)->source, pretmp_270
 ; D:/TC/src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, %ebp	 ;, type
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	24(%rbx), %rdx	 ; lexer_267(D)->length, _429
	jnb	.L27	 ;,
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, c
	jne	.L27	 ;,
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	movb	(%r9,%rdx), %al	 ; *_432, *_432
	subl	$48, %eax	 ;, tmp343
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp343
	ja	.L27	 ;,
.L185:
 ; D:/TC/src/lexer.c:90:                 c = get_current_char(lexer);
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp345
	cmpb	$9, %al	 ;, tmp345
	ja	.L193	 ;,
 ; D:/TC/src/lexer.c:90:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	jmp	.L185	 ;
.L193:
 ; D:/TC/src/lexer.c:91:             type = FLOAT;
	movl	$3, %ebp	 ;, type
.L27:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_267(D)->position, _435
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_267(D)->column
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	(%r9,%r10), %rcx	 ;, tmp348
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %r8	 ; lexer_267(D)->line, _37
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp346
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rsi, %rdx	 ; pretmp_451, tmp347
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	%rax, 16(%rbx)	 ; tmp346, lexer_267(D)->position
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r8, 32(%rsp)	 ; _37, %sfp
	call	create_string	 ;
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rsp), %r8	 ; %sfp, _37
	movq	%rdi, %r9	 ; column_start,
	movl	%ebp, %ecx	 ; type,
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp507, _42
	jmp	.L188	 ;
.L195:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rdi, %r9	 ; c, tmp496
	jnc	.L194	 ;,
.L31:
 ; D:/TC/src/lexer.c:100:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	movl	%eax, %edi	 ; tmp509, c
.L30:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %dil	 ;, c
	ja	.L31	 ;,
	jmp	.L195	 ;
.L194:
 ; D:/TC/src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	32(%rbx), %rdx	 ; lexer_267(D)->line, pretmp_348
 ; D:/TC/src/lexer.c:101:         if (c != '"') {
	cmpb	$34, %dil	 ;, c
	je	.L33	 ;,
 ; D:/TC/src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	(%rbx), %r9	 ; lexer_267(D)->filename,
	leaq	-1(%rsi), %r8	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp355
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, %dil	 ;, c
	jne	.L33	 ;,
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	incq	32(%rbx)	 ; lexer_267(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	%r8, 40(%rbx)	 ;, lexer_267(D)->column
.L33:
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbx), %rdx	 ; lexer_267(D)->position, _51
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	32(%rbx), %r8	 ; lexer_267(D)->line, pretmp_481
	leaq	.LC2(%rip), %rcx	 ;, tmp357
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	subq	%rsi, %rdx	 ; pretmp_451, _51
	movq	%r8, 32(%rsp)	 ; pretmp_481, %sfp
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rdx	 ;, _51
	je	.L190	 ;,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	addq	8(%rbx), %rsi	 ; lexer_267(D)->source, pretmp_451
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	decq	%rdx	 ; tmp358
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rsi, %rcx	 ; pretmp_451, tmp359
.L190:
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rsp), %r8	 ; %sfp, pretmp_481
	movq	%rbp, %r9	 ; column_start,
	movl	$4, %ecx	 ;,
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp511, _58
	jmp	.L188	 ;
.L17:
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %r9	 ; lexer_267(D)->length, _444
 ; D:/TC/src/lexer.c:41:         return '\0';
	xorl	%ecx, %ecx	 ; _448
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%r9, %rsi	 ; _444, pretmp_451
	jnb	.L36	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rdx	 ; lexer_267(D)->source, lexer_267(D)->source
	movb	(%rdx,%rsi), %cl	 ; *_446, _448
.L36:
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%r8b	 ;, tmp362
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, %cl	 ;, _448
	jne	.L37	 ;,
	testb	%r8b, %r8b	 ; tmp362
	je	.L37	 ;,
 ; D:/TC/src/lexer.c:112:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rbp	 ; lexer_267(D)->column, _63
.L38:
 ; D:/TC/src/lexer.c:114:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	 ;, c
	je	.L93	 ;,
	testb	%al, %al	 ; c
	jne	.L38	 ;,
.L93:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rax	 ; lexer_267(D)->position, tmp525
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_267(D)->column
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	leaq	-1(%rax), %rdx	 ;, _452
	movq	%rdx, 16(%rbx)	 ; _452, lexer_267(D)->position
 ; D:/TC/src/lexer.c:116:             if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L187	 ;,
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %r8	 ; lexer_267(D)->line, _68
 ; D:/TC/src/lexer.c:111:             size_t start = lexer->position + 1;
	leaq	1(%rsi), %rcx	 ;, start
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	%rcx, %rdx	 ; start, tmp371
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	addq	8(%rbx), %rcx	 ; lexer_267(D)->source, tmp372
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%r8, 32(%rsp)	 ; _68, %sfp
	call	create_string	 ;
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	leaq	-1(%rbp), %r9	 ;,
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp513, _73
	jmp	.L191	 ;
.L37:
 ; D:/TC/src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, %cl	 ;, _448
	jne	.L41	 ;,
	testb	%r8b, %r8b	 ; tmp362
	je	.L41	 ;,
 ; D:/TC/src/lexer.c:121:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, tmp526
 ; D:/TC/src/lexer.c:120:             size_t start = lexer->position + 1;
	incq	%rsi	 ; start
 ; D:/TC/src/lexer.c:109:         char p = peek_next_char(lexer);
	movb	$42, %dl	 ;, p
 ; D:/TC/src/lexer.c:121:             size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %rbp	 ;, column_start
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	movb	$47, %al	 ;, c
.L42:
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	je	.L196	 ;,
.L46:
 ; D:/TC/src/lexer.c:123:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_267(D)->position, _455
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%r9, %rdx	 ; _444, _455
	jnb	.L43	 ;,
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	8(%rbx), %rcx	 ; lexer_267(D)->source, lexer_267(D)->source
	movb	(%rcx,%rdx), %dl	 ; *_458, p
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, %al	 ;, c
	jne	.L44	 ;,
	jmp	.L82	 ;
.L43:
	cmpb	$10, %al	 ;, c
	jne	.L45	 ;,
 ; D:/TC/src/lexer.c:41:         return '\0';
	xorl	%edx, %edx	 ; p
.L82:
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	incq	32(%rbx)	 ; lexer_267(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	%rcx, 40(%rbx)	 ;, lexer_267(D)->column
.L44:
 ; D:/TC/src/lexer.c:126:                 if (p == '\0') break;
	testb	%dl, %dl	 ; p
	je	.L45	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	testb	%al, %al	 ; c
	jne	.L42	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$127, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp379
	call	__assert_func	 ;
.L196:
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$47, %dl	 ;, p
	jne	.L46	 ;,
	jmp	.L197	 ;
.L45:
 ; D:/TC/src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	jne	.L86	 ;,
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	decq	16(%rbx)	 ; lexer_267(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_267(D)->column
.L86:
 ; D:/TC/src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	32(%rbx), %rdx	 ; lexer_267(D)->line, lexer_267(D)->line
	movq	(%rbx), %r9	 ; lexer_267(D)->filename,
	movq	%rsi, %r8	 ; start,
	leaq	.LC5(%rip), %rcx	 ;, tmp385
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:132:                 if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L187	 ;,
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbx), %r8	 ; lexer_267(D)->line, _84
	movq	16(%rbx), %rdx	 ; lexer_267(D)->position, tmp387
	movq	%r8, 32(%rsp)	 ; _84, %sfp
.L192:
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	%rsi, %rdx	 ; start, tmp394
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	addq	8(%rbx), %rsi	 ; lexer_267(D)->source, start
	movq	%rsi, %rcx	 ; start, tmp395
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	call	create_string	 ;
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rbp, %r9	 ; column_start,
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp516, _97
.L191:
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rsp), %r8	 ; %sfp, _91
	movl	$7, %ecx	 ;,
	jmp	.L188	 ;
.L41:
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %cl	 ;, _448
	sete	%dl	 ;, tmp397
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, c
	jne	.L49	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L49	 ;,
 ; D:/TC/src/lexer.c:141:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp403
	jmp	.L189	 ;
.L49:
 ; D:/TC/src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, c
	jne	.L50	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L50	 ;,
 ; D:/TC/src/lexer.c:144:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp409
	jmp	.L189	 ;
.L50:
 ; D:/TC/src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, c
	jne	.L51	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L51	 ;,
 ; D:/TC/src/lexer.c:147:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp415
	jmp	.L189	 ;
.L51:
 ; D:/TC/src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, c
	jne	.L52	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L52	 ;,
 ; D:/TC/src/lexer.c:150:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp421
	jmp	.L189	 ;
.L52:
 ; D:/TC/src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, c
	jne	.L53	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L53	 ;,
 ; D:/TC/src/lexer.c:153:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp427
	jmp	.L189	 ;
.L53:
 ; D:/TC/src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, c
	jne	.L54	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L54	 ;,
 ; D:/TC/src/lexer.c:156:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp433
	jmp	.L189	 ;
.L54:
 ; D:/TC/src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, c
	jne	.L55	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L55	 ;,
 ; D:/TC/src/lexer.c:159:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp439
	jmp	.L189	 ;
.L55:
 ; D:/TC/src/lexer.c:161:         } else if (c == '/' && p == '=') {
	testb	%r8b, %r8b	 ; tmp362
	je	.L56	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L56	 ;,
 ; D:/TC/src/lexer.c:162:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp443
	jmp	.L189	 ;
.L56:
 ; D:/TC/src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, c
	jne	.L57	 ;,
	testb	%dl, %dl	 ; tmp397
	je	.L57	 ;,
 ; D:/TC/src/lexer.c:165:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp449
	jmp	.L189	 ;
.L57:
 ; D:/TC/src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, c
	jne	.L58	 ;,
	cmpb	$38, %cl	 ;, _448
	jne	.L58	 ;,
 ; D:/TC/src/lexer.c:168:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp457
	jmp	.L189	 ;
.L58:
 ; D:/TC/src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, c
	jne	.L59	 ;,
	cmpb	$124, %cl	 ;, _448
	jne	.L59	 ;,
 ; D:/TC/src/lexer.c:171:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_267(D)->column, lexer_267(D)->column
	movq	32(%rbx), %r8	 ; lexer_267(D)->line,
	leaq	-2(%rax), %r9	 ;,
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp465
	jmp	.L189	 ;
.L59:
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	40(%rbx), %rdi	 ; lexer_267(D)->column, tmp531
 ; D:/TC/src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	32(%rbx), %rdx	 ; lexer_267(D)->line, pretmp_450
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rdi), %r8	 ;, _465
	cmpb	$62, %al	 ;, c
	jg	.L60	 ;,
	cmpb	$32, %al	 ;, c
	jle	.L61	 ;,
	subl	$33, %eax	 ;, tmp467
	cmpb	$29, %al	 ;, tmp467
	ja	.L61	 ;,
	leaq	.L63(%rip), %rcx	 ;, tmp469
	movzbl	%al, %eax	 ; tmp467, tmp468
	movslq	(%rcx,%rax,4), %rax	 ;, tmp471
	addq	%rcx, %rax	 ; tmp469, tmp472
	jmp	*%rax	 ; tmp472
	.section .rdata,"dr"
	.align 4
.L63:
	.long	.L76-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L75-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L74-.L63
	.long	.L73-.L63
	.long	.L72-.L63
	.long	.L71-.L63
	.long	.L70-.L63
	.long	.L69-.L63
	.long	.L68-.L63
	.long	.L67-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L61-.L63
	.long	.L66-.L63
	.long	.L65-.L63
	.long	.L64-.L63
	.long	.L62-.L63
	.text
.L60:
	cmpb	$123, %al	 ;, c
	je	.L77	 ;,
	jg	.L78	 ;,
	cmpb	$91, %al	 ;, c
	je	.L79	 ;,
	cmpb	$93, %al	 ;, c
	jne	.L61	 ;,
 ; D:/TC/src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp482
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L78:
	cmpb	$125, %al	 ;, c
	jne	.L61	 ;,
 ; D:/TC/src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp477
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L74:
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp474
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L73:
 ; D:/TC/src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp475
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L77:
 ; D:/TC/src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp476
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L70:
 ; D:/TC/src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp478
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L76:
 ; D:/TC/src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp479
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L68:
 ; D:/TC/src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp480
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L79:
 ; D:/TC/src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp481
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L66:
 ; D:/TC/src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp483
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L71:
 ; D:/TC/src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp484
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L69:
 ; D:/TC/src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp485
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L72:
 ; D:/TC/src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp486
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L67:
 ; D:/TC/src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp487
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L75:
 ; D:/TC/src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp488
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L65:
 ; D:/TC/src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp489
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L62:
 ; D:/TC/src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	%r8, %r9	 ; _465,
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp490
	movq	%rdx, %r8	 ; pretmp_450,
	jmp	.L189	 ;
.L64:
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp491
	movq	%r8, %r9	 ; _465,
	movq	%rdx, %r8	 ; pretmp_450,
.L189:
	movq	(%rax), %rdx	 ;,
	movl	$5, %ecx	 ;,
	jmp	.L188	 ;
.L61:
 ; D:/TC/src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	(%rbx), %r9	 ; lexer_267(D)->filename,
	leaq	.LC6(%rip), %rcx	 ;, tmp492
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
.L186:
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
.L188:
 ; D:/TC/src/lexer.c:216: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	create_token	 ;
.L197:
 ; D:/TC/src/lexer.c:136:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:137:             if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L187	 ;,
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rbx), %r8	 ; lexer_267(D)->line, _91
	movq	16(%rbx), %rax	 ; lexer_267(D)->position, tmp529
	movq	%r8, 32(%rsp)	 ; _91, %sfp
	leaq	-2(%rax), %rdx	 ;, tmp392
	jmp	.L192	 ;
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp87, source
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %ecx	 ;,
 ; D:/TC/src/lexer.c:3: Lexer* create_lexer(string source, size_t length, string filename) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp88, length
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp89, filename
	subq	$32, %rsp	 ;,
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory	 ;
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/lexer.c:6:     lexer->position = 0;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/lexer.c:5:     lexer->source = source;
	movq	%rdi, 8(%rax)	 ; source, lexer_3->source
 ; D:/TC/src/lexer.c:6:     lexer->position = 0;
	movq	%rdx, 16(%rax)	 ;, lexer_3->position
 ; D:/TC/src/lexer.c:7:     lexer->length = length;
	movq	%rsi, 24(%rax)	 ; length, lexer_3->length
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	movq	%rcx, 32(%rax)	 ;, lexer_3->line
	movq	%rcx, 40(%rax)	 ;, lexer_3->column
	movq	%rcx, 48(%rax)	 ;, lexer_3->peeked_token
 ; D:/TC/src/lexer.c:13:     lexer->peeked_column = 0;
	movq	%rcx, 56(%rax)	 ;, lexer_3->peeked_position
	movq	%rcx, 64(%rax)	 ;, lexer_3->peeked_line
 ; D:/TC/src/lexer.c:14:     lexer->current_token = NULL;
	movq	%rcx, 72(%rax)	 ;, lexer_3->peeked_column
	movq	%rcx, 80(%rax)	 ;, lexer_3->current_token
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
	movq	%rcx, %rbx	 ; tmp95, lexer
	subq	$32, %rsp	 ;,
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	48(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L201	 ;,
 ; D:/TC/src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	56(%rcx), %rdx	 ; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
 ; D:/TC/src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rcx)	 ; <retval>, lexer_8(D)->current_token
 ; D:/TC/src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	%rdx, 16(%rcx)	 ; lexer_8(D)->peeked_position, lexer_8(D)->position
 ; D:/TC/src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	64(%rcx), %rdx	 ; lexer_8(D)->peeked_line, lexer_8(D)->peeked_line
	movq	%rdx, 32(%rcx)	 ; lexer_8(D)->peeked_line, lexer_8(D)->line
 ; D:/TC/src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	72(%rcx), %rdx	 ; lexer_8(D)->peeked_column, lexer_8(D)->peeked_column
	movq	%rdx, 40(%rcx)	 ; lexer_8(D)->peeked_column, lexer_8(D)->column
 ; D:/TC/src/lexer.c:224:         lexer->peeked_token = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, 48(%rcx)	 ;, lexer_8(D)->peeked_token
 ; D:/TC/src/lexer.c:225:         return lexer->current_token;
	jmp	.L200	 ;
.L201:
 ; D:/TC/src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; D:/TC/src/lexer.c:228:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	 ; <retval>, lexer_8(D)->current_token
.L200:
 ; D:/TC/src/lexer.c:229: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	48(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; <retval>
	jne	.L207	 ;,
 ; D:/TC/src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rbp	 ;
 ; D:/TC/src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
 ; D:/TC/src/lexer.c:231: Token* peek_next_token(Lexer* lexer, bool skip_comment) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp98, lexer
	subq	$40, %rsp	 ;,
 ; D:/TC/src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rcx), %rbp	 ; lexer_9(D)->position, saved_position
 ; D:/TC/src/lexer.c:235:     size_t saved_line = lexer->line;
	movq	32(%rcx), %rdi	 ; lexer_9(D)->line, saved_line
 ; D:/TC/src/lexer.c:236:     size_t saved_column = lexer->column;
	movq	40(%rcx), %rsi	 ; lexer_9(D)->column, saved_column
 ; D:/TC/src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	call	get_next_token	 ;
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	16(%rbx), %rdx	 ; lexer_9(D)->position, lexer_9(D)->position
 ; D:/TC/src/lexer.c:241:     lexer->position = saved_position;
	movq	%rbp, 16(%rbx)	 ; saved_position, lexer_9(D)->position
 ; D:/TC/src/lexer.c:244:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	 ; <retval>, lexer_9(D)->peeked_token
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	%rdx, 56(%rbx)	 ; lexer_9(D)->position, lexer_9(D)->peeked_position
 ; D:/TC/src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	32(%rbx), %rdx	 ; lexer_9(D)->line, lexer_9(D)->line
 ; D:/TC/src/lexer.c:242:     lexer->line = saved_line;
	movq	%rdi, 32(%rbx)	 ; saved_line, lexer_9(D)->line
 ; D:/TC/src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	%rdx, 64(%rbx)	 ; lexer_9(D)->line, lexer_9(D)->peeked_line
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	 ; lexer_9(D)->column, lexer_9(D)->column
 ; D:/TC/src/lexer.c:243:     lexer->column = saved_column;
	movq	%rsi, 40(%rbx)	 ; saved_column, lexer_9(D)->column
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	%rdx, 72(%rbx)	 ; lexer_9(D)->column, lexer_9(D)->peeked_column
 ; D:/TC/src/lexer.c:246: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L207:
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
 ; D:/TC/src/lexer.c:256:     lexer->peeked_token = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 16(%rcx)	 ;, lexer_2(D)->position
	movq	%rax, 32(%rcx)	 ;, lexer_2(D)->line
	movq	%rax, 40(%rcx)	 ;, lexer_2(D)->column
 ; D:/TC/src/lexer.c:260:     lexer->current_token = NULL;
	movq	%rax, 48(%rcx)	 ;, lexer_2(D)->peeked_token
	movq	%rax, 56(%rcx)	 ;, lexer_2(D)->peeked_position
	movq	%rax, 64(%rcx)	 ;, lexer_2(D)->peeked_line
	movq	%rax, 72(%rcx)	 ;, lexer_2(D)->peeked_column
	movq	%rax, 80(%rcx)	 ;, lexer_2(D)->current_token
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

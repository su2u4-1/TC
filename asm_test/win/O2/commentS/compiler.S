	.file	"D:\\TC\\src\\compiler.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
	.text
	.p2align 4
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
read_source:
	pushq	%rdi	 ;
 ; D:\TC\src\compiler.c:7:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
 ; D:\TC\src\compiler.c:6: string read_source(FILE* file, size_t* length) {
	movq	%rcx, %rdi	 ; tmp104, file
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp105, length
 ; D:\TC\src\compiler.c:7:     fseek(file, 0, SEEK_END);
	xorl	%edx, %edx	 ;
 ; D:\TC\src\compiler.c:6: string read_source(FILE* file, size_t* length) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:7:     fseek(file, 0, SEEK_END);
	call	fseek	 ;
 ; D:\TC\src\compiler.c:8:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:9:     fseek(file, 0, SEEK_SET);
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:8:     *length = (size_t)ftell(file);
	movq	%rax, (%rsi)	 ; tmp106, *length_19(D)
 ; D:\TC\src\compiler.c:9:     fseek(file, 0, SEEK_SET);
	call	fseek	 ;
 ; D:\TC\src\compiler.c:11:     string source = create_string_not_check("", *length + 1);
	movq	(%rsi), %rax	 ; *length_19(D), tmp111
	leaq	.LC0(%rip), %rcx	 ;, tmp98
	leaq	1(%rax), %rdx	 ;, tmp96
	call	create_string_not_check	 ;
 ; D:\TC\src\compiler.c:12:     size_t bytes_read = fread(source, 1, *length, file);
	movq	(%rsi), %r8	 ; *length_19(D),
	movq	%rdi, %r9	 ; file,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
 ; D:\TC\src\compiler.c:11:     string source = create_string_not_check("", *length + 1);
	movq	%rax, %rbx	 ; tmp107, <retval>
 ; D:\TC\src\compiler.c:12:     size_t bytes_read = fread(source, 1, *length, file);
	call	fread	 ;
 ; D:\TC\src\compiler.c:13:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	 ;, *_6
 ; D:\TC\src\compiler.c:14:     *length = bytes_read;
	movq	%rax, (%rsi)	 ; bytes_read, *length_19(D)
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	testq	%rax, %rax	 ; bytes_read
	je	.L1	 ;,
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	 ; i
	.p2align 4,,10
	.p2align 3
.L4:
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	 ; MEM[(char *)source_23 + i_34 * 1], tmp100
	andl	$-5, %edx	 ;, tmp100
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp100
	jne	.L3	 ;,
 ; D:\TC\src\compiler.c:18:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_23 + i_34 * 1]
.L3:
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	 ;, i
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	cmpq	(%rsi), %rax	 ; *length_19(D), i
	jb	.L4	 ;,
.L1:
 ; D:\TC\src\compiler.c:21: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC2:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC3:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC4:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC5:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC6:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC7:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC8:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC9:
	.ascii "\\0\0"
.LC10:
	.ascii "\\n\0"
.LC11:
	.ascii "\\t\0"
.LC12:
	.ascii "\\r\0"
.LC13:
	.ascii "'\12\0"
	.text
	.p2align 4
	.globl	output_one_token
	.def	output_one_token;	.scl	2;	.type	32;	.endef
output_one_token:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp181, file
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp182, token
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	cmpl	$7, 24(%rdx)	 ;, token_45(D)->type
	ja	.L12	 ;,
	movl	24(%rdx), %eax	 ; token_45(D)->type, token_45(D)->type
	leaq	.L14(%rip), %rdx	 ;, tmp124
	movslq	(%rdx,%rax,4), %rax	 ;, tmp126
	addq	%rdx, %rax	 ; tmp124, tmp127
 ; D:\TC\src\compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	jmp	*%rax	 ; tmp127
	.section .rdata,"dr"
	.align 4
.L14:
	.long	.L21-.L14
	.long	.L20-.L14
	.long	.L19-.L14
	.long	.L18-.L14
	.long	.L17-.L14
	.long	.L16-.L14
	.long	.L15-.L14
	.long	.L13-.L14
	.text
	.p2align 4,,10
	.p2align 3
.L19:
 ; D:\TC\src\compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp143
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L12:
 ; D:\TC\src\compiler.c:22: void output_one_token(FILE* file, Token* token) {
	xorl	%ebx, %ebx	 ; i
 ; D:\TC\src\compiler.c:49:             fputs("\\r", file);
	leaq	.LC12(%rip), %r12	 ;, tmp178
 ; D:\TC\src\compiler.c:45:             fputs("\\n", file);
	leaq	.LC10(%rip), %r13	 ;, tmp179
 ; D:\TC\src\compiler.c:43:             fputs("\\0", file);
	leaq	.LC9(%rip), %rbp	 ;, tmp180
	jmp	.L22	 ;
	.p2align 4,,10
	.p2align 3
.L23:
 ; D:\TC\src\compiler.c:44:         else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	je	.L30	 ;,
 ; D:\TC\src\compiler.c:46:         else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	je	.L31	 ;,
 ; D:\TC\src\compiler.c:48:         else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	je	.L32	 ;,
 ; D:\TC\src\compiler.c:51:             fputc(c, file);
	movq	%rdi, %rdx	 ; file,
	call	fputc	 ;
.L24:
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, %rbx	 ;, i
.L22:
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	(%rsi), %r14	 ; token_45(D)->lexeme, _37
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%r14, %rcx	 ; _37,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %rbx	 ; tmp183, i
	jnb	.L33	 ;,
 ; D:\TC\src\compiler.c:41:         char c = token->lexeme[i];
	movsbl	(%r14,%rbx), %ecx	 ; *_35,
 ; D:\TC\src\compiler.c:42:         if (c == '\0')
	testb	%cl, %cl	 ; c
	jne	.L23	 ;,
 ; D:\TC\src\compiler.c:43:             fputs("\\0", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; tmp180,
	call	fwrite	 ;
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:\TC\src\compiler.c:49:             fputs("\\r", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; tmp178,
	call	fwrite	 ;
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L30:
 ; D:\TC\src\compiler.c:45:             fputs("\\n", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp179,
	call	fwrite	 ;
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L33:
 ; D:\TC\src\compiler.c:54: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:53:     fprintf(file, "'\n");
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:\TC\src\compiler.c:54: }
	popq	%rbx	 ;
 ; D:\TC\src\compiler.c:53:     fprintf(file, "'\n");
	leaq	.LC13(%rip), %rcx	 ;, tmp177
 ; D:\TC\src\compiler.c:54: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\compiler.c:53:     fprintf(file, "'\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L31:
 ; D:\TC\src\compiler.c:47:             fputs("\\t", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp171
	call	fwrite	 ;
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L15:
 ; D:\TC\src\compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC7(%rip), %rdx	 ;, tmp163
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:\TC\src\compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC8(%rip), %rdx	 ;, tmp168
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
 ; D:\TC\src\compiler.c:54: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp133
 ; D:\TC\src\compiler.c:54: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %r8	 ;,
 ; D:\TC\src\compiler.c:54: }
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L20:
 ; D:\TC\src\compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp138
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L18:
 ; D:\TC\src\compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC4(%rip), %rdx	 ;, tmp148
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L17:
 ; D:\TC\src\compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC5(%rip), %rdx	 ;, tmp153
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L16:
 ; D:\TC\src\compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	.LC6(%rip), %rdx	 ;, tmp158
	leaq	1(%rax), %r8	 ;,
	call	fprintf	 ;
	jmp	.L12	 ;
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.p2align 4
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, lexer
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
 ; D:\TC\src\compiler.c:55: void output_token(FILE* file, Lexer* lexer) {
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp88, file
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	%rdi, %rcx	 ; lexer,
 ; D:\TC\src\compiler.c:55: void output_token(FILE* file, Lexer* lexer) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	call	get_next_token	 ;
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	je	.L35	 ;,
	movq	%rax, %rbx	 ; tmp90, current
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L42:
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp91, current
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	je	.L35	 ;,
.L36:
 ; D:\TC\src\compiler.c:57:         output_one_token(file, current);
	movq	%rbx, %rdx	 ; current,
	movq	%rsi, %rcx	 ; file,
	call	output_one_token	 ;
 ; D:\TC\src\compiler.c:58:         if (current->type == EOF_TOKEN)
	movl	24(%rbx), %eax	 ; current_18->type,
	testl	%eax, %eax	 ;
	jne	.L42	 ;,
.L35:
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:62: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rsi, %rcx	 ; file,
	leaq	.LC14(%rip), %rdx	 ;, tmp87
 ; D:\TC\src\compiler.c:62: }
	popq	%rbx	 ;
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp92
 ; D:\TC\src\compiler.c:62: }
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.p2align 4
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp93, parser
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp91, file
	movq	%rdx, %rcx	 ; tmp92, lexer
	subq	$40, %rsp	 ;,
 ; D:\TC\src\compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp88
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope
	call	parse_code	 ;
 ; D:\TC\src\compiler.c:65:     output_code(ast_root, file, 0, parser);
	movq	%rbx, %rdx	 ; file,
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rcx	 ; tmp94, ast_root
 ; D:\TC\src\compiler.c:65:     output_code(ast_root, file, 0, parser);
	call	output_code	 ;
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:67: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; file,
	leaq	.LC14(%rip), %rdx	 ;, tmp90
 ; D:\TC\src\compiler.c:67: }
	popq	%rbx	 ;
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp95
 ; D:\TC\src\compiler.c:67: }
	popq	%rsi	 ;
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC15:
	.ascii "r\0"
.LC16:
	.ascii "Error opening file: %s\0"
.LC17:
	.ascii ".token\0"
.LC18:
	.ascii "w\0"
.LC19:
	.ascii "Error opening file: %s\12\0"
.LC20:
	.ascii ".ast\0"
.LC21:
	.ascii ".tc\0"
	.text
	.p2align 4
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%r12	 ;
	movl	%edx, %r12d	 ; tmp128, o_token
	pushq	%rbp	 ;
	movl	%r8d, %ebp	 ; tmp129, o_ast
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:\TC\src\compiler.c:69:     File* file = create_file(name);
	call	create_file	 ;
 ; D:\TC\src\compiler.c:70:     string filename = get_full_path(file);
	movq	%rax, %rcx	 ; file,
 ; D:\TC\src\compiler.c:69:     File* file = create_file(name);
	movq	%rax, %rbx	 ; tmp130, file
 ; D:\TC\src\compiler.c:70:     string filename = get_full_path(file);
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:72:     FILE* source_file = fopen(filename, "r");
	leaq	.LC15(%rip), %rdx	 ;, tmp110
 ; D:\TC\src\compiler.c:71:     size_t length = 0;
	movq	$0, 40(%rsp)	 ;, length
 ; D:\TC\src\compiler.c:72:     FILE* source_file = fopen(filename, "r");
	movq	%rax, %rcx	 ; filename,
 ; D:\TC\src\compiler.c:70:     string filename = get_full_path(file);
	movq	%rax, %rdi	 ; tmp131, filename
 ; D:\TC\src\compiler.c:72:     FILE* source_file = fopen(filename, "r");
	call	fopen	 ;
 ; D:\TC\src\compiler.c:73:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	je	.L53	 ;,
	movq	%rax, %rsi	 ; tmp132, source_file
 ; D:\TC\src\compiler.c:77:     string source = read_source(source_file, &length);
	leaq	40(%rsp), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; source_file,
	call	read_source	 ;
 ; D:\TC\src\compiler.c:78:     fclose(source_file);
	movq	%rsi, %rcx	 ; source_file,
 ; D:\TC\src\compiler.c:77:     string source = read_source(source_file, &length);
	movq	%rax, %rdi	 ; tmp134, source
 ; D:\TC\src\compiler.c:78:     fclose(source_file);
	call	fclose	 ;
 ; D:\TC\src\compiler.c:79:     Lexer* lexer = create_lexer(source, length);
	movq	40(%rsp), %rdx	 ; length,
	movq	%rdi, %rcx	 ; source,
	call	create_lexer	 ;
	movq	%rax, %rsi	 ; tmp135, lexer
 ; D:\TC\src\compiler.c:80:     if (o_token) {
	testb	%r12b, %r12b	 ; o_token
	jne	.L54	 ;,
.L47:
 ; D:\TC\src\compiler.c:91:     reset_lexer(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:92:     Parser* parser = create_parser(file);
	movq	%rbx, %rcx	 ; file,
	call	create_parser	 ;
	movq	%rax, %rdi	 ; tmp140, parser
 ; D:\TC\src\compiler.c:93:     if (o_ast) {
	testb	%bpl, %bpl	 ; o_ast
	jne	.L55	 ;,
 ; D:\TC\src\compiler.c:105: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L54:
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp115
	call	create_string	 ;
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rdx	 ; tmp136, _4
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:82:         string out_token_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:83:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp116
	movq	%rax, %rcx	 ; out_token_name,
 ; D:\TC\src\compiler.c:82:         string out_token_name = get_full_path(file);
	movq	%rax, %r12	 ; tmp137, out_token_name
 ; D:\TC\src\compiler.c:83:         FILE* out_token_file = fopen(out_token_name, "w");
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp138, out_token_file
 ; D:\TC\src\compiler.c:84:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	je	.L56	 ;,
 ; D:\TC\src\compiler.c:87:             output_token(out_token_file, lexer);
	movq	%rsi, %rdx	 ; lexer,
	movq	%rax, %rcx	 ; out_token_file,
	call	output_token	 ;
 ; D:\TC\src\compiler.c:88:             fclose(out_token_file);
	movq	%rdi, %rcx	 ; out_token_file,
	call	fclose	 ;
	jmp	.L47	 ;
	.p2align 4,,10
	.p2align 3
.L55:
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp119
	call	create_string	 ;
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rdx	 ; tmp141, _7
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:95:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp120
 ; D:\TC\src\compiler.c:95:         string out_ast_name = get_full_path(file);
	movq	%rax, %rbp	 ; tmp142, out_ast_name
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	call	create_string	 ;
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movq	%rax, %rdx	 ; tmp143, _8
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:97:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp121
	movq	%rbp, %rcx	 ; out_ast_name,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp144, out_ast_file
 ; D:\TC\src\compiler.c:98:         if (out_ast_file == NULL)
	testq	%rax, %rax	 ; out_ast_file
	je	.L57	 ;,
 ; D:\TC\src\compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp124
	movq	%rdi, %r8	 ; parser,
	movq	%rsi, %rcx	 ; lexer,
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope
	call	parse_code	 ;
 ; D:\TC\src\compiler.c:65:     output_code(ast_root, file, 0, parser);
	movq	%rdi, %r9	 ; parser,
	movq	%rbx, %rdx	 ; out_ast_file,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rcx	 ; tmp146, ast_root
 ; D:\TC\src\compiler.c:65:     output_code(ast_root, file, 0, parser);
	call	output_code	 ;
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; out_ast_file,
	leaq	.LC14(%rip), %rdx	 ;, tmp126
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp147
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:105: }
	addq	$48, %rsp	 ;,
 ; D:\TC\src\compiler.c:102:             fclose(out_ast_file);
	movq	%rbx, %rcx	 ; out_ast_file,
 ; D:\TC\src\compiler.c:105: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:102:             fclose(out_ast_file);
	jmp	fclose	 ;
	.p2align 4,,10
	.p2align 3
.L57:
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%rbp, %r8	 ; out_ast_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp123
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
 ; D:\TC\src\compiler.c:105: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:\TC\src\compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%r12, %r8	 ; out_token_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp118
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	call	fprintf	 ;
	jmp	.L47	 ;
	.p2align 4,,10
	.p2align 3
.L53:
 ; D:\TC\src\compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC16(%rip), %rdx	 ;, tmp112
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
 ; D:\TC\src\compiler.c:105: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	jmp	fprintf	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope

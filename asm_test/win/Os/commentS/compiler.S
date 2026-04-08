	.file	"compiler.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
	.text
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
read_source:
	pushq	%rdi	 ;
 ; D:/TC/src/compiler.c:8:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
 ; D:/TC/src/compiler.c:7: string read_source(FILE* file, size_t* length) {
	movq	%rcx, %rdi	 ; tmp103, file
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp104, length
 ; D:/TC/src/compiler.c:8:     fseek(file, 0, SEEK_END);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/compiler.c:7: string read_source(FILE* file, size_t* length) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/compiler.c:8:     fseek(file, 0, SEEK_END);
	call	fseek	 ;
 ; D:/TC/src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; D:/TC/src/compiler.c:10:     fseek(file, 0, SEEK_SET);
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; file,
 ; D:/TC/src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	%rax, (%rsi)	 ; tmp105, *length_19(D)
 ; D:/TC/src/compiler.c:10:     fseek(file, 0, SEEK_SET);
	call	fseek	 ;
 ; D:/TC/src/compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	(%rsi), %rax	 ; *length_19(D), tmp110
	leaq	.LC0(%rip), %rcx	 ;, tmp98
	leaq	1(%rax), %rdx	 ;, tmp96
	call	create_string_not_check	 ;
 ; D:/TC/src/compiler.c:13:     size_t bytes_read = fread(source, 1, *length, file);
	movq	(%rsi), %r8	 ; *length_19(D),
	movq	%rdi, %r9	 ; file,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
 ; D:/TC/src/compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	%rax, %rbx	 ; tmp106, <retval>
 ; D:/TC/src/compiler.c:13:     size_t bytes_read = fread(source, 1, *length, file);
	call	fread	 ;
 ; D:/TC/src/compiler.c:14:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	 ;, *_6
 ; D:/TC/src/compiler.c:15:     *length = bytes_read;
	movq	%rax, (%rsi)	 ; bytes_read, *length_19(D)
 ; D:/TC/src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	 ; i
.L2:
 ; D:/TC/src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	cmpq	(%rsi), %rax	 ; *length_19(D), i
	jnb	.L7	 ;,
 ; D:/TC/src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	movb	(%rbx,%rax), %dl	 ; MEM[(char *)source_23 + i_12 * 1], tmp99
	andl	$-5, %edx	 ;, tmp99
 ; D:/TC/src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp99
	jne	.L3	 ;,
 ; D:/TC/src/compiler.c:19:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_23 + i_12 * 1]
.L3:
 ; D:/TC/src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	incq	%rax	 ; i
	jmp	.L2	 ;
.L7:
 ; D:/TC/src/compiler.c:22: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC2:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC3:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC4:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC5:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC6:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC7:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
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
	.globl	output_one_token
	.def	output_one_token;	.scl	2;	.type	32;	.endef
output_one_token:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp184, token
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp183, file
	subq	$32, %rsp	 ;,
	cmpl	$7, 24(%rdx)	 ;, token_45(D)->type
	ja	.L9	 ;,
	movl	24(%rdx), %edx	 ; token_45(D)->type, token_45(D)->type
	leaq	.L11(%rip), %rax	 ;, tmp124
	movslq	(%rax,%rdx,4), %rcx	 ;, tmp126
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	addq	%rax, %rcx	 ; tmp124, tmp127
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
 ; D:/TC/src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	jmp	*%rcx	 ; tmp127
	.section .rdata,"dr"
	.align 4
.L11:
	.long	.L18-.L11
	.long	.L17-.L11
	.long	.L16-.L11
	.long	.L15-.L11
	.long	.L14-.L11
	.long	.L13-.L11
	.long	.L12-.L11
	.long	.L10-.L11
	.text
.L18:
 ; D:/TC/src/compiler.c:55: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	%rbx, %rcx	 ; file,
	leaq	.LC1(%rip), %rdx	 ;, tmp133
 ; D:/TC/src/compiler.c:55: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	jmp	fprintf	 ;
.L17:
 ; D:/TC/src/compiler.c:28:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC2(%rip), %rdx	 ;, tmp138
	jmp	.L27	 ;
.L16:
 ; D:/TC/src/compiler.c:30:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC3(%rip), %rdx	 ;, tmp143
.L27:
	movq	%rbx, %rcx	 ; file,
	call	fprintf	 ;
.L9:
 ; D:/TC/src/compiler.c:23: void output_one_token(FILE* file, Token* token) {
	xorl	%edi, %edi	 ; i
 ; D:/TC/src/compiler.c:50:             fputs("\\r", file);
	leaq	.LC12(%rip), %rbp	 ;, tmp180
 ; D:/TC/src/compiler.c:46:             fputs("\\n", file);
	leaq	.LC10(%rip), %r12	 ;, tmp181
 ; D:/TC/src/compiler.c:44:             fputs("\\0", file);
	leaq	.LC9(%rip), %r13	 ;, tmp182
	jmp	.L19	 ;
.L15:
 ; D:/TC/src/compiler.c:32:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC4(%rip), %rdx	 ;, tmp148
	jmp	.L27	 ;
.L14:
 ; D:/TC/src/compiler.c:34:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC5(%rip), %rdx	 ;, tmp153
	jmp	.L27	 ;
.L13:
 ; D:/TC/src/compiler.c:36:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC6(%rip), %rdx	 ;, tmp158
	jmp	.L27	 ;
.L12:
 ; D:/TC/src/compiler.c:38:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC7(%rip), %rdx	 ;, tmp163
	jmp	.L27	 ;
.L10:
 ; D:/TC/src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC8(%rip), %rdx	 ;, tmp168
	jmp	.L27	 ;
.L25:
 ; D:/TC/src/compiler.c:42:         char c = token->lexeme[i];
	movsbl	(%r14,%rdi), %ecx	 ; *_35,
 ; D:/TC/src/compiler.c:44:             fputs("\\0", file);
	movq	%rbx, %rdx	 ; file,
 ; D:/TC/src/compiler.c:43:         if (c == '\0')
	testb	%cl, %cl	 ; c
	jne	.L20	 ;,
 ; D:/TC/src/compiler.c:44:             fputs("\\0", file);
	movq	%r13, %rcx	 ; tmp182,
.L28:
 ; D:/TC/src/compiler.c:46:             fputs("\\n", file);
	call	fputs	 ;
.L21:
 ; D:/TC/src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	incq	%rdi	 ; i
.L19:
 ; D:/TC/src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	(%rsi), %r14	 ; token_45(D)->lexeme, _37
 ; D:/TC/src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%r14, %rcx	 ; _37,
	call	strlen	 ;
 ; D:/TC/src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %rdi	 ; tmp185, i
	jb	.L25	 ;,
	jmp	.L29	 ;
.L20:
 ; D:/TC/src/compiler.c:45:         else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	jne	.L22	 ;,
 ; D:/TC/src/compiler.c:46:             fputs("\\n", file);
	movq	%r12, %rcx	 ; tmp181,
	jmp	.L28	 ;
.L22:
 ; D:/TC/src/compiler.c:47:         else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	jne	.L23	 ;,
 ; D:/TC/src/compiler.c:48:             fputs("\\t", file);
	leaq	.LC11(%rip), %rcx	 ;, tmp171
	jmp	.L28	 ;
.L23:
 ; D:/TC/src/compiler.c:49:         else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	jne	.L24	 ;,
 ; D:/TC/src/compiler.c:50:             fputs("\\r", file);
	movq	%rbp, %rcx	 ; tmp180,
	jmp	.L28	 ;
.L24:
 ; D:/TC/src/compiler.c:52:             fputc(c, file);
	call	fputc	 ;
	jmp	.L21	 ;
.L29:
 ; D:/TC/src/compiler.c:55: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/compiler.c:54:     fprintf(file, "'\n");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC13(%rip), %rcx	 ;, tmp177
 ; D:/TC/src/compiler.c:55: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/compiler.c:54:     fprintf(file, "'\n");
	jmp	fputs	 ;
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, lexer
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp88, file
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
.L32:
 ; D:/TC/src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp92, current
 ; D:/TC/src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	je	.L34	 ;,
 ; D:/TC/src/compiler.c:58:         output_one_token(file, current);
	movq	%rbx, %rdx	 ; current,
	movq	%rsi, %rcx	 ; file,
	call	output_one_token	 ;
 ; D:/TC/src/compiler.c:59:         if (current->type == EOF_TOKEN)
	cmpl	$0, 24(%rbx)	 ;, current_3->type
	jne	.L32	 ;,
.L34:
 ; D:/TC/src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:/TC/src/compiler.c:63: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rsi, %rcx	 ; file,
	leaq	.LC14(%rip), %rdx	 ;, tmp87
 ; D:/TC/src/compiler.c:63: }
	popq	%rbx	 ;
 ; D:/TC/src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp91
 ; D:/TC/src/compiler.c:63: }
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp87, file
 ; D:/TC/src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/compiler.c:64: void output_ast(FILE* file, Code* ast) {
	movq	%rdx, %rcx	 ; tmp88, ast
 ; D:/TC/src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	movq	%rbx, %rdx	 ; file,
 ; D:/TC/src/compiler.c:64: void output_ast(FILE* file, Code* ast) {
	subq	$64, %rsp	 ;,
 ; D:/TC/src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	leaq	32(%rsp), %r9	 ;,
	call	output_code	 ;
 ; D:/TC/src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:/TC/src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; file,
	leaq	.LC14(%rip), %rdx	 ;, tmp86
 ; D:/TC/src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp89
 ; D:/TC/src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	fprintf	 ;
 ; D:/TC/src/compiler.c:68: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.globl	output_tac
	.def	output_tac;	.scl	2;	.type	32;	.endef
output_tac:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp86, file
 ; D:/TC/src/compiler.c:70:     output_TAC(tac, file, 0);
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/compiler.c:69: void output_tac(FILE* file, TAC* tac) {
	movq	%rdx, %rcx	 ; tmp87, tac
 ; D:/TC/src/compiler.c:70:     output_TAC(tac, file, 0);
	movq	%rbx, %rdx	 ; file,
 ; D:/TC/src/compiler.c:69: void output_tac(FILE* file, TAC* tac) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/compiler.c:70:     output_TAC(tac, file, 0);
	call	output_TAC	 ;
 ; D:/TC/src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:/TC/src/compiler.c:72: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; file,
	leaq	.LC14(%rip), %rdx	 ;, tmp85
 ; D:/TC/src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp88
 ; D:/TC/src/compiler.c:72: }
	popq	%rbx	 ;
 ; D:/TC/src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC15:
	.ascii "r\0"
.LC16:
	.ascii "Error opening file: %s\12\0"
.LC17:
	.ascii ".token\0"
.LC18:
	.ascii "w\0"
.LC19:
	.ascii ".ast\0"
.LC20:
	.ascii ".tc\0"
.LC21:
	.ascii ".tac\0"
	.text
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%r14	 ;
	pushq	%r13	 ;
	movl	%edx, %r13d	 ; tmp141, o_token
	pushq	%r12	 ;
	movl	%r8d, %r12d	 ; tmp142, o_ast
	pushq	%rbp	 ;
	movl	%r9d, %ebp	 ; tmp143, o_tac
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:/TC/src/compiler.c:74:     File* file = create_file(name);
	call	create_file	 ;
 ; D:/TC/src/compiler.c:75:     string filename = get_full_path(file);
	movq	%rax, %rcx	 ; file,
 ; D:/TC/src/compiler.c:74:     File* file = create_file(name);
	movq	%rax, %rbx	 ; tmp144, file
 ; D:/TC/src/compiler.c:75:     string filename = get_full_path(file);
	call	get_full_path	 ;
 ; D:/TC/src/compiler.c:76:     size_t length = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, 40(%rsp)	 ;, length
 ; D:/TC/src/compiler.c:77:     FILE* source_file = fopen(filename, "r");
	movq	%rax, %rcx	 ; filename,
	leaq	.LC15(%rip), %rdx	 ;, tmp119
 ; D:/TC/src/compiler.c:75:     string filename = get_full_path(file);
	movq	%rax, %rsi	 ; tmp145, filename
 ; D:/TC/src/compiler.c:77:     FILE* source_file = fopen(filename, "r");
	call	fopen	 ;
 ; D:/TC/src/compiler.c:78:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	je	.L51	 ;,
 ; D:/TC/src/compiler.c:82:     string source = read_source(source_file, &length);
	leaq	40(%rsp), %rdx	 ;, tmp122
	movq	%rax, %rdi	 ; tmp146, source_file
	movq	%rax, %rcx	 ; source_file,
	call	read_source	 ;
 ; D:/TC/src/compiler.c:83:     fclose(source_file);
	movq	%rdi, %rcx	 ; source_file,
 ; D:/TC/src/compiler.c:82:     string source = read_source(source_file, &length);
	movq	%rax, %r14	 ; tmp148, source
 ; D:/TC/src/compiler.c:83:     fclose(source_file);
	call	fclose	 ;
 ; D:/TC/src/compiler.c:84:     Lexer* lexer = create_lexer(source, length, filename);
	movq	40(%rsp), %rdx	 ; length,
	movq	%rsi, %r8	 ; filename,
	movq	%r14, %rcx	 ; source,
	call	create_lexer	 ;
	movq	%rax, %rsi	 ; tmp149, lexer
 ; D:/TC/src/compiler.c:85:     if (o_token) {
	testb	%r13b, %r13b	 ; o_token
	je	.L42	 ;,
 ; D:/TC/src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp124
	call	create_string	 ;
 ; D:/TC/src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rcx	 ; file,
 ; D:/TC/src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rdx	 ; tmp150, _4
 ; D:/TC/src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	call	change_file_extension	 ;
 ; D:/TC/src/compiler.c:87:         string out_token_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:/TC/src/compiler.c:88:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp125
	movq	%rax, %rcx	 ; out_token_name,
 ; D:/TC/src/compiler.c:87:         string out_token_name = get_full_path(file);
	movq	%rax, %r13	 ; tmp151, out_token_name
 ; D:/TC/src/compiler.c:88:         FILE* out_token_file = fopen(out_token_name, "w");
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp152, out_token_file
 ; D:/TC/src/compiler.c:89:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	jne	.L43	 ;,
 ; D:/TC/src/compiler.c:90:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:/TC/src/compiler.c:90:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%r13, %r8	 ; out_token_name,
	leaq	.LC16(%rip), %rdx	 ;, tmp127
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	call	fprintf	 ;
	jmp	.L42	 ;
.L43:
 ; D:/TC/src/compiler.c:92:             output_token(out_token_file, lexer);
	movq	%rax, %rcx	 ; out_token_file,
	movq	%rsi, %rdx	 ; lexer,
	call	output_token	 ;
 ; D:/TC/src/compiler.c:93:             fclose(out_token_file);
	movq	%rdi, %rcx	 ; out_token_file,
	call	fclose	 ;
.L42:
 ; D:/TC/src/compiler.c:96:     reset_lexer(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	reset_lexer	 ;
 ; D:/TC/src/compiler.c:97:     Parser* parser = create_parser(file);
	movq	%rbx, %rcx	 ; file,
	call	create_parser	 ;
	movq	%rax, %r8	 ; tmp154, parser
 ; D:/TC/src/compiler.c:99:     if (o_ast || o_tac)
	movl	%ebp, %eax	 ; o_tac, tmp167
	orb	%r12b, %al	 ; o_ast, tmp167
	je	.L40	 ;,
 ; D:/TC/src/compiler.c:100:         ast = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp129
	movq	%rsi, %rcx	 ; lexer,
	movq	(%rax), %rdx	 ; builtin_scope,
	call	parse_code	 ;
	movq	%rax, %rdi	 ; tmp155, ast
 ; D:/TC/src/compiler.c:101:     if (o_ast) {
	testb	%r12b, %r12b	 ; o_ast
	je	.L46	 ;,
 ; D:/TC/src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp130
	call	create_string	 ;
 ; D:/TC/src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rcx	 ; file,
 ; D:/TC/src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rdx	 ; tmp156, _9
 ; D:/TC/src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	call	change_file_extension	 ;
 ; D:/TC/src/compiler.c:103:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:/TC/src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp131
 ; D:/TC/src/compiler.c:103:         string out_ast_name = get_full_path(file);
	movq	%rax, %r12	 ; tmp157, out_ast_name
 ; D:/TC/src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	call	create_string	 ;
 ; D:/TC/src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rcx	 ; file,
 ; D:/TC/src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movq	%rax, %rdx	 ; tmp158, _10
 ; D:/TC/src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	call	change_file_extension	 ;
 ; D:/TC/src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp132
	movq	%r12, %rcx	 ; out_ast_name,
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp159, out_ast_file
 ; D:/TC/src/compiler.c:106:         if (out_ast_file == NULL)
	testq	%rax, %rax	 ; out_ast_file
	jne	.L47	 ;,
 ; D:/TC/src/compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:/TC/src/compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%r12, %r8	 ; out_ast_name,
	leaq	.LC16(%rip), %rdx	 ;, tmp134
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	call	fprintf	 ;
	jmp	.L46	 ;
.L47:
 ; D:/TC/src/compiler.c:109:             output_ast(out_ast_file, ast);
	movq	%rax, %rcx	 ; out_ast_file,
	movq	%rdi, %rdx	 ; ast,
	call	output_ast	 ;
 ; D:/TC/src/compiler.c:110:             fclose(out_ast_file);
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fclose	 ;
.L46:
 ; D:/TC/src/compiler.c:113:     if (o_tac) {
	testb	%bpl, %bpl	 ; o_tac
	je	.L40	 ;,
 ; D:/TC/src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movl	$4, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp135
	call	create_string	 ;
 ; D:/TC/src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movq	%rbx, %rcx	 ; file,
 ; D:/TC/src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movq	%rax, %rdx	 ; tmp161, _13
 ; D:/TC/src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	call	change_file_extension	 ;
 ; D:/TC/src/compiler.c:115:         string out_tac_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:/TC/src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp136
 ; D:/TC/src/compiler.c:115:         string out_tac_name = get_full_path(file);
	movq	%rax, %rsi	 ; tmp162, out_tac_name
 ; D:/TC/src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	call	create_string	 ;
 ; D:/TC/src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rcx	 ; file,
 ; D:/TC/src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movq	%rax, %rdx	 ; tmp163, _14
 ; D:/TC/src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	call	change_file_extension	 ;
 ; D:/TC/src/compiler.c:117:         FILE* out_tac_file = fopen(out_tac_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp137
	movq	%rsi, %rcx	 ; out_tac_name,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp164, out_tac_file
 ; D:/TC/src/compiler.c:118:         if (out_tac_file == NULL)
	testq	%rax, %rax	 ; out_tac_file
	jne	.L49	 ;,
.L51:
 ; D:/TC/src/compiler.c:119:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	call	__getreent	 ;
 ; D:/TC/src/compiler.c:119:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	movq	%rsi, %r8	 ; out_tac_name,
	leaq	.LC16(%rip), %rdx	 ;, tmp139
	movq	24(%rax), %rcx	 ;, _15->_stderr
 ; D:/TC/src/compiler.c:126: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/compiler.c:119:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	jmp	fprintf	 ;
.L49:
 ; D:/TC/src/compiler.c:121:             TAC* tac = tac_code(ast);
	movq	%rdi, %rcx	 ; ast,
	call	tac_code	 ;
 ; D:/TC/src/compiler.c:122:             output_tac(out_tac_file, tac);
	movq	%rbx, %rcx	 ; out_tac_file,
 ; D:/TC/src/compiler.c:121:             TAC* tac = tac_code(ast);
	movq	%rax, %rdx	 ; tmp166, tac
 ; D:/TC/src/compiler.c:122:             output_tac(out_tac_file, tac);
	call	output_tac	 ;
 ; D:/TC/src/compiler.c:126: }
	addq	$48, %rsp	 ;,
 ; D:/TC/src/compiler.c:123:             fclose(out_tac_file);
	movq	%rbx, %rcx	 ; out_tac_file,
 ; D:/TC/src/compiler.c:126: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/compiler.c:123:             fclose(out_tac_file);
	jmp	fclose	 ;
.L40:
 ; D:/TC/src/compiler.c:126: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	output_TAC;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	tac_code;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope

	.file	"D:\\TC\\src\\compiler.c"
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
 ; D:\TC\src\compiler.c:8:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
 ; D:\TC\src\compiler.c:7: string read_source(FILE* file, size_t* length) {
	movq	%rcx, %rdi	 ; tmp103, file
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp104, length
 ; D:\TC\src\compiler.c:8:     fseek(file, 0, SEEK_END);
	xorl	%edx, %edx	 ;
 ; D:\TC\src\compiler.c:7: string read_source(FILE* file, size_t* length) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:8:     fseek(file, 0, SEEK_END);
	call	fseek	 ;
 ; D:\TC\src\compiler.c:9:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:10:     fseek(file, 0, SEEK_SET);
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:9:     *length = (size_t)ftell(file);
	movq	%rax, (%rsi)	 ; tmp105, *length_19(D)
 ; D:\TC\src\compiler.c:10:     fseek(file, 0, SEEK_SET);
	call	fseek	 ;
 ; D:\TC\src\compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	(%rsi), %rax	 ; *length_19(D), tmp110
	leaq	.LC0(%rip), %rcx	 ;, tmp98
	leaq	1(%rax), %rdx	 ;, tmp96
	call	create_string_not_check	 ;
 ; D:\TC\src\compiler.c:13:     size_t bytes_read = fread(source, 1, *length, file);
	movq	(%rsi), %r8	 ; *length_19(D),
	movq	%rdi, %r9	 ; file,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
 ; D:\TC\src\compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	%rax, %rbx	 ; tmp106, <retval>
 ; D:\TC\src\compiler.c:13:     size_t bytes_read = fread(source, 1, *length, file);
	call	fread	 ;
 ; D:\TC\src\compiler.c:14:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	 ;, *_6
 ; D:\TC\src\compiler.c:15:     *length = bytes_read;
	movq	%rax, (%rsi)	 ; bytes_read, *length_19(D)
 ; D:\TC\src\compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	 ; i
.L2:
 ; D:\TC\src\compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	cmpq	(%rsi), %rax	 ; *length_19(D), i
	jnb	.L7	 ;,
 ; D:\TC\src\compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	movb	(%rbx,%rax), %dl	 ; MEM[(char *)source_23 + i_12 * 1], tmp99
	andl	$-5, %edx	 ;, tmp99
 ; D:\TC\src\compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp99
	jne	.L3	 ;,
 ; D:\TC\src\compiler.c:19:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_23 + i_12 * 1]
.L3:
 ; D:\TC\src\compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	incq	%rax	 ; i
	jmp	.L2	 ;
.L7:
 ; D:\TC\src\compiler.c:22: }
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
 ; D:\TC\src\compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
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
 ; D:\TC\src\compiler.c:55: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	%rbx, %rcx	 ; file,
	leaq	.LC1(%rip), %rdx	 ;, tmp133
 ; D:\TC\src\compiler.c:55: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	jmp	fprintf	 ;
.L17:
 ; D:\TC\src\compiler.c:28:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC2(%rip), %rdx	 ;, tmp138
	jmp	.L27	 ;
.L16:
 ; D:\TC\src\compiler.c:30:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC3(%rip), %rdx	 ;, tmp143
.L27:
	movq	%rbx, %rcx	 ; file,
	call	fprintf	 ;
.L9:
 ; D:\TC\src\compiler.c:23: void output_one_token(FILE* file, Token* token) {
	xorl	%edi, %edi	 ; i
 ; D:\TC\src\compiler.c:50:             fputs("\\r", file);
	leaq	.LC12(%rip), %rbp	 ;, tmp180
 ; D:\TC\src\compiler.c:46:             fputs("\\n", file);
	leaq	.LC10(%rip), %r12	 ;, tmp181
 ; D:\TC\src\compiler.c:44:             fputs("\\0", file);
	leaq	.LC9(%rip), %r13	 ;, tmp182
	jmp	.L19	 ;
.L15:
 ; D:\TC\src\compiler.c:32:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC4(%rip), %rdx	 ;, tmp148
	jmp	.L27	 ;
.L14:
 ; D:\TC\src\compiler.c:34:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC5(%rip), %rdx	 ;, tmp153
	jmp	.L27	 ;
.L13:
 ; D:\TC\src\compiler.c:36:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC6(%rip), %rdx	 ;, tmp158
	jmp	.L27	 ;
.L12:
 ; D:\TC\src\compiler.c:38:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC7(%rip), %rdx	 ;, tmp163
	jmp	.L27	 ;
.L10:
 ; D:\TC\src\compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC8(%rip), %rdx	 ;, tmp168
	jmp	.L27	 ;
.L25:
 ; D:\TC\src\compiler.c:42:         char c = token->lexeme[i];
	movsbl	(%r14,%rdi), %ecx	 ; *_35,
 ; D:\TC\src\compiler.c:44:             fputs("\\0", file);
	movq	%rbx, %rdx	 ; file,
 ; D:\TC\src\compiler.c:43:         if (c == '\0')
	testb	%cl, %cl	 ; c
	jne	.L20	 ;,
 ; D:\TC\src\compiler.c:44:             fputs("\\0", file);
	movq	%r13, %rcx	 ; tmp182,
.L28:
 ; D:\TC\src\compiler.c:46:             fputs("\\n", file);
	call	fputs	 ;
.L21:
 ; D:\TC\src\compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	incq	%rdi	 ; i
.L19:
 ; D:\TC\src\compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	(%rsi), %r14	 ; token_45(D)->lexeme, _37
 ; D:\TC\src\compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%r14, %rcx	 ; _37,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %rdi	 ; tmp185, i
	jb	.L25	 ;,
	jmp	.L29	 ;
.L20:
 ; D:\TC\src\compiler.c:45:         else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	jne	.L22	 ;,
 ; D:\TC\src\compiler.c:46:             fputs("\\n", file);
	movq	%r12, %rcx	 ; tmp181,
	jmp	.L28	 ;
.L22:
 ; D:\TC\src\compiler.c:47:         else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	jne	.L23	 ;,
 ; D:\TC\src\compiler.c:48:             fputs("\\t", file);
	leaq	.LC11(%rip), %rcx	 ;, tmp171
	jmp	.L28	 ;
.L23:
 ; D:\TC\src\compiler.c:49:         else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	jne	.L24	 ;,
 ; D:\TC\src\compiler.c:50:             fputs("\\r", file);
	movq	%rbp, %rcx	 ; tmp180,
	jmp	.L28	 ;
.L24:
 ; D:\TC\src\compiler.c:52:             fputc(c, file);
	call	fputc	 ;
	jmp	.L21	 ;
.L29:
 ; D:\TC\src\compiler.c:55: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:54:     fprintf(file, "'\n");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC13(%rip), %rcx	 ;, tmp177
 ; D:\TC\src\compiler.c:55: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\compiler.c:54:     fprintf(file, "'\n");
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
 ; D:\TC\src\compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp92, current
 ; D:\TC\src\compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	je	.L34	 ;,
 ; D:\TC\src\compiler.c:58:         output_one_token(file, current);
	movq	%rbx, %rdx	 ; current,
	movq	%rsi, %rcx	 ; file,
	call	output_one_token	 ;
 ; D:\TC\src\compiler.c:59:         if (current->type == EOF_TOKEN)
	cmpl	$0, 24(%rbx)	 ;, current_3->type
	jne	.L32	 ;,
.L34:
 ; D:\TC\src\compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:63: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rsi, %rcx	 ; file,
	leaq	.LC14(%rip), %rdx	 ;, tmp87
 ; D:\TC\src\compiler.c:63: }
	popq	%rbx	 ;
 ; D:\TC\src\compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp91
 ; D:\TC\src\compiler.c:63: }
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:\TC\src\compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp90, file
	movq	%rdx, %rcx	 ; tmp91, lexer
	subq	$48, %rsp	 ;,
 ; D:\TC\src\compiler.c:65:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp88
	movq	%r8, 40(%rsp)	 ; parser, %sfp
	movq	(%rax), %rdx	 ; builtin_scope,
	call	parse_code	 ;
 ; D:\TC\src\compiler.c:66:     output_code(ast_root, file, 0, parser);
	movq	40(%rsp), %r9	 ; %sfp, parser
	movq	%rbx, %rdx	 ; file,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\compiler.c:65:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rcx	 ; tmp93, ast_root
 ; D:\TC\src\compiler.c:66:     output_code(ast_root, file, 0, parser);
	call	output_code	 ;
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:68: }
	addq	$48, %rsp	 ;,
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; file,
	leaq	.LC14(%rip), %rdx	 ;, tmp89
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp94
 ; D:\TC\src\compiler.c:68: }
	popq	%rbx	 ;
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
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
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
parse_file:
	pushq	%r12	 ;
	movl	%r8d, %r12d	 ; tmp123, o_ast
	pushq	%rbp	 ;
	movl	%edx, %ebp	 ; tmp122, o_token
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:\TC\src\compiler.c:70:     File* file = create_file(name);
	call	create_file	 ;
 ; D:\TC\src\compiler.c:71:     string filename = get_full_path(file);
	movq	%rax, %rcx	 ; file,
 ; D:\TC\src\compiler.c:70:     File* file = create_file(name);
	movq	%rax, %rbx	 ; tmp124, file
 ; D:\TC\src\compiler.c:71:     string filename = get_full_path(file);
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:72:     size_t length = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, 56(%rsp)	 ;, length
 ; D:\TC\src\compiler.c:73:     FILE* source_file = fopen(filename, "r");
	movq	%rax, %rcx	 ; filename,
	leaq	.LC15(%rip), %rdx	 ;, tmp107
 ; D:\TC\src\compiler.c:71:     string filename = get_full_path(file);
	movq	%rax, %rdi	 ; tmp125, filename
 ; D:\TC\src\compiler.c:73:     FILE* source_file = fopen(filename, "r");
	call	fopen	 ;
 ; D:\TC\src\compiler.c:74:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	jne	.L39	 ;,
 ; D:\TC\src\compiler.c:75:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:75:         fprintf(stderr, "Error opening file: %s", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC16(%rip), %rdx	 ;, tmp109
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
	jmp	.L45	 ;
.L39:
	movq	%rax, %rsi	 ; tmp126, source_file
 ; D:\TC\src\compiler.c:78:     string source = read_source(source_file, &length);
	leaq	56(%rsp), %rdx	 ;, tmp110
	movq	%rax, %rcx	 ; source_file,
	call	read_source	 ;
 ; D:\TC\src\compiler.c:79:     fclose(source_file);
	movq	%rsi, %rcx	 ; source_file,
 ; D:\TC\src\compiler.c:78:     string source = read_source(source_file, &length);
	movq	%rax, %rdi	 ; tmp128, source
 ; D:\TC\src\compiler.c:79:     fclose(source_file);
	call	fclose	 ;
 ; D:\TC\src\compiler.c:80:     Lexer* lexer = create_lexer(source, length);
	movq	56(%rsp), %rdx	 ; length,
	movq	%rdi, %rcx	 ; source,
	call	create_lexer	 ;
	movq	%rax, %rsi	 ; tmp129, lexer
 ; D:\TC\src\compiler.c:81:     if (o_token) {
	testb	%bpl, %bpl	 ; o_token
	je	.L40	 ;,
 ; D:\TC\src\compiler.c:82:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp112
	call	create_string	 ;
 ; D:\TC\src\compiler.c:82:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:82:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rdx	 ; tmp130, _4
 ; D:\TC\src\compiler.c:82:         change_file_extension(file, create_string(".token", 6));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:83:         string out_token_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:84:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; out_token_name,
 ; D:\TC\src\compiler.c:83:         string out_token_name = get_full_path(file);
	movq	%rax, %rbp	 ; tmp131, out_token_name
 ; D:\TC\src\compiler.c:84:         FILE* out_token_file = fopen(out_token_name, "w");
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp132, out_token_file
 ; D:\TC\src\compiler.c:85:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	jne	.L41	 ;,
 ; D:\TC\src\compiler.c:86:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:86:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%rbp, %r8	 ; out_token_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp115
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	call	fprintf	 ;
	jmp	.L40	 ;
.L41:
 ; D:\TC\src\compiler.c:88:             output_token(out_token_file, lexer);
	movq	%rax, %rcx	 ; out_token_file,
	movq	%rsi, %rdx	 ; lexer,
	call	output_token	 ;
 ; D:\TC\src\compiler.c:89:             fclose(out_token_file);
	movq	%rdi, %rcx	 ; out_token_file,
	call	fclose	 ;
.L40:
 ; D:\TC\src\compiler.c:92:     reset_lexer(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:93:     Parser* parser = create_parser(file);
	movq	%rbx, %rcx	 ; file,
	call	create_parser	 ;
 ; D:\TC\src\compiler.c:94:     if (o_ast) {
	testb	%r12b, %r12b	 ; o_ast
	je	.L38	 ;,
 ; D:\TC\src\compiler.c:95:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp116
	movq	%rax, 40(%rsp)	 ; parser, %sfp
	call	create_string	 ;
 ; D:\TC\src\compiler.c:95:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:95:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rdx	 ; tmp135, _7
 ; D:\TC\src\compiler.c:95:         change_file_extension(file, create_string(".ast", 4));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:96:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:97:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp117
 ; D:\TC\src\compiler.c:96:         string out_ast_name = get_full_path(file);
	movq	%rax, %rdi	 ; tmp136, out_ast_name
 ; D:\TC\src\compiler.c:97:         change_file_extension(file, create_string(".tc", 3));
	call	create_string	 ;
 ; D:\TC\src\compiler.c:97:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:97:         change_file_extension(file, create_string(".tc", 3));
	movq	%rax, %rdx	 ; tmp137, _8
 ; D:\TC\src\compiler.c:97:         change_file_extension(file, create_string(".tc", 3));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:98:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp118
	movq	%rdi, %rcx	 ; out_ast_name,
	call	fopen	 ;
 ; D:\TC\src\compiler.c:99:         if (out_ast_file == NULL)
	movq	40(%rsp), %r8	 ; %sfp, parser
	testq	%rax, %rax	 ; out_ast_file
 ; D:\TC\src\compiler.c:98:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	%rax, %rbx	 ; tmp138, out_ast_file
 ; D:\TC\src\compiler.c:99:         if (out_ast_file == NULL)
	jne	.L43	 ;,
 ; D:\TC\src\compiler.c:100:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:100:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%rdi, %r8	 ; out_ast_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp120
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
.L45:
 ; D:\TC\src\compiler.c:106: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:100:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	jmp	fprintf	 ;
.L43:
 ; D:\TC\src\compiler.c:102:             output_ast(out_ast_file, lexer, parser);
	movq	%rsi, %rdx	 ; lexer,
	movq	%rax, %rcx	 ; out_ast_file,
	call	output_ast	 ;
 ; D:\TC\src\compiler.c:106: }
	addq	$64, %rsp	 ;,
 ; D:\TC\src\compiler.c:103:             fclose(out_ast_file);
	movq	%rbx, %rcx	 ; out_ast_file,
 ; D:\TC\src\compiler.c:106: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:103:             fclose(out_ast_file);
	jmp	fclose	 ;
.L38:
 ; D:\TC\src\compiler.c:106: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
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
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope

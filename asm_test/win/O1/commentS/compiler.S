	.file	"D:\\TC\\src\\compiler.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
	.text
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
read_source:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp104, file
	movq	%rdx, %rsi	 ; tmp105, length
 ; D:\TC\src\compiler.c:7:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:8:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:8:     *length = (size_t)ftell(file);
	movq	%rax, (%rsi)	 ; tmp106, *length_19(D)
 ; D:\TC\src\compiler.c:9:     fseek(file, 0, SEEK_SET);
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rdi, %rcx	 ; file,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:11:     string source = create_string_not_check("", *length + 1);
	movq	(%rsi), %rax	 ; *length_19(D), tmp111
	leaq	1(%rax), %rdx	 ;, tmp96
	leaq	.LC0(%rip), %rcx	 ;, tmp98
	call	create_string_not_check	 ;
	movq	%rax, %rbx	 ; tmp107, <retval>
 ; D:\TC\src\compiler.c:12:     size_t bytes_read = fread(source, 1, *length, file);
	movq	%rdi, %r9	 ; file,
	movq	(%rsi), %r8	 ; *length_19(D),
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
	call	fread	 ;
 ; D:\TC\src\compiler.c:13:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	 ;, *_6
 ; D:\TC\src\compiler.c:14:     *length = bytes_read;
	movq	%rax, (%rsi)	 ; bytes_read, *length_19(D)
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	testq	%rax, %rax	 ; bytes_read
	je	.L1	 ;,
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	movl	$0, %eax	 ;, i
	jmp	.L4	 ;
.L3:
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	 ;, i
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	cmpq	(%rsi), %rax	 ; *length_19(D), i
	jnb	.L1	 ;,
.L4:
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	 ; MEM[(char *)source_23 + i_34 * 1], tmp100
	andl	$-5, %edx	 ;, tmp100
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp100
	jne	.L3	 ;,
 ; D:\TC\src\compiler.c:18:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_23 + i_34 * 1]
	jmp	.L3	 ;
.L1:
 ; D:\TC\src\compiler.c:21: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
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
	.globl	output_one_token
	.def	output_one_token;	.scl	2;	.type	32;	.endef
output_one_token:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp181, file
	movq	%rdx, %rsi	 ; tmp182, token
	cmpl	$7, 24(%rdx)	 ;, token_45(D)->type
	ja	.L8	 ;,
	movl	24(%rdx), %eax	 ; token_45(D)->type, token_45(D)->type
	leaq	.L10(%rip), %rdx	 ;, tmp124
	movslq	(%rdx,%rax,4), %rax	 ;, tmp126
	addq	%rdx, %rax	 ; tmp124, tmp127
	jmp	*%rax	 ; tmp127
	.section .rdata,"dr"
	.align 4
.L10:
	.long	.L17-.L10
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L17:
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp133
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:25:         return;
	jmp	.L7	 ;
.L16:
 ; D:\TC\src\compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp138
	call	fprintf	 ;
.L8:
 ; D:\TC\src\compiler.c:22: void output_one_token(FILE* file, Token* token) {
	movl	$0, %ebx	 ;, i
 ; D:\TC\src\compiler.c:49:             fputs("\\r", file);
	leaq	.LC12(%rip), %r12	 ;, tmp178
 ; D:\TC\src\compiler.c:45:             fputs("\\n", file);
	leaq	.LC10(%rip), %r13	 ;, tmp179
 ; D:\TC\src\compiler.c:43:             fputs("\\0", file);
	leaq	.LC9(%rip), %rbp	 ;, tmp180
	jmp	.L19	 ;
.L15:
 ; D:\TC\src\compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp143
	call	fprintf	 ;
	jmp	.L8	 ;
.L14:
 ; D:\TC\src\compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC4(%rip), %rdx	 ;, tmp148
	call	fprintf	 ;
	jmp	.L8	 ;
.L13:
 ; D:\TC\src\compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC5(%rip), %rdx	 ;, tmp153
	call	fprintf	 ;
	jmp	.L8	 ;
.L12:
 ; D:\TC\src\compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC6(%rip), %rdx	 ;, tmp158
	call	fprintf	 ;
	jmp	.L8	 ;
.L11:
 ; D:\TC\src\compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC7(%rip), %rdx	 ;, tmp163
	call	fprintf	 ;
	jmp	.L8	 ;
.L9:
 ; D:\TC\src\compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rax	 ; token_45(D)->line, token_45(D)->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC8(%rip), %rdx	 ;, tmp168
	call	fprintf	 ;
	jmp	.L8	 ;
.L28:
 ; D:\TC\src\compiler.c:43:             fputs("\\0", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; tmp180,
	call	fwrite	 ;
.L21:
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, %rbx	 ;, i
.L19:
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	(%rsi), %r14	 ; token_45(D)->lexeme, _37
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%r14, %rcx	 ; _37,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %rbx	 ; tmp183, i
	jnb	.L27	 ;,
 ; D:\TC\src\compiler.c:41:         char c = token->lexeme[i];
	movzbl	(%r14,%rbx), %ecx	 ; *_35, c
 ; D:\TC\src\compiler.c:42:         if (c == '\0')
	testb	%cl, %cl	 ; c
	je	.L28	 ;,
 ; D:\TC\src\compiler.c:44:         else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	je	.L29	 ;,
 ; D:\TC\src\compiler.c:46:         else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	je	.L30	 ;,
 ; D:\TC\src\compiler.c:48:         else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	je	.L31	 ;,
 ; D:\TC\src\compiler.c:51:             fputc(c, file);
	movsbl	%cl, %ecx	 ; c, c
	movq	%rdi, %rdx	 ; file,
	call	fputc	 ;
	jmp	.L21	 ;
.L29:
 ; D:\TC\src\compiler.c:45:             fputs("\\n", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp179,
	call	fwrite	 ;
	jmp	.L21	 ;
.L30:
 ; D:\TC\src\compiler.c:47:             fputs("\\t", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp171
	call	fwrite	 ;
	jmp	.L21	 ;
.L31:
 ; D:\TC\src\compiler.c:49:             fputs("\\r", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; tmp178,
	call	fwrite	 ;
	jmp	.L21	 ;
.L27:
 ; D:\TC\src\compiler.c:53:     fprintf(file, "'\n");
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp177
	call	fwrite	 ;
.L7:
 ; D:\TC\src\compiler.c:54: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp88, file
	movq	%rdx, %rdi	 ; tmp89, lexer
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movl	$0, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp90, current
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	je	.L33	 ;,
.L34:
 ; D:\TC\src\compiler.c:57:         output_one_token(file, current);
	movq	%rbx, %rdx	 ; current,
	movq	%rsi, %rcx	 ; file,
	call	output_one_token	 ;
 ; D:\TC\src\compiler.c:58:         if (current->type == EOF_TOKEN)
	cmpl	$0, 24(%rbx)	 ;, current_18->type
	je	.L33	 ;,
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movl	$0, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp91, current
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	jne	.L34	 ;,
.L33:
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %r8	 ;, tmp92
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC14(%rip), %rdx	 ;, tmp87
	movq	%rsi, %rcx	 ; file,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:62: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp91, file
	movq	%rdx, %rcx	 ; tmp92, lexer
	movq	%r8, %rsi	 ; tmp93, parser
 ; D:\TC\src\compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp88
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope
	call	parse_code	 ;
	movq	%rax, %rcx	 ; tmp94, ast_root
 ; D:\TC\src\compiler.c:65:     output_code(ast_root, file, 0, parser);
	movq	%rsi, %r9	 ; parser,
	movl	$0, %r8d	 ;,
	movq	%rbx, %rdx	 ; file,
	call	output_code	 ;
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %r8	 ;, tmp95
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC14(%rip), %rdx	 ;, tmp90
	movq	%rbx, %rcx	 ; file,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:67: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
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
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movl	%edx, %r12d	 ; tmp122, o_token
	movl	%r8d, %ebp	 ; tmp123, o_ast
 ; D:\TC\src\compiler.c:69:     File* file = create_file(name);
	call	create_file	 ;
	movq	%rax, %rbx	 ; tmp124, file
 ; D:\TC\src\compiler.c:70:     string filename = get_full_path(file);
	movq	%rax, %rcx	 ; file,
	call	get_full_path	 ;
	movq	%rax, %rdi	 ; tmp125, filename
 ; D:\TC\src\compiler.c:71:     size_t length = 0;
	movq	$0, 40(%rsp)	 ;, length
 ; D:\TC\src\compiler.c:72:     FILE* source_file = fopen(filename, "r");
	leaq	.LC15(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; filename,
	call	fopen	 ;
 ; D:\TC\src\compiler.c:73:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	je	.L47	 ;,
	movq	%rax, %rsi	 ; tmp126, source_file
 ; D:\TC\src\compiler.c:77:     string source = read_source(source_file, &length);
	leaq	40(%rsp), %rdx	 ;, tmp110
	movq	%rax, %rcx	 ; source_file,
	call	read_source	 ;
	movq	%rax, %rdi	 ; tmp128, source
 ; D:\TC\src\compiler.c:78:     fclose(source_file);
	movq	%rsi, %rcx	 ; source_file,
	call	fclose	 ;
 ; D:\TC\src\compiler.c:79:     Lexer* lexer = create_lexer(source, length);
	movq	40(%rsp), %rdx	 ; length,
	movq	%rdi, %rcx	 ; source,
	call	create_lexer	 ;
	movq	%rax, %rsi	 ; tmp129, lexer
 ; D:\TC\src\compiler.c:80:     if (o_token) {
	testb	%r12b, %r12b	 ; o_token
	jne	.L48	 ;,
.L42:
 ; D:\TC\src\compiler.c:91:     reset_lexer(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:92:     Parser* parser = create_parser(file);
	movq	%rbx, %rcx	 ; file,
	call	create_parser	 ;
	movq	%rax, %rdi	 ; tmp134, parser
 ; D:\TC\src\compiler.c:93:     if (o_ast) {
	testb	%bpl, %bpl	 ; o_ast
	jne	.L49	 ;,
.L39:
 ; D:\TC\src\compiler.c:105: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L47:
 ; D:\TC\src\compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
	movq	%rdi, %r8	 ; filename,
	leaq	.LC16(%rip), %rdx	 ;, tmp109
	call	fprintf	 ;
	jmp	.L39	 ;
.L48:
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp112
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp130, _4
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rcx	 ; file,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:82:         string out_token_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
	movq	%rax, %r12	 ; tmp131, out_token_name
 ; D:\TC\src\compiler.c:83:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; out_token_name,
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp132, out_token_file
 ; D:\TC\src\compiler.c:84:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	je	.L50	 ;,
 ; D:\TC\src\compiler.c:87:             output_token(out_token_file, lexer);
	movq	%rsi, %rdx	 ; lexer,
	movq	%rax, %rcx	 ; out_token_file,
	call	output_token	 ;
 ; D:\TC\src\compiler.c:88:             fclose(out_token_file);
	movq	%rdi, %rcx	 ; out_token_file,
	call	fclose	 ;
	jmp	.L42	 ;
.L50:
 ; D:\TC\src\compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%r12, %r8	 ; out_token_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp115
	call	fprintf	 ;
	jmp	.L42	 ;
.L49:
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp116
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp135, _7
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rcx	 ; file,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:95:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
	movq	%rax, %rbp	 ; tmp136, out_ast_name
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp117
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp137, _8
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rcx	 ; file,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:97:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC18(%rip), %rdx	 ;, tmp118
	movq	%rbp, %rcx	 ; out_ast_name,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp138, out_ast_file
 ; D:\TC\src\compiler.c:98:         if (out_ast_file == NULL)
	testq	%rax, %rax	 ; out_ast_file
	je	.L51	 ;,
 ; D:\TC\src\compiler.c:101:             output_ast(out_ast_file, lexer, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rsi, %rdx	 ; lexer,
	movq	%rax, %rcx	 ; out_ast_file,
	call	output_ast	 ;
 ; D:\TC\src\compiler.c:102:             fclose(out_ast_file);
	movq	%rbx, %rcx	 ; out_ast_file,
	call	fclose	 ;
	jmp	.L39	 ;
.L51:
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	movq	%rbp, %r8	 ; out_ast_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp120
	call	fprintf	 ;
	jmp	.L39	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
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
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope

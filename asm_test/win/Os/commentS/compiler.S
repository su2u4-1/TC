	.file	"D:\\TC\\src\\compiler.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%.*s%s\0"
.LC1:
	.ascii "%s\0"
.LC2:
	.ascii "%s%s\0"
	.text
	.globl	string_append
	.def	string_append;	.scl	2;	.type	32;	.endef
	.seh_proc	string_append
string_append:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$72, %rsp	 ;,
	.seh_stackalloc	72
	.seh_endprologue
 ; D:\TC\src\compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	movq	%r9, %rdi	 ; tmp108, new
	movq	%rcx, %rbp	 ; tmp105, dest
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%r8, %rcx	 ; src,
 ; D:\TC\src\compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	movq	%rdx, 56(%rsp)	 ; dest_length, %sfp
	movq	%r8, %rbx	 ; tmp107, src
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	strlen	 ;
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rdi, %rcx	 ; new,
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rax, %rsi	 ; tmp109, tmp95
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	strlen	 ;
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	movq	56(%rsp), %rdx	 ; %sfp, dest_length
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	leaq	(%rsi,%rax), %rcx	 ;, tmp100
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	%rdx, %rcx	 ; dest_length, tmp100
	jb	.L2	 ;,
 ; D:\TC\src\compiler.c:11:         snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
	movq	%rdi, 40(%rsp)	 ; new,
 ; D:\TC\src\compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	leaq	-1(%rdx), %r9	 ;, tmp101
 ; D:\TC\src\compiler.c:11:         snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
	movq	%rbp, %rcx	 ; dest,
	leaq	.LC0(%rip), %r8	 ;,
	movq	%rbx, 32(%rsp)	 ; src,
	subl	%eax, %r9d	 ; tmp98,
	call	snprintf	 ;
	jmp	.L1	 ;
.L2:
 ; D:\TC\src\compiler.c:12:     } else if (src == dest)
	cmpq	%rbp, %rbx	 ; dest, src
	jne	.L4	 ;,
 ; D:\TC\src\compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	subq	%rsi, %rdx	 ; tmp95, tmp103
	leaq	(%rbx,%rsi), %rcx	 ;, tmp104
	movq	%rdi, %r9	 ; new,
	leaq	.LC1(%rip), %r8	 ;,
 ; D:\TC\src\compiler.c:16: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\src\compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	jmp	snprintf	 ;
.L4:
 ; D:\TC\src\compiler.c:15:         snprintf(dest, dest_length, "%s%s", src, new);
	movq	%rdi, 32(%rsp)	 ; new,
	movq	%rbx, %r9	 ; src,
	leaq	.LC2(%rip), %r8	 ;,
	movq	%rbp, %rcx	 ; dest,
	call	snprintf	 ;
	nop	
.L1:
 ; D:\TC\src\compiler.c:16: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "\0"
	.text
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
	.seh_proc	read_source
read_source:
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\compiler.c:18:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
 ; D:\TC\src\compiler.c:17: string read_source(FILE* file, size_t* length) {
	movq	%rdx, %rsi	 ; tmp104, length
	movq	%rcx, %rdi	 ; tmp103, file
 ; D:\TC\src\compiler.c:18:     fseek(file, 0, SEEK_END);
	xorl	%edx, %edx	 ;
	call	fseek	 ;
 ; D:\TC\src\compiler.c:19:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:20:     fseek(file, 0, SEEK_SET);
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:19:     *length = (size_t)ftell(file);
	movq	%rax, (%rsi)	 ; tmp105, *length_19(D)
 ; D:\TC\src\compiler.c:20:     fseek(file, 0, SEEK_SET);
	call	fseek	 ;
 ; D:\TC\src\compiler.c:22:     string source = create_string("", *length + 1);
	movq	(%rsi), %rax	 ; *length_19(D), tmp110
	leaq	.LC3(%rip), %rcx	 ;, tmp98
	leaq	1(%rax), %rdx	 ;, tmp96
	call	create_string	 ;
 ; D:\TC\src\compiler.c:23:     size_t bytes_read = fread(source, 1, *length, file);
	movq	(%rsi), %r8	 ; *length_19(D),
	movq	%rdi, %r9	 ; file,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
 ; D:\TC\src\compiler.c:22:     string source = create_string("", *length + 1);
	movq	%rax, %rbx	 ; tmp106, <retval>
 ; D:\TC\src\compiler.c:23:     size_t bytes_read = fread(source, 1, *length, file);
	call	fread	 ;
 ; D:\TC\src\compiler.c:24:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	 ;, *_6
 ; D:\TC\src\compiler.c:25:     *length = bytes_read;
	movq	%rax, (%rsi)	 ; bytes_read, *length_19(D)
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	 ; i
.L7:
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	cmpq	(%rsi), %rax	 ; *length_19(D), i
	jnb	.L10	 ;,
 ; D:\TC\src\compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movb	(%rbx,%rax), %dl	 ; MEM[(char *)source_23 + i_12 * 1], tmp99
	andl	$-5, %edx	 ;, tmp99
 ; D:\TC\src\compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp99
	jne	.L8	 ;,
 ; D:\TC\src\compiler.c:29:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_23 + i_12 * 1]
.L8:
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	incq	%rax	 ; i
	jmp	.L7	 ;
.L10:
 ; D:\TC\src\compiler.c:32: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC5:
	.ascii "Token(Type: identifier,  Line: \0"
.LC6:
	.ascii "Token(Type: integer,     Line: \0"
.LC7:
	.ascii "Token(Type: float,       Line: \0"
.LC8:
	.ascii "Token(Type: string,      Line: \0"
.LC9:
	.ascii "Token(Type: symbol,      Line: \0"
.LC10:
	.ascii "Token(Type: keyword,     Line: \0"
.LC11:
	.ascii "Token(Type: comment,     Line: \0"
.LC12:
	.ascii "%zu, Column: %zu)\11Lexeme: '\0"
.LC13:
	.ascii "\\0\0"
.LC14:
	.ascii "\\n\0"
.LC15:
	.ascii "\\t\0"
.LC16:
	.ascii "\\r\0"
.LC17:
	.ascii "'\12\0"
.LC18:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
	.seh_proc	output_token
output_token:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	leaq	.L15(%rip), %rbp	 ;, tmp136
 ; D:\TC\src\compiler.c:64:                 fputs("\\r", file);
	leaq	.LC16(%rip), %r13	 ;, tmp137
 ; D:\TC\src\compiler.c:33: void output_token(FILE* file, Lexer* lexer) {
	movq	%rdx, %rdi	 ; tmp140, lexer
	movq	%rcx, %rbx	 ; tmp139, file
 ; D:\TC\src\compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp141, current
.L12:
 ; D:\TC\src\compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rsi, %rsi	 ; current
	je	.L23	 ;,
	cmpl	$7, 24(%rsi)	 ;, current_15->type
	ja	.L13	 ;,
	movl	24(%rsi), %eax	 ; current_15->type, current_15->type
	movslq	0(%rbp,%rax,4), %rax	 ;, tmp103
	addq	%rbp, %rax	 ; tmp136, tmp104
	jmp	*%rax	 ; tmp104
	.section .rdata,"dr"
	.align 4
.L15:
	.long	.L22-.L15
	.long	.L21-.L15
	.long	.L20-.L15
	.long	.L19-.L15
	.long	.L18-.L15
	.long	.L17-.L15
	.long	.L16-.L15
	.long	.L14-.L15
	.text
.L22:
 ; D:\TC\src\compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; current_15->column, current_15->column
	movq	8(%rsi), %rax	 ; current_15->line, current_15->line
	movq	%rbx, %rcx	 ; file,
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC4(%rip), %rdx	 ;, tmp110
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:38:             break;
	jmp	.L23	 ;
.L21:
 ; D:\TC\src\compiler.c:40:             fprintf(file, "Token(Type: identifier,  Line: ");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC5(%rip), %rcx	 ;, tmp111
	jmp	.L32	 ;
.L20:
 ; D:\TC\src\compiler.c:42:             fprintf(file, "Token(Type: integer,     Line: ");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC6(%rip), %rcx	 ;, tmp112
	jmp	.L32	 ;
.L19:
 ; D:\TC\src\compiler.c:44:             fprintf(file, "Token(Type: float,       Line: ");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC7(%rip), %rcx	 ;, tmp113
	jmp	.L32	 ;
.L18:
 ; D:\TC\src\compiler.c:46:             fprintf(file, "Token(Type: string,      Line: ");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC8(%rip), %rcx	 ;, tmp114
	jmp	.L32	 ;
.L17:
 ; D:\TC\src\compiler.c:48:             fprintf(file, "Token(Type: symbol,      Line: ");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC9(%rip), %rcx	 ;, tmp115
	jmp	.L32	 ;
.L16:
 ; D:\TC\src\compiler.c:50:             fprintf(file, "Token(Type: keyword,     Line: ");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC10(%rip), %rcx	 ;, tmp116
	jmp	.L32	 ;
.L14:
 ; D:\TC\src\compiler.c:52:             fprintf(file, "Token(Type: comment,     Line: ");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC11(%rip), %rcx	 ;, tmp117
.L32:
	call	fputs	 ;
.L13:
 ; D:\TC\src\compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rdx	 ; current_15->column, current_15->column
	movq	8(%rsi), %rax	 ; current_15->line, current_15->line
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:60:                 fputs("\\n", file);
	leaq	.LC14(%rip), %r14	 ;, tmp134
 ; D:\TC\src\compiler.c:58:                 fputs("\\0", file);
	leaq	.LC13(%rip), %r15	 ;, tmp135
 ; D:\TC\src\compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC12(%rip), %rdx	 ;, tmp122
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:54:         string lexeme_ptr = token->lexeme;
	movq	(%rsi), %r12	 ; current_15->lexeme, lexeme_ptr
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	xorl	%esi, %esi	 ; i
.L24:
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	%r12, %rcx	 ; lexeme_ptr,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, %rsi	 ; tmp142, i
	jnb	.L34	 ;,
 ; D:\TC\src\compiler.c:56:             char c = lexeme_ptr[i];
	movsbl	(%r12,%rsi), %ecx	 ; MEM[(char *)lexeme_ptr_35 + i_16 * 1],
 ; D:\TC\src\compiler.c:58:                 fputs("\\0", file);
	movq	%rbx, %rdx	 ; file,
 ; D:\TC\src\compiler.c:57:             if (c == '\0')
	testb	%cl, %cl	 ; c
	jne	.L25	 ;,
 ; D:\TC\src\compiler.c:58:                 fputs("\\0", file);
	movq	%r15, %rcx	 ; tmp135,
	jmp	.L33	 ;
.L25:
 ; D:\TC\src\compiler.c:59:             else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	jne	.L27	 ;,
 ; D:\TC\src\compiler.c:60:                 fputs("\\n", file);
	movq	%r14, %rcx	 ; tmp134,
.L33:
	call	fputs	 ;
	jmp	.L26	 ;
.L27:
 ; D:\TC\src\compiler.c:61:             else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	jne	.L28	 ;,
 ; D:\TC\src\compiler.c:62:                 fputs("\\t", file);
	leaq	.LC15(%rip), %rcx	 ;, tmp125
	jmp	.L33	 ;
.L28:
 ; D:\TC\src\compiler.c:63:             else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	jne	.L29	 ;,
 ; D:\TC\src\compiler.c:64:                 fputs("\\r", file);
	movq	%r13, %rcx	 ; tmp137,
	jmp	.L33	 ;
.L29:
 ; D:\TC\src\compiler.c:66:                 fputc(c, file);
	call	fputc	 ;
.L26:
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	incq	%rsi	 ; i
	jmp	.L24	 ;
.L34:
 ; D:\TC\src\compiler.c:68:         fprintf(file, "'\n");
	movq	%rbx, %rdx	 ; file,
	leaq	.LC17(%rip), %rcx	 ;, tmp131
	call	fputs	 ;
 ; D:\TC\src\compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp143, current
	jmp	.L12	 ;
.L23:
 ; D:\TC\src\compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC18(%rip), %rdx	 ;, tmp132
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp144
 ; D:\TC\src\compiler.c:71: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.seh_endproc
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
	.seh_proc	output_ast
output_ast:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
 ; D:\TC\src\compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp88
 ; D:\TC\src\compiler.c:72: void output_ast(FILE* file, Lexer* lexer, Parser* parser) {
	movq	%rcx, %rbx	 ; tmp90, file
	movq	%rdx, %rcx	 ; tmp91, lexer
 ; D:\TC\src\compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	(%rax), %rdx	 ; builtin_scope,
	movq	%r8, 40(%rsp)	 ; parser, %sfp
	call	parse_code	 ;
 ; D:\TC\src\compiler.c:74:     output_code(ast_root, file, 0, parser);
	movq	40(%rsp), %r9	 ; %sfp, parser
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rdx	 ; file,
 ; D:\TC\src\compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rcx	 ; tmp93, ast_root
 ; D:\TC\src\compiler.c:74:     output_code(ast_root, file, 0, parser);
	call	output_code	 ;
 ; D:\TC\src\compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC18(%rip), %rdx	 ;, tmp89
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp94
 ; D:\TC\src\compiler.c:76: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
 ; D:\TC\src\compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "r\0"
.LC20:
	.ascii "Error opening file: %s\0"
.LC21:
	.ascii ".token\0"
.LC22:
	.ascii "w\0"
.LC23:
	.ascii "Error opening file: %s\12\0"
.LC24:
	.ascii ".ast\0"
	.text
	.globl	parse_file
	.def	parse_file;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_file
parse_file:
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
 ; D:\TC\src\compiler.c:77: void parse_file(const string name, bool o_token, bool o_ast) {
	movl	%edx, %ebp	 ; tmp120, o_token
	movl	%r8d, %r12d	 ; tmp121, o_ast
 ; D:\TC\src\compiler.c:78:     File* file = create_file(name);
	call	create_file	 ;
 ; D:\TC\src\compiler.c:79:     string filename = get_full_path(file);
	movq	%rax, %rcx	 ; file,
 ; D:\TC\src\compiler.c:78:     File* file = create_file(name);
	movq	%rax, %rbx	 ; tmp122, file
 ; D:\TC\src\compiler.c:79:     string filename = get_full_path(file);
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:81:     FILE* source_file = fopen(filename, "r");
	leaq	.LC19(%rip), %rdx	 ;, tmp106
 ; D:\TC\src\compiler.c:79:     string filename = get_full_path(file);
	movq	%rax, %rdi	 ; tmp123, filename
 ; D:\TC\src\compiler.c:80:     size_t length = 0;
	xorl	%eax, %eax	 ;
 ; D:\TC\src\compiler.c:81:     FILE* source_file = fopen(filename, "r");
	movq	%rdi, %rcx	 ; filename,
 ; D:\TC\src\compiler.c:80:     size_t length = 0;
	movq	%rax, 56(%rsp)	 ;, length
 ; D:\TC\src\compiler.c:81:     FILE* source_file = fopen(filename, "r");
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp124, source_file
 ; D:\TC\src\compiler.c:82:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	jne	.L37	 ;,
 ; D:\TC\src\compiler.c:83:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:83:         fprintf(stderr, "Error opening file: %s", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC20(%rip), %rdx	 ;, tmp108
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
	jmp	.L42	 ;
.L37:
 ; D:\TC\src\compiler.c:86:     string source = read_source(source_file, &length);
	leaq	56(%rsp), %rdx	 ;, tmp109
	movq	%rax, %rcx	 ; source_file,
	call	read_source	 ;
 ; D:\TC\src\compiler.c:87:     fclose(source_file);
	movq	%rsi, %rcx	 ; source_file,
 ; D:\TC\src\compiler.c:86:     string source = read_source(source_file, &length);
	movq	%rax, %rdi	 ; tmp126, source
 ; D:\TC\src\compiler.c:87:     fclose(source_file);
	call	fclose	 ;
 ; D:\TC\src\compiler.c:88:     Lexer* lexer = create_lexer(source, length);
	movq	56(%rsp), %rdx	 ; length,
	movq	%rdi, %rcx	 ; source,
	call	create_lexer	 ;
	movq	%rax, %rsi	 ; tmp127, lexer
 ; D:\TC\src\compiler.c:89:     if (o_token) {
	testb	%bpl, %bpl	 ; o_token
	je	.L38	 ;,
 ; D:\TC\src\compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp111
	call	create_string	 ;
 ; D:\TC\src\compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rdx	 ; tmp128, _4
 ; D:\TC\src\compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:91:         string out_token_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC22(%rip), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; out_token_name,
 ; D:\TC\src\compiler.c:91:         string out_token_name = get_full_path(file);
	movq	%rax, %rbp	 ; tmp129, out_token_name
 ; D:\TC\src\compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp130, out_token_file
 ; D:\TC\src\compiler.c:93:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	jne	.L39	 ;,
 ; D:\TC\src\compiler.c:94:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:94:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%rbp, %r8	 ; out_token_name,
	leaq	.LC23(%rip), %rdx	 ;, tmp114
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	call	fprintf	 ;
	jmp	.L38	 ;
.L39:
 ; D:\TC\src\compiler.c:96:             output_token(out_token_file, lexer);
	movq	%rax, %rcx	 ; out_token_file,
	movq	%rsi, %rdx	 ; lexer,
	call	output_token	 ;
 ; D:\TC\src\compiler.c:97:             fclose(out_token_file);
	movq	%rdi, %rcx	 ; out_token_file,
	call	fclose	 ;
.L38:
 ; D:\TC\src\compiler.c:100:     reset_lexer(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:101:     Parser* parser = create_parser();
	call	create_parser	 ;
 ; D:\TC\src\compiler.c:102:     if (o_ast) {
	testb	%r12b, %r12b	 ; o_ast
	je	.L36	 ;,
 ; D:\TC\src\compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp115
	movq	%rax, 40(%rsp)	 ; parser, %sfp
	call	create_string	 ;
 ; D:\TC\src\compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rdx	 ; tmp133, _7
 ; D:\TC\src\compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC22(%rip), %rdx	 ;, tmp116
	movq	%rax, %rcx	 ; out_ast_name,
 ; D:\TC\src\compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	%rax, %rdi	 ; tmp134, out_ast_name
 ; D:\TC\src\compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	call	fopen	 ;
 ; D:\TC\src\compiler.c:106:         if (out_ast_file == NULL)
	movq	40(%rsp), %r8	 ; %sfp, parser
	testq	%rax, %rax	 ; out_ast_file
 ; D:\TC\src\compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	%rax, %rbx	 ; tmp135, out_ast_file
 ; D:\TC\src\compiler.c:106:         if (out_ast_file == NULL)
	jne	.L41	 ;,
 ; D:\TC\src\compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%rdi, %r8	 ; out_ast_name,
	leaq	.LC23(%rip), %rdx	 ;, tmp118
	movq	24(%rax), %rcx	 ; _8->_stderr, _8->_stderr
.L42:
 ; D:\TC\src\compiler.c:113: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	jmp	fprintf	 ;
.L41:
 ; D:\TC\src\compiler.c:109:             output_ast(out_ast_file, lexer, parser);
	movq	%rax, %rcx	 ; out_ast_file,
	movq	%rsi, %rdx	 ; lexer,
	call	output_ast	 ;
 ; D:\TC\src\compiler.c:110:             fclose(out_ast_file);
	movq	%rbx, %rcx	 ; out_ast_file,
 ; D:\TC\src\compiler.c:113: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:110:             fclose(out_ast_file);
	jmp	fclose	 ;
.L36:
 ; D:\TC\src\compiler.c:113: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	get_info;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	output_code;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope

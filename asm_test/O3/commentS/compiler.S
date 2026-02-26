	.file	"D:\\TC\\src\\compiler.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%.*s%s\0"
.LC1:
	.ascii "%s%s\0"
	.text
	.p2align 4
	.globl	string_append
	.def	string_append;	.scl	2;	.type	32;	.endef
	.seh_proc	string_append
string_append:
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
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
 ; D:\TC\src\compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	movq	%r9, %rdi	 ; tmp105, new
	movq	%rcx, %r12	 ; tmp102, dest
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%r8, %rcx	 ; src,
 ; D:\TC\src\compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	movq	%rdx, %rbp	 ; tmp103, dest_length
	movq	%r8, %rsi	 ; tmp104, src
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	strlen	 ;
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rdi, %rcx	 ; new,
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rax, %rbx	 ; tmp106, tmp93
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	strlen	 ;
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	addq	%rax, %rbx	 ; tmp96, tmp98
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	%rbp, %rbx	 ; dest_length, tmp98
	jb	.L2	 ;,
 ; D:\TC\src\compiler.c:11:         snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
	movq	%rdi, 40(%rsp)	 ; new,
 ; D:\TC\src\compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	leaq	-1(%rbp), %r9	 ;, tmp99
 ; D:\TC\src\compiler.c:11:         snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
	movq	%rbp, %rdx	 ; dest_length,
	movq	%r12, %rcx	 ; dest,
	movq	%rsi, 32(%rsp)	 ; src,
	subl	%eax, %r9d	 ; tmp96,
	leaq	.LC0(%rip), %r8	 ;,
	call	snprintf	 ;
	nop	
 ; D:\TC\src\compiler.c:14: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L2:
 ; D:\TC\src\compiler.c:13:         sprintf(dest, "%s%s", src, new);
	movq	%rdi, %r9	 ; new,
	movq	%rsi, %r8	 ; src,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	movq	%r12, %rcx	 ; dest,
 ; D:\TC\src\compiler.c:14: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:13:         sprintf(dest, "%s%s", src, new);
	jmp	sprintf	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "\0"
	.text
	.p2align 4
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
 ; D:\TC\src\compiler.c:16:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
 ; D:\TC\src\compiler.c:15: string read_source(FILE* file, size_t* length) {
	movq	%rdx, %rsi	 ; tmp105, length
	movq	%rcx, %rdi	 ; tmp104, file
 ; D:\TC\src\compiler.c:16:     fseek(file, 0, SEEK_END);
	xorl	%edx, %edx	 ;
	call	fseek	 ;
 ; D:\TC\src\compiler.c:17:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:18:     fseek(file, 0, SEEK_SET);
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:17:     *length = (size_t)ftell(file);
	movq	%rax, (%rsi)	 ; tmp106, *length_20(D)
 ; D:\TC\src\compiler.c:18:     fseek(file, 0, SEEK_SET);
	call	fseek	 ;
 ; D:\TC\src\compiler.c:20:     string source = create_string("", *length + 1);
	movq	(%rsi), %rax	 ; *length_20(D), tmp109
	leaq	.LC2(%rip), %rcx	 ;, tmp98
	leaq	1(%rax), %rdx	 ;, tmp96
	call	create_string	 ;
 ; D:\TC\src\compiler.c:21:     fread(source, 1, *length, file);
	movq	(%rsi), %r8	 ; *length_20(D),
	movq	%rdi, %r9	 ; file,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
 ; D:\TC\src\compiler.c:20:     string source = create_string("", *length + 1);
	movq	%rax, %rbx	 ; tmp107, <retval>
 ; D:\TC\src\compiler.c:21:     fread(source, 1, *length, file);
	call	fread	 ;
 ; D:\TC\src\compiler.c:22:     source[*length] = '\0';
	movq	(%rsi), %rax	 ; *length_20(D), *length_20(D)
	movb	$0, (%rbx,%rax)	 ;, *_7
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	movq	(%rsi), %rcx	 ; *length_20(D), prephitmp_31
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	 ; i
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	testq	%rcx, %rcx	 ; prephitmp_31
	je	.L6	 ;,
	.p2align 4,,10
	.p2align 3
.L7:
 ; D:\TC\src\compiler.c:25:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	 ; MEM[(char *)source_24 + i_33 * 1], tmp102
	andl	$-5, %edx	 ;, tmp102
 ; D:\TC\src\compiler.c:25:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp102
	jne	.L8	 ;,
 ; D:\TC\src\compiler.c:26:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_24 + i_33 * 1]
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	movq	(%rsi), %rcx	 ; *length_20(D), prephitmp_31
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	 ;, i
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rcx, %rax	 ; prephitmp_31, i
	jb	.L7	 ;,
.L6:
 ; D:\TC\src\compiler.c:29: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L8:
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	 ;, i
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rcx, %rax	 ; prephitmp_31, i
	jb	.L7	 ;,
 ; D:\TC\src\compiler.c:29: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC4:
	.ascii "Token(Type: identifier,  Line: \0"
	.align 8
.LC5:
	.ascii "Token(Type: integer,     Line: \0"
	.align 8
.LC6:
	.ascii "Token(Type: float,       Line: \0"
	.align 8
.LC7:
	.ascii "Token(Type: string,      Line: \0"
	.align 8
.LC8:
	.ascii "Token(Type: symbol,      Line: \0"
	.align 8
.LC9:
	.ascii "Token(Type: keyword,     Line: \0"
	.align 8
.LC10:
	.ascii "Token(Type: comment,     Line: \0"
.LC11:
	.ascii "%zu, Column: %zu)\11Lexeme: '\0"
.LC12:
	.ascii "\\0\0"
.LC13:
	.ascii "\\n\0"
.LC14:
	.ascii "\\t\0"
.LC15:
	.ascii "\\r\0"
.LC16:
	.ascii "'\12\0"
.LC17:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.p2align 4
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
 ; D:\TC\src\compiler.c:30: void output_token(FILE* file, Lexer* lexer) {
	movq	%rdx, %r14	 ; tmp140, lexer
	movq	%rcx, %rdi	 ; tmp139, file
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp141, current
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	je	.L25	 ;,
	leaq	.L17(%rip), %r12	 ;, tmp136
 ; D:\TC\src\compiler.c:61:                 fputs("\\r", file);
	leaq	.LC15(%rip), %r15	 ;, tmp137
	.p2align 4,,10
	.p2align 3
.L33:
	cmpl	$7, 24(%rbx)	 ;, current_50->type
	ja	.L15	 ;,
	movl	24(%rbx), %eax	 ; current_50->type, current_50->type
	movslq	(%r12,%rax,4), %rax	 ;, tmp103
	addq	%r12, %rax	 ; tmp136, tmp104
	jmp	*%rax	 ; tmp104
	.section .rdata,"dr"
	.align 4
.L17:
	.long	.L24-.L17
	.long	.L23-.L17
	.long	.L22-.L17
	.long	.L21-.L17
	.long	.L20-.L17
	.long	.L19-.L17
	.long	.L18-.L17
	.long	.L16-.L17
	.text
	.p2align 4,,10
	.p2align 3
.L18:
 ; D:\TC\src\compiler.c:47:             fprintf(file, "Token(Type: keyword,     Line: ");
	movq	%rdi, %r9	 ; file,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L15:
 ; D:\TC\src\compiler.c:50:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rbx), %rdx	 ; current_50->column, current_50->column
	movq	8(%rbx), %rax	 ; current_50->line, current_50->line
	movq	%rdi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:57:                 fputs("\\n", file);
	leaq	.LC13(%rip), %r13	 ;, tmp134
 ; D:\TC\src\compiler.c:55:                 fputs("\\0", file);
	leaq	.LC12(%rip), %rbp	 ;, tmp135
 ; D:\TC\src\compiler.c:50:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC11(%rip), %rdx	 ;, tmp122
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:51:         string lexeme_ptr = token->lexeme;
	movq	(%rbx), %rsi	 ; current_50->lexeme, lexeme_ptr
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	xorl	%ebx, %ebx	 ; i
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	jmp	.L26	 ;
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:\TC\src\compiler.c:56:             else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	je	.L38	 ;,
 ; D:\TC\src\compiler.c:58:             else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	je	.L39	 ;,
 ; D:\TC\src\compiler.c:60:             else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	je	.L40	 ;,
 ; D:\TC\src\compiler.c:63:                 fputc(c, file);
	movq	%rdi, %rdx	 ; file,
	call	fputc	 ;
.L28:
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	addq	$1, %rbx	 ;, i
.L26:
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	%rsi, %rcx	 ; lexeme_ptr,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, %rbx	 ; tmp142, i
	jnb	.L41	 ;,
 ; D:\TC\src\compiler.c:53:             char c = lexeme_ptr[i];
	movsbl	(%rsi,%rbx), %ecx	 ; MEM[(char *)lexeme_ptr_35 + i_16 * 1],
 ; D:\TC\src\compiler.c:54:             if (c == '\0')
	testb	%cl, %cl	 ; c
	jne	.L27	 ;,
 ; D:\TC\src\compiler.c:55:                 fputs("\\0", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; tmp135,
	call	fwrite	 ;
	jmp	.L28	 ;
	.p2align 4,,10
	.p2align 3
.L19:
 ; D:\TC\src\compiler.c:45:             fprintf(file, "Token(Type: symbol,      Line: ");
	movq	%rdi, %r9	 ; file,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L20:
 ; D:\TC\src\compiler.c:43:             fprintf(file, "Token(Type: string,      Line: ");
	movq	%rdi, %r9	 ; file,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:\TC\src\compiler.c:41:             fprintf(file, "Token(Type: float,       Line: ");
	movq	%rdi, %r9	 ; file,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp113
	call	fwrite	 ;
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L24:
 ; D:\TC\src\compiler.c:34:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rbx), %rdx	 ; current_50->column, current_50->column
	movq	8(%rbx), %rax	 ; current_50->line, current_50->line
	movq	%rdi, %rcx	 ; file,
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp110
	call	fprintf	 ;
.L25:
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC17(%rip), %rdx	 ;, tmp132
	movq	%rdi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp144
 ; D:\TC\src\compiler.c:68: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L16:
 ; D:\TC\src\compiler.c:49:             fprintf(file, "Token(Type: comment,     Line: ");
	movq	%rdi, %r9	 ; file,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L22:
 ; D:\TC\src\compiler.c:39:             fprintf(file, "Token(Type: integer,     Line: ");
	movq	%rdi, %r9	 ; file,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp112
	call	fwrite	 ;
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L23:
 ; D:\TC\src\compiler.c:37:             fprintf(file, "Token(Type: identifier,  Line: ");
	movq	%rdi, %r9	 ; file,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L40:
 ; D:\TC\src\compiler.c:61:                 fputs("\\r", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r15, %rcx	 ; tmp137,
	call	fwrite	 ;
	jmp	.L28	 ;
	.p2align 4,,10
	.p2align 3
.L38:
 ; D:\TC\src\compiler.c:57:                 fputs("\\n", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp134,
	call	fwrite	 ;
	jmp	.L28	 ;
	.p2align 4,,10
	.p2align 3
.L41:
 ; D:\TC\src\compiler.c:65:         fprintf(file, "'\n");
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp131
	call	fwrite	 ;
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%edx, %edx	 ;
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp143, current
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	 ; current
	jne	.L33	 ;,
	jmp	.L25	 ;
	.p2align 4,,10
	.p2align 3
.L39:
 ; D:\TC\src\compiler.c:59:                 fputs("\\t", file);
	movq	%rdi, %r9	 ; file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;, tmp125
	call	fwrite	 ;
	jmp	.L28	 ;
	.seh_endproc
	.p2align 4
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
	.seh_proc	output_ast
output_ast:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\compiler.c:70:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp88
 ; D:\TC\src\compiler.c:69: void output_ast(FILE* file, Lexer* lexer, Parser* parser) {
	movq	%rcx, %rbx	 ; tmp91, file
	movq	%rdx, %rcx	 ; tmp92, lexer
 ; D:\TC\src\compiler.c:70:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope
 ; D:\TC\src\compiler.c:69: void output_ast(FILE* file, Lexer* lexer, Parser* parser) {
	movq	%r8, %rsi	 ; tmp93, parser
 ; D:\TC\src\compiler.c:70:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	call	parse_code	 ;
 ; D:\TC\src\compiler.c:71:     output_code(ast_root, file, 0, parser);
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rdx	 ; file,
	movq	%rsi, %r9	 ; parser,
 ; D:\TC\src\compiler.c:70:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rcx	 ; tmp94, ast_root
 ; D:\TC\src\compiler.c:71:     output_code(ast_root, file, 0, parser);
	call	output_code	 ;
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC17(%rip), %rdx	 ;, tmp90
	movq	%rbx, %rcx	 ; file,
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp95
 ; D:\TC\src\compiler.c:73: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	jmp	fprintf	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC18:
	.ascii "r\0"
.LC19:
	.ascii "Error opening file: %s\0"
.LC20:
	.ascii ".token\0"
.LC21:
	.ascii "w\0"
.LC22:
	.ascii "Error opening file: %s\12\0"
.LC23:
	.ascii ".ast\0"
	.text
	.p2align 4
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
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
 ; D:\TC\src\compiler.c:74: void parse_file(const string name, bool o_token, bool o_ast) {
	movl	%edx, %r12d	 ; tmp126, o_token
	movl	%r8d, %ebp	 ; tmp127, o_ast
 ; D:\TC\src\compiler.c:75:     File* file = create_file(name);
	call	create_file	 ;
 ; D:\TC\src\compiler.c:76:     string filename = get_full_path(file);
	movq	%rax, %rcx	 ; file,
 ; D:\TC\src\compiler.c:75:     File* file = create_file(name);
	movq	%rax, %rsi	 ; tmp128, file
 ; D:\TC\src\compiler.c:76:     string filename = get_full_path(file);
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:78:     FILE* source_file = fopen(filename, "r");
	leaq	.LC18(%rip), %rdx	 ;, tmp109
 ; D:\TC\src\compiler.c:77:     size_t length = 0;
	movq	$0, 40(%rsp)	 ;, length
 ; D:\TC\src\compiler.c:78:     FILE* source_file = fopen(filename, "r");
	movq	%rax, %rcx	 ; filename,
 ; D:\TC\src\compiler.c:76:     string filename = get_full_path(file);
	movq	%rax, %rdi	 ; tmp129, filename
 ; D:\TC\src\compiler.c:78:     FILE* source_file = fopen(filename, "r");
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp130, source_file
 ; D:\TC\src\compiler.c:79:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	je	.L51	 ;,
 ; D:\TC\src\compiler.c:83:     string source = read_source(source_file, &length);
	leaq	40(%rsp), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; source_file,
	call	read_source	 ;
 ; D:\TC\src\compiler.c:84:     fclose(source_file);
	movq	%rbx, %rcx	 ; source_file,
 ; D:\TC\src\compiler.c:83:     string source = read_source(source_file, &length);
	movq	%rax, %rdi	 ; tmp132, source
 ; D:\TC\src\compiler.c:84:     fclose(source_file);
	call	fclose	 ;
 ; D:\TC\src\compiler.c:85:     Lexer* lexer = create_lexer(source, length);
	movq	40(%rsp), %rdx	 ; length,
	movq	%rdi, %rcx	 ; source,
	call	create_lexer	 ;
	movq	%rax, %rbx	 ; tmp133, lexer
 ; D:\TC\src\compiler.c:86:     if (o_token) {
	testb	%r12b, %r12b	 ; o_token
	jne	.L52	 ;,
.L45:
 ; D:\TC\src\compiler.c:97:     reset_lexer(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:98:     Parser* parser = create_parser();
	call	create_parser	 ;
	movq	%rax, %rdi	 ; tmp138, parser
 ; D:\TC\src\compiler.c:99:     if (o_ast) {
	testb	%bpl, %bpl	 ; o_ast
	jne	.L53	 ;,
 ; D:\TC\src\compiler.c:110: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L52:
 ; D:\TC\src\compiler.c:88:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp114
	call	create_string	 ;
 ; D:\TC\src\compiler.c:88:         change_file_extension(file, create_string(".token", 6));
	movq	%rsi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:88:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rdx	 ; tmp134, _4
 ; D:\TC\src\compiler.c:88:         change_file_extension(file, create_string(".token", 6));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:89:         string out_token_name = get_full_path(file);
	movq	%rsi, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:90:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC21(%rip), %rdx	 ;, tmp115
	movq	%rax, %rcx	 ; out_token_name,
 ; D:\TC\src\compiler.c:89:         string out_token_name = get_full_path(file);
	movq	%rax, %r12	 ; tmp135, out_token_name
 ; D:\TC\src\compiler.c:90:         FILE* out_token_file = fopen(out_token_name, "w");
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp136, out_token_file
 ; D:\TC\src\compiler.c:91:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	je	.L54	 ;,
 ; D:\TC\src\compiler.c:94:             output_token(out_token_file, lexer);
	movq	%rbx, %rdx	 ; lexer,
	movq	%rax, %rcx	 ; out_token_file,
	call	output_token	 ;
.L47:
 ; D:\TC\src\compiler.c:95:         fclose(out_token_file);
	movq	%rdi, %rcx	 ; out_token_file,
	call	fclose	 ;
	jmp	.L45	 ;
	.p2align 4,,10
	.p2align 3
.L53:
 ; D:\TC\src\compiler.c:101:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp118
	call	create_string	 ;
 ; D:\TC\src\compiler.c:101:         change_file_extension(file, create_string(".ast", 4));
	movq	%rsi, %rcx	 ; file,
 ; D:\TC\src\compiler.c:101:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rdx	 ; tmp139, _7
 ; D:\TC\src\compiler.c:101:         change_file_extension(file, create_string(".ast", 4));
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:102:         string out_ast_name = get_full_path(file);
	movq	%rsi, %rcx	 ; file,
	call	get_full_path	 ;
 ; D:\TC\src\compiler.c:103:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC21(%rip), %rdx	 ;, tmp119
	movq	%rax, %rcx	 ; out_ast_name,
 ; D:\TC\src\compiler.c:102:         string out_ast_name = get_full_path(file);
	movq	%rax, %rbp	 ; tmp140, out_ast_name
 ; D:\TC\src\compiler.c:103:         FILE* out_ast_file = fopen(out_ast_name, "w");
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp141, out_ast_file
 ; D:\TC\src\compiler.c:104:         if (out_ast_file == NULL)
	testq	%rax, %rax	 ; out_ast_file
	je	.L55	 ;,
 ; D:\TC\src\compiler.c:70:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp122
	movq	%rdi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope
	call	parse_code	 ;
 ; D:\TC\src\compiler.c:71:     output_code(ast_root, file, 0, parser);
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; out_ast_file,
	movq	%rdi, %r9	 ; parser,
 ; D:\TC\src\compiler.c:70:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rcx	 ; tmp143, ast_root
 ; D:\TC\src\compiler.c:71:     output_code(ast_root, file, 0, parser);
	call	output_code	 ;
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC17(%rip), %rdx	 ;, tmp124
	movq	%rsi, %rcx	 ; out_ast_file,
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp144
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	fprintf	 ;
.L50:
 ; D:\TC\src\compiler.c:108:         fclose(out_ast_file);
	movq	%rsi, %rcx	 ; out_ast_file,
 ; D:\TC\src\compiler.c:110: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:108:         fclose(out_ast_file);
	jmp	fclose	 ;
	.p2align 4,,10
	.p2align 3
.L55:
 ; D:\TC\src\compiler.c:105:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:105:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%rbp, %r8	 ; out_ast_name,
	leaq	.LC22(%rip), %rdx	 ;, tmp121
	movq	24(%rax), %rcx	 ; _8->_stderr, _8->_stderr
	call	fprintf	 ;
	jmp	.L50	 ;
	.p2align 4,,10
	.p2align 3
.L54:
 ; D:\TC\src\compiler.c:92:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:92:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%r12, %r8	 ; out_token_name,
	leaq	.LC22(%rip), %rdx	 ;, tmp117
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	call	fprintf	 ;
	jmp	.L47	 ;
	.p2align 4,,10
	.p2align 3
.L51:
 ; D:\TC\src\compiler.c:80:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:80:         fprintf(stderr, "Error opening file: %s", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC19(%rip), %rdx	 ;, tmp111
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
 ; D:\TC\src\compiler.c:110: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\compiler.c:80:         fprintf(stderr, "Error opening file: %s", filename);
	jmp	fprintf	 ;
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
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
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope

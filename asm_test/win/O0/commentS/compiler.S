	.file	"D:\\TC\\src\\compiler.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
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
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; dest, dest
	movq	%rdx, 24(%rbp)	 ; dest_length, dest_length
	movq	%r8, 32(%rbp)	 ; src, src
	movq	%r9, 40(%rbp)	 ; new, new
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	32(%rbp), %rax	 ; src, tmp87
	movq	%rax, %rcx	 ; tmp87,
	call	strlen	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, src_length
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	40(%rbp), %rax	 ; new, tmp89
	movq	%rax, %rcx	 ; tmp89,
	call	strlen	 ;
	movq	%rax, -16(%rbp)	 ; tmp90, new_length
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	movq	-8(%rbp), %rdx	 ; src_length, tmp91
	movq	-16(%rbp), %rax	 ; new_length, tmp92
	addq	%rdx, %rax	 ; tmp91, _1
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	24(%rbp), %rax	 ; dest_length, _1
	jb	.L2	 ;,
 ; D:\TC\src\compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	movq	24(%rbp), %rax	 ; dest_length, tmp93
	subq	-16(%rbp), %rax	 ; new_length, _2
 ; D:\TC\src\compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	subq	$1, %rax	 ;, tmp94
	movq	%rax, -24(%rbp)	 ; tmp94, max_src_length
 ; D:\TC\src\compiler.c:11:         snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
	movq	-24(%rbp), %rax	 ; max_src_length, tmp95
	movl	%eax, %r8d	 ; tmp95, _3
	movq	24(%rbp), %rdx	 ; dest_length, tmp96
	movq	16(%rbp), %rax	 ; dest, tmp97
	movq	40(%rbp), %rcx	 ; new, tmp98
	movq	%rcx, 40(%rsp)	 ; tmp98,
	movq	32(%rbp), %rcx	 ; src, tmp99
	movq	%rcx, 32(%rsp)	 ; tmp99,
	movl	%r8d, %r9d	 ; _3,
	leaq	.LC0(%rip), %r8	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	snprintf	 ;
 ; D:\TC\src\compiler.c:16: }
	jmp	.L5	 ;
.L2:
 ; D:\TC\src\compiler.c:12:     } else if (src == dest)
	movq	32(%rbp), %rax	 ; src, tmp100
	cmpq	16(%rbp), %rax	 ; dest, tmp100
	jne	.L4	 ;,
 ; D:\TC\src\compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	movq	24(%rbp), %rax	 ; dest_length, tmp101
	subq	-8(%rbp), %rax	 ; src_length, _4
	movq	16(%rbp), %rcx	 ; dest, tmp102
	movq	-8(%rbp), %rdx	 ; src_length, tmp103
	addq	%rdx, %rcx	 ; tmp103, _5
	movq	40(%rbp), %rdx	 ; new, tmp104
	movq	%rdx, %r9	 ; tmp104,
	leaq	.LC1(%rip), %r8	 ;,
	movq	%rax, %rdx	 ; _4,
	call	snprintf	 ;
 ; D:\TC\src\compiler.c:16: }
	jmp	.L5	 ;
.L4:
 ; D:\TC\src\compiler.c:15:         snprintf(dest, dest_length, "%s%s", src, new);
	movq	32(%rbp), %r8	 ; src, tmp105
	movq	24(%rbp), %rdx	 ; dest_length, tmp106
	movq	16(%rbp), %rax	 ; dest, tmp107
	movq	40(%rbp), %rcx	 ; new, tmp108
	movq	%rcx, 32(%rsp)	 ; tmp108,
	movq	%r8, %r9	 ; tmp105,
	leaq	.LC2(%rip), %r8	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	snprintf	 ;
.L5:
 ; D:\TC\src\compiler.c:16: }
	nop	
	addq	$80, %rsp	 ;,
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
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; length, length
 ; D:\TC\src\compiler.c:18:     fseek(file, 0, SEEK_END);
	movq	16(%rbp), %rax	 ; file, tmp96
	movl	$2, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp96,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:19:     *length = (size_t)ftell(file);
	movq	16(%rbp), %rax	 ; file, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:19:     *length = (size_t)ftell(file);
	movq	%rax, %rdx	 ; _1, _2
 ; D:\TC\src\compiler.c:19:     *length = (size_t)ftell(file);
	movq	24(%rbp), %rax	 ; length, tmp98
	movq	%rdx, (%rax)	 ; _2, *length_20(D)
 ; D:\TC\src\compiler.c:20:     fseek(file, 0, SEEK_SET);
	movq	16(%rbp), %rax	 ; file, tmp99
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:22:     string source = create_string("", *length + 1);
	movq	24(%rbp), %rax	 ; length, tmp100
	movq	(%rax), %rax	 ; *length_20(D), _3
 ; D:\TC\src\compiler.c:22:     string source = create_string("", *length + 1);
	addq	$1, %rax	 ;, _4
	movq	%rax, %rdx	 ; _4,
	leaq	.LC3(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	create_string	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, source
 ; D:\TC\src\compiler.c:23:     size_t bytes_read = fread(source, 1, *length, file);
	movq	24(%rbp), %rax	 ; length, tmp103
	movq	(%rax), %rdx	 ; *length_20(D), _5
	movq	16(%rbp), %rcx	 ; file, tmp104
	movq	-16(%rbp), %rax	 ; source, tmp105
	movq	%rcx, %r9	 ; tmp104,
	movq	%rdx, %r8	 ; _5,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp105,
	call	fread	 ;
	movq	%rax, -24(%rbp)	 ; tmp106, bytes_read
 ; D:\TC\src\compiler.c:24:     source[bytes_read] = '\0';
	movq	-16(%rbp), %rdx	 ; source, tmp107
	movq	-24(%rbp), %rax	 ; bytes_read, tmp108
	addq	%rdx, %rax	 ; tmp107, _6
 ; D:\TC\src\compiler.c:24:     source[bytes_read] = '\0';
	movb	$0, (%rax)	 ;, *_6
 ; D:\TC\src\compiler.c:25:     *length = bytes_read;
	movq	24(%rbp), %rax	 ; length, tmp109
	movq	-24(%rbp), %rdx	 ; bytes_read, tmp110
	movq	%rdx, (%rax)	 ; tmp110, *length_20(D)
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	movq	$0, -8(%rbp)	 ;, i
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	jmp	.L7	 ;
.L10:
 ; D:\TC\src\compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	 ; source, tmp111
	movq	-8(%rbp), %rax	 ; i, tmp112
	addq	%rdx, %rax	 ; tmp111, _7
	movzbl	(%rax), %eax	 ; *_7, _8
 ; D:\TC\src\compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$13, %al	 ;, _8
	je	.L8	 ;,
 ; D:\TC\src\compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	 ; source, tmp113
	movq	-8(%rbp), %rax	 ; i, tmp114
	addq	%rdx, %rax	 ; tmp113, _9
	movzbl	(%rax), %eax	 ; *_9, _10
 ; D:\TC\src\compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %al	 ;, _10
	jne	.L9	 ;,
.L8:
 ; D:\TC\src\compiler.c:29:             source[i] = ' ';
	movq	-16(%rbp), %rdx	 ; source, tmp115
	movq	-8(%rbp), %rax	 ; i, tmp116
	addq	%rdx, %rax	 ; tmp115, _11
 ; D:\TC\src\compiler.c:29:             source[i] = ' ';
	movb	$32, (%rax)	 ;, *_11
.L9:
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, -8(%rbp)	 ;, i
.L7:
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	movq	24(%rbp), %rax	 ; length, tmp117
	movq	(%rax), %rax	 ; *length_20(D), _12
 ; D:\TC\src\compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rax, -8(%rbp)	 ; _12, i
	jb	.L10	 ;,
 ; D:\TC\src\compiler.c:31:     return source;
	movq	-16(%rbp), %rax	 ; source, _30
 ; D:\TC\src\compiler.c:32: }
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC5:
	.ascii "Token(Type: identifier,  Line: \0"
	.align 8
.LC6:
	.ascii "Token(Type: integer,     Line: \0"
	.align 8
.LC7:
	.ascii "Token(Type: float,       Line: \0"
	.align 8
.LC8:
	.ascii "Token(Type: string,      Line: \0"
	.align 8
.LC9:
	.ascii "Token(Type: symbol,      Line: \0"
	.align 8
.LC10:
	.ascii "Token(Type: keyword,     Line: \0"
	.align 8
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
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; lexer, lexer
 ; D:\TC\src\compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	24(%rbp), %rax	 ; lexer, tmp102
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp103, current
 ; D:\TC\src\compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	jmp	.L13	 ;
.L30:
 ; D:\TC\src\compiler.c:35:         Token* token = current;
	movq	-8(%rbp), %rax	 ; current, tmp104
	movq	%rax, -24(%rbp)	 ; tmp104, token
 ; D:\TC\src\compiler.c:36:         if (token->type == EOF_TOKEN) {
	movq	-24(%rbp), %rax	 ; token, tmp105
	movl	24(%rax), %eax	 ; token_32->type, _1
 ; D:\TC\src\compiler.c:36:         if (token->type == EOF_TOKEN) {
	testl	%eax, %eax	 ; _1
	jne	.L14	 ;,
 ; D:\TC\src\compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp106
	movq	16(%rax), %rax	 ; token_32->column, _2
 ; D:\TC\src\compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _3
 ; D:\TC\src\compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp107
	movq	8(%rax), %rax	 ; token_32->line, _4
 ; D:\TC\src\compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _5
	movq	16(%rbp), %rax	 ; file, tmp108
	movq	%rcx, %r9	 ; _3,
	movq	%rdx, %r8	 ; _5,
	leaq	.LC4(%rip), %rdx	 ;, tmp109
	movq	%rax, %rcx	 ; tmp108,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:38:             break;
	jmp	.L15	 ;
.L14:
 ; D:\TC\src\compiler.c:39:         } else if (token->type == IDENTIFIER)
	movq	-24(%rbp), %rax	 ; token, tmp110
	movl	24(%rax), %eax	 ; token_32->type, _6
 ; D:\TC\src\compiler.c:39:         } else if (token->type == IDENTIFIER)
	cmpl	$1, %eax	 ;, _6
	jne	.L16	 ;,
 ; D:\TC\src\compiler.c:40:             fprintf(file, "Token(Type: identifier,  Line: ");
	movq	16(%rbp), %rax	 ; file, tmp111
	movq	%rax, %r9	 ; tmp111,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	fwrite	 ;
	jmp	.L17	 ;
.L16:
 ; D:\TC\src\compiler.c:41:         else if (token->type == INTEGER)
	movq	-24(%rbp), %rax	 ; token, tmp113
	movl	24(%rax), %eax	 ; token_32->type, _7
 ; D:\TC\src\compiler.c:41:         else if (token->type == INTEGER)
	cmpl	$2, %eax	 ;, _7
	jne	.L18	 ;,
 ; D:\TC\src\compiler.c:42:             fprintf(file, "Token(Type: integer,     Line: ");
	movq	16(%rbp), %rax	 ; file, tmp114
	movq	%rax, %r9	 ; tmp114,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rax	 ;, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	fwrite	 ;
	jmp	.L17	 ;
.L18:
 ; D:\TC\src\compiler.c:43:         else if (token->type == FLOAT)
	movq	-24(%rbp), %rax	 ; token, tmp116
	movl	24(%rax), %eax	 ; token_32->type, _8
 ; D:\TC\src\compiler.c:43:         else if (token->type == FLOAT)
	cmpl	$3, %eax	 ;, _8
	jne	.L19	 ;,
 ; D:\TC\src\compiler.c:44:             fprintf(file, "Token(Type: float,       Line: ");
	movq	16(%rbp), %rax	 ; file, tmp117
	movq	%rax, %r9	 ; tmp117,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	fwrite	 ;
	jmp	.L17	 ;
.L19:
 ; D:\TC\src\compiler.c:45:         else if (token->type == STRING)
	movq	-24(%rbp), %rax	 ; token, tmp119
	movl	24(%rax), %eax	 ; token_32->type, _9
 ; D:\TC\src\compiler.c:45:         else if (token->type == STRING)
	cmpl	$4, %eax	 ;, _9
	jne	.L20	 ;,
 ; D:\TC\src\compiler.c:46:             fprintf(file, "Token(Type: string,      Line: ");
	movq	16(%rbp), %rax	 ; file, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
	jmp	.L17	 ;
.L20:
 ; D:\TC\src\compiler.c:47:         else if (token->type == SYMBOL)
	movq	-24(%rbp), %rax	 ; token, tmp122
	movl	24(%rax), %eax	 ; token_32->type, _10
 ; D:\TC\src\compiler.c:47:         else if (token->type == SYMBOL)
	cmpl	$5, %eax	 ;, _10
	jne	.L21	 ;,
 ; D:\TC\src\compiler.c:48:             fprintf(file, "Token(Type: symbol,      Line: ");
	movq	16(%rbp), %rax	 ; file, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
	jmp	.L17	 ;
.L21:
 ; D:\TC\src\compiler.c:49:         else if (token->type == KEYWORD)
	movq	-24(%rbp), %rax	 ; token, tmp125
	movl	24(%rax), %eax	 ; token_32->type, _11
 ; D:\TC\src\compiler.c:49:         else if (token->type == KEYWORD)
	cmpl	$6, %eax	 ;, _11
	jne	.L22	 ;,
 ; D:\TC\src\compiler.c:50:             fprintf(file, "Token(Type: keyword,     Line: ");
	movq	16(%rbp), %rax	 ; file, tmp126
	movq	%rax, %r9	 ; tmp126,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	fwrite	 ;
	jmp	.L17	 ;
.L22:
 ; D:\TC\src\compiler.c:51:         else if (token->type == COMMENT)
	movq	-24(%rbp), %rax	 ; token, tmp128
	movl	24(%rax), %eax	 ; token_32->type, _12
 ; D:\TC\src\compiler.c:51:         else if (token->type == COMMENT)
	cmpl	$7, %eax	 ;, _12
	jne	.L17	 ;,
 ; D:\TC\src\compiler.c:52:             fprintf(file, "Token(Type: comment,     Line: ");
	movq	16(%rbp), %rax	 ; file, tmp129
	movq	%rax, %r9	 ; tmp129,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	fwrite	 ;
.L17:
 ; D:\TC\src\compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp131
	movq	16(%rax), %rax	 ; token_32->column, _13
 ; D:\TC\src\compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _14
 ; D:\TC\src\compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp132
	movq	8(%rax), %rax	 ; token_32->line, _15
 ; D:\TC\src\compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _16
	movq	16(%rbp), %rax	 ; file, tmp133
	movq	%rcx, %r9	 ; _14,
	movq	%rdx, %r8	 ; _16,
	leaq	.LC12(%rip), %rdx	 ;, tmp134
	movq	%rax, %rcx	 ; tmp133,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:54:         string lexeme_ptr = token->lexeme;
	movq	-24(%rbp), %rax	 ; token, tmp135
	movq	(%rax), %rax	 ; token_32->lexeme, tmp136
	movq	%rax, -32(%rbp)	 ; tmp136, lexeme_ptr
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	$0, -16(%rbp)	 ;, i
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	jmp	.L23	 ;
.L29:
 ; D:\TC\src\compiler.c:56:             char c = lexeme_ptr[i];
	movq	-32(%rbp), %rdx	 ; lexeme_ptr, tmp137
	movq	-16(%rbp), %rax	 ; i, tmp138
	addq	%rdx, %rax	 ; tmp137, _17
 ; D:\TC\src\compiler.c:56:             char c = lexeme_ptr[i];
	movzbl	(%rax), %eax	 ; *_17, tmp139
	movb	%al, -33(%rbp)	 ; tmp139, c
 ; D:\TC\src\compiler.c:57:             if (c == '\0')
	cmpb	$0, -33(%rbp)	 ;, c
	jne	.L24	 ;,
 ; D:\TC\src\compiler.c:58:                 fputs("\\0", file);
	movq	16(%rbp), %rax	 ; file, tmp140
	movq	%rax, %r9	 ; tmp140,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rax	 ;, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	fwrite	 ;
	jmp	.L25	 ;
.L24:
 ; D:\TC\src\compiler.c:59:             else if (c == '\n')
	cmpb	$10, -33(%rbp)	 ;, c
	jne	.L26	 ;,
 ; D:\TC\src\compiler.c:60:                 fputs("\\n", file);
	movq	16(%rbp), %rax	 ; file, tmp142
	movq	%rax, %r9	 ; tmp142,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rax	 ;, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	fwrite	 ;
	jmp	.L25	 ;
.L26:
 ; D:\TC\src\compiler.c:61:             else if (c == '\t')
	cmpb	$9, -33(%rbp)	 ;, c
	jne	.L27	 ;,
 ; D:\TC\src\compiler.c:62:                 fputs("\\t", file);
	movq	16(%rbp), %rax	 ; file, tmp144
	movq	%rax, %r9	 ; tmp144,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	fwrite	 ;
	jmp	.L25	 ;
.L27:
 ; D:\TC\src\compiler.c:63:             else if (c == '\r')
	cmpb	$13, -33(%rbp)	 ;, c
	jne	.L28	 ;,
 ; D:\TC\src\compiler.c:64:                 fputs("\\r", file);
	movq	16(%rbp), %rax	 ; file, tmp146
	movq	%rax, %r9	 ; tmp146,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	fwrite	 ;
	jmp	.L25	 ;
.L28:
 ; D:\TC\src\compiler.c:66:                 fputc(c, file);
	movsbl	-33(%rbp), %eax	 ; c, _18
	movq	16(%rbp), %rdx	 ; file, tmp148
	movl	%eax, %ecx	 ; _18,
	call	fputc	 ;
.L25:
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	addq	$1, -16(%rbp)	 ;, i
.L23:
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	-32(%rbp), %rax	 ; lexeme_ptr, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, -16(%rbp)	 ; _19, i
	jb	.L29	 ;,
 ; D:\TC\src\compiler.c:68:         fprintf(file, "'\n");
	movq	16(%rbp), %rax	 ; file, tmp150
	movq	%rax, %r9	 ; tmp150,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	fwrite	 ;
 ; D:\TC\src\compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	24(%rbp), %rax	 ; lexer, tmp152
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp152,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp153, current
.L13:
 ; D:\TC\src\compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L30	 ;,
.L15:
 ; D:\TC\src\compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\src\compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	16(%rbp), %rax	 ; file, tmp154
	movq	%rdx, %r8	 ; _20,
	leaq	.LC18(%rip), %rdx	 ;, tmp155
	movq	%rax, %rcx	 ; tmp154,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:71: }
	nop	
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
	.seh_proc	output_ast
output_ast:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; lexer, lexer
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp84
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.0_1
	movq	32(%rbp), %rcx	 ; parser, tmp85
	movq	24(%rbp), %rax	 ; lexer, tmp86
	movq	%rcx, %r8	 ; tmp85,
	movq	%rax, %rcx	 ; tmp86,
	call	parse_code	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, ast_root
 ; D:\TC\src\compiler.c:74:     output_code(ast_root, file, 0, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp88
	movq	16(%rbp), %rdx	 ; file, tmp89
	movq	-8(%rbp), %rax	 ; ast_root, tmp90
	movq	%rcx, %r9	 ; tmp88,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	output_code	 ;
 ; D:\TC\src\compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %rdx	 ;, _2
 ; D:\TC\src\compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	16(%rbp), %rax	 ; file, tmp91
	movq	%rdx, %r8	 ; _2,
	leaq	.LC18(%rip), %rdx	 ;, tmp92
	movq	%rax, %rcx	 ; tmp91,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:76: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
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
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	addq	$-128, %rsp	 ;,
	.seh_stackalloc	128
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; name, name
	movl	%edx, %eax	 ; o_token, tmp91
	movl	%r8d, %edx	 ; o_ast, tmp93
	movb	%al, 24(%rbp)	 ; tmp92, o_token
	movl	%edx, %eax	 ; tmp93, tmp94
	movb	%al, 32(%rbp)	 ; tmp94, o_ast
 ; D:\TC\src\compiler.c:78:     File* file = create_file(name);
	movq	16(%rbp), %rax	 ; name, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	create_file	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, file
 ; D:\TC\src\compiler.c:79:     string filename = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	get_full_path	 ;
	movq	%rax, -16(%rbp)	 ; tmp98, filename
 ; D:\TC\src\compiler.c:80:     size_t length = 0;
	movq	$0, -88(%rbp)	 ;, length
 ; D:\TC\src\compiler.c:81:     FILE* source_file = fopen(filename, "r");
	movq	-16(%rbp), %rax	 ; filename, tmp99
	leaq	.LC19(%rip), %rdx	 ;, tmp100
	movq	%rax, %rcx	 ; tmp99,
	call	fopen	 ;
	movq	%rax, -24(%rbp)	 ; tmp101, source_file
 ; D:\TC\src\compiler.c:82:     if (source_file == NULL) {
	cmpq	$0, -24(%rbp)	 ;, source_file
	jne	.L33	 ;,
 ; D:\TC\src\compiler.c:83:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:83:         fprintf(stderr, "Error opening file: %s", filename);
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\compiler.c:83:         fprintf(stderr, "Error opening file: %s", filename);
	movq	-16(%rbp), %rdx	 ; filename, tmp102
	movq	%rdx, %r8	 ; tmp102,
	leaq	.LC20(%rip), %rdx	 ;, tmp103
	movq	%rax, %rcx	 ; _2,
	call	fprintf	 ;
	jmp	.L32	 ;
.L33:
 ; D:\TC\src\compiler.c:86:     string source = read_source(source_file, &length);
	leaq	-88(%rbp), %rdx	 ;, tmp104
	movq	-24(%rbp), %rax	 ; source_file, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	read_source	 ;
	movq	%rax, -32(%rbp)	 ; tmp106, source
 ; D:\TC\src\compiler.c:87:     fclose(source_file);
	movq	-24(%rbp), %rax	 ; source_file, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	fclose	 ;
 ; D:\TC\src\compiler.c:88:     Lexer* lexer = create_lexer(source, length);
	movq	-88(%rbp), %rdx	 ; length, length.1_3
	movq	-32(%rbp), %rax	 ; source, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	create_lexer	 ;
	movq	%rax, -40(%rbp)	 ; tmp109, lexer
 ; D:\TC\src\compiler.c:89:     if (o_token) {
	cmpb	$0, 24(%rbp)	 ;, o_token
	je	.L35	 ;,
 ; D:\TC\src\compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC21(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _4
 ; D:\TC\src\compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	-8(%rbp), %rax	 ; file, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:91:         string out_token_name = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	get_full_path	 ;
	movq	%rax, -48(%rbp)	 ; tmp113, out_token_name
 ; D:\TC\src\compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	-48(%rbp), %rax	 ; out_token_name, tmp114
	leaq	.LC22(%rip), %rdx	 ;, tmp115
	movq	%rax, %rcx	 ; tmp114,
	call	fopen	 ;
	movq	%rax, -56(%rbp)	 ; tmp116, out_token_file
 ; D:\TC\src\compiler.c:93:         if (out_token_file == NULL)
	cmpq	$0, -56(%rbp)	 ;, out_token_file
	jne	.L36	 ;,
 ; D:\TC\src\compiler.c:94:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:94:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\compiler.c:94:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	-48(%rbp), %rdx	 ; out_token_name, tmp117
	movq	%rdx, %r8	 ; tmp117,
	leaq	.LC23(%rip), %rdx	 ;, tmp118
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
	jmp	.L35	 ;
.L36:
 ; D:\TC\src\compiler.c:96:             output_token(out_token_file, lexer);
	movq	-40(%rbp), %rdx	 ; lexer, tmp119
	movq	-56(%rbp), %rax	 ; out_token_file, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	output_token	 ;
 ; D:\TC\src\compiler.c:97:             fclose(out_token_file);
	movq	-56(%rbp), %rax	 ; out_token_file, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fclose	 ;
.L35:
 ; D:\TC\src\compiler.c:100:     reset_lexer(lexer);
	movq	-40(%rbp), %rax	 ; lexer, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:101:     Parser* parser = create_parser();
	call	create_parser	 ;
	movq	%rax, -64(%rbp)	 ; tmp123, parser
 ; D:\TC\src\compiler.c:102:     if (o_ast) {
	cmpb	$0, 32(%rbp)	 ;, o_ast
	je	.L32	 ;,
 ; D:\TC\src\compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC24(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:\TC\src\compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	-8(%rbp), %rax	 ; file, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	get_full_path	 ;
	movq	%rax, -72(%rbp)	 ; tmp127, out_ast_name
 ; D:\TC\src\compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	-72(%rbp), %rax	 ; out_ast_name, tmp128
	leaq	.LC22(%rip), %rdx	 ;, tmp129
	movq	%rax, %rcx	 ; tmp128,
	call	fopen	 ;
	movq	%rax, -80(%rbp)	 ; tmp130, out_ast_file
 ; D:\TC\src\compiler.c:106:         if (out_ast_file == NULL)
	cmpq	$0, -80(%rbp)	 ;, out_ast_file
	jne	.L38	 ;,
 ; D:\TC\src\compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:\TC\src\compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	-72(%rbp), %rdx	 ; out_ast_name, tmp131
	movq	%rdx, %r8	 ; tmp131,
	leaq	.LC23(%rip), %rdx	 ;, tmp132
	movq	%rax, %rcx	 ; _9,
	call	fprintf	 ;
	jmp	.L32	 ;
.L38:
 ; D:\TC\src\compiler.c:109:             output_ast(out_ast_file, lexer, parser);
	movq	-64(%rbp), %rcx	 ; parser, tmp133
	movq	-40(%rbp), %rdx	 ; lexer, tmp134
	movq	-80(%rbp), %rax	 ; out_ast_file, tmp135
	movq	%rcx, %r8	 ; tmp133,
	movq	%rax, %rcx	 ; tmp135,
	call	output_ast	 ;
 ; D:\TC\src\compiler.c:110:             fclose(out_ast_file);
	movq	-80(%rbp), %rax	 ; out_ast_file, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	fclose	 ;
	nop	
.L32:
 ; D:\TC\src\compiler.c:113: }
	subq	$-128, %rsp	 ;,
	popq	%rbp	 ;
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
	.def	fwrite;	.scl	2;	.type	32;	.endef
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

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
	movq	32(%rbp), %rax	 ; src, tmp85
	movq	%rax, %rcx	 ; tmp85,
	call	strlen	 ;
	movq	%rax, -8(%rbp)	 ; tmp86, src_length
 ; D:\TC\src\compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	40(%rbp), %rax	 ; new, tmp87
	movq	%rax, %rcx	 ; tmp87,
	call	strlen	 ;
	movq	%rax, -16(%rbp)	 ; tmp88, new_length
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	movq	-8(%rbp), %rdx	 ; src_length, tmp89
	movq	-16(%rbp), %rax	 ; new_length, tmp90
	addq	%rdx, %rax	 ; tmp89, _1
 ; D:\TC\src\compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	24(%rbp), %rax	 ; dest_length, _1
	jb	.L2	 ;,
 ; D:\TC\src\compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	movq	24(%rbp), %rax	 ; dest_length, tmp91
	subq	-16(%rbp), %rax	 ; new_length, _2
 ; D:\TC\src\compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	subq	$1, %rax	 ;, tmp92
	movq	%rax, -24(%rbp)	 ; tmp92, max_src_length
 ; D:\TC\src\compiler.c:11:         snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
	movq	-24(%rbp), %rax	 ; max_src_length, tmp93
	movl	%eax, %r8d	 ; tmp93, _3
	movq	24(%rbp), %rdx	 ; dest_length, tmp94
	movq	16(%rbp), %rax	 ; dest, tmp95
	movq	40(%rbp), %rcx	 ; new, tmp96
	movq	%rcx, 40(%rsp)	 ; tmp96,
	movq	32(%rbp), %rcx	 ; src, tmp97
	movq	%rcx, 32(%rsp)	 ; tmp97,
	movl	%r8d, %r9d	 ; _3,
	leaq	.LC0(%rip), %r8	 ;,
	movq	%rax, %rcx	 ; tmp95,
	call	snprintf	 ;
 ; D:\TC\src\compiler.c:14: }
	jmp	.L4	 ;
.L2:
 ; D:\TC\src\compiler.c:13:         sprintf(dest, "%s%s", src, new);
	movq	40(%rbp), %rcx	 ; new, tmp98
	movq	32(%rbp), %rdx	 ; src, tmp99
	movq	16(%rbp), %rax	 ; dest, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movq	%rdx, %r8	 ; tmp99,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	movq	%rax, %rcx	 ; tmp100,
	call	sprintf	 ;
.L4:
 ; D:\TC\src\compiler.c:14: }
	nop	
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC2:
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
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; length, length
 ; D:\TC\src\compiler.c:16:     fseek(file, 0, SEEK_END);
	movq	16(%rbp), %rax	 ; file, tmp97
	movl	$2, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:17:     *length = (size_t)ftell(file);
	movq	16(%rbp), %rax	 ; file, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:17:     *length = (size_t)ftell(file);
	movq	%rax, %rdx	 ; _1, _2
 ; D:\TC\src\compiler.c:17:     *length = (size_t)ftell(file);
	movq	24(%rbp), %rax	 ; length, tmp99
	movq	%rdx, (%rax)	 ; _2, *length_21(D)
 ; D:\TC\src\compiler.c:18:     fseek(file, 0, SEEK_SET);
	movq	16(%rbp), %rax	 ; file, tmp100
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:20:     string source = create_string("", *length + 1);
	movq	24(%rbp), %rax	 ; length, tmp101
	movq	(%rax), %rax	 ; *length_21(D), _3
 ; D:\TC\src\compiler.c:20:     string source = create_string("", *length + 1);
	addq	$1, %rax	 ;, _4
	movq	%rax, %rdx	 ; _4,
	leaq	.LC2(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	create_string	 ;
	movq	%rax, -16(%rbp)	 ; tmp103, source
 ; D:\TC\src\compiler.c:21:     fread(source, 1, *length, file);
	movq	24(%rbp), %rax	 ; length, tmp104
	movq	(%rax), %rdx	 ; *length_21(D), _5
	movq	16(%rbp), %rcx	 ; file, tmp105
	movq	-16(%rbp), %rax	 ; source, tmp106
	movq	%rcx, %r9	 ; tmp105,
	movq	%rdx, %r8	 ; _5,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp106,
	call	fread	 ;
 ; D:\TC\src\compiler.c:22:     source[*length] = '\0';
	movq	24(%rbp), %rax	 ; length, tmp107
	movq	(%rax), %rdx	 ; *length_21(D), _6
 ; D:\TC\src\compiler.c:22:     source[*length] = '\0';
	movq	-16(%rbp), %rax	 ; source, tmp108
	addq	%rdx, %rax	 ; _6, _7
 ; D:\TC\src\compiler.c:22:     source[*length] = '\0';
	movb	$0, (%rax)	 ;, *_7
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	movq	$0, -8(%rbp)	 ;, i
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	jmp	.L6	 ;
.L9:
 ; D:\TC\src\compiler.c:25:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	 ; source, tmp109
	movq	-8(%rbp), %rax	 ; i, tmp110
	addq	%rdx, %rax	 ; tmp109, _8
	movzbl	(%rax), %eax	 ; *_8, _9
 ; D:\TC\src\compiler.c:25:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$13, %al	 ;, _9
	je	.L7	 ;,
 ; D:\TC\src\compiler.c:25:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	 ; source, tmp111
	movq	-8(%rbp), %rax	 ; i, tmp112
	addq	%rdx, %rax	 ; tmp111, _10
	movzbl	(%rax), %eax	 ; *_10, _11
 ; D:\TC\src\compiler.c:25:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %al	 ;, _11
	jne	.L8	 ;,
.L7:
 ; D:\TC\src\compiler.c:26:             source[i] = ' ';
	movq	-16(%rbp), %rdx	 ; source, tmp113
	movq	-8(%rbp), %rax	 ; i, tmp114
	addq	%rdx, %rax	 ; tmp113, _12
 ; D:\TC\src\compiler.c:26:             source[i] = ' ';
	movb	$32, (%rax)	 ;, *_12
.L8:
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, -8(%rbp)	 ;, i
.L6:
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	movq	24(%rbp), %rax	 ; length, tmp115
	movq	(%rax), %rax	 ; *length_21(D), _13
 ; D:\TC\src\compiler.c:24:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rax, -8(%rbp)	 ; _13, i
	jb	.L9	 ;,
 ; D:\TC\src\compiler.c:28:     return source;
	movq	-16(%rbp), %rax	 ; source, _29
 ; D:\TC\src\compiler.c:29: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
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
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	24(%rbp), %rax	 ; lexer, tmp102
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp103, current
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	jmp	.L12	 ;
.L29:
 ; D:\TC\src\compiler.c:32:         Token* token = current;
	movq	-8(%rbp), %rax	 ; current, tmp104
	movq	%rax, -24(%rbp)	 ; tmp104, token
 ; D:\TC\src\compiler.c:33:         if (token->type == EOF_TOKEN) {
	movq	-24(%rbp), %rax	 ; token, tmp105
	movl	24(%rax), %eax	 ; token_32->type, _1
 ; D:\TC\src\compiler.c:33:         if (token->type == EOF_TOKEN) {
	testl	%eax, %eax	 ; _1
	jne	.L13	 ;,
 ; D:\TC\src\compiler.c:34:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp106
	movq	16(%rax), %rax	 ; token_32->column, _2
 ; D:\TC\src\compiler.c:34:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _3
 ; D:\TC\src\compiler.c:34:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp107
	movq	8(%rax), %rax	 ; token_32->line, _4
 ; D:\TC\src\compiler.c:34:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _5
	movq	16(%rbp), %rax	 ; file, tmp108
	movq	%rcx, %r9	 ; _3,
	movq	%rdx, %r8	 ; _5,
	leaq	.LC3(%rip), %rdx	 ;, tmp109
	movq	%rax, %rcx	 ; tmp108,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:35:             break;
	jmp	.L14	 ;
.L13:
 ; D:\TC\src\compiler.c:36:         } else if (token->type == IDENTIFIER)
	movq	-24(%rbp), %rax	 ; token, tmp110
	movl	24(%rax), %eax	 ; token_32->type, _6
 ; D:\TC\src\compiler.c:36:         } else if (token->type == IDENTIFIER)
	cmpl	$1, %eax	 ;, _6
	jne	.L15	 ;,
 ; D:\TC\src\compiler.c:37:             fprintf(file, "Token(Type: identifier,  Line: ");
	movq	16(%rbp), %rax	 ; file, tmp111
	movq	%rax, %r9	 ; tmp111,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	fwrite	 ;
	jmp	.L16	 ;
.L15:
 ; D:\TC\src\compiler.c:38:         else if (token->type == INTEGER)
	movq	-24(%rbp), %rax	 ; token, tmp113
	movl	24(%rax), %eax	 ; token_32->type, _7
 ; D:\TC\src\compiler.c:38:         else if (token->type == INTEGER)
	cmpl	$2, %eax	 ;, _7
	jne	.L17	 ;,
 ; D:\TC\src\compiler.c:39:             fprintf(file, "Token(Type: integer,     Line: ");
	movq	16(%rbp), %rax	 ; file, tmp114
	movq	%rax, %r9	 ; tmp114,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rax	 ;, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	fwrite	 ;
	jmp	.L16	 ;
.L17:
 ; D:\TC\src\compiler.c:40:         else if (token->type == FLOAT)
	movq	-24(%rbp), %rax	 ; token, tmp116
	movl	24(%rax), %eax	 ; token_32->type, _8
 ; D:\TC\src\compiler.c:40:         else if (token->type == FLOAT)
	cmpl	$3, %eax	 ;, _8
	jne	.L18	 ;,
 ; D:\TC\src\compiler.c:41:             fprintf(file, "Token(Type: float,       Line: ");
	movq	16(%rbp), %rax	 ; file, tmp117
	movq	%rax, %r9	 ; tmp117,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rax	 ;, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	fwrite	 ;
	jmp	.L16	 ;
.L18:
 ; D:\TC\src\compiler.c:42:         else if (token->type == STRING)
	movq	-24(%rbp), %rax	 ; token, tmp119
	movl	24(%rax), %eax	 ; token_32->type, _9
 ; D:\TC\src\compiler.c:42:         else if (token->type == STRING)
	cmpl	$4, %eax	 ;, _9
	jne	.L19	 ;,
 ; D:\TC\src\compiler.c:43:             fprintf(file, "Token(Type: string,      Line: ");
	movq	16(%rbp), %rax	 ; file, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
	jmp	.L16	 ;
.L19:
 ; D:\TC\src\compiler.c:44:         else if (token->type == SYMBOL)
	movq	-24(%rbp), %rax	 ; token, tmp122
	movl	24(%rax), %eax	 ; token_32->type, _10
 ; D:\TC\src\compiler.c:44:         else if (token->type == SYMBOL)
	cmpl	$5, %eax	 ;, _10
	jne	.L20	 ;,
 ; D:\TC\src\compiler.c:45:             fprintf(file, "Token(Type: symbol,      Line: ");
	movq	16(%rbp), %rax	 ; file, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
	jmp	.L16	 ;
.L20:
 ; D:\TC\src\compiler.c:46:         else if (token->type == KEYWORD)
	movq	-24(%rbp), %rax	 ; token, tmp125
	movl	24(%rax), %eax	 ; token_32->type, _11
 ; D:\TC\src\compiler.c:46:         else if (token->type == KEYWORD)
	cmpl	$6, %eax	 ;, _11
	jne	.L21	 ;,
 ; D:\TC\src\compiler.c:47:             fprintf(file, "Token(Type: keyword,     Line: ");
	movq	16(%rbp), %rax	 ; file, tmp126
	movq	%rax, %r9	 ; tmp126,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rax	 ;, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	fwrite	 ;
	jmp	.L16	 ;
.L21:
 ; D:\TC\src\compiler.c:48:         else if (token->type == COMMENT)
	movq	-24(%rbp), %rax	 ; token, tmp128
	movl	24(%rax), %eax	 ; token_32->type, _12
 ; D:\TC\src\compiler.c:48:         else if (token->type == COMMENT)
	cmpl	$7, %eax	 ;, _12
	jne	.L16	 ;,
 ; D:\TC\src\compiler.c:49:             fprintf(file, "Token(Type: comment,     Line: ");
	movq	16(%rbp), %rax	 ; file, tmp129
	movq	%rax, %r9	 ; tmp129,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	fwrite	 ;
.L16:
 ; D:\TC\src\compiler.c:50:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp131
	movq	16(%rax), %rax	 ; token_32->column, _13
 ; D:\TC\src\compiler.c:50:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _14
 ; D:\TC\src\compiler.c:50:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	 ; token, tmp132
	movq	8(%rax), %rax	 ; token_32->line, _15
 ; D:\TC\src\compiler.c:50:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _16
	movq	16(%rbp), %rax	 ; file, tmp133
	movq	%rcx, %r9	 ; _14,
	movq	%rdx, %r8	 ; _16,
	leaq	.LC11(%rip), %rdx	 ;, tmp134
	movq	%rax, %rcx	 ; tmp133,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:51:         string lexeme_ptr = token->lexeme;
	movq	-24(%rbp), %rax	 ; token, tmp135
	movq	(%rax), %rax	 ; token_32->lexeme, tmp136
	movq	%rax, -32(%rbp)	 ; tmp136, lexeme_ptr
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	$0, -16(%rbp)	 ;, i
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	jmp	.L22	 ;
.L28:
 ; D:\TC\src\compiler.c:53:             char c = lexeme_ptr[i];
	movq	-32(%rbp), %rdx	 ; lexeme_ptr, tmp137
	movq	-16(%rbp), %rax	 ; i, tmp138
	addq	%rdx, %rax	 ; tmp137, _17
 ; D:\TC\src\compiler.c:53:             char c = lexeme_ptr[i];
	movzbl	(%rax), %eax	 ; *_17, tmp139
	movb	%al, -33(%rbp)	 ; tmp139, c
 ; D:\TC\src\compiler.c:54:             if (c == '\0')
	cmpb	$0, -33(%rbp)	 ;, c
	jne	.L23	 ;,
 ; D:\TC\src\compiler.c:55:                 fputs("\\0", file);
	movq	16(%rbp), %rax	 ; file, tmp140
	movq	%rax, %r9	 ; tmp140,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	fwrite	 ;
	jmp	.L24	 ;
.L23:
 ; D:\TC\src\compiler.c:56:             else if (c == '\n')
	cmpb	$10, -33(%rbp)	 ;, c
	jne	.L25	 ;,
 ; D:\TC\src\compiler.c:57:                 fputs("\\n", file);
	movq	16(%rbp), %rax	 ; file, tmp142
	movq	%rax, %r9	 ; tmp142,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rax	 ;, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	fwrite	 ;
	jmp	.L24	 ;
.L25:
 ; D:\TC\src\compiler.c:58:             else if (c == '\t')
	cmpb	$9, -33(%rbp)	 ;, c
	jne	.L26	 ;,
 ; D:\TC\src\compiler.c:59:                 fputs("\\t", file);
	movq	16(%rbp), %rax	 ; file, tmp144
	movq	%rax, %r9	 ; tmp144,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	fwrite	 ;
	jmp	.L24	 ;
.L26:
 ; D:\TC\src\compiler.c:60:             else if (c == '\r')
	cmpb	$13, -33(%rbp)	 ;, c
	jne	.L27	 ;,
 ; D:\TC\src\compiler.c:61:                 fputs("\\r", file);
	movq	16(%rbp), %rax	 ; file, tmp146
	movq	%rax, %r9	 ; tmp146,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	fwrite	 ;
	jmp	.L24	 ;
.L27:
 ; D:\TC\src\compiler.c:63:                 fputc(c, file);
	movsbl	-33(%rbp), %eax	 ; c, _18
	movq	16(%rbp), %rdx	 ; file, tmp148
	movl	%eax, %ecx	 ; _18,
	call	fputc	 ;
.L24:
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	addq	$1, -16(%rbp)	 ;, i
.L22:
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	-32(%rbp), %rax	 ; lexeme_ptr, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:52:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, -16(%rbp)	 ; _19, i
	jb	.L28	 ;,
 ; D:\TC\src\compiler.c:65:         fprintf(file, "'\n");
	movq	16(%rbp), %rax	 ; file, tmp150
	movq	%rax, %r9	 ; tmp150,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	fwrite	 ;
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	24(%rbp), %rax	 ; lexer, tmp152
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp152,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp153, current
.L12:
 ; D:\TC\src\compiler.c:31:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L29	 ;,
.L14:
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\src\compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	16(%rbp), %rax	 ; file, tmp154
	movq	%rdx, %r8	 ; _20,
	leaq	.LC17(%rip), %rdx	 ;, tmp155
	movq	%rax, %rcx	 ; tmp154,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:68: }
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
 ; D:\TC\src\compiler.c:70:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp84
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.0_1
	movq	32(%rbp), %rcx	 ; parser, tmp85
	movq	24(%rbp), %rax	 ; lexer, tmp86
	movq	%rcx, %r8	 ; tmp85,
	movq	%rax, %rcx	 ; tmp86,
	call	parse_code	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, ast_root
 ; D:\TC\src\compiler.c:71:     output_code(ast_root, file, 0, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp88
	movq	16(%rbp), %rdx	 ; file, tmp89
	movq	-8(%rbp), %rax	 ; ast_root, tmp90
	movq	%rcx, %r9	 ; tmp88,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	output_code	 ;
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %rdx	 ;, _2
 ; D:\TC\src\compiler.c:72:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	16(%rbp), %rax	 ; file, tmp91
	movq	%rdx, %r8	 ; _2,
	leaq	.LC17(%rip), %rdx	 ;, tmp92
	movq	%rax, %rcx	 ; tmp91,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:73: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
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
 ; D:\TC\src\compiler.c:75:     File* file = create_file(name);
	movq	16(%rbp), %rax	 ; name, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	create_file	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, file
 ; D:\TC\src\compiler.c:76:     string filename = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	get_full_path	 ;
	movq	%rax, -16(%rbp)	 ; tmp98, filename
 ; D:\TC\src\compiler.c:77:     size_t length = 0;
	movq	$0, -88(%rbp)	 ;, length
 ; D:\TC\src\compiler.c:78:     FILE* source_file = fopen(filename, "r");
	movq	-16(%rbp), %rax	 ; filename, tmp99
	leaq	.LC18(%rip), %rdx	 ;, tmp100
	movq	%rax, %rcx	 ; tmp99,
	call	fopen	 ;
	movq	%rax, -24(%rbp)	 ; tmp101, source_file
 ; D:\TC\src\compiler.c:79:     if (source_file == NULL) {
	cmpq	$0, -24(%rbp)	 ;, source_file
	jne	.L32	 ;,
 ; D:\TC\src\compiler.c:80:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:80:         fprintf(stderr, "Error opening file: %s", filename);
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\compiler.c:80:         fprintf(stderr, "Error opening file: %s", filename);
	movq	-16(%rbp), %rdx	 ; filename, tmp102
	movq	%rdx, %r8	 ; tmp102,
	leaq	.LC19(%rip), %rdx	 ;, tmp103
	movq	%rax, %rcx	 ; _2,
	call	fprintf	 ;
	jmp	.L31	 ;
.L32:
 ; D:\TC\src\compiler.c:83:     string source = read_source(source_file, &length);
	leaq	-88(%rbp), %rdx	 ;, tmp104
	movq	-24(%rbp), %rax	 ; source_file, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	read_source	 ;
	movq	%rax, -32(%rbp)	 ; tmp106, source
 ; D:\TC\src\compiler.c:84:     fclose(source_file);
	movq	-24(%rbp), %rax	 ; source_file, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	fclose	 ;
 ; D:\TC\src\compiler.c:85:     Lexer* lexer = create_lexer(source, length);
	movq	-88(%rbp), %rdx	 ; length, length.1_3
	movq	-32(%rbp), %rax	 ; source, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	create_lexer	 ;
	movq	%rax, -40(%rbp)	 ; tmp109, lexer
 ; D:\TC\src\compiler.c:86:     if (o_token) {
	cmpb	$0, 24(%rbp)	 ;, o_token
	je	.L34	 ;,
 ; D:\TC\src\compiler.c:88:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC20(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _4
 ; D:\TC\src\compiler.c:88:         change_file_extension(file, create_string(".token", 6));
	movq	-8(%rbp), %rax	 ; file, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:89:         string out_token_name = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	get_full_path	 ;
	movq	%rax, -48(%rbp)	 ; tmp113, out_token_name
 ; D:\TC\src\compiler.c:90:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	-48(%rbp), %rax	 ; out_token_name, tmp114
	leaq	.LC21(%rip), %rdx	 ;, tmp115
	movq	%rax, %rcx	 ; tmp114,
	call	fopen	 ;
	movq	%rax, -56(%rbp)	 ; tmp116, out_token_file
 ; D:\TC\src\compiler.c:91:         if (out_token_file == NULL)
	cmpq	$0, -56(%rbp)	 ;, out_token_file
	jne	.L35	 ;,
 ; D:\TC\src\compiler.c:92:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:92:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\compiler.c:92:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	-48(%rbp), %rdx	 ; out_token_name, tmp117
	movq	%rdx, %r8	 ; tmp117,
	leaq	.LC22(%rip), %rdx	 ;, tmp118
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
	jmp	.L36	 ;
.L35:
 ; D:\TC\src\compiler.c:94:             output_token(out_token_file, lexer);
	movq	-40(%rbp), %rdx	 ; lexer, tmp119
	movq	-56(%rbp), %rax	 ; out_token_file, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	output_token	 ;
.L36:
 ; D:\TC\src\compiler.c:95:         fclose(out_token_file);
	movq	-56(%rbp), %rax	 ; out_token_file, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fclose	 ;
.L34:
 ; D:\TC\src\compiler.c:97:     reset_lexer(lexer);
	movq	-40(%rbp), %rax	 ; lexer, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:98:     Parser* parser = create_parser();
	call	create_parser	 ;
	movq	%rax, -64(%rbp)	 ; tmp123, parser
 ; D:\TC\src\compiler.c:99:     if (o_ast) {
	cmpb	$0, 32(%rbp)	 ;, o_ast
	je	.L31	 ;,
 ; D:\TC\src\compiler.c:101:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC23(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:\TC\src\compiler.c:101:         change_file_extension(file, create_string(".ast", 4));
	movq	-8(%rbp), %rax	 ; file, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:102:         string out_ast_name = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	get_full_path	 ;
	movq	%rax, -72(%rbp)	 ; tmp127, out_ast_name
 ; D:\TC\src\compiler.c:103:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	-72(%rbp), %rax	 ; out_ast_name, tmp128
	leaq	.LC21(%rip), %rdx	 ;, tmp129
	movq	%rax, %rcx	 ; tmp128,
	call	fopen	 ;
	movq	%rax, -80(%rbp)	 ; tmp130, out_ast_file
 ; D:\TC\src\compiler.c:104:         if (out_ast_file == NULL)
	cmpq	$0, -80(%rbp)	 ;, out_ast_file
	jne	.L38	 ;,
 ; D:\TC\src\compiler.c:105:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:105:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:\TC\src\compiler.c:105:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	-72(%rbp), %rdx	 ; out_ast_name, tmp131
	movq	%rdx, %r8	 ; tmp131,
	leaq	.LC22(%rip), %rdx	 ;, tmp132
	movq	%rax, %rcx	 ; _9,
	call	fprintf	 ;
	jmp	.L39	 ;
.L38:
 ; D:\TC\src\compiler.c:107:             output_ast(out_ast_file, lexer, parser);
	movq	-64(%rbp), %rcx	 ; parser, tmp133
	movq	-40(%rbp), %rdx	 ; lexer, tmp134
	movq	-80(%rbp), %rax	 ; out_ast_file, tmp135
	movq	%rcx, %r8	 ; tmp133,
	movq	%rax, %rcx	 ; tmp135,
	call	output_ast	 ;
.L39:
 ; D:\TC\src\compiler.c:108:         fclose(out_ast_file);
	movq	-80(%rbp), %rax	 ; out_ast_file, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	fclose	 ;
	nop	
.L31:
 ; D:\TC\src\compiler.c:110: }
	subq	$-128, %rsp	 ;,
	popq	%rbp	 ;
	ret	
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

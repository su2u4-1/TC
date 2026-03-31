	.file	"D:\\TC\\src\\compiler.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
	.text
	.globl	read_source
	.def	read_source;	.scl	2;	.type	32;	.endef
read_source:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; length, length
 ; D:\TC\src\compiler.c:7:     fseek(file, 0, SEEK_END);
	movq	16(%rbp), %rax	 ; file, tmp96
	movl	$2, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp96,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:8:     *length = (size_t)ftell(file);
	movq	16(%rbp), %rax	 ; file, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	ftell	 ;
 ; D:\TC\src\compiler.c:8:     *length = (size_t)ftell(file);
	movq	%rax, %rdx	 ; _1, _2
 ; D:\TC\src\compiler.c:8:     *length = (size_t)ftell(file);
	movq	24(%rbp), %rax	 ; length, tmp98
	movq	%rdx, (%rax)	 ; _2, *length_20(D)
 ; D:\TC\src\compiler.c:9:     fseek(file, 0, SEEK_SET);
	movq	16(%rbp), %rax	 ; file, tmp99
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	fseek	 ;
 ; D:\TC\src\compiler.c:11:     string source = create_string_not_check("", *length + 1);
	movq	24(%rbp), %rax	 ; length, tmp100
	movq	(%rax), %rax	 ; *length_20(D), _3
 ; D:\TC\src\compiler.c:11:     string source = create_string_not_check("", *length + 1);
	addq	$1, %rax	 ;, _4
	movq	%rax, %rdx	 ; _4,
	leaq	.LC0(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	create_string_not_check	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, source
 ; D:\TC\src\compiler.c:12:     size_t bytes_read = fread(source, 1, *length, file);
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
 ; D:\TC\src\compiler.c:13:     source[bytes_read] = '\0';
	movq	-16(%rbp), %rdx	 ; source, tmp107
	movq	-24(%rbp), %rax	 ; bytes_read, tmp108
	addq	%rdx, %rax	 ; tmp107, _6
 ; D:\TC\src\compiler.c:13:     source[bytes_read] = '\0';
	movb	$0, (%rax)	 ;, *_6
 ; D:\TC\src\compiler.c:14:     *length = bytes_read;
	movq	24(%rbp), %rax	 ; length, tmp109
	movq	-24(%rbp), %rdx	 ; bytes_read, tmp110
	movq	%rdx, (%rax)	 ; tmp110, *length_20(D)
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	movq	$0, -8(%rbp)	 ;, i
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	jmp	.L2	 ;
.L5:
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	 ; source, tmp111
	movq	-8(%rbp), %rax	 ; i, tmp112
	addq	%rdx, %rax	 ; tmp111, _7
	movzbl	(%rax), %eax	 ; *_7, _8
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$13, %al	 ;, _8
	je	.L3	 ;,
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	 ; source, tmp113
	movq	-8(%rbp), %rax	 ; i, tmp114
	addq	%rdx, %rax	 ; tmp113, _9
	movzbl	(%rax), %eax	 ; *_9, _10
 ; D:\TC\src\compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %al	 ;, _10
	jne	.L4	 ;,
.L3:
 ; D:\TC\src\compiler.c:18:             source[i] = ' ';
	movq	-16(%rbp), %rdx	 ; source, tmp115
	movq	-8(%rbp), %rax	 ; i, tmp116
	addq	%rdx, %rax	 ; tmp115, _11
 ; D:\TC\src\compiler.c:18:             source[i] = ' ';
	movb	$32, (%rax)	 ;, *_11
.L4:
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, -8(%rbp)	 ;, i
.L2:
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	movq	24(%rbp), %rax	 ; length, tmp117
	movq	(%rax), %rax	 ; *length_20(D), _12
 ; D:\TC\src\compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rax, -8(%rbp)	 ; _12, i
	jb	.L5	 ;,
 ; D:\TC\src\compiler.c:20:     return source;
	movq	-16(%rbp), %rax	 ; source, _30
 ; D:\TC\src\compiler.c:21: }
	leave	
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
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; token, token
 ; D:\TC\src\compiler.c:23:     if (token->type == EOF_TOKEN) {
	movq	24(%rbp), %rax	 ; token, tmp127
	movl	24(%rax), %eax	 ; token_52(D)->type, _1
 ; D:\TC\src\compiler.c:23:     if (token->type == EOF_TOKEN) {
	testl	%eax, %eax	 ; _1
	jne	.L8	 ;,
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp128
	movq	16(%rax), %rax	 ; token_52(D)->column, _2
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _3
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp129
	movq	8(%rax), %rax	 ; token_52(D)->line, _4
 ; D:\TC\src\compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _5
	movq	16(%rbp), %rax	 ; file, tmp130
	movq	%rcx, %r9	 ; _3,
	movq	%rdx, %r8	 ; _5,
	leaq	.LC1(%rip), %rdx	 ;, tmp131
	movq	%rax, %rcx	 ; tmp130,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:25:         return;
	jmp	.L7	 ;
.L8:
 ; D:\TC\src\compiler.c:26:     } else if (token->type == IDENTIFIER)
	movq	24(%rbp), %rax	 ; token, tmp132
	movl	24(%rax), %eax	 ; token_52(D)->type, _6
 ; D:\TC\src\compiler.c:26:     } else if (token->type == IDENTIFIER)
	cmpl	$1, %eax	 ;, _6
	jne	.L10	 ;,
 ; D:\TC\src\compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp133
	movq	16(%rax), %rax	 ; token_52(D)->column, _7
 ; D:\TC\src\compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _8
 ; D:\TC\src\compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp134
	movq	8(%rax), %rax	 ; token_52(D)->line, _9
 ; D:\TC\src\compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _10
	movq	16(%rbp), %rax	 ; file, tmp135
	movq	%rcx, %r9	 ; _8,
	movq	%rdx, %r8	 ; _10,
	leaq	.LC2(%rip), %rdx	 ;, tmp136
	movq	%rax, %rcx	 ; tmp135,
	call	fprintf	 ;
	jmp	.L11	 ;
.L10:
 ; D:\TC\src\compiler.c:28:     else if (token->type == INTEGER)
	movq	24(%rbp), %rax	 ; token, tmp137
	movl	24(%rax), %eax	 ; token_52(D)->type, _11
 ; D:\TC\src\compiler.c:28:     else if (token->type == INTEGER)
	cmpl	$2, %eax	 ;, _11
	jne	.L12	 ;,
 ; D:\TC\src\compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp138
	movq	16(%rax), %rax	 ; token_52(D)->column, _12
 ; D:\TC\src\compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _13
 ; D:\TC\src\compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp139
	movq	8(%rax), %rax	 ; token_52(D)->line, _14
 ; D:\TC\src\compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _15
	movq	16(%rbp), %rax	 ; file, tmp140
	movq	%rcx, %r9	 ; _13,
	movq	%rdx, %r8	 ; _15,
	leaq	.LC3(%rip), %rdx	 ;, tmp141
	movq	%rax, %rcx	 ; tmp140,
	call	fprintf	 ;
	jmp	.L11	 ;
.L12:
 ; D:\TC\src\compiler.c:30:     else if (token->type == FLOAT)
	movq	24(%rbp), %rax	 ; token, tmp142
	movl	24(%rax), %eax	 ; token_52(D)->type, _16
 ; D:\TC\src\compiler.c:30:     else if (token->type == FLOAT)
	cmpl	$3, %eax	 ;, _16
	jne	.L13	 ;,
 ; D:\TC\src\compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp143
	movq	16(%rax), %rax	 ; token_52(D)->column, _17
 ; D:\TC\src\compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _18
 ; D:\TC\src\compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp144
	movq	8(%rax), %rax	 ; token_52(D)->line, _19
 ; D:\TC\src\compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _20
	movq	16(%rbp), %rax	 ; file, tmp145
	movq	%rcx, %r9	 ; _18,
	movq	%rdx, %r8	 ; _20,
	leaq	.LC4(%rip), %rdx	 ;, tmp146
	movq	%rax, %rcx	 ; tmp145,
	call	fprintf	 ;
	jmp	.L11	 ;
.L13:
 ; D:\TC\src\compiler.c:32:     else if (token->type == STRING)
	movq	24(%rbp), %rax	 ; token, tmp147
	movl	24(%rax), %eax	 ; token_52(D)->type, _21
 ; D:\TC\src\compiler.c:32:     else if (token->type == STRING)
	cmpl	$4, %eax	 ;, _21
	jne	.L14	 ;,
 ; D:\TC\src\compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp148
	movq	16(%rax), %rax	 ; token_52(D)->column, _22
 ; D:\TC\src\compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _23
 ; D:\TC\src\compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp149
	movq	8(%rax), %rax	 ; token_52(D)->line, _24
 ; D:\TC\src\compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _25
	movq	16(%rbp), %rax	 ; file, tmp150
	movq	%rcx, %r9	 ; _23,
	movq	%rdx, %r8	 ; _25,
	leaq	.LC5(%rip), %rdx	 ;, tmp151
	movq	%rax, %rcx	 ; tmp150,
	call	fprintf	 ;
	jmp	.L11	 ;
.L14:
 ; D:\TC\src\compiler.c:34:     else if (token->type == SYMBOL)
	movq	24(%rbp), %rax	 ; token, tmp152
	movl	24(%rax), %eax	 ; token_52(D)->type, _26
 ; D:\TC\src\compiler.c:34:     else if (token->type == SYMBOL)
	cmpl	$5, %eax	 ;, _26
	jne	.L15	 ;,
 ; D:\TC\src\compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp153
	movq	16(%rax), %rax	 ; token_52(D)->column, _27
 ; D:\TC\src\compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _28
 ; D:\TC\src\compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp154
	movq	8(%rax), %rax	 ; token_52(D)->line, _29
 ; D:\TC\src\compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _30
	movq	16(%rbp), %rax	 ; file, tmp155
	movq	%rcx, %r9	 ; _28,
	movq	%rdx, %r8	 ; _30,
	leaq	.LC6(%rip), %rdx	 ;, tmp156
	movq	%rax, %rcx	 ; tmp155,
	call	fprintf	 ;
	jmp	.L11	 ;
.L15:
 ; D:\TC\src\compiler.c:36:     else if (token->type == KEYWORD)
	movq	24(%rbp), %rax	 ; token, tmp157
	movl	24(%rax), %eax	 ; token_52(D)->type, _31
 ; D:\TC\src\compiler.c:36:     else if (token->type == KEYWORD)
	cmpl	$6, %eax	 ;, _31
	jne	.L16	 ;,
 ; D:\TC\src\compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp158
	movq	16(%rax), %rax	 ; token_52(D)->column, _32
 ; D:\TC\src\compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _33
 ; D:\TC\src\compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp159
	movq	8(%rax), %rax	 ; token_52(D)->line, _34
 ; D:\TC\src\compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _35
	movq	16(%rbp), %rax	 ; file, tmp160
	movq	%rcx, %r9	 ; _33,
	movq	%rdx, %r8	 ; _35,
	leaq	.LC7(%rip), %rdx	 ;, tmp161
	movq	%rax, %rcx	 ; tmp160,
	call	fprintf	 ;
	jmp	.L11	 ;
.L16:
 ; D:\TC\src\compiler.c:38:     else if (token->type == COMMENT)
	movq	24(%rbp), %rax	 ; token, tmp162
	movl	24(%rax), %eax	 ; token_52(D)->type, _36
 ; D:\TC\src\compiler.c:38:     else if (token->type == COMMENT)
	cmpl	$7, %eax	 ;, _36
	jne	.L11	 ;,
 ; D:\TC\src\compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp163
	movq	16(%rax), %rax	 ; token_52(D)->column, _37
 ; D:\TC\src\compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	 ;, _38
 ; D:\TC\src\compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	24(%rbp), %rax	 ; token, tmp164
	movq	8(%rax), %rax	 ; token_52(D)->line, _39
 ; D:\TC\src\compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	 ;, _40
	movq	16(%rbp), %rax	 ; file, tmp165
	movq	%rcx, %r9	 ; _38,
	movq	%rdx, %r8	 ; _40,
	leaq	.LC8(%rip), %rdx	 ;, tmp166
	movq	%rax, %rcx	 ; tmp165,
	call	fprintf	 ;
.L11:
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	$0, -8(%rbp)	 ;, i
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	jmp	.L17	 ;
.L23:
 ; D:\TC\src\compiler.c:41:         char c = token->lexeme[i];
	movq	24(%rbp), %rax	 ; token, tmp167
	movq	(%rax), %rdx	 ; token_52(D)->lexeme, _41
 ; D:\TC\src\compiler.c:41:         char c = token->lexeme[i];
	movq	-8(%rbp), %rax	 ; i, tmp168
	addq	%rdx, %rax	 ; _41, _42
 ; D:\TC\src\compiler.c:41:         char c = token->lexeme[i];
	movzbl	(%rax), %eax	 ; *_42, tmp169
	movb	%al, -9(%rbp)	 ; tmp169, c
 ; D:\TC\src\compiler.c:42:         if (c == '\0')
	cmpb	$0, -9(%rbp)	 ;, c
	jne	.L18	 ;,
 ; D:\TC\src\compiler.c:43:             fputs("\\0", file);
	movq	16(%rbp), %rax	 ; file, tmp170
	movq	%rax, %r9	 ; tmp170,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rax	 ;, tmp171
	movq	%rax, %rcx	 ; tmp171,
	call	fwrite	 ;
	jmp	.L19	 ;
.L18:
 ; D:\TC\src\compiler.c:44:         else if (c == '\n')
	cmpb	$10, -9(%rbp)	 ;, c
	jne	.L20	 ;,
 ; D:\TC\src\compiler.c:45:             fputs("\\n", file);
	movq	16(%rbp), %rax	 ; file, tmp172
	movq	%rax, %r9	 ; tmp172,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	fwrite	 ;
	jmp	.L19	 ;
.L20:
 ; D:\TC\src\compiler.c:46:         else if (c == '\t')
	cmpb	$9, -9(%rbp)	 ;, c
	jne	.L21	 ;,
 ; D:\TC\src\compiler.c:47:             fputs("\\t", file);
	movq	16(%rbp), %rax	 ; file, tmp174
	movq	%rax, %r9	 ; tmp174,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	fwrite	 ;
	jmp	.L19	 ;
.L21:
 ; D:\TC\src\compiler.c:48:         else if (c == '\r')
	cmpb	$13, -9(%rbp)	 ;, c
	jne	.L22	 ;,
 ; D:\TC\src\compiler.c:49:             fputs("\\r", file);
	movq	16(%rbp), %rax	 ; file, tmp176
	movq	%rax, %r9	 ; tmp176,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	fwrite	 ;
	jmp	.L19	 ;
.L22:
 ; D:\TC\src\compiler.c:51:             fputc(c, file);
	movsbl	-9(%rbp), %eax	 ; c, _43
	movq	16(%rbp), %rdx	 ; file, tmp178
	movl	%eax, %ecx	 ; _43,
	call	fputc	 ;
.L19:
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, -8(%rbp)	 ;, i
.L17:
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	24(%rbp), %rax	 ; token, tmp179
	movq	(%rax), %rax	 ; token_52(D)->lexeme, _44
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%rax, %rcx	 ; _44,
	call	strlen	 ;
 ; D:\TC\src\compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, -8(%rbp)	 ; _45, i
	jb	.L23	 ;,
 ; D:\TC\src\compiler.c:53:     fprintf(file, "'\n");
	movq	16(%rbp), %rax	 ; file, tmp180
	movq	%rax, %r9	 ; tmp180,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rax	 ;, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	fwrite	 ;
.L7:
 ; D:\TC\src\compiler.c:54: }
	leave	
	ret	
	.section .rdata,"dr"
.LC14:
	.ascii "\12info by lib:\12    %s\12\0"
	.text
	.globl	output_token
	.def	output_token;	.scl	2;	.type	32;	.endef
output_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; lexer, lexer
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	24(%rbp), %rax	 ; lexer, tmp84
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp84,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, current
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	jmp	.L25	 ;
.L28:
 ; D:\TC\src\compiler.c:57:         output_one_token(file, current);
	movq	-8(%rbp), %rdx	 ; current, tmp86
	movq	16(%rbp), %rax	 ; file, tmp87
	movq	%rax, %rcx	 ; tmp87,
	call	output_one_token	 ;
 ; D:\TC\src\compiler.c:58:         if (current->type == EOF_TOKEN)
	movq	-8(%rbp), %rax	 ; current, tmp88
	movl	24(%rax), %eax	 ; current_3->type, _1
 ; D:\TC\src\compiler.c:58:         if (current->type == EOF_TOKEN)
	testl	%eax, %eax	 ; _1
	je	.L29	 ;,
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	24(%rbp), %rax	 ; lexer, tmp89
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp89,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp90, current
.L25:
 ; D:\TC\src\compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L28	 ;,
	jmp	.L27	 ;
.L29:
 ; D:\TC\src\compiler.c:59:             break;
	nop	
.L27:
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %rdx	 ;, _2
 ; D:\TC\src\compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	16(%rbp), %rax	 ; file, tmp91
	movq	%rdx, %r8	 ; _2,
	leaq	.LC14(%rip), %rdx	 ;, tmp92
	movq	%rax, %rcx	 ; tmp91,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:62: }
	nop	
	leave	
	ret	
	.globl	output_ast
	.def	output_ast;	.scl	2;	.type	32;	.endef
output_ast:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; lexer, lexer
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp84
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.0_1
	movq	32(%rbp), %rcx	 ; parser, tmp85
	movq	24(%rbp), %rax	 ; lexer, tmp86
	movq	%rcx, %r8	 ; tmp85,
	movq	%rax, %rcx	 ; tmp86,
	call	parse_code	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, ast_root
 ; D:\TC\src\compiler.c:65:     output_code(ast_root, file, 0, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp88
	movq	16(%rbp), %rdx	 ; file, tmp89
	movq	-8(%rbp), %rax	 ; ast_root, tmp90
	movq	%rcx, %r9	 ; tmp88,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	output_code	 ;
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %rdx	 ;, _2
 ; D:\TC\src\compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	16(%rbp), %rax	 ; file, tmp91
	movq	%rdx, %r8	 ; _2,
	leaq	.LC14(%rip), %rdx	 ;, tmp92
	movq	%rax, %rcx	 ; tmp91,
	call	fprintf	 ;
 ; D:\TC\src\compiler.c:67: }
	nop	
	leave	
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
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	addq	$-128, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
	movl	%edx, %eax	 ; o_token, tmp92
	movl	%r8d, %edx	 ; o_ast, tmp94
	movb	%al, 24(%rbp)	 ; tmp93, o_token
	movl	%edx, %eax	 ; tmp94, tmp95
	movb	%al, 32(%rbp)	 ; tmp95, o_ast
 ; D:\TC\src\compiler.c:69:     File* file = create_file(name);
	movq	16(%rbp), %rax	 ; name, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	create_file	 ;
	movq	%rax, -8(%rbp)	 ; tmp97, file
 ; D:\TC\src\compiler.c:70:     string filename = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	get_full_path	 ;
	movq	%rax, -16(%rbp)	 ; tmp99, filename
 ; D:\TC\src\compiler.c:71:     size_t length = 0;
	movq	$0, -88(%rbp)	 ;, length
 ; D:\TC\src\compiler.c:72:     FILE* source_file = fopen(filename, "r");
	movq	-16(%rbp), %rax	 ; filename, tmp100
	leaq	.LC15(%rip), %rdx	 ;, tmp101
	movq	%rax, %rcx	 ; tmp100,
	call	fopen	 ;
	movq	%rax, -24(%rbp)	 ; tmp102, source_file
 ; D:\TC\src\compiler.c:73:     if (source_file == NULL) {
	cmpq	$0, -24(%rbp)	 ;, source_file
	jne	.L32	 ;,
 ; D:\TC\src\compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	movq	-16(%rbp), %rdx	 ; filename, tmp103
	movq	%rdx, %r8	 ; tmp103,
	leaq	.LC16(%rip), %rdx	 ;, tmp104
	movq	%rax, %rcx	 ; _2,
	call	fprintf	 ;
	jmp	.L31	 ;
.L32:
 ; D:\TC\src\compiler.c:77:     string source = read_source(source_file, &length);
	leaq	-88(%rbp), %rdx	 ;, tmp105
	movq	-24(%rbp), %rax	 ; source_file, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	read_source	 ;
	movq	%rax, -32(%rbp)	 ; tmp107, source
 ; D:\TC\src\compiler.c:78:     fclose(source_file);
	movq	-24(%rbp), %rax	 ; source_file, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	fclose	 ;
 ; D:\TC\src\compiler.c:79:     Lexer* lexer = create_lexer(source, length);
	movq	-88(%rbp), %rdx	 ; length, length.1_3
	movq	-32(%rbp), %rax	 ; source, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	create_lexer	 ;
	movq	%rax, -40(%rbp)	 ; tmp110, lexer
 ; D:\TC\src\compiler.c:80:     if (o_token) {
	cmpb	$0, 24(%rbp)	 ;, o_token
	je	.L34	 ;,
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _4
 ; D:\TC\src\compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movq	-8(%rbp), %rax	 ; file, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:82:         string out_token_name = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	get_full_path	 ;
	movq	%rax, -48(%rbp)	 ; tmp114, out_token_name
 ; D:\TC\src\compiler.c:83:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	-48(%rbp), %rax	 ; out_token_name, tmp115
	leaq	.LC18(%rip), %rdx	 ;, tmp116
	movq	%rax, %rcx	 ; tmp115,
	call	fopen	 ;
	movq	%rax, -56(%rbp)	 ; tmp117, out_token_file
 ; D:\TC\src\compiler.c:84:         if (out_token_file == NULL)
	cmpq	$0, -56(%rbp)	 ;, out_token_file
	jne	.L35	 ;,
 ; D:\TC\src\compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	-48(%rbp), %rdx	 ; out_token_name, tmp118
	movq	%rdx, %r8	 ; tmp118,
	leaq	.LC19(%rip), %rdx	 ;, tmp119
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
	jmp	.L34	 ;
.L35:
 ; D:\TC\src\compiler.c:87:             output_token(out_token_file, lexer);
	movq	-40(%rbp), %rdx	 ; lexer, tmp120
	movq	-56(%rbp), %rax	 ; out_token_file, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	output_token	 ;
 ; D:\TC\src\compiler.c:88:             fclose(out_token_file);
	movq	-56(%rbp), %rax	 ; out_token_file, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	fclose	 ;
.L34:
 ; D:\TC\src\compiler.c:91:     reset_lexer(lexer);
	movq	-40(%rbp), %rax	 ; lexer, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	reset_lexer	 ;
 ; D:\TC\src\compiler.c:92:     Parser* parser = create_parser(file);
	movq	-8(%rbp), %rax	 ; file, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	create_parser	 ;
	movq	%rax, -64(%rbp)	 ; tmp125, parser
 ; D:\TC\src\compiler.c:93:     if (o_ast) {
	cmpb	$0, 32(%rbp)	 ;, o_ast
	je	.L31	 ;,
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %edx	 ;,
	leaq	.LC20(%rip), %rax	 ;, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:\TC\src\compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movq	-8(%rbp), %rax	 ; file, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:95:         string out_ast_name = get_full_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	get_full_path	 ;
	movq	%rax, -72(%rbp)	 ; tmp129, out_ast_name
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %edx	 ;,
	leaq	.LC21(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:\TC\src\compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movq	-8(%rbp), %rax	 ; file, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	change_file_extension	 ;
 ; D:\TC\src\compiler.c:97:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	-72(%rbp), %rax	 ; out_ast_name, tmp132
	leaq	.LC18(%rip), %rdx	 ;, tmp133
	movq	%rax, %rcx	 ; tmp132,
	call	fopen	 ;
	movq	%rax, -80(%rbp)	 ; tmp134, out_ast_file
 ; D:\TC\src\compiler.c:98:         if (out_ast_file == NULL)
	cmpq	$0, -80(%rbp)	 ;, out_ast_file
	jne	.L37	 ;,
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	__getreent	 ;
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	24(%rax), %rax	 ; _9->_stderr, _10
 ; D:\TC\src\compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	-72(%rbp), %rdx	 ; out_ast_name, tmp135
	movq	%rdx, %r8	 ; tmp135,
	leaq	.LC19(%rip), %rdx	 ;, tmp136
	movq	%rax, %rcx	 ; _10,
	call	fprintf	 ;
	jmp	.L31	 ;
.L37:
 ; D:\TC\src\compiler.c:101:             output_ast(out_ast_file, lexer, parser);
	movq	-64(%rbp), %rcx	 ; parser, tmp137
	movq	-40(%rbp), %rdx	 ; lexer, tmp138
	movq	-80(%rbp), %rax	 ; out_ast_file, tmp139
	movq	%rcx, %r8	 ; tmp137,
	movq	%rax, %rcx	 ; tmp139,
	call	output_ast	 ;
 ; D:\TC\src\compiler.c:102:             fclose(out_ast_file);
	movq	-80(%rbp), %rax	 ; out_ast_file, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	fclose	 ;
.L31:
 ; D:\TC\src\compiler.c:105: }
	leave	
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
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

	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata
.LC0:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; file, file
	movq	%rsi, -48(%rbp)	; length, length
; src/compiler.c:7:     fseek(file, 0, SEEK_END);
	movq	-40(%rbp), %rax	; file, tmp96
	movl	$2, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp96,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:8:     *length = (size_t)ftell(file);
	movq	-40(%rbp), %rax	; file, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:8:     *length = (size_t)ftell(file);
	movq	%rax, %rdx	; _1, _2
; src/compiler.c:8:     *length = (size_t)ftell(file);
	movq	-48(%rbp), %rax	; length, tmp98
	movq	%rdx, (%rax)	; _2, *length_20(D)
; src/compiler.c:9:     fseek(file, 0, SEEK_SET);
	movq	-40(%rbp), %rax	; file, tmp99
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp99,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:11:     string source = create_string_not_check("", *length + 1);
	movq	-48(%rbp), %rax	; length, tmp100
	movq	(%rax), %rax	; *length_20(D), _3
; src/compiler.c:11:     string source = create_string_not_check("", *length + 1);
	addq	$1, %rax	;, _4
	movq	%rax, %rsi	; _4,
	leaq	.LC0(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, source
; src/compiler.c:12:     size_t bytes_read = fread(source, 1, *length, file);
	movq	-48(%rbp), %rax	; length, tmp103
	movq	(%rax), %rdx	; *length_20(D), _5
	movq	-40(%rbp), %rcx	; file, tmp104
	movq	-16(%rbp), %rax	; source, tmp105
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp105,
	call	*fread@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp106, bytes_read
; src/compiler.c:13:     source[bytes_read] = '\0';
	movq	-16(%rbp), %rdx	; source, tmp107
	movq	-24(%rbp), %rax	; bytes_read, tmp108
	addq	%rdx, %rax	; tmp107, _6
; src/compiler.c:13:     source[bytes_read] = '\0';
	movb	$0, (%rax)	;, *_6
; src/compiler.c:14:     *length = bytes_read;
	movq	-48(%rbp), %rax	; length, tmp109
	movq	-24(%rbp), %rdx	; bytes_read, tmp110
	movq	%rdx, (%rax)	; tmp110, *length_20(D)
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	movq	$0, -8(%rbp)	;, i
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	jmp	.L2	;
.L5:
; src/compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	; source, tmp111
	movq	-8(%rbp), %rax	; i, tmp112
	addq	%rdx, %rax	; tmp111, _7
	movzbl	(%rax), %eax	; *_7, _8
; src/compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$13, %al	;, _8
	je	.L3	;,
; src/compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	; source, tmp113
	movq	-8(%rbp), %rax	; i, tmp114
	addq	%rdx, %rax	; tmp113, _9
	movzbl	(%rax), %eax	; *_9, _10
; src/compiler.c:17:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %al	;, _10
	jne	.L4	;,
.L3:
; src/compiler.c:18:             source[i] = ' ';
	movq	-16(%rbp), %rdx	; source, tmp115
	movq	-8(%rbp), %rax	; i, tmp116
	addq	%rdx, %rax	; tmp115, _11
; src/compiler.c:18:             source[i] = ' ';
	movb	$32, (%rax)	;, *_11
.L4:
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, -8(%rbp)	;, i
.L2:
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	movq	-48(%rbp), %rax	; length, tmp117
	movq	(%rax), %rax	; *length_20(D), _12
; src/compiler.c:16:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rax, -8(%rbp)	; _12, i
	jb	.L5	;,
; src/compiler.c:20:     return source;
	movq	-16(%rbp), %rax	; source, _30
; src/compiler.c:21: }
	leave	
	ret	
	.size	read_source, .-read_source
	.section	.rodata
	.align 8
.LC1:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
	.align 8
.LC2:
	.string	"Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC3:
	.string	"Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC4:
	.string	"Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC5:
	.string	"Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC6:
	.string	"Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC7:
	.string	"Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '"
	.align 8
.LC8:
	.string	"Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '"
.LC9:
	.string	"\\0"
.LC10:
	.string	"\\n"
.LC11:
	.string	"\\t"
.LC12:
	.string	"\\r"
.LC13:
	.string	"'\n"
	.text
	.globl	output_one_token
	.type	output_one_token, @function
output_one_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; file, file
	movq	%rsi, -32(%rbp)	; token, token
; src/compiler.c:23:     if (token->type == EOF_TOKEN) {
	movq	-32(%rbp), %rax	; token, tmp127
	movl	24(%rax), %eax	; token_52(D)->type, _1
; src/compiler.c:23:     if (token->type == EOF_TOKEN) {
	testl	%eax, %eax	; _1
	jne	.L8	;,
; src/compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp128
	movq	16(%rax), %rax	; token_52(D)->column, _2
; src/compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _3
; src/compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp129
	movq	8(%rax), %rax	; token_52(D)->line, _4
; src/compiler.c:24:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _5
	movq	-24(%rbp), %rax	; file, tmp130
	leaq	.LC1(%rip), %rsi	;, tmp131
	movq	%rax, %rdi	; tmp130,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:25:         return;
	jmp	.L7	;
.L8:
; src/compiler.c:26:     } else if (token->type == IDENTIFIER)
	movq	-32(%rbp), %rax	; token, tmp132
	movl	24(%rax), %eax	; token_52(D)->type, _6
; src/compiler.c:26:     } else if (token->type == IDENTIFIER)
	cmpl	$1, %eax	;, _6
	jne	.L10	;,
; src/compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp133
	movq	16(%rax), %rax	; token_52(D)->column, _7
; src/compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _8
; src/compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp134
	movq	8(%rax), %rax	; token_52(D)->line, _9
; src/compiler.c:27:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _10
	movq	-24(%rbp), %rax	; file, tmp135
	leaq	.LC2(%rip), %rsi	;, tmp136
	movq	%rax, %rdi	; tmp135,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L10:
; src/compiler.c:28:     else if (token->type == INTEGER)
	movq	-32(%rbp), %rax	; token, tmp137
	movl	24(%rax), %eax	; token_52(D)->type, _11
; src/compiler.c:28:     else if (token->type == INTEGER)
	cmpl	$2, %eax	;, _11
	jne	.L12	;,
; src/compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp138
	movq	16(%rax), %rax	; token_52(D)->column, _12
; src/compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _13
; src/compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp139
	movq	8(%rax), %rax	; token_52(D)->line, _14
; src/compiler.c:29:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _15
	movq	-24(%rbp), %rax	; file, tmp140
	leaq	.LC3(%rip), %rsi	;, tmp141
	movq	%rax, %rdi	; tmp140,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L12:
; src/compiler.c:30:     else if (token->type == FLOAT)
	movq	-32(%rbp), %rax	; token, tmp142
	movl	24(%rax), %eax	; token_52(D)->type, _16
; src/compiler.c:30:     else if (token->type == FLOAT)
	cmpl	$3, %eax	;, _16
	jne	.L13	;,
; src/compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp143
	movq	16(%rax), %rax	; token_52(D)->column, _17
; src/compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _18
; src/compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp144
	movq	8(%rax), %rax	; token_52(D)->line, _19
; src/compiler.c:31:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _20
	movq	-24(%rbp), %rax	; file, tmp145
	leaq	.LC4(%rip), %rsi	;, tmp146
	movq	%rax, %rdi	; tmp145,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L13:
; src/compiler.c:32:     else if (token->type == STRING)
	movq	-32(%rbp), %rax	; token, tmp147
	movl	24(%rax), %eax	; token_52(D)->type, _21
; src/compiler.c:32:     else if (token->type == STRING)
	cmpl	$4, %eax	;, _21
	jne	.L14	;,
; src/compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp148
	movq	16(%rax), %rax	; token_52(D)->column, _22
; src/compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _23
; src/compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp149
	movq	8(%rax), %rax	; token_52(D)->line, _24
; src/compiler.c:33:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _25
	movq	-24(%rbp), %rax	; file, tmp150
	leaq	.LC5(%rip), %rsi	;, tmp151
	movq	%rax, %rdi	; tmp150,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L14:
; src/compiler.c:34:     else if (token->type == SYMBOL)
	movq	-32(%rbp), %rax	; token, tmp152
	movl	24(%rax), %eax	; token_52(D)->type, _26
; src/compiler.c:34:     else if (token->type == SYMBOL)
	cmpl	$5, %eax	;, _26
	jne	.L15	;,
; src/compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp153
	movq	16(%rax), %rax	; token_52(D)->column, _27
; src/compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _28
; src/compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp154
	movq	8(%rax), %rax	; token_52(D)->line, _29
; src/compiler.c:35:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _30
	movq	-24(%rbp), %rax	; file, tmp155
	leaq	.LC6(%rip), %rsi	;, tmp156
	movq	%rax, %rdi	; tmp155,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L15:
; src/compiler.c:36:     else if (token->type == KEYWORD)
	movq	-32(%rbp), %rax	; token, tmp157
	movl	24(%rax), %eax	; token_52(D)->type, _31
; src/compiler.c:36:     else if (token->type == KEYWORD)
	cmpl	$6, %eax	;, _31
	jne	.L16	;,
; src/compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp158
	movq	16(%rax), %rax	; token_52(D)->column, _32
; src/compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _33
; src/compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp159
	movq	8(%rax), %rax	; token_52(D)->line, _34
; src/compiler.c:37:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _35
	movq	-24(%rbp), %rax	; file, tmp160
	leaq	.LC7(%rip), %rsi	;, tmp161
	movq	%rax, %rdi	; tmp160,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L16:
; src/compiler.c:38:     else if (token->type == COMMENT)
	movq	-32(%rbp), %rax	; token, tmp162
	movl	24(%rax), %eax	; token_52(D)->type, _36
; src/compiler.c:38:     else if (token->type == COMMENT)
	cmpl	$7, %eax	;, _36
	jne	.L11	;,
; src/compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp163
	movq	16(%rax), %rax	; token_52(D)->column, _37
; src/compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _38
; src/compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp164
	movq	8(%rax), %rax	; token_52(D)->line, _39
; src/compiler.c:39:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _40
	movq	-24(%rbp), %rax	; file, tmp165
	leaq	.LC8(%rip), %rsi	;, tmp166
	movq	%rax, %rdi	; tmp165,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L11:
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	$0, -8(%rbp)	;, i
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	jmp	.L17	;
.L23:
; src/compiler.c:41:         char c = token->lexeme[i];
	movq	-32(%rbp), %rax	; token, tmp167
	movq	(%rax), %rdx	; token_52(D)->lexeme, _41
; src/compiler.c:41:         char c = token->lexeme[i];
	movq	-8(%rbp), %rax	; i, tmp168
	addq	%rdx, %rax	; _41, _42
; src/compiler.c:41:         char c = token->lexeme[i];
	movzbl	(%rax), %eax	; *_42, tmp169
	movb	%al, -9(%rbp)	; tmp169, c
; src/compiler.c:42:         if (c == '\0')
	cmpb	$0, -9(%rbp)	;, c
	jne	.L18	;,
; src/compiler.c:43:             fputs("\\0", file);
	movq	-24(%rbp), %rax	; file, tmp170
	movq	%rax, %rcx	; tmp170,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rax	;, tmp171
	movq	%rax, %rdi	; tmp171,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L18:
; src/compiler.c:44:         else if (c == '\n')
	cmpb	$10, -9(%rbp)	;, c
	jne	.L20	;,
; src/compiler.c:45:             fputs("\\n", file);
	movq	-24(%rbp), %rax	; file, tmp172
	movq	%rax, %rcx	; tmp172,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp173
	movq	%rax, %rdi	; tmp173,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L20:
; src/compiler.c:46:         else if (c == '\t')
	cmpb	$9, -9(%rbp)	;, c
	jne	.L21	;,
; src/compiler.c:47:             fputs("\\t", file);
	movq	-24(%rbp), %rax	; file, tmp174
	movq	%rax, %rcx	; tmp174,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L21:
; src/compiler.c:48:         else if (c == '\r')
	cmpb	$13, -9(%rbp)	;, c
	jne	.L22	;,
; src/compiler.c:49:             fputs("\\r", file);
	movq	-24(%rbp), %rax	; file, tmp176
	movq	%rax, %rcx	; tmp176,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp177
	movq	%rax, %rdi	; tmp177,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L22:
; src/compiler.c:51:             fputc(c, file);
	movsbl	-9(%rbp), %eax	; c, _43
	movq	-24(%rbp), %rdx	; file, tmp178
	movq	%rdx, %rsi	; tmp178,
	movl	%eax, %edi	; _43,
	call	*fputc@GOTPCREL(%rip)	;
.L19:
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, -8(%rbp)	;, i
.L17:
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	-32(%rbp), %rax	; token, tmp179
	movq	(%rax), %rax	; token_52(D)->lexeme, _44
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%rax, %rdi	; _44,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:40:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, -8(%rbp)	; _45, i
	jb	.L23	;,
; src/compiler.c:53:     fprintf(file, "'\n");
	movq	-24(%rbp), %rax	; file, tmp180
	movq	%rax, %rcx	; tmp180,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rax	;, tmp181
	movq	%rax, %rdi	; tmp181,
	call	*fwrite@GOTPCREL(%rip)	;
.L7:
; src/compiler.c:54: }
	leave	
	ret	
	.size	output_one_token, .-output_one_token
	.section	.rodata
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; file, file
	movq	%rsi, -32(%rbp)	; lexer, lexer
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	-32(%rbp), %rax	; lexer, tmp84
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp84,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, current
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	jmp	.L25	;
.L28:
; src/compiler.c:57:         output_one_token(file, current);
	movq	-8(%rbp), %rdx	; current, tmp86
	movq	-24(%rbp), %rax	; file, tmp87
	movq	%rdx, %rsi	; tmp86,
	movq	%rax, %rdi	; tmp87,
	call	output_one_token	;
; src/compiler.c:58:         if (current->type == EOF_TOKEN)
	movq	-8(%rbp), %rax	; current, tmp88
	movl	24(%rax), %eax	; current_3->type, _1
; src/compiler.c:58:         if (current->type == EOF_TOKEN)
	testl	%eax, %eax	; _1
	je	.L29	;,
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	-32(%rbp), %rax	; lexer, tmp89
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp89,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp90, current
.L25:
; src/compiler.c:56:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L28	;,
	jmp	.L27	;
.L29:
; src/compiler.c:59:             break;
	nop	
.L27:
; src/compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _2
; src/compiler.c:61:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	-24(%rbp), %rax	; file, tmp91
	leaq	.LC14(%rip), %rcx	;, tmp92
	movq	%rcx, %rsi	; tmp92,
	movq	%rax, %rdi	; tmp91,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:62: }
	nop	
	leave	
	ret	
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; file, file
	movq	%rsi, -32(%rbp)	; lexer, lexer
	movq	%rdx, -40(%rbp)	; parser, parser
; src/compiler.c:64:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rcx	; builtin_scope, builtin_scope.0_1
	movq	-40(%rbp), %rdx	; parser, tmp84
	movq	-32(%rbp), %rax	; lexer, tmp85
	movq	%rcx, %rsi	; builtin_scope.0_1,
	movq	%rax, %rdi	; tmp85,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, ast_root
; src/compiler.c:65:     output_code(ast_root, file, 0, parser);
	movq	-40(%rbp), %rdx	; parser, tmp87
	movq	-24(%rbp), %rsi	; file, tmp88
	movq	-8(%rbp), %rax	; ast_root, tmp89
	movq	%rdx, %rcx	; tmp87,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp89,
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _2
; src/compiler.c:66:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	-24(%rbp), %rax	; file, tmp90
	leaq	.LC14(%rip), %rcx	;, tmp91
	movq	%rcx, %rsi	; tmp91,
	movq	%rax, %rdi	; tmp90,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:67: }
	nop	
	leave	
	ret	
	.size	output_ast, .-output_ast
	.section	.rodata
.LC15:
	.string	"r"
.LC16:
	.string	"Error opening file: %s"
.LC17:
	.string	".token"
.LC18:
	.string	"w"
.LC19:
	.string	"Error opening file: %s\n"
.LC20:
	.string	".ast"
.LC21:
	.string	".tc"
	.text
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$112, %rsp	;,
	movq	%rdi, -104(%rbp)	; name, name
	movl	%esi, %ecx	; o_token, tmp89
	movl	%edx, %eax	; o_ast, tmp91
	movl	%ecx, %edx	; tmp89, tmp90
	movb	%dl, -108(%rbp)	; tmp90, o_token
	movb	%al, -112(%rbp)	; tmp92, o_ast
; src/compiler.c:69:     File* file = create_file(name);
	movq	-104(%rbp), %rax	; name, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*create_file@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp94, file
; src/compiler.c:70:     string filename = get_full_path(file);
	movq	-8(%rbp), %rax	; file, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp96, filename
; src/compiler.c:71:     size_t length = 0;
	movq	$0, -88(%rbp)	;, length
; src/compiler.c:72:     FILE* source_file = fopen(filename, "r");
	movq	-16(%rbp), %rax	; filename, tmp97
	leaq	.LC15(%rip), %rdx	;, tmp98
	movq	%rdx, %rsi	; tmp98,
	movq	%rax, %rdi	; tmp97,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp99, source_file
; src/compiler.c:73:     if (source_file == NULL) {
	cmpq	$0, -24(%rbp)	;, source_file
	jne	.L32	;,
; src/compiler.c:74:         fprintf(stderr, "Error opening file: %s", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.1_1
	movq	-16(%rbp), %rdx	; filename, tmp100
	leaq	.LC16(%rip), %rcx	;, tmp101
	movq	%rcx, %rsi	; tmp101,
	movq	%rax, %rdi	; stderr.1_1,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L31	;
.L32:
; src/compiler.c:77:     string source = read_source(source_file, &length);
	leaq	-88(%rbp), %rdx	;, tmp102
	movq	-24(%rbp), %rax	; source_file, tmp103
	movq	%rdx, %rsi	; tmp102,
	movq	%rax, %rdi	; tmp103,
	call	read_source	;
	movq	%rax, -32(%rbp)	; tmp104, source
; src/compiler.c:78:     fclose(source_file);
	movq	-24(%rbp), %rax	; source_file, tmp105
	movq	%rax, %rdi	; tmp105,
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:79:     Lexer* lexer = create_lexer(source, length);
	movq	-88(%rbp), %rdx	; length, length.2_2
	movq	-32(%rbp), %rax	; source, tmp106
	movq	%rdx, %rsi	; length.2_2,
	movq	%rax, %rdi	; tmp106,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp107, lexer
; src/compiler.c:80:     if (o_token) {
	cmpb	$0, -108(%rbp)	;, o_token
	je	.L34	;,
; src/compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp108
	movq	%rax, %rdi	; tmp108,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _3
; src/compiler.c:81:         change_file_extension(file, create_string(".token", 6));
	movq	-8(%rbp), %rax	; file, tmp109
	movq	%rdx, %rsi	; _3,
	movq	%rax, %rdi	; tmp109,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:82:         string out_token_name = get_full_path(file);
	movq	-8(%rbp), %rax	; file, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp111, out_token_name
; src/compiler.c:83:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	-48(%rbp), %rax	; out_token_name, tmp112
	leaq	.LC18(%rip), %rdx	;, tmp113
	movq	%rdx, %rsi	; tmp113,
	movq	%rax, %rdi	; tmp112,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp114, out_token_file
; src/compiler.c:84:         if (out_token_file == NULL)
	cmpq	$0, -56(%rbp)	;, out_token_file
	jne	.L35	;,
; src/compiler.c:85:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	stderr(%rip), %rax	; stderr, stderr.3_4
	movq	-48(%rbp), %rdx	; out_token_name, tmp115
	leaq	.LC19(%rip), %rcx	;, tmp116
	movq	%rcx, %rsi	; tmp116,
	movq	%rax, %rdi	; stderr.3_4,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L34	;
.L35:
; src/compiler.c:87:             output_token(out_token_file, lexer);
	movq	-40(%rbp), %rdx	; lexer, tmp117
	movq	-56(%rbp), %rax	; out_token_file, tmp118
	movq	%rdx, %rsi	; tmp117,
	movq	%rax, %rdi	; tmp118,
	call	output_token	;
; src/compiler.c:88:             fclose(out_token_file);
	movq	-56(%rbp), %rax	; out_token_file, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*fclose@GOTPCREL(%rip)	;
.L34:
; src/compiler.c:91:     reset_lexer(lexer);
	movq	-40(%rbp), %rax	; lexer, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:92:     Parser* parser = create_parser(file);
	movq	-8(%rbp), %rax	; file, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*create_parser@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp122, parser
; src/compiler.c:93:     if (o_ast) {
	cmpb	$0, -112(%rbp)	;, o_ast
	je	.L31	;,
; src/compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC20(%rip), %rax	;, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _5
; src/compiler.c:94:         change_file_extension(file, create_string(".ast", 4));
	movq	-8(%rbp), %rax	; file, tmp124
	movq	%rdx, %rsi	; _5,
	movq	%rax, %rdi	; tmp124,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:95:         string out_ast_name = get_full_path(file);
	movq	-8(%rbp), %rax	; file, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -72(%rbp)	; tmp126, out_ast_name
; src/compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp127
	movq	%rax, %rdi	; tmp127,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _6
; src/compiler.c:96:         change_file_extension(file, create_string(".tc", 3));
	movq	-8(%rbp), %rax	; file, tmp128
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; tmp128,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:97:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	-72(%rbp), %rax	; out_ast_name, tmp129
	leaq	.LC18(%rip), %rdx	;, tmp130
	movq	%rdx, %rsi	; tmp130,
	movq	%rax, %rdi	; tmp129,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp131, out_ast_file
; src/compiler.c:98:         if (out_ast_file == NULL)
	cmpq	$0, -80(%rbp)	;, out_ast_file
	jne	.L37	;,
; src/compiler.c:99:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	stderr(%rip), %rax	; stderr, stderr.4_7
	movq	-72(%rbp), %rdx	; out_ast_name, tmp132
	leaq	.LC19(%rip), %rcx	;, tmp133
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; stderr.4_7,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L31	;
.L37:
; src/compiler.c:101:             output_ast(out_ast_file, lexer, parser);
	movq	-64(%rbp), %rdx	; parser, tmp134
	movq	-40(%rbp), %rcx	; lexer, tmp135
	movq	-80(%rbp), %rax	; out_ast_file, tmp136
	movq	%rcx, %rsi	; tmp135,
	movq	%rax, %rdi	; tmp136,
	call	output_ast	;
; src/compiler.c:102:             fclose(out_ast_file);
	movq	-80(%rbp), %rax	; out_ast_file, tmp137
	movq	%rax, %rdi	; tmp137,
	call	*fclose@GOTPCREL(%rip)	;
.L31:
; src/compiler.c:105: }
	leave	
	ret	
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

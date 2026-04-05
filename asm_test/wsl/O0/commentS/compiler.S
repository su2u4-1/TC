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
; src/compiler.c:8:     fseek(file, 0, SEEK_END);
	movq	-40(%rbp), %rax	; file, tmp96
	movl	$2, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp96,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	-40(%rbp), %rax	; file, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	%rax, %rdx	; _1, _2
; src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	-48(%rbp), %rax	; length, tmp98
	movq	%rdx, (%rax)	; _2, *length_20(D)
; src/compiler.c:10:     fseek(file, 0, SEEK_SET);
	movq	-40(%rbp), %rax	; file, tmp99
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp99,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	-48(%rbp), %rax	; length, tmp100
	movq	(%rax), %rax	; *length_20(D), _3
; src/compiler.c:12:     string source = create_string_not_check("", *length + 1);
	addq	$1, %rax	;, _4
	movq	%rax, %rsi	; _4,
	leaq	.LC0(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, source
; src/compiler.c:13:     size_t bytes_read = fread(source, 1, *length, file);
	movq	-48(%rbp), %rax	; length, tmp103
	movq	(%rax), %rdx	; *length_20(D), _5
	movq	-40(%rbp), %rcx	; file, tmp104
	movq	-16(%rbp), %rax	; source, tmp105
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp105,
	call	*fread@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp106, bytes_read
; src/compiler.c:14:     source[bytes_read] = '\0';
	movq	-16(%rbp), %rdx	; source, tmp107
	movq	-24(%rbp), %rax	; bytes_read, tmp108
	addq	%rdx, %rax	; tmp107, _6
; src/compiler.c:14:     source[bytes_read] = '\0';
	movb	$0, (%rax)	;, *_6
; src/compiler.c:15:     *length = bytes_read;
	movq	-48(%rbp), %rax	; length, tmp109
	movq	-24(%rbp), %rdx	; bytes_read, tmp110
	movq	%rdx, (%rax)	; tmp110, *length_20(D)
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	movq	$0, -8(%rbp)	;, i
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	jmp	.L2	;
.L5:
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	; source, tmp111
	movq	-8(%rbp), %rax	; i, tmp112
	addq	%rdx, %rax	; tmp111, _7
	movzbl	(%rax), %eax	; *_7, _8
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$13, %al	;, _8
	je	.L3	;,
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	; source, tmp113
	movq	-8(%rbp), %rax	; i, tmp114
	addq	%rdx, %rax	; tmp113, _9
	movzbl	(%rax), %eax	; *_9, _10
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %al	;, _10
	jne	.L4	;,
.L3:
; src/compiler.c:19:             source[i] = ' ';
	movq	-16(%rbp), %rdx	; source, tmp115
	movq	-8(%rbp), %rax	; i, tmp116
	addq	%rdx, %rax	; tmp115, _11
; src/compiler.c:19:             source[i] = ' ';
	movb	$32, (%rax)	;, *_11
.L4:
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, -8(%rbp)	;, i
.L2:
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	movq	-48(%rbp), %rax	; length, tmp117
	movq	(%rax), %rax	; *length_20(D), _12
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rax, -8(%rbp)	; _12, i
	jb	.L5	;,
; src/compiler.c:21:     return source;
	movq	-16(%rbp), %rax	; source, _30
; src/compiler.c:22: }
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
; src/compiler.c:24:     if (token->type == EOF_TOKEN) {
	movq	-32(%rbp), %rax	; token, tmp127
	movl	24(%rax), %eax	; token_52(D)->type, _1
; src/compiler.c:24:     if (token->type == EOF_TOKEN) {
	testl	%eax, %eax	; _1
	jne	.L8	;,
; src/compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp128
	movq	16(%rax), %rax	; token_52(D)->column, _2
; src/compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _3
; src/compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp129
	movq	8(%rax), %rax	; token_52(D)->line, _4
; src/compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _5
	movq	-24(%rbp), %rax	; file, tmp130
	leaq	.LC1(%rip), %rsi	;, tmp131
	movq	%rax, %rdi	; tmp130,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:26:         return;
	jmp	.L7	;
.L8:
; src/compiler.c:27:     } else if (token->type == IDENTIFIER)
	movq	-32(%rbp), %rax	; token, tmp132
	movl	24(%rax), %eax	; token_52(D)->type, _6
; src/compiler.c:27:     } else if (token->type == IDENTIFIER)
	cmpl	$1, %eax	;, _6
	jne	.L10	;,
; src/compiler.c:28:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp133
	movq	16(%rax), %rax	; token_52(D)->column, _7
; src/compiler.c:28:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _8
; src/compiler.c:28:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp134
	movq	8(%rax), %rax	; token_52(D)->line, _9
; src/compiler.c:28:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _10
	movq	-24(%rbp), %rax	; file, tmp135
	leaq	.LC2(%rip), %rsi	;, tmp136
	movq	%rax, %rdi	; tmp135,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L10:
; src/compiler.c:29:     else if (token->type == INTEGER)
	movq	-32(%rbp), %rax	; token, tmp137
	movl	24(%rax), %eax	; token_52(D)->type, _11
; src/compiler.c:29:     else if (token->type == INTEGER)
	cmpl	$2, %eax	;, _11
	jne	.L12	;,
; src/compiler.c:30:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp138
	movq	16(%rax), %rax	; token_52(D)->column, _12
; src/compiler.c:30:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _13
; src/compiler.c:30:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp139
	movq	8(%rax), %rax	; token_52(D)->line, _14
; src/compiler.c:30:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _15
	movq	-24(%rbp), %rax	; file, tmp140
	leaq	.LC3(%rip), %rsi	;, tmp141
	movq	%rax, %rdi	; tmp140,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L12:
; src/compiler.c:31:     else if (token->type == FLOAT)
	movq	-32(%rbp), %rax	; token, tmp142
	movl	24(%rax), %eax	; token_52(D)->type, _16
; src/compiler.c:31:     else if (token->type == FLOAT)
	cmpl	$3, %eax	;, _16
	jne	.L13	;,
; src/compiler.c:32:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp143
	movq	16(%rax), %rax	; token_52(D)->column, _17
; src/compiler.c:32:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _18
; src/compiler.c:32:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp144
	movq	8(%rax), %rax	; token_52(D)->line, _19
; src/compiler.c:32:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _20
	movq	-24(%rbp), %rax	; file, tmp145
	leaq	.LC4(%rip), %rsi	;, tmp146
	movq	%rax, %rdi	; tmp145,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L13:
; src/compiler.c:33:     else if (token->type == STRING)
	movq	-32(%rbp), %rax	; token, tmp147
	movl	24(%rax), %eax	; token_52(D)->type, _21
; src/compiler.c:33:     else if (token->type == STRING)
	cmpl	$4, %eax	;, _21
	jne	.L14	;,
; src/compiler.c:34:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp148
	movq	16(%rax), %rax	; token_52(D)->column, _22
; src/compiler.c:34:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _23
; src/compiler.c:34:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp149
	movq	8(%rax), %rax	; token_52(D)->line, _24
; src/compiler.c:34:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _25
	movq	-24(%rbp), %rax	; file, tmp150
	leaq	.LC5(%rip), %rsi	;, tmp151
	movq	%rax, %rdi	; tmp150,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L14:
; src/compiler.c:35:     else if (token->type == SYMBOL)
	movq	-32(%rbp), %rax	; token, tmp152
	movl	24(%rax), %eax	; token_52(D)->type, _26
; src/compiler.c:35:     else if (token->type == SYMBOL)
	cmpl	$5, %eax	;, _26
	jne	.L15	;,
; src/compiler.c:36:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp153
	movq	16(%rax), %rax	; token_52(D)->column, _27
; src/compiler.c:36:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _28
; src/compiler.c:36:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp154
	movq	8(%rax), %rax	; token_52(D)->line, _29
; src/compiler.c:36:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _30
	movq	-24(%rbp), %rax	; file, tmp155
	leaq	.LC6(%rip), %rsi	;, tmp156
	movq	%rax, %rdi	; tmp155,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L15:
; src/compiler.c:37:     else if (token->type == KEYWORD)
	movq	-32(%rbp), %rax	; token, tmp157
	movl	24(%rax), %eax	; token_52(D)->type, _31
; src/compiler.c:37:     else if (token->type == KEYWORD)
	cmpl	$6, %eax	;, _31
	jne	.L16	;,
; src/compiler.c:38:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp158
	movq	16(%rax), %rax	; token_52(D)->column, _32
; src/compiler.c:38:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _33
; src/compiler.c:38:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp159
	movq	8(%rax), %rax	; token_52(D)->line, _34
; src/compiler.c:38:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _35
	movq	-24(%rbp), %rax	; file, tmp160
	leaq	.LC7(%rip), %rsi	;, tmp161
	movq	%rax, %rdi	; tmp160,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L11	;
.L16:
; src/compiler.c:39:     else if (token->type == COMMENT)
	movq	-32(%rbp), %rax	; token, tmp162
	movl	24(%rax), %eax	; token_52(D)->type, _36
; src/compiler.c:39:     else if (token->type == COMMENT)
	cmpl	$7, %eax	;, _36
	jne	.L11	;,
; src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp163
	movq	16(%rax), %rax	; token_52(D)->column, _37
; src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _38
; src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-32(%rbp), %rax	; token, tmp164
	movq	8(%rax), %rax	; token_52(D)->line, _39
; src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _40
	movq	-24(%rbp), %rax	; file, tmp165
	leaq	.LC8(%rip), %rsi	;, tmp166
	movq	%rax, %rdi	; tmp165,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L11:
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	$0, -8(%rbp)	;, i
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	jmp	.L17	;
.L23:
; src/compiler.c:42:         char c = token->lexeme[i];
	movq	-32(%rbp), %rax	; token, tmp167
	movq	(%rax), %rdx	; token_52(D)->lexeme, _41
; src/compiler.c:42:         char c = token->lexeme[i];
	movq	-8(%rbp), %rax	; i, tmp168
	addq	%rdx, %rax	; _41, _42
; src/compiler.c:42:         char c = token->lexeme[i];
	movzbl	(%rax), %eax	; *_42, tmp169
	movb	%al, -9(%rbp)	; tmp169, c
; src/compiler.c:43:         if (c == '\0')
	cmpb	$0, -9(%rbp)	;, c
	jne	.L18	;,
; src/compiler.c:44:             fputs("\\0", file);
	movq	-24(%rbp), %rax	; file, tmp170
	movq	%rax, %rcx	; tmp170,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rax	;, tmp171
	movq	%rax, %rdi	; tmp171,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L18:
; src/compiler.c:45:         else if (c == '\n')
	cmpb	$10, -9(%rbp)	;, c
	jne	.L20	;,
; src/compiler.c:46:             fputs("\\n", file);
	movq	-24(%rbp), %rax	; file, tmp172
	movq	%rax, %rcx	; tmp172,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp173
	movq	%rax, %rdi	; tmp173,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L20:
; src/compiler.c:47:         else if (c == '\t')
	cmpb	$9, -9(%rbp)	;, c
	jne	.L21	;,
; src/compiler.c:48:             fputs("\\t", file);
	movq	-24(%rbp), %rax	; file, tmp174
	movq	%rax, %rcx	; tmp174,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L21:
; src/compiler.c:49:         else if (c == '\r')
	cmpb	$13, -9(%rbp)	;, c
	jne	.L22	;,
; src/compiler.c:50:             fputs("\\r", file);
	movq	-24(%rbp), %rax	; file, tmp176
	movq	%rax, %rcx	; tmp176,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp177
	movq	%rax, %rdi	; tmp177,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L22:
; src/compiler.c:52:             fputc(c, file);
	movsbl	-9(%rbp), %eax	; c, _43
	movq	-24(%rbp), %rdx	; file, tmp178
	movq	%rdx, %rsi	; tmp178,
	movl	%eax, %edi	; _43,
	call	*fputc@GOTPCREL(%rip)	;
.L19:
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, -8(%rbp)	;, i
.L17:
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	-32(%rbp), %rax	; token, tmp179
	movq	(%rax), %rax	; token_52(D)->lexeme, _44
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%rax, %rdi	; _44,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, -8(%rbp)	; _45, i
	jb	.L23	;,
; src/compiler.c:54:     fprintf(file, "'\n");
	movq	-24(%rbp), %rax	; file, tmp180
	movq	%rax, %rcx	; tmp180,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rax	;, tmp181
	movq	%rax, %rdi	; tmp181,
	call	*fwrite@GOTPCREL(%rip)	;
.L7:
; src/compiler.c:55: }
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
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	-32(%rbp), %rax	; lexer, tmp84
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp84,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, current
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	jmp	.L25	;
.L28:
; src/compiler.c:58:         output_one_token(file, current);
	movq	-8(%rbp), %rdx	; current, tmp86
	movq	-24(%rbp), %rax	; file, tmp87
	movq	%rdx, %rsi	; tmp86,
	movq	%rax, %rdi	; tmp87,
	call	output_one_token	;
; src/compiler.c:59:         if (current->type == EOF_TOKEN)
	movq	-8(%rbp), %rax	; current, tmp88
	movl	24(%rax), %eax	; current_3->type, _1
; src/compiler.c:59:         if (current->type == EOF_TOKEN)
	testl	%eax, %eax	; _1
	je	.L29	;,
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	-32(%rbp), %rax	; lexer, tmp89
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp89,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp90, current
.L25:
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L28	;,
	jmp	.L27	;
.L29:
; src/compiler.c:60:             break;
	nop	
.L27:
; src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _2
; src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	-24(%rbp), %rax	; file, tmp91
	leaq	.LC14(%rip), %rcx	;, tmp92
	movq	%rcx, %rsi	; tmp92,
	movq	%rax, %rdi	; tmp91,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:63: }
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
	movq	%rdi, -40(%rbp)	; file, file
	movq	%rsi, -48(%rbp)	; ast, ast
; src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	leaq	-32(%rbp), %rdx	;, tmp83
	movq	-40(%rbp), %rsi	; file, tmp84
	movq	-48(%rbp), %rax	; ast, tmp85
	movq	%rdx, %rcx	; tmp83,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp85,
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _1
; src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	-40(%rbp), %rax	; file, tmp86
	leaq	.LC14(%rip), %rcx	;, tmp87
	movq	%rcx, %rsi	; tmp87,
	movq	%rax, %rdi	; tmp86,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:68: }
	nop	
	leave	
	ret	
	.size	output_ast, .-output_ast
	.globl	output_tac
	.type	output_tac, @function
output_tac:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; file, file
	movq	%rsi, -16(%rbp)	; tac, tac
; src/compiler.c:70:     output_TAC(tac, file, 0);
	movq	-8(%rbp), %rcx	; file, tmp83
	movq	-16(%rbp), %rax	; tac, tmp84
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; tmp83,
	movq	%rax, %rdi	; tmp84,
	call	*output_TAC@GOTPCREL(%rip)	;
; src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _1
; src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	-8(%rbp), %rax	; file, tmp85
	leaq	.LC14(%rip), %rcx	;, tmp86
	movq	%rcx, %rsi	; tmp86,
	movq	%rax, %rdi	; tmp85,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:72: }
	nop	
	leave	
	ret	
	.size	output_tac, .-output_tac
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
.LC22:
	.string	".tac"
	.text
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$160, %rsp	;,
	movq	%rdi, -136(%rbp)	; name, name
	movl	%ecx, %eax	; o_tac, tmp97
	movl	%esi, %ecx	; tmp93, tmp94
	movb	%cl, -140(%rbp)	; tmp94, o_token
	movb	%dl, -144(%rbp)	; tmp96, o_ast
	movb	%al, -148(%rbp)	; tmp98, o_tac
; src/compiler.c:74:     File* file = create_file(name);
	movq	-136(%rbp), %rax	; name, tmp99
	movq	%rax, %rdi	; tmp99,
	call	*create_file@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp100, file
; src/compiler.c:75:     string filename = get_full_path(file);
	movq	-16(%rbp), %rax	; file, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp102, filename
; src/compiler.c:76:     size_t length = 0;
	movq	$0, -120(%rbp)	;, length
; src/compiler.c:77:     FILE* source_file = fopen(filename, "r");
	movq	-24(%rbp), %rax	; filename, tmp103
	leaq	.LC15(%rip), %rdx	;, tmp104
	movq	%rdx, %rsi	; tmp104,
	movq	%rax, %rdi	; tmp103,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp105, source_file
; src/compiler.c:78:     if (source_file == NULL) {
	cmpq	$0, -32(%rbp)	;, source_file
	jne	.L33	;,
; src/compiler.c:79:         fprintf(stderr, "Error opening file: %s", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.0_1
	movq	-24(%rbp), %rdx	; filename, tmp106
	leaq	.LC16(%rip), %rcx	;, tmp107
	movq	%rcx, %rsi	; tmp107,
	movq	%rax, %rdi	; stderr.0_1,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L32	;
.L33:
; src/compiler.c:82:     string source = read_source(source_file, &length);
	leaq	-120(%rbp), %rdx	;, tmp108
	movq	-32(%rbp), %rax	; source_file, tmp109
	movq	%rdx, %rsi	; tmp108,
	movq	%rax, %rdi	; tmp109,
	call	read_source	;
	movq	%rax, -40(%rbp)	; tmp110, source
; src/compiler.c:83:     fclose(source_file);
	movq	-32(%rbp), %rax	; source_file, tmp111
	movq	%rax, %rdi	; tmp111,
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:84:     Lexer* lexer = create_lexer(source, length);
	movq	-120(%rbp), %rdx	; length, length.1_2
	movq	-40(%rbp), %rax	; source, tmp112
	movq	%rdx, %rsi	; length.1_2,
	movq	%rax, %rdi	; tmp112,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp113, lexer
; src/compiler.c:85:     if (o_token) {
	cmpb	$0, -140(%rbp)	;, o_token
	je	.L35	;,
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _3
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movq	-16(%rbp), %rax	; file, tmp115
	movq	%rdx, %rsi	; _3,
	movq	%rax, %rdi	; tmp115,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:87:         string out_token_name = get_full_path(file);
	movq	-16(%rbp), %rax	; file, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp117, out_token_name
; src/compiler.c:88:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	-56(%rbp), %rax	; out_token_name, tmp118
	leaq	.LC18(%rip), %rdx	;, tmp119
	movq	%rdx, %rsi	; tmp119,
	movq	%rax, %rdi	; tmp118,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp120, out_token_file
; src/compiler.c:89:         if (out_token_file == NULL)
	cmpq	$0, -64(%rbp)	;, out_token_file
	jne	.L36	;,
; src/compiler.c:90:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	stderr(%rip), %rax	; stderr, stderr.2_4
	movq	-56(%rbp), %rdx	; out_token_name, tmp121
	leaq	.LC19(%rip), %rcx	;, tmp122
	movq	%rcx, %rsi	; tmp122,
	movq	%rax, %rdi	; stderr.2_4,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L35	;
.L36:
; src/compiler.c:92:             output_token(out_token_file, lexer);
	movq	-48(%rbp), %rdx	; lexer, tmp123
	movq	-64(%rbp), %rax	; out_token_file, tmp124
	movq	%rdx, %rsi	; tmp123,
	movq	%rax, %rdi	; tmp124,
	call	output_token	;
; src/compiler.c:93:             fclose(out_token_file);
	movq	-64(%rbp), %rax	; out_token_file, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*fclose@GOTPCREL(%rip)	;
.L35:
; src/compiler.c:96:     reset_lexer(lexer);
	movq	-48(%rbp), %rax	; lexer, tmp126
	movq	%rax, %rdi	; tmp126,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:97:     Parser* parser = create_parser(file);
	movq	-16(%rbp), %rax	; file, tmp127
	movq	%rax, %rdi	; tmp127,
	call	*create_parser@GOTPCREL(%rip)	;
	movq	%rax, -72(%rbp)	; tmp128, parser
; src/compiler.c:98:     Code* ast = NULL;
	movq	$0, -8(%rbp)	;, ast
; src/compiler.c:99:     if (o_ast || o_tac)
	cmpb	$0, -144(%rbp)	;, o_ast
	jne	.L37	;,
; src/compiler.c:99:     if (o_ast || o_tac)
	cmpb	$0, -148(%rbp)	;, o_tac
	je	.L38	;,
.L37:
; src/compiler.c:100:         ast = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rcx	; builtin_scope, builtin_scope.3_5
	movq	-72(%rbp), %rdx	; parser, tmp129
	movq	-48(%rbp), %rax	; lexer, tmp130
	movq	%rcx, %rsi	; builtin_scope.3_5,
	movq	%rax, %rdi	; tmp130,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp131, ast
.L38:
; src/compiler.c:101:     if (o_ast) {
	cmpb	$0, -144(%rbp)	;, o_ast
	je	.L39	;,
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC20(%rip), %rax	;, tmp132
	movq	%rax, %rdi	; tmp132,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _6
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movq	-16(%rbp), %rax	; file, tmp133
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; tmp133,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:103:         string out_ast_name = get_full_path(file);
	movq	-16(%rbp), %rax	; file, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp135, out_ast_name
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp136
	movq	%rax, %rdi	; tmp136,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _7
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movq	-16(%rbp), %rax	; file, tmp137
	movq	%rdx, %rsi	; _7,
	movq	%rax, %rdi	; tmp137,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	-80(%rbp), %rax	; out_ast_name, tmp138
	leaq	.LC18(%rip), %rdx	;, tmp139
	movq	%rdx, %rsi	; tmp139,
	movq	%rax, %rdi	; tmp138,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp140, out_ast_file
; src/compiler.c:106:         if (out_ast_file == NULL)
	cmpq	$0, -88(%rbp)	;, out_ast_file
	jne	.L40	;,
; src/compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	stderr(%rip), %rax	; stderr, stderr.4_8
	movq	-80(%rbp), %rdx	; out_ast_name, tmp141
	leaq	.LC19(%rip), %rcx	;, tmp142
	movq	%rcx, %rsi	; tmp142,
	movq	%rax, %rdi	; stderr.4_8,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L39	;
.L40:
; src/compiler.c:109:             output_ast(out_ast_file, ast);
	movq	-8(%rbp), %rdx	; ast, tmp143
	movq	-88(%rbp), %rax	; out_ast_file, tmp144
	movq	%rdx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp144,
	call	output_ast	;
; src/compiler.c:110:             fclose(out_ast_file);
	movq	-88(%rbp), %rax	; out_ast_file, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*fclose@GOTPCREL(%rip)	;
.L39:
; src/compiler.c:113:     if (o_tac) {
	cmpb	$0, -148(%rbp)	;, o_tac
	je	.L32	;,
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movl	$4, %esi	;,
	leaq	.LC22(%rip), %rax	;, tmp146
	movq	%rax, %rdi	; tmp146,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _9
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movq	-16(%rbp), %rax	; file, tmp147
	movq	%rdx, %rsi	; _9,
	movq	%rax, %rdi	; tmp147,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:115:         string out_tac_name = get_full_path(file);
	movq	-16(%rbp), %rax	; file, tmp148
	movq	%rax, %rdi	; tmp148,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -96(%rbp)	; tmp149, out_tac_name
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp150
	movq	%rax, %rdi	; tmp150,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _10
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movq	-16(%rbp), %rax	; file, tmp151
	movq	%rdx, %rsi	; _10,
	movq	%rax, %rdi	; tmp151,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:117:         FILE* out_tac_file = fopen(out_tac_name, "w");
	movq	-96(%rbp), %rax	; out_tac_name, tmp152
	leaq	.LC18(%rip), %rdx	;, tmp153
	movq	%rdx, %rsi	; tmp153,
	movq	%rax, %rdi	; tmp152,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp154, out_tac_file
; src/compiler.c:118:         if (out_tac_file == NULL)
	cmpq	$0, -104(%rbp)	;, out_tac_file
	jne	.L42	;,
; src/compiler.c:119:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	movq	stderr(%rip), %rax	; stderr, stderr.5_11
	movq	-96(%rbp), %rdx	; out_tac_name, tmp155
	leaq	.LC19(%rip), %rcx	;, tmp156
	movq	%rcx, %rsi	; tmp156,
	movq	%rax, %rdi	; stderr.5_11,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L32	;
.L42:
; src/compiler.c:121:             TAC* tac = tac_code(ast);
	movq	-8(%rbp), %rax	; ast, tmp157
	movq	%rax, %rdi	; tmp157,
	call	*tac_code@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp158, tac
; src/compiler.c:122:             output_tac(out_tac_file, tac);
	movq	-112(%rbp), %rdx	; tac, tmp159
	movq	-104(%rbp), %rax	; out_tac_file, tmp160
	movq	%rdx, %rsi	; tmp159,
	movq	%rax, %rdi	; tmp160,
	call	output_tac	;
; src/compiler.c:123:             fclose(out_tac_file);
	movq	-104(%rbp), %rax	; out_tac_file, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*fclose@GOTPCREL(%rip)	;
.L32:
; src/compiler.c:126: }
	leave	
	ret	
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata
.LC0:
	.string	"%.*s%s"
.LC1:
	.string	"%s"
.LC2:
	.string	"%s%s"
	.text
	.globl	string_append
	.type	string_append, @function
string_append:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; dest, dest
	movq	%rsi, -48(%rbp)	; dest_length, dest_length
	movq	%rdx, -56(%rbp)	; src, src
	movq	%rcx, -64(%rbp)	; new, new
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	-56(%rbp), %rax	; src, tmp87
	movq	%rax, %rdi	; tmp87,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp88, src_length
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	-64(%rbp), %rax	; new, tmp89
	movq	%rax, %rdi	; tmp89,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp90, new_length
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	movq	-8(%rbp), %rdx	; src_length, tmp91
	movq	-16(%rbp), %rax	; new_length, tmp92
	addq	%rdx, %rax	; tmp91, _1
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	-48(%rbp), %rax	; dest_length, _1
	jb	.L2	;,
; src/compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	movq	-48(%rbp), %rax	; dest_length, tmp93
	subq	-16(%rbp), %rax	; new_length, _2
; src/compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	subq	$1, %rax	;, tmp94
	movq	%rax, -24(%rbp)	; tmp94, max_src_length
; src/compiler.c:11:         snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
	movq	-24(%rbp), %rax	; max_src_length, tmp95
	movl	%eax, %edi	; tmp95, _3
	movq	-64(%rbp), %rcx	; new, tmp96
	movq	-56(%rbp), %rdx	; src, tmp97
	movq	-48(%rbp), %rsi	; dest_length, tmp98
	movq	-40(%rbp), %rax	; dest, tmp99
	movq	%rcx, %r9	; tmp96,
	movq	%rdx, %r8	; tmp97,
	movl	%edi, %ecx	; _3,
	leaq	.LC0(%rip), %rdx	;, tmp100
	movq	%rax, %rdi	; tmp99,
	movl	$0, %eax	;,
	call	*snprintf@GOTPCREL(%rip)	;
; src/compiler.c:16: }
	jmp	.L5	;
.L2:
; src/compiler.c:12:     } else if (src == dest)
	movq	-56(%rbp), %rax	; src, tmp101
	cmpq	-40(%rbp), %rax	; dest, tmp101
	jne	.L4	;,
; src/compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	movq	-48(%rbp), %rax	; dest_length, tmp102
	subq	-8(%rbp), %rax	; src_length, _4
	movq	-40(%rbp), %rcx	; dest, tmp103
	movq	-8(%rbp), %rdx	; src_length, tmp104
	leaq	(%rcx,%rdx), %rdi	;, _5
	movq	-64(%rbp), %rdx	; new, tmp105
	movq	%rdx, %rcx	; tmp105,
	leaq	.LC1(%rip), %rdx	;, tmp106
	movq	%rax, %rsi	; _4,
	movl	$0, %eax	;,
	call	*snprintf@GOTPCREL(%rip)	;
; src/compiler.c:16: }
	jmp	.L5	;
.L4:
; src/compiler.c:15:         snprintf(dest, dest_length, "%s%s", src, new);
	movq	-64(%rbp), %rcx	; new, tmp107
	movq	-56(%rbp), %rdx	; src, tmp108
	movq	-48(%rbp), %rsi	; dest_length, tmp109
	movq	-40(%rbp), %rax	; dest, tmp110
	movq	%rcx, %r8	; tmp107,
	movq	%rdx, %rcx	; tmp108,
	leaq	.LC2(%rip), %rdx	;, tmp111
	movq	%rax, %rdi	; tmp110,
	movl	$0, %eax	;,
	call	*snprintf@GOTPCREL(%rip)	;
.L5:
; src/compiler.c:16: }
	nop	
	leave	
	ret	
	.size	string_append, .-string_append
	.section	.rodata
.LC3:
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
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	movq	-40(%rbp), %rax	; file, tmp96
	movl	$2, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp96,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	-40(%rbp), %rax	; file, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	%rax, %rdx	; _1, _2
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	-48(%rbp), %rax	; length, tmp98
	movq	%rdx, (%rax)	; _2, *length_20(D)
; src/compiler.c:20:     fseek(file, 0, SEEK_SET);
	movq	-40(%rbp), %rax	; file, tmp99
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp99,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:22:     string source = create_string("", *length + 1);
	movq	-48(%rbp), %rax	; length, tmp100
	movq	(%rax), %rax	; *length_20(D), _3
; src/compiler.c:22:     string source = create_string("", *length + 1);
	addq	$1, %rax	;, _4
	movq	%rax, %rsi	; _4,
	leaq	.LC3(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, source
; src/compiler.c:23:     size_t bytes_read = fread(source, 1, *length, file);
	movq	-48(%rbp), %rax	; length, tmp103
	movq	(%rax), %rdx	; *length_20(D), _5
	movq	-40(%rbp), %rcx	; file, tmp104
	movq	-16(%rbp), %rax	; source, tmp105
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp105,
	call	*fread@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp106, bytes_read
; src/compiler.c:24:     source[bytes_read] = '\0';
	movq	-16(%rbp), %rdx	; source, tmp107
	movq	-24(%rbp), %rax	; bytes_read, tmp108
	addq	%rdx, %rax	; tmp107, _6
; src/compiler.c:24:     source[bytes_read] = '\0';
	movb	$0, (%rax)	;, *_6
; src/compiler.c:25:     *length = bytes_read;
	movq	-48(%rbp), %rax	; length, tmp109
	movq	-24(%rbp), %rdx	; bytes_read, tmp110
	movq	%rdx, (%rax)	; tmp110, *length_20(D)
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	movq	$0, -8(%rbp)	;, i
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	jmp	.L7	;
.L10:
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	; source, tmp111
	movq	-8(%rbp), %rax	; i, tmp112
	addq	%rdx, %rax	; tmp111, _7
	movzbl	(%rax), %eax	; *_7, _8
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$13, %al	;, _8
	je	.L8	;,
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movq	-16(%rbp), %rdx	; source, tmp113
	movq	-8(%rbp), %rax	; i, tmp114
	addq	%rdx, %rax	; tmp113, _9
	movzbl	(%rax), %eax	; *_9, _10
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %al	;, _10
	jne	.L9	;,
.L8:
; src/compiler.c:29:             source[i] = ' ';
	movq	-16(%rbp), %rdx	; source, tmp115
	movq	-8(%rbp), %rax	; i, tmp116
	addq	%rdx, %rax	; tmp115, _11
; src/compiler.c:29:             source[i] = ' ';
	movb	$32, (%rax)	;, *_11
.L9:
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, -8(%rbp)	;, i
.L7:
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	movq	-48(%rbp), %rax	; length, tmp117
	movq	(%rax), %rax	; *length_20(D), _12
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	cmpq	%rax, -8(%rbp)	; _12, i
	jb	.L10	;,
; src/compiler.c:31:     return source;
	movq	-16(%rbp), %rax	; source, _30
; src/compiler.c:32: }
	leave	
	ret	
	.size	read_source, .-read_source
	.section	.rodata
	.align 8
.LC4:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
	.align 8
.LC5:
	.string	"Token(Type: identifier,  Line: "
	.align 8
.LC6:
	.string	"Token(Type: integer,     Line: "
	.align 8
.LC7:
	.string	"Token(Type: float,       Line: "
	.align 8
.LC8:
	.string	"Token(Type: string,      Line: "
	.align 8
.LC9:
	.string	"Token(Type: symbol,      Line: "
	.align 8
.LC10:
	.string	"Token(Type: keyword,     Line: "
	.align 8
.LC11:
	.string	"Token(Type: comment,     Line: "
.LC12:
	.string	"%zu, Column: %zu)\tLexeme: '"
.LC13:
	.string	"\\0"
.LC14:
	.string	"\\n"
.LC15:
	.string	"\\t"
.LC16:
	.string	"\\r"
.LC17:
	.string	"'\n"
.LC18:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; file, file
	movq	%rsi, -64(%rbp)	; lexer, lexer
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	-64(%rbp), %rax	; lexer, tmp102
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp102,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp103, current
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	jmp	.L13	;
.L30:
; src/compiler.c:35:         Token* token = current;
	movq	-8(%rbp), %rax	; current, tmp104
	movq	%rax, -24(%rbp)	; tmp104, token
; src/compiler.c:36:         if (token->type == EOF_TOKEN) {
	movq	-24(%rbp), %rax	; token, tmp105
	movl	24(%rax), %eax	; token_32->type, _1
; src/compiler.c:36:         if (token->type == EOF_TOKEN) {
	testl	%eax, %eax	; _1
	jne	.L14	;,
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	; token, tmp106
	movq	16(%rax), %rax	; token_32->column, _2
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _3
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	; token, tmp107
	movq	8(%rax), %rax	; token_32->line, _4
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _5
	movq	-56(%rbp), %rax	; file, tmp108
	leaq	.LC4(%rip), %rsi	;, tmp109
	movq	%rax, %rdi	; tmp108,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:38:             break;
	jmp	.L15	;
.L14:
; src/compiler.c:39:         } else if (token->type == IDENTIFIER)
	movq	-24(%rbp), %rax	; token, tmp110
	movl	24(%rax), %eax	; token_32->type, _6
; src/compiler.c:39:         } else if (token->type == IDENTIFIER)
	cmpl	$1, %eax	;, _6
	jne	.L16	;,
; src/compiler.c:40:             fprintf(file, "Token(Type: identifier,  Line: ");
	movq	-56(%rbp), %rax	; file, tmp111
	movq	%rax, %rcx	; tmp111,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L17	;
.L16:
; src/compiler.c:41:         else if (token->type == INTEGER)
	movq	-24(%rbp), %rax	; token, tmp113
	movl	24(%rax), %eax	; token_32->type, _7
; src/compiler.c:41:         else if (token->type == INTEGER)
	cmpl	$2, %eax	;, _7
	jne	.L18	;,
; src/compiler.c:42:             fprintf(file, "Token(Type: integer,     Line: ");
	movq	-56(%rbp), %rax	; file, tmp114
	movq	%rax, %rcx	; tmp114,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rax	;, tmp115
	movq	%rax, %rdi	; tmp115,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L17	;
.L18:
; src/compiler.c:43:         else if (token->type == FLOAT)
	movq	-24(%rbp), %rax	; token, tmp116
	movl	24(%rax), %eax	; token_32->type, _8
; src/compiler.c:43:         else if (token->type == FLOAT)
	cmpl	$3, %eax	;, _8
	jne	.L19	;,
; src/compiler.c:44:             fprintf(file, "Token(Type: float,       Line: ");
	movq	-56(%rbp), %rax	; file, tmp117
	movq	%rax, %rcx	; tmp117,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp118
	movq	%rax, %rdi	; tmp118,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L17	;
.L19:
; src/compiler.c:45:         else if (token->type == STRING)
	movq	-24(%rbp), %rax	; token, tmp119
	movl	24(%rax), %eax	; token_32->type, _9
; src/compiler.c:45:         else if (token->type == STRING)
	cmpl	$4, %eax	;, _9
	jne	.L20	;,
; src/compiler.c:46:             fprintf(file, "Token(Type: string,      Line: ");
	movq	-56(%rbp), %rax	; file, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L17	;
.L20:
; src/compiler.c:47:         else if (token->type == SYMBOL)
	movq	-24(%rbp), %rax	; token, tmp122
	movl	24(%rax), %eax	; token_32->type, _10
; src/compiler.c:47:         else if (token->type == SYMBOL)
	cmpl	$5, %eax	;, _10
	jne	.L21	;,
; src/compiler.c:48:             fprintf(file, "Token(Type: symbol,      Line: ");
	movq	-56(%rbp), %rax	; file, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rax	;, tmp124
	movq	%rax, %rdi	; tmp124,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L17	;
.L21:
; src/compiler.c:49:         else if (token->type == KEYWORD)
	movq	-24(%rbp), %rax	; token, tmp125
	movl	24(%rax), %eax	; token_32->type, _11
; src/compiler.c:49:         else if (token->type == KEYWORD)
	cmpl	$6, %eax	;, _11
	jne	.L22	;,
; src/compiler.c:50:             fprintf(file, "Token(Type: keyword,     Line: ");
	movq	-56(%rbp), %rax	; file, tmp126
	movq	%rax, %rcx	; tmp126,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp127
	movq	%rax, %rdi	; tmp127,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L17	;
.L22:
; src/compiler.c:51:         else if (token->type == COMMENT)
	movq	-24(%rbp), %rax	; token, tmp128
	movl	24(%rax), %eax	; token_32->type, _12
; src/compiler.c:51:         else if (token->type == COMMENT)
	cmpl	$7, %eax	;, _12
	jne	.L17	;,
; src/compiler.c:52:             fprintf(file, "Token(Type: comment,     Line: ");
	movq	-56(%rbp), %rax	; file, tmp129
	movq	%rax, %rcx	; tmp129,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp130
	movq	%rax, %rdi	; tmp130,
	call	*fwrite@GOTPCREL(%rip)	;
.L17:
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	; token, tmp131
	movq	16(%rax), %rax	; token_32->column, _13
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rcx	;, _14
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	-24(%rbp), %rax	; token, tmp132
	movq	8(%rax), %rax	; token_32->line, _15
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rax), %rdx	;, _16
	movq	-56(%rbp), %rax	; file, tmp133
	leaq	.LC12(%rip), %rsi	;, tmp134
	movq	%rax, %rdi	; tmp133,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:54:         string lexeme_ptr = token->lexeme;
	movq	-24(%rbp), %rax	; token, tmp135
	movq	(%rax), %rax	; token_32->lexeme, tmp136
	movq	%rax, -32(%rbp)	; tmp136, lexeme_ptr
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	$0, -16(%rbp)	;, i
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	jmp	.L23	;
.L29:
; src/compiler.c:56:             char c = lexeme_ptr[i];
	movq	-32(%rbp), %rdx	; lexeme_ptr, tmp137
	movq	-16(%rbp), %rax	; i, tmp138
	addq	%rdx, %rax	; tmp137, _17
; src/compiler.c:56:             char c = lexeme_ptr[i];
	movzbl	(%rax), %eax	; *_17, tmp139
	movb	%al, -33(%rbp)	; tmp139, c
; src/compiler.c:57:             if (c == '\0')
	cmpb	$0, -33(%rbp)	;, c
	jne	.L24	;,
; src/compiler.c:58:                 fputs("\\0", file);
	movq	-56(%rbp), %rax	; file, tmp140
	movq	%rax, %rcx	; tmp140,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rax	;, tmp141
	movq	%rax, %rdi	; tmp141,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L25	;
.L24:
; src/compiler.c:59:             else if (c == '\n')
	cmpb	$10, -33(%rbp)	;, c
	jne	.L26	;,
; src/compiler.c:60:                 fputs("\\n", file);
	movq	-56(%rbp), %rax	; file, tmp142
	movq	%rax, %rcx	; tmp142,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rax	;, tmp143
	movq	%rax, %rdi	; tmp143,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L25	;
.L26:
; src/compiler.c:61:             else if (c == '\t')
	cmpb	$9, -33(%rbp)	;, c
	jne	.L27	;,
; src/compiler.c:62:                 fputs("\\t", file);
	movq	-56(%rbp), %rax	; file, tmp144
	movq	%rax, %rcx	; tmp144,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L25	;
.L27:
; src/compiler.c:63:             else if (c == '\r')
	cmpb	$13, -33(%rbp)	;, c
	jne	.L28	;,
; src/compiler.c:64:                 fputs("\\r", file);
	movq	-56(%rbp), %rax	; file, tmp146
	movq	%rax, %rcx	; tmp146,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp147
	movq	%rax, %rdi	; tmp147,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L25	;
.L28:
; src/compiler.c:66:                 fputc(c, file);
	movsbl	-33(%rbp), %eax	; c, _18
	movq	-56(%rbp), %rdx	; file, tmp148
	movq	%rdx, %rsi	; tmp148,
	movl	%eax, %edi	; _18,
	call	*fputc@GOTPCREL(%rip)	;
.L25:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	addq	$1, -16(%rbp)	;, i
.L23:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	-32(%rbp), %rax	; lexeme_ptr, tmp149
	movq	%rax, %rdi	; tmp149,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, -16(%rbp)	; _19, i
	jb	.L29	;,
; src/compiler.c:68:         fprintf(file, "'\n");
	movq	-56(%rbp), %rax	; file, tmp150
	movq	%rax, %rcx	; tmp150,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp151
	movq	%rax, %rdi	; tmp151,
	call	*fwrite@GOTPCREL(%rip)	;
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	-64(%rbp), %rax	; lexer, tmp152
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp152,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp153, current
.L13:
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L30	;,
.L15:
; src/compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _20
; src/compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	-56(%rbp), %rax	; file, tmp154
	leaq	.LC18(%rip), %rcx	;, tmp155
	movq	%rcx, %rsi	; tmp155,
	movq	%rax, %rdi	; tmp154,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:71: }
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
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rcx	; builtin_scope, builtin_scope.0_1
	movq	-40(%rbp), %rdx	; parser, tmp84
	movq	-32(%rbp), %rax	; lexer, tmp85
	movq	%rcx, %rsi	; builtin_scope.0_1,
	movq	%rax, %rdi	; tmp85,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, ast_root
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	movq	-40(%rbp), %rdx	; parser, tmp87
	movq	-24(%rbp), %rsi	; file, tmp88
	movq	-8(%rbp), %rax	; ast_root, tmp89
	movq	%rdx, %rcx	; tmp87,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp89,
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _2
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	-24(%rbp), %rax	; file, tmp90
	leaq	.LC18(%rip), %rcx	;, tmp91
	movq	%rcx, %rsi	; tmp91,
	movq	%rax, %rdi	; tmp90,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/compiler.c:76: }
	nop	
	leave	
	ret	
	.size	output_ast, .-output_ast
	.section	.rodata
.LC19:
	.string	"r"
.LC20:
	.string	"Error opening file: %s"
.LC21:
	.string	".token"
.LC22:
	.string	"w"
.LC23:
	.string	"Error opening file: %s\n"
.LC24:
	.string	".ast"
	.text
	.globl	parse_file
	.type	parse_file, @function
parse_file:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$112, %rsp	;,
	movq	%rdi, -104(%rbp)	; name, name
	movl	%esi, %ecx	; o_token, tmp88
	movl	%edx, %eax	; o_ast, tmp90
	movl	%ecx, %edx	; tmp88, tmp89
	movb	%dl, -108(%rbp)	; tmp89, o_token
	movb	%al, -112(%rbp)	; tmp91, o_ast
; src/compiler.c:78:     File* file = create_file(name);
	movq	-104(%rbp), %rax	; name, tmp92
	movq	%rax, %rdi	; tmp92,
	call	*create_file@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp93, file
; src/compiler.c:79:     string filename = get_full_path(file);
	movq	-8(%rbp), %rax	; file, tmp94
	movq	%rax, %rdi	; tmp94,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp95, filename
; src/compiler.c:80:     size_t length = 0;
	movq	$0, -88(%rbp)	;, length
; src/compiler.c:81:     FILE* source_file = fopen(filename, "r");
	movq	-16(%rbp), %rax	; filename, tmp96
	leaq	.LC19(%rip), %rdx	;, tmp97
	movq	%rdx, %rsi	; tmp97,
	movq	%rax, %rdi	; tmp96,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp98, source_file
; src/compiler.c:82:     if (source_file == NULL) {
	cmpq	$0, -24(%rbp)	;, source_file
	jne	.L33	;,
; src/compiler.c:83:         fprintf(stderr, "Error opening file: %s", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.1_1
	movq	-16(%rbp), %rdx	; filename, tmp99
	leaq	.LC20(%rip), %rcx	;, tmp100
	movq	%rcx, %rsi	; tmp100,
	movq	%rax, %rdi	; stderr.1_1,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L32	;
.L33:
; src/compiler.c:86:     string source = read_source(source_file, &length);
	leaq	-88(%rbp), %rdx	;, tmp101
	movq	-24(%rbp), %rax	; source_file, tmp102
	movq	%rdx, %rsi	; tmp101,
	movq	%rax, %rdi	; tmp102,
	call	read_source	;
	movq	%rax, -32(%rbp)	; tmp103, source
; src/compiler.c:87:     fclose(source_file);
	movq	-24(%rbp), %rax	; source_file, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:88:     Lexer* lexer = create_lexer(source, length);
	movq	-88(%rbp), %rdx	; length, length.2_2
	movq	-32(%rbp), %rax	; source, tmp105
	movq	%rdx, %rsi	; length.2_2,
	movq	%rax, %rdi	; tmp105,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp106, lexer
; src/compiler.c:89:     if (o_token) {
	cmpb	$0, -108(%rbp)	;, o_token
	je	.L35	;,
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _3
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	-8(%rbp), %rax	; file, tmp108
	movq	%rdx, %rsi	; _3,
	movq	%rax, %rdi	; tmp108,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:91:         string out_token_name = get_full_path(file);
	movq	-8(%rbp), %rax	; file, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp110, out_token_name
; src/compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	movq	-48(%rbp), %rax	; out_token_name, tmp111
	leaq	.LC22(%rip), %rdx	;, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; tmp111,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp113, out_token_file
; src/compiler.c:93:         if (out_token_file == NULL)
	cmpq	$0, -56(%rbp)	;, out_token_file
	jne	.L36	;,
; src/compiler.c:94:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	stderr(%rip), %rax	; stderr, stderr.3_4
	movq	-48(%rbp), %rdx	; out_token_name, tmp114
	leaq	.LC23(%rip), %rcx	;, tmp115
	movq	%rcx, %rsi	; tmp115,
	movq	%rax, %rdi	; stderr.3_4,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L35	;
.L36:
; src/compiler.c:96:             output_token(out_token_file, lexer);
	movq	-40(%rbp), %rdx	; lexer, tmp116
	movq	-56(%rbp), %rax	; out_token_file, tmp117
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; tmp117,
	call	output_token	;
; src/compiler.c:97:             fclose(out_token_file);
	movq	-56(%rbp), %rax	; out_token_file, tmp118
	movq	%rax, %rdi	; tmp118,
	call	*fclose@GOTPCREL(%rip)	;
.L35:
; src/compiler.c:100:     reset_lexer(lexer);
	movq	-40(%rbp), %rax	; lexer, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:101:     Parser* parser = create_parser();
	call	*create_parser@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp120, parser
; src/compiler.c:102:     if (o_ast) {
	cmpb	$0, -112(%rbp)	;, o_ast
	je	.L32	;,
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC24(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _5
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	-8(%rbp), %rax	; file, tmp122
	movq	%rdx, %rsi	; _5,
	movq	%rax, %rdi	; tmp122,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	-8(%rbp), %rax	; file, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, -72(%rbp)	; tmp124, out_ast_name
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	movq	-72(%rbp), %rax	; out_ast_name, tmp125
	leaq	.LC22(%rip), %rdx	;, tmp126
	movq	%rdx, %rsi	; tmp126,
	movq	%rax, %rdi	; tmp125,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp127, out_ast_file
; src/compiler.c:106:         if (out_ast_file == NULL)
	cmpq	$0, -80(%rbp)	;, out_ast_file
	jne	.L38	;,
; src/compiler.c:107:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	stderr(%rip), %rax	; stderr, stderr.4_6
	movq	-72(%rbp), %rdx	; out_ast_name, tmp128
	leaq	.LC23(%rip), %rcx	;, tmp129
	movq	%rcx, %rsi	; tmp129,
	movq	%rax, %rdi	; stderr.4_6,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L32	;
.L38:
; src/compiler.c:109:             output_ast(out_ast_file, lexer, parser);
	movq	-64(%rbp), %rdx	; parser, tmp130
	movq	-40(%rbp), %rcx	; lexer, tmp131
	movq	-80(%rbp), %rax	; out_ast_file, tmp132
	movq	%rcx, %rsi	; tmp131,
	movq	%rax, %rdi	; tmp132,
	call	output_ast	;
; src/compiler.c:110:             fclose(out_ast_file);
	movq	-80(%rbp), %rax	; out_ast_file, tmp133
	movq	%rax, %rdi	; tmp133,
	call	*fclose@GOTPCREL(%rip)	;
.L32:
; src/compiler.c:113: }
	leave	
	ret	
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

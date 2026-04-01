	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; source, source
	movq	%rsi, -32(%rbp)	; length, length
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, lexer
; src/lexer.c:5:     lexer->source = source;
	movq	-8(%rbp), %rax	; lexer, tmp85
	movq	-24(%rbp), %rdx	; source, tmp86
	movq	%rdx, (%rax)	; tmp86, lexer_3->source
; src/lexer.c:6:     lexer->position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp87
	movq	$0, 8(%rax)	;, lexer_3->position
; src/lexer.c:7:     lexer->length = length;
	movq	-8(%rbp), %rax	; lexer, tmp88
	movq	-32(%rbp), %rdx	; length, tmp89
	movq	%rdx, 16(%rax)	; tmp89, lexer_3->length
; src/lexer.c:8:     lexer->line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp90
	movq	$0, 24(%rax)	;, lexer_3->line
; src/lexer.c:9:     lexer->column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp91
	movq	$0, 32(%rax)	;, lexer_3->column
; src/lexer.c:10:     lexer->peeked_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp92
	movq	$0, 40(%rax)	;, lexer_3->peeked_token
; src/lexer.c:11:     lexer->peeked_position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp93
	movq	$0, 48(%rax)	;, lexer_3->peeked_position
; src/lexer.c:12:     lexer->peeked_line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp94
	movq	$0, 56(%rax)	;, lexer_3->peeked_line
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp95
	movq	$0, 64(%rax)	;, lexer_3->peeked_column
; src/lexer.c:14:     lexer->current_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp96
	movq	$0, 72(%rax)	;, lexer_3->current_token
; src/lexer.c:15:     return lexer;
	movq	-8(%rbp), %rax	; lexer, _16
; src/lexer.c:16: }
	leave	
	ret	
	.size	create_lexer, .-create_lexer
	.type	create_token, @function
create_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; lexeme, lexeme
	movq	%rdx, -40(%rbp)	; line, line
	movq	%rcx, -48(%rbp)	; column, column
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, token
; src/lexer.c:20:     token->type = type;
	movq	-8(%rbp), %rax	; token, tmp85
	movl	-20(%rbp), %edx	; type, tmp86
	movl	%edx, 24(%rax)	; tmp86, token_3->type
; src/lexer.c:21:     token->lexeme = lexeme;
	movq	-8(%rbp), %rax	; token, tmp87
	movq	-32(%rbp), %rdx	; lexeme, tmp88
	movq	%rdx, (%rax)	; tmp88, token_3->lexeme
; src/lexer.c:22:     token->line = line;
	movq	-8(%rbp), %rax	; token, tmp89
	movq	-40(%rbp), %rdx	; line, tmp90
	movq	%rdx, 8(%rax)	; tmp90, token_3->line
; src/lexer.c:23:     token->column = column;
	movq	-8(%rbp), %rax	; token, tmp91
	movq	-48(%rbp), %rdx	; column, tmp92
	movq	%rdx, 16(%rax)	; tmp92, token_3->column
; src/lexer.c:24:     return token;
	movq	-8(%rbp), %rax	; token, _12
; src/lexer.c:25: }
	leave	
	ret	
	.size	create_token, .-create_token
	.section	.rodata
	.align 8
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; message, message
	movq	%rsi, -16(%rbp)	; line, line
	movq	%rdx, -24(%rbp)	; column, column
; src/lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	-24(%rbp), %rax	; column, tmp85
	leaq	1(%rax), %rcx	;, _1
	movq	-16(%rbp), %rax	; line, tmp86
	leaq	1(%rax), %rdx	;, _2
	movq	stderr(%rip), %rax	; stderr, stderr.0_3
	movq	-8(%rbp), %rsi	; message, tmp87
	movq	%rsi, %r8	; tmp87,
	leaq	.LC0(%rip), %rsi	;, tmp88
	movq	%rax, %rdi	; stderr.0_3,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/lexer.c:29: }
	nop	
	leave	
	ret	
	.size	lexer_error, .-lexer_error
	.type	get_current_char, @function
get_current_char:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp92
	movq	8(%rax), %rdx	; lexer_13(D)->position, _1
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp93
	movq	16(%rax), %rax	; lexer_13(D)->length, _2
; src/lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	; _2, _1
	jb	.L7	;,
; src/lexer.c:33:         return '\0';
	movl	$0, %eax	;, _10
	jmp	.L8	;
.L7:
; src/lexer.c:34:     lexer->column++;
	movq	-8(%rbp), %rax	; lexer, tmp94
	movq	32(%rax), %rax	; lexer_13(D)->column, _3
; src/lexer.c:34:     lexer->column++;
	leaq	1(%rax), %rdx	;, _4
	movq	-8(%rbp), %rax	; lexer, tmp95
	movq	%rdx, 32(%rax)	; _4, lexer_13(D)->column
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	-8(%rbp), %rax	; lexer, tmp96
	movq	(%rax), %rsi	; lexer_13(D)->source, _5
; src/lexer.c:35:     return lexer->source[lexer->position++];
	movq	-8(%rbp), %rax	; lexer, tmp97
	movq	8(%rax), %rax	; lexer_13(D)->position, _6
; src/lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, _8
	movq	-8(%rbp), %rdx	; lexer, tmp98
	movq	%rcx, 8(%rdx)	; _8, lexer_13(D)->position
; src/lexer.c:35:     return lexer->source[lexer->position++];
	addq	%rsi, %rax	; _5, _9
	movzbl	(%rax), %eax	; *_9, _10
.L8:
; src/lexer.c:36: }
	popq	%rbp	;
	ret	
	.size	get_current_char, .-get_current_char
	.type	peek_next_char, @function
peek_next_char:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp89
	movq	8(%rax), %rdx	; lexer_8(D)->position, _1
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp90
	movq	16(%rax), %rax	; lexer_8(D)->length, _2
; src/lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	; _2, _1
	jb	.L10	;,
; src/lexer.c:40:         return '\0';
	movl	$0, %eax	;, _6
	jmp	.L11	;
.L10:
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	-8(%rbp), %rax	; lexer, tmp91
	movq	(%rax), %rdx	; lexer_8(D)->source, _3
; src/lexer.c:41:     return lexer->source[lexer->position];
	movq	-8(%rbp), %rax	; lexer, tmp92
	movq	8(%rax), %rax	; lexer_8(D)->position, _4
; src/lexer.c:41:     return lexer->source[lexer->position];
	addq	%rdx, %rax	; _3, _5
	movzbl	(%rax), %eax	; *_5, _6
.L11:
; src/lexer.c:42: }
	popq	%rbp	;
	ret	
	.size	peek_next_char, .-peek_next_char
	.type	newline, @function
newline:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:45:     lexer->line++;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	24(%rax), %rax	; lexer_4(D)->line, _1
; src/lexer.c:45:     lexer->line++;
	leaq	1(%rax), %rdx	;, _2
	movq	-8(%rbp), %rax	; lexer, tmp85
	movq	%rdx, 24(%rax)	; _2, lexer_4(D)->line
; src/lexer.c:46:     lexer->column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp86
	movq	$0, 32(%rax)	;, lexer_4(D)->column
; src/lexer.c:47: }
	nop	
	popq	%rbp	;
	ret	
	.size	newline, .-newline
	.type	move_position, @function
move_position:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
	movl	%esi, -12(%rbp)	; count, count
; src/lexer.c:50:     if (count >= 0) {
	cmpl	$0, -12(%rbp)	;, count
	js	.L14	;,
; src/lexer.c:51:         lexer->position += (size_t)count;
	movq	-8(%rbp), %rax	; lexer, tmp96
	movq	8(%rax), %rdx	; lexer_18(D)->position, _1
; src/lexer.c:51:         lexer->position += (size_t)count;
	movl	-12(%rbp), %eax	; count, tmp97
	cltq
; src/lexer.c:51:         lexer->position += (size_t)count;
	addq	%rax, %rdx	; _2, _3
	movq	-8(%rbp), %rax	; lexer, tmp98
	movq	%rdx, 8(%rax)	; _3, lexer_18(D)->position
; src/lexer.c:52:         lexer->column += (size_t)count;
	movq	-8(%rbp), %rax	; lexer, tmp99
	movq	32(%rax), %rdx	; lexer_18(D)->column, _4
; src/lexer.c:52:         lexer->column += (size_t)count;
	movl	-12(%rbp), %eax	; count, tmp100
	cltq
; src/lexer.c:52:         lexer->column += (size_t)count;
	addq	%rax, %rdx	; _5, _6
	movq	-8(%rbp), %rax	; lexer, tmp101
	movq	%rdx, 32(%rax)	; _6, lexer_18(D)->column
; src/lexer.c:57: }
	jmp	.L16	;
.L14:
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	-8(%rbp), %rax	; lexer, tmp102
	movq	8(%rax), %rdx	; lexer_18(D)->position, _7
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	movl	-12(%rbp), %eax	; count, tmp103
	negl	%eax	; _8
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	cltq
; src/lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	%rax, %rdx	; _9, _10
	movq	-8(%rbp), %rax	; lexer, tmp104
	movq	%rdx, 8(%rax)	; _10, lexer_18(D)->position
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	-8(%rbp), %rax	; lexer, tmp105
	movq	32(%rax), %rdx	; lexer_18(D)->column, _11
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	movl	-12(%rbp), %eax	; count, tmp106
	negl	%eax	; _12
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	cltq
; src/lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	%rax, %rdx	; _13, _14
	movq	-8(%rbp), %rax	; lexer, tmp107
	movq	%rdx, 32(%rax)	; _14, lexer_18(D)->column
.L16:
; src/lexer.c:57: }
	nop	
	popq	%rbp	;
	ret	
	.size	move_position, .-move_position
	.section	.rodata
.LC1:
	.string	"Unterminated string literal"
.LC2:
	.string	""
	.string	""
.LC3:
	.string	"src/lexer.c"
.LC4:
	.string	"c != '\\0'"
.LC5:
	.string	"Unterminated comment"
.LC6:
	.string	"Unexpected character"
	.text
	.type	next_token, @function
next_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$136, %rsp	;,
	movq	%rdi, -136(%rbp)	; lexer, lexer
	movl	%esi, %eax	; skip_comment, tmp269
	movb	%al, -140(%rbp)	; tmp270, skip_comment
; src/lexer.c:60:     char c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp271
	movq	%rax, %rdi	; tmp271,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp272, c
; src/lexer.c:61:     if (c == '\0')
	cmpb	$0, -17(%rbp)	;, c
	jne	.L18	;,
; src/lexer.c:62:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	-136(%rbp), %rax	; lexer, tmp273
	movq	32(%rax), %rdx	; lexer_210(D)->column, _1
	movq	-136(%rbp), %rax	; lexer, tmp274
	movq	24(%rax), %rax	; lexer_210(D)->line, _2
	movq	%rdx, %rcx	; _1,
	movq	%rax, %rdx	; _2,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L18:
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$32, -17(%rbp)	;, c
	je	.L20	;,
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, -17(%rbp)	;, c
	je	.L20	;,
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$13, -17(%rbp)	;, c
	jne	.L21	;,
.L20:
; src/lexer.c:64:         return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _3
	movq	-136(%rbp), %rax	; lexer, tmp275
	movl	%edx, %esi	; _3,
	movq	%rax, %rdi	; tmp275,
	call	next_token	;
	jmp	.L19	;
.L21:
; src/lexer.c:65:     else if (c == '\n') {
	cmpb	$10, -17(%rbp)	;, c
	jne	.L22	;,
; src/lexer.c:66:         newline(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp276
	movq	%rax, %rdi	; tmp276,
	call	newline	;
; src/lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _4
	movq	-136(%rbp), %rax	; lexer, tmp277
	movl	%edx, %esi	; _4,
	movq	%rax, %rdi	; tmp277,
	call	next_token	;
	jmp	.L19	;
.L22:
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$96, -17(%rbp)	;, c
	jle	.L23	;,
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$122, -17(%rbp)	;, c
	jle	.L24	;,
.L23:
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$64, -17(%rbp)	;, c
	jle	.L25	;,
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$90, -17(%rbp)	;, c
	jle	.L24	;,
.L25:
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$95, -17(%rbp)	;, c
	jne	.L26	;,
.L24:
; src/lexer.c:69:         size_t start = lexer->position - 1;
	movq	-136(%rbp), %rax	; lexer, tmp278
	movq	8(%rax), %rax	; lexer_210(D)->position, _5
; src/lexer.c:69:         size_t start = lexer->position - 1;
	subq	$1, %rax	;, tmp279
	movq	%rax, -112(%rbp)	; tmp279, start
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp280
	movq	32(%rax), %rax	; lexer_210(D)->column, _6
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp281
	movq	%rax, -120(%rbp)	; tmp281, column_start
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L27	;
.L29:
; src/lexer.c:72:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp282
	movq	%rax, %rdi	; tmp282,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp283, c
.L27:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$96, -17(%rbp)	;, c
	jle	.L28	;,
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$122, -17(%rbp)	;, c
	jle	.L29	;,
.L28:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$64, -17(%rbp)	;, c
	jle	.L30	;,
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$90, -17(%rbp)	;, c
	jle	.L29	;,
.L30:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$47, -17(%rbp)	;, c
	jle	.L31	;,
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$57, -17(%rbp)	;, c
	jle	.L29	;,
.L31:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$95, -17(%rbp)	;, c
	je	.L29	;,
; src/lexer.c:73:         move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp284
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp284,
	call	move_position	;
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-136(%rbp), %rax	; lexer, tmp285
	movq	8(%rax), %rax	; lexer_210(D)->position, _7
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	-112(%rbp), %rax	; start, _8
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-136(%rbp), %rdx	; lexer, tmp286
	movq	(%rdx), %rcx	; lexer_210(D)->source, _9
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-112(%rbp), %rdx	; start, tmp287
	addq	%rcx, %rdx	; _9, _10
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	; _8,
	movq	%rdx, %rdi	; _10,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, -128(%rbp)	; tmp288, content
; src/lexer.c:75:         if (is_keyword(content))
	movq	-128(%rbp), %rax	; content, tmp289
	movq	%rax, %rdi	; tmp289,
	call	*is_keyword@GOTPCREL(%rip)	;
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; _11
	je	.L32	;,
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp290
	movq	24(%rax), %rdx	; lexer_210(D)->line, _12
	movq	-120(%rbp), %rcx	; column_start, tmp291
	movq	-128(%rbp), %rax	; content, tmp292
	movq	%rax, %rsi	; tmp292,
	movl	$6, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L32:
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp293
	movq	24(%rax), %rdx	; lexer_210(D)->line, _13
	movq	-120(%rbp), %rcx	; column_start, tmp294
	movq	-128(%rbp), %rax	; content, tmp295
	movq	%rax, %rsi	; tmp295,
	movl	$1, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L26:
; src/lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$47, -17(%rbp)	;, c
	jle	.L33	;,
; src/lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$57, -17(%rbp)	;, c
	jg	.L33	;,
; src/lexer.c:80:         size_t start = lexer->position - 1;
	movq	-136(%rbp), %rax	; lexer, tmp296
	movq	8(%rax), %rax	; lexer_210(D)->position, _14
; src/lexer.c:80:         size_t start = lexer->position - 1;
	subq	$1, %rax	;, tmp297
	movq	%rax, -40(%rbp)	; tmp297, start
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp298
	movq	32(%rax), %rax	; lexer_210(D)->column, _15
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp299
	movq	%rax, -48(%rbp)	; tmp299, column_start
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	jmp	.L34	;
.L36:
; src/lexer.c:83:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp300
	movq	%rax, %rdi	; tmp300,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp301, c
.L34:
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	;, c
	jle	.L35	;,
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	;, c
	jle	.L36	;,
.L35:
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, -24(%rbp)	;, type
; src/lexer.c:85:         char p = peek_next_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp302
	movq	%rax, %rdi	; tmp302,
	call	peek_next_char	;
	movb	%al, -49(%rbp)	; tmp303, p
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, -17(%rbp)	;, c
	jne	.L37	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$47, -49(%rbp)	;, p
	jle	.L37	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$57, -49(%rbp)	;, p
	jg	.L37	;,
; src/lexer.c:87:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp304
	movq	%rax, %rdi	; tmp304,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp305, c
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	jmp	.L38	;
.L40:
; src/lexer.c:89:                 c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp306
	movq	%rax, %rdi	; tmp306,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp307, c
.L38:
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	;, c
	jle	.L39	;,
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	;, c
	jle	.L40	;,
.L39:
; src/lexer.c:90:             type = FLOAT;
	movl	$3, -24(%rbp)	;, type
.L37:
; src/lexer.c:92:         move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp308
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp308,
	call	move_position	;
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp309
	movq	24(%rax), %rbx	; lexer_210(D)->line, _16
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp310
	movq	8(%rax), %rax	; lexer_210(D)->position, _17
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-40(%rbp), %rax	; start, _18
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rdx	; lexer, tmp311
	movq	(%rdx), %rcx	; lexer_210(D)->source, _19
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-40(%rbp), %rdx	; start, tmp312
	addq	%rcx, %rdx	; _19, _20
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _18,
	movq	%rdx, %rdi	; _20,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _21
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-48(%rbp), %rdx	; column_start, tmp313
	movl	-24(%rbp), %eax	; type, tmp314
	movq	%rdx, %rcx	; tmp313,
	movq	%rbx, %rdx	; _16,
	movl	%eax, %edi	; tmp314,
	call	create_token	;
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L33:
; src/lexer.c:94:     } else if (c == '"') {
	cmpb	$34, -17(%rbp)	;, c
	jne	.L41	;,
; src/lexer.c:95:         size_t start = lexer->position;
	movq	-136(%rbp), %rax	; lexer, tmp315
	movq	8(%rax), %rax	; lexer_210(D)->position, tmp316
	movq	%rax, -96(%rbp)	; tmp316, start
; src/lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp317
	movq	32(%rax), %rax	; lexer_210(D)->column, _22
; src/lexer.c:96:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp318
	movq	%rax, -104(%rbp)	; tmp318, column_start
; src/lexer.c:97:         c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp319
	movq	%rax, %rdi	; tmp319,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp320, c
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L42	;
.L44:
; src/lexer.c:99:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp321
	movq	%rax, %rdi	; tmp321,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp322, c
.L42:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, -17(%rbp)	;, c
	je	.L43	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$0, -17(%rbp)	;, c
	je	.L43	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$10, -17(%rbp)	;, c
	jne	.L44	;,
.L43:
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, -17(%rbp)	;, c
	je	.L45	;,
; src/lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	movq	-96(%rbp), %rax	; start, tmp323
	leaq	-1(%rax), %rdx	;, _23
	movq	-136(%rbp), %rax	; lexer, tmp324
	movq	24(%rax), %rax	; lexer_210(D)->line, _24
	movq	%rax, %rsi	; _24,
	leaq	.LC1(%rip), %rax	;, tmp325
	movq	%rax, %rdi	; tmp325,
	call	lexer_error	;
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	;, c
	jne	.L45	;,
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp326
	movq	%rax, %rdi	; tmp326,
	call	newline	;
.L45:
; src/lexer.c:104:         if (lexer->position - start == 1)
	movq	-136(%rbp), %rax	; lexer, tmp327
	movq	8(%rax), %rax	; lexer_210(D)->position, _25
; src/lexer.c:104:         if (lexer->position - start == 1)
	subq	-96(%rbp), %rax	; start, _26
; src/lexer.c:104:         if (lexer->position - start == 1)
	cmpq	$1, %rax	;, _26
	jne	.L46	;,
; src/lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp328
	movq	24(%rax), %rbx	; lexer_210(D)->line, _27
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp329
	movq	%rax, %rdi	; tmp329,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _28
; src/lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	-104(%rbp), %rax	; column_start, tmp330
	movq	%rax, %rcx	; tmp330,
	movq	%rbx, %rdx	; _27,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	jmp	.L19	;
.L46:
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp331
	movq	24(%rax), %rbx	; lexer_210(D)->line, _29
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp332
	movq	8(%rax), %rax	; lexer_210(D)->position, _30
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-96(%rbp), %rax	; start, _31
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	;, _32
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp333
	movq	(%rax), %rcx	; lexer_210(D)->source, _33
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-96(%rbp), %rax	; start, tmp334
	addq	%rcx, %rax	; _33, _34
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdx, %rsi	; _32,
	movq	%rax, %rdi	; _34,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _35
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-104(%rbp), %rax	; column_start, tmp335
	movq	%rax, %rcx	; tmp335,
	movq	%rbx, %rdx	; _29,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	;
.L41:
; src/lexer.c:108:         char p = peek_next_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp336
	movq	%rax, %rdi	; tmp336,
	call	peek_next_char	;
	movb	%al, -25(%rbp)	; tmp337, p
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, -17(%rbp)	;, c
	jne	.L47	;,
; src/lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, -25(%rbp)	;, p
	jne	.L47	;,
; src/lexer.c:110:             size_t start = lexer->position + 1;
	movq	-136(%rbp), %rax	; lexer, tmp338
	movq	8(%rax), %rax	; lexer_210(D)->position, _36
; src/lexer.c:110:             size_t start = lexer->position + 1;
	addq	$1, %rax	;, tmp339
	movq	%rax, -64(%rbp)	; tmp339, start
; src/lexer.c:111:             size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp340
	movq	32(%rax), %rax	; lexer_210(D)->column, _37
; src/lexer.c:111:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp341
	movq	%rax, -72(%rbp)	; tmp341, column_start
; src/lexer.c:112:             while (c != '\n' && c != '\0')
	jmp	.L48	;
.L50:
; src/lexer.c:113:                 c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp342
	movq	%rax, %rdi	; tmp342,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp343, c
.L48:
; src/lexer.c:112:             while (c != '\n' && c != '\0')
	cmpb	$10, -17(%rbp)	;, c
	je	.L49	;,
; src/lexer.c:112:             while (c != '\n' && c != '\0')
	cmpb	$0, -17(%rbp)	;, c
	jne	.L50	;,
.L49:
; src/lexer.c:114:             move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp344
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp344,
	call	move_position	;
; src/lexer.c:115:             if (skip_comment)
	cmpb	$0, -140(%rbp)	;, skip_comment
	je	.L51	;,
; src/lexer.c:116:                 return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _38
	movq	-136(%rbp), %rax	; lexer, tmp345
	movl	%edx, %esi	; _38,
	movq	%rax, %rdi	; tmp345,
	call	next_token	;
	jmp	.L19	;
.L51:
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp346
	movq	24(%rax), %rbx	; lexer_210(D)->line, _39
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp347
	movq	8(%rax), %rax	; lexer_210(D)->position, _40
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-64(%rbp), %rax	; start, _41
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rdx	; lexer, tmp348
	movq	(%rdx), %rcx	; lexer_210(D)->source, _42
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-64(%rbp), %rdx	; start, tmp349
	addq	%rcx, %rdx	; _42, _43
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _41,
	movq	%rdx, %rdi	; _43,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _44
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-72(%rbp), %rax	; column_start, tmp350
	movq	%rax, %rcx	; tmp350,
	movq	%rbx, %rdx	; _39,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L47:
; src/lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$47, -17(%rbp)	;, c
	jne	.L52	;,
; src/lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$42, -25(%rbp)	;, p
	jne	.L52	;,
; src/lexer.c:119:             size_t start = lexer->position + 1;
	movq	-136(%rbp), %rax	; lexer, tmp351
	movq	8(%rax), %rax	; lexer_210(D)->position, _45
; src/lexer.c:119:             size_t start = lexer->position + 1;
	addq	$1, %rax	;, tmp352
	movq	%rax, -80(%rbp)	; tmp352, start
; src/lexer.c:120:             size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp353
	movq	32(%rax), %rax	; lexer_210(D)->column, _46
; src/lexer.c:120:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp354
	movq	%rax, -88(%rbp)	; tmp354, column_start
; src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	jmp	.L53	;
.L57:
; src/lexer.c:122:                 c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp355
	movq	%rax, %rdi	; tmp355,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp356, c
; src/lexer.c:123:                 p = peek_next_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp357
	movq	%rax, %rdi	; tmp357,
	call	peek_next_char	;
	movb	%al, -25(%rbp)	; tmp358, p
; src/lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	;, c
	jne	.L54	;,
; src/lexer.c:124:                 if (c == '\n') newline(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp359
	movq	%rax, %rdi	; tmp359,
	call	newline	;
.L54:
; src/lexer.c:125:                 if (p == '\0') break;
	cmpb	$0, -25(%rbp)	;, p
	je	.L92	;,
; src/lexer.c:126:                 assert(c != '\0');
	cmpb	$0, -17(%rbp)	;, c
	jne	.L53	;,
; src/lexer.c:126:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax	;, tmp360
	movq	%rax, %rcx	; tmp360,
	movl	$126, %edx	;,
	leaq	.LC3(%rip), %rax	;, tmp361
	movq	%rax, %rsi	; tmp361,
	leaq	.LC4(%rip), %rax	;, tmp362
	movq	%rax, %rdi	; tmp362,
	call	*__assert_fail@GOTPCREL(%rip)	;
.L53:
; src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$42, -17(%rbp)	;, c
	jne	.L57	;,
; src/lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$47, -25(%rbp)	;, p
	jne	.L57	;,
	jmp	.L56	;
.L92:
; src/lexer.c:125:                 if (p == '\0') break;
	nop	
.L56:
; src/lexer.c:128:             if (p == '\0') {
	cmpb	$0, -25(%rbp)	;, p
	jne	.L58	;,
; src/lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	cmpb	$0, -17(%rbp)	;, c
	jne	.L59	;,
; src/lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp363
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp363,
	call	move_position	;
.L59:
; src/lexer.c:130:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	-136(%rbp), %rax	; lexer, tmp364
	movq	24(%rax), %rax	; lexer_210(D)->line, _47
	movq	-80(%rbp), %rdx	; start, tmp365
	movq	%rax, %rsi	; _47,
	leaq	.LC5(%rip), %rax	;, tmp366
	movq	%rax, %rdi	; tmp366,
	call	lexer_error	;
; src/lexer.c:131:                 if (skip_comment)
	cmpb	$0, -140(%rbp)	;, skip_comment
	je	.L60	;,
; src/lexer.c:132:                     return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _48
	movq	-136(%rbp), %rax	; lexer, tmp367
	movl	%edx, %esi	; _48,
	movq	%rax, %rdi	; tmp367,
	call	next_token	;
	jmp	.L19	;
.L60:
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp368
	movq	24(%rax), %rbx	; lexer_210(D)->line, _49
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp369
	movq	8(%rax), %rax	; lexer_210(D)->position, _50
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-80(%rbp), %rax	; start, _51
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rdx	; lexer, tmp370
	movq	(%rdx), %rcx	; lexer_210(D)->source, _52
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-80(%rbp), %rdx	; start, tmp371
	addq	%rcx, %rdx	; _52, _53
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _51,
	movq	%rdx, %rdi	; _53,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _54
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-88(%rbp), %rax	; column_start, tmp372
	movq	%rax, %rcx	; tmp372,
	movq	%rbx, %rdx	; _49,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L58:
; src/lexer.c:135:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp373
	movq	%rax, %rdi	; tmp373,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp374, c
; src/lexer.c:136:             if (skip_comment)
	cmpb	$0, -140(%rbp)	;, skip_comment
	je	.L61	;,
; src/lexer.c:137:                 return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _55
	movq	-136(%rbp), %rax	; lexer, tmp375
	movl	%edx, %esi	; _55,
	movq	%rax, %rdi	; tmp375,
	call	next_token	;
	jmp	.L19	;
.L61:
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp376
	movq	24(%rax), %rbx	; lexer_210(D)->line, _56
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp377
	movq	8(%rax), %rax	; lexer_210(D)->position, _57
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	-80(%rbp), %rax	; start, _58
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	;, _59
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp378
	movq	(%rax), %rcx	; lexer_210(D)->source, _60
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-80(%rbp), %rax	; start, tmp379
	addq	%rcx, %rax	; _60, _61
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rdx, %rsi	; _59,
	movq	%rax, %rdi	; _61,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _62
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-88(%rbp), %rax	; column_start, tmp380
	movq	%rax, %rcx	; tmp380,
	movq	%rbx, %rdx	; _56,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L19	;
.L52:
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, -17(%rbp)	;, c
	jne	.L62	;,
; src/lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L62	;,
; src/lexer.c:140:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp381
	movq	%rax, %rdi	; tmp381,
	call	get_current_char	;
; src/lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp382
	movq	32(%rax), %rax	; lexer_210(D)->column, _63
; src/lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _64
	movq	-136(%rbp), %rax	; lexer, tmp383
	movq	24(%rax), %rdx	; lexer_210(D)->line, _65
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, EQ_SYMBOL.1_66
	movq	%rax, %rsi	; EQ_SYMBOL.1_66,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L62:
; src/lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$33, -17(%rbp)	;, c
	jne	.L63	;,
; src/lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L63	;,
; src/lexer.c:143:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp384
	movq	%rax, %rdi	; tmp384,
	call	get_current_char	;
; src/lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp385
	movq	32(%rax), %rax	; lexer_210(D)->column, _67
; src/lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _68
	movq	-136(%rbp), %rax	; lexer, tmp386
	movq	24(%rax), %rdx	; lexer_210(D)->line, _69
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, NE_SYMBOL.2_70
	movq	%rax, %rsi	; NE_SYMBOL.2_70,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L63:
; src/lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$60, -17(%rbp)	;, c
	jne	.L64	;,
; src/lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L64	;,
; src/lexer.c:146:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp387
	movq	%rax, %rdi	; tmp387,
	call	get_current_char	;
; src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp388
	movq	32(%rax), %rax	; lexer_210(D)->column, _71
; src/lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _72
	movq	-136(%rbp), %rax	; lexer, tmp389
	movq	24(%rax), %rdx	; lexer_210(D)->line, _73
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, LE_SYMBOL.3_74
	movq	%rax, %rsi	; LE_SYMBOL.3_74,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L64:
; src/lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$62, -17(%rbp)	;, c
	jne	.L65	;,
; src/lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L65	;,
; src/lexer.c:149:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp390
	movq	%rax, %rdi	; tmp390,
	call	get_current_char	;
; src/lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp391
	movq	32(%rax), %rax	; lexer_210(D)->column, _75
; src/lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _76
	movq	-136(%rbp), %rax	; lexer, tmp392
	movq	24(%rax), %rdx	; lexer_210(D)->line, _77
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, GE_SYMBOL.4_78
	movq	%rax, %rsi	; GE_SYMBOL.4_78,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L65:
; src/lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$43, -17(%rbp)	;, c
	jne	.L66	;,
; src/lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L66	;,
; src/lexer.c:152:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp393
	movq	%rax, %rdi	; tmp393,
	call	get_current_char	;
; src/lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp394
	movq	32(%rax), %rax	; lexer_210(D)->column, _79
; src/lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _80
	movq	-136(%rbp), %rax	; lexer, tmp395
	movq	24(%rax), %rdx	; lexer_210(D)->line, _81
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.5_82
	movq	%rax, %rsi	; ADD_ASSIGN_SYMBOL.5_82,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L66:
; src/lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$45, -17(%rbp)	;, c
	jne	.L67	;,
; src/lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L67	;,
; src/lexer.c:155:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp396
	movq	%rax, %rdi	; tmp396,
	call	get_current_char	;
; src/lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp397
	movq	32(%rax), %rax	; lexer_210(D)->column, _83
; src/lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _84
	movq	-136(%rbp), %rax	; lexer, tmp398
	movq	24(%rax), %rdx	; lexer_210(D)->line, _85
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.6_86
	movq	%rax, %rsi	; SUB_ASSIGN_SYMBOL.6_86,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L67:
; src/lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$42, -17(%rbp)	;, c
	jne	.L68	;,
; src/lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L68	;,
; src/lexer.c:158:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp399
	movq	%rax, %rdi	; tmp399,
	call	get_current_char	;
; src/lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp400
	movq	32(%rax), %rax	; lexer_210(D)->column, _87
; src/lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _88
	movq	-136(%rbp), %rax	; lexer, tmp401
	movq	24(%rax), %rdx	; lexer_210(D)->line, _89
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.7_90
	movq	%rax, %rsi	; MUL_ASSIGN_SYMBOL.7_90,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L68:
; src/lexer.c:160:         } else if (c == '/' && p == '=') {
	cmpb	$47, -17(%rbp)	;, c
	jne	.L69	;,
; src/lexer.c:160:         } else if (c == '/' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L69	;,
; src/lexer.c:161:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp402
	movq	%rax, %rdi	; tmp402,
	call	get_current_char	;
; src/lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp403
	movq	32(%rax), %rax	; lexer_210(D)->column, _91
; src/lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _92
	movq	-136(%rbp), %rax	; lexer, tmp404
	movq	24(%rax), %rdx	; lexer_210(D)->line, _93
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.8_94
	movq	%rax, %rsi	; DIV_ASSIGN_SYMBOL.8_94,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L69:
; src/lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$37, -17(%rbp)	;, c
	jne	.L70	;,
; src/lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L70	;,
; src/lexer.c:164:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp405
	movq	%rax, %rdi	; tmp405,
	call	get_current_char	;
; src/lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp406
	movq	32(%rax), %rax	; lexer_210(D)->column, _95
; src/lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _96
	movq	-136(%rbp), %rax	; lexer, tmp407
	movq	24(%rax), %rdx	; lexer_210(D)->line, _97
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.9_98
	movq	%rax, %rsi	; MOD_ASSIGN_SYMBOL.9_98,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L70:
; src/lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, -17(%rbp)	;, c
	jne	.L71	;,
; src/lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, -25(%rbp)	;, p
	jne	.L71	;,
; src/lexer.c:167:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp408
	movq	%rax, %rdi	; tmp408,
	call	get_current_char	;
; src/lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp409
	movq	32(%rax), %rax	; lexer_210(D)->column, _99
; src/lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _100
	movq	-136(%rbp), %rax	; lexer, tmp410
	movq	24(%rax), %rdx	; lexer_210(D)->line, _101
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, AND_SYMBOL.10_102
	movq	%rax, %rsi	; AND_SYMBOL.10_102,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L71:
; src/lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, -17(%rbp)	;, c
	jne	.L72	;,
; src/lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, -25(%rbp)	;, p
	jne	.L72	;,
; src/lexer.c:170:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp411
	movq	%rax, %rdi	; tmp411,
	call	get_current_char	;
; src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp412
	movq	32(%rax), %rax	; lexer_210(D)->column, _103
; src/lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _104
	movq	-136(%rbp), %rax	; lexer, tmp413
	movq	24(%rax), %rdx	; lexer_210(D)->line, _105
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, OR_SYMBOL.11_106
	movq	%rax, %rsi	; OR_SYMBOL.11_106,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L72:
; src/lexer.c:172:         } else if (c == '(')
	cmpb	$40, -17(%rbp)	;, c
	jne	.L73	;,
; src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp414
	movq	32(%rax), %rax	; lexer_210(D)->column, _107
; src/lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _108
	movq	-136(%rbp), %rax	; lexer, tmp415
	movq	24(%rax), %rdx	; lexer_210(D)->line, _109
	movq	L_PAREN_SYMBOL(%rip), %rax	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.12_110
	movq	%rax, %rsi	; L_PAREN_SYMBOL.12_110,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L73:
; src/lexer.c:174:         else if (c == ')')
	cmpb	$41, -17(%rbp)	;, c
	jne	.L74	;,
; src/lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp416
	movq	32(%rax), %rax	; lexer_210(D)->column, _111
; src/lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _112
	movq	-136(%rbp), %rax	; lexer, tmp417
	movq	24(%rax), %rdx	; lexer_210(D)->line, _113
	movq	R_PAREN_SYMBOL(%rip), %rax	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.13_114
	movq	%rax, %rsi	; R_PAREN_SYMBOL.13_114,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L74:
; src/lexer.c:176:         else if (c == '{')
	cmpb	$123, -17(%rbp)	;, c
	jne	.L75	;,
; src/lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp418
	movq	32(%rax), %rax	; lexer_210(D)->column, _115
; src/lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _116
	movq	-136(%rbp), %rax	; lexer, tmp419
	movq	24(%rax), %rdx	; lexer_210(D)->line, _117
	movq	L_BRACE_SYMBOL(%rip), %rax	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.14_118
	movq	%rax, %rsi	; L_BRACE_SYMBOL.14_118,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L75:
; src/lexer.c:178:         else if (c == '}')
	cmpb	$125, -17(%rbp)	;, c
	jne	.L76	;,
; src/lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp420
	movq	32(%rax), %rax	; lexer_210(D)->column, _119
; src/lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _120
	movq	-136(%rbp), %rax	; lexer, tmp421
	movq	24(%rax), %rdx	; lexer_210(D)->line, _121
	movq	R_BRACE_SYMBOL(%rip), %rax	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.15_122
	movq	%rax, %rsi	; R_BRACE_SYMBOL.15_122,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L76:
; src/lexer.c:180:         else if (c == ',')
	cmpb	$44, -17(%rbp)	;, c
	jne	.L77	;,
; src/lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp422
	movq	32(%rax), %rax	; lexer_210(D)->column, _123
; src/lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _124
	movq	-136(%rbp), %rax	; lexer, tmp423
	movq	24(%rax), %rdx	; lexer_210(D)->line, _125
	movq	COMMA_SYMBOL(%rip), %rax	; COMMA_SYMBOL, COMMA_SYMBOL.16_126
	movq	%rax, %rsi	; COMMA_SYMBOL.16_126,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L77:
; src/lexer.c:182:         else if (c == '!')
	cmpb	$33, -17(%rbp)	;, c
	jne	.L78	;,
; src/lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp424
	movq	32(%rax), %rax	; lexer_210(D)->column, _127
; src/lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _128
	movq	-136(%rbp), %rax	; lexer, tmp425
	movq	24(%rax), %rdx	; lexer_210(D)->line, _129
	movq	NOT_SYMBOL(%rip), %rax	; NOT_SYMBOL, NOT_SYMBOL.17_130
	movq	%rax, %rsi	; NOT_SYMBOL.17_130,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L78:
; src/lexer.c:184:         else if (c == '.')
	cmpb	$46, -17(%rbp)	;, c
	jne	.L79	;,
; src/lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp426
	movq	32(%rax), %rax	; lexer_210(D)->column, _131
; src/lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _132
	movq	-136(%rbp), %rax	; lexer, tmp427
	movq	24(%rax), %rdx	; lexer_210(D)->line, _133
	movq	DOT_SYMBOL(%rip), %rax	; DOT_SYMBOL, DOT_SYMBOL.18_134
	movq	%rax, %rsi	; DOT_SYMBOL.18_134,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L79:
; src/lexer.c:186:         else if (c == '[')
	cmpb	$91, -17(%rbp)	;, c
	jne	.L80	;,
; src/lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp428
	movq	32(%rax), %rax	; lexer_210(D)->column, _135
; src/lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _136
	movq	-136(%rbp), %rax	; lexer, tmp429
	movq	24(%rax), %rdx	; lexer_210(D)->line, _137
	movq	L_BRACKET_SYMBOL(%rip), %rax	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.19_138
	movq	%rax, %rsi	; L_BRACKET_SYMBOL.19_138,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L80:
; src/lexer.c:188:         else if (c == ']')
	cmpb	$93, -17(%rbp)	;, c
	jne	.L81	;,
; src/lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp430
	movq	32(%rax), %rax	; lexer_210(D)->column, _139
; src/lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _140
	movq	-136(%rbp), %rax	; lexer, tmp431
	movq	24(%rax), %rdx	; lexer_210(D)->line, _141
	movq	R_BRACKET_SYMBOL(%rip), %rax	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.20_142
	movq	%rax, %rsi	; R_BRACKET_SYMBOL.20_142,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L81:
; src/lexer.c:190:         else if (c == ';')
	cmpb	$59, -17(%rbp)	;, c
	jne	.L82	;,
; src/lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp432
	movq	32(%rax), %rax	; lexer_210(D)->column, _143
; src/lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _144
	movq	-136(%rbp), %rax	; lexer, tmp433
	movq	24(%rax), %rdx	; lexer_210(D)->line, _145
	movq	SEMICOLON_SYMBOL(%rip), %rax	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.21_146
	movq	%rax, %rsi	; SEMICOLON_SYMBOL.21_146,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L82:
; src/lexer.c:192:         else if (c == '_')
	cmpb	$95, -17(%rbp)	;, c
	jne	.L83	;,
; src/lexer.c:193:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp434
	movq	32(%rax), %rax	; lexer_210(D)->column, _147
; src/lexer.c:193:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _148
	movq	-136(%rbp), %rax	; lexer, tmp435
	movq	24(%rax), %rdx	; lexer_210(D)->line, _149
	movq	UNDERLINE_SYMBOL(%rip), %rax	; UNDERLINE_SYMBOL, UNDERLINE_SYMBOL.22_150
	movq	%rax, %rsi	; UNDERLINE_SYMBOL.22_150,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L83:
; src/lexer.c:194:         else if (c == '+')
	cmpb	$43, -17(%rbp)	;, c
	jne	.L84	;,
; src/lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp436
	movq	32(%rax), %rax	; lexer_210(D)->column, _151
; src/lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _152
	movq	-136(%rbp), %rax	; lexer, tmp437
	movq	24(%rax), %rdx	; lexer_210(D)->line, _153
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, ADD_SYMBOL.23_154
	movq	%rax, %rsi	; ADD_SYMBOL.23_154,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L84:
; src/lexer.c:196:         else if (c == '-')
	cmpb	$45, -17(%rbp)	;, c
	jne	.L85	;,
; src/lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp438
	movq	32(%rax), %rax	; lexer_210(D)->column, _155
; src/lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _156
	movq	-136(%rbp), %rax	; lexer, tmp439
	movq	24(%rax), %rdx	; lexer_210(D)->line, _157
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, SUB_SYMBOL.24_158
	movq	%rax, %rsi	; SUB_SYMBOL.24_158,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L85:
; src/lexer.c:198:         else if (c == '*')
	cmpb	$42, -17(%rbp)	;, c
	jne	.L86	;,
; src/lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp440
	movq	32(%rax), %rax	; lexer_210(D)->column, _159
; src/lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _160
	movq	-136(%rbp), %rax	; lexer, tmp441
	movq	24(%rax), %rdx	; lexer_210(D)->line, _161
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, MUL_SYMBOL.25_162
	movq	%rax, %rsi	; MUL_SYMBOL.25_162,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L86:
; src/lexer.c:200:         else if (c == '/')
	cmpb	$47, -17(%rbp)	;, c
	jne	.L87	;,
; src/lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp442
	movq	32(%rax), %rax	; lexer_210(D)->column, _163
; src/lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _164
	movq	-136(%rbp), %rax	; lexer, tmp443
	movq	24(%rax), %rdx	; lexer_210(D)->line, _165
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, DIV_SYMBOL.26_166
	movq	%rax, %rsi	; DIV_SYMBOL.26_166,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L87:
; src/lexer.c:202:         else if (c == '%')
	cmpb	$37, -17(%rbp)	;, c
	jne	.L88	;,
; src/lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp444
	movq	32(%rax), %rax	; lexer_210(D)->column, _167
; src/lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _168
	movq	-136(%rbp), %rax	; lexer, tmp445
	movq	24(%rax), %rdx	; lexer_210(D)->line, _169
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, MOD_SYMBOL.27_170
	movq	%rax, %rsi	; MOD_SYMBOL.27_170,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L88:
; src/lexer.c:204:         else if (c == '<')
	cmpb	$60, -17(%rbp)	;, c
	jne	.L89	;,
; src/lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp446
	movq	32(%rax), %rax	; lexer_210(D)->column, _171
; src/lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _172
	movq	-136(%rbp), %rax	; lexer, tmp447
	movq	24(%rax), %rdx	; lexer_210(D)->line, _173
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, LT_SYMBOL.28_174
	movq	%rax, %rsi	; LT_SYMBOL.28_174,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L89:
; src/lexer.c:206:         else if (c == '>')
	cmpb	$62, -17(%rbp)	;, c
	jne	.L90	;,
; src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp448
	movq	32(%rax), %rax	; lexer_210(D)->column, _175
; src/lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _176
	movq	-136(%rbp), %rax	; lexer, tmp449
	movq	24(%rax), %rdx	; lexer_210(D)->line, _177
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, GT_SYMBOL.29_178
	movq	%rax, %rsi	; GT_SYMBOL.29_178,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L90:
; src/lexer.c:208:         else if (c == '=')
	cmpb	$61, -17(%rbp)	;, c
	jne	.L91	;,
; src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp450
	movq	32(%rax), %rax	; lexer_210(D)->column, _179
; src/lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _180
	movq	-136(%rbp), %rax	; lexer, tmp451
	movq	24(%rax), %rdx	; lexer_210(D)->line, _181
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.30_182
	movq	%rax, %rsi	; ASSIGN_SYMBOL.30_182,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L91:
; src/lexer.c:211:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp452
	movq	32(%rax), %rax	; lexer_210(D)->column, _183
; src/lexer.c:211:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rdx	;, _184
	movq	-136(%rbp), %rax	; lexer, tmp453
	movq	24(%rax), %rax	; lexer_210(D)->line, _185
	movq	%rax, %rsi	; _185,
	leaq	.LC6(%rip), %rax	;, tmp454
	movq	%rax, %rdi	; tmp454,
	call	lexer_error	;
; src/lexer.c:212:             return create_token(EOF_TOKEN, NULL, 0, 0);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
.L19:
; src/lexer.c:215: }
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	next_token, .-next_token
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; lexer, lexer
	movl	%esi, %eax	; skip_comment, tmp90
	movb	%al, -28(%rbp)	; tmp91, skip_comment
; src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	movq	-24(%rbp), %rax	; lexer, tmp92
	movq	40(%rax), %rax	; lexer_10(D)->peeked_token, _1
; src/lexer.c:218:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	; _1
	je	.L94	;,
; src/lexer.c:219:         lexer->current_token = lexer->peeked_token;
	movq	-24(%rbp), %rax	; lexer, tmp93
	movq	40(%rax), %rdx	; lexer_10(D)->peeked_token, _2
; src/lexer.c:219:         lexer->current_token = lexer->peeked_token;
	movq	-24(%rbp), %rax	; lexer, tmp94
	movq	%rdx, 72(%rax)	; _2, lexer_10(D)->current_token
; src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	-24(%rbp), %rax	; lexer, tmp95
	movq	48(%rax), %rdx	; lexer_10(D)->peeked_position, _3
; src/lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	-24(%rbp), %rax	; lexer, tmp96
	movq	%rdx, 8(%rax)	; _3, lexer_10(D)->position
; src/lexer.c:221:         lexer->line = lexer->peeked_line;
	movq	-24(%rbp), %rax	; lexer, tmp97
	movq	56(%rax), %rdx	; lexer_10(D)->peeked_line, _4
; src/lexer.c:221:         lexer->line = lexer->peeked_line;
	movq	-24(%rbp), %rax	; lexer, tmp98
	movq	%rdx, 24(%rax)	; _4, lexer_10(D)->line
; src/lexer.c:222:         lexer->column = lexer->peeked_column;
	movq	-24(%rbp), %rax	; lexer, tmp99
	movq	64(%rax), %rdx	; lexer_10(D)->peeked_column, _5
; src/lexer.c:222:         lexer->column = lexer->peeked_column;
	movq	-24(%rbp), %rax	; lexer, tmp100
	movq	%rdx, 32(%rax)	; _5, lexer_10(D)->column
; src/lexer.c:223:         lexer->peeked_token = 0;
	movq	-24(%rbp), %rax	; lexer, tmp101
	movq	$0, 40(%rax)	;, lexer_10(D)->peeked_token
; src/lexer.c:224:         return lexer->current_token;
	movq	-24(%rbp), %rax	; lexer, tmp102
	movq	72(%rax), %rax	; lexer_10(D)->current_token, _7
	jmp	.L95	;
.L94:
; src/lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	-28(%rbp), %edx	; skip_comment, _6
	movq	-24(%rbp), %rax	; lexer, tmp103
	movl	%edx, %esi	; _6,
	movq	%rax, %rdi	; tmp103,
	call	next_token	;
	movq	%rax, -8(%rbp)	; tmp104, token
; src/lexer.c:227:     return lexer->current_token = token;
	movq	-24(%rbp), %rax	; lexer, tmp105
	movq	-8(%rbp), %rdx	; token, tmp106
	movq	%rdx, 72(%rax)	; tmp106, lexer_10(D)->current_token
	movq	-24(%rbp), %rax	; lexer, tmp107
	movq	72(%rax), %rax	; lexer_10(D)->current_token, _7
.L95:
; src/lexer.c:228: }
	leave	
	ret	
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; lexer, lexer
	movl	%esi, %eax	; skip_comment, tmp89
	movb	%al, -44(%rbp)	; tmp90, skip_comment
; src/lexer.c:231:     if (lexer->peeked_token != NULL)
	movq	-40(%rbp), %rax	; lexer, tmp91
	movq	40(%rax), %rax	; lexer_9(D)->peeked_token, _1
; src/lexer.c:231:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; _1
	je	.L97	;,
; src/lexer.c:232:         return lexer->peeked_token;
	movq	-40(%rbp), %rax	; lexer, tmp92
	movq	40(%rax), %rax	; lexer_9(D)->peeked_token, _6
	jmp	.L98	;
.L97:
; src/lexer.c:233:     size_t saved_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp93
	movq	8(%rax), %rax	; lexer_9(D)->position, tmp94
	movq	%rax, -8(%rbp)	; tmp94, saved_position
; src/lexer.c:234:     size_t saved_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp95
	movq	24(%rax), %rax	; lexer_9(D)->line, tmp96
	movq	%rax, -16(%rbp)	; tmp96, saved_line
; src/lexer.c:235:     size_t saved_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp97
	movq	32(%rax), %rax	; lexer_9(D)->column, tmp98
	movq	%rax, -24(%rbp)	; tmp98, saved_column
; src/lexer.c:236:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	-44(%rbp), %edx	; skip_comment, _2
	movq	-40(%rbp), %rax	; lexer, tmp99
	movl	%edx, %esi	; _2,
	movq	%rax, %rdi	; tmp99,
	call	get_next_token	;
	movq	%rax, -32(%rbp)	; tmp100, token
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp101
	movq	8(%rax), %rdx	; lexer_9(D)->position, _3
; src/lexer.c:237:     lexer->peeked_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp102
	movq	%rdx, 48(%rax)	; _3, lexer_9(D)->peeked_position
; src/lexer.c:238:     lexer->peeked_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp103
	movq	24(%rax), %rdx	; lexer_9(D)->line, _4
; src/lexer.c:238:     lexer->peeked_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp104
	movq	%rdx, 56(%rax)	; _4, lexer_9(D)->peeked_line
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp105
	movq	32(%rax), %rdx	; lexer_9(D)->column, _5
; src/lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp106
	movq	%rdx, 64(%rax)	; _5, lexer_9(D)->peeked_column
; src/lexer.c:240:     lexer->position = saved_position;
	movq	-40(%rbp), %rax	; lexer, tmp107
	movq	-8(%rbp), %rdx	; saved_position, tmp108
	movq	%rdx, 8(%rax)	; tmp108, lexer_9(D)->position
; src/lexer.c:241:     lexer->line = saved_line;
	movq	-40(%rbp), %rax	; lexer, tmp109
	movq	-16(%rbp), %rdx	; saved_line, tmp110
	movq	%rdx, 24(%rax)	; tmp110, lexer_9(D)->line
; src/lexer.c:242:     lexer->column = saved_column;
	movq	-40(%rbp), %rax	; lexer, tmp111
	movq	-24(%rbp), %rdx	; saved_column, tmp112
	movq	%rdx, 32(%rax)	; tmp112, lexer_9(D)->column
; src/lexer.c:243:     lexer->peeked_token = token;
	movq	-40(%rbp), %rax	; lexer, tmp113
	movq	-32(%rbp), %rdx	; token, tmp114
	movq	%rdx, 40(%rax)	; tmp114, lexer_9(D)->peeked_token
; src/lexer.c:244:     return token;
	movq	-32(%rbp), %rax	; token, _6
.L98:
; src/lexer.c:245: }
	leave	
	ret	
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:248:     return lexer->current_token;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	72(%rax), %rax	; lexer_2(D)->current_token, _3
; src/lexer.c:249: }
	popq	%rbp	;
	ret	
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:252:     lexer->position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp82
	movq	$0, 8(%rax)	;, lexer_2(D)->position
; src/lexer.c:253:     lexer->line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp83
	movq	$0, 24(%rax)	;, lexer_2(D)->line
; src/lexer.c:254:     lexer->column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	$0, 32(%rax)	;, lexer_2(D)->column
; src/lexer.c:255:     lexer->peeked_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp85
	movq	$0, 40(%rax)	;, lexer_2(D)->peeked_token
; src/lexer.c:256:     lexer->peeked_position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp86
	movq	$0, 48(%rax)	;, lexer_2(D)->peeked_position
; src/lexer.c:257:     lexer->peeked_line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp87
	movq	$0, 56(%rax)	;, lexer_2(D)->peeked_line
; src/lexer.c:258:     lexer->peeked_column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp88
	movq	$0, 64(%rax)	;, lexer_2(D)->peeked_column
; src/lexer.c:259:     lexer->current_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp89
	movq	$0, 72(%rax)	;, lexer_2(D)->current_token
; src/lexer.c:260: }
	nop	
	popq	%rbp	;
	ret	
	.size	reset_lexer, .-reset_lexer
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_token"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

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
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; source, source
	movq	%rsi, -32(%rbp)	; length, length
	movq	%rdx, -40(%rbp)	; filename, filename
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, lexer
; src/lexer.c:5:     lexer->source = source;
	movq	-8(%rbp), %rax	; lexer, tmp85
	movq	-24(%rbp), %rdx	; source, tmp86
	movq	%rdx, 8(%rax)	; tmp86, lexer_3->source
; src/lexer.c:6:     lexer->position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp87
	movq	$0, 16(%rax)	;, lexer_3->position
; src/lexer.c:7:     lexer->length = length;
	movq	-8(%rbp), %rax	; lexer, tmp88
	movq	-32(%rbp), %rdx	; length, tmp89
	movq	%rdx, 24(%rax)	; tmp89, lexer_3->length
; src/lexer.c:8:     lexer->line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp90
	movq	$0, 32(%rax)	;, lexer_3->line
; src/lexer.c:9:     lexer->column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp91
	movq	$0, 40(%rax)	;, lexer_3->column
; src/lexer.c:10:     lexer->peeked_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp92
	movq	$0, 48(%rax)	;, lexer_3->peeked_token
; src/lexer.c:11:     lexer->peeked_position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp93
	movq	$0, 56(%rax)	;, lexer_3->peeked_position
; src/lexer.c:12:     lexer->peeked_line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp94
	movq	$0, 64(%rax)	;, lexer_3->peeked_line
; src/lexer.c:13:     lexer->peeked_column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp95
	movq	$0, 72(%rax)	;, lexer_3->peeked_column
; src/lexer.c:14:     lexer->current_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp96
	movq	$0, 80(%rax)	;, lexer_3->current_token
; src/lexer.c:15:     lexer->filename = filename;
	movq	-8(%rbp), %rax	; lexer, tmp97
	movq	-40(%rbp), %rdx	; filename, tmp98
	movq	%rdx, (%rax)	; tmp98, lexer_3->filename
; src/lexer.c:16:     return lexer;
	movq	-8(%rbp), %rax	; lexer, _18
; src/lexer.c:17: }
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
; src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, token
; src/lexer.c:21:     token->type = type;
	movq	-8(%rbp), %rax	; token, tmp85
	movl	-20(%rbp), %edx	; type, tmp86
	movl	%edx, 24(%rax)	; tmp86, token_3->type
; src/lexer.c:22:     token->lexeme = lexeme;
	movq	-8(%rbp), %rax	; token, tmp87
	movq	-32(%rbp), %rdx	; lexeme, tmp88
	movq	%rdx, (%rax)	; tmp88, token_3->lexeme
; src/lexer.c:23:     token->line = line;
	movq	-8(%rbp), %rax	; token, tmp89
	movq	-40(%rbp), %rdx	; line, tmp90
	movq	%rdx, 8(%rax)	; tmp90, token_3->line
; src/lexer.c:24:     token->column = column;
	movq	-8(%rbp), %rax	; token, tmp91
	movq	-48(%rbp), %rdx	; column, tmp92
	movq	%rdx, 16(%rax)	; tmp92, token_3->column
; src/lexer.c:25:     return token;
	movq	-8(%rbp), %rax	; token, _12
; src/lexer.c:26: }
	leave	
	ret	
	.size	create_token, .-create_token
	.section	.rodata
	.align 8
.LC0:
	.string	"[Lexer Error] at %s:%zu:%zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; message, message
	movq	%rsi, -16(%rbp)	; line, line
	movq	%rdx, -24(%rbp)	; column, column
	movq	%rcx, -32(%rbp)	; filename, filename
; src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	movq	-24(%rbp), %rax	; column, tmp85
	leaq	1(%rax), %rdi	;, _1
	movq	-16(%rbp), %rax	; line, tmp86
	leaq	1(%rax), %rcx	;, _2
	movq	stderr(%rip), %rax	; stderr, stderr.0_3
	movq	-8(%rbp), %rsi	; message, tmp87
	movq	-32(%rbp), %rdx	; filename, tmp88
	movq	%rsi, %r9	; tmp87,
	movq	%rdi, %r8	; _1,
	leaq	.LC0(%rip), %rsi	;, tmp89
	movq	%rax, %rdi	; stderr.0_3,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/lexer.c:30: }
	nop	
	leave	
	ret	
	.size	lexer_error, .-lexer_error
	.type	get_current_char, @function
get_current_char:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp92
	movq	16(%rax), %rdx	; lexer_13(D)->position, _1
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp93
	movq	24(%rax), %rax	; lexer_13(D)->length, _2
; src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	; _2, _1
	jb	.L7	;,
; src/lexer.c:34:         return '\0';
	movl	$0, %eax	;, _10
	jmp	.L8	;
.L7:
; src/lexer.c:35:     lexer->column++;
	movq	-8(%rbp), %rax	; lexer, tmp94
	movq	40(%rax), %rax	; lexer_13(D)->column, _3
; src/lexer.c:35:     lexer->column++;
	leaq	1(%rax), %rdx	;, _4
	movq	-8(%rbp), %rax	; lexer, tmp95
	movq	%rdx, 40(%rax)	; _4, lexer_13(D)->column
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	-8(%rbp), %rax	; lexer, tmp96
	movq	8(%rax), %rsi	; lexer_13(D)->source, _5
; src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	-8(%rbp), %rax	; lexer, tmp97
	movq	16(%rax), %rax	; lexer_13(D)->position, _6
; src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	;, _8
	movq	-8(%rbp), %rdx	; lexer, tmp98
	movq	%rcx, 16(%rdx)	; _8, lexer_13(D)->position
; src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	%rsi, %rax	; _5, _9
	movzbl	(%rax), %eax	; *_9, _10
.L8:
; src/lexer.c:37: }
	popq	%rbp	;
	ret	
	.size	get_current_char, .-get_current_char
	.type	peek_next_char, @function
peek_next_char:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp89
	movq	16(%rax), %rdx	; lexer_8(D)->position, _1
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	-8(%rbp), %rax	; lexer, tmp90
	movq	24(%rax), %rax	; lexer_8(D)->length, _2
; src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	; _2, _1
	jb	.L10	;,
; src/lexer.c:41:         return '\0';
	movl	$0, %eax	;, _6
	jmp	.L11	;
.L10:
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	-8(%rbp), %rax	; lexer, tmp91
	movq	8(%rax), %rdx	; lexer_8(D)->source, _3
; src/lexer.c:42:     return lexer->source[lexer->position];
	movq	-8(%rbp), %rax	; lexer, tmp92
	movq	16(%rax), %rax	; lexer_8(D)->position, _4
; src/lexer.c:42:     return lexer->source[lexer->position];
	addq	%rdx, %rax	; _3, _5
	movzbl	(%rax), %eax	; *_5, _6
.L11:
; src/lexer.c:43: }
	popq	%rbp	;
	ret	
	.size	peek_next_char, .-peek_next_char
	.type	newline, @function
newline:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:46:     lexer->line++;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	32(%rax), %rax	; lexer_4(D)->line, _1
; src/lexer.c:46:     lexer->line++;
	leaq	1(%rax), %rdx	;, _2
	movq	-8(%rbp), %rax	; lexer, tmp85
	movq	%rdx, 32(%rax)	; _2, lexer_4(D)->line
; src/lexer.c:47:     lexer->column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp86
	movq	$0, 40(%rax)	;, lexer_4(D)->column
; src/lexer.c:48: }
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
; src/lexer.c:51:     if (count >= 0) {
	cmpl	$0, -12(%rbp)	;, count
	js	.L14	;,
; src/lexer.c:52:         lexer->position += (size_t)count;
	movq	-8(%rbp), %rax	; lexer, tmp96
	movq	16(%rax), %rdx	; lexer_18(D)->position, _1
; src/lexer.c:52:         lexer->position += (size_t)count;
	movl	-12(%rbp), %eax	; count, tmp97
	cltq
; src/lexer.c:52:         lexer->position += (size_t)count;
	addq	%rax, %rdx	; _2, _3
	movq	-8(%rbp), %rax	; lexer, tmp98
	movq	%rdx, 16(%rax)	; _3, lexer_18(D)->position
; src/lexer.c:53:         lexer->column += (size_t)count;
	movq	-8(%rbp), %rax	; lexer, tmp99
	movq	40(%rax), %rdx	; lexer_18(D)->column, _4
; src/lexer.c:53:         lexer->column += (size_t)count;
	movl	-12(%rbp), %eax	; count, tmp100
	cltq
; src/lexer.c:53:         lexer->column += (size_t)count;
	addq	%rax, %rdx	; _5, _6
	movq	-8(%rbp), %rax	; lexer, tmp101
	movq	%rdx, 40(%rax)	; _6, lexer_18(D)->column
; src/lexer.c:58: }
	jmp	.L16	;
.L14:
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	-8(%rbp), %rax	; lexer, tmp102
	movq	16(%rax), %rdx	; lexer_18(D)->position, _7
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movl	-12(%rbp), %eax	; count, tmp103
	negl	%eax	; _8
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	cltq
; src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	%rax, %rdx	; _9, _10
	movq	-8(%rbp), %rax	; lexer, tmp104
	movq	%rdx, 16(%rax)	; _10, lexer_18(D)->position
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	-8(%rbp), %rax	; lexer, tmp105
	movq	40(%rax), %rdx	; lexer_18(D)->column, _11
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movl	-12(%rbp), %eax	; count, tmp106
	negl	%eax	; _12
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	cltq
; src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	%rax, %rdx	; _13, _14
	movq	-8(%rbp), %rax	; lexer, tmp107
	movq	%rdx, 40(%rax)	; _14, lexer_18(D)->column
.L16:
; src/lexer.c:58: }
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
	movl	%esi, %eax	; skip_comment, tmp272
	movb	%al, -140(%rbp)	; tmp273, skip_comment
; src/lexer.c:61:     char c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp274
	movq	%rax, %rdi	; tmp274,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp275, c
; src/lexer.c:62:     if (c == '\0')
	cmpb	$0, -17(%rbp)	;, c
	jne	.L18	;,
; src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	-136(%rbp), %rax	; lexer, tmp276
	movq	40(%rax), %rdx	; lexer_213(D)->column, _1
	movq	-136(%rbp), %rax	; lexer, tmp277
	movq	32(%rax), %rax	; lexer_213(D)->line, _2
	movq	%rdx, %rcx	; _1,
	movq	%rax, %rdx	; _2,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L18:
; src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$32, -17(%rbp)	;, c
	je	.L20	;,
; src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, -17(%rbp)	;, c
	je	.L20	;,
; src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$13, -17(%rbp)	;, c
	jne	.L21	;,
.L20:
; src/lexer.c:65:         return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _3
	movq	-136(%rbp), %rax	; lexer, tmp278
	movl	%edx, %esi	; _3,
	movq	%rax, %rdi	; tmp278,
	call	next_token	;
	jmp	.L19	;
.L21:
; src/lexer.c:66:     else if (c == '\n') {
	cmpb	$10, -17(%rbp)	;, c
	jne	.L22	;,
; src/lexer.c:67:         newline(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp279
	movq	%rax, %rdi	; tmp279,
	call	newline	;
; src/lexer.c:68:         return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _4
	movq	-136(%rbp), %rax	; lexer, tmp280
	movl	%edx, %esi	; _4,
	movq	%rax, %rdi	; tmp280,
	call	next_token	;
	jmp	.L19	;
.L22:
; src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$96, -17(%rbp)	;, c
	jle	.L23	;,
; src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$122, -17(%rbp)	;, c
	jle	.L24	;,
.L23:
; src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$64, -17(%rbp)	;, c
	jle	.L25	;,
; src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$90, -17(%rbp)	;, c
	jle	.L24	;,
.L25:
; src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$95, -17(%rbp)	;, c
	jne	.L26	;,
.L24:
; src/lexer.c:70:         size_t start = lexer->position - 1;
	movq	-136(%rbp), %rax	; lexer, tmp281
	movq	16(%rax), %rax	; lexer_213(D)->position, _5
; src/lexer.c:70:         size_t start = lexer->position - 1;
	subq	$1, %rax	;, tmp282
	movq	%rax, -112(%rbp)	; tmp282, start
; src/lexer.c:71:         size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp283
	movq	40(%rax), %rax	; lexer_213(D)->column, _6
; src/lexer.c:71:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp284
	movq	%rax, -120(%rbp)	; tmp284, column_start
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L27	;
.L29:
; src/lexer.c:73:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp285
	movq	%rax, %rdi	; tmp285,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp286, c
.L27:
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$96, -17(%rbp)	;, c
	jle	.L28	;,
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$122, -17(%rbp)	;, c
	jle	.L29	;,
.L28:
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$64, -17(%rbp)	;, c
	jle	.L30	;,
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$90, -17(%rbp)	;, c
	jle	.L29	;,
.L30:
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$47, -17(%rbp)	;, c
	jle	.L31	;,
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$57, -17(%rbp)	;, c
	jle	.L29	;,
.L31:
; src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$95, -17(%rbp)	;, c
	je	.L29	;,
; src/lexer.c:74:         move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp287
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp287,
	call	move_position	;
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-136(%rbp), %rax	; lexer, tmp288
	movq	16(%rax), %rax	; lexer_213(D)->position, _7
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	-112(%rbp), %rax	; start, _8
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-136(%rbp), %rdx	; lexer, tmp289
	movq	8(%rdx), %rcx	; lexer_213(D)->source, _9
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-112(%rbp), %rdx	; start, tmp290
	addq	%rcx, %rdx	; _9, _10
; src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	; _8,
	movq	%rdx, %rdi	; _10,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, -128(%rbp)	; tmp291, content
; src/lexer.c:76:         if (is_keyword(content))
	movq	-128(%rbp), %rax	; content, tmp292
	movq	%rax, %rdi	; tmp292,
	call	*is_keyword@GOTPCREL(%rip)	;
; src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	; _11
	je	.L32	;,
; src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp293
	movq	32(%rax), %rdx	; lexer_213(D)->line, _12
	movq	-120(%rbp), %rcx	; column_start, tmp294
	movq	-128(%rbp), %rax	; content, tmp295
	movq	%rax, %rsi	; tmp295,
	movl	$6, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L32:
; src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp296
	movq	32(%rax), %rdx	; lexer_213(D)->line, _13
	movq	-120(%rbp), %rcx	; column_start, tmp297
	movq	-128(%rbp), %rax	; content, tmp298
	movq	%rax, %rsi	; tmp298,
	movl	$1, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L26:
; src/lexer.c:80:     } else if ('0' <= c && c <= '9') {
	cmpb	$47, -17(%rbp)	;, c
	jle	.L33	;,
; src/lexer.c:80:     } else if ('0' <= c && c <= '9') {
	cmpb	$57, -17(%rbp)	;, c
	jg	.L33	;,
; src/lexer.c:81:         size_t start = lexer->position - 1;
	movq	-136(%rbp), %rax	; lexer, tmp299
	movq	16(%rax), %rax	; lexer_213(D)->position, _14
; src/lexer.c:81:         size_t start = lexer->position - 1;
	subq	$1, %rax	;, tmp300
	movq	%rax, -40(%rbp)	; tmp300, start
; src/lexer.c:82:         size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp301
	movq	40(%rax), %rax	; lexer_213(D)->column, _15
; src/lexer.c:82:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp302
	movq	%rax, -48(%rbp)	; tmp302, column_start
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	jmp	.L34	;
.L36:
; src/lexer.c:84:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp303
	movq	%rax, %rdi	; tmp303,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp304, c
.L34:
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	;, c
	jle	.L35	;,
; src/lexer.c:83:         while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	;, c
	jle	.L36	;,
.L35:
; src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, -24(%rbp)	;, type
; src/lexer.c:86:         char p = peek_next_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp305
	movq	%rax, %rdi	; tmp305,
	call	peek_next_char	;
	movb	%al, -49(%rbp)	; tmp306, p
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, -17(%rbp)	;, c
	jne	.L37	;,
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$47, -49(%rbp)	;, p
	jle	.L37	;,
; src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$57, -49(%rbp)	;, p
	jg	.L37	;,
; src/lexer.c:88:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp307
	movq	%rax, %rdi	; tmp307,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp308, c
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	jmp	.L38	;
.L40:
; src/lexer.c:90:                 c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp309
	movq	%rax, %rdi	; tmp309,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp310, c
.L38:
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	;, c
	jle	.L39	;,
; src/lexer.c:89:             while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	;, c
	jle	.L40	;,
.L39:
; src/lexer.c:91:             type = FLOAT;
	movl	$3, -24(%rbp)	;, type
.L37:
; src/lexer.c:93:         move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp311
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp311,
	call	move_position	;
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp312
	movq	32(%rax), %rbx	; lexer_213(D)->line, _16
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp313
	movq	16(%rax), %rax	; lexer_213(D)->position, _17
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-40(%rbp), %rax	; start, _18
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rdx	; lexer, tmp314
	movq	8(%rdx), %rcx	; lexer_213(D)->source, _19
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-40(%rbp), %rdx	; start, tmp315
	addq	%rcx, %rdx	; _19, _20
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _18,
	movq	%rdx, %rdi	; _20,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _21
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-48(%rbp), %rdx	; column_start, tmp316
	movl	-24(%rbp), %eax	; type, tmp317
	movq	%rdx, %rcx	; tmp316,
	movq	%rbx, %rdx	; _16,
	movl	%eax, %edi	; tmp317,
	call	create_token	;
; src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L33:
; src/lexer.c:95:     } else if (c == '"') {
	cmpb	$34, -17(%rbp)	;, c
	jne	.L41	;,
; src/lexer.c:96:         size_t start = lexer->position;
	movq	-136(%rbp), %rax	; lexer, tmp318
	movq	16(%rax), %rax	; lexer_213(D)->position, tmp319
	movq	%rax, -96(%rbp)	; tmp319, start
; src/lexer.c:97:         size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp320
	movq	40(%rax), %rax	; lexer_213(D)->column, _22
; src/lexer.c:97:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp321
	movq	%rax, -104(%rbp)	; tmp321, column_start
; src/lexer.c:98:         c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp322
	movq	%rax, %rdi	; tmp322,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp323, c
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L42	;
.L44:
; src/lexer.c:100:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp324
	movq	%rax, %rdi	; tmp324,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp325, c
.L42:
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, -17(%rbp)	;, c
	je	.L43	;,
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$0, -17(%rbp)	;, c
	je	.L43	;,
; src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$10, -17(%rbp)	;, c
	jne	.L44	;,
.L43:
; src/lexer.c:101:         if (c != '"') {
	cmpb	$34, -17(%rbp)	;, c
	je	.L45	;,
; src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	-136(%rbp), %rax	; lexer, tmp326
	movq	(%rax), %rdx	; lexer_213(D)->filename, _23
	movq	-96(%rbp), %rax	; start, tmp327
	leaq	-1(%rax), %rsi	;, _24
	movq	-136(%rbp), %rax	; lexer, tmp328
	movq	32(%rax), %rax	; lexer_213(D)->line, _25
	movq	%rdx, %rcx	; _23,
	movq	%rsi, %rdx	; _24,
	movq	%rax, %rsi	; _25,
	leaq	.LC1(%rip), %rax	;, tmp329
	movq	%rax, %rdi	; tmp329,
	call	lexer_error	;
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	;, c
	jne	.L45	;,
; src/lexer.c:103:             if (c == '\n') newline(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp330
	movq	%rax, %rdi	; tmp330,
	call	newline	;
.L45:
; src/lexer.c:105:         if (lexer->position - start == 1)
	movq	-136(%rbp), %rax	; lexer, tmp331
	movq	16(%rax), %rax	; lexer_213(D)->position, _26
; src/lexer.c:105:         if (lexer->position - start == 1)
	subq	-96(%rbp), %rax	; start, _27
; src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rax	;, _27
	jne	.L46	;,
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp332
	movq	32(%rax), %rbx	; lexer_213(D)->line, _28
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp333
	movq	%rax, %rdi	; tmp333,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _29
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	-104(%rbp), %rax	; column_start, tmp334
	movq	%rax, %rcx	; tmp334,
	movq	%rbx, %rdx	; _28,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	jmp	.L19	;
.L46:
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp335
	movq	32(%rax), %rbx	; lexer_213(D)->line, _30
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp336
	movq	16(%rax), %rax	; lexer_213(D)->position, _31
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-96(%rbp), %rax	; start, _32
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	;, _33
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp337
	movq	8(%rax), %rcx	; lexer_213(D)->source, _34
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-96(%rbp), %rax	; start, tmp338
	addq	%rcx, %rax	; _34, _35
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdx, %rsi	; _33,
	movq	%rax, %rdi	; _35,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _36
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-104(%rbp), %rax	; column_start, tmp339
	movq	%rax, %rcx	; tmp339,
	movq	%rbx, %rdx	; _30,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	;
.L41:
; src/lexer.c:109:         char p = peek_next_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp340
	movq	%rax, %rdi	; tmp340,
	call	peek_next_char	;
	movb	%al, -25(%rbp)	; tmp341, p
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, -17(%rbp)	;, c
	jne	.L47	;,
; src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, -25(%rbp)	;, p
	jne	.L47	;,
; src/lexer.c:111:             size_t start = lexer->position + 1;
	movq	-136(%rbp), %rax	; lexer, tmp342
	movq	16(%rax), %rax	; lexer_213(D)->position, _37
; src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$1, %rax	;, tmp343
	movq	%rax, -64(%rbp)	; tmp343, start
; src/lexer.c:112:             size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp344
	movq	40(%rax), %rax	; lexer_213(D)->column, _38
; src/lexer.c:112:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp345
	movq	%rax, -72(%rbp)	; tmp345, column_start
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	jmp	.L48	;
.L50:
; src/lexer.c:114:                 c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp346
	movq	%rax, %rdi	; tmp346,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp347, c
.L48:
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, -17(%rbp)	;, c
	je	.L49	;,
; src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$0, -17(%rbp)	;, c
	jne	.L50	;,
.L49:
; src/lexer.c:115:             move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp348
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp348,
	call	move_position	;
; src/lexer.c:116:             if (skip_comment)
	cmpb	$0, -140(%rbp)	;, skip_comment
	je	.L51	;,
; src/lexer.c:117:                 return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _39
	movq	-136(%rbp), %rax	; lexer, tmp349
	movl	%edx, %esi	; _39,
	movq	%rax, %rdi	; tmp349,
	call	next_token	;
	jmp	.L19	;
.L51:
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp350
	movq	32(%rax), %rbx	; lexer_213(D)->line, _40
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp351
	movq	16(%rax), %rax	; lexer_213(D)->position, _41
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-64(%rbp), %rax	; start, _42
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rdx	; lexer, tmp352
	movq	8(%rdx), %rcx	; lexer_213(D)->source, _43
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-64(%rbp), %rdx	; start, tmp353
	addq	%rcx, %rdx	; _43, _44
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _42,
	movq	%rdx, %rdi	; _44,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _45
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-72(%rbp), %rax	; column_start, tmp354
	movq	%rax, %rcx	; tmp354,
	movq	%rbx, %rdx	; _40,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L47:
; src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$47, -17(%rbp)	;, c
	jne	.L52	;,
; src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, -25(%rbp)	;, p
	jne	.L52	;,
; src/lexer.c:120:             size_t start = lexer->position + 1;
	movq	-136(%rbp), %rax	; lexer, tmp355
	movq	16(%rax), %rax	; lexer_213(D)->position, _46
; src/lexer.c:120:             size_t start = lexer->position + 1;
	addq	$1, %rax	;, tmp356
	movq	%rax, -80(%rbp)	; tmp356, start
; src/lexer.c:121:             size_t column_start = lexer->column - 1;
	movq	-136(%rbp), %rax	; lexer, tmp357
	movq	40(%rax), %rax	; lexer_213(D)->column, _47
; src/lexer.c:121:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp358
	movq	%rax, -88(%rbp)	; tmp358, column_start
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	jmp	.L53	;
.L57:
; src/lexer.c:123:                 c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp359
	movq	%rax, %rdi	; tmp359,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp360, c
; src/lexer.c:124:                 p = peek_next_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp361
	movq	%rax, %rdi	; tmp361,
	call	peek_next_char	;
	movb	%al, -25(%rbp)	; tmp362, p
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	;, c
	jne	.L54	;,
; src/lexer.c:125:                 if (c == '\n') newline(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp363
	movq	%rax, %rdi	; tmp363,
	call	newline	;
.L54:
; src/lexer.c:126:                 if (p == '\0') break;
	cmpb	$0, -25(%rbp)	;, p
	je	.L92	;,
; src/lexer.c:127:                 assert(c != '\0');
	cmpb	$0, -17(%rbp)	;, c
	jne	.L53	;,
; src/lexer.c:127:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax	;, tmp364
	movq	%rax, %rcx	; tmp364,
	movl	$127, %edx	;,
	leaq	.LC3(%rip), %rax	;, tmp365
	movq	%rax, %rsi	; tmp365,
	leaq	.LC4(%rip), %rax	;, tmp366
	movq	%rax, %rdi	; tmp366,
	call	*__assert_fail@GOTPCREL(%rip)	;
.L53:
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, -17(%rbp)	;, c
	jne	.L57	;,
; src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$47, -25(%rbp)	;, p
	jne	.L57	;,
	jmp	.L56	;
.L92:
; src/lexer.c:126:                 if (p == '\0') break;
	nop	
.L56:
; src/lexer.c:129:             if (p == '\0') {
	cmpb	$0, -25(%rbp)	;, p
	jne	.L58	;,
; src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	cmpb	$0, -17(%rbp)	;, c
	jne	.L59	;,
; src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	movq	-136(%rbp), %rax	; lexer, tmp367
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp367,
	call	move_position	;
.L59:
; src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	-136(%rbp), %rax	; lexer, tmp368
	movq	(%rax), %rcx	; lexer_213(D)->filename, _48
	movq	-136(%rbp), %rax	; lexer, tmp369
	movq	32(%rax), %rax	; lexer_213(D)->line, _49
	movq	-80(%rbp), %rdx	; start, tmp370
	movq	%rax, %rsi	; _49,
	leaq	.LC5(%rip), %rax	;, tmp371
	movq	%rax, %rdi	; tmp371,
	call	lexer_error	;
; src/lexer.c:132:                 if (skip_comment)
	cmpb	$0, -140(%rbp)	;, skip_comment
	je	.L60	;,
; src/lexer.c:133:                     return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _50
	movq	-136(%rbp), %rax	; lexer, tmp372
	movl	%edx, %esi	; _50,
	movq	%rax, %rdi	; tmp372,
	call	next_token	;
	jmp	.L19	;
.L60:
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp373
	movq	32(%rax), %rbx	; lexer_213(D)->line, _51
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp374
	movq	16(%rax), %rax	; lexer_213(D)->position, _52
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-80(%rbp), %rax	; start, _53
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-136(%rbp), %rdx	; lexer, tmp375
	movq	8(%rdx), %rcx	; lexer_213(D)->source, _54
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-80(%rbp), %rdx	; start, tmp376
	addq	%rcx, %rdx	; _54, _55
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _53,
	movq	%rdx, %rdi	; _55,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _56
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-88(%rbp), %rax	; column_start, tmp377
	movq	%rax, %rcx	; tmp377,
	movq	%rbx, %rdx	; _51,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L58:
; src/lexer.c:136:             c = get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp378
	movq	%rax, %rdi	; tmp378,
	call	get_current_char	;
	movb	%al, -17(%rbp)	; tmp379, c
; src/lexer.c:137:             if (skip_comment)
	cmpb	$0, -140(%rbp)	;, skip_comment
	je	.L61	;,
; src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	-140(%rbp), %edx	; skip_comment, _57
	movq	-136(%rbp), %rax	; lexer, tmp380
	movl	%edx, %esi	; _57,
	movq	%rax, %rdi	; tmp380,
	call	next_token	;
	jmp	.L19	;
.L61:
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp381
	movq	32(%rax), %rbx	; lexer_213(D)->line, _58
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp382
	movq	16(%rax), %rax	; lexer_213(D)->position, _59
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	-80(%rbp), %rax	; start, _60
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	;, _61
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-136(%rbp), %rax	; lexer, tmp383
	movq	8(%rax), %rcx	; lexer_213(D)->source, _62
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-80(%rbp), %rax	; start, tmp384
	addq	%rcx, %rax	; _62, _63
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rdx, %rsi	; _61,
	movq	%rax, %rdi	; _63,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _64
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-88(%rbp), %rax	; column_start, tmp385
	movq	%rax, %rcx	; tmp385,
	movq	%rbx, %rdx	; _58,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L19	;
.L52:
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, -17(%rbp)	;, c
	jne	.L62	;,
; src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L62	;,
; src/lexer.c:141:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp386
	movq	%rax, %rdi	; tmp386,
	call	get_current_char	;
; src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp387
	movq	40(%rax), %rax	; lexer_213(D)->column, _65
; src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _66
	movq	-136(%rbp), %rax	; lexer, tmp388
	movq	32(%rax), %rdx	; lexer_213(D)->line, _67
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, EQ_SYMBOL.1_68
	movq	%rax, %rsi	; EQ_SYMBOL.1_68,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L62:
; src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, -17(%rbp)	;, c
	jne	.L63	;,
; src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L63	;,
; src/lexer.c:144:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp389
	movq	%rax, %rdi	; tmp389,
	call	get_current_char	;
; src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp390
	movq	40(%rax), %rax	; lexer_213(D)->column, _69
; src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _70
	movq	-136(%rbp), %rax	; lexer, tmp391
	movq	32(%rax), %rdx	; lexer_213(D)->line, _71
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, NE_SYMBOL.2_72
	movq	%rax, %rsi	; NE_SYMBOL.2_72,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L63:
; src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, -17(%rbp)	;, c
	jne	.L64	;,
; src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L64	;,
; src/lexer.c:147:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp392
	movq	%rax, %rdi	; tmp392,
	call	get_current_char	;
; src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp393
	movq	40(%rax), %rax	; lexer_213(D)->column, _73
; src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _74
	movq	-136(%rbp), %rax	; lexer, tmp394
	movq	32(%rax), %rdx	; lexer_213(D)->line, _75
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, LE_SYMBOL.3_76
	movq	%rax, %rsi	; LE_SYMBOL.3_76,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L64:
; src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, -17(%rbp)	;, c
	jne	.L65	;,
; src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L65	;,
; src/lexer.c:150:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp395
	movq	%rax, %rdi	; tmp395,
	call	get_current_char	;
; src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp396
	movq	40(%rax), %rax	; lexer_213(D)->column, _77
; src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _78
	movq	-136(%rbp), %rax	; lexer, tmp397
	movq	32(%rax), %rdx	; lexer_213(D)->line, _79
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, GE_SYMBOL.4_80
	movq	%rax, %rsi	; GE_SYMBOL.4_80,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L65:
; src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, -17(%rbp)	;, c
	jne	.L66	;,
; src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L66	;,
; src/lexer.c:153:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp398
	movq	%rax, %rdi	; tmp398,
	call	get_current_char	;
; src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp399
	movq	40(%rax), %rax	; lexer_213(D)->column, _81
; src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _82
	movq	-136(%rbp), %rax	; lexer, tmp400
	movq	32(%rax), %rdx	; lexer_213(D)->line, _83
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.5_84
	movq	%rax, %rsi	; ADD_ASSIGN_SYMBOL.5_84,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L66:
; src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, -17(%rbp)	;, c
	jne	.L67	;,
; src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L67	;,
; src/lexer.c:156:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp401
	movq	%rax, %rdi	; tmp401,
	call	get_current_char	;
; src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp402
	movq	40(%rax), %rax	; lexer_213(D)->column, _85
; src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _86
	movq	-136(%rbp), %rax	; lexer, tmp403
	movq	32(%rax), %rdx	; lexer_213(D)->line, _87
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.6_88
	movq	%rax, %rsi	; SUB_ASSIGN_SYMBOL.6_88,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L67:
; src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, -17(%rbp)	;, c
	jne	.L68	;,
; src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L68	;,
; src/lexer.c:159:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp404
	movq	%rax, %rdi	; tmp404,
	call	get_current_char	;
; src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp405
	movq	40(%rax), %rax	; lexer_213(D)->column, _89
; src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _90
	movq	-136(%rbp), %rax	; lexer, tmp406
	movq	32(%rax), %rdx	; lexer_213(D)->line, _91
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.7_92
	movq	%rax, %rsi	; MUL_ASSIGN_SYMBOL.7_92,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L68:
; src/lexer.c:161:         } else if (c == '/' && p == '=') {
	cmpb	$47, -17(%rbp)	;, c
	jne	.L69	;,
; src/lexer.c:161:         } else if (c == '/' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L69	;,
; src/lexer.c:162:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp407
	movq	%rax, %rdi	; tmp407,
	call	get_current_char	;
; src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp408
	movq	40(%rax), %rax	; lexer_213(D)->column, _93
; src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _94
	movq	-136(%rbp), %rax	; lexer, tmp409
	movq	32(%rax), %rdx	; lexer_213(D)->line, _95
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.8_96
	movq	%rax, %rsi	; DIV_ASSIGN_SYMBOL.8_96,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L69:
; src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, -17(%rbp)	;, c
	jne	.L70	;,
; src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$61, -25(%rbp)	;, p
	jne	.L70	;,
; src/lexer.c:165:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp410
	movq	%rax, %rdi	; tmp410,
	call	get_current_char	;
; src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp411
	movq	40(%rax), %rax	; lexer_213(D)->column, _97
; src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _98
	movq	-136(%rbp), %rax	; lexer, tmp412
	movq	32(%rax), %rdx	; lexer_213(D)->line, _99
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.9_100
	movq	%rax, %rsi	; MOD_ASSIGN_SYMBOL.9_100,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L70:
; src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, -17(%rbp)	;, c
	jne	.L71	;,
; src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, -25(%rbp)	;, p
	jne	.L71	;,
; src/lexer.c:168:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp413
	movq	%rax, %rdi	; tmp413,
	call	get_current_char	;
; src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp414
	movq	40(%rax), %rax	; lexer_213(D)->column, _101
; src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _102
	movq	-136(%rbp), %rax	; lexer, tmp415
	movq	32(%rax), %rdx	; lexer_213(D)->line, _103
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, AND_SYMBOL.10_104
	movq	%rax, %rsi	; AND_SYMBOL.10_104,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L71:
; src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, -17(%rbp)	;, c
	jne	.L72	;,
; src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, -25(%rbp)	;, p
	jne	.L72	;,
; src/lexer.c:171:             get_current_char(lexer);
	movq	-136(%rbp), %rax	; lexer, tmp416
	movq	%rax, %rdi	; tmp416,
	call	get_current_char	;
; src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	-136(%rbp), %rax	; lexer, tmp417
	movq	40(%rax), %rax	; lexer_213(D)->column, _105
; src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _106
	movq	-136(%rbp), %rax	; lexer, tmp418
	movq	32(%rax), %rdx	; lexer_213(D)->line, _107
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, OR_SYMBOL.11_108
	movq	%rax, %rsi	; OR_SYMBOL.11_108,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L72:
; src/lexer.c:173:         } else if (c == '(')
	cmpb	$40, -17(%rbp)	;, c
	jne	.L73	;,
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp419
	movq	40(%rax), %rax	; lexer_213(D)->column, _109
; src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _110
	movq	-136(%rbp), %rax	; lexer, tmp420
	movq	32(%rax), %rdx	; lexer_213(D)->line, _111
	movq	L_PAREN_SYMBOL(%rip), %rax	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.12_112
	movq	%rax, %rsi	; L_PAREN_SYMBOL.12_112,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L73:
; src/lexer.c:175:         else if (c == ')')
	cmpb	$41, -17(%rbp)	;, c
	jne	.L74	;,
; src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp421
	movq	40(%rax), %rax	; lexer_213(D)->column, _113
; src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _114
	movq	-136(%rbp), %rax	; lexer, tmp422
	movq	32(%rax), %rdx	; lexer_213(D)->line, _115
	movq	R_PAREN_SYMBOL(%rip), %rax	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.13_116
	movq	%rax, %rsi	; R_PAREN_SYMBOL.13_116,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L74:
; src/lexer.c:177:         else if (c == '{')
	cmpb	$123, -17(%rbp)	;, c
	jne	.L75	;,
; src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp423
	movq	40(%rax), %rax	; lexer_213(D)->column, _117
; src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _118
	movq	-136(%rbp), %rax	; lexer, tmp424
	movq	32(%rax), %rdx	; lexer_213(D)->line, _119
	movq	L_BRACE_SYMBOL(%rip), %rax	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.14_120
	movq	%rax, %rsi	; L_BRACE_SYMBOL.14_120,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L75:
; src/lexer.c:179:         else if (c == '}')
	cmpb	$125, -17(%rbp)	;, c
	jne	.L76	;,
; src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp425
	movq	40(%rax), %rax	; lexer_213(D)->column, _121
; src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _122
	movq	-136(%rbp), %rax	; lexer, tmp426
	movq	32(%rax), %rdx	; lexer_213(D)->line, _123
	movq	R_BRACE_SYMBOL(%rip), %rax	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.15_124
	movq	%rax, %rsi	; R_BRACE_SYMBOL.15_124,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L76:
; src/lexer.c:181:         else if (c == ',')
	cmpb	$44, -17(%rbp)	;, c
	jne	.L77	;,
; src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp427
	movq	40(%rax), %rax	; lexer_213(D)->column, _125
; src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _126
	movq	-136(%rbp), %rax	; lexer, tmp428
	movq	32(%rax), %rdx	; lexer_213(D)->line, _127
	movq	COMMA_SYMBOL(%rip), %rax	; COMMA_SYMBOL, COMMA_SYMBOL.16_128
	movq	%rax, %rsi	; COMMA_SYMBOL.16_128,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L77:
; src/lexer.c:183:         else if (c == '!')
	cmpb	$33, -17(%rbp)	;, c
	jne	.L78	;,
; src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp429
	movq	40(%rax), %rax	; lexer_213(D)->column, _129
; src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _130
	movq	-136(%rbp), %rax	; lexer, tmp430
	movq	32(%rax), %rdx	; lexer_213(D)->line, _131
	movq	NOT_SYMBOL(%rip), %rax	; NOT_SYMBOL, NOT_SYMBOL.17_132
	movq	%rax, %rsi	; NOT_SYMBOL.17_132,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L78:
; src/lexer.c:185:         else if (c == '.')
	cmpb	$46, -17(%rbp)	;, c
	jne	.L79	;,
; src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp431
	movq	40(%rax), %rax	; lexer_213(D)->column, _133
; src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _134
	movq	-136(%rbp), %rax	; lexer, tmp432
	movq	32(%rax), %rdx	; lexer_213(D)->line, _135
	movq	DOT_SYMBOL(%rip), %rax	; DOT_SYMBOL, DOT_SYMBOL.18_136
	movq	%rax, %rsi	; DOT_SYMBOL.18_136,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L79:
; src/lexer.c:187:         else if (c == '[')
	cmpb	$91, -17(%rbp)	;, c
	jne	.L80	;,
; src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp433
	movq	40(%rax), %rax	; lexer_213(D)->column, _137
; src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _138
	movq	-136(%rbp), %rax	; lexer, tmp434
	movq	32(%rax), %rdx	; lexer_213(D)->line, _139
	movq	L_BRACKET_SYMBOL(%rip), %rax	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.19_140
	movq	%rax, %rsi	; L_BRACKET_SYMBOL.19_140,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L80:
; src/lexer.c:189:         else if (c == ']')
	cmpb	$93, -17(%rbp)	;, c
	jne	.L81	;,
; src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp435
	movq	40(%rax), %rax	; lexer_213(D)->column, _141
; src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _142
	movq	-136(%rbp), %rax	; lexer, tmp436
	movq	32(%rax), %rdx	; lexer_213(D)->line, _143
	movq	R_BRACKET_SYMBOL(%rip), %rax	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.20_144
	movq	%rax, %rsi	; R_BRACKET_SYMBOL.20_144,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L81:
; src/lexer.c:191:         else if (c == ';')
	cmpb	$59, -17(%rbp)	;, c
	jne	.L82	;,
; src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp437
	movq	40(%rax), %rax	; lexer_213(D)->column, _145
; src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _146
	movq	-136(%rbp), %rax	; lexer, tmp438
	movq	32(%rax), %rdx	; lexer_213(D)->line, _147
	movq	SEMICOLON_SYMBOL(%rip), %rax	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.21_148
	movq	%rax, %rsi	; SEMICOLON_SYMBOL.21_148,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L82:
; src/lexer.c:193:         else if (c == '_')
	cmpb	$95, -17(%rbp)	;, c
	jne	.L83	;,
; src/lexer.c:194:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp439
	movq	40(%rax), %rax	; lexer_213(D)->column, _149
; src/lexer.c:194:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _150
	movq	-136(%rbp), %rax	; lexer, tmp440
	movq	32(%rax), %rdx	; lexer_213(D)->line, _151
	movq	UNDERLINE_SYMBOL(%rip), %rax	; UNDERLINE_SYMBOL, UNDERLINE_SYMBOL.22_152
	movq	%rax, %rsi	; UNDERLINE_SYMBOL.22_152,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L83:
; src/lexer.c:195:         else if (c == '+')
	cmpb	$43, -17(%rbp)	;, c
	jne	.L84	;,
; src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp441
	movq	40(%rax), %rax	; lexer_213(D)->column, _153
; src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _154
	movq	-136(%rbp), %rax	; lexer, tmp442
	movq	32(%rax), %rdx	; lexer_213(D)->line, _155
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, ADD_SYMBOL.23_156
	movq	%rax, %rsi	; ADD_SYMBOL.23_156,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L84:
; src/lexer.c:197:         else if (c == '-')
	cmpb	$45, -17(%rbp)	;, c
	jne	.L85	;,
; src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp443
	movq	40(%rax), %rax	; lexer_213(D)->column, _157
; src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _158
	movq	-136(%rbp), %rax	; lexer, tmp444
	movq	32(%rax), %rdx	; lexer_213(D)->line, _159
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, SUB_SYMBOL.24_160
	movq	%rax, %rsi	; SUB_SYMBOL.24_160,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L85:
; src/lexer.c:199:         else if (c == '*')
	cmpb	$42, -17(%rbp)	;, c
	jne	.L86	;,
; src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp445
	movq	40(%rax), %rax	; lexer_213(D)->column, _161
; src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _162
	movq	-136(%rbp), %rax	; lexer, tmp446
	movq	32(%rax), %rdx	; lexer_213(D)->line, _163
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, MUL_SYMBOL.25_164
	movq	%rax, %rsi	; MUL_SYMBOL.25_164,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L86:
; src/lexer.c:201:         else if (c == '/')
	cmpb	$47, -17(%rbp)	;, c
	jne	.L87	;,
; src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp447
	movq	40(%rax), %rax	; lexer_213(D)->column, _165
; src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _166
	movq	-136(%rbp), %rax	; lexer, tmp448
	movq	32(%rax), %rdx	; lexer_213(D)->line, _167
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, DIV_SYMBOL.26_168
	movq	%rax, %rsi	; DIV_SYMBOL.26_168,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L87:
; src/lexer.c:203:         else if (c == '%')
	cmpb	$37, -17(%rbp)	;, c
	jne	.L88	;,
; src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp449
	movq	40(%rax), %rax	; lexer_213(D)->column, _169
; src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _170
	movq	-136(%rbp), %rax	; lexer, tmp450
	movq	32(%rax), %rdx	; lexer_213(D)->line, _171
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, MOD_SYMBOL.27_172
	movq	%rax, %rsi	; MOD_SYMBOL.27_172,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L88:
; src/lexer.c:205:         else if (c == '<')
	cmpb	$60, -17(%rbp)	;, c
	jne	.L89	;,
; src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp451
	movq	40(%rax), %rax	; lexer_213(D)->column, _173
; src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _174
	movq	-136(%rbp), %rax	; lexer, tmp452
	movq	32(%rax), %rdx	; lexer_213(D)->line, _175
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, LT_SYMBOL.28_176
	movq	%rax, %rsi	; LT_SYMBOL.28_176,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L89:
; src/lexer.c:207:         else if (c == '>')
	cmpb	$62, -17(%rbp)	;, c
	jne	.L90	;,
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp453
	movq	40(%rax), %rax	; lexer_213(D)->column, _177
; src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _178
	movq	-136(%rbp), %rax	; lexer, tmp454
	movq	32(%rax), %rdx	; lexer_213(D)->line, _179
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, GT_SYMBOL.29_180
	movq	%rax, %rsi	; GT_SYMBOL.29_180,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L90:
; src/lexer.c:209:         else if (c == '=')
	cmpb	$61, -17(%rbp)	;, c
	jne	.L91	;,
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-136(%rbp), %rax	; lexer, tmp455
	movq	40(%rax), %rax	; lexer_213(D)->column, _181
; src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _182
	movq	-136(%rbp), %rax	; lexer, tmp456
	movq	32(%rax), %rdx	; lexer_213(D)->line, _183
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.30_184
	movq	%rax, %rsi	; ASSIGN_SYMBOL.30_184,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L91:
; src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	-136(%rbp), %rax	; lexer, tmp457
	movq	(%rax), %rdx	; lexer_213(D)->filename, _185
; src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	-136(%rbp), %rax	; lexer, tmp458
	movq	40(%rax), %rax	; lexer_213(D)->column, _186
; src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	leaq	-1(%rax), %rsi	;, _187
	movq	-136(%rbp), %rax	; lexer, tmp459
	movq	32(%rax), %rax	; lexer_213(D)->line, _188
	movq	%rdx, %rcx	; _185,
	movq	%rsi, %rdx	; _187,
	movq	%rax, %rsi	; _188,
	leaq	.LC6(%rip), %rax	;, tmp460
	movq	%rax, %rdi	; tmp460,
	call	lexer_error	;
; src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
.L19:
; src/lexer.c:216: }
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
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	-24(%rbp), %rax	; lexer, tmp92
	movq	48(%rax), %rax	; lexer_10(D)->peeked_token, _1
; src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	; _1
	je	.L94	;,
; src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	-24(%rbp), %rax	; lexer, tmp93
	movq	48(%rax), %rdx	; lexer_10(D)->peeked_token, _2
; src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	-24(%rbp), %rax	; lexer, tmp94
	movq	%rdx, 80(%rax)	; _2, lexer_10(D)->current_token
; src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	-24(%rbp), %rax	; lexer, tmp95
	movq	56(%rax), %rdx	; lexer_10(D)->peeked_position, _3
; src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	-24(%rbp), %rax	; lexer, tmp96
	movq	%rdx, 16(%rax)	; _3, lexer_10(D)->position
; src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	-24(%rbp), %rax	; lexer, tmp97
	movq	64(%rax), %rdx	; lexer_10(D)->peeked_line, _4
; src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	-24(%rbp), %rax	; lexer, tmp98
	movq	%rdx, 32(%rax)	; _4, lexer_10(D)->line
; src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	-24(%rbp), %rax	; lexer, tmp99
	movq	72(%rax), %rdx	; lexer_10(D)->peeked_column, _5
; src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	-24(%rbp), %rax	; lexer, tmp100
	movq	%rdx, 40(%rax)	; _5, lexer_10(D)->column
; src/lexer.c:224:         lexer->peeked_token = 0;
	movq	-24(%rbp), %rax	; lexer, tmp101
	movq	$0, 48(%rax)	;, lexer_10(D)->peeked_token
; src/lexer.c:225:         return lexer->current_token;
	movq	-24(%rbp), %rax	; lexer, tmp102
	movq	80(%rax), %rax	; lexer_10(D)->current_token, _7
	jmp	.L95	;
.L94:
; src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	-28(%rbp), %edx	; skip_comment, _6
	movq	-24(%rbp), %rax	; lexer, tmp103
	movl	%edx, %esi	; _6,
	movq	%rax, %rdi	; tmp103,
	call	next_token	;
	movq	%rax, -8(%rbp)	; tmp104, token
; src/lexer.c:228:     return lexer->current_token = token;
	movq	-24(%rbp), %rax	; lexer, tmp105
	movq	-8(%rbp), %rdx	; token, tmp106
	movq	%rdx, 80(%rax)	; tmp106, lexer_10(D)->current_token
	movq	-24(%rbp), %rax	; lexer, tmp107
	movq	80(%rax), %rax	; lexer_10(D)->current_token, _7
.L95:
; src/lexer.c:229: }
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
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	-40(%rbp), %rax	; lexer, tmp91
	movq	48(%rax), %rax	; lexer_9(D)->peeked_token, _1
; src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	; _1
	je	.L97	;,
; src/lexer.c:233:         return lexer->peeked_token;
	movq	-40(%rbp), %rax	; lexer, tmp92
	movq	48(%rax), %rax	; lexer_9(D)->peeked_token, _6
	jmp	.L98	;
.L97:
; src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp93
	movq	16(%rax), %rax	; lexer_9(D)->position, tmp94
	movq	%rax, -8(%rbp)	; tmp94, saved_position
; src/lexer.c:235:     size_t saved_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp95
	movq	32(%rax), %rax	; lexer_9(D)->line, tmp96
	movq	%rax, -16(%rbp)	; tmp96, saved_line
; src/lexer.c:236:     size_t saved_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp97
	movq	40(%rax), %rax	; lexer_9(D)->column, tmp98
	movq	%rax, -24(%rbp)	; tmp98, saved_column
; src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	-44(%rbp), %edx	; skip_comment, _2
	movq	-40(%rbp), %rax	; lexer, tmp99
	movl	%edx, %esi	; _2,
	movq	%rax, %rdi	; tmp99,
	call	get_next_token	;
	movq	%rax, -32(%rbp)	; tmp100, token
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp101
	movq	16(%rax), %rdx	; lexer_9(D)->position, _3
; src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp102
	movq	%rdx, 56(%rax)	; _3, lexer_9(D)->peeked_position
; src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp103
	movq	32(%rax), %rdx	; lexer_9(D)->line, _4
; src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp104
	movq	%rdx, 64(%rax)	; _4, lexer_9(D)->peeked_line
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp105
	movq	40(%rax), %rdx	; lexer_9(D)->column, _5
; src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp106
	movq	%rdx, 72(%rax)	; _5, lexer_9(D)->peeked_column
; src/lexer.c:241:     lexer->position = saved_position;
	movq	-40(%rbp), %rax	; lexer, tmp107
	movq	-8(%rbp), %rdx	; saved_position, tmp108
	movq	%rdx, 16(%rax)	; tmp108, lexer_9(D)->position
; src/lexer.c:242:     lexer->line = saved_line;
	movq	-40(%rbp), %rax	; lexer, tmp109
	movq	-16(%rbp), %rdx	; saved_line, tmp110
	movq	%rdx, 32(%rax)	; tmp110, lexer_9(D)->line
; src/lexer.c:243:     lexer->column = saved_column;
	movq	-40(%rbp), %rax	; lexer, tmp111
	movq	-24(%rbp), %rdx	; saved_column, tmp112
	movq	%rdx, 40(%rax)	; tmp112, lexer_9(D)->column
; src/lexer.c:244:     lexer->peeked_token = token;
	movq	-40(%rbp), %rax	; lexer, tmp113
	movq	-32(%rbp), %rdx	; token, tmp114
	movq	%rdx, 48(%rax)	; tmp114, lexer_9(D)->peeked_token
; src/lexer.c:245:     return token;
	movq	-32(%rbp), %rax	; token, _6
.L98:
; src/lexer.c:246: }
	leave	
	ret	
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:249:     return lexer->current_token;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	80(%rax), %rax	; lexer_2(D)->current_token, _3
; src/lexer.c:250: }
	popq	%rbp	;
	ret	
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:253:     lexer->position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp82
	movq	$0, 16(%rax)	;, lexer_2(D)->position
; src/lexer.c:254:     lexer->line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp83
	movq	$0, 32(%rax)	;, lexer_2(D)->line
; src/lexer.c:255:     lexer->column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	$0, 40(%rax)	;, lexer_2(D)->column
; src/lexer.c:256:     lexer->peeked_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp85
	movq	$0, 48(%rax)	;, lexer_2(D)->peeked_token
; src/lexer.c:257:     lexer->peeked_position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp86
	movq	$0, 56(%rax)	;, lexer_2(D)->peeked_position
; src/lexer.c:258:     lexer->peeked_line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp87
	movq	$0, 64(%rax)	;, lexer_2(D)->peeked_line
; src/lexer.c:259:     lexer->peeked_column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp88
	movq	$0, 72(%rax)	;, lexer_2(D)->peeked_column
; src/lexer.c:260:     lexer->current_token = NULL;
	movq	-8(%rbp), %rax	; lexer, tmp89
	movq	$0, 80(%rax)	;, lexer_2(D)->current_token
; src/lexer.c:261: }
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

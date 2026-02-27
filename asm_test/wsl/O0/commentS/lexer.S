	.file	"lexer.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	create_lexer
	.type	create_lexer, @function
create_lexer:
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; source, source
	movq	%rsi, -32(%rbp)	; length, length
; src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %edi	;,
	call	alloc_memory@PLT	;
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
; src/lexer.c:10:     lexer->peeked_token = 0;
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
; src/lexer.c:14:     lexer->current_token = 0;
	movq	-8(%rbp), %rax	; lexer, tmp96
	movq	$0, 72(%rax)	;, lexer_3->current_token
; src/lexer.c:15:     return lexer;
	movq	-8(%rbp), %rax	; lexer, _16
; src/lexer.c:16: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	create_lexer, .-create_lexer
	.type	create_token, @function
create_token:
.LFB7:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; lexeme, lexeme
	movq	%rdx, -40(%rbp)	; line, line
	movq	%rcx, -48(%rbp)	; column, column
; src/lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
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
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	create_token, .-create_token
	.section	.rodata
	.align 8
.LC0:
	.string	"Lexer Error at Line %zu, Column %zu: %s\n"
	.text
	.type	lexer_error, @function
lexer_error:
.LFB8:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
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
	call	fprintf@PLT	;
; src/lexer.c:29: }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	lexer_error, .-lexer_error
	.type	get_current_char, @function
get_current_char:
.LFB9:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
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
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	get_current_char, .-get_current_char
	.type	peek_next_char, @function
peek_next_char:
.LFB10:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
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
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	peek_next_char, .-peek_next_char
	.type	newline, @function
newline:
.LFB11:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
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
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	newline, .-newline
	.type	move_position, @function
move_position:
.LFB12:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
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
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	move_position, .-move_position
	.section	.rodata
.LC1:
	.string	"Unterminated string literal"
.LC2:
	.string	"src/lexer.c"
.LC3:
	.string	"c != '\\0'"
.LC4:
	.string	"Unterminated comment"
.LC5:
	.string	"Unexpected character"
	.text
	.type	next_token, @function
next_token:
.LFB13:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	pushq	%rbx	;
	subq	$120, %rsp	;,
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)	; lexer, lexer
	movl	%esi, %eax	; skip_comment, tmp272
	movb	%al, -124(%rbp)	; tmp273, skip_comment
; src/lexer.c:60:     char c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp274
	movq	%rax, %rdi	; tmp274,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp275, c
; src/lexer.c:61:     if (c == '\0')
	cmpb	$0, -111(%rbp)	;, c
	jne	.L18	;,
; src/lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	-120(%rbp), %rax	; lexer, tmp276
	movq	32(%rax), %rdx	; lexer_213(D)->column, _1
	movq	-120(%rbp), %rax	; lexer, tmp277
	movq	24(%rax), %rax	; lexer_213(D)->line, _2
	movq	%rdx, %rcx	; _1,
	movq	%rax, %rdx	; _2,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L18:
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$32, -111(%rbp)	;, c
	je	.L20	;,
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, -111(%rbp)	;, c
	je	.L20	;,
; src/lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$13, -111(%rbp)	;, c
	jne	.L21	;,
.L20:
; src/lexer.c:64:         return next_token(lexer, skip_comment);
	movsbl	-124(%rbp), %edx	; skip_comment, _3
	movq	-120(%rbp), %rax	; lexer, tmp278
	movl	%edx, %esi	; _3,
	movq	%rax, %rdi	; tmp278,
	call	next_token	;
	jmp	.L19	;
.L21:
; src/lexer.c:65:     else if (c == '\n') {
	cmpb	$10, -111(%rbp)	;, c
	jne	.L22	;,
; src/lexer.c:66:         newline(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp279
	movq	%rax, %rdi	; tmp279,
	call	newline	;
; src/lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	-124(%rbp), %edx	; skip_comment, _4
	movq	-120(%rbp), %rax	; lexer, tmp280
	movl	%edx, %esi	; _4,
	movq	%rax, %rdi	; tmp280,
	call	next_token	;
	jmp	.L19	;
.L22:
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$96, -111(%rbp)	;, c
	jle	.L23	;,
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$122, -111(%rbp)	;, c
	jle	.L24	;,
.L23:
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$64, -111(%rbp)	;, c
	jle	.L25	;,
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$90, -111(%rbp)	;, c
	jle	.L24	;,
.L25:
; src/lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$95, -111(%rbp)	;, c
	jne	.L26	;,
.L24:
; src/lexer.c:69:         size_t start = lexer->position - 1;
	movq	-120(%rbp), %rax	; lexer, tmp281
	movq	8(%rax), %rax	; lexer_213(D)->position, _5
; src/lexer.c:69:         size_t start = lexer->position - 1;
	subq	$1, %rax	;, tmp282
	movq	%rax, -40(%rbp)	; tmp282, start
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	-120(%rbp), %rax	; lexer, tmp283
	movq	32(%rax), %rax	; lexer_213(D)->column, _6
; src/lexer.c:70:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp284
	movq	%rax, -32(%rbp)	; tmp284, column_start
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L27	;
.L29:
; src/lexer.c:72:             c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp285
	movq	%rax, %rdi	; tmp285,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp286, c
.L27:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$96, -111(%rbp)	;, c
	jle	.L28	;,
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$122, -111(%rbp)	;, c
	jle	.L29	;,
.L28:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$64, -111(%rbp)	;, c
	jle	.L30	;,
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$90, -111(%rbp)	;, c
	jle	.L29	;,
.L30:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$47, -111(%rbp)	;, c
	jle	.L31	;,
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$57, -111(%rbp)	;, c
	jle	.L29	;,
.L31:
; src/lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$95, -111(%rbp)	;, c
	je	.L29	;,
; src/lexer.c:73:         move_position(lexer, -1);
	movq	-120(%rbp), %rax	; lexer, tmp287
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp287,
	call	move_position	;
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-120(%rbp), %rax	; lexer, tmp288
	movq	8(%rax), %rax	; lexer_213(D)->position, _7
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	-40(%rbp), %rax	; start, _8
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-120(%rbp), %rdx	; lexer, tmp289
	movq	(%rdx), %rcx	; lexer_213(D)->source, _9
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-40(%rbp), %rdx	; start, tmp290
	addq	%rcx, %rdx	; _9, _10
; src/lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rsi	; _8,
	movq	%rdx, %rdi	; _10,
	call	create_string@PLT	;
	movq	%rax, -24(%rbp)	; tmp291, content
; src/lexer.c:75:         if (is_keyword(content))
	movq	-24(%rbp), %rax	; content, tmp292
	movq	%rax, %rdi	; tmp292,
	call	is_keyword@PLT	;
; src/lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	; _11
	je	.L32	;,
; src/lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp293
	movq	24(%rax), %rdx	; lexer_213(D)->line, _12
	movq	-32(%rbp), %rcx	; column_start, tmp294
	movq	-24(%rbp), %rax	; content, tmp295
	movq	%rax, %rsi	; tmp295,
	movl	$6, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L32:
; src/lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp296
	movq	24(%rax), %rdx	; lexer_213(D)->line, _13
	movq	-32(%rbp), %rcx	; column_start, tmp297
	movq	-24(%rbp), %rax	; content, tmp298
	movq	%rax, %rsi	; tmp298,
	movl	$1, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L26:
; src/lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$47, -111(%rbp)	;, c
	jle	.L33	;,
; src/lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$57, -111(%rbp)	;, c
	jg	.L33	;,
; src/lexer.c:80:         size_t start = lexer->position - 1;
	movq	-120(%rbp), %rax	; lexer, tmp299
	movq	8(%rax), %rax	; lexer_213(D)->position, _14
; src/lexer.c:80:         size_t start = lexer->position - 1;
	subq	$1, %rax	;, tmp300
	movq	%rax, -104(%rbp)	; tmp300, start
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	-120(%rbp), %rax	; lexer, tmp301
	movq	32(%rax), %rax	; lexer_213(D)->column, _15
; src/lexer.c:81:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp302
	movq	%rax, -96(%rbp)	; tmp302, column_start
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	jmp	.L34	;
.L36:
; src/lexer.c:83:             c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp303
	movq	%rax, %rdi	; tmp303,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp304, c
.L34:
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$47, -111(%rbp)	;, c
	jle	.L35	;,
; src/lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$57, -111(%rbp)	;, c
	jle	.L36	;,
.L35:
; src/lexer.c:84:         TokenType type = INTEGER;
	movl	$2, -108(%rbp)	;, type
; src/lexer.c:85:         char p = peek_next_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp305
	movq	%rax, %rdi	; tmp305,
	call	peek_next_char	;
	movb	%al, -109(%rbp)	; tmp306, p
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, -111(%rbp)	;, c
	jne	.L37	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$47, -109(%rbp)	;, p
	jle	.L37	;,
; src/lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$57, -109(%rbp)	;, p
	jg	.L37	;,
; src/lexer.c:87:             c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp307
	movq	%rax, %rdi	; tmp307,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp308, c
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	jmp	.L38	;
.L40:
; src/lexer.c:89:                 c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp309
	movq	%rax, %rdi	; tmp309,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp310, c
.L38:
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$47, -111(%rbp)	;, c
	jle	.L39	;,
; src/lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$57, -111(%rbp)	;, c
	jle	.L40	;,
.L39:
; src/lexer.c:90:             type = FLOAT;
	movl	$3, -108(%rbp)	;, type
.L37:
; src/lexer.c:92:         move_position(lexer, -1);
	movq	-120(%rbp), %rax	; lexer, tmp311
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp311,
	call	move_position	;
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp312
	movq	24(%rax), %rbx	; lexer_213(D)->line, _16
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp313
	movq	8(%rax), %rax	; lexer_213(D)->position, _17
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-104(%rbp), %rax	; start, _18
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rdx	; lexer, tmp314
	movq	(%rdx), %rcx	; lexer_213(D)->source, _19
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-104(%rbp), %rdx	; start, tmp315
	addq	%rcx, %rdx	; _19, _20
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _18,
	movq	%rdx, %rdi	; _20,
	call	create_string@PLT	;
	movq	%rax, %rsi	;, _21
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-96(%rbp), %rdx	; column_start, tmp316
	movl	-108(%rbp), %eax	; type, tmp317
	movq	%rdx, %rcx	; tmp316,
	movq	%rbx, %rdx	; _16,
	movl	%eax, %edi	; tmp317,
	call	create_token	;
; src/lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L33:
; src/lexer.c:94:     } else if (c == '"') {
	cmpb	$34, -111(%rbp)	;, c
	jne	.L41	;,
; src/lexer.c:95:         size_t start = lexer->position;
	movq	-120(%rbp), %rax	; lexer, tmp318
	movq	8(%rax), %rax	; lexer_213(D)->position, tmp319
	movq	%rax, -56(%rbp)	; tmp319, start
; src/lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	-120(%rbp), %rax	; lexer, tmp320
	movq	32(%rax), %rax	; lexer_213(D)->column, _22
; src/lexer.c:96:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp321
	movq	%rax, -48(%rbp)	; tmp321, column_start
; src/lexer.c:97:         c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp322
	movq	%rax, %rdi	; tmp322,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp323, c
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L42	;
.L44:
; src/lexer.c:99:             c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp324
	movq	%rax, %rdi	; tmp324,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp325, c
.L42:
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, -111(%rbp)	;, c
	je	.L43	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$0, -111(%rbp)	;, c
	je	.L43	;,
; src/lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$10, -111(%rbp)	;, c
	jne	.L44	;,
.L43:
; src/lexer.c:100:         if (c != '"') {
	cmpb	$34, -111(%rbp)	;, c
	je	.L45	;,
; src/lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	movq	-56(%rbp), %rax	; start, tmp326
	leaq	-1(%rax), %rdx	;, _23
	movq	-120(%rbp), %rax	; lexer, tmp327
	movq	24(%rax), %rax	; lexer_213(D)->line, _24
	movq	%rax, %rsi	; _24,
	leaq	.LC1(%rip), %rax	;, tmp328
	movq	%rax, %rdi	; tmp328,
	call	lexer_error	;
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, -111(%rbp)	;, c
	jne	.L46	;,
; src/lexer.c:102:             if (c == '\n') newline(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp329
	movq	%rax, %rdi	; tmp329,
	call	newline	;
.L46:
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp330
	movq	24(%rax), %rbx	; lexer_213(D)->line, _25
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp331
	movq	8(%rax), %rax	; lexer_213(D)->position, _26
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-56(%rbp), %rax	; start, _27
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	;, _28
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp332
	movq	(%rax), %rcx	; lexer_213(D)->source, _29
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-56(%rbp), %rax	; start, tmp333
	addq	%rcx, %rax	; _29, _30
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdx, %rsi	; _28,
	movq	%rax, %rdi	; _30,
	call	create_string@PLT	;
	movq	%rax, %rsi	;, _31
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-48(%rbp), %rax	; column_start, tmp334
	movq	%rax, %rcx	; tmp334,
	movq	%rbx, %rdx	; _25,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	;
.L45:
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp335
	movq	24(%rax), %rbx	; lexer_213(D)->line, _32
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp336
	movq	8(%rax), %rax	; lexer_213(D)->position, _33
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-56(%rbp), %rax	; start, _34
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	;, _35
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp337
	movq	(%rax), %rcx	; lexer_213(D)->source, _36
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-56(%rbp), %rax	; start, tmp338
	addq	%rcx, %rax	; _36, _37
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rdx, %rsi	; _35,
	movq	%rax, %rdi	; _37,
	call	create_string@PLT	;
	movq	%rax, %rsi	;, _38
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-48(%rbp), %rax	; column_start, tmp339
	movq	%rax, %rcx	; tmp339,
	movq	%rbx, %rdx	; _32,
	movl	$4, %edi	;,
	call	create_token	;
; src/lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	;
.L41:
; src/lexer.c:107:         char p = peek_next_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp340
	movq	%rax, %rdi	; tmp340,
	call	peek_next_char	;
	movb	%al, -110(%rbp)	; tmp341, p
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, -111(%rbp)	;, c
	jne	.L47	;,
; src/lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, -110(%rbp)	;, p
	jne	.L47	;,
; src/lexer.c:109:             size_t start = lexer->position + 1;
	movq	-120(%rbp), %rax	; lexer, tmp342
	movq	8(%rax), %rax	; lexer_213(D)->position, _39
; src/lexer.c:109:             size_t start = lexer->position + 1;
	addq	$1, %rax	;, tmp343
	movq	%rax, -88(%rbp)	; tmp343, start
; src/lexer.c:110:             size_t column_start = lexer->column - 1;
	movq	-120(%rbp), %rax	; lexer, tmp344
	movq	32(%rax), %rax	; lexer_213(D)->column, _40
; src/lexer.c:110:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp345
	movq	%rax, -80(%rbp)	; tmp345, column_start
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	jmp	.L48	;
.L50:
; src/lexer.c:112:                 c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp346
	movq	%rax, %rdi	; tmp346,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp347, c
.L48:
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$10, -111(%rbp)	;, c
	je	.L49	;,
; src/lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$0, -111(%rbp)	;, c
	jne	.L50	;,
.L49:
; src/lexer.c:113:             move_position(lexer, -1);
	movq	-120(%rbp), %rax	; lexer, tmp348
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp348,
	call	move_position	;
; src/lexer.c:114:             if (skip_comment)
	cmpb	$0, -124(%rbp)	;, skip_comment
	je	.L51	;,
; src/lexer.c:115:                 return next_token(lexer, skip_comment);
	movsbl	-124(%rbp), %edx	; skip_comment, _41
	movq	-120(%rbp), %rax	; lexer, tmp349
	movl	%edx, %esi	; _41,
	movq	%rax, %rdi	; tmp349,
	call	next_token	;
	jmp	.L19	;
.L51:
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp350
	movq	24(%rax), %rbx	; lexer_213(D)->line, _42
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp351
	movq	8(%rax), %rax	; lexer_213(D)->position, _43
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-88(%rbp), %rax	; start, _44
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rdx	; lexer, tmp352
	movq	(%rdx), %rcx	; lexer_213(D)->source, _45
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-88(%rbp), %rdx	; start, tmp353
	addq	%rcx, %rdx	; _45, _46
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _44,
	movq	%rdx, %rdi	; _46,
	call	create_string@PLT	;
	movq	%rax, %rsi	;, _47
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-80(%rbp), %rax	; column_start, tmp354
	movq	%rax, %rcx	; tmp354,
	movq	%rbx, %rdx	; _42,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L47:
; src/lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$47, -111(%rbp)	;, c
	jne	.L52	;,
; src/lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, -110(%rbp)	;, p
	jne	.L52	;,
; src/lexer.c:118:             size_t start = lexer->position + 1;
	movq	-120(%rbp), %rax	; lexer, tmp355
	movq	8(%rax), %rax	; lexer_213(D)->position, _48
; src/lexer.c:118:             size_t start = lexer->position + 1;
	addq	$1, %rax	;, tmp356
	movq	%rax, -72(%rbp)	; tmp356, start
; src/lexer.c:119:             size_t column_start = lexer->column - 1;
	movq	-120(%rbp), %rax	; lexer, tmp357
	movq	32(%rax), %rax	; lexer_213(D)->column, _49
; src/lexer.c:119:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	;, tmp358
	movq	%rax, -64(%rbp)	; tmp358, column_start
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	jmp	.L53	;
.L57:
; src/lexer.c:121:                 c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp359
	movq	%rax, %rdi	; tmp359,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp360, c
; src/lexer.c:122:                 p = peek_next_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp361
	movq	%rax, %rdi	; tmp361,
	call	peek_next_char	;
	movb	%al, -110(%rbp)	; tmp362, p
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, -111(%rbp)	;, c
	jne	.L54	;,
; src/lexer.c:123:                 if (c == '\n') newline(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp363
	movq	%rax, %rdi	; tmp363,
	call	newline	;
.L54:
; src/lexer.c:124:                 if (p == '\0') break;
	cmpb	$0, -110(%rbp)	;, p
	je	.L92	;,
; src/lexer.c:125:                 assert(c != '\0');
	cmpb	$0, -111(%rbp)	;, c
	jne	.L53	;,
; src/lexer.c:125:                 assert(c != '\0');
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax	;, tmp364
	movq	%rax, %rcx	; tmp364,
	movl	$125, %edx	;,
	leaq	.LC2(%rip), %rax	;, tmp365
	movq	%rax, %rsi	; tmp365,
	leaq	.LC3(%rip), %rax	;, tmp366
	movq	%rax, %rdi	; tmp366,
	call	__assert_fail@PLT	;
.L53:
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, -111(%rbp)	;, c
	jne	.L57	;,
; src/lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$47, -110(%rbp)	;, p
	jne	.L57	;,
	jmp	.L56	;
.L92:
; src/lexer.c:124:                 if (p == '\0') break;
	nop	
.L56:
; src/lexer.c:127:             if (p == '\0') {
	cmpb	$0, -110(%rbp)	;, p
	jne	.L58	;,
; src/lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	cmpb	$0, -111(%rbp)	;, c
	jne	.L59	;,
; src/lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	movq	-120(%rbp), %rax	; lexer, tmp367
	movl	$-1, %esi	;,
	movq	%rax, %rdi	; tmp367,
	call	move_position	;
.L59:
; src/lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	-120(%rbp), %rax	; lexer, tmp368
	movq	24(%rax), %rax	; lexer_213(D)->line, _50
	movq	-72(%rbp), %rdx	; start, tmp369
	movq	%rax, %rsi	; _50,
	leaq	.LC4(%rip), %rax	;, tmp370
	movq	%rax, %rdi	; tmp370,
	call	lexer_error	;
; src/lexer.c:130:                 if (skip_comment)
	cmpb	$0, -124(%rbp)	;, skip_comment
	je	.L60	;,
; src/lexer.c:131:                     return next_token(lexer, skip_comment);
	movsbl	-124(%rbp), %edx	; skip_comment, _51
	movq	-120(%rbp), %rax	; lexer, tmp371
	movl	%edx, %esi	; _51,
	movq	%rax, %rdi	; tmp371,
	call	next_token	;
	jmp	.L19	;
.L60:
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp372
	movq	24(%rax), %rbx	; lexer_213(D)->line, _52
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp373
	movq	8(%rax), %rax	; lexer_213(D)->position, _53
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-72(%rbp), %rax	; start, _54
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-120(%rbp), %rdx	; lexer, tmp374
	movq	(%rdx), %rcx	; lexer_213(D)->source, _55
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-72(%rbp), %rdx	; start, tmp375
	addq	%rcx, %rdx	; _55, _56
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rsi	; _54,
	movq	%rdx, %rdi	; _56,
	call	create_string@PLT	;
	movq	%rax, %rsi	;, _57
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-64(%rbp), %rax	; column_start, tmp376
	movq	%rax, %rcx	; tmp376,
	movq	%rbx, %rdx	; _52,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	;
.L58:
; src/lexer.c:134:             c = get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp377
	movq	%rax, %rdi	; tmp377,
	call	get_current_char	;
	movb	%al, -111(%rbp)	; tmp378, c
; src/lexer.c:135:             if (skip_comment)
	cmpb	$0, -124(%rbp)	;, skip_comment
	je	.L61	;,
; src/lexer.c:136:                 return next_token(lexer, skip_comment);
	movsbl	-124(%rbp), %edx	; skip_comment, _58
	movq	-120(%rbp), %rax	; lexer, tmp379
	movl	%edx, %esi	; _58,
	movq	%rax, %rdi	; tmp379,
	call	next_token	;
	jmp	.L19	;
.L61:
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp380
	movq	24(%rax), %rbx	; lexer_213(D)->line, _59
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp381
	movq	8(%rax), %rax	; lexer_213(D)->position, _60
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	-72(%rbp), %rax	; start, _61
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	;, _62
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-120(%rbp), %rax	; lexer, tmp382
	movq	(%rax), %rcx	; lexer_213(D)->source, _63
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-72(%rbp), %rax	; start, tmp383
	addq	%rcx, %rax	; _63, _64
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rdx, %rsi	; _62,
	movq	%rax, %rdi	; _64,
	call	create_string@PLT	;
	movq	%rax, %rsi	;, _65
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-64(%rbp), %rax	; column_start, tmp384
	movq	%rax, %rcx	; tmp384,
	movq	%rbx, %rdx	; _59,
	movl	$7, %edi	;,
	call	create_token	;
; src/lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L19	;
.L52:
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, -111(%rbp)	;, c
	jne	.L62	;,
; src/lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L62	;,
; src/lexer.c:139:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp385
	movq	%rax, %rdi	; tmp385,
	call	get_current_char	;
; src/lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp386
	movq	32(%rax), %rax	; lexer_213(D)->column, _66
; src/lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _67
	movq	-120(%rbp), %rax	; lexer, tmp387
	movq	24(%rax), %rdx	; lexer_213(D)->line, _68
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, EQ_SYMBOL.1_69
	movq	%rax, %rsi	; EQ_SYMBOL.1_69,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L62:
; src/lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, -111(%rbp)	;, c
	jne	.L63	;,
; src/lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L63	;,
; src/lexer.c:142:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp388
	movq	%rax, %rdi	; tmp388,
	call	get_current_char	;
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp389
	movq	32(%rax), %rax	; lexer_213(D)->column, _70
; src/lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _71
	movq	-120(%rbp), %rax	; lexer, tmp390
	movq	24(%rax), %rdx	; lexer_213(D)->line, _72
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, NE_SYMBOL.2_73
	movq	%rax, %rsi	; NE_SYMBOL.2_73,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L63:
; src/lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, -111(%rbp)	;, c
	jne	.L64	;,
; src/lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L64	;,
; src/lexer.c:145:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp391
	movq	%rax, %rdi	; tmp391,
	call	get_current_char	;
; src/lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp392
	movq	32(%rax), %rax	; lexer_213(D)->column, _74
; src/lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _75
	movq	-120(%rbp), %rax	; lexer, tmp393
	movq	24(%rax), %rdx	; lexer_213(D)->line, _76
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, LE_SYMBOL.3_77
	movq	%rax, %rsi	; LE_SYMBOL.3_77,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L64:
; src/lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, -111(%rbp)	;, c
	jne	.L65	;,
; src/lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L65	;,
; src/lexer.c:148:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp394
	movq	%rax, %rdi	; tmp394,
	call	get_current_char	;
; src/lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp395
	movq	32(%rax), %rax	; lexer_213(D)->column, _78
; src/lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _79
	movq	-120(%rbp), %rax	; lexer, tmp396
	movq	24(%rax), %rdx	; lexer_213(D)->line, _80
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, GE_SYMBOL.4_81
	movq	%rax, %rsi	; GE_SYMBOL.4_81,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L65:
; src/lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, -111(%rbp)	;, c
	jne	.L66	;,
; src/lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L66	;,
; src/lexer.c:151:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp397
	movq	%rax, %rdi	; tmp397,
	call	get_current_char	;
; src/lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp398
	movq	32(%rax), %rax	; lexer_213(D)->column, _82
; src/lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _83
	movq	-120(%rbp), %rax	; lexer, tmp399
	movq	24(%rax), %rdx	; lexer_213(D)->line, _84
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.5_85
	movq	%rax, %rsi	; ADD_ASSIGN_SYMBOL.5_85,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L66:
; src/lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, -111(%rbp)	;, c
	jne	.L67	;,
; src/lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L67	;,
; src/lexer.c:154:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp400
	movq	%rax, %rdi	; tmp400,
	call	get_current_char	;
; src/lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp401
	movq	32(%rax), %rax	; lexer_213(D)->column, _86
; src/lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _87
	movq	-120(%rbp), %rax	; lexer, tmp402
	movq	24(%rax), %rdx	; lexer_213(D)->line, _88
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.6_89
	movq	%rax, %rsi	; SUB_ASSIGN_SYMBOL.6_89,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L67:
; src/lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, -111(%rbp)	;, c
	jne	.L68	;,
; src/lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L68	;,
; src/lexer.c:157:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp403
	movq	%rax, %rdi	; tmp403,
	call	get_current_char	;
; src/lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp404
	movq	32(%rax), %rax	; lexer_213(D)->column, _90
; src/lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _91
	movq	-120(%rbp), %rax	; lexer, tmp405
	movq	24(%rax), %rdx	; lexer_213(D)->line, _92
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.7_93
	movq	%rax, %rsi	; MUL_ASSIGN_SYMBOL.7_93,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L68:
; src/lexer.c:159:         } else if (c == '/' && p == '=') {
	cmpb	$47, -111(%rbp)	;, c
	jne	.L69	;,
; src/lexer.c:159:         } else if (c == '/' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L69	;,
; src/lexer.c:160:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp406
	movq	%rax, %rdi	; tmp406,
	call	get_current_char	;
; src/lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp407
	movq	32(%rax), %rax	; lexer_213(D)->column, _94
; src/lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _95
	movq	-120(%rbp), %rax	; lexer, tmp408
	movq	24(%rax), %rdx	; lexer_213(D)->line, _96
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.8_97
	movq	%rax, %rsi	; DIV_ASSIGN_SYMBOL.8_97,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L69:
; src/lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, -111(%rbp)	;, c
	jne	.L70	;,
; src/lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$61, -110(%rbp)	;, p
	jne	.L70	;,
; src/lexer.c:163:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp409
	movq	%rax, %rdi	; tmp409,
	call	get_current_char	;
; src/lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp410
	movq	32(%rax), %rax	; lexer_213(D)->column, _98
; src/lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _99
	movq	-120(%rbp), %rax	; lexer, tmp411
	movq	24(%rax), %rdx	; lexer_213(D)->line, _100
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.9_101
	movq	%rax, %rsi	; MOD_ASSIGN_SYMBOL.9_101,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L70:
; src/lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, -111(%rbp)	;, c
	jne	.L71	;,
; src/lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, -110(%rbp)	;, p
	jne	.L71	;,
; src/lexer.c:166:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp412
	movq	%rax, %rdi	; tmp412,
	call	get_current_char	;
; src/lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp413
	movq	32(%rax), %rax	; lexer_213(D)->column, _102
; src/lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _103
	movq	-120(%rbp), %rax	; lexer, tmp414
	movq	24(%rax), %rdx	; lexer_213(D)->line, _104
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, AND_SYMBOL.10_105
	movq	%rax, %rsi	; AND_SYMBOL.10_105,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L71:
; src/lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, -111(%rbp)	;, c
	jne	.L72	;,
; src/lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, -110(%rbp)	;, p
	jne	.L72	;,
; src/lexer.c:169:             get_current_char(lexer);
	movq	-120(%rbp), %rax	; lexer, tmp415
	movq	%rax, %rdi	; tmp415,
	call	get_current_char	;
; src/lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	-120(%rbp), %rax	; lexer, tmp416
	movq	32(%rax), %rax	; lexer_213(D)->column, _106
; src/lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	;, _107
	movq	-120(%rbp), %rax	; lexer, tmp417
	movq	24(%rax), %rdx	; lexer_213(D)->line, _108
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, OR_SYMBOL.11_109
	movq	%rax, %rsi	; OR_SYMBOL.11_109,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L72:
; src/lexer.c:171:         } else if (c == '(')
	cmpb	$40, -111(%rbp)	;, c
	jne	.L73	;,
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp418
	movq	32(%rax), %rax	; lexer_213(D)->column, _110
; src/lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _111
	movq	-120(%rbp), %rax	; lexer, tmp419
	movq	24(%rax), %rdx	; lexer_213(D)->line, _112
	movq	L_PAREN_SYMBOL(%rip), %rax	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.12_113
	movq	%rax, %rsi	; L_PAREN_SYMBOL.12_113,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L73:
; src/lexer.c:173:         else if (c == ')')
	cmpb	$41, -111(%rbp)	;, c
	jne	.L74	;,
; src/lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp420
	movq	32(%rax), %rax	; lexer_213(D)->column, _114
; src/lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _115
	movq	-120(%rbp), %rax	; lexer, tmp421
	movq	24(%rax), %rdx	; lexer_213(D)->line, _116
	movq	R_PAREN_SYMBOL(%rip), %rax	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.13_117
	movq	%rax, %rsi	; R_PAREN_SYMBOL.13_117,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L74:
; src/lexer.c:175:         else if (c == '{')
	cmpb	$123, -111(%rbp)	;, c
	jne	.L75	;,
; src/lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp422
	movq	32(%rax), %rax	; lexer_213(D)->column, _118
; src/lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _119
	movq	-120(%rbp), %rax	; lexer, tmp423
	movq	24(%rax), %rdx	; lexer_213(D)->line, _120
	movq	L_BRACE_SYMBOL(%rip), %rax	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.14_121
	movq	%rax, %rsi	; L_BRACE_SYMBOL.14_121,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L75:
; src/lexer.c:177:         else if (c == '}')
	cmpb	$125, -111(%rbp)	;, c
	jne	.L76	;,
; src/lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp424
	movq	32(%rax), %rax	; lexer_213(D)->column, _122
; src/lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _123
	movq	-120(%rbp), %rax	; lexer, tmp425
	movq	24(%rax), %rdx	; lexer_213(D)->line, _124
	movq	R_BRACE_SYMBOL(%rip), %rax	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.15_125
	movq	%rax, %rsi	; R_BRACE_SYMBOL.15_125,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L76:
; src/lexer.c:179:         else if (c == ',')
	cmpb	$44, -111(%rbp)	;, c
	jne	.L77	;,
; src/lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp426
	movq	32(%rax), %rax	; lexer_213(D)->column, _126
; src/lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _127
	movq	-120(%rbp), %rax	; lexer, tmp427
	movq	24(%rax), %rdx	; lexer_213(D)->line, _128
	movq	COMMA_SYMBOL(%rip), %rax	; COMMA_SYMBOL, COMMA_SYMBOL.16_129
	movq	%rax, %rsi	; COMMA_SYMBOL.16_129,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L77:
; src/lexer.c:181:         else if (c == '!')
	cmpb	$33, -111(%rbp)	;, c
	jne	.L78	;,
; src/lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp428
	movq	32(%rax), %rax	; lexer_213(D)->column, _130
; src/lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _131
	movq	-120(%rbp), %rax	; lexer, tmp429
	movq	24(%rax), %rdx	; lexer_213(D)->line, _132
	movq	NOT_SYMBOL(%rip), %rax	; NOT_SYMBOL, NOT_SYMBOL.17_133
	movq	%rax, %rsi	; NOT_SYMBOL.17_133,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L78:
; src/lexer.c:183:         else if (c == '.')
	cmpb	$46, -111(%rbp)	;, c
	jne	.L79	;,
; src/lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp430
	movq	32(%rax), %rax	; lexer_213(D)->column, _134
; src/lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _135
	movq	-120(%rbp), %rax	; lexer, tmp431
	movq	24(%rax), %rdx	; lexer_213(D)->line, _136
	movq	DOT_SYMBOL(%rip), %rax	; DOT_SYMBOL, DOT_SYMBOL.18_137
	movq	%rax, %rsi	; DOT_SYMBOL.18_137,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L79:
; src/lexer.c:185:         else if (c == '[')
	cmpb	$91, -111(%rbp)	;, c
	jne	.L80	;,
; src/lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp432
	movq	32(%rax), %rax	; lexer_213(D)->column, _138
; src/lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _139
	movq	-120(%rbp), %rax	; lexer, tmp433
	movq	24(%rax), %rdx	; lexer_213(D)->line, _140
	movq	L_BRACKET_SYMBOL(%rip), %rax	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.19_141
	movq	%rax, %rsi	; L_BRACKET_SYMBOL.19_141,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L80:
; src/lexer.c:187:         else if (c == ']')
	cmpb	$93, -111(%rbp)	;, c
	jne	.L81	;,
; src/lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp434
	movq	32(%rax), %rax	; lexer_213(D)->column, _142
; src/lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _143
	movq	-120(%rbp), %rax	; lexer, tmp435
	movq	24(%rax), %rdx	; lexer_213(D)->line, _144
	movq	R_BRACKET_SYMBOL(%rip), %rax	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.20_145
	movq	%rax, %rsi	; R_BRACKET_SYMBOL.20_145,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L81:
; src/lexer.c:189:         else if (c == ';')
	cmpb	$59, -111(%rbp)	;, c
	jne	.L82	;,
; src/lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp436
	movq	32(%rax), %rax	; lexer_213(D)->column, _146
; src/lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _147
	movq	-120(%rbp), %rax	; lexer, tmp437
	movq	24(%rax), %rdx	; lexer_213(D)->line, _148
	movq	SEMICOLON_SYMBOL(%rip), %rax	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.21_149
	movq	%rax, %rsi	; SEMICOLON_SYMBOL.21_149,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L82:
; src/lexer.c:191:         else if (c == '_')
	cmpb	$95, -111(%rbp)	;, c
	jne	.L83	;,
; src/lexer.c:192:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp438
	movq	32(%rax), %rax	; lexer_213(D)->column, _150
; src/lexer.c:192:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _151
	movq	-120(%rbp), %rax	; lexer, tmp439
	movq	24(%rax), %rdx	; lexer_213(D)->line, _152
	movq	UNDERLINE_SYMBOL(%rip), %rax	; UNDERLINE_SYMBOL, UNDERLINE_SYMBOL.22_153
	movq	%rax, %rsi	; UNDERLINE_SYMBOL.22_153,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L83:
; src/lexer.c:193:         else if (c == '+')
	cmpb	$43, -111(%rbp)	;, c
	jne	.L84	;,
; src/lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp440
	movq	32(%rax), %rax	; lexer_213(D)->column, _154
; src/lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _155
	movq	-120(%rbp), %rax	; lexer, tmp441
	movq	24(%rax), %rdx	; lexer_213(D)->line, _156
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, ADD_SYMBOL.23_157
	movq	%rax, %rsi	; ADD_SYMBOL.23_157,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L84:
; src/lexer.c:195:         else if (c == '-')
	cmpb	$45, -111(%rbp)	;, c
	jne	.L85	;,
; src/lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp442
	movq	32(%rax), %rax	; lexer_213(D)->column, _158
; src/lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _159
	movq	-120(%rbp), %rax	; lexer, tmp443
	movq	24(%rax), %rdx	; lexer_213(D)->line, _160
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, SUB_SYMBOL.24_161
	movq	%rax, %rsi	; SUB_SYMBOL.24_161,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L85:
; src/lexer.c:197:         else if (c == '*')
	cmpb	$42, -111(%rbp)	;, c
	jne	.L86	;,
; src/lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp444
	movq	32(%rax), %rax	; lexer_213(D)->column, _162
; src/lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _163
	movq	-120(%rbp), %rax	; lexer, tmp445
	movq	24(%rax), %rdx	; lexer_213(D)->line, _164
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, MUL_SYMBOL.25_165
	movq	%rax, %rsi	; MUL_SYMBOL.25_165,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L86:
; src/lexer.c:199:         else if (c == '/')
	cmpb	$47, -111(%rbp)	;, c
	jne	.L87	;,
; src/lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp446
	movq	32(%rax), %rax	; lexer_213(D)->column, _166
; src/lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _167
	movq	-120(%rbp), %rax	; lexer, tmp447
	movq	24(%rax), %rdx	; lexer_213(D)->line, _168
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, DIV_SYMBOL.26_169
	movq	%rax, %rsi	; DIV_SYMBOL.26_169,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L87:
; src/lexer.c:201:         else if (c == '%')
	cmpb	$37, -111(%rbp)	;, c
	jne	.L88	;,
; src/lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp448
	movq	32(%rax), %rax	; lexer_213(D)->column, _170
; src/lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _171
	movq	-120(%rbp), %rax	; lexer, tmp449
	movq	24(%rax), %rdx	; lexer_213(D)->line, _172
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, MOD_SYMBOL.27_173
	movq	%rax, %rsi	; MOD_SYMBOL.27_173,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L88:
; src/lexer.c:203:         else if (c == '<')
	cmpb	$60, -111(%rbp)	;, c
	jne	.L89	;,
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp450
	movq	32(%rax), %rax	; lexer_213(D)->column, _174
; src/lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _175
	movq	-120(%rbp), %rax	; lexer, tmp451
	movq	24(%rax), %rdx	; lexer_213(D)->line, _176
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, LT_SYMBOL.28_177
	movq	%rax, %rsi	; LT_SYMBOL.28_177,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L89:
; src/lexer.c:205:         else if (c == '>')
	cmpb	$62, -111(%rbp)	;, c
	jne	.L90	;,
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp452
	movq	32(%rax), %rax	; lexer_213(D)->column, _178
; src/lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _179
	movq	-120(%rbp), %rax	; lexer, tmp453
	movq	24(%rax), %rdx	; lexer_213(D)->line, _180
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, GT_SYMBOL.29_181
	movq	%rax, %rsi	; GT_SYMBOL.29_181,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L90:
; src/lexer.c:207:         else if (c == '=')
	cmpb	$61, -111(%rbp)	;, c
	jne	.L91	;,
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp454
	movq	32(%rax), %rax	; lexer_213(D)->column, _182
; src/lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	;, _183
	movq	-120(%rbp), %rax	; lexer, tmp455
	movq	24(%rax), %rdx	; lexer_213(D)->line, _184
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.30_185
	movq	%rax, %rsi	; ASSIGN_SYMBOL.30_185,
	movl	$5, %edi	;,
	call	create_token	;
	jmp	.L19	;
.L91:
; src/lexer.c:210:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	-120(%rbp), %rax	; lexer, tmp456
	movq	32(%rax), %rax	; lexer_213(D)->column, _186
; src/lexer.c:210:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rdx	;, _187
	movq	-120(%rbp), %rax	; lexer, tmp457
	movq	24(%rax), %rax	; lexer_213(D)->line, _188
	movq	%rax, %rsi	; _188,
	leaq	.LC5(%rip), %rax	;, tmp458
	movq	%rax, %rdi	; tmp458,
	call	lexer_error	;
; src/lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_token	;
.L19:
; src/lexer.c:214: }
	movq	-8(%rbp), %rbx	;,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	next_token, .-next_token
	.globl	get_next_token
	.type	get_next_token, @function
get_next_token:
.LFB14:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; lexer, lexer
	movl	%esi, %eax	; skip_comment, tmp90
	movb	%al, -28(%rbp)	; tmp91, skip_comment
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	-24(%rbp), %rax	; lexer, tmp92
	movq	40(%rax), %rax	; lexer_10(D)->peeked_token, _1
; src/lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	; _1
	je	.L94	;,
; src/lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	-24(%rbp), %rax	; lexer, tmp93
	movq	40(%rax), %rdx	; lexer_10(D)->peeked_token, _2
; src/lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	-24(%rbp), %rax	; lexer, tmp94
	movq	%rdx, 72(%rax)	; _2, lexer_10(D)->current_token
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	-24(%rbp), %rax	; lexer, tmp95
	movq	48(%rax), %rdx	; lexer_10(D)->peeked_position, _3
; src/lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	-24(%rbp), %rax	; lexer, tmp96
	movq	%rdx, 8(%rax)	; _3, lexer_10(D)->position
; src/lexer.c:220:         lexer->line = lexer->peeked_line;
	movq	-24(%rbp), %rax	; lexer, tmp97
	movq	56(%rax), %rdx	; lexer_10(D)->peeked_line, _4
; src/lexer.c:220:         lexer->line = lexer->peeked_line;
	movq	-24(%rbp), %rax	; lexer, tmp98
	movq	%rdx, 24(%rax)	; _4, lexer_10(D)->line
; src/lexer.c:221:         lexer->column = lexer->peeked_column;
	movq	-24(%rbp), %rax	; lexer, tmp99
	movq	64(%rax), %rdx	; lexer_10(D)->peeked_column, _5
; src/lexer.c:221:         lexer->column = lexer->peeked_column;
	movq	-24(%rbp), %rax	; lexer, tmp100
	movq	%rdx, 32(%rax)	; _5, lexer_10(D)->column
; src/lexer.c:222:         lexer->peeked_token = 0;
	movq	-24(%rbp), %rax	; lexer, tmp101
	movq	$0, 40(%rax)	;, lexer_10(D)->peeked_token
; src/lexer.c:223:         return lexer->current_token;
	movq	-24(%rbp), %rax	; lexer, tmp102
	movq	72(%rax), %rax	; lexer_10(D)->current_token, _7
	jmp	.L95	;
.L94:
; src/lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	-28(%rbp), %edx	; skip_comment, _6
	movq	-24(%rbp), %rax	; lexer, tmp103
	movl	%edx, %esi	; _6,
	movq	%rax, %rdi	; tmp103,
	call	next_token	;
	movq	%rax, -8(%rbp)	; tmp104, token
; src/lexer.c:226:     return lexer->current_token = token;
	movq	-24(%rbp), %rax	; lexer, tmp105
	movq	-8(%rbp), %rdx	; token, tmp106
	movq	%rdx, 72(%rax)	; tmp106, lexer_10(D)->current_token
	movq	-24(%rbp), %rax	; lexer, tmp107
	movq	72(%rax), %rax	; lexer_10(D)->current_token, _7
.L95:
; src/lexer.c:227: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	get_next_token, .-get_next_token
	.globl	peek_next_token
	.type	peek_next_token, @function
peek_next_token:
.LFB15:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; lexer, lexer
	movl	%esi, %eax	; skip_comment, tmp89
	movb	%al, -44(%rbp)	; tmp90, skip_comment
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	movq	-40(%rbp), %rax	; lexer, tmp91
	movq	40(%rax), %rax	; lexer_9(D)->peeked_token, _1
; src/lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	; _1
	je	.L97	;,
; src/lexer.c:231:         return lexer->peeked_token;
	movq	-40(%rbp), %rax	; lexer, tmp92
	movq	40(%rax), %rax	; lexer_9(D)->peeked_token, _6
	jmp	.L98	;
.L97:
; src/lexer.c:232:     size_t saved_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp93
	movq	8(%rax), %rax	; lexer_9(D)->position, tmp94
	movq	%rax, -32(%rbp)	; tmp94, saved_position
; src/lexer.c:233:     size_t saved_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp95
	movq	24(%rax), %rax	; lexer_9(D)->line, tmp96
	movq	%rax, -24(%rbp)	; tmp96, saved_line
; src/lexer.c:234:     size_t saved_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp97
	movq	32(%rax), %rax	; lexer_9(D)->column, tmp98
	movq	%rax, -16(%rbp)	; tmp98, saved_column
; src/lexer.c:235:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	-44(%rbp), %edx	; skip_comment, _2
	movq	-40(%rbp), %rax	; lexer, tmp99
	movl	%edx, %esi	; _2,
	movq	%rax, %rdi	; tmp99,
	call	get_next_token	;
	movq	%rax, -8(%rbp)	; tmp100, token
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp101
	movq	8(%rax), %rdx	; lexer_9(D)->position, _3
; src/lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	-40(%rbp), %rax	; lexer, tmp102
	movq	%rdx, 48(%rax)	; _3, lexer_9(D)->peeked_position
; src/lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp103
	movq	24(%rax), %rdx	; lexer_9(D)->line, _4
; src/lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	-40(%rbp), %rax	; lexer, tmp104
	movq	%rdx, 56(%rax)	; _4, lexer_9(D)->peeked_line
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp105
	movq	32(%rax), %rdx	; lexer_9(D)->column, _5
; src/lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	-40(%rbp), %rax	; lexer, tmp106
	movq	%rdx, 64(%rax)	; _5, lexer_9(D)->peeked_column
; src/lexer.c:239:     lexer->position = saved_position;
	movq	-40(%rbp), %rax	; lexer, tmp107
	movq	-32(%rbp), %rdx	; saved_position, tmp108
	movq	%rdx, 8(%rax)	; tmp108, lexer_9(D)->position
; src/lexer.c:240:     lexer->line = saved_line;
	movq	-40(%rbp), %rax	; lexer, tmp109
	movq	-24(%rbp), %rdx	; saved_line, tmp110
	movq	%rdx, 24(%rax)	; tmp110, lexer_9(D)->line
; src/lexer.c:241:     lexer->column = saved_column;
	movq	-40(%rbp), %rax	; lexer, tmp111
	movq	-16(%rbp), %rdx	; saved_column, tmp112
	movq	%rdx, 32(%rax)	; tmp112, lexer_9(D)->column
; src/lexer.c:242:     lexer->peeked_token = token;
	movq	-40(%rbp), %rax	; lexer, tmp113
	movq	-8(%rbp), %rdx	; token, tmp114
	movq	%rdx, 40(%rax)	; tmp114, lexer_9(D)->peeked_token
; src/lexer.c:243:     return token;
	movq	-8(%rbp), %rax	; token, _6
.L98:
; src/lexer.c:244: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	peek_next_token, .-peek_next_token
	.globl	peek_current_token
	.type	peek_current_token, @function
peek_current_token:
.LFB16:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:247:     return lexer->current_token;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	72(%rax), %rax	; lexer_2(D)->current_token, _3
; src/lexer.c:248: }
	popq	%rbp	;
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE16:
	.size	peek_current_token, .-peek_current_token
	.globl	reset_lexer
	.type	reset_lexer, @function
reset_lexer:
.LFB17:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	; lexer, lexer
; src/lexer.c:251:     lexer->position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp82
	movq	$0, 8(%rax)	;, lexer_2(D)->position
; src/lexer.c:252:     lexer->line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp83
	movq	$0, 24(%rax)	;, lexer_2(D)->line
; src/lexer.c:253:     lexer->column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp84
	movq	$0, 32(%rax)	;, lexer_2(D)->column
; src/lexer.c:254:     lexer->peeked_token = 0;
	movq	-8(%rbp), %rax	; lexer, tmp85
	movq	$0, 40(%rax)	;, lexer_2(D)->peeked_token
; src/lexer.c:255:     lexer->peeked_position = 0;
	movq	-8(%rbp), %rax	; lexer, tmp86
	movq	$0, 48(%rax)	;, lexer_2(D)->peeked_position
; src/lexer.c:256:     lexer->peeked_line = 0;
	movq	-8(%rbp), %rax	; lexer, tmp87
	movq	$0, 56(%rax)	;, lexer_2(D)->peeked_line
; src/lexer.c:257:     lexer->peeked_column = 0;
	movq	-8(%rbp), %rax	; lexer, tmp88
	movq	$0, 64(%rax)	;, lexer_2(D)->peeked_column
; src/lexer.c:258:     lexer->current_token = 0;
	movq	-8(%rbp), %rax	; lexer, tmp89
	movq	$0, 72(%rax)	;, lexer_2(D)->current_token
; src/lexer.c:259: }
	nop	
	popq	%rbp	;
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE17:
	.size	reset_lexer, .-reset_lexer
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_token"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

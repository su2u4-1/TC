	.file	"D:\\TC\\src\\lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
create_lexer:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; source, source
	movq	%rdx, 24(%rbp)	 ; length, length
 ; D:\TC\src\lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$80, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, lexer
 ; D:\TC\src\lexer.c:5:     lexer->source = source;
	movq	-8(%rbp), %rax	 ; lexer, tmp85
	movq	16(%rbp), %rdx	 ; source, tmp86
	movq	%rdx, (%rax)	 ; tmp86, lexer_3->source
 ; D:\TC\src\lexer.c:6:     lexer->position = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp87
	movq	$0, 8(%rax)	 ;, lexer_3->position
 ; D:\TC\src\lexer.c:7:     lexer->length = length;
	movq	-8(%rbp), %rax	 ; lexer, tmp88
	movq	24(%rbp), %rdx	 ; length, tmp89
	movq	%rdx, 16(%rax)	 ; tmp89, lexer_3->length
 ; D:\TC\src\lexer.c:8:     lexer->line = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp90
	movq	$0, 24(%rax)	 ;, lexer_3->line
 ; D:\TC\src\lexer.c:9:     lexer->column = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp91
	movq	$0, 32(%rax)	 ;, lexer_3->column
 ; D:\TC\src\lexer.c:10:     lexer->peeked_token = NULL;
	movq	-8(%rbp), %rax	 ; lexer, tmp92
	movq	$0, 40(%rax)	 ;, lexer_3->peeked_token
 ; D:\TC\src\lexer.c:11:     lexer->peeked_position = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp93
	movq	$0, 48(%rax)	 ;, lexer_3->peeked_position
 ; D:\TC\src\lexer.c:12:     lexer->peeked_line = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp94
	movq	$0, 56(%rax)	 ;, lexer_3->peeked_line
 ; D:\TC\src\lexer.c:13:     lexer->peeked_column = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp95
	movq	$0, 64(%rax)	 ;, lexer_3->peeked_column
 ; D:\TC\src\lexer.c:14:     lexer->current_token = NULL;
	movq	-8(%rbp), %rax	 ; lexer, tmp96
	movq	$0, 72(%rax)	 ;, lexer_3->current_token
 ; D:\TC\src\lexer.c:15:     return lexer;
	movq	-8(%rbp), %rax	 ; lexer, _16
 ; D:\TC\src\lexer.c:16: }
	leave	
	ret	
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; lexeme, lexeme
	movq	%r8, 32(%rbp)	 ; line, line
	movq	%r9, 40(%rbp)	 ; column, column
 ; D:\TC\src\lexer.c:19:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, token
 ; D:\TC\src\lexer.c:20:     token->type = type;
	movq	-8(%rbp), %rax	 ; token, tmp85
	movl	16(%rbp), %edx	 ; type, tmp86
	movl	%edx, 24(%rax)	 ; tmp86, token_3->type
 ; D:\TC\src\lexer.c:21:     token->lexeme = lexeme;
	movq	-8(%rbp), %rax	 ; token, tmp87
	movq	24(%rbp), %rdx	 ; lexeme, tmp88
	movq	%rdx, (%rax)	 ; tmp88, token_3->lexeme
 ; D:\TC\src\lexer.c:22:     token->line = line;
	movq	-8(%rbp), %rax	 ; token, tmp89
	movq	32(%rbp), %rdx	 ; line, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, token_3->line
 ; D:\TC\src\lexer.c:23:     token->column = column;
	movq	-8(%rbp), %rax	 ; token, tmp91
	movq	40(%rbp), %rdx	 ; column, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, token_3->column
 ; D:\TC\src\lexer.c:24:     return token;
	movq	-8(%rbp), %rax	 ; token, _12
 ; D:\TC\src\lexer.c:25: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
lexer_error:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; message, message
	movq	%rdx, 24(%rbp)	 ; line, line
	movq	%r8, 32(%rbp)	 ; column, column
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	32(%rbp), %rax	 ; column, tmp86
	leaq	1(%rax), %rsi	 ;, _1
	movq	24(%rbp), %rax	 ; line, tmp87
	leaq	1(%rax), %rbx	 ;, _2
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	16(%rbp), %rdx	 ; message, tmp88
	movq	%rdx, 32(%rsp)	 ; tmp88,
	movq	%rsi, %r9	 ; _1,
	movq	%rbx, %r8	 ; _2,
	leaq	.LC0(%rip), %rdx	 ;, tmp89
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
 ; D:\TC\src\lexer.c:29: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	8(%rax), %rdx	 ; lexer_13(D)->position, _1
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	16(%rax), %rax	 ; lexer_13(D)->length, _2
 ; D:\TC\src\lexer.c:32:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	 ; _2, _1
	jb	.L7	 ;,
 ; D:\TC\src\lexer.c:33:         return '\0';
	movl	$0, %eax	 ;, _10
	jmp	.L8	 ;
.L7:
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	movq	16(%rbp), %rax	 ; lexer, tmp94
	movq	32(%rax), %rax	 ; lexer_13(D)->column, _3
 ; D:\TC\src\lexer.c:34:     lexer->column++;
	leaq	1(%rax), %rdx	 ;, _4
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	%rdx, 32(%rax)	 ; _4, lexer_13(D)->column
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movq	(%rax), %r8	 ; lexer_13(D)->source, _5
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	8(%rax), %rax	 ; lexer_13(D)->position, _6
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	 ;, _8
	movq	16(%rbp), %rdx	 ; lexer, tmp98
	movq	%rcx, 8(%rdx)	 ; _8, lexer_13(D)->position
 ; D:\TC\src\lexer.c:35:     return lexer->source[lexer->position++];
	addq	%r8, %rax	 ; _5, _9
	movzbl	(%rax), %eax	 ; *_9, _10
.L8:
 ; D:\TC\src\lexer.c:36: }
	popq	%rbp	 ;
	ret	
	.def	peek_next_char;	.scl	3;	.type	32;	.endef
peek_next_char:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp89
	movq	8(%rax), %rdx	 ; lexer_8(D)->position, _1
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp90
	movq	16(%rax), %rax	 ; lexer_8(D)->length, _2
 ; D:\TC\src\lexer.c:39:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	 ; _2, _1
	jb	.L10	 ;,
 ; D:\TC\src\lexer.c:40:         return '\0';
	movl	$0, %eax	 ;, _6
	jmp	.L11	 ;
.L10:
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movq	16(%rbp), %rax	 ; lexer, tmp91
	movq	(%rax), %rdx	 ; lexer_8(D)->source, _3
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	8(%rax), %rax	 ; lexer_8(D)->position, _4
 ; D:\TC\src\lexer.c:41:     return lexer->source[lexer->position];
	addq	%rdx, %rax	 ; _3, _5
	movzbl	(%rax), %eax	 ; *_5, _6
.L11:
 ; D:\TC\src\lexer.c:42: }
	popq	%rbp	 ;
	ret	
	.def	newline;	.scl	3;	.type	32;	.endef
newline:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	24(%rax), %rax	 ; lexer_4(D)->line, _1
 ; D:\TC\src\lexer.c:45:     lexer->line++;
	leaq	1(%rax), %rdx	 ;, _2
	movq	16(%rbp), %rax	 ; lexer, tmp85
	movq	%rdx, 24(%rax)	 ; _2, lexer_4(D)->line
 ; D:\TC\src\lexer.c:46:     lexer->column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp86
	movq	$0, 32(%rax)	 ;, lexer_4(D)->column
 ; D:\TC\src\lexer.c:47: }
	nop	
	popq	%rbp	 ;
	ret	
	.def	move_position;	.scl	3;	.type	32;	.endef
move_position:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movl	%edx, 24(%rbp)	 ; count, count
 ; D:\TC\src\lexer.c:50:     if (count >= 0) {
	cmpl	$0, 24(%rbp)	 ;, count
	js	.L14	 ;,
 ; D:\TC\src\lexer.c:51:         lexer->position += (size_t)count;
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movq	8(%rax), %rdx	 ; lexer_18(D)->position, _1
 ; D:\TC\src\lexer.c:51:         lexer->position += (size_t)count;
	movl	24(%rbp), %eax	 ; count, tmp97
	cltq
 ; D:\TC\src\lexer.c:51:         lexer->position += (size_t)count;
	addq	%rax, %rdx	 ; _2, _3
	movq	16(%rbp), %rax	 ; lexer, tmp98
	movq	%rdx, 8(%rax)	 ; _3, lexer_18(D)->position
 ; D:\TC\src\lexer.c:52:         lexer->column += (size_t)count;
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	32(%rax), %rdx	 ; lexer_18(D)->column, _4
 ; D:\TC\src\lexer.c:52:         lexer->column += (size_t)count;
	movl	24(%rbp), %eax	 ; count, tmp100
	cltq
 ; D:\TC\src\lexer.c:52:         lexer->column += (size_t)count;
	addq	%rax, %rdx	 ; _5, _6
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	%rdx, 32(%rax)	 ; _6, lexer_18(D)->column
 ; D:\TC\src\lexer.c:57: }
	jmp	.L16	 ;
.L14:
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	8(%rax), %rdx	 ; lexer_18(D)->position, _7
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	movl	24(%rbp), %eax	 ; count, tmp103
	negl	%eax	 ; _8
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	cltq
 ; D:\TC\src\lexer.c:54:         lexer->position -= (size_t)(-count);
	subq	%rax, %rdx	 ; _9, _10
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movq	%rdx, 8(%rax)	 ; _10, lexer_18(D)->position
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	32(%rax), %rdx	 ; lexer_18(D)->column, _11
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	movl	24(%rbp), %eax	 ; count, tmp106
	negl	%eax	 ; _12
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	cltq
 ; D:\TC\src\lexer.c:55:         lexer->column -= (size_t)(-count);
	subq	%rax, %rdx	 ; _13, _14
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	%rdx, 32(%rax)	 ; _14, lexer_18(D)->column
.L16:
 ; D:\TC\src\lexer.c:57: }
	nop	
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "Unterminated string literal\0"
.LC2:
	.ascii "\0\0"
.LC3:
	.ascii "c != '\\0'\0"
.LC4:
	.ascii "D:\\TC\\src\\lexer.c\0"
.LC5:
	.ascii "Unterminated comment\0"
.LC6:
	.ascii "Unexpected character\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$152, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movl	%edx, %eax	 ; skip_comment, tmp269
	movb	%al, 24(%rbp)	 ; tmp270, skip_comment
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp271
	movq	%rax, %rcx	 ; tmp271,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp272, c
 ; D:\TC\src\lexer.c:61:     if (c == '\0')
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L18	 ;,
 ; D:\TC\src\lexer.c:62:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	16(%rbp), %rax	 ; lexer, tmp273
	movq	32(%rax), %rdx	 ; lexer_210(D)->column, _1
	movq	16(%rbp), %rax	 ; lexer, tmp274
	movq	24(%rax), %rax	 ; lexer_210(D)->line, _2
	movq	%rdx, %r9	 ; _1,
	movq	%rax, %r8	 ; _2,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L18:
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$32, -17(%rbp)	 ;, c
	je	.L20	 ;,
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, -17(%rbp)	 ;, c
	je	.L20	 ;,
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$13, -17(%rbp)	 ;, c
	jne	.L21	 ;,
.L20:
 ; D:\TC\src\lexer.c:64:         return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _3
	movq	16(%rbp), %rax	 ; lexer, tmp275
	movq	%rax, %rcx	 ; tmp275,
	call	next_token	 ;
	jmp	.L19	 ;
.L21:
 ; D:\TC\src\lexer.c:65:     else if (c == '\n') {
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L22	 ;,
 ; D:\TC\src\lexer.c:66:         newline(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp276
	movq	%rax, %rcx	 ; tmp276,
	call	newline	 ;
 ; D:\TC\src\lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _4
	movq	16(%rbp), %rax	 ; lexer, tmp277
	movq	%rax, %rcx	 ; tmp277,
	call	next_token	 ;
	jmp	.L19	 ;
.L22:
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$96, -17(%rbp)	 ;, c
	jle	.L23	 ;,
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$122, -17(%rbp)	 ;, c
	jle	.L24	 ;,
.L23:
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$64, -17(%rbp)	 ;, c
	jle	.L25	 ;,
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$90, -17(%rbp)	 ;, c
	jle	.L24	 ;,
.L25:
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$95, -17(%rbp)	 ;, c
	jne	.L26	 ;,
.L24:
 ; D:\TC\src\lexer.c:69:         size_t start = lexer->position - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp278
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _5
 ; D:\TC\src\lexer.c:69:         size_t start = lexer->position - 1;
	subq	$1, %rax	 ;, tmp279
	movq	%rax, -112(%rbp)	 ; tmp279, start
 ; D:\TC\src\lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp280
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _6
 ; D:\TC\src\lexer.c:70:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp281
	movq	%rax, -120(%rbp)	 ; tmp281, column_start
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L27	 ;
.L29:
 ; D:\TC\src\lexer.c:72:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp282
	movq	%rax, %rcx	 ; tmp282,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp283, c
.L27:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$96, -17(%rbp)	 ;, c
	jle	.L28	 ;,
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$122, -17(%rbp)	 ;, c
	jle	.L29	 ;,
.L28:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$64, -17(%rbp)	 ;, c
	jle	.L30	 ;,
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$90, -17(%rbp)	 ;, c
	jle	.L29	 ;,
.L30:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L31	 ;,
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$57, -17(%rbp)	 ;, c
	jle	.L29	 ;,
.L31:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$95, -17(%rbp)	 ;, c
	je	.L29	 ;,
 ; D:\TC\src\lexer.c:73:         move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp284
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp284,
	call	move_position	 ;
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	16(%rbp), %rax	 ; lexer, tmp285
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _7
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	-112(%rbp), %rax	 ; start, _8
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	16(%rbp), %rdx	 ; lexer, tmp286
	movq	(%rdx), %rcx	 ; lexer_210(D)->source, _9
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-112(%rbp), %rdx	 ; start, tmp287
	addq	%rdx, %rcx	 ; tmp287, _10
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rdx	 ; _8,
	call	create_string	 ;
	movq	%rax, -128(%rbp)	 ; tmp288, content
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	movq	-128(%rbp), %rax	 ; content, tmp289
	movq	%rax, %rcx	 ; tmp289,
	call	is_keyword	 ;
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	 ; _11
	je	.L32	 ;,
 ; D:\TC\src\lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp290
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _12
	movq	-120(%rbp), %rcx	 ; column_start, tmp291
	movq	-128(%rbp), %rax	 ; content, tmp292
	movq	%rcx, %r9	 ; tmp291,
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp292,
	movl	$6, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L32:
 ; D:\TC\src\lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp293
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _13
	movq	-120(%rbp), %rcx	 ; column_start, tmp294
	movq	-128(%rbp), %rax	 ; content, tmp295
	movq	%rcx, %r9	 ; tmp294,
	movq	%rdx, %r8	 ; _13,
	movq	%rax, %rdx	 ; tmp295,
	movl	$1, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L26:
 ; D:\TC\src\lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L33	 ;,
 ; D:\TC\src\lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$57, -17(%rbp)	 ;, c
	jg	.L33	 ;,
 ; D:\TC\src\lexer.c:80:         size_t start = lexer->position - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp296
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _14
 ; D:\TC\src\lexer.c:80:         size_t start = lexer->position - 1;
	subq	$1, %rax	 ;, tmp297
	movq	%rax, -40(%rbp)	 ; tmp297, start
 ; D:\TC\src\lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp298
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _15
 ; D:\TC\src\lexer.c:81:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp299
	movq	%rax, -48(%rbp)	 ; tmp299, column_start
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	jmp	.L34	 ;
.L36:
 ; D:\TC\src\lexer.c:83:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp300
	movq	%rax, %rcx	 ; tmp300,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp301, c
.L34:
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L35	 ;,
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	 ;, c
	jle	.L36	 ;,
.L35:
 ; D:\TC\src\lexer.c:84:         TokenType type = INTEGER;
	movl	$2, -24(%rbp)	 ;, type
 ; D:\TC\src\lexer.c:85:         char p = peek_next_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp302
	movq	%rax, %rcx	 ; tmp302,
	call	peek_next_char	 ;
	movb	%al, -49(%rbp)	 ; tmp303, p
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, -17(%rbp)	 ;, c
	jne	.L37	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$47, -49(%rbp)	 ;, p
	jle	.L37	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$57, -49(%rbp)	 ;, p
	jg	.L37	 ;,
 ; D:\TC\src\lexer.c:87:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp304
	movq	%rax, %rcx	 ; tmp304,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp305, c
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	jmp	.L38	 ;
.L40:
 ; D:\TC\src\lexer.c:89:                 c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp306
	movq	%rax, %rcx	 ; tmp306,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp307, c
.L38:
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L39	 ;,
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	 ;, c
	jle	.L40	 ;,
.L39:
 ; D:\TC\src\lexer.c:90:             type = FLOAT;
	movl	$3, -24(%rbp)	 ;, type
.L37:
 ; D:\TC\src\lexer.c:92:         move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp308
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp308,
	call	move_position	 ;
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp309
	movq	24(%rax), %rbx	 ; lexer_210(D)->line, _16
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp310
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _17
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-40(%rbp), %rax	 ; start, _18
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rdx	 ; lexer, tmp311
	movq	(%rdx), %rcx	 ; lexer_210(D)->source, _19
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-40(%rbp), %rdx	 ; start, tmp312
	addq	%rdx, %rcx	 ; tmp312, _20
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _18,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _21
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-48(%rbp), %rcx	 ; column_start, tmp313
	movl	-24(%rbp), %eax	 ; type, tmp314
	movq	%rcx, %r9	 ; tmp313,
	movq	%rbx, %r8	 ; _16,
	movl	%eax, %ecx	 ; tmp314,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L33:
 ; D:\TC\src\lexer.c:94:     } else if (c == '"') {
	cmpb	$34, -17(%rbp)	 ;, c
	jne	.L41	 ;,
 ; D:\TC\src\lexer.c:95:         size_t start = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp315
	movq	8(%rax), %rax	 ; lexer_210(D)->position, tmp316
	movq	%rax, -96(%rbp)	 ; tmp316, start
 ; D:\TC\src\lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp317
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _22
 ; D:\TC\src\lexer.c:96:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp318
	movq	%rax, -104(%rbp)	 ; tmp318, column_start
 ; D:\TC\src\lexer.c:97:         c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp319
	movq	%rax, %rcx	 ; tmp319,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp320, c
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L42	 ;
.L44:
 ; D:\TC\src\lexer.c:99:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp321
	movq	%rax, %rcx	 ; tmp321,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp322, c
.L42:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, -17(%rbp)	 ;, c
	je	.L43	 ;,
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$0, -17(%rbp)	 ;, c
	je	.L43	 ;,
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L44	 ;,
.L43:
 ; D:\TC\src\lexer.c:100:         if (c != '"') {
	cmpb	$34, -17(%rbp)	 ;, c
	je	.L45	 ;,
 ; D:\TC\src\lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	movq	-96(%rbp), %rax	 ; start, tmp323
	leaq	-1(%rax), %rdx	 ;, _23
	movq	16(%rbp), %rax	 ; lexer, tmp324
	movq	24(%rax), %rax	 ; lexer_210(D)->line, _24
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; _24,
	leaq	.LC1(%rip), %rax	 ;, tmp325
	movq	%rax, %rcx	 ; tmp325,
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L45	 ;,
 ; D:\TC\src\lexer.c:102:             if (c == '\n') newline(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp326
	movq	%rax, %rcx	 ; tmp326,
	call	newline	 ;
.L45:
 ; D:\TC\src\lexer.c:104:         if (lexer->position - start == 1)
	movq	16(%rbp), %rax	 ; lexer, tmp327
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _25
 ; D:\TC\src\lexer.c:104:         if (lexer->position - start == 1)
	subq	-96(%rbp), %rax	 ; start, _26
 ; D:\TC\src\lexer.c:104:         if (lexer->position - start == 1)
	cmpq	$1, %rax	 ;, _26
	jne	.L46	 ;,
 ; D:\TC\src\lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp328
	movq	24(%rax), %rbx	 ; lexer_210(D)->line, _27
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp329
	movq	%rax, %rcx	 ; tmp329,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	-104(%rbp), %rdx	 ; column_start, tmp330
	movq	%rdx, %r9	 ; tmp330,
	movq	%rbx, %r8	 ; _27,
	movq	%rax, %rdx	 ; _28,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:105:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	jmp	.L19	 ;
.L46:
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp331
	movq	24(%rax), %rbx	 ; lexer_210(D)->line, _29
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp332
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _30
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-96(%rbp), %rax	 ; start, _31
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	 ;, _32
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp333
	movq	(%rax), %rcx	 ; lexer_210(D)->source, _33
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-96(%rbp), %rax	 ; start, tmp334
	addq	%rcx, %rax	 ; _33, _34
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rcx	 ; _34,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-104(%rbp), %rdx	 ; column_start, tmp335
	movq	%rdx, %r9	 ; tmp335,
	movq	%rbx, %r8	 ; _29,
	movq	%rax, %rdx	 ; _35,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:106:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	 ;
.L41:
 ; D:\TC\src\lexer.c:108:         char p = peek_next_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp336
	movq	%rax, %rcx	 ; tmp336,
	call	peek_next_char	 ;
	movb	%al, -25(%rbp)	 ; tmp337, p
 ; D:\TC\src\lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L47	 ;,
 ; D:\TC\src\lexer.c:109:         if (c == '/' && p == '/') {
	cmpb	$47, -25(%rbp)	 ;, p
	jne	.L47	 ;,
 ; D:\TC\src\lexer.c:110:             size_t start = lexer->position + 1;
	movq	16(%rbp), %rax	 ; lexer, tmp338
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _36
 ; D:\TC\src\lexer.c:110:             size_t start = lexer->position + 1;
	addq	$1, %rax	 ;, tmp339
	movq	%rax, -64(%rbp)	 ; tmp339, start
 ; D:\TC\src\lexer.c:111:             size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp340
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _37
 ; D:\TC\src\lexer.c:111:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp341
	movq	%rax, -72(%rbp)	 ; tmp341, column_start
 ; D:\TC\src\lexer.c:112:             while (c != '\n' && c != '\0')
	jmp	.L48	 ;
.L50:
 ; D:\TC\src\lexer.c:113:                 c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp342
	movq	%rax, %rcx	 ; tmp342,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp343, c
.L48:
 ; D:\TC\src\lexer.c:112:             while (c != '\n' && c != '\0')
	cmpb	$10, -17(%rbp)	 ;, c
	je	.L49	 ;,
 ; D:\TC\src\lexer.c:112:             while (c != '\n' && c != '\0')
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L50	 ;,
.L49:
 ; D:\TC\src\lexer.c:114:             move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp344
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp344,
	call	move_position	 ;
 ; D:\TC\src\lexer.c:115:             if (skip_comment)
	cmpb	$0, 24(%rbp)	 ;, skip_comment
	je	.L51	 ;,
 ; D:\TC\src\lexer.c:116:                 return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _38
	movq	16(%rbp), %rax	 ; lexer, tmp345
	movq	%rax, %rcx	 ; tmp345,
	call	next_token	 ;
	jmp	.L19	 ;
.L51:
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp346
	movq	24(%rax), %rbx	 ; lexer_210(D)->line, _39
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp347
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _40
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-64(%rbp), %rax	 ; start, _41
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rdx	 ; lexer, tmp348
	movq	(%rdx), %rcx	 ; lexer_210(D)->source, _42
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-64(%rbp), %rdx	 ; start, tmp349
	addq	%rdx, %rcx	 ; tmp349, _43
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _41,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-72(%rbp), %rdx	 ; column_start, tmp350
	movq	%rdx, %r9	 ; tmp350,
	movq	%rbx, %r8	 ; _39,
	movq	%rax, %rdx	 ; _44,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:117:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L47:
 ; D:\TC\src\lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L52	 ;,
 ; D:\TC\src\lexer.c:118:         } else if (c == '/' && p == '*') {
	cmpb	$42, -25(%rbp)	 ;, p
	jne	.L52	 ;,
 ; D:\TC\src\lexer.c:119:             size_t start = lexer->position + 1;
	movq	16(%rbp), %rax	 ; lexer, tmp351
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _45
 ; D:\TC\src\lexer.c:119:             size_t start = lexer->position + 1;
	addq	$1, %rax	 ;, tmp352
	movq	%rax, -80(%rbp)	 ; tmp352, start
 ; D:\TC\src\lexer.c:120:             size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp353
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _46
 ; D:\TC\src\lexer.c:120:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp354
	movq	%rax, -88(%rbp)	 ; tmp354, column_start
 ; D:\TC\src\lexer.c:121:             while (!(c == '*' && p == '/')) {
	jmp	.L53	 ;
.L57:
 ; D:\TC\src\lexer.c:122:                 c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp355
	movq	%rax, %rcx	 ; tmp355,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp356, c
 ; D:\TC\src\lexer.c:123:                 p = peek_next_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp357
	movq	%rax, %rcx	 ; tmp357,
	call	peek_next_char	 ;
	movb	%al, -25(%rbp)	 ; tmp358, p
 ; D:\TC\src\lexer.c:124:                 if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L54	 ;,
 ; D:\TC\src\lexer.c:124:                 if (c == '\n') newline(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp359
	movq	%rax, %rcx	 ; tmp359,
	call	newline	 ;
.L54:
 ; D:\TC\src\lexer.c:125:                 if (p == '\0') break;
	cmpb	$0, -25(%rbp)	 ;, p
	je	.L92	 ;,
 ; D:\TC\src\lexer.c:126:                 assert(c != '\0');
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L53	 ;,
 ; D:\TC\src\lexer.c:126:                 assert(c != '\0');
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$126, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp360
	movq	%rax, %rcx	 ; tmp360,
	call	__assert_func	 ;
.L53:
 ; D:\TC\src\lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$42, -17(%rbp)	 ;, c
	jne	.L57	 ;,
 ; D:\TC\src\lexer.c:121:             while (!(c == '*' && p == '/')) {
	cmpb	$47, -25(%rbp)	 ;, p
	jne	.L57	 ;,
	jmp	.L56	 ;
.L92:
 ; D:\TC\src\lexer.c:125:                 if (p == '\0') break;
	nop	
.L56:
 ; D:\TC\src\lexer.c:128:             if (p == '\0') {
	cmpb	$0, -25(%rbp)	 ;, p
	jne	.L58	 ;,
 ; D:\TC\src\lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L59	 ;,
 ; D:\TC\src\lexer.c:129:                 if (c == '\0') move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp361
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp361,
	call	move_position	 ;
.L59:
 ; D:\TC\src\lexer.c:130:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	16(%rbp), %rax	 ; lexer, tmp362
	movq	24(%rax), %rax	 ; lexer_210(D)->line, _47
	movq	-80(%rbp), %rdx	 ; start, tmp363
	movq	%rdx, %r8	 ; tmp363,
	movq	%rax, %rdx	 ; _47,
	leaq	.LC5(%rip), %rax	 ;, tmp364
	movq	%rax, %rcx	 ; tmp364,
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:131:                 if (skip_comment)
	cmpb	$0, 24(%rbp)	 ;, skip_comment
	je	.L60	 ;,
 ; D:\TC\src\lexer.c:132:                     return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _48
	movq	16(%rbp), %rax	 ; lexer, tmp365
	movq	%rax, %rcx	 ; tmp365,
	call	next_token	 ;
	jmp	.L19	 ;
.L60:
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp366
	movq	24(%rax), %rbx	 ; lexer_210(D)->line, _49
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp367
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _50
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-80(%rbp), %rax	 ; start, _51
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rdx	 ; lexer, tmp368
	movq	(%rdx), %rcx	 ; lexer_210(D)->source, _52
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-80(%rbp), %rdx	 ; start, tmp369
	addq	%rdx, %rcx	 ; tmp369, _53
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _51,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-88(%rbp), %rdx	 ; column_start, tmp370
	movq	%rdx, %r9	 ; tmp370,
	movq	%rbx, %r8	 ; _49,
	movq	%rax, %rdx	 ; _54,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:133:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L58:
 ; D:\TC\src\lexer.c:135:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp371
	movq	%rax, %rcx	 ; tmp371,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp372, c
 ; D:\TC\src\lexer.c:136:             if (skip_comment)
	cmpb	$0, 24(%rbp)	 ;, skip_comment
	je	.L61	 ;,
 ; D:\TC\src\lexer.c:137:                 return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _55
	movq	16(%rbp), %rax	 ; lexer, tmp373
	movq	%rax, %rcx	 ; tmp373,
	call	next_token	 ;
	jmp	.L19	 ;
.L61:
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp374
	movq	24(%rax), %rbx	 ; lexer_210(D)->line, _56
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp375
	movq	8(%rax), %rax	 ; lexer_210(D)->position, _57
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	-80(%rbp), %rax	 ; start, _58
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	 ;, _59
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp376
	movq	(%rax), %rcx	 ; lexer_210(D)->source, _60
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-80(%rbp), %rax	 ; start, tmp377
	addq	%rcx, %rax	 ; _60, _61
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rcx	 ; _61,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-88(%rbp), %rdx	 ; column_start, tmp378
	movq	%rdx, %r9	 ; tmp378,
	movq	%rbx, %r8	 ; _56,
	movq	%rax, %rdx	 ; _62,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:138:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L19	 ;
.L52:
 ; D:\TC\src\lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, -17(%rbp)	 ;, c
	jne	.L62	 ;,
 ; D:\TC\src\lexer.c:139:         } else if (c == '=' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L62	 ;,
 ; D:\TC\src\lexer.c:140:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp379
	movq	%rax, %rcx	 ; tmp379,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp380
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _63
 ; D:\TC\src\lexer.c:141:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _64
	movq	16(%rbp), %rax	 ; lexer, tmp381
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _65
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp382
	movq	(%rax), %rax	 ; EQ_SYMBOL, EQ_SYMBOL.0_66
	movq	%rcx, %r9	 ; _64,
	movq	%rdx, %r8	 ; _65,
	movq	%rax, %rdx	 ; EQ_SYMBOL.0_66,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L62:
 ; D:\TC\src\lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$33, -17(%rbp)	 ;, c
	jne	.L63	 ;,
 ; D:\TC\src\lexer.c:142:         } else if (c == '!' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L63	 ;,
 ; D:\TC\src\lexer.c:143:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp383
	movq	%rax, %rcx	 ; tmp383,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp384
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _67
 ; D:\TC\src\lexer.c:144:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _68
	movq	16(%rbp), %rax	 ; lexer, tmp385
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _69
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp386
	movq	(%rax), %rax	 ; NE_SYMBOL, NE_SYMBOL.1_70
	movq	%rcx, %r9	 ; _68,
	movq	%rdx, %r8	 ; _69,
	movq	%rax, %rdx	 ; NE_SYMBOL.1_70,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L63:
 ; D:\TC\src\lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$60, -17(%rbp)	 ;, c
	jne	.L64	 ;,
 ; D:\TC\src\lexer.c:145:         } else if (c == '<' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L64	 ;,
 ; D:\TC\src\lexer.c:146:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp387
	movq	%rax, %rcx	 ; tmp387,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp388
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _71
 ; D:\TC\src\lexer.c:147:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _72
	movq	16(%rbp), %rax	 ; lexer, tmp389
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _73
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp390
	movq	(%rax), %rax	 ; LE_SYMBOL, LE_SYMBOL.2_74
	movq	%rcx, %r9	 ; _72,
	movq	%rdx, %r8	 ; _73,
	movq	%rax, %rdx	 ; LE_SYMBOL.2_74,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L64:
 ; D:\TC\src\lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$62, -17(%rbp)	 ;, c
	jne	.L65	 ;,
 ; D:\TC\src\lexer.c:148:         } else if (c == '>' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L65	 ;,
 ; D:\TC\src\lexer.c:149:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp391
	movq	%rax, %rcx	 ; tmp391,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp392
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _75
 ; D:\TC\src\lexer.c:150:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _76
	movq	16(%rbp), %rax	 ; lexer, tmp393
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _77
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rax), %rax	 ; GE_SYMBOL, GE_SYMBOL.3_78
	movq	%rcx, %r9	 ; _76,
	movq	%rdx, %r8	 ; _77,
	movq	%rax, %rdx	 ; GE_SYMBOL.3_78,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L65:
 ; D:\TC\src\lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$43, -17(%rbp)	 ;, c
	jne	.L66	 ;,
 ; D:\TC\src\lexer.c:151:         } else if (c == '+' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L66	 ;,
 ; D:\TC\src\lexer.c:152:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp395
	movq	%rax, %rcx	 ; tmp395,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp396
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _79
 ; D:\TC\src\lexer.c:153:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _80
	movq	16(%rbp), %rax	 ; lexer, tmp397
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _81
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp398
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.4_82
	movq	%rcx, %r9	 ; _80,
	movq	%rdx, %r8	 ; _81,
	movq	%rax, %rdx	 ; ADD_ASSIGN_SYMBOL.4_82,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L66:
 ; D:\TC\src\lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$45, -17(%rbp)	 ;, c
	jne	.L67	 ;,
 ; D:\TC\src\lexer.c:154:         } else if (c == '-' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L67	 ;,
 ; D:\TC\src\lexer.c:155:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp399
	movq	%rax, %rcx	 ; tmp399,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp400
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _83
 ; D:\TC\src\lexer.c:156:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _84
	movq	16(%rbp), %rax	 ; lexer, tmp401
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _85
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp402
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.5_86
	movq	%rcx, %r9	 ; _84,
	movq	%rdx, %r8	 ; _85,
	movq	%rax, %rdx	 ; SUB_ASSIGN_SYMBOL.5_86,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L67:
 ; D:\TC\src\lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$42, -17(%rbp)	 ;, c
	jne	.L68	 ;,
 ; D:\TC\src\lexer.c:157:         } else if (c == '*' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L68	 ;,
 ; D:\TC\src\lexer.c:158:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp403
	movq	%rax, %rcx	 ; tmp403,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp404
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _87
 ; D:\TC\src\lexer.c:159:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _88
	movq	16(%rbp), %rax	 ; lexer, tmp405
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _89
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp406
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.6_90
	movq	%rcx, %r9	 ; _88,
	movq	%rdx, %r8	 ; _89,
	movq	%rax, %rdx	 ; MUL_ASSIGN_SYMBOL.6_90,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L68:
 ; D:\TC\src\lexer.c:160:         } else if (c == '/' && p == '=') {
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L69	 ;,
 ; D:\TC\src\lexer.c:160:         } else if (c == '/' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L69	 ;,
 ; D:\TC\src\lexer.c:161:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp407
	movq	%rax, %rcx	 ; tmp407,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp408
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _91
 ; D:\TC\src\lexer.c:162:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _92
	movq	16(%rbp), %rax	 ; lexer, tmp409
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _93
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp410
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.7_94
	movq	%rcx, %r9	 ; _92,
	movq	%rdx, %r8	 ; _93,
	movq	%rax, %rdx	 ; DIV_ASSIGN_SYMBOL.7_94,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L69:
 ; D:\TC\src\lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$37, -17(%rbp)	 ;, c
	jne	.L70	 ;,
 ; D:\TC\src\lexer.c:163:         } else if (c == '%' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L70	 ;,
 ; D:\TC\src\lexer.c:164:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp411
	movq	%rax, %rcx	 ; tmp411,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp412
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _95
 ; D:\TC\src\lexer.c:165:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _96
	movq	16(%rbp), %rax	 ; lexer, tmp413
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _97
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp414
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.8_98
	movq	%rcx, %r9	 ; _96,
	movq	%rdx, %r8	 ; _97,
	movq	%rax, %rdx	 ; MOD_ASSIGN_SYMBOL.8_98,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L70:
 ; D:\TC\src\lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, -17(%rbp)	 ;, c
	jne	.L71	 ;,
 ; D:\TC\src\lexer.c:166:         } else if (c == '&' && p == '&') {
	cmpb	$38, -25(%rbp)	 ;, p
	jne	.L71	 ;,
 ; D:\TC\src\lexer.c:167:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp415
	movq	%rax, %rcx	 ; tmp415,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp416
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _99
 ; D:\TC\src\lexer.c:168:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _100
	movq	16(%rbp), %rax	 ; lexer, tmp417
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _101
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp418
	movq	(%rax), %rax	 ; AND_SYMBOL, AND_SYMBOL.9_102
	movq	%rcx, %r9	 ; _100,
	movq	%rdx, %r8	 ; _101,
	movq	%rax, %rdx	 ; AND_SYMBOL.9_102,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L71:
 ; D:\TC\src\lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, -17(%rbp)	 ;, c
	jne	.L72	 ;,
 ; D:\TC\src\lexer.c:169:         } else if (c == '|' && p == '|') {
	cmpb	$124, -25(%rbp)	 ;, p
	jne	.L72	 ;,
 ; D:\TC\src\lexer.c:170:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp419
	movq	%rax, %rcx	 ; tmp419,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp420
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _103
 ; D:\TC\src\lexer.c:171:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _104
	movq	16(%rbp), %rax	 ; lexer, tmp421
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _105
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp422
	movq	(%rax), %rax	 ; OR_SYMBOL, OR_SYMBOL.10_106
	movq	%rcx, %r9	 ; _104,
	movq	%rdx, %r8	 ; _105,
	movq	%rax, %rdx	 ; OR_SYMBOL.10_106,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L72:
 ; D:\TC\src\lexer.c:172:         } else if (c == '(')
	cmpb	$40, -17(%rbp)	 ;, c
	jne	.L73	 ;,
 ; D:\TC\src\lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp423
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _107
 ; D:\TC\src\lexer.c:173:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _108
	movq	16(%rbp), %rax	 ; lexer, tmp424
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _109
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp425
	movq	(%rax), %rax	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.11_110
	movq	%rcx, %r9	 ; _108,
	movq	%rdx, %r8	 ; _109,
	movq	%rax, %rdx	 ; L_PAREN_SYMBOL.11_110,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L73:
 ; D:\TC\src\lexer.c:174:         else if (c == ')')
	cmpb	$41, -17(%rbp)	 ;, c
	jne	.L74	 ;,
 ; D:\TC\src\lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp426
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _111
 ; D:\TC\src\lexer.c:175:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _112
	movq	16(%rbp), %rax	 ; lexer, tmp427
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _113
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp428
	movq	(%rax), %rax	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.12_114
	movq	%rcx, %r9	 ; _112,
	movq	%rdx, %r8	 ; _113,
	movq	%rax, %rdx	 ; R_PAREN_SYMBOL.12_114,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L74:
 ; D:\TC\src\lexer.c:176:         else if (c == '{')
	cmpb	$123, -17(%rbp)	 ;, c
	jne	.L75	 ;,
 ; D:\TC\src\lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp429
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _115
 ; D:\TC\src\lexer.c:177:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _116
	movq	16(%rbp), %rax	 ; lexer, tmp430
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _117
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp431
	movq	(%rax), %rax	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.13_118
	movq	%rcx, %r9	 ; _116,
	movq	%rdx, %r8	 ; _117,
	movq	%rax, %rdx	 ; L_BRACE_SYMBOL.13_118,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L75:
 ; D:\TC\src\lexer.c:178:         else if (c == '}')
	cmpb	$125, -17(%rbp)	 ;, c
	jne	.L76	 ;,
 ; D:\TC\src\lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp432
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _119
 ; D:\TC\src\lexer.c:179:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _120
	movq	16(%rbp), %rax	 ; lexer, tmp433
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _121
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp434
	movq	(%rax), %rax	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.14_122
	movq	%rcx, %r9	 ; _120,
	movq	%rdx, %r8	 ; _121,
	movq	%rax, %rdx	 ; R_BRACE_SYMBOL.14_122,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L76:
 ; D:\TC\src\lexer.c:180:         else if (c == ',')
	cmpb	$44, -17(%rbp)	 ;, c
	jne	.L77	 ;,
 ; D:\TC\src\lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp435
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _123
 ; D:\TC\src\lexer.c:181:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _124
	movq	16(%rbp), %rax	 ; lexer, tmp436
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _125
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp437
	movq	(%rax), %rax	 ; COMMA_SYMBOL, COMMA_SYMBOL.15_126
	movq	%rcx, %r9	 ; _124,
	movq	%rdx, %r8	 ; _125,
	movq	%rax, %rdx	 ; COMMA_SYMBOL.15_126,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L77:
 ; D:\TC\src\lexer.c:182:         else if (c == '!')
	cmpb	$33, -17(%rbp)	 ;, c
	jne	.L78	 ;,
 ; D:\TC\src\lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp438
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _127
 ; D:\TC\src\lexer.c:183:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _128
	movq	16(%rbp), %rax	 ; lexer, tmp439
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _129
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp440
	movq	(%rax), %rax	 ; NOT_SYMBOL, NOT_SYMBOL.16_130
	movq	%rcx, %r9	 ; _128,
	movq	%rdx, %r8	 ; _129,
	movq	%rax, %rdx	 ; NOT_SYMBOL.16_130,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L78:
 ; D:\TC\src\lexer.c:184:         else if (c == '.')
	cmpb	$46, -17(%rbp)	 ;, c
	jne	.L79	 ;,
 ; D:\TC\src\lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp441
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _131
 ; D:\TC\src\lexer.c:185:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _132
	movq	16(%rbp), %rax	 ; lexer, tmp442
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _133
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp443
	movq	(%rax), %rax	 ; DOT_SYMBOL, DOT_SYMBOL.17_134
	movq	%rcx, %r9	 ; _132,
	movq	%rdx, %r8	 ; _133,
	movq	%rax, %rdx	 ; DOT_SYMBOL.17_134,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L79:
 ; D:\TC\src\lexer.c:186:         else if (c == '[')
	cmpb	$91, -17(%rbp)	 ;, c
	jne	.L80	 ;,
 ; D:\TC\src\lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp444
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _135
 ; D:\TC\src\lexer.c:187:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _136
	movq	16(%rbp), %rax	 ; lexer, tmp445
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _137
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp446
	movq	(%rax), %rax	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.18_138
	movq	%rcx, %r9	 ; _136,
	movq	%rdx, %r8	 ; _137,
	movq	%rax, %rdx	 ; L_BRACKET_SYMBOL.18_138,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L80:
 ; D:\TC\src\lexer.c:188:         else if (c == ']')
	cmpb	$93, -17(%rbp)	 ;, c
	jne	.L81	 ;,
 ; D:\TC\src\lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp447
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _139
 ; D:\TC\src\lexer.c:189:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _140
	movq	16(%rbp), %rax	 ; lexer, tmp448
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _141
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp449
	movq	(%rax), %rax	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.19_142
	movq	%rcx, %r9	 ; _140,
	movq	%rdx, %r8	 ; _141,
	movq	%rax, %rdx	 ; R_BRACKET_SYMBOL.19_142,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L81:
 ; D:\TC\src\lexer.c:190:         else if (c == ';')
	cmpb	$59, -17(%rbp)	 ;, c
	jne	.L82	 ;,
 ; D:\TC\src\lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp450
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _143
 ; D:\TC\src\lexer.c:191:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _144
	movq	16(%rbp), %rax	 ; lexer, tmp451
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _145
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp452
	movq	(%rax), %rax	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.20_146
	movq	%rcx, %r9	 ; _144,
	movq	%rdx, %r8	 ; _145,
	movq	%rax, %rdx	 ; SEMICOLON_SYMBOL.20_146,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L82:
 ; D:\TC\src\lexer.c:192:         else if (c == '_')
	cmpb	$95, -17(%rbp)	 ;, c
	jne	.L83	 ;,
 ; D:\TC\src\lexer.c:193:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp453
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _147
 ; D:\TC\src\lexer.c:193:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _148
	movq	16(%rbp), %rax	 ; lexer, tmp454
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _149
	movq	.refptr.UNDERLINE_SYMBOL(%rip), %rax	 ;, tmp455
	movq	(%rax), %rax	 ; UNDERLINE_SYMBOL, UNDERLINE_SYMBOL.21_150
	movq	%rcx, %r9	 ; _148,
	movq	%rdx, %r8	 ; _149,
	movq	%rax, %rdx	 ; UNDERLINE_SYMBOL.21_150,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L83:
 ; D:\TC\src\lexer.c:194:         else if (c == '+')
	cmpb	$43, -17(%rbp)	 ;, c
	jne	.L84	 ;,
 ; D:\TC\src\lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp456
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _151
 ; D:\TC\src\lexer.c:195:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _152
	movq	16(%rbp), %rax	 ; lexer, tmp457
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _153
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp458
	movq	(%rax), %rax	 ; ADD_SYMBOL, ADD_SYMBOL.22_154
	movq	%rcx, %r9	 ; _152,
	movq	%rdx, %r8	 ; _153,
	movq	%rax, %rdx	 ; ADD_SYMBOL.22_154,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L84:
 ; D:\TC\src\lexer.c:196:         else if (c == '-')
	cmpb	$45, -17(%rbp)	 ;, c
	jne	.L85	 ;,
 ; D:\TC\src\lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp459
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _155
 ; D:\TC\src\lexer.c:197:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _156
	movq	16(%rbp), %rax	 ; lexer, tmp460
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _157
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp461
	movq	(%rax), %rax	 ; SUB_SYMBOL, SUB_SYMBOL.23_158
	movq	%rcx, %r9	 ; _156,
	movq	%rdx, %r8	 ; _157,
	movq	%rax, %rdx	 ; SUB_SYMBOL.23_158,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L85:
 ; D:\TC\src\lexer.c:198:         else if (c == '*')
	cmpb	$42, -17(%rbp)	 ;, c
	jne	.L86	 ;,
 ; D:\TC\src\lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp462
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _159
 ; D:\TC\src\lexer.c:199:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _160
	movq	16(%rbp), %rax	 ; lexer, tmp463
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _161
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp464
	movq	(%rax), %rax	 ; MUL_SYMBOL, MUL_SYMBOL.24_162
	movq	%rcx, %r9	 ; _160,
	movq	%rdx, %r8	 ; _161,
	movq	%rax, %rdx	 ; MUL_SYMBOL.24_162,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L86:
 ; D:\TC\src\lexer.c:200:         else if (c == '/')
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L87	 ;,
 ; D:\TC\src\lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp465
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _163
 ; D:\TC\src\lexer.c:201:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _164
	movq	16(%rbp), %rax	 ; lexer, tmp466
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _165
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp467
	movq	(%rax), %rax	 ; DIV_SYMBOL, DIV_SYMBOL.25_166
	movq	%rcx, %r9	 ; _164,
	movq	%rdx, %r8	 ; _165,
	movq	%rax, %rdx	 ; DIV_SYMBOL.25_166,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L87:
 ; D:\TC\src\lexer.c:202:         else if (c == '%')
	cmpb	$37, -17(%rbp)	 ;, c
	jne	.L88	 ;,
 ; D:\TC\src\lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp468
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _167
 ; D:\TC\src\lexer.c:203:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _168
	movq	16(%rbp), %rax	 ; lexer, tmp469
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _169
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp470
	movq	(%rax), %rax	 ; MOD_SYMBOL, MOD_SYMBOL.26_170
	movq	%rcx, %r9	 ; _168,
	movq	%rdx, %r8	 ; _169,
	movq	%rax, %rdx	 ; MOD_SYMBOL.26_170,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L88:
 ; D:\TC\src\lexer.c:204:         else if (c == '<')
	cmpb	$60, -17(%rbp)	 ;, c
	jne	.L89	 ;,
 ; D:\TC\src\lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp471
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _171
 ; D:\TC\src\lexer.c:205:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _172
	movq	16(%rbp), %rax	 ; lexer, tmp472
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _173
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp473
	movq	(%rax), %rax	 ; LT_SYMBOL, LT_SYMBOL.27_174
	movq	%rcx, %r9	 ; _172,
	movq	%rdx, %r8	 ; _173,
	movq	%rax, %rdx	 ; LT_SYMBOL.27_174,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L89:
 ; D:\TC\src\lexer.c:206:         else if (c == '>')
	cmpb	$62, -17(%rbp)	 ;, c
	jne	.L90	 ;,
 ; D:\TC\src\lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp474
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _175
 ; D:\TC\src\lexer.c:207:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _176
	movq	16(%rbp), %rax	 ; lexer, tmp475
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _177
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp476
	movq	(%rax), %rax	 ; GT_SYMBOL, GT_SYMBOL.28_178
	movq	%rcx, %r9	 ; _176,
	movq	%rdx, %r8	 ; _177,
	movq	%rax, %rdx	 ; GT_SYMBOL.28_178,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L90:
 ; D:\TC\src\lexer.c:208:         else if (c == '=')
	cmpb	$61, -17(%rbp)	 ;, c
	jne	.L91	 ;,
 ; D:\TC\src\lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp477
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _179
 ; D:\TC\src\lexer.c:209:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _180
	movq	16(%rbp), %rax	 ; lexer, tmp478
	movq	24(%rax), %rdx	 ; lexer_210(D)->line, _181
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp479
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.29_182
	movq	%rcx, %r9	 ; _180,
	movq	%rdx, %r8	 ; _181,
	movq	%rax, %rdx	 ; ASSIGN_SYMBOL.29_182,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L91:
 ; D:\TC\src\lexer.c:211:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp480
	movq	32(%rax), %rax	 ; lexer_210(D)->column, _183
 ; D:\TC\src\lexer.c:211:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rdx	 ;, _184
	movq	16(%rbp), %rax	 ; lexer, tmp481
	movq	24(%rax), %rax	 ; lexer_210(D)->line, _185
	movq	%rdx, %r8	 ; _184,
	movq	%rax, %rdx	 ; _185,
	leaq	.LC6(%rip), %rax	 ;, tmp482
	movq	%rax, %rcx	 ; tmp482,
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:212:             return create_token(EOF_TOKEN, NULL, 0, 0);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
.L19:
 ; D:\TC\src\lexer.c:215: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
get_next_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movl	%edx, %eax	 ; skip_comment, tmp90
	movb	%al, 24(%rbp)	 ; tmp91, skip_comment
 ; D:\TC\src\lexer.c:218:     if (lexer->peeked_token != NULL) {
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	40(%rax), %rax	 ; lexer_10(D)->peeked_token, _1
 ; D:\TC\src\lexer.c:218:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; _1
	je	.L94	 ;,
 ; D:\TC\src\lexer.c:219:         lexer->current_token = lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	40(%rax), %rdx	 ; lexer_10(D)->peeked_token, _2
 ; D:\TC\src\lexer.c:219:         lexer->current_token = lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp94
	movq	%rdx, 72(%rax)	 ; _2, lexer_10(D)->current_token
 ; D:\TC\src\lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	48(%rax), %rdx	 ; lexer_10(D)->peeked_position, _3
 ; D:\TC\src\lexer.c:220:         lexer->position = lexer->peeked_position;
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movq	%rdx, 8(%rax)	 ; _3, lexer_10(D)->position
 ; D:\TC\src\lexer.c:221:         lexer->line = lexer->peeked_line;
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	56(%rax), %rdx	 ; lexer_10(D)->peeked_line, _4
 ; D:\TC\src\lexer.c:221:         lexer->line = lexer->peeked_line;
	movq	16(%rbp), %rax	 ; lexer, tmp98
	movq	%rdx, 24(%rax)	 ; _4, lexer_10(D)->line
 ; D:\TC\src\lexer.c:222:         lexer->column = lexer->peeked_column;
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	64(%rax), %rdx	 ; lexer_10(D)->peeked_column, _5
 ; D:\TC\src\lexer.c:222:         lexer->column = lexer->peeked_column;
	movq	16(%rbp), %rax	 ; lexer, tmp100
	movq	%rdx, 32(%rax)	 ; _5, lexer_10(D)->column
 ; D:\TC\src\lexer.c:223:         lexer->peeked_token = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	$0, 40(%rax)	 ;, lexer_10(D)->peeked_token
 ; D:\TC\src\lexer.c:224:         return lexer->current_token;
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	72(%rax), %rax	 ; lexer_10(D)->current_token, _7
	jmp	.L95	 ;
.L94:
 ; D:\TC\src\lexer.c:226:     Token* token = next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _6
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp104, token
 ; D:\TC\src\lexer.c:227:     return lexer->current_token = token;
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	-8(%rbp), %rdx	 ; token, tmp106
	movq	%rdx, 72(%rax)	 ; tmp106, lexer_10(D)->current_token
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	72(%rax), %rax	 ; lexer_10(D)->current_token, _7
.L95:
 ; D:\TC\src\lexer.c:228: }
	leave	
	ret	
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
peek_next_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movl	%edx, %eax	 ; skip_comment, tmp89
	movb	%al, 24(%rbp)	 ; tmp90, skip_comment
 ; D:\TC\src\lexer.c:231:     if (lexer->peeked_token != NULL)
	movq	16(%rbp), %rax	 ; lexer, tmp91
	movq	40(%rax), %rax	 ; lexer_9(D)->peeked_token, _1
 ; D:\TC\src\lexer.c:231:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; _1
	je	.L97	 ;,
 ; D:\TC\src\lexer.c:232:         return lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	40(%rax), %rax	 ; lexer_9(D)->peeked_token, _6
	jmp	.L98	 ;
.L97:
 ; D:\TC\src\lexer.c:233:     size_t saved_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	8(%rax), %rax	 ; lexer_9(D)->position, tmp94
	movq	%rax, -8(%rbp)	 ; tmp94, saved_position
 ; D:\TC\src\lexer.c:234:     size_t saved_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	24(%rax), %rax	 ; lexer_9(D)->line, tmp96
	movq	%rax, -16(%rbp)	 ; tmp96, saved_line
 ; D:\TC\src\lexer.c:235:     size_t saved_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	32(%rax), %rax	 ; lexer_9(D)->column, tmp98
	movq	%rax, -24(%rbp)	 ; tmp98, saved_column
 ; D:\TC\src\lexer.c:236:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _2
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	get_next_token	 ;
	movq	%rax, -32(%rbp)	 ; tmp100, token
 ; D:\TC\src\lexer.c:237:     lexer->peeked_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	8(%rax), %rdx	 ; lexer_9(D)->position, _3
 ; D:\TC\src\lexer.c:237:     lexer->peeked_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	%rdx, 48(%rax)	 ; _3, lexer_9(D)->peeked_position
 ; D:\TC\src\lexer.c:238:     lexer->peeked_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	24(%rax), %rdx	 ; lexer_9(D)->line, _4
 ; D:\TC\src\lexer.c:238:     lexer->peeked_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movq	%rdx, 56(%rax)	 ; _4, lexer_9(D)->peeked_line
 ; D:\TC\src\lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	32(%rax), %rdx	 ; lexer_9(D)->column, _5
 ; D:\TC\src\lexer.c:239:     lexer->peeked_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp106
	movq	%rdx, 64(%rax)	 ; _5, lexer_9(D)->peeked_column
 ; D:\TC\src\lexer.c:240:     lexer->position = saved_position;
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	-8(%rbp), %rdx	 ; saved_position, tmp108
	movq	%rdx, 8(%rax)	 ; tmp108, lexer_9(D)->position
 ; D:\TC\src\lexer.c:241:     lexer->line = saved_line;
	movq	16(%rbp), %rax	 ; lexer, tmp109
	movq	-16(%rbp), %rdx	 ; saved_line, tmp110
	movq	%rdx, 24(%rax)	 ; tmp110, lexer_9(D)->line
 ; D:\TC\src\lexer.c:242:     lexer->column = saved_column;
	movq	16(%rbp), %rax	 ; lexer, tmp111
	movq	-24(%rbp), %rdx	 ; saved_column, tmp112
	movq	%rdx, 32(%rax)	 ; tmp112, lexer_9(D)->column
 ; D:\TC\src\lexer.c:243:     lexer->peeked_token = token;
	movq	16(%rbp), %rax	 ; lexer, tmp113
	movq	-32(%rbp), %rdx	 ; token, tmp114
	movq	%rdx, 40(%rax)	 ; tmp114, lexer_9(D)->peeked_token
 ; D:\TC\src\lexer.c:244:     return token;
	movq	-32(%rbp), %rax	 ; token, _6
.L98:
 ; D:\TC\src\lexer.c:245: }
	leave	
	ret	
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:\TC\src\lexer.c:248:     return lexer->current_token;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	72(%rax), %rax	 ; lexer_2(D)->current_token, _3
 ; D:\TC\src\lexer.c:249: }
	popq	%rbp	 ;
	ret	
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:\TC\src\lexer.c:252:     lexer->position = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp82
	movq	$0, 8(%rax)	 ;, lexer_2(D)->position
 ; D:\TC\src\lexer.c:253:     lexer->line = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp83
	movq	$0, 24(%rax)	 ;, lexer_2(D)->line
 ; D:\TC\src\lexer.c:254:     lexer->column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	$0, 32(%rax)	 ;, lexer_2(D)->column
 ; D:\TC\src\lexer.c:255:     lexer->peeked_token = NULL;
	movq	16(%rbp), %rax	 ; lexer, tmp85
	movq	$0, 40(%rax)	 ;, lexer_2(D)->peeked_token
 ; D:\TC\src\lexer.c:256:     lexer->peeked_position = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp86
	movq	$0, 48(%rax)	 ;, lexer_2(D)->peeked_position
 ; D:\TC\src\lexer.c:257:     lexer->peeked_line = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp87
	movq	$0, 56(%rax)	 ;, lexer_2(D)->peeked_line
 ; D:\TC\src\lexer.c:258:     lexer->peeked_column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp88
	movq	$0, 64(%rax)	 ;, lexer_2(D)->peeked_column
 ; D:\TC\src\lexer.c:259:     lexer->current_token = NULL;
	movq	16(%rbp), %rax	 ; lexer, tmp89
	movq	$0, 72(%rax)	 ;, lexer_2(D)->current_token
 ; D:\TC\src\lexer.c:260: }
	nop	
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "next_token\0"
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	is_keyword;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.GT_SYMBOL, "dr"
	.globl	.refptr.GT_SYMBOL
	.linkonce	discard
.refptr.GT_SYMBOL:
	.quad	GT_SYMBOL
	.section	.rdata$.refptr.LT_SYMBOL, "dr"
	.globl	.refptr.LT_SYMBOL
	.linkonce	discard
.refptr.LT_SYMBOL:
	.quad	LT_SYMBOL
	.section	.rdata$.refptr.MOD_SYMBOL, "dr"
	.globl	.refptr.MOD_SYMBOL
	.linkonce	discard
.refptr.MOD_SYMBOL:
	.quad	MOD_SYMBOL
	.section	.rdata$.refptr.DIV_SYMBOL, "dr"
	.globl	.refptr.DIV_SYMBOL
	.linkonce	discard
.refptr.DIV_SYMBOL:
	.quad	DIV_SYMBOL
	.section	.rdata$.refptr.MUL_SYMBOL, "dr"
	.globl	.refptr.MUL_SYMBOL
	.linkonce	discard
.refptr.MUL_SYMBOL:
	.quad	MUL_SYMBOL
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.ADD_SYMBOL, "dr"
	.globl	.refptr.ADD_SYMBOL
	.linkonce	discard
.refptr.ADD_SYMBOL:
	.quad	ADD_SYMBOL
	.section	.rdata$.refptr.UNDERLINE_SYMBOL, "dr"
	.globl	.refptr.UNDERLINE_SYMBOL
	.linkonce	discard
.refptr.UNDERLINE_SYMBOL:
	.quad	UNDERLINE_SYMBOL
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
	.section	.rdata$.refptr.R_BRACKET_SYMBOL, "dr"
	.globl	.refptr.R_BRACKET_SYMBOL
	.linkonce	discard
.refptr.R_BRACKET_SYMBOL:
	.quad	R_BRACKET_SYMBOL
	.section	.rdata$.refptr.L_BRACKET_SYMBOL, "dr"
	.globl	.refptr.L_BRACKET_SYMBOL
	.linkonce	discard
.refptr.L_BRACKET_SYMBOL:
	.quad	L_BRACKET_SYMBOL
	.section	.rdata$.refptr.DOT_SYMBOL, "dr"
	.globl	.refptr.DOT_SYMBOL
	.linkonce	discard
.refptr.DOT_SYMBOL:
	.quad	DOT_SYMBOL
	.section	.rdata$.refptr.NOT_SYMBOL, "dr"
	.globl	.refptr.NOT_SYMBOL
	.linkonce	discard
.refptr.NOT_SYMBOL:
	.quad	NOT_SYMBOL
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
	.section	.rdata$.refptr.R_BRACE_SYMBOL, "dr"
	.globl	.refptr.R_BRACE_SYMBOL
	.linkonce	discard
.refptr.R_BRACE_SYMBOL:
	.quad	R_BRACE_SYMBOL
	.section	.rdata$.refptr.L_BRACE_SYMBOL, "dr"
	.globl	.refptr.L_BRACE_SYMBOL
	.linkonce	discard
.refptr.L_BRACE_SYMBOL:
	.quad	L_BRACE_SYMBOL
	.section	.rdata$.refptr.R_PAREN_SYMBOL, "dr"
	.globl	.refptr.R_PAREN_SYMBOL
	.linkonce	discard
.refptr.R_PAREN_SYMBOL:
	.quad	R_PAREN_SYMBOL
	.section	.rdata$.refptr.L_PAREN_SYMBOL, "dr"
	.globl	.refptr.L_PAREN_SYMBOL
	.linkonce	discard
.refptr.L_PAREN_SYMBOL:
	.quad	L_PAREN_SYMBOL
	.section	.rdata$.refptr.OR_SYMBOL, "dr"
	.globl	.refptr.OR_SYMBOL
	.linkonce	discard
.refptr.OR_SYMBOL:
	.quad	OR_SYMBOL
	.section	.rdata$.refptr.AND_SYMBOL, "dr"
	.globl	.refptr.AND_SYMBOL
	.linkonce	discard
.refptr.AND_SYMBOL:
	.quad	AND_SYMBOL
	.section	.rdata$.refptr.MOD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MOD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MOD_ASSIGN_SYMBOL:
	.quad	MOD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.DIV_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.DIV_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.DIV_ASSIGN_SYMBOL:
	.quad	DIV_ASSIGN_SYMBOL
	.section	.rdata$.refptr.MUL_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MUL_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MUL_ASSIGN_SYMBOL:
	.quad	MUL_ASSIGN_SYMBOL
	.section	.rdata$.refptr.SUB_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.SUB_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.SUB_ASSIGN_SYMBOL:
	.quad	SUB_ASSIGN_SYMBOL
	.section	.rdata$.refptr.ADD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ADD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ADD_ASSIGN_SYMBOL:
	.quad	ADD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.GE_SYMBOL, "dr"
	.globl	.refptr.GE_SYMBOL
	.linkonce	discard
.refptr.GE_SYMBOL:
	.quad	GE_SYMBOL
	.section	.rdata$.refptr.LE_SYMBOL, "dr"
	.globl	.refptr.LE_SYMBOL
	.linkonce	discard
.refptr.LE_SYMBOL:
	.quad	LE_SYMBOL
	.section	.rdata$.refptr.NE_SYMBOL, "dr"
	.globl	.refptr.NE_SYMBOL
	.linkonce	discard
.refptr.NE_SYMBOL:
	.quad	NE_SYMBOL
	.section	.rdata$.refptr.EQ_SYMBOL, "dr"
	.globl	.refptr.EQ_SYMBOL
	.linkonce	discard
.refptr.EQ_SYMBOL:
	.quad	EQ_SYMBOL

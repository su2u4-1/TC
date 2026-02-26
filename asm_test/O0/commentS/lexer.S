	.file	"D:\\TC\\src\\lexer.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
	.text
	.globl	create_lexer
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.seh_proc	create_lexer
create_lexer:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
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
 ; D:\TC\src\lexer.c:10:     lexer->peeked_token = 0;
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
 ; D:\TC\src\lexer.c:14:     lexer->current_token = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp96
	movq	$0, 72(%rax)	 ;, lexer_3->current_token
 ; D:\TC\src\lexer.c:15:     return lexer;
	movq	-8(%rbp), %rax	 ; lexer, _16
 ; D:\TC\src\lexer.c:16: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.def	create_token;	.scl	3;	.type	32;	.endef
	.seh_proc	create_token
create_token:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
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
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Lexer Error at Line %zu, Column %zu: %s\12\0"
	.text
	.def	lexer_error;	.scl	3;	.type	32;	.endef
	.seh_proc	lexer_error
lexer_error:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	leaq	48(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)	 ; message, message
	movq	%rdx, 40(%rbp)	 ; line, line
	movq	%r8, 48(%rbp)	 ; column, column
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	48(%rbp), %rax	 ; column, tmp86
	leaq	1(%rax), %rsi	 ;, _1
	movq	40(%rbp), %rax	 ; line, tmp87
	leaq	1(%rax), %rbx	 ;, _2
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:\TC\src\lexer.c:28:     fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
	movq	32(%rbp), %rdx	 ; message, tmp88
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
	.seh_endproc
	.def	get_current_char;	.scl	3;	.type	32;	.endef
	.seh_proc	get_current_char
get_current_char:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
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
	.seh_endproc
	.def	peek_next_char;	.scl	3;	.type	32;	.endef
	.seh_proc	peek_next_char
peek_next_char:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
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
	.seh_endproc
	.def	newline;	.scl	3;	.type	32;	.endef
	.seh_proc	newline
newline:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
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
	.seh_endproc
	.def	move_position;	.scl	3;	.type	32;	.endef
	.seh_proc	move_position
move_position:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
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
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Unterminated string literal\0"
.LC2:
	.ascii "c != '\\0'\0"
.LC3:
	.ascii "D:\\TC\\src\\lexer.c\0"
.LC4:
	.ascii "Unterminated comment\0"
.LC5:
	.ascii "Unexpected character\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
	.seh_proc	next_token
next_token:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$152, %rsp	 ;,
	.seh_stackalloc	152
	leaq	144(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 144
	.seh_endprologue
	movq	%rcx, 32(%rbp)	 ; lexer, lexer
	movl	%edx, %eax	 ; skip_comment, tmp272
	movb	%al, 40(%rbp)	 ; tmp273, skip_comment
 ; D:\TC\src\lexer.c:60:     char c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp274
	movq	%rax, %rcx	 ; tmp274,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp275, c
 ; D:\TC\src\lexer.c:61:     if (c == '\0')
	cmpb	$0, -1(%rbp)	 ;, c
	jne	.L18	 ;,
 ; D:\TC\src\lexer.c:62:         return create_token(EOF_TOKEN, 0, lexer->line, lexer->column);
	movq	32(%rbp), %rax	 ; lexer, tmp276
	movq	32(%rax), %rdx	 ; lexer_213(D)->column, _1
	movq	32(%rbp), %rax	 ; lexer, tmp277
	movq	24(%rax), %rax	 ; lexer_213(D)->line, _2
	movq	%rdx, %r9	 ; _1,
	movq	%rax, %r8	 ; _2,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L18:
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$32, -1(%rbp)	 ;, c
	je	.L20	 ;,
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, -1(%rbp)	 ;, c
	je	.L20	 ;,
 ; D:\TC\src\lexer.c:63:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$13, -1(%rbp)	 ;, c
	jne	.L21	 ;,
.L20:
 ; D:\TC\src\lexer.c:64:         return next_token(lexer, skip_comment);
	movsbl	40(%rbp), %edx	 ; skip_comment, _3
	movq	32(%rbp), %rax	 ; lexer, tmp278
	movq	%rax, %rcx	 ; tmp278,
	call	next_token	 ;
	jmp	.L19	 ;
.L21:
 ; D:\TC\src\lexer.c:65:     else if (c == '\n') {
	cmpb	$10, -1(%rbp)	 ;, c
	jne	.L22	 ;,
 ; D:\TC\src\lexer.c:66:         newline(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp279
	movq	%rax, %rcx	 ; tmp279,
	call	newline	 ;
 ; D:\TC\src\lexer.c:67:         return next_token(lexer, skip_comment);
	movsbl	40(%rbp), %edx	 ; skip_comment, _4
	movq	32(%rbp), %rax	 ; lexer, tmp280
	movq	%rax, %rcx	 ; tmp280,
	call	next_token	 ;
	jmp	.L19	 ;
.L22:
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$96, -1(%rbp)	 ;, c
	jle	.L23	 ;,
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$122, -1(%rbp)	 ;, c
	jle	.L24	 ;,
.L23:
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$64, -1(%rbp)	 ;, c
	jle	.L25	 ;,
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$90, -1(%rbp)	 ;, c
	jle	.L24	 ;,
.L25:
 ; D:\TC\src\lexer.c:68:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$95, -1(%rbp)	 ;, c
	jne	.L26	 ;,
.L24:
 ; D:\TC\src\lexer.c:69:         size_t start = lexer->position - 1;
	movq	32(%rbp), %rax	 ; lexer, tmp281
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _5
 ; D:\TC\src\lexer.c:69:         size_t start = lexer->position - 1;
	subq	$1, %rax	 ;, tmp282
	movq	%rax, -96(%rbp)	 ; tmp282, start
 ; D:\TC\src\lexer.c:70:         size_t column_start = lexer->column - 1;
	movq	32(%rbp), %rax	 ; lexer, tmp283
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _6
 ; D:\TC\src\lexer.c:70:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp284
	movq	%rax, -104(%rbp)	 ; tmp284, column_start
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L27	 ;
.L29:
 ; D:\TC\src\lexer.c:72:             c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp285
	movq	%rax, %rcx	 ; tmp285,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp286, c
.L27:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$96, -1(%rbp)	 ;, c
	jle	.L28	 ;,
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$122, -1(%rbp)	 ;, c
	jle	.L29	 ;,
.L28:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$64, -1(%rbp)	 ;, c
	jle	.L30	 ;,
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$90, -1(%rbp)	 ;, c
	jle	.L29	 ;,
.L30:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$47, -1(%rbp)	 ;, c
	jle	.L31	 ;,
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$57, -1(%rbp)	 ;, c
	jle	.L29	 ;,
.L31:
 ; D:\TC\src\lexer.c:71:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$95, -1(%rbp)	 ;, c
	je	.L29	 ;,
 ; D:\TC\src\lexer.c:73:         move_position(lexer, -1);
	movq	32(%rbp), %rax	 ; lexer, tmp287
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp287,
	call	move_position	 ;
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	32(%rbp), %rax	 ; lexer, tmp288
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _7
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	-96(%rbp), %rax	 ; start, _8
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	32(%rbp), %rdx	 ; lexer, tmp289
	movq	(%rdx), %rcx	 ; lexer_213(D)->source, _9
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-96(%rbp), %rdx	 ; start, tmp290
	addq	%rdx, %rcx	 ; tmp290, _10
 ; D:\TC\src\lexer.c:74:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rdx	 ; _8,
	call	create_string	 ;
	movq	%rax, -112(%rbp)	 ; tmp291, content
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	movq	-112(%rbp), %rax	 ; content, tmp292
	movq	%rax, %rcx	 ; tmp292,
	call	is_keyword	 ;
 ; D:\TC\src\lexer.c:75:         if (is_keyword(content))
	testb	%al, %al	 ; _11
	je	.L32	 ;,
 ; D:\TC\src\lexer.c:76:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp293
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _12
	movq	-104(%rbp), %rcx	 ; column_start, tmp294
	movq	-112(%rbp), %rax	 ; content, tmp295
	movq	%rcx, %r9	 ; tmp294,
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp295,
	movl	$6, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L32:
 ; D:\TC\src\lexer.c:78:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp296
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _13
	movq	-104(%rbp), %rcx	 ; column_start, tmp297
	movq	-112(%rbp), %rax	 ; content, tmp298
	movq	%rcx, %r9	 ; tmp297,
	movq	%rdx, %r8	 ; _13,
	movq	%rax, %rdx	 ; tmp298,
	movl	$1, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L26:
 ; D:\TC\src\lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$47, -1(%rbp)	 ;, c
	jle	.L33	 ;,
 ; D:\TC\src\lexer.c:79:     } else if ('0' <= c && c <= '9') {
	cmpb	$57, -1(%rbp)	 ;, c
	jg	.L33	 ;,
 ; D:\TC\src\lexer.c:80:         size_t start = lexer->position - 1;
	movq	32(%rbp), %rax	 ; lexer, tmp299
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _14
 ; D:\TC\src\lexer.c:80:         size_t start = lexer->position - 1;
	subq	$1, %rax	 ;, tmp300
	movq	%rax, -24(%rbp)	 ; tmp300, start
 ; D:\TC\src\lexer.c:81:         size_t column_start = lexer->column - 1;
	movq	32(%rbp), %rax	 ; lexer, tmp301
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _15
 ; D:\TC\src\lexer.c:81:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp302
	movq	%rax, -32(%rbp)	 ; tmp302, column_start
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	jmp	.L34	 ;
.L36:
 ; D:\TC\src\lexer.c:83:             c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp303
	movq	%rax, %rcx	 ; tmp303,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp304, c
.L34:
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$47, -1(%rbp)	 ;, c
	jle	.L35	 ;,
 ; D:\TC\src\lexer.c:82:         while ('0' <= c && c <= '9')
	cmpb	$57, -1(%rbp)	 ;, c
	jle	.L36	 ;,
.L35:
 ; D:\TC\src\lexer.c:84:         TokenType type = INTEGER;
	movl	$2, -8(%rbp)	 ;, type
 ; D:\TC\src\lexer.c:85:         char p = peek_next_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp305
	movq	%rax, %rcx	 ; tmp305,
	call	peek_next_char	 ;
	movb	%al, -33(%rbp)	 ; tmp306, p
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, -1(%rbp)	 ;, c
	jne	.L37	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$47, -33(%rbp)	 ;, p
	jle	.L37	 ;,
 ; D:\TC\src\lexer.c:86:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$57, -33(%rbp)	 ;, p
	jg	.L37	 ;,
 ; D:\TC\src\lexer.c:87:             c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp307
	movq	%rax, %rcx	 ; tmp307,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp308, c
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	jmp	.L38	 ;
.L40:
 ; D:\TC\src\lexer.c:89:                 c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp309
	movq	%rax, %rcx	 ; tmp309,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp310, c
.L38:
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$47, -1(%rbp)	 ;, c
	jle	.L39	 ;,
 ; D:\TC\src\lexer.c:88:             while ('0' <= c && c <= '9')
	cmpb	$57, -1(%rbp)	 ;, c
	jle	.L40	 ;,
.L39:
 ; D:\TC\src\lexer.c:90:             type = FLOAT;
	movl	$3, -8(%rbp)	 ;, type
.L37:
 ; D:\TC\src\lexer.c:92:         move_position(lexer, -1);
	movq	32(%rbp), %rax	 ; lexer, tmp311
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp311,
	call	move_position	 ;
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp312
	movq	24(%rax), %rbx	 ; lexer_213(D)->line, _16
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp313
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _17
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-24(%rbp), %rax	 ; start, _18
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rdx	 ; lexer, tmp314
	movq	(%rdx), %rcx	 ; lexer_213(D)->source, _19
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-24(%rbp), %rdx	 ; start, tmp315
	addq	%rdx, %rcx	 ; tmp315, _20
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _18,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _21
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-32(%rbp), %rcx	 ; column_start, tmp316
	movl	-8(%rbp), %eax	 ; type, tmp317
	movq	%rcx, %r9	 ; tmp316,
	movq	%rbx, %r8	 ; _16,
	movl	%eax, %ecx	 ; tmp317,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:93:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L33:
 ; D:\TC\src\lexer.c:94:     } else if (c == '"') {
	cmpb	$34, -1(%rbp)	 ;, c
	jne	.L41	 ;,
 ; D:\TC\src\lexer.c:95:         size_t start = lexer->position;
	movq	32(%rbp), %rax	 ; lexer, tmp318
	movq	8(%rax), %rax	 ; lexer_213(D)->position, tmp319
	movq	%rax, -80(%rbp)	 ; tmp319, start
 ; D:\TC\src\lexer.c:96:         size_t column_start = lexer->column - 1;
	movq	32(%rbp), %rax	 ; lexer, tmp320
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _22
 ; D:\TC\src\lexer.c:96:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp321
	movq	%rax, -88(%rbp)	 ; tmp321, column_start
 ; D:\TC\src\lexer.c:97:         c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp322
	movq	%rax, %rcx	 ; tmp322,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp323, c
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L42	 ;
.L44:
 ; D:\TC\src\lexer.c:99:             c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp324
	movq	%rax, %rcx	 ; tmp324,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp325, c
.L42:
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, -1(%rbp)	 ;, c
	je	.L43	 ;,
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$0, -1(%rbp)	 ;, c
	je	.L43	 ;,
 ; D:\TC\src\lexer.c:98:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$10, -1(%rbp)	 ;, c
	jne	.L44	 ;,
.L43:
 ; D:\TC\src\lexer.c:100:         if (c != '"') {
	cmpb	$34, -1(%rbp)	 ;, c
	je	.L45	 ;,
 ; D:\TC\src\lexer.c:101:             lexer_error("Unterminated string literal", lexer->line, start - 1);
	movq	-80(%rbp), %rax	 ; start, tmp326
	leaq	-1(%rax), %rdx	 ;, _23
	movq	32(%rbp), %rax	 ; lexer, tmp327
	movq	24(%rax), %rax	 ; lexer_213(D)->line, _24
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; _24,
	leaq	.LC1(%rip), %rax	 ;, tmp328
	movq	%rax, %rcx	 ; tmp328,
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:102:             if (c == '\n') newline(lexer);
	cmpb	$10, -1(%rbp)	 ;, c
	jne	.L46	 ;,
 ; D:\TC\src\lexer.c:102:             if (c == '\n') newline(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp329
	movq	%rax, %rcx	 ; tmp329,
	call	newline	 ;
.L46:
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp330
	movq	24(%rax), %rbx	 ; lexer_213(D)->line, _25
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp331
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _26
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-80(%rbp), %rax	 ; start, _27
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	 ;, _28
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp332
	movq	(%rax), %rcx	 ; lexer_213(D)->source, _29
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-80(%rbp), %rax	 ; start, tmp333
	addq	%rcx, %rax	 ; _29, _30
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rcx	 ; _30,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-88(%rbp), %rdx	 ; column_start, tmp334
	movq	%rdx, %r9	 ; tmp334,
	movq	%rbx, %r8	 ; _25,
	movq	%rax, %rdx	 ; _31,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:103:             return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	 ;
.L45:
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp335
	movq	24(%rax), %rbx	 ; lexer_213(D)->line, _32
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp336
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _33
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-80(%rbp), %rax	 ; start, _34
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	 ;, _35
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp337
	movq	(%rax), %rcx	 ; lexer_213(D)->source, _36
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-80(%rbp), %rax	 ; start, tmp338
	addq	%rcx, %rax	 ; _36, _37
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rcx	 ; _37,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-88(%rbp), %rdx	 ; column_start, tmp339
	movq	%rdx, %r9	 ; tmp339,
	movq	%rbx, %r8	 ; _32,
	movq	%rax, %rdx	 ; _38,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:105:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	 ;
.L41:
 ; D:\TC\src\lexer.c:107:         char p = peek_next_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp340
	movq	%rax, %rcx	 ; tmp340,
	call	peek_next_char	 ;
	movb	%al, -9(%rbp)	 ; tmp341, p
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, -1(%rbp)	 ;, c
	jne	.L47	 ;,
 ; D:\TC\src\lexer.c:108:         if (c == '/' && p == '/') {
	cmpb	$47, -9(%rbp)	 ;, p
	jne	.L47	 ;,
 ; D:\TC\src\lexer.c:109:             size_t start = lexer->position + 1;
	movq	32(%rbp), %rax	 ; lexer, tmp342
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _39
 ; D:\TC\src\lexer.c:109:             size_t start = lexer->position + 1;
	addq	$1, %rax	 ;, tmp343
	movq	%rax, -48(%rbp)	 ; tmp343, start
 ; D:\TC\src\lexer.c:110:             size_t column_start = lexer->column - 1;
	movq	32(%rbp), %rax	 ; lexer, tmp344
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _40
 ; D:\TC\src\lexer.c:110:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp345
	movq	%rax, -56(%rbp)	 ; tmp345, column_start
 ; D:\TC\src\lexer.c:111:             while (c != '\n' && c != '\0')
	jmp	.L48	 ;
.L50:
 ; D:\TC\src\lexer.c:112:                 c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp346
	movq	%rax, %rcx	 ; tmp346,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp347, c
.L48:
 ; D:\TC\src\lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$10, -1(%rbp)	 ;, c
	je	.L49	 ;,
 ; D:\TC\src\lexer.c:111:             while (c != '\n' && c != '\0')
	cmpb	$0, -1(%rbp)	 ;, c
	jne	.L50	 ;,
.L49:
 ; D:\TC\src\lexer.c:113:             move_position(lexer, -1);
	movq	32(%rbp), %rax	 ; lexer, tmp348
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp348,
	call	move_position	 ;
 ; D:\TC\src\lexer.c:114:             if (skip_comment)
	cmpb	$0, 40(%rbp)	 ;, skip_comment
	je	.L51	 ;,
 ; D:\TC\src\lexer.c:115:                 return next_token(lexer, skip_comment);
	movsbl	40(%rbp), %edx	 ; skip_comment, _41
	movq	32(%rbp), %rax	 ; lexer, tmp349
	movq	%rax, %rcx	 ; tmp349,
	call	next_token	 ;
	jmp	.L19	 ;
.L51:
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp350
	movq	24(%rax), %rbx	 ; lexer_213(D)->line, _42
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp351
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _43
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-48(%rbp), %rax	 ; start, _44
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rdx	 ; lexer, tmp352
	movq	(%rdx), %rcx	 ; lexer_213(D)->source, _45
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-48(%rbp), %rdx	 ; start, tmp353
	addq	%rdx, %rcx	 ; tmp353, _46
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _44,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-56(%rbp), %rdx	 ; column_start, tmp354
	movq	%rdx, %r9	 ; tmp354,
	movq	%rbx, %r8	 ; _42,
	movq	%rax, %rdx	 ; _47,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:116:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L47:
 ; D:\TC\src\lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$47, -1(%rbp)	 ;, c
	jne	.L52	 ;,
 ; D:\TC\src\lexer.c:117:         } else if (c == '/' && p == '*') {
	cmpb	$42, -9(%rbp)	 ;, p
	jne	.L52	 ;,
 ; D:\TC\src\lexer.c:118:             size_t start = lexer->position + 1;
	movq	32(%rbp), %rax	 ; lexer, tmp355
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _48
 ; D:\TC\src\lexer.c:118:             size_t start = lexer->position + 1;
	addq	$1, %rax	 ;, tmp356
	movq	%rax, -64(%rbp)	 ; tmp356, start
 ; D:\TC\src\lexer.c:119:             size_t column_start = lexer->column - 1;
	movq	32(%rbp), %rax	 ; lexer, tmp357
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _49
 ; D:\TC\src\lexer.c:119:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp358
	movq	%rax, -72(%rbp)	 ; tmp358, column_start
 ; D:\TC\src\lexer.c:120:             while (!(c == '*' && p == '/')) {
	jmp	.L53	 ;
.L57:
 ; D:\TC\src\lexer.c:121:                 c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp359
	movq	%rax, %rcx	 ; tmp359,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp360, c
 ; D:\TC\src\lexer.c:122:                 p = peek_next_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp361
	movq	%rax, %rcx	 ; tmp361,
	call	peek_next_char	 ;
	movb	%al, -9(%rbp)	 ; tmp362, p
 ; D:\TC\src\lexer.c:123:                 if (c == '\n') newline(lexer);
	cmpb	$10, -1(%rbp)	 ;, c
	jne	.L54	 ;,
 ; D:\TC\src\lexer.c:123:                 if (c == '\n') newline(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp363
	movq	%rax, %rcx	 ; tmp363,
	call	newline	 ;
.L54:
 ; D:\TC\src\lexer.c:124:                 if (p == '\0') break;
	cmpb	$0, -9(%rbp)	 ;, p
	je	.L92	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	cmpb	$0, -1(%rbp)	 ;, c
	jne	.L53	 ;,
 ; D:\TC\src\lexer.c:125:                 assert(c != '\0');
	leaq	.LC2(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$125, %edx	 ;,
	leaq	.LC3(%rip), %rax	 ;, tmp364
	movq	%rax, %rcx	 ; tmp364,
	call	__assert_func	 ;
.L53:
 ; D:\TC\src\lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$42, -1(%rbp)	 ;, c
	jne	.L57	 ;,
 ; D:\TC\src\lexer.c:120:             while (!(c == '*' && p == '/')) {
	cmpb	$47, -9(%rbp)	 ;, p
	jne	.L57	 ;,
	jmp	.L56	 ;
.L92:
 ; D:\TC\src\lexer.c:124:                 if (p == '\0') break;
	nop	
.L56:
 ; D:\TC\src\lexer.c:127:             if (p == '\0') {
	cmpb	$0, -9(%rbp)	 ;, p
	jne	.L58	 ;,
 ; D:\TC\src\lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	cmpb	$0, -1(%rbp)	 ;, c
	jne	.L59	 ;,
 ; D:\TC\src\lexer.c:128:                 if (c == '\0') move_position(lexer, -1);
	movq	32(%rbp), %rax	 ; lexer, tmp365
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp365,
	call	move_position	 ;
.L59:
 ; D:\TC\src\lexer.c:129:                 lexer_error("Unterminated comment", lexer->line, start);
	movq	32(%rbp), %rax	 ; lexer, tmp366
	movq	24(%rax), %rax	 ; lexer_213(D)->line, _50
	movq	-64(%rbp), %rdx	 ; start, tmp367
	movq	%rdx, %r8	 ; tmp367,
	movq	%rax, %rdx	 ; _50,
	leaq	.LC4(%rip), %rax	 ;, tmp368
	movq	%rax, %rcx	 ; tmp368,
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:130:                 if (skip_comment)
	cmpb	$0, 40(%rbp)	 ;, skip_comment
	je	.L60	 ;,
 ; D:\TC\src\lexer.c:131:                     return next_token(lexer, skip_comment);
	movsbl	40(%rbp), %edx	 ; skip_comment, _51
	movq	32(%rbp), %rax	 ; lexer, tmp369
	movq	%rax, %rcx	 ; tmp369,
	call	next_token	 ;
	jmp	.L19	 ;
.L60:
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp370
	movq	24(%rax), %rbx	 ; lexer_213(D)->line, _52
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp371
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _53
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-64(%rbp), %rax	 ; start, _54
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	32(%rbp), %rdx	 ; lexer, tmp372
	movq	(%rdx), %rcx	 ; lexer_213(D)->source, _55
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-64(%rbp), %rdx	 ; start, tmp373
	addq	%rdx, %rcx	 ; tmp373, _56
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _54,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-72(%rbp), %rdx	 ; column_start, tmp374
	movq	%rdx, %r9	 ; tmp374,
	movq	%rbx, %r8	 ; _52,
	movq	%rax, %rdx	 ; _57,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:132:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L58:
 ; D:\TC\src\lexer.c:134:             c = get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp375
	movq	%rax, %rcx	 ; tmp375,
	call	get_current_char	 ;
	movb	%al, -1(%rbp)	 ; tmp376, c
 ; D:\TC\src\lexer.c:135:             if (skip_comment)
	cmpb	$0, 40(%rbp)	 ;, skip_comment
	je	.L61	 ;,
 ; D:\TC\src\lexer.c:136:                 return next_token(lexer, skip_comment);
	movsbl	40(%rbp), %edx	 ; skip_comment, _58
	movq	32(%rbp), %rax	 ; lexer, tmp377
	movq	%rax, %rcx	 ; tmp377,
	call	next_token	 ;
	jmp	.L19	 ;
.L61:
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp378
	movq	24(%rax), %rbx	 ; lexer_213(D)->line, _59
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp379
	movq	8(%rax), %rax	 ; lexer_213(D)->position, _60
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	-64(%rbp), %rax	 ; start, _61
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	 ;, _62
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	32(%rbp), %rax	 ; lexer, tmp380
	movq	(%rax), %rcx	 ; lexer_213(D)->source, _63
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-64(%rbp), %rax	 ; start, tmp381
	addq	%rcx, %rax	 ; _63, _64
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rcx	 ; _64,
	call	create_string	 ;
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-72(%rbp), %rdx	 ; column_start, tmp382
	movq	%rdx, %r9	 ; tmp382,
	movq	%rbx, %r8	 ; _59,
	movq	%rax, %rdx	 ; _65,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:\TC\src\lexer.c:137:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L19	 ;
.L52:
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, -1(%rbp)	 ;, c
	jne	.L62	 ;,
 ; D:\TC\src\lexer.c:138:         } else if (c == '=' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L62	 ;,
 ; D:\TC\src\lexer.c:139:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp383
	movq	%rax, %rcx	 ; tmp383,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp384
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _66
 ; D:\TC\src\lexer.c:140:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _67
	movq	32(%rbp), %rax	 ; lexer, tmp385
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _68
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp386
	movq	(%rax), %rax	 ; EQ_SYMBOL, EQ_SYMBOL.0_69
	movq	%rcx, %r9	 ; _67,
	movq	%rdx, %r8	 ; _68,
	movq	%rax, %rdx	 ; EQ_SYMBOL.0_69,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L62:
 ; D:\TC\src\lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$33, -1(%rbp)	 ;, c
	jne	.L63	 ;,
 ; D:\TC\src\lexer.c:141:         } else if (c == '!' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L63	 ;,
 ; D:\TC\src\lexer.c:142:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp387
	movq	%rax, %rcx	 ; tmp387,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp388
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _70
 ; D:\TC\src\lexer.c:143:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _71
	movq	32(%rbp), %rax	 ; lexer, tmp389
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _72
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp390
	movq	(%rax), %rax	 ; NE_SYMBOL, NE_SYMBOL.1_73
	movq	%rcx, %r9	 ; _71,
	movq	%rdx, %r8	 ; _72,
	movq	%rax, %rdx	 ; NE_SYMBOL.1_73,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L63:
 ; D:\TC\src\lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$60, -1(%rbp)	 ;, c
	jne	.L64	 ;,
 ; D:\TC\src\lexer.c:144:         } else if (c == '<' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L64	 ;,
 ; D:\TC\src\lexer.c:145:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp391
	movq	%rax, %rcx	 ; tmp391,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp392
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _74
 ; D:\TC\src\lexer.c:146:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _75
	movq	32(%rbp), %rax	 ; lexer, tmp393
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _76
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rax), %rax	 ; LE_SYMBOL, LE_SYMBOL.2_77
	movq	%rcx, %r9	 ; _75,
	movq	%rdx, %r8	 ; _76,
	movq	%rax, %rdx	 ; LE_SYMBOL.2_77,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L64:
 ; D:\TC\src\lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$62, -1(%rbp)	 ;, c
	jne	.L65	 ;,
 ; D:\TC\src\lexer.c:147:         } else if (c == '>' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L65	 ;,
 ; D:\TC\src\lexer.c:148:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp395
	movq	%rax, %rcx	 ; tmp395,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp396
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _78
 ; D:\TC\src\lexer.c:149:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _79
	movq	32(%rbp), %rax	 ; lexer, tmp397
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _80
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp398
	movq	(%rax), %rax	 ; GE_SYMBOL, GE_SYMBOL.3_81
	movq	%rcx, %r9	 ; _79,
	movq	%rdx, %r8	 ; _80,
	movq	%rax, %rdx	 ; GE_SYMBOL.3_81,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L65:
 ; D:\TC\src\lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$43, -1(%rbp)	 ;, c
	jne	.L66	 ;,
 ; D:\TC\src\lexer.c:150:         } else if (c == '+' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L66	 ;,
 ; D:\TC\src\lexer.c:151:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp399
	movq	%rax, %rcx	 ; tmp399,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp400
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _82
 ; D:\TC\src\lexer.c:152:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _83
	movq	32(%rbp), %rax	 ; lexer, tmp401
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _84
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp402
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.4_85
	movq	%rcx, %r9	 ; _83,
	movq	%rdx, %r8	 ; _84,
	movq	%rax, %rdx	 ; ADD_ASSIGN_SYMBOL.4_85,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L66:
 ; D:\TC\src\lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$45, -1(%rbp)	 ;, c
	jne	.L67	 ;,
 ; D:\TC\src\lexer.c:153:         } else if (c == '-' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L67	 ;,
 ; D:\TC\src\lexer.c:154:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp403
	movq	%rax, %rcx	 ; tmp403,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp404
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _86
 ; D:\TC\src\lexer.c:155:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _87
	movq	32(%rbp), %rax	 ; lexer, tmp405
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _88
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp406
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.5_89
	movq	%rcx, %r9	 ; _87,
	movq	%rdx, %r8	 ; _88,
	movq	%rax, %rdx	 ; SUB_ASSIGN_SYMBOL.5_89,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L67:
 ; D:\TC\src\lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$42, -1(%rbp)	 ;, c
	jne	.L68	 ;,
 ; D:\TC\src\lexer.c:156:         } else if (c == '*' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L68	 ;,
 ; D:\TC\src\lexer.c:157:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp407
	movq	%rax, %rcx	 ; tmp407,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp408
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _90
 ; D:\TC\src\lexer.c:158:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _91
	movq	32(%rbp), %rax	 ; lexer, tmp409
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _92
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp410
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.6_93
	movq	%rcx, %r9	 ; _91,
	movq	%rdx, %r8	 ; _92,
	movq	%rax, %rdx	 ; MUL_ASSIGN_SYMBOL.6_93,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L68:
 ; D:\TC\src\lexer.c:159:         } else if (c == '/' && p == '=') {
	cmpb	$47, -1(%rbp)	 ;, c
	jne	.L69	 ;,
 ; D:\TC\src\lexer.c:159:         } else if (c == '/' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L69	 ;,
 ; D:\TC\src\lexer.c:160:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp411
	movq	%rax, %rcx	 ; tmp411,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp412
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _94
 ; D:\TC\src\lexer.c:161:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _95
	movq	32(%rbp), %rax	 ; lexer, tmp413
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _96
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp414
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.7_97
	movq	%rcx, %r9	 ; _95,
	movq	%rdx, %r8	 ; _96,
	movq	%rax, %rdx	 ; DIV_ASSIGN_SYMBOL.7_97,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L69:
 ; D:\TC\src\lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$37, -1(%rbp)	 ;, c
	jne	.L70	 ;,
 ; D:\TC\src\lexer.c:162:         } else if (c == '%' && p == '=') {
	cmpb	$61, -9(%rbp)	 ;, p
	jne	.L70	 ;,
 ; D:\TC\src\lexer.c:163:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp415
	movq	%rax, %rcx	 ; tmp415,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp416
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _98
 ; D:\TC\src\lexer.c:164:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _99
	movq	32(%rbp), %rax	 ; lexer, tmp417
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _100
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp418
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.8_101
	movq	%rcx, %r9	 ; _99,
	movq	%rdx, %r8	 ; _100,
	movq	%rax, %rdx	 ; MOD_ASSIGN_SYMBOL.8_101,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L70:
 ; D:\TC\src\lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, -1(%rbp)	 ;, c
	jne	.L71	 ;,
 ; D:\TC\src\lexer.c:165:         } else if (c == '&' && p == '&') {
	cmpb	$38, -9(%rbp)	 ;, p
	jne	.L71	 ;,
 ; D:\TC\src\lexer.c:166:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp419
	movq	%rax, %rcx	 ; tmp419,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp420
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _102
 ; D:\TC\src\lexer.c:167:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _103
	movq	32(%rbp), %rax	 ; lexer, tmp421
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _104
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp422
	movq	(%rax), %rax	 ; AND_SYMBOL, AND_SYMBOL.9_105
	movq	%rcx, %r9	 ; _103,
	movq	%rdx, %r8	 ; _104,
	movq	%rax, %rdx	 ; AND_SYMBOL.9_105,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L71:
 ; D:\TC\src\lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, -1(%rbp)	 ;, c
	jne	.L72	 ;,
 ; D:\TC\src\lexer.c:168:         } else if (c == '|' && p == '|') {
	cmpb	$124, -9(%rbp)	 ;, p
	jne	.L72	 ;,
 ; D:\TC\src\lexer.c:169:             get_current_char(lexer);
	movq	32(%rbp), %rax	 ; lexer, tmp423
	movq	%rax, %rcx	 ; tmp423,
	call	get_current_char	 ;
 ; D:\TC\src\lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	32(%rbp), %rax	 ; lexer, tmp424
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _106
 ; D:\TC\src\lexer.c:170:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _107
	movq	32(%rbp), %rax	 ; lexer, tmp425
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _108
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp426
	movq	(%rax), %rax	 ; OR_SYMBOL, OR_SYMBOL.10_109
	movq	%rcx, %r9	 ; _107,
	movq	%rdx, %r8	 ; _108,
	movq	%rax, %rdx	 ; OR_SYMBOL.10_109,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L72:
 ; D:\TC\src\lexer.c:171:         } else if (c == '(')
	cmpb	$40, -1(%rbp)	 ;, c
	jne	.L73	 ;,
 ; D:\TC\src\lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp427
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _110
 ; D:\TC\src\lexer.c:172:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _111
	movq	32(%rbp), %rax	 ; lexer, tmp428
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _112
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp429
	movq	(%rax), %rax	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.11_113
	movq	%rcx, %r9	 ; _111,
	movq	%rdx, %r8	 ; _112,
	movq	%rax, %rdx	 ; L_PAREN_SYMBOL.11_113,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L73:
 ; D:\TC\src\lexer.c:173:         else if (c == ')')
	cmpb	$41, -1(%rbp)	 ;, c
	jne	.L74	 ;,
 ; D:\TC\src\lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp430
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _114
 ; D:\TC\src\lexer.c:174:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _115
	movq	32(%rbp), %rax	 ; lexer, tmp431
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _116
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp432
	movq	(%rax), %rax	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.12_117
	movq	%rcx, %r9	 ; _115,
	movq	%rdx, %r8	 ; _116,
	movq	%rax, %rdx	 ; R_PAREN_SYMBOL.12_117,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L74:
 ; D:\TC\src\lexer.c:175:         else if (c == '{')
	cmpb	$123, -1(%rbp)	 ;, c
	jne	.L75	 ;,
 ; D:\TC\src\lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp433
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _118
 ; D:\TC\src\lexer.c:176:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _119
	movq	32(%rbp), %rax	 ; lexer, tmp434
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _120
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp435
	movq	(%rax), %rax	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.13_121
	movq	%rcx, %r9	 ; _119,
	movq	%rdx, %r8	 ; _120,
	movq	%rax, %rdx	 ; L_BRACE_SYMBOL.13_121,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L75:
 ; D:\TC\src\lexer.c:177:         else if (c == '}')
	cmpb	$125, -1(%rbp)	 ;, c
	jne	.L76	 ;,
 ; D:\TC\src\lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp436
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _122
 ; D:\TC\src\lexer.c:178:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _123
	movq	32(%rbp), %rax	 ; lexer, tmp437
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _124
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp438
	movq	(%rax), %rax	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.14_125
	movq	%rcx, %r9	 ; _123,
	movq	%rdx, %r8	 ; _124,
	movq	%rax, %rdx	 ; R_BRACE_SYMBOL.14_125,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L76:
 ; D:\TC\src\lexer.c:179:         else if (c == ',')
	cmpb	$44, -1(%rbp)	 ;, c
	jne	.L77	 ;,
 ; D:\TC\src\lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp439
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _126
 ; D:\TC\src\lexer.c:180:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _127
	movq	32(%rbp), %rax	 ; lexer, tmp440
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _128
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp441
	movq	(%rax), %rax	 ; COMMA_SYMBOL, COMMA_SYMBOL.15_129
	movq	%rcx, %r9	 ; _127,
	movq	%rdx, %r8	 ; _128,
	movq	%rax, %rdx	 ; COMMA_SYMBOL.15_129,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L77:
 ; D:\TC\src\lexer.c:181:         else if (c == '!')
	cmpb	$33, -1(%rbp)	 ;, c
	jne	.L78	 ;,
 ; D:\TC\src\lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp442
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _130
 ; D:\TC\src\lexer.c:182:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _131
	movq	32(%rbp), %rax	 ; lexer, tmp443
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _132
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp444
	movq	(%rax), %rax	 ; NOT_SYMBOL, NOT_SYMBOL.16_133
	movq	%rcx, %r9	 ; _131,
	movq	%rdx, %r8	 ; _132,
	movq	%rax, %rdx	 ; NOT_SYMBOL.16_133,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L78:
 ; D:\TC\src\lexer.c:183:         else if (c == '.')
	cmpb	$46, -1(%rbp)	 ;, c
	jne	.L79	 ;,
 ; D:\TC\src\lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp445
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _134
 ; D:\TC\src\lexer.c:184:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _135
	movq	32(%rbp), %rax	 ; lexer, tmp446
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _136
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp447
	movq	(%rax), %rax	 ; DOT_SYMBOL, DOT_SYMBOL.17_137
	movq	%rcx, %r9	 ; _135,
	movq	%rdx, %r8	 ; _136,
	movq	%rax, %rdx	 ; DOT_SYMBOL.17_137,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L79:
 ; D:\TC\src\lexer.c:185:         else if (c == '[')
	cmpb	$91, -1(%rbp)	 ;, c
	jne	.L80	 ;,
 ; D:\TC\src\lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp448
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _138
 ; D:\TC\src\lexer.c:186:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _139
	movq	32(%rbp), %rax	 ; lexer, tmp449
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _140
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp450
	movq	(%rax), %rax	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.18_141
	movq	%rcx, %r9	 ; _139,
	movq	%rdx, %r8	 ; _140,
	movq	%rax, %rdx	 ; L_BRACKET_SYMBOL.18_141,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L80:
 ; D:\TC\src\lexer.c:187:         else if (c == ']')
	cmpb	$93, -1(%rbp)	 ;, c
	jne	.L81	 ;,
 ; D:\TC\src\lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp451
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _142
 ; D:\TC\src\lexer.c:188:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _143
	movq	32(%rbp), %rax	 ; lexer, tmp452
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _144
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp453
	movq	(%rax), %rax	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.19_145
	movq	%rcx, %r9	 ; _143,
	movq	%rdx, %r8	 ; _144,
	movq	%rax, %rdx	 ; R_BRACKET_SYMBOL.19_145,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L81:
 ; D:\TC\src\lexer.c:189:         else if (c == ';')
	cmpb	$59, -1(%rbp)	 ;, c
	jne	.L82	 ;,
 ; D:\TC\src\lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp454
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _146
 ; D:\TC\src\lexer.c:190:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _147
	movq	32(%rbp), %rax	 ; lexer, tmp455
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _148
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp456
	movq	(%rax), %rax	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.20_149
	movq	%rcx, %r9	 ; _147,
	movq	%rdx, %r8	 ; _148,
	movq	%rax, %rdx	 ; SEMICOLON_SYMBOL.20_149,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L82:
 ; D:\TC\src\lexer.c:191:         else if (c == '_')
	cmpb	$95, -1(%rbp)	 ;, c
	jne	.L83	 ;,
 ; D:\TC\src\lexer.c:192:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp457
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _150
 ; D:\TC\src\lexer.c:192:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _151
	movq	32(%rbp), %rax	 ; lexer, tmp458
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _152
	movq	.refptr.UNDERLINE_SYMBOL(%rip), %rax	 ;, tmp459
	movq	(%rax), %rax	 ; UNDERLINE_SYMBOL, UNDERLINE_SYMBOL.21_153
	movq	%rcx, %r9	 ; _151,
	movq	%rdx, %r8	 ; _152,
	movq	%rax, %rdx	 ; UNDERLINE_SYMBOL.21_153,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L83:
 ; D:\TC\src\lexer.c:193:         else if (c == '+')
	cmpb	$43, -1(%rbp)	 ;, c
	jne	.L84	 ;,
 ; D:\TC\src\lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp460
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _154
 ; D:\TC\src\lexer.c:194:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _155
	movq	32(%rbp), %rax	 ; lexer, tmp461
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _156
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp462
	movq	(%rax), %rax	 ; ADD_SYMBOL, ADD_SYMBOL.22_157
	movq	%rcx, %r9	 ; _155,
	movq	%rdx, %r8	 ; _156,
	movq	%rax, %rdx	 ; ADD_SYMBOL.22_157,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L84:
 ; D:\TC\src\lexer.c:195:         else if (c == '-')
	cmpb	$45, -1(%rbp)	 ;, c
	jne	.L85	 ;,
 ; D:\TC\src\lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp463
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _158
 ; D:\TC\src\lexer.c:196:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _159
	movq	32(%rbp), %rax	 ; lexer, tmp464
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _160
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp465
	movq	(%rax), %rax	 ; SUB_SYMBOL, SUB_SYMBOL.23_161
	movq	%rcx, %r9	 ; _159,
	movq	%rdx, %r8	 ; _160,
	movq	%rax, %rdx	 ; SUB_SYMBOL.23_161,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L85:
 ; D:\TC\src\lexer.c:197:         else if (c == '*')
	cmpb	$42, -1(%rbp)	 ;, c
	jne	.L86	 ;,
 ; D:\TC\src\lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp466
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _162
 ; D:\TC\src\lexer.c:198:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _163
	movq	32(%rbp), %rax	 ; lexer, tmp467
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _164
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp468
	movq	(%rax), %rax	 ; MUL_SYMBOL, MUL_SYMBOL.24_165
	movq	%rcx, %r9	 ; _163,
	movq	%rdx, %r8	 ; _164,
	movq	%rax, %rdx	 ; MUL_SYMBOL.24_165,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L86:
 ; D:\TC\src\lexer.c:199:         else if (c == '/')
	cmpb	$47, -1(%rbp)	 ;, c
	jne	.L87	 ;,
 ; D:\TC\src\lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp469
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _166
 ; D:\TC\src\lexer.c:200:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _167
	movq	32(%rbp), %rax	 ; lexer, tmp470
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _168
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp471
	movq	(%rax), %rax	 ; DIV_SYMBOL, DIV_SYMBOL.25_169
	movq	%rcx, %r9	 ; _167,
	movq	%rdx, %r8	 ; _168,
	movq	%rax, %rdx	 ; DIV_SYMBOL.25_169,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L87:
 ; D:\TC\src\lexer.c:201:         else if (c == '%')
	cmpb	$37, -1(%rbp)	 ;, c
	jne	.L88	 ;,
 ; D:\TC\src\lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp472
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _170
 ; D:\TC\src\lexer.c:202:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _171
	movq	32(%rbp), %rax	 ; lexer, tmp473
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _172
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp474
	movq	(%rax), %rax	 ; MOD_SYMBOL, MOD_SYMBOL.26_173
	movq	%rcx, %r9	 ; _171,
	movq	%rdx, %r8	 ; _172,
	movq	%rax, %rdx	 ; MOD_SYMBOL.26_173,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L88:
 ; D:\TC\src\lexer.c:203:         else if (c == '<')
	cmpb	$60, -1(%rbp)	 ;, c
	jne	.L89	 ;,
 ; D:\TC\src\lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp475
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _174
 ; D:\TC\src\lexer.c:204:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _175
	movq	32(%rbp), %rax	 ; lexer, tmp476
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _176
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp477
	movq	(%rax), %rax	 ; LT_SYMBOL, LT_SYMBOL.27_177
	movq	%rcx, %r9	 ; _175,
	movq	%rdx, %r8	 ; _176,
	movq	%rax, %rdx	 ; LT_SYMBOL.27_177,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L89:
 ; D:\TC\src\lexer.c:205:         else if (c == '>')
	cmpb	$62, -1(%rbp)	 ;, c
	jne	.L90	 ;,
 ; D:\TC\src\lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp478
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _178
 ; D:\TC\src\lexer.c:206:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _179
	movq	32(%rbp), %rax	 ; lexer, tmp479
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _180
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp480
	movq	(%rax), %rax	 ; GT_SYMBOL, GT_SYMBOL.28_181
	movq	%rcx, %r9	 ; _179,
	movq	%rdx, %r8	 ; _180,
	movq	%rax, %rdx	 ; GT_SYMBOL.28_181,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L90:
 ; D:\TC\src\lexer.c:207:         else if (c == '=')
	cmpb	$61, -1(%rbp)	 ;, c
	jne	.L91	 ;,
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp481
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _182
 ; D:\TC\src\lexer.c:208:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _183
	movq	32(%rbp), %rax	 ; lexer, tmp482
	movq	24(%rax), %rdx	 ; lexer_213(D)->line, _184
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp483
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.29_185
	movq	%rcx, %r9	 ; _183,
	movq	%rdx, %r8	 ; _184,
	movq	%rax, %rdx	 ; ASSIGN_SYMBOL.29_185,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L91:
 ; D:\TC\src\lexer.c:210:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	movq	32(%rbp), %rax	 ; lexer, tmp484
	movq	32(%rax), %rax	 ; lexer_213(D)->column, _186
 ; D:\TC\src\lexer.c:210:             lexer_error("Unexpected character", lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rdx	 ;, _187
	movq	32(%rbp), %rax	 ; lexer, tmp485
	movq	24(%rax), %rax	 ; lexer_213(D)->line, _188
	movq	%rdx, %r8	 ; _187,
	movq	%rax, %rdx	 ; _188,
	leaq	.LC5(%rip), %rax	 ;, tmp486
	movq	%rax, %rcx	 ; tmp486,
	call	lexer_error	 ;
 ; D:\TC\src\lexer.c:211:             return create_token(EOF_TOKEN, 0, 0, 0);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
.L19:
 ; D:\TC\src\lexer.c:214: }
	addq	$152, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	get_next_token
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.seh_proc	get_next_token
get_next_token:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movl	%edx, %eax	 ; skip_comment, tmp90
	movb	%al, 24(%rbp)	 ; tmp91, skip_comment
 ; D:\TC\src\lexer.c:217:     if (lexer->peeked_token != 0) {
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	40(%rax), %rax	 ; lexer_10(D)->peeked_token, _1
 ; D:\TC\src\lexer.c:217:     if (lexer->peeked_token != 0) {
	testq	%rax, %rax	 ; _1
	je	.L94	 ;,
 ; D:\TC\src\lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	40(%rax), %rdx	 ; lexer_10(D)->peeked_token, _2
 ; D:\TC\src\lexer.c:218:         lexer->current_token = lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp94
	movq	%rdx, 72(%rax)	 ; _2, lexer_10(D)->current_token
 ; D:\TC\src\lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	48(%rax), %rdx	 ; lexer_10(D)->peeked_position, _3
 ; D:\TC\src\lexer.c:219:         lexer->position = lexer->peeked_position;
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movq	%rdx, 8(%rax)	 ; _3, lexer_10(D)->position
 ; D:\TC\src\lexer.c:220:         lexer->line = lexer->peeked_line;
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	56(%rax), %rdx	 ; lexer_10(D)->peeked_line, _4
 ; D:\TC\src\lexer.c:220:         lexer->line = lexer->peeked_line;
	movq	16(%rbp), %rax	 ; lexer, tmp98
	movq	%rdx, 24(%rax)	 ; _4, lexer_10(D)->line
 ; D:\TC\src\lexer.c:221:         lexer->column = lexer->peeked_column;
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	64(%rax), %rdx	 ; lexer_10(D)->peeked_column, _5
 ; D:\TC\src\lexer.c:221:         lexer->column = lexer->peeked_column;
	movq	16(%rbp), %rax	 ; lexer, tmp100
	movq	%rdx, 32(%rax)	 ; _5, lexer_10(D)->column
 ; D:\TC\src\lexer.c:222:         lexer->peeked_token = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	$0, 40(%rax)	 ;, lexer_10(D)->peeked_token
 ; D:\TC\src\lexer.c:223:         return lexer->current_token;
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	72(%rax), %rax	 ; lexer_10(D)->current_token, _7
	jmp	.L95	 ;
.L94:
 ; D:\TC\src\lexer.c:225:     Token* token = next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _6
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp104, token
 ; D:\TC\src\lexer.c:226:     return lexer->current_token = token;
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	-8(%rbp), %rdx	 ; token, tmp106
	movq	%rdx, 72(%rax)	 ; tmp106, lexer_10(D)->current_token
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	72(%rax), %rax	 ; lexer_10(D)->current_token, _7
.L95:
 ; D:\TC\src\lexer.c:227: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	peek_next_token
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.seh_proc	peek_next_token
peek_next_token:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movl	%edx, %eax	 ; skip_comment, tmp89
	movb	%al, 24(%rbp)	 ; tmp90, skip_comment
 ; D:\TC\src\lexer.c:230:     if (lexer->peeked_token != 0)
	movq	16(%rbp), %rax	 ; lexer, tmp91
	movq	40(%rax), %rax	 ; lexer_9(D)->peeked_token, _1
 ; D:\TC\src\lexer.c:230:     if (lexer->peeked_token != 0)
	testq	%rax, %rax	 ; _1
	je	.L97	 ;,
 ; D:\TC\src\lexer.c:231:         return lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	40(%rax), %rax	 ; lexer_9(D)->peeked_token, _6
	jmp	.L98	 ;
.L97:
 ; D:\TC\src\lexer.c:232:     size_t saved_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	8(%rax), %rax	 ; lexer_9(D)->position, tmp94
	movq	%rax, -8(%rbp)	 ; tmp94, saved_position
 ; D:\TC\src\lexer.c:233:     size_t saved_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	24(%rax), %rax	 ; lexer_9(D)->line, tmp96
	movq	%rax, -16(%rbp)	 ; tmp96, saved_line
 ; D:\TC\src\lexer.c:234:     size_t saved_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	32(%rax), %rax	 ; lexer_9(D)->column, tmp98
	movq	%rax, -24(%rbp)	 ; tmp98, saved_column
 ; D:\TC\src\lexer.c:235:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _2
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	get_next_token	 ;
	movq	%rax, -32(%rbp)	 ; tmp100, token
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	8(%rax), %rdx	 ; lexer_9(D)->position, _3
 ; D:\TC\src\lexer.c:236:     lexer->peeked_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	%rdx, 48(%rax)	 ; _3, lexer_9(D)->peeked_position
 ; D:\TC\src\lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	24(%rax), %rdx	 ; lexer_9(D)->line, _4
 ; D:\TC\src\lexer.c:237:     lexer->peeked_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movq	%rdx, 56(%rax)	 ; _4, lexer_9(D)->peeked_line
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	32(%rax), %rdx	 ; lexer_9(D)->column, _5
 ; D:\TC\src\lexer.c:238:     lexer->peeked_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp106
	movq	%rdx, 64(%rax)	 ; _5, lexer_9(D)->peeked_column
 ; D:\TC\src\lexer.c:239:     lexer->position = saved_position;
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	-8(%rbp), %rdx	 ; saved_position, tmp108
	movq	%rdx, 8(%rax)	 ; tmp108, lexer_9(D)->position
 ; D:\TC\src\lexer.c:240:     lexer->line = saved_line;
	movq	16(%rbp), %rax	 ; lexer, tmp109
	movq	-16(%rbp), %rdx	 ; saved_line, tmp110
	movq	%rdx, 24(%rax)	 ; tmp110, lexer_9(D)->line
 ; D:\TC\src\lexer.c:241:     lexer->column = saved_column;
	movq	16(%rbp), %rax	 ; lexer, tmp111
	movq	-24(%rbp), %rdx	 ; saved_column, tmp112
	movq	%rdx, 32(%rax)	 ; tmp112, lexer_9(D)->column
 ; D:\TC\src\lexer.c:242:     lexer->peeked_token = token;
	movq	16(%rbp), %rax	 ; lexer, tmp113
	movq	-32(%rbp), %rdx	 ; token, tmp114
	movq	%rdx, 40(%rax)	 ; tmp114, lexer_9(D)->peeked_token
 ; D:\TC\src\lexer.c:243:     return token;
	movq	-32(%rbp), %rax	 ; token, _6
.L98:
 ; D:\TC\src\lexer.c:244: }
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.seh_proc	peek_current_token
peek_current_token:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:\TC\src\lexer.c:247:     return lexer->current_token;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	72(%rax), %rax	 ; lexer_2(D)->current_token, _3
 ; D:\TC\src\lexer.c:248: }
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
	.seh_proc	reset_lexer
reset_lexer:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:\TC\src\lexer.c:251:     lexer->position = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp82
	movq	$0, 8(%rax)	 ;, lexer_2(D)->position
 ; D:\TC\src\lexer.c:252:     lexer->line = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp83
	movq	$0, 24(%rax)	 ;, lexer_2(D)->line
 ; D:\TC\src\lexer.c:253:     lexer->column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	$0, 32(%rax)	 ;, lexer_2(D)->column
 ; D:\TC\src\lexer.c:254:     lexer->peeked_token = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp85
	movq	$0, 40(%rax)	 ;, lexer_2(D)->peeked_token
 ; D:\TC\src\lexer.c:255:     lexer->peeked_position = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp86
	movq	$0, 48(%rax)	 ;, lexer_2(D)->peeked_position
 ; D:\TC\src\lexer.c:256:     lexer->peeked_line = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp87
	movq	$0, 56(%rax)	 ;, lexer_2(D)->peeked_line
 ; D:\TC\src\lexer.c:257:     lexer->peeked_column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp88
	movq	$0, 64(%rax)	 ;, lexer_2(D)->peeked_column
 ; D:\TC\src\lexer.c:258:     lexer->current_token = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp89
	movq	$0, 72(%rax)	 ;, lexer_2(D)->current_token
 ; D:\TC\src\lexer.c:259: }
	nop	
	popq	%rbp	 ;
	ret	
	.seh_endproc
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

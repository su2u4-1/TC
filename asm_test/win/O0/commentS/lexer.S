	.file	"lexer.c"
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
	movq	%r8, 32(%rbp)	 ; filename, filename
 ; D:/TC/src/lexer.c:4:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, lexer
 ; D:/TC/src/lexer.c:5:     lexer->source = source;
	movq	-8(%rbp), %rax	 ; lexer, tmp85
	movq	16(%rbp), %rdx	 ; source, tmp86
	movq	%rdx, 8(%rax)	 ; tmp86, lexer_3->source
 ; D:/TC/src/lexer.c:6:     lexer->position = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp87
	movq	$0, 16(%rax)	 ;, lexer_3->position
 ; D:/TC/src/lexer.c:7:     lexer->length = length;
	movq	-8(%rbp), %rax	 ; lexer, tmp88
	movq	24(%rbp), %rdx	 ; length, tmp89
	movq	%rdx, 24(%rax)	 ; tmp89, lexer_3->length
 ; D:/TC/src/lexer.c:8:     lexer->line = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp90
	movq	$0, 32(%rax)	 ;, lexer_3->line
 ; D:/TC/src/lexer.c:9:     lexer->column = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp91
	movq	$0, 40(%rax)	 ;, lexer_3->column
 ; D:/TC/src/lexer.c:10:     lexer->peeked_token = NULL;
	movq	-8(%rbp), %rax	 ; lexer, tmp92
	movq	$0, 48(%rax)	 ;, lexer_3->peeked_token
 ; D:/TC/src/lexer.c:11:     lexer->peeked_position = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp93
	movq	$0, 56(%rax)	 ;, lexer_3->peeked_position
 ; D:/TC/src/lexer.c:12:     lexer->peeked_line = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp94
	movq	$0, 64(%rax)	 ;, lexer_3->peeked_line
 ; D:/TC/src/lexer.c:13:     lexer->peeked_column = 0;
	movq	-8(%rbp), %rax	 ; lexer, tmp95
	movq	$0, 72(%rax)	 ;, lexer_3->peeked_column
 ; D:/TC/src/lexer.c:14:     lexer->current_token = NULL;
	movq	-8(%rbp), %rax	 ; lexer, tmp96
	movq	$0, 80(%rax)	 ;, lexer_3->current_token
 ; D:/TC/src/lexer.c:15:     lexer->filename = filename;
	movq	-8(%rbp), %rax	 ; lexer, tmp97
	movq	32(%rbp), %rdx	 ; filename, tmp98
	movq	%rdx, (%rax)	 ; tmp98, lexer_3->filename
 ; D:/TC/src/lexer.c:16:     return lexer;
	movq	-8(%rbp), %rax	 ; lexer, _18
 ; D:/TC/src/lexer.c:17: }
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
 ; D:/TC/src/lexer.c:20:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, token
 ; D:/TC/src/lexer.c:21:     token->type = type;
	movq	-8(%rbp), %rax	 ; token, tmp85
	movl	16(%rbp), %edx	 ; type, tmp86
	movl	%edx, 24(%rax)	 ; tmp86, token_3->type
 ; D:/TC/src/lexer.c:22:     token->lexeme = lexeme;
	movq	-8(%rbp), %rax	 ; token, tmp87
	movq	24(%rbp), %rdx	 ; lexeme, tmp88
	movq	%rdx, (%rax)	 ; tmp88, token_3->lexeme
 ; D:/TC/src/lexer.c:23:     token->line = line;
	movq	-8(%rbp), %rax	 ; token, tmp89
	movq	32(%rbp), %rdx	 ; line, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, token_3->line
 ; D:/TC/src/lexer.c:24:     token->column = column;
	movq	-8(%rbp), %rax	 ; token, tmp91
	movq	40(%rbp), %rdx	 ; column, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, token_3->column
 ; D:/TC/src/lexer.c:25:     return token;
	movq	-8(%rbp), %rax	 ; token, _12
 ; D:/TC/src/lexer.c:26: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[Lexer Error] at %s:%zu:%zu: %s\12\0"
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
	movq	%r9, 40(%rbp)	 ; filename, filename
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	movq	32(%rbp), %rax	 ; column, tmp86
	leaq	1(%rax), %rbx	 ;, _1
	movq	24(%rbp), %rax	 ; line, tmp87
	leaq	1(%rax), %rsi	 ;, _2
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:/TC/src/lexer.c:29:     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message);
	movq	40(%rbp), %rcx	 ; filename, tmp88
	movq	16(%rbp), %rdx	 ; message, tmp89
	movq	%rdx, 40(%rsp)	 ; tmp89,
	movq	%rbx, 32(%rsp)	 ; _1,
	movq	%rsi, %r9	 ; _2,
	movq	%rcx, %r8	 ; tmp88,
	leaq	.LC0(%rip), %rdx	 ;, tmp90
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
 ; D:/TC/src/lexer.c:30: }
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
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	16(%rax), %rdx	 ; lexer_13(D)->position, _1
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	24(%rax), %rax	 ; lexer_13(D)->length, _2
 ; D:/TC/src/lexer.c:33:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	 ; _2, _1
	jb	.L7	 ;,
 ; D:/TC/src/lexer.c:34:         return '\0';
	movl	$0, %eax	 ;, _10
	jmp	.L8	 ;
.L7:
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	movq	16(%rbp), %rax	 ; lexer, tmp94
	movq	40(%rax), %rax	 ; lexer_13(D)->column, _3
 ; D:/TC/src/lexer.c:35:     lexer->column++;
	leaq	1(%rax), %rdx	 ;, _4
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	%rdx, 40(%rax)	 ; _4, lexer_13(D)->column
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movq	8(%rax), %r8	 ; lexer_13(D)->source, _5
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	16(%rax), %rax	 ; lexer_13(D)->position, _6
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	leaq	1(%rax), %rcx	 ;, _8
	movq	16(%rbp), %rdx	 ; lexer, tmp98
	movq	%rcx, 16(%rdx)	 ; _8, lexer_13(D)->position
 ; D:/TC/src/lexer.c:36:     return lexer->source[lexer->position++];
	addq	%r8, %rax	 ; _5, _9
	movzbl	(%rax), %eax	 ; *_9, _10
.L8:
 ; D:/TC/src/lexer.c:37: }
	popq	%rbp	 ;
	ret	
	.def	peek_next_char;	.scl	3;	.type	32;	.endef
peek_next_char:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp89
	movq	16(%rax), %rdx	 ; lexer_8(D)->position, _1
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	movq	16(%rbp), %rax	 ; lexer, tmp90
	movq	24(%rax), %rax	 ; lexer_8(D)->length, _2
 ; D:/TC/src/lexer.c:40:     if (lexer->position >= lexer->length)
	cmpq	%rax, %rdx	 ; _2, _1
	jb	.L10	 ;,
 ; D:/TC/src/lexer.c:41:         return '\0';
	movl	$0, %eax	 ;, _6
	jmp	.L11	 ;
.L10:
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	16(%rbp), %rax	 ; lexer, tmp91
	movq	8(%rax), %rdx	 ; lexer_8(D)->source, _3
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	16(%rax), %rax	 ; lexer_8(D)->position, _4
 ; D:/TC/src/lexer.c:42:     return lexer->source[lexer->position];
	addq	%rdx, %rax	 ; _3, _5
	movzbl	(%rax), %eax	 ; *_5, _6
.L11:
 ; D:/TC/src/lexer.c:43: }
	popq	%rbp	 ;
	ret	
	.def	newline;	.scl	3;	.type	32;	.endef
newline:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	32(%rax), %rax	 ; lexer_4(D)->line, _1
 ; D:/TC/src/lexer.c:46:     lexer->line++;
	leaq	1(%rax), %rdx	 ;, _2
	movq	16(%rbp), %rax	 ; lexer, tmp85
	movq	%rdx, 32(%rax)	 ; _2, lexer_4(D)->line
 ; D:/TC/src/lexer.c:47:     lexer->column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp86
	movq	$0, 40(%rax)	 ;, lexer_4(D)->column
 ; D:/TC/src/lexer.c:48: }
	nop	
	popq	%rbp	 ;
	ret	
	.def	move_position;	.scl	3;	.type	32;	.endef
move_position:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movl	%edx, 24(%rbp)	 ; count, count
 ; D:/TC/src/lexer.c:51:     if (count >= 0) {
	cmpl	$0, 24(%rbp)	 ;, count
	js	.L14	 ;,
 ; D:/TC/src/lexer.c:52:         lexer->position += (size_t)count;
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movq	16(%rax), %rdx	 ; lexer_18(D)->position, _1
 ; D:/TC/src/lexer.c:52:         lexer->position += (size_t)count;
	movl	24(%rbp), %eax	 ; count, tmp97
	cltq
 ; D:/TC/src/lexer.c:52:         lexer->position += (size_t)count;
	addq	%rax, %rdx	 ; _2, _3
	movq	16(%rbp), %rax	 ; lexer, tmp98
	movq	%rdx, 16(%rax)	 ; _3, lexer_18(D)->position
 ; D:/TC/src/lexer.c:53:         lexer->column += (size_t)count;
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	40(%rax), %rdx	 ; lexer_18(D)->column, _4
 ; D:/TC/src/lexer.c:53:         lexer->column += (size_t)count;
	movl	24(%rbp), %eax	 ; count, tmp100
	cltq
 ; D:/TC/src/lexer.c:53:         lexer->column += (size_t)count;
	addq	%rax, %rdx	 ; _5, _6
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	%rdx, 40(%rax)	 ; _6, lexer_18(D)->column
 ; D:/TC/src/lexer.c:58: }
	jmp	.L16	 ;
.L14:
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	16(%rax), %rdx	 ; lexer_18(D)->position, _7
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	movl	24(%rbp), %eax	 ; count, tmp103
	negl	%eax	 ; _8
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	cltq
 ; D:/TC/src/lexer.c:55:         lexer->position -= (size_t)(-count);
	subq	%rax, %rdx	 ; _9, _10
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movq	%rdx, 16(%rax)	 ; _10, lexer_18(D)->position
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	40(%rax), %rdx	 ; lexer_18(D)->column, _11
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	movl	24(%rbp), %eax	 ; count, tmp106
	negl	%eax	 ; _12
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	cltq
 ; D:/TC/src/lexer.c:56:         lexer->column -= (size_t)(-count);
	subq	%rax, %rdx	 ; _13, _14
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	%rdx, 40(%rax)	 ; _14, lexer_18(D)->column
.L16:
 ; D:/TC/src/lexer.c:58: }
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
	.ascii "D:/TC/src/lexer.c\0"
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
	movl	%edx, %eax	 ; skip_comment, tmp272
	movb	%al, 24(%rbp)	 ; tmp273, skip_comment
 ; D:/TC/src/lexer.c:61:     char c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp274
	movq	%rax, %rcx	 ; tmp274,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp275, c
 ; D:/TC/src/lexer.c:62:     if (c == '\0')
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L18	 ;,
 ; D:/TC/src/lexer.c:63:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	16(%rbp), %rax	 ; lexer, tmp276
	movq	40(%rax), %rdx	 ; lexer_213(D)->column, _1
	movq	16(%rbp), %rax	 ; lexer, tmp277
	movq	32(%rax), %rax	 ; lexer_213(D)->line, _2
	movq	%rdx, %r9	 ; _1,
	movq	%rax, %r8	 ; _2,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L18:
 ; D:/TC/src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$32, -17(%rbp)	 ;, c
	je	.L20	 ;,
 ; D:/TC/src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, -17(%rbp)	 ;, c
	je	.L20	 ;,
 ; D:/TC/src/lexer.c:64:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$13, -17(%rbp)	 ;, c
	jne	.L21	 ;,
.L20:
 ; D:/TC/src/lexer.c:65:         return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _3
	movq	16(%rbp), %rax	 ; lexer, tmp278
	movq	%rax, %rcx	 ; tmp278,
	call	next_token	 ;
	jmp	.L19	 ;
.L21:
 ; D:/TC/src/lexer.c:66:     else if (c == '\n') {
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L22	 ;,
 ; D:/TC/src/lexer.c:67:         newline(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp279
	movq	%rax, %rcx	 ; tmp279,
	call	newline	 ;
 ; D:/TC/src/lexer.c:68:         return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _4
	movq	16(%rbp), %rax	 ; lexer, tmp280
	movq	%rax, %rcx	 ; tmp280,
	call	next_token	 ;
	jmp	.L19	 ;
.L22:
 ; D:/TC/src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$96, -17(%rbp)	 ;, c
	jle	.L23	 ;,
 ; D:/TC/src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$122, -17(%rbp)	 ;, c
	jle	.L24	 ;,
.L23:
 ; D:/TC/src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$64, -17(%rbp)	 ;, c
	jle	.L25	 ;,
 ; D:/TC/src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$90, -17(%rbp)	 ;, c
	jle	.L24	 ;,
.L25:
 ; D:/TC/src/lexer.c:69:     } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
	cmpb	$95, -17(%rbp)	 ;, c
	jne	.L26	 ;,
.L24:
 ; D:/TC/src/lexer.c:70:         size_t start = lexer->position - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp281
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _5
 ; D:/TC/src/lexer.c:70:         size_t start = lexer->position - 1;
	subq	$1, %rax	 ;, tmp282
	movq	%rax, -112(%rbp)	 ; tmp282, start
 ; D:/TC/src/lexer.c:71:         size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp283
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _6
 ; D:/TC/src/lexer.c:71:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp284
	movq	%rax, -120(%rbp)	 ; tmp284, column_start
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L27	 ;
.L29:
 ; D:/TC/src/lexer.c:73:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp285
	movq	%rax, %rcx	 ; tmp285,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp286, c
.L27:
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$96, -17(%rbp)	 ;, c
	jle	.L28	 ;,
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$122, -17(%rbp)	 ;, c
	jle	.L29	 ;,
.L28:
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$64, -17(%rbp)	 ;, c
	jle	.L30	 ;,
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$90, -17(%rbp)	 ;, c
	jle	.L29	 ;,
.L30:
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L31	 ;,
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$57, -17(%rbp)	 ;, c
	jle	.L29	 ;,
.L31:
 ; D:/TC/src/lexer.c:72:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	cmpb	$95, -17(%rbp)	 ;, c
	je	.L29	 ;,
 ; D:/TC/src/lexer.c:74:         move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp287
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp287,
	call	move_position	 ;
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	16(%rbp), %rax	 ; lexer, tmp288
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _7
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	subq	-112(%rbp), %rax	 ; start, _8
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	16(%rbp), %rdx	 ; lexer, tmp289
	movq	8(%rdx), %rcx	 ; lexer_213(D)->source, _9
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	-112(%rbp), %rdx	 ; start, tmp290
	addq	%rdx, %rcx	 ; tmp290, _10
 ; D:/TC/src/lexer.c:75:         string content = create_string(&lexer->source[start], lexer->position - start);
	movq	%rax, %rdx	 ; _8,
	call	create_string	 ;
	movq	%rax, -128(%rbp)	 ; tmp291, content
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	movq	-128(%rbp), %rax	 ; content, tmp292
	movq	%rax, %rcx	 ; tmp292,
	call	is_keyword	 ;
 ; D:/TC/src/lexer.c:76:         if (is_keyword(content))
	testb	%al, %al	 ; _11
	je	.L32	 ;,
 ; D:/TC/src/lexer.c:77:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp293
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _12
	movq	-120(%rbp), %rcx	 ; column_start, tmp294
	movq	-128(%rbp), %rax	 ; content, tmp295
	movq	%rcx, %r9	 ; tmp294,
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp295,
	movl	$6, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L32:
 ; D:/TC/src/lexer.c:79:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp296
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _13
	movq	-120(%rbp), %rcx	 ; column_start, tmp297
	movq	-128(%rbp), %rax	 ; content, tmp298
	movq	%rcx, %r9	 ; tmp297,
	movq	%rdx, %r8	 ; _13,
	movq	%rax, %rdx	 ; tmp298,
	movl	$1, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L26:
 ; D:/TC/src/lexer.c:80:     } else if ('0' <= c && c <= '9') {
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L33	 ;,
 ; D:/TC/src/lexer.c:80:     } else if ('0' <= c && c <= '9') {
	cmpb	$57, -17(%rbp)	 ;, c
	jg	.L33	 ;,
 ; D:/TC/src/lexer.c:81:         size_t start = lexer->position - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp299
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _14
 ; D:/TC/src/lexer.c:81:         size_t start = lexer->position - 1;
	subq	$1, %rax	 ;, tmp300
	movq	%rax, -40(%rbp)	 ; tmp300, start
 ; D:/TC/src/lexer.c:82:         size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp301
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _15
 ; D:/TC/src/lexer.c:82:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp302
	movq	%rax, -48(%rbp)	 ; tmp302, column_start
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	jmp	.L34	 ;
.L36:
 ; D:/TC/src/lexer.c:84:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp303
	movq	%rax, %rcx	 ; tmp303,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp304, c
.L34:
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L35	 ;,
 ; D:/TC/src/lexer.c:83:         while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	 ;, c
	jle	.L36	 ;,
.L35:
 ; D:/TC/src/lexer.c:85:         TokenType type = INTEGER;
	movl	$2, -24(%rbp)	 ;, type
 ; D:/TC/src/lexer.c:86:         char p = peek_next_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp305
	movq	%rax, %rcx	 ; tmp305,
	call	peek_next_char	 ;
	movb	%al, -49(%rbp)	 ; tmp306, p
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, -17(%rbp)	 ;, c
	jne	.L37	 ;,
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$47, -49(%rbp)	 ;, p
	jle	.L37	 ;,
 ; D:/TC/src/lexer.c:87:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$57, -49(%rbp)	 ;, p
	jg	.L37	 ;,
 ; D:/TC/src/lexer.c:88:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp307
	movq	%rax, %rcx	 ; tmp307,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp308, c
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	jmp	.L38	 ;
.L40:
 ; D:/TC/src/lexer.c:90:                 c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp309
	movq	%rax, %rcx	 ; tmp309,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp310, c
.L38:
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	cmpb	$47, -17(%rbp)	 ;, c
	jle	.L39	 ;,
 ; D:/TC/src/lexer.c:89:             while ('0' <= c && c <= '9')
	cmpb	$57, -17(%rbp)	 ;, c
	jle	.L40	 ;,
.L39:
 ; D:/TC/src/lexer.c:91:             type = FLOAT;
	movl	$3, -24(%rbp)	 ;, type
.L37:
 ; D:/TC/src/lexer.c:93:         move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp311
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp311,
	call	move_position	 ;
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp312
	movq	32(%rax), %rbx	 ; lexer_213(D)->line, _16
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp313
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _17
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-40(%rbp), %rax	 ; start, _18
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rdx	 ; lexer, tmp314
	movq	8(%rdx), %rcx	 ; lexer_213(D)->source, _19
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-40(%rbp), %rdx	 ; start, tmp315
	addq	%rdx, %rcx	 ; tmp315, _20
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _18,
	call	create_string	 ;
	movq	%rax, %rdx	 ;, _21
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-48(%rbp), %rcx	 ; column_start, tmp316
	movl	-24(%rbp), %eax	 ; type, tmp317
	movq	%rcx, %r9	 ; tmp316,
	movq	%rbx, %r8	 ; _16,
	movl	%eax, %ecx	 ; tmp317,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:94:         return create_token(type, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L33:
 ; D:/TC/src/lexer.c:95:     } else if (c == '"') {
	cmpb	$34, -17(%rbp)	 ;, c
	jne	.L41	 ;,
 ; D:/TC/src/lexer.c:96:         size_t start = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp318
	movq	16(%rax), %rax	 ; lexer_213(D)->position, tmp319
	movq	%rax, -96(%rbp)	 ; tmp319, start
 ; D:/TC/src/lexer.c:97:         size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp320
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _22
 ; D:/TC/src/lexer.c:97:         size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp321
	movq	%rax, -104(%rbp)	 ; tmp321, column_start
 ; D:/TC/src/lexer.c:98:         c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp322
	movq	%rax, %rcx	 ; tmp322,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp323, c
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L42	 ;
.L44:
 ; D:/TC/src/lexer.c:100:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp324
	movq	%rax, %rcx	 ; tmp324,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp325, c
.L42:
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, -17(%rbp)	 ;, c
	je	.L43	 ;,
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$0, -17(%rbp)	 ;, c
	je	.L43	 ;,
 ; D:/TC/src/lexer.c:99:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L44	 ;,
.L43:
 ; D:/TC/src/lexer.c:101:         if (c != '"') {
	cmpb	$34, -17(%rbp)	 ;, c
	je	.L45	 ;,
 ; D:/TC/src/lexer.c:102:             lexer_error("Unterminated string literal", lexer->line, start - 1, lexer->filename);
	movq	16(%rbp), %rax	 ; lexer, tmp326
	movq	(%rax), %rdx	 ; lexer_213(D)->filename, _23
	movq	-96(%rbp), %rax	 ; start, tmp327
	leaq	-1(%rax), %rcx	 ;, _24
	movq	16(%rbp), %rax	 ; lexer, tmp328
	movq	32(%rax), %rax	 ; lexer_213(D)->line, _25
	movq	%rdx, %r9	 ; _23,
	movq	%rcx, %r8	 ; _24,
	movq	%rax, %rdx	 ; _25,
	leaq	.LC1(%rip), %rax	 ;, tmp329
	movq	%rax, %rcx	 ; tmp329,
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:103:             if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L45	 ;,
 ; D:/TC/src/lexer.c:103:             if (c == '\n') newline(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp330
	movq	%rax, %rcx	 ; tmp330,
	call	newline	 ;
.L45:
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	movq	16(%rbp), %rax	 ; lexer, tmp331
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _26
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	subq	-96(%rbp), %rax	 ; start, _27
 ; D:/TC/src/lexer.c:105:         if (lexer->position - start == 1)
	cmpq	$1, %rax	 ;, _27
	jne	.L46	 ;,
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp332
	movq	32(%rax), %rbx	 ; lexer_213(D)->line, _28
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp333
	movq	%rax, %rcx	 ; tmp333,
	call	create_string	 ;
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	movq	-104(%rbp), %rdx	 ; column_start, tmp334
	movq	%rdx, %r9	 ; tmp334,
	movq	%rbx, %r8	 ; _28,
	movq	%rax, %rdx	 ; _29,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:106:             return create_token(STRING, create_string("\0", 1), lexer->line, column_start);
	jmp	.L19	 ;
.L46:
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp335
	movq	32(%rax), %rbx	 ; lexer_213(D)->line, _30
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp336
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _31
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	subq	-96(%rbp), %rax	 ; start, _32
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	leaq	-1(%rax), %rdx	 ;, _33
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp337
	movq	8(%rax), %rcx	 ; lexer_213(D)->source, _34
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-96(%rbp), %rax	 ; start, tmp338
	addq	%rcx, %rax	 ; _34, _35
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	%rax, %rcx	 ; _35,
	call	create_string	 ;
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	movq	-104(%rbp), %rdx	 ; column_start, tmp339
	movq	%rdx, %r9	 ; tmp339,
	movq	%rbx, %r8	 ; _30,
	movq	%rax, %rdx	 ; _36,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:107:         return create_token(STRING, create_string(&lexer->source[start], lexer->position - start - 1), lexer->line, column_start);
	jmp	.L19	 ;
.L41:
 ; D:/TC/src/lexer.c:109:         char p = peek_next_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp340
	movq	%rax, %rcx	 ; tmp340,
	call	peek_next_char	 ;
	movb	%al, -25(%rbp)	 ; tmp341, p
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L47	 ;,
 ; D:/TC/src/lexer.c:110:         if (c == '/' && p == '/') {
	cmpb	$47, -25(%rbp)	 ;, p
	jne	.L47	 ;,
 ; D:/TC/src/lexer.c:111:             size_t start = lexer->position + 1;
	movq	16(%rbp), %rax	 ; lexer, tmp342
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _37
 ; D:/TC/src/lexer.c:111:             size_t start = lexer->position + 1;
	addq	$1, %rax	 ;, tmp343
	movq	%rax, -64(%rbp)	 ; tmp343, start
 ; D:/TC/src/lexer.c:112:             size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp344
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _38
 ; D:/TC/src/lexer.c:112:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp345
	movq	%rax, -72(%rbp)	 ; tmp345, column_start
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	jmp	.L48	 ;
.L50:
 ; D:/TC/src/lexer.c:114:                 c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp346
	movq	%rax, %rcx	 ; tmp346,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp347, c
.L48:
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$10, -17(%rbp)	 ;, c
	je	.L49	 ;,
 ; D:/TC/src/lexer.c:113:             while (c != '\n' && c != '\0')
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L50	 ;,
.L49:
 ; D:/TC/src/lexer.c:115:             move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp348
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp348,
	call	move_position	 ;
 ; D:/TC/src/lexer.c:116:             if (skip_comment)
	cmpb	$0, 24(%rbp)	 ;, skip_comment
	je	.L51	 ;,
 ; D:/TC/src/lexer.c:117:                 return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _39
	movq	16(%rbp), %rax	 ; lexer, tmp349
	movq	%rax, %rcx	 ; tmp349,
	call	next_token	 ;
	jmp	.L19	 ;
.L51:
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp350
	movq	32(%rax), %rbx	 ; lexer_213(D)->line, _40
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp351
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _41
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-64(%rbp), %rax	 ; start, _42
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rdx	 ; lexer, tmp352
	movq	8(%rdx), %rcx	 ; lexer_213(D)->source, _43
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-64(%rbp), %rdx	 ; start, tmp353
	addq	%rdx, %rcx	 ; tmp353, _44
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _42,
	call	create_string	 ;
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-72(%rbp), %rdx	 ; column_start, tmp354
	movq	%rdx, %r9	 ; tmp354,
	movq	%rbx, %r8	 ; _40,
	movq	%rax, %rdx	 ; _45,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:118:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L47:
 ; D:/TC/src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L52	 ;,
 ; D:/TC/src/lexer.c:119:         } else if (c == '/' && p == '*') {
	cmpb	$42, -25(%rbp)	 ;, p
	jne	.L52	 ;,
 ; D:/TC/src/lexer.c:120:             size_t start = lexer->position + 1;
	movq	16(%rbp), %rax	 ; lexer, tmp355
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _46
 ; D:/TC/src/lexer.c:120:             size_t start = lexer->position + 1;
	addq	$1, %rax	 ;, tmp356
	movq	%rax, -80(%rbp)	 ; tmp356, start
 ; D:/TC/src/lexer.c:121:             size_t column_start = lexer->column - 1;
	movq	16(%rbp), %rax	 ; lexer, tmp357
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _47
 ; D:/TC/src/lexer.c:121:             size_t column_start = lexer->column - 1;
	subq	$1, %rax	 ;, tmp358
	movq	%rax, -88(%rbp)	 ; tmp358, column_start
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	jmp	.L53	 ;
.L57:
 ; D:/TC/src/lexer.c:123:                 c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp359
	movq	%rax, %rcx	 ; tmp359,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp360, c
 ; D:/TC/src/lexer.c:124:                 p = peek_next_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp361
	movq	%rax, %rcx	 ; tmp361,
	call	peek_next_char	 ;
	movb	%al, -25(%rbp)	 ; tmp362, p
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	cmpb	$10, -17(%rbp)	 ;, c
	jne	.L54	 ;,
 ; D:/TC/src/lexer.c:125:                 if (c == '\n') newline(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp363
	movq	%rax, %rcx	 ; tmp363,
	call	newline	 ;
.L54:
 ; D:/TC/src/lexer.c:126:                 if (p == '\0') break;
	cmpb	$0, -25(%rbp)	 ;, p
	je	.L92	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L53	 ;,
 ; D:/TC/src/lexer.c:127:                 assert(c != '\0');
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$127, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp364
	movq	%rax, %rcx	 ; tmp364,
	call	__assert_func	 ;
.L53:
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$42, -17(%rbp)	 ;, c
	jne	.L57	 ;,
 ; D:/TC/src/lexer.c:122:             while (!(c == '*' && p == '/')) {
	cmpb	$47, -25(%rbp)	 ;, p
	jne	.L57	 ;,
	jmp	.L56	 ;
.L92:
 ; D:/TC/src/lexer.c:126:                 if (p == '\0') break;
	nop	
.L56:
 ; D:/TC/src/lexer.c:129:             if (p == '\0') {
	cmpb	$0, -25(%rbp)	 ;, p
	jne	.L58	 ;,
 ; D:/TC/src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	cmpb	$0, -17(%rbp)	 ;, c
	jne	.L59	 ;,
 ; D:/TC/src/lexer.c:130:                 if (c == '\0') move_position(lexer, -1);
	movq	16(%rbp), %rax	 ; lexer, tmp365
	movl	$-1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp365,
	call	move_position	 ;
.L59:
 ; D:/TC/src/lexer.c:131:                 lexer_error("Unterminated comment", lexer->line, start, lexer->filename);
	movq	16(%rbp), %rax	 ; lexer, tmp366
	movq	(%rax), %rcx	 ; lexer_213(D)->filename, _48
	movq	16(%rbp), %rax	 ; lexer, tmp367
	movq	32(%rax), %rax	 ; lexer_213(D)->line, _49
	movq	-80(%rbp), %rdx	 ; start, tmp368
	movq	%rcx, %r9	 ; _48,
	movq	%rdx, %r8	 ; tmp368,
	movq	%rax, %rdx	 ; _49,
	leaq	.LC5(%rip), %rax	 ;, tmp369
	movq	%rax, %rcx	 ; tmp369,
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:132:                 if (skip_comment)
	cmpb	$0, 24(%rbp)	 ;, skip_comment
	je	.L60	 ;,
 ; D:/TC/src/lexer.c:133:                     return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _50
	movq	16(%rbp), %rax	 ; lexer, tmp370
	movq	%rax, %rcx	 ; tmp370,
	call	next_token	 ;
	jmp	.L19	 ;
.L60:
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp371
	movq	32(%rax), %rbx	 ; lexer_213(D)->line, _51
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp372
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _52
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	subq	-80(%rbp), %rax	 ; start, _53
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	16(%rbp), %rdx	 ; lexer, tmp373
	movq	8(%rdx), %rcx	 ; lexer_213(D)->source, _54
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-80(%rbp), %rdx	 ; start, tmp374
	addq	%rdx, %rcx	 ; tmp374, _55
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	%rax, %rdx	 ; _53,
	call	create_string	 ;
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	movq	-88(%rbp), %rdx	 ; column_start, tmp375
	movq	%rdx, %r9	 ; tmp375,
	movq	%rbx, %r8	 ; _51,
	movq	%rax, %rdx	 ; _56,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:134:                 return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start), lexer->line, column_start);
	jmp	.L19	 ;
.L58:
 ; D:/TC/src/lexer.c:136:             c = get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp376
	movq	%rax, %rcx	 ; tmp376,
	call	get_current_char	 ;
	movb	%al, -17(%rbp)	 ; tmp377, c
 ; D:/TC/src/lexer.c:137:             if (skip_comment)
	cmpb	$0, 24(%rbp)	 ;, skip_comment
	je	.L61	 ;,
 ; D:/TC/src/lexer.c:138:                 return next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _57
	movq	16(%rbp), %rax	 ; lexer, tmp378
	movq	%rax, %rcx	 ; tmp378,
	call	next_token	 ;
	jmp	.L19	 ;
.L61:
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp379
	movq	32(%rax), %rbx	 ; lexer_213(D)->line, _58
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp380
	movq	16(%rax), %rax	 ; lexer_213(D)->position, _59
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	subq	-80(%rbp), %rax	 ; start, _60
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	leaq	-2(%rax), %rdx	 ;, _61
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	16(%rbp), %rax	 ; lexer, tmp381
	movq	8(%rax), %rcx	 ; lexer_213(D)->source, _62
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-80(%rbp), %rax	 ; start, tmp382
	addq	%rcx, %rax	 ; _62, _63
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	%rax, %rcx	 ; _63,
	call	create_string	 ;
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	movq	-88(%rbp), %rdx	 ; column_start, tmp383
	movq	%rdx, %r9	 ; tmp383,
	movq	%rbx, %r8	 ; _58,
	movq	%rax, %rdx	 ; _64,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; D:/TC/src/lexer.c:139:             return create_token(COMMENT, create_string(&lexer->source[start], lexer->position - start - 2), lexer->line, column_start);
	jmp	.L19	 ;
.L52:
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, -17(%rbp)	 ;, c
	jne	.L62	 ;,
 ; D:/TC/src/lexer.c:140:         } else if (c == '=' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L62	 ;,
 ; D:/TC/src/lexer.c:141:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp384
	movq	%rax, %rcx	 ; tmp384,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp385
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _65
 ; D:/TC/src/lexer.c:142:             return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _66
	movq	16(%rbp), %rax	 ; lexer, tmp386
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _67
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp387
	movq	(%rax), %rax	 ; EQ_SYMBOL, EQ_SYMBOL.0_68
	movq	%rcx, %r9	 ; _66,
	movq	%rdx, %r8	 ; _67,
	movq	%rax, %rdx	 ; EQ_SYMBOL.0_68,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L62:
 ; D:/TC/src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$33, -17(%rbp)	 ;, c
	jne	.L63	 ;,
 ; D:/TC/src/lexer.c:143:         } else if (c == '!' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L63	 ;,
 ; D:/TC/src/lexer.c:144:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp388
	movq	%rax, %rcx	 ; tmp388,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp389
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _69
 ; D:/TC/src/lexer.c:145:             return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _70
	movq	16(%rbp), %rax	 ; lexer, tmp390
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _71
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp391
	movq	(%rax), %rax	 ; NE_SYMBOL, NE_SYMBOL.1_72
	movq	%rcx, %r9	 ; _70,
	movq	%rdx, %r8	 ; _71,
	movq	%rax, %rdx	 ; NE_SYMBOL.1_72,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L63:
 ; D:/TC/src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$60, -17(%rbp)	 ;, c
	jne	.L64	 ;,
 ; D:/TC/src/lexer.c:146:         } else if (c == '<' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L64	 ;,
 ; D:/TC/src/lexer.c:147:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp392
	movq	%rax, %rcx	 ; tmp392,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp393
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _73
 ; D:/TC/src/lexer.c:148:             return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _74
	movq	16(%rbp), %rax	 ; lexer, tmp394
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _75
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp395
	movq	(%rax), %rax	 ; LE_SYMBOL, LE_SYMBOL.2_76
	movq	%rcx, %r9	 ; _74,
	movq	%rdx, %r8	 ; _75,
	movq	%rax, %rdx	 ; LE_SYMBOL.2_76,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L64:
 ; D:/TC/src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$62, -17(%rbp)	 ;, c
	jne	.L65	 ;,
 ; D:/TC/src/lexer.c:149:         } else if (c == '>' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L65	 ;,
 ; D:/TC/src/lexer.c:150:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp396
	movq	%rax, %rcx	 ; tmp396,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp397
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _77
 ; D:/TC/src/lexer.c:151:             return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _78
	movq	16(%rbp), %rax	 ; lexer, tmp398
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _79
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp399
	movq	(%rax), %rax	 ; GE_SYMBOL, GE_SYMBOL.3_80
	movq	%rcx, %r9	 ; _78,
	movq	%rdx, %r8	 ; _79,
	movq	%rax, %rdx	 ; GE_SYMBOL.3_80,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L65:
 ; D:/TC/src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$43, -17(%rbp)	 ;, c
	jne	.L66	 ;,
 ; D:/TC/src/lexer.c:152:         } else if (c == '+' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L66	 ;,
 ; D:/TC/src/lexer.c:153:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp400
	movq	%rax, %rcx	 ; tmp400,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp401
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _81
 ; D:/TC/src/lexer.c:154:             return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _82
	movq	16(%rbp), %rax	 ; lexer, tmp402
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _83
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp403
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.4_84
	movq	%rcx, %r9	 ; _82,
	movq	%rdx, %r8	 ; _83,
	movq	%rax, %rdx	 ; ADD_ASSIGN_SYMBOL.4_84,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L66:
 ; D:/TC/src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$45, -17(%rbp)	 ;, c
	jne	.L67	 ;,
 ; D:/TC/src/lexer.c:155:         } else if (c == '-' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L67	 ;,
 ; D:/TC/src/lexer.c:156:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp404
	movq	%rax, %rcx	 ; tmp404,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp405
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _85
 ; D:/TC/src/lexer.c:157:             return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _86
	movq	16(%rbp), %rax	 ; lexer, tmp406
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _87
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp407
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.5_88
	movq	%rcx, %r9	 ; _86,
	movq	%rdx, %r8	 ; _87,
	movq	%rax, %rdx	 ; SUB_ASSIGN_SYMBOL.5_88,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L67:
 ; D:/TC/src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$42, -17(%rbp)	 ;, c
	jne	.L68	 ;,
 ; D:/TC/src/lexer.c:158:         } else if (c == '*' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L68	 ;,
 ; D:/TC/src/lexer.c:159:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp408
	movq	%rax, %rcx	 ; tmp408,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp409
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _89
 ; D:/TC/src/lexer.c:160:             return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _90
	movq	16(%rbp), %rax	 ; lexer, tmp410
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _91
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp411
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.6_92
	movq	%rcx, %r9	 ; _90,
	movq	%rdx, %r8	 ; _91,
	movq	%rax, %rdx	 ; MUL_ASSIGN_SYMBOL.6_92,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L68:
 ; D:/TC/src/lexer.c:161:         } else if (c == '/' && p == '=') {
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L69	 ;,
 ; D:/TC/src/lexer.c:161:         } else if (c == '/' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L69	 ;,
 ; D:/TC/src/lexer.c:162:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp412
	movq	%rax, %rcx	 ; tmp412,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp413
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _93
 ; D:/TC/src/lexer.c:163:             return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _94
	movq	16(%rbp), %rax	 ; lexer, tmp414
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _95
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp415
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.7_96
	movq	%rcx, %r9	 ; _94,
	movq	%rdx, %r8	 ; _95,
	movq	%rax, %rdx	 ; DIV_ASSIGN_SYMBOL.7_96,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L69:
 ; D:/TC/src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$37, -17(%rbp)	 ;, c
	jne	.L70	 ;,
 ; D:/TC/src/lexer.c:164:         } else if (c == '%' && p == '=') {
	cmpb	$61, -25(%rbp)	 ;, p
	jne	.L70	 ;,
 ; D:/TC/src/lexer.c:165:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp416
	movq	%rax, %rcx	 ; tmp416,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp417
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _97
 ; D:/TC/src/lexer.c:166:             return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _98
	movq	16(%rbp), %rax	 ; lexer, tmp418
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _99
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp419
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.8_100
	movq	%rcx, %r9	 ; _98,
	movq	%rdx, %r8	 ; _99,
	movq	%rax, %rdx	 ; MOD_ASSIGN_SYMBOL.8_100,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L70:
 ; D:/TC/src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, -17(%rbp)	 ;, c
	jne	.L71	 ;,
 ; D:/TC/src/lexer.c:167:         } else if (c == '&' && p == '&') {
	cmpb	$38, -25(%rbp)	 ;, p
	jne	.L71	 ;,
 ; D:/TC/src/lexer.c:168:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp420
	movq	%rax, %rcx	 ; tmp420,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp421
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _101
 ; D:/TC/src/lexer.c:169:             return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _102
	movq	16(%rbp), %rax	 ; lexer, tmp422
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _103
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp423
	movq	(%rax), %rax	 ; AND_SYMBOL, AND_SYMBOL.9_104
	movq	%rcx, %r9	 ; _102,
	movq	%rdx, %r8	 ; _103,
	movq	%rax, %rdx	 ; AND_SYMBOL.9_104,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L71:
 ; D:/TC/src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, -17(%rbp)	 ;, c
	jne	.L72	 ;,
 ; D:/TC/src/lexer.c:170:         } else if (c == '|' && p == '|') {
	cmpb	$124, -25(%rbp)	 ;, p
	jne	.L72	 ;,
 ; D:/TC/src/lexer.c:171:             get_current_char(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp424
	movq	%rax, %rcx	 ; tmp424,
	call	get_current_char	 ;
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	movq	16(%rbp), %rax	 ; lexer, tmp425
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _105
 ; D:/TC/src/lexer.c:172:             return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
	leaq	-2(%rax), %rcx	 ;, _106
	movq	16(%rbp), %rax	 ; lexer, tmp426
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _107
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp427
	movq	(%rax), %rax	 ; OR_SYMBOL, OR_SYMBOL.10_108
	movq	%rcx, %r9	 ; _106,
	movq	%rdx, %r8	 ; _107,
	movq	%rax, %rdx	 ; OR_SYMBOL.10_108,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L72:
 ; D:/TC/src/lexer.c:173:         } else if (c == '(')
	cmpb	$40, -17(%rbp)	 ;, c
	jne	.L73	 ;,
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp428
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _109
 ; D:/TC/src/lexer.c:174:             return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _110
	movq	16(%rbp), %rax	 ; lexer, tmp429
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _111
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp430
	movq	(%rax), %rax	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.11_112
	movq	%rcx, %r9	 ; _110,
	movq	%rdx, %r8	 ; _111,
	movq	%rax, %rdx	 ; L_PAREN_SYMBOL.11_112,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L73:
 ; D:/TC/src/lexer.c:175:         else if (c == ')')
	cmpb	$41, -17(%rbp)	 ;, c
	jne	.L74	 ;,
 ; D:/TC/src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp431
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _113
 ; D:/TC/src/lexer.c:176:             return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _114
	movq	16(%rbp), %rax	 ; lexer, tmp432
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _115
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp433
	movq	(%rax), %rax	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.12_116
	movq	%rcx, %r9	 ; _114,
	movq	%rdx, %r8	 ; _115,
	movq	%rax, %rdx	 ; R_PAREN_SYMBOL.12_116,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L74:
 ; D:/TC/src/lexer.c:177:         else if (c == '{')
	cmpb	$123, -17(%rbp)	 ;, c
	jne	.L75	 ;,
 ; D:/TC/src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp434
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _117
 ; D:/TC/src/lexer.c:178:             return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _118
	movq	16(%rbp), %rax	 ; lexer, tmp435
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _119
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp436
	movq	(%rax), %rax	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.13_120
	movq	%rcx, %r9	 ; _118,
	movq	%rdx, %r8	 ; _119,
	movq	%rax, %rdx	 ; L_BRACE_SYMBOL.13_120,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L75:
 ; D:/TC/src/lexer.c:179:         else if (c == '}')
	cmpb	$125, -17(%rbp)	 ;, c
	jne	.L76	 ;,
 ; D:/TC/src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp437
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _121
 ; D:/TC/src/lexer.c:180:             return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _122
	movq	16(%rbp), %rax	 ; lexer, tmp438
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _123
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp439
	movq	(%rax), %rax	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.14_124
	movq	%rcx, %r9	 ; _122,
	movq	%rdx, %r8	 ; _123,
	movq	%rax, %rdx	 ; R_BRACE_SYMBOL.14_124,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L76:
 ; D:/TC/src/lexer.c:181:         else if (c == ',')
	cmpb	$44, -17(%rbp)	 ;, c
	jne	.L77	 ;,
 ; D:/TC/src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp440
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _125
 ; D:/TC/src/lexer.c:182:             return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _126
	movq	16(%rbp), %rax	 ; lexer, tmp441
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _127
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp442
	movq	(%rax), %rax	 ; COMMA_SYMBOL, COMMA_SYMBOL.15_128
	movq	%rcx, %r9	 ; _126,
	movq	%rdx, %r8	 ; _127,
	movq	%rax, %rdx	 ; COMMA_SYMBOL.15_128,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L77:
 ; D:/TC/src/lexer.c:183:         else if (c == '!')
	cmpb	$33, -17(%rbp)	 ;, c
	jne	.L78	 ;,
 ; D:/TC/src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp443
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _129
 ; D:/TC/src/lexer.c:184:             return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _130
	movq	16(%rbp), %rax	 ; lexer, tmp444
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _131
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp445
	movq	(%rax), %rax	 ; NOT_SYMBOL, NOT_SYMBOL.16_132
	movq	%rcx, %r9	 ; _130,
	movq	%rdx, %r8	 ; _131,
	movq	%rax, %rdx	 ; NOT_SYMBOL.16_132,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L78:
 ; D:/TC/src/lexer.c:185:         else if (c == '.')
	cmpb	$46, -17(%rbp)	 ;, c
	jne	.L79	 ;,
 ; D:/TC/src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp446
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _133
 ; D:/TC/src/lexer.c:186:             return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _134
	movq	16(%rbp), %rax	 ; lexer, tmp447
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _135
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp448
	movq	(%rax), %rax	 ; DOT_SYMBOL, DOT_SYMBOL.17_136
	movq	%rcx, %r9	 ; _134,
	movq	%rdx, %r8	 ; _135,
	movq	%rax, %rdx	 ; DOT_SYMBOL.17_136,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L79:
 ; D:/TC/src/lexer.c:187:         else if (c == '[')
	cmpb	$91, -17(%rbp)	 ;, c
	jne	.L80	 ;,
 ; D:/TC/src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp449
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _137
 ; D:/TC/src/lexer.c:188:             return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _138
	movq	16(%rbp), %rax	 ; lexer, tmp450
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _139
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp451
	movq	(%rax), %rax	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.18_140
	movq	%rcx, %r9	 ; _138,
	movq	%rdx, %r8	 ; _139,
	movq	%rax, %rdx	 ; L_BRACKET_SYMBOL.18_140,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L80:
 ; D:/TC/src/lexer.c:189:         else if (c == ']')
	cmpb	$93, -17(%rbp)	 ;, c
	jne	.L81	 ;,
 ; D:/TC/src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp452
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _141
 ; D:/TC/src/lexer.c:190:             return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _142
	movq	16(%rbp), %rax	 ; lexer, tmp453
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _143
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp454
	movq	(%rax), %rax	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.19_144
	movq	%rcx, %r9	 ; _142,
	movq	%rdx, %r8	 ; _143,
	movq	%rax, %rdx	 ; R_BRACKET_SYMBOL.19_144,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L81:
 ; D:/TC/src/lexer.c:191:         else if (c == ';')
	cmpb	$59, -17(%rbp)	 ;, c
	jne	.L82	 ;,
 ; D:/TC/src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp455
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _145
 ; D:/TC/src/lexer.c:192:             return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _146
	movq	16(%rbp), %rax	 ; lexer, tmp456
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _147
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp457
	movq	(%rax), %rax	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.20_148
	movq	%rcx, %r9	 ; _146,
	movq	%rdx, %r8	 ; _147,
	movq	%rax, %rdx	 ; SEMICOLON_SYMBOL.20_148,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L82:
 ; D:/TC/src/lexer.c:193:         else if (c == '_')
	cmpb	$95, -17(%rbp)	 ;, c
	jne	.L83	 ;,
 ; D:/TC/src/lexer.c:194:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp458
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _149
 ; D:/TC/src/lexer.c:194:             return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _150
	movq	16(%rbp), %rax	 ; lexer, tmp459
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _151
	movq	.refptr.UNDERLINE_SYMBOL(%rip), %rax	 ;, tmp460
	movq	(%rax), %rax	 ; UNDERLINE_SYMBOL, UNDERLINE_SYMBOL.21_152
	movq	%rcx, %r9	 ; _150,
	movq	%rdx, %r8	 ; _151,
	movq	%rax, %rdx	 ; UNDERLINE_SYMBOL.21_152,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L83:
 ; D:/TC/src/lexer.c:195:         else if (c == '+')
	cmpb	$43, -17(%rbp)	 ;, c
	jne	.L84	 ;,
 ; D:/TC/src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp461
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _153
 ; D:/TC/src/lexer.c:196:             return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _154
	movq	16(%rbp), %rax	 ; lexer, tmp462
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _155
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp463
	movq	(%rax), %rax	 ; ADD_SYMBOL, ADD_SYMBOL.22_156
	movq	%rcx, %r9	 ; _154,
	movq	%rdx, %r8	 ; _155,
	movq	%rax, %rdx	 ; ADD_SYMBOL.22_156,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L84:
 ; D:/TC/src/lexer.c:197:         else if (c == '-')
	cmpb	$45, -17(%rbp)	 ;, c
	jne	.L85	 ;,
 ; D:/TC/src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp464
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _157
 ; D:/TC/src/lexer.c:198:             return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _158
	movq	16(%rbp), %rax	 ; lexer, tmp465
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _159
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp466
	movq	(%rax), %rax	 ; SUB_SYMBOL, SUB_SYMBOL.23_160
	movq	%rcx, %r9	 ; _158,
	movq	%rdx, %r8	 ; _159,
	movq	%rax, %rdx	 ; SUB_SYMBOL.23_160,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L85:
 ; D:/TC/src/lexer.c:199:         else if (c == '*')
	cmpb	$42, -17(%rbp)	 ;, c
	jne	.L86	 ;,
 ; D:/TC/src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp467
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _161
 ; D:/TC/src/lexer.c:200:             return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _162
	movq	16(%rbp), %rax	 ; lexer, tmp468
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _163
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp469
	movq	(%rax), %rax	 ; MUL_SYMBOL, MUL_SYMBOL.24_164
	movq	%rcx, %r9	 ; _162,
	movq	%rdx, %r8	 ; _163,
	movq	%rax, %rdx	 ; MUL_SYMBOL.24_164,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L86:
 ; D:/TC/src/lexer.c:201:         else if (c == '/')
	cmpb	$47, -17(%rbp)	 ;, c
	jne	.L87	 ;,
 ; D:/TC/src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp470
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _165
 ; D:/TC/src/lexer.c:202:             return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _166
	movq	16(%rbp), %rax	 ; lexer, tmp471
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _167
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp472
	movq	(%rax), %rax	 ; DIV_SYMBOL, DIV_SYMBOL.25_168
	movq	%rcx, %r9	 ; _166,
	movq	%rdx, %r8	 ; _167,
	movq	%rax, %rdx	 ; DIV_SYMBOL.25_168,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L87:
 ; D:/TC/src/lexer.c:203:         else if (c == '%')
	cmpb	$37, -17(%rbp)	 ;, c
	jne	.L88	 ;,
 ; D:/TC/src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp473
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _169
 ; D:/TC/src/lexer.c:204:             return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _170
	movq	16(%rbp), %rax	 ; lexer, tmp474
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _171
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp475
	movq	(%rax), %rax	 ; MOD_SYMBOL, MOD_SYMBOL.26_172
	movq	%rcx, %r9	 ; _170,
	movq	%rdx, %r8	 ; _171,
	movq	%rax, %rdx	 ; MOD_SYMBOL.26_172,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L88:
 ; D:/TC/src/lexer.c:205:         else if (c == '<')
	cmpb	$60, -17(%rbp)	 ;, c
	jne	.L89	 ;,
 ; D:/TC/src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp476
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _173
 ; D:/TC/src/lexer.c:206:             return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _174
	movq	16(%rbp), %rax	 ; lexer, tmp477
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _175
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp478
	movq	(%rax), %rax	 ; LT_SYMBOL, LT_SYMBOL.27_176
	movq	%rcx, %r9	 ; _174,
	movq	%rdx, %r8	 ; _175,
	movq	%rax, %rdx	 ; LT_SYMBOL.27_176,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L89:
 ; D:/TC/src/lexer.c:207:         else if (c == '>')
	cmpb	$62, -17(%rbp)	 ;, c
	jne	.L90	 ;,
 ; D:/TC/src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp479
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _177
 ; D:/TC/src/lexer.c:208:             return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _178
	movq	16(%rbp), %rax	 ; lexer, tmp480
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _179
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp481
	movq	(%rax), %rax	 ; GT_SYMBOL, GT_SYMBOL.28_180
	movq	%rcx, %r9	 ; _178,
	movq	%rdx, %r8	 ; _179,
	movq	%rax, %rdx	 ; GT_SYMBOL.28_180,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L90:
 ; D:/TC/src/lexer.c:209:         else if (c == '=')
	cmpb	$61, -17(%rbp)	 ;, c
	jne	.L91	 ;,
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	movq	16(%rbp), %rax	 ; lexer, tmp482
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _181
 ; D:/TC/src/lexer.c:210:             return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
	leaq	-1(%rax), %rcx	 ;, _182
	movq	16(%rbp), %rax	 ; lexer, tmp483
	movq	32(%rax), %rdx	 ; lexer_213(D)->line, _183
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp484
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.29_184
	movq	%rcx, %r9	 ; _182,
	movq	%rdx, %r8	 ; _183,
	movq	%rax, %rdx	 ; ASSIGN_SYMBOL.29_184,
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L19	 ;
.L91:
 ; D:/TC/src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	16(%rbp), %rax	 ; lexer, tmp485
	movq	(%rax), %rdx	 ; lexer_213(D)->filename, _185
 ; D:/TC/src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	movq	16(%rbp), %rax	 ; lexer, tmp486
	movq	40(%rax), %rax	 ; lexer_213(D)->column, _186
 ; D:/TC/src/lexer.c:212:             lexer_error("Unexpected character", lexer->line, lexer->column - 1, lexer->filename);
	leaq	-1(%rax), %rcx	 ;, _187
	movq	16(%rbp), %rax	 ; lexer, tmp487
	movq	32(%rax), %rax	 ; lexer_213(D)->line, _188
	movq	%rdx, %r9	 ; _185,
	movq	%rcx, %r8	 ; _187,
	movq	%rax, %rdx	 ; _188,
	leaq	.LC6(%rip), %rax	 ;, tmp488
	movq	%rax, %rcx	 ; tmp488,
	call	lexer_error	 ;
 ; D:/TC/src/lexer.c:213:             return create_token(EOF_TOKEN, NULL, 0, 0);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
.L19:
 ; D:/TC/src/lexer.c:216: }
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
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	48(%rax), %rax	 ; lexer_10(D)->peeked_token, _1
 ; D:/TC/src/lexer.c:219:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; _1
	je	.L94	 ;,
 ; D:/TC/src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	48(%rax), %rdx	 ; lexer_10(D)->peeked_token, _2
 ; D:/TC/src/lexer.c:220:         lexer->current_token = lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp94
	movq	%rdx, 80(%rax)	 ; _2, lexer_10(D)->current_token
 ; D:/TC/src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	56(%rax), %rdx	 ; lexer_10(D)->peeked_position, _3
 ; D:/TC/src/lexer.c:221:         lexer->position = lexer->peeked_position;
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movq	%rdx, 16(%rax)	 ; _3, lexer_10(D)->position
 ; D:/TC/src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	64(%rax), %rdx	 ; lexer_10(D)->peeked_line, _4
 ; D:/TC/src/lexer.c:222:         lexer->line = lexer->peeked_line;
	movq	16(%rbp), %rax	 ; lexer, tmp98
	movq	%rdx, 32(%rax)	 ; _4, lexer_10(D)->line
 ; D:/TC/src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	72(%rax), %rdx	 ; lexer_10(D)->peeked_column, _5
 ; D:/TC/src/lexer.c:223:         lexer->column = lexer->peeked_column;
	movq	16(%rbp), %rax	 ; lexer, tmp100
	movq	%rdx, 40(%rax)	 ; _5, lexer_10(D)->column
 ; D:/TC/src/lexer.c:224:         lexer->peeked_token = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	$0, 48(%rax)	 ;, lexer_10(D)->peeked_token
 ; D:/TC/src/lexer.c:225:         return lexer->current_token;
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	80(%rax), %rax	 ; lexer_10(D)->current_token, _7
	jmp	.L95	 ;
.L94:
 ; D:/TC/src/lexer.c:227:     Token* token = next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _6
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp104, token
 ; D:/TC/src/lexer.c:228:     return lexer->current_token = token;
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	-8(%rbp), %rdx	 ; token, tmp106
	movq	%rdx, 80(%rax)	 ; tmp106, lexer_10(D)->current_token
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	80(%rax), %rax	 ; lexer_10(D)->current_token, _7
.L95:
 ; D:/TC/src/lexer.c:229: }
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
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	movq	16(%rbp), %rax	 ; lexer, tmp91
	movq	48(%rax), %rax	 ; lexer_9(D)->peeked_token, _1
 ; D:/TC/src/lexer.c:232:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; _1
	je	.L97	 ;,
 ; D:/TC/src/lexer.c:233:         return lexer->peeked_token;
	movq	16(%rbp), %rax	 ; lexer, tmp92
	movq	48(%rax), %rax	 ; lexer_9(D)->peeked_token, _6
	jmp	.L98	 ;
.L97:
 ; D:/TC/src/lexer.c:234:     size_t saved_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	16(%rax), %rax	 ; lexer_9(D)->position, tmp94
	movq	%rax, -8(%rbp)	 ; tmp94, saved_position
 ; D:/TC/src/lexer.c:235:     size_t saved_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movq	32(%rax), %rax	 ; lexer_9(D)->line, tmp96
	movq	%rax, -16(%rbp)	 ; tmp96, saved_line
 ; D:/TC/src/lexer.c:236:     size_t saved_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	40(%rax), %rax	 ; lexer_9(D)->column, tmp98
	movq	%rax, -24(%rbp)	 ; tmp98, saved_column
 ; D:/TC/src/lexer.c:237:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	24(%rbp), %edx	 ; skip_comment, _2
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	get_next_token	 ;
	movq	%rax, -32(%rbp)	 ; tmp100, token
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp101
	movq	16(%rax), %rdx	 ; lexer_9(D)->position, _3
 ; D:/TC/src/lexer.c:238:     lexer->peeked_position = lexer->position;
	movq	16(%rbp), %rax	 ; lexer, tmp102
	movq	%rdx, 56(%rax)	 ; _3, lexer_9(D)->peeked_position
 ; D:/TC/src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	32(%rax), %rdx	 ; lexer_9(D)->line, _4
 ; D:/TC/src/lexer.c:239:     lexer->peeked_line = lexer->line;
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movq	%rdx, 64(%rax)	 ; _4, lexer_9(D)->peeked_line
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp105
	movq	40(%rax), %rdx	 ; lexer_9(D)->column, _5
 ; D:/TC/src/lexer.c:240:     lexer->peeked_column = lexer->column;
	movq	16(%rbp), %rax	 ; lexer, tmp106
	movq	%rdx, 72(%rax)	 ; _5, lexer_9(D)->peeked_column
 ; D:/TC/src/lexer.c:241:     lexer->position = saved_position;
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	-8(%rbp), %rdx	 ; saved_position, tmp108
	movq	%rdx, 16(%rax)	 ; tmp108, lexer_9(D)->position
 ; D:/TC/src/lexer.c:242:     lexer->line = saved_line;
	movq	16(%rbp), %rax	 ; lexer, tmp109
	movq	-16(%rbp), %rdx	 ; saved_line, tmp110
	movq	%rdx, 32(%rax)	 ; tmp110, lexer_9(D)->line
 ; D:/TC/src/lexer.c:243:     lexer->column = saved_column;
	movq	16(%rbp), %rax	 ; lexer, tmp111
	movq	-24(%rbp), %rdx	 ; saved_column, tmp112
	movq	%rdx, 40(%rax)	 ; tmp112, lexer_9(D)->column
 ; D:/TC/src/lexer.c:244:     lexer->peeked_token = token;
	movq	16(%rbp), %rax	 ; lexer, tmp113
	movq	-32(%rbp), %rdx	 ; token, tmp114
	movq	%rdx, 48(%rax)	 ; tmp114, lexer_9(D)->peeked_token
 ; D:/TC/src/lexer.c:245:     return token;
	movq	-32(%rbp), %rax	 ; token, _6
.L98:
 ; D:/TC/src/lexer.c:246: }
	leave	
	ret	
	.globl	peek_current_token
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
peek_current_token:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:/TC/src/lexer.c:249:     return lexer->current_token;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	80(%rax), %rax	 ; lexer_2(D)->current_token, _3
 ; D:/TC/src/lexer.c:250: }
	popq	%rbp	 ;
	ret	
	.globl	reset_lexer
	.def	reset_lexer;	.scl	2;	.type	32;	.endef
reset_lexer:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
 ; D:/TC/src/lexer.c:253:     lexer->position = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp82
	movq	$0, 16(%rax)	 ;, lexer_2(D)->position
 ; D:/TC/src/lexer.c:254:     lexer->line = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp83
	movq	$0, 32(%rax)	 ;, lexer_2(D)->line
 ; D:/TC/src/lexer.c:255:     lexer->column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp84
	movq	$0, 40(%rax)	 ;, lexer_2(D)->column
 ; D:/TC/src/lexer.c:256:     lexer->peeked_token = NULL;
	movq	16(%rbp), %rax	 ; lexer, tmp85
	movq	$0, 48(%rax)	 ;, lexer_2(D)->peeked_token
 ; D:/TC/src/lexer.c:257:     lexer->peeked_position = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp86
	movq	$0, 56(%rax)	 ;, lexer_2(D)->peeked_position
 ; D:/TC/src/lexer.c:258:     lexer->peeked_line = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp87
	movq	$0, 64(%rax)	 ;, lexer_2(D)->peeked_line
 ; D:/TC/src/lexer.c:259:     lexer->peeked_column = 0;
	movq	16(%rbp), %rax	 ; lexer, tmp88
	movq	$0, 72(%rax)	 ;, lexer_2(D)->peeked_column
 ; D:/TC/src/lexer.c:260:     lexer->current_token = NULL;
	movq	16(%rbp), %rax	 ; lexer, tmp89
	movq	$0, 80(%rax)	 ;, lexer_2(D)->current_token
 ; D:/TC/src/lexer.c:261: }
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

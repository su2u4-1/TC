	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r12	; tmp104, file
	movq	%rsi, %rbp	; tmp105, length
; src/compiler.c:8:     fseek(file, 0, SEEK_END);
	movl	$2, %edx	;,
	movl	$0, %esi	;,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	%r12, %rdi	; file,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:9:     *length = (size_t)ftell(file);
	movq	%rax, 0(%rbp)	; tmp106, *length_19(D)
; src/compiler.c:10:     fseek(file, 0, SEEK_SET);
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%r12, %rdi	; file,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:12:     string source = create_string_not_check("", *length + 1);
	movq	0(%rbp), %rax	; *length_19(D), tmp111
	leaq	1(%rax), %rsi	;, tmp96
	leaq	.LC0(%rip), %rdi	;, tmp98
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp107, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	0(%rbp), %rdx	; *length_19(D), *length_19(D)
	movq	%r12, %rcx	; file,
	movl	$1, %esi	;,
	movq	%rax, %rdi	; <retval>,
	call	*fread@GOTPCREL(%rip)	;
; src/compiler.c:14:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	;, *_6
; src/compiler.c:15:     *length = bytes_read;
	movq	%rax, 0(%rbp)	; _34, *length_19(D)
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	testq	%rax, %rax	; _34
	je	.L1	;,
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	movl	$0, %eax	;, i
	jmp	.L4	;
.L3:
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	;, i
; src/compiler.c:17:     for (size_t i = 0; i < *length; ++i) {
	cmpq	0(%rbp), %rax	; *length_19(D), i
	jnb	.L1	;,
.L4:
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	; MEM[(char *)source_23 + i_40 * 1], tmp100
	andl	$-5, %edx	;, tmp100
; src/compiler.c:18:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	;, tmp100
	jne	.L3	;,
; src/compiler.c:19:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	;, MEM[(char *)source_23 + i_40 * 1]
	jmp	.L3	;
.L1:
; src/compiler.c:22: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	read_source, .-read_source
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	.section	.rodata.str1.1
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp181, file
	movq	%rsi, %r12	; tmp182, token
	cmpl	$7, 24(%rsi)	;, token_45(D)->type
	ja	.L8	;,
	movl	24(%rsi), %eax	; token_45(D)->type, token_45(D)->type
	leaq	.L10(%rip), %rdx	;, tmp124
	movslq	(%rdx,%rax,4), %rax	;, tmp126
	addq	%rdx, %rax	; tmp124, tmp127
	jmp	*%rax	; tmp127
	.section	.rodata
	.align 4
	.align 4
.L10:
	.long	.L17-.L10
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L17:
; src/compiler.c:25:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, token_45(D)->line
	addq	$1, %rcx	;, tmp131
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC1(%rip), %rdx	;, tmp133
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:26:         return;
	jmp	.L7	;
.L16:
; src/compiler.c:28:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp185
	addq	$1, %rcx	;, tmp136
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC2(%rip), %rdx	;, tmp138
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L8:
; src/compiler.c:23: void output_one_token(FILE* file, Token* token) {
	movl	$0, %ebx	;, i
; src/compiler.c:50:             fputs("\\r", file);
	leaq	.LC12(%rip), %r15	;, tmp178
; src/compiler.c:44:             fputs("\\0", file);
	leaq	.LC9(%rip), %r14	;, tmp180
	jmp	.L19	;
.L15:
; src/compiler.c:30:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp186
	addq	$1, %rcx	;, tmp141
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC3(%rip), %rdx	;, tmp143
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L8	;
.L14:
; src/compiler.c:32:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp187
	addq	$1, %rcx	;, tmp146
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC4(%rip), %rdx	;, tmp148
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L8	;
.L13:
; src/compiler.c:34:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp188
	addq	$1, %rcx	;, tmp151
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC5(%rip), %rdx	;, tmp153
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L8	;
.L12:
; src/compiler.c:36:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp189
	addq	$1, %rcx	;, tmp156
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC6(%rip), %rdx	;, tmp158
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L8	;
.L11:
; src/compiler.c:38:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp190
	addq	$1, %rcx	;, tmp161
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC7(%rip), %rdx	;, tmp163
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L8	;
.L9:
; src/compiler.c:40:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	; token_45(D)->column, token_45(D)->column
	movq	8(%rsi), %rcx	; token_45(D)->line, tmp191
	addq	$1, %rcx	;, tmp166
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC8(%rip), %rdx	;, tmp168
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L8	;
.L28:
; src/compiler.c:44:             fputs("\\0", file);
	movq	%r13, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r14, %rdi	; tmp180,
	call	*fwrite@GOTPCREL(%rip)	;
.L21:
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, %rbx	;, i
.L19:
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	(%r12), %rbp	; token_45(D)->lexeme, _37
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%rbp, %rdi	; _37,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:41:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %rbx	; tmp183, i
	jnb	.L27	;,
; src/compiler.c:42:         char c = token->lexeme[i];
	movzbl	0(%rbp,%rbx), %edi	; *_35, c
; src/compiler.c:43:         if (c == '\0')
	testb	%dil, %dil	; c
	je	.L28	;,
; src/compiler.c:45:         else if (c == '\n')
	cmpb	$10, %dil	;, c
	je	.L29	;,
; src/compiler.c:47:         else if (c == '\t')
	cmpb	$9, %dil	;, c
	je	.L30	;,
; src/compiler.c:49:         else if (c == '\r')
	cmpb	$13, %dil	;, c
	je	.L31	;,
; src/compiler.c:52:             fputc(c, file);
	movsbl	%dil, %edi	; c, c
	movq	%r13, %rsi	; file,
	call	*fputc@GOTPCREL(%rip)	;
	jmp	.L21	;
.L29:
; src/compiler.c:46:             fputs("\\n", file);
	movq	%r13, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L21	;
.L30:
; src/compiler.c:48:             fputs("\\t", file);
	movq	%r13, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp171
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L21	;
.L31:
; src/compiler.c:50:             fputs("\\r", file);
	movq	%r13, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r15, %rdi	; tmp178,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L21	;
.L27:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rdi	;, tmp177
	call	*fwrite@GOTPCREL(%rip)	;
.L7:
; src/compiler.c:55: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	output_one_token, .-output_one_token
	.section	.rodata.str1.1
.LC14:
	.string	"\ninfo by lib:\n    %s\n"
	.text
	.globl	output_token
	.type	output_token, @function
output_token:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbp	; tmp88, file
	movq	%rsi, %r12	; tmp89, lexer
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movl	$0, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp90, current
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	je	.L33	;,
.L34:
; src/compiler.c:58:         output_one_token(file, current);
	movq	%rbx, %rsi	; current,
	movq	%rbp, %rdi	; file,
	call	output_one_token	;
; src/compiler.c:59:         if (current->type == EOF_TOKEN)
	cmpl	$0, 24(%rbx)	;, current_18->type
	je	.L33	;,
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movl	$0, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp91, current
; src/compiler.c:57:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	jne	.L34	;,
.L33:
; src/compiler.c:62:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp92, _2
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC14(%rip), %rdx	;, tmp87
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; file,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:63: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbx	;
	subq	$32, %rsp	;,
	movq	%rdi, %rbx	; tmp87, file
	movq	%rsi, %rdi	; tmp88, ast
; src/compiler.c:66:     output_code(ast, file, 0, indent_has_next);
	movq	%rsp, %rcx	;, tmp85
	movl	$0, %edx	;,
	movq	%rbx, %rsi	; file,
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:67:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp89, _1
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC14(%rip), %rdx	;, tmp86
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; file,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:68: }
	addq	$32, %rsp	;,
	popq	%rbx	;
	ret	
	.size	output_ast, .-output_ast
	.globl	output_tac
	.type	output_tac, @function
output_tac:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp86, file
	movq	%rsi, %rdi	; tmp87, tac
; src/compiler.c:70:     output_TAC(tac, file, 0);
	movl	$0, %edx	;,
	movq	%rbx, %rsi	; file,
	call	*output_TAC@GOTPCREL(%rip)	;
; src/compiler.c:71:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp88, _1
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC14(%rip), %rdx	;, tmp85
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; file,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:72: }
	popq	%rbx	;
	ret	
	.size	output_tac, .-output_tac
	.section	.rodata.str1.1
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movl	%esi, %r14d	; tmp141, o_token
	movl	%edx, %r13d	; tmp142, o_ast
	movl	%ecx, %r12d	; tmp143, o_tac
; src/compiler.c:74:     File* file = create_file(name);
	call	*create_file@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp144, file
; src/compiler.c:75:     string filename = get_full_path(file);
	movq	%rax, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp145, filename
; src/compiler.c:76:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/compiler.c:77:     FILE* source_file = fopen(filename, "r");
	leaq	.LC15(%rip), %rsi	;, tmp115
	movq	%rax, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
; src/compiler.c:78:     if (source_file == NULL) {
	testq	%rax, %rax	; source_file
	je	.L51	;,
	movq	%rax, %rbp	; tmp146, source_file
; src/compiler.c:82:     string source = read_source(source_file, &length);
	leaq	8(%rsp), %rsi	;, tmp119
	movq	%rax, %rdi	; source_file,
	call	read_source	;
	movq	%rax, %r15	; tmp147, source
; src/compiler.c:83:     fclose(source_file);
	movq	%rbp, %rdi	; source_file,
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:84:     Lexer* lexer = create_lexer(source, length);
	movq	8(%rsp), %rsi	; length,
	movq	%r15, %rdi	; source,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp148, lexer
; src/compiler.c:85:     if (o_token) {
	testb	%r14b, %r14b	; o_token
	jne	.L52	;,
.L44:
; src/compiler.c:96:     reset_lexer(lexer);
	movq	%rbp, %rdi	; lexer,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:97:     Parser* parser = create_parser(file);
	movq	%rbx, %rdi	; file,
	call	*create_parser@GOTPCREL(%rip)	;
; src/compiler.c:99:     if (o_ast || o_tac)
	movl	%r12d, %ecx	; o_tac, tmp163
	orb	%r13b, %cl	; o_ast, tmp163
	jne	.L53	;,
.L41:
; src/compiler.c:126: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L51:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; filename,
	leaq	.LC16(%rip), %rdx	;, tmp118
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L41	;
.L52:
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp121
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp149, _3
; src/compiler.c:86:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rdi	; file,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:87:         string out_token_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp150, out_token_name
; src/compiler.c:88:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp122
	movq	%rax, %rdi	; out_token_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp151, out_token_file
; src/compiler.c:89:         if (out_token_file == NULL)
	testq	%rax, %rax	; out_token_file
	je	.L54	;,
; src/compiler.c:92:             output_token(out_token_file, lexer);
	movq	%rbp, %rsi	; lexer,
	movq	%rax, %rdi	; out_token_file,
	call	output_token	;
; src/compiler.c:93:             fclose(out_token_file);
	movq	%r14, %rdi	; out_token_file,
	call	*fclose@GOTPCREL(%rip)	;
	jmp	.L44	;
.L54:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r15, %rcx	; out_token_name,
	leaq	.LC19(%rip), %rdx	;, tmp125
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L44	;
.L53:
; src/compiler.c:100:         ast = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rdx	; parser,
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	movq	%rbp, %rdi	; lexer,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp153, ast
; src/compiler.c:101:     if (o_ast) {
	testb	%r13b, %r13b	; o_ast
	jne	.L55	;,
.L47:
; src/compiler.c:113:     if (o_tac) {
	testb	%r12b, %r12b	; o_tac
	je	.L41	;,
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movl	$4, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp134
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp158, _10
; src/compiler.c:114:         change_file_extension(file, create_string(".tac", 4));
	movq	%rbx, %rdi	; file,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:115:         string out_tac_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp159, out_tac_name
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp135
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp160, _11
; src/compiler.c:116:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rdi	; file,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:117:         FILE* out_tac_file = fopen(out_tac_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp136
	movq	%r12, %rdi	; out_tac_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp161, out_tac_file
; src/compiler.c:118:         if (out_tac_file == NULL)
	testq	%rax, %rax	; out_tac_file
	je	.L56	;,
; src/compiler.c:121:             TAC* tac = tac_code(ast);
	movq	%rbp, %rdi	; ast,
	call	*tac_code@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp162, tac
; src/compiler.c:122:             output_tac(out_tac_file, tac);
	movq	%rbx, %rdi	; out_tac_file,
	call	output_tac	;
; src/compiler.c:123:             fclose(out_tac_file);
	movq	%rbx, %rdi	; out_tac_file,
	call	*fclose@GOTPCREL(%rip)	;
	jmp	.L41	;
.L55:
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp128
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp154, _7
; src/compiler.c:102:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rdi	; file,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:103:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp155, out_ast_name
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movl	$3, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp129
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp156, _8
; src/compiler.c:104:         change_file_extension(file, create_string(".tc", 3));
	movq	%rbx, %rdi	; file,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC18(%rip), %rsi	;, tmp130
	movq	%r14, %rdi	; out_ast_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp157, out_ast_file
; src/compiler.c:106:         if (out_ast_file == NULL)
	testq	%rax, %rax	; out_ast_file
	je	.L57	;,
; src/compiler.c:109:             output_ast(out_ast_file, ast);
	movq	%rbp, %rsi	; ast,
	movq	%rax, %rdi	; out_ast_file,
	call	output_ast	;
; src/compiler.c:110:             fclose(out_ast_file);
	movq	%r13, %rdi	; out_ast_file,
	call	*fclose@GOTPCREL(%rip)	;
	jmp	.L47	;
.L57:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; out_ast_name,
	leaq	.LC19(%rip), %rdx	;, tmp133
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L47	;
.L56:
	movq	%r12, %rcx	; out_tac_name,
	leaq	.LC19(%rip), %rdx	;, tmp139
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L41	;
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

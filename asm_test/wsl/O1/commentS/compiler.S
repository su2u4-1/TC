	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r14	; tmp106, dest
	movq	%rsi, %rbx	; tmp107, dest_length
	movq	%rdx, %rbp	; tmp108, src
	movq	%rcx, %r12	; tmp109, new
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rdx, %rdi	; src,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp110, tmp95
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%r12, %rdi	; new,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	leaq	0(%r13,%rax), %rdx	;, tmp100
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	%rbx, %rdx	; dest_length, tmp100
	jnb	.L6	;,
; src/compiler.c:12:     } else if (src == dest)
	cmpq	%r14, %rbp	; dest, src
	je	.L7	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	subq	$8, %rsp	;,
	pushq	%r12	; new
	movq	%rbp, %r9	; src,
	leaq	.LC2(%rip), %r8	;,
	movq	$-1, %rcx	;,
	movl	$2, %edx	;,
	movq	%rbx, %rsi	; dest_length,
	movq	%r14, %rdi	; dest,
	movl	$0, %eax	;,
	call	*__snprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	addq	$16, %rsp	;,
.L1:
; src/compiler.c:16: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L6:
; src/compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	leaq	-1(%rbx), %r9	;, tmp101
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	pushq	%r12	; new
	pushq	%rbp	; src
	subl	%eax, %r9d	; tmp98,
	leaq	.LC0(%rip), %r8	;,
	movq	$-1, %rcx	;,
	movl	$2, %edx	;,
	movq	%rbx, %rsi	; dest_length,
	movq	%r14, %rdi	; dest,
	movl	$0, %eax	;,
	call	*__snprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	addq	$16, %rsp	;,
	jmp	.L1	;
.L7:
; src/compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	subq	%r13, %rbx	; tmp95, dest_length
	movq	%rbx, %rsi	; dest_length, tmp103
	leaq	(%r14,%r13), %rdi	;, tmp104
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %rcx	; new,
	leaq	.LC1(%rip), %rdx	;, tmp105
	movl	$0, %eax	;,
	call	*snprintf@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	jmp	.L1	;
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
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
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	movl	$2, %edx	;,
	movl	$0, %esi	;,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	%r12, %rdi	; file,
	call	*ftell@GOTPCREL(%rip)	;
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	%rax, 0(%rbp)	; tmp106, *length_19(D)
; src/compiler.c:20:     fseek(file, 0, SEEK_SET);
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%r12, %rdi	; file,
	call	*fseek@GOTPCREL(%rip)	;
; src/compiler.c:22:     string source = create_string("", *length + 1);
	movq	0(%rbp), %rax	; *length_19(D), tmp111
	leaq	1(%rax), %rsi	;, tmp96
	leaq	.LC3(%rip), %rdi	;, tmp98
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp107, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	0(%rbp), %rdx	; *length_19(D), *length_19(D)
	movq	%r12, %rcx	; file,
	movl	$1, %esi	;,
	movq	%rax, %rdi	; <retval>,
	call	*fread@GOTPCREL(%rip)	;
; src/compiler.c:24:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	;, *_6
; src/compiler.c:25:     *length = bytes_read;
	movq	%rax, 0(%rbp)	; _34, *length_19(D)
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	testq	%rax, %rax	; _34
	je	.L8	;,
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	movl	$0, %eax	;, i
	jmp	.L11	;
.L10:
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	;, i
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	cmpq	0(%rbp), %rax	; *length_19(D), i
	jnb	.L8	;,
.L11:
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	; MEM[(char *)source_23 + i_40 * 1], tmp100
	andl	$-5, %edx	;, tmp100
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	;, tmp100
	jne	.L10	;,
; src/compiler.c:29:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	;, MEM[(char *)source_23 + i_40 * 1]
	jmp	.L10	;
.L8:
; src/compiler.c:32: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	read_source, .-read_source
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	.section	.rodata.str1.1
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r12	; tmp140, file
	movq	%rsi, %rdi	; tmp141, lexer
	movq	%rsi, 8(%rsp)	; lexer, %sfp
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movl	$0, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	je	.L15	;,
	movq	%rax, %rbx	; tmp142, current
	leaq	.L18(%rip), %r14	;, tmp136
	jmp	.L33	;
.L25:
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	; current_50->column, current_50->column
	movq	8(%rbx), %rcx	; current_50->line, current_50->line
	addq	$1, %rcx	;, tmp108
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC4(%rip), %rdx	;, tmp110
	movl	$2, %esi	;,
	movq	%r12, %rdi	; file,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L15:
; src/compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp145, _13
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp132
	movl	$2, %esi	;,
	movq	%r12, %rdi	; file,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:71: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L24:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp111
	call	*fwrite@GOTPCREL(%rip)	;
.L16:
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	; current_50->column, current_50->column
	movq	8(%rbx), %rdx	; current_50->line, tmp147
	leaq	1(%rdx), %rcx	;, tmp120
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC12(%rip), %rdx	;,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; file,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:54:         string lexeme_ptr = token->lexeme;
	movq	(%rbx), %rbp	; current_50->lexeme, lexeme_ptr
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movl	$0, %ebx	;, i
; src/compiler.c:60:                 fputs("\\n", file);
	leaq	.LC14(%rip), %r15	;, tmp134
; src/compiler.c:58:                 fputs("\\0", file);
	leaq	.LC13(%rip), %r13	;, tmp135
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	jmp	.L26	;
.L23:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp112
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L16	;
.L22:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp113
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L16	;
.L21:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp114
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L16	;
.L20:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp115
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L16	;
.L19:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L16	;
.L17:
	movq	%r12, %rcx	; file,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L16	;
.L37:
; src/compiler.c:58:                 fputs("\\0", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r13, %rdi	; tmp135,
	call	*fwrite@GOTPCREL(%rip)	;
.L28:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	addq	$1, %rbx	;, i
.L26:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	%rbp, %rdi	; lexeme_ptr,
	call	*strlen@GOTPCREL(%rip)	;
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, %rbx	; tmp143, i
	jnb	.L36	;,
; src/compiler.c:56:             char c = lexeme_ptr[i];
	movzbl	0(%rbp,%rbx), %edi	; MEM[(char *)lexeme_ptr_26 + i_15 * 1], c
; src/compiler.c:57:             if (c == '\0')
	testb	%dil, %dil	; c
	je	.L37	;,
; src/compiler.c:59:             else if (c == '\n')
	cmpb	$10, %dil	;, c
	je	.L38	;,
; src/compiler.c:61:             else if (c == '\t')
	cmpb	$9, %dil	;, c
	je	.L39	;,
; src/compiler.c:63:             else if (c == '\r')
	cmpb	$13, %dil	;, c
	je	.L40	;,
; src/compiler.c:66:                 fputc(c, file);
	movsbl	%dil, %edi	; c, c
	movq	%r12, %rsi	; file,
	call	*fputc@GOTPCREL(%rip)	;
	jmp	.L28	;
.L38:
; src/compiler.c:60:                 fputs("\\n", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	movq	%r15, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L39:
; src/compiler.c:62:                 fputs("\\t", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp125
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L40:
; src/compiler.c:64:                 fputs("\\r", file);
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L36:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; file,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movl	$0, %esi	;,
	movq	8(%rsp), %rdi	; %sfp,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp144, current
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rax, %rax	; current
	je	.L15	;,
.L33:
	cmpl	$7, 24(%rbx)	;, current_50->type
	ja	.L16	;,
	movl	24(%rbx), %eax	; current_50->type, current_50->type
	movslq	(%r14,%rax,4), %rax	;, tmp103
	addq	%r14, %rax	; tmp136, tmp104
	jmp	*%rax	; tmp104
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L25-.L18
	.long	.L24-.L18
	.long	.L23-.L18
	.long	.L22-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.text
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp90, file
	movq	%rsi, %rdi	; tmp91, lexer
	movq	%rdx, %rbp	; tmp92, parser
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp93, ast_root
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	movq	%rbp, %rcx	; parser,
	movl	$0, %edx	;,
	movq	%rbx, %rsi	; file,
	call	*output_code@GOTPCREL(%rip)	;
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	*get_info@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp94, _2
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp89
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; file,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/compiler.c:76: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	output_ast, .-output_ast
	.section	.rodata.str1.1
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
	movl	%esi, %r14d	; tmp120, o_token
	movl	%edx, %r13d	; tmp121, o_ast
; src/compiler.c:78:     File* file = create_file(name);
	call	*create_file@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp122, file
; src/compiler.c:79:     string filename = get_full_path(file);
	movq	%rax, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp123, filename
; src/compiler.c:80:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/compiler.c:81:     FILE* source_file = fopen(filename, "r");
	leaq	.LC19(%rip), %rsi	;, tmp103
	movq	%rax, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
; src/compiler.c:82:     if (source_file == NULL) {
	testq	%rax, %rax	; source_file
	je	.L51	;,
	movq	%rax, %rbx	; tmp124, source_file
; src/compiler.c:86:     string source = read_source(source_file, &length);
	leaq	8(%rsp), %rsi	;, tmp107
	movq	%rax, %rdi	; source_file,
	call	read_source	;
	movq	%rax, %r12	; tmp125, source
; src/compiler.c:87:     fclose(source_file);
	movq	%rbx, %rdi	; source_file,
	call	*fclose@GOTPCREL(%rip)	;
; src/compiler.c:88:     Lexer* lexer = create_lexer(source, length);
	movq	8(%rsp), %rsi	; length,
	movq	%r12, %rdi	; source,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, lexer
; src/compiler.c:89:     if (o_token) {
	testb	%r14b, %r14b	; o_token
	jne	.L52	;,
.L46:
; src/compiler.c:100:     reset_lexer(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*reset_lexer@GOTPCREL(%rip)	;
; src/compiler.c:101:     Parser* parser = create_parser();
	call	*create_parser@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp130, parser
; src/compiler.c:102:     if (o_ast) {
	testb	%r13b, %r13b	; o_ast
	jne	.L53	;,
.L43:
; src/compiler.c:113: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L51:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; filename,
	leaq	.LC20(%rip), %rdx	;, tmp106
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L43	;
.L52:
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp109
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp127, _3
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	%rbp, %rdi	; file,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:91:         string out_token_name = get_full_path(file);
	movq	%rbp, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp128, out_token_name
; src/compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC22(%rip), %rsi	;, tmp110
	movq	%rax, %rdi	; out_token_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp129, out_token_file
; src/compiler.c:93:         if (out_token_file == NULL)
	testq	%rax, %rax	; out_token_file
	je	.L54	;,
; src/compiler.c:96:             output_token(out_token_file, lexer);
	movq	%rbx, %rsi	; lexer,
	movq	%rax, %rdi	; out_token_file,
	call	output_token	;
; src/compiler.c:97:             fclose(out_token_file);
	movq	%r12, %rdi	; out_token_file,
	call	*fclose@GOTPCREL(%rip)	;
	jmp	.L46	;
.L54:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; out_token_name,
	leaq	.LC23(%rip), %rdx	;, tmp113
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L46	;
.L53:
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC24(%rip), %rdi	;, tmp114
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp131, _5
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbp, %rdi	; file,
	call	*change_file_extension@GOTPCREL(%rip)	;
; src/compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	%rbp, %rdi	; file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp132, out_ast_name
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC22(%rip), %rsi	;, tmp115
	movq	%rax, %rdi	; out_ast_name,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp133, out_ast_file
; src/compiler.c:106:         if (out_ast_file == NULL)
	testq	%rax, %rax	; out_ast_file
	je	.L55	;,
; src/compiler.c:109:             output_ast(out_ast_file, lexer, parser);
	movq	%r12, %rdx	; parser,
	movq	%rbx, %rsi	; lexer,
	movq	%rax, %rdi	; out_ast_file,
	call	output_ast	;
; src/compiler.c:110:             fclose(out_ast_file);
	movq	%rbp, %rdi	; out_ast_file,
	call	*fclose@GOTPCREL(%rip)	;
	jmp	.L43	;
.L55:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; out_ast_name,
	leaq	.LC23(%rip), %rdx	;, tmp118
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L43	;
	.size	parse_file, .-parse_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

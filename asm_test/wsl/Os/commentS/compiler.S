	.file	"compiler.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
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
.LFB50:
	.cfi_startproc
	endbr64	
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12	; tmp106, dest
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rdx, %rdi	; src,
; src/compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp	; tmp109, new
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx	; tmp108, src
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 64
; src/compiler.c:7: void string_append(string dest, const size_t dest_length, const string src, const string new) {
	movq	%rsi, 8(%rsp)	; dest_length, %sfp
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	strlen@PLT	;
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rbp, %rdi	; new,
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	movq	%rax, %r13	; tmp110, tmp95
; src/compiler.c:8:     size_t src_length = strlen(src), new_length = strlen(new);
	call	strlen@PLT	;
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	movq	8(%rsp), %rsi	; %sfp, dest_length
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	leaq	0(%r13,%rax), %rdx	;, tmp100
; src/compiler.c:9:     if (dest_length <= src_length + new_length) {
	cmpq	%rsi, %rdx	; dest_length, tmp100
	jb	.L2	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	pushq	%rbp	; new
	.cfi_remember_state
	.cfi_def_cfa_offset 72
; src/compiler.c:10:         size_t max_src_length = dest_length - new_length - 1;
	leaq	-1(%rsi), %r9	;, tmp101
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC0(%rip), %r8	;,
	orq	$-1, %rcx	;,
	pushq	%rbx	; src
	.cfi_def_cfa_offset 80
	subl	%eax, %r9d	; tmp98,
	movl	$2, %edx	;,
	movq	%r12, %rdi	; dest,
	xorl	%eax, %eax	;
	call	__snprintf_chk@PLT	;
	jmp	.L6	;
.L2:
	.cfi_restore_state
; src/compiler.c:12:     } else if (src == dest)
	cmpq	%r12, %rbx	; dest, src
	jne	.L4	;,
; src/compiler.c:16: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
; src/compiler.c:13:         snprintf(dest + src_length, dest_length - src_length, "%s", new);
	leaq	(%rbx,%r13), %rdi	;, tmp104
	subq	%r13, %rsi	; tmp95, tmp103
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	movq	%rbp, %rcx	; new,
; src/compiler.c:16: }
	popq	%rbx	;
	.cfi_def_cfa_offset 32
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC1(%rip), %rdx	;, tmp105
; src/compiler.c:16: }
	popq	%rbp	;
	.cfi_def_cfa_offset 24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	xorl	%eax, %eax	;
; src/compiler.c:16: }
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	jmp	snprintf@PLT	;
.L4:
	.cfi_restore_state
	pushq	%rcx	;
	.cfi_def_cfa_offset 72
	movq	%rbx, %r9	; src,
	leaq	.LC2(%rip), %r8	;,
	orq	$-1, %rcx	;,
	pushq	%rbp	; new
	.cfi_def_cfa_offset 80
	movl	$2, %edx	;,
	movq	%r12, %rdi	; dest,
	xorl	%eax, %eax	;
	call	__snprintf_chk@PLT	;
.L6:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:54:   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
	popq	%rax	;
	.cfi_def_cfa_offset 72
	popq	%rdx	;
	.cfi_def_cfa_offset 64
; src/compiler.c:16: }
	addq	$24, %rsp	;,
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE50:
	.size	string_append, .-string_append
	.section	.rodata.str1.1
.LC3:
	.string	""
	.text
	.globl	read_source
	.type	read_source, @function
read_source:
.LFB51:
	.cfi_startproc
	endbr64	
	pushq	%r12	;
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	movl	$2, %edx	;,
; src/compiler.c:17: string read_source(FILE* file, size_t* length) {
	movq	%rdi, %r12	; tmp103, file
	pushq	%rbp	;
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp	; tmp104, length
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	xorl	%esi, %esi	;
; src/compiler.c:17: string read_source(FILE* file, size_t* length) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
; src/compiler.c:18:     fseek(file, 0, SEEK_END);
	call	fseek@PLT	;
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	%r12, %rdi	; file,
	call	ftell@PLT	;
; src/compiler.c:20:     fseek(file, 0, SEEK_SET);
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movq	%r12, %rdi	; file,
; src/compiler.c:19:     *length = (size_t)ftell(file);
	movq	%rax, 0(%rbp)	; tmp105, *length_19(D)
; src/compiler.c:20:     fseek(file, 0, SEEK_SET);
	call	fseek@PLT	;
; src/compiler.c:22:     string source = create_string("", *length + 1);
	movq	0(%rbp), %rax	; *length_19(D), tmp110
	leaq	.LC3(%rip), %rdi	;, tmp98
	leaq	1(%rax), %rsi	;, tmp96
	call	create_string@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	movq	0(%rbp), %rdx	; *length_19(D),
	movq	%r12, %rcx	; file,
	movl	$1, %esi	;,
	movq	%rax, %rdi	; <retval>,
; src/compiler.c:22:     string source = create_string("", *length + 1);
	movq	%rax, %rbx	; tmp106, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:212:     return __fread_alias (__ptr, __size, __n, __stream);
	call	fread@PLT	;
; src/compiler.c:24:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	;, *_6
; src/compiler.c:25:     *length = bytes_read;
	movq	%rax, 0(%rbp)	; _34, *length_19(D)
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	; i
.L9:
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	cmpq	0(%rbp), %rax	; *length_19(D), i
	jnb	.L13	;,
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	movb	(%rbx,%rax), %dl	; MEM[(char *)source_23 + i_12 * 1], tmp99
	andl	$-5, %edx	;, tmp99
; src/compiler.c:28:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	;, tmp99
	jne	.L10	;,
; src/compiler.c:29:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	;, MEM[(char *)source_23 + i_12 * 1]
.L10:
; src/compiler.c:27:     for (size_t i = 0; i < *length; ++i) {
	incq	%rax	; i
	jmp	.L9	;
.L13:
; src/compiler.c:32: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	.cfi_def_cfa_offset 24
	popq	%rbp	;
	.cfi_def_cfa_offset 16
	popq	%r12	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE51:
	.size	read_source, .-read_source
	.section	.rodata.str1.1
.LC4:
	.string	"Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC5:
	.string	"Token(Type: identifier,  Line: "
.LC6:
	.string	"Token(Type: integer,     Line: "
.LC7:
	.string	"Token(Type: float,       Line: "
.LC8:
	.string	"Token(Type: string,      Line: "
.LC9:
	.string	"Token(Type: symbol,      Line: "
.LC10:
	.string	"Token(Type: keyword,     Line: "
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
.LFB52:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.L18(%rip), %r13	;, tmp134
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	; tmp136, lexer
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%esi, %esi	;
; src/compiler.c:33: void output_token(FILE* file, Lexer* lexer) {
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	; tmp135, file
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	movq	%r12, %rdi	; lexer,
; src/compiler.c:33: void output_token(FILE* file, Lexer* lexer) {
	pushq	%r9	;
	.cfi_def_cfa_offset 64
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp137, current
.L15:
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	testq	%rbp, %rbp	; current
	je	.L26	;,
	cmpl	$7, 24(%rbp)	;, current_15->type
	ja	.L16	;,
	movl	24(%rbp), %eax	; current_15->type, current_15->type
	movslq	0(%r13,%rax,4), %rax	;, tmp103
	addq	%r13, %rax	; tmp134, tmp104
	notrack jmp	*%rax	; tmp104
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
.L25:
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	; current_15->column, current_15->column
	movq	8(%rbp), %rcx	; current_15->line, current_15->line
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; file,
	leaq	.LC4(%rip), %rdx	;, tmp110
	leaq	1(%rax), %r8	;,
; src/compiler.c:37:             fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	incq	%rcx	; tmp108
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
	jmp	.L26	;
.L24:
	movq	%rbx, %rsi	; file,
	leaq	.LC5(%rip), %rdi	;, tmp111
	jmp	.L36	;
.L23:
	movq	%rbx, %rsi	; file,
	leaq	.LC6(%rip), %rdi	;, tmp112
	jmp	.L36	;
.L22:
	movq	%rbx, %rsi	; file,
	leaq	.LC7(%rip), %rdi	;, tmp113
	jmp	.L36	;
.L21:
	movq	%rbx, %rsi	; file,
	leaq	.LC8(%rip), %rdi	;, tmp114
	jmp	.L36	;
.L20:
	movq	%rbx, %rsi	; file,
	leaq	.LC9(%rip), %rdi	;, tmp115
	jmp	.L36	;
.L19:
	movq	%rbx, %rsi	; file,
	leaq	.LC10(%rip), %rdi	;, tmp116
	jmp	.L36	;
.L17:
	movq	%rbx, %rsi	; file,
	leaq	.LC11(%rip), %rdi	;, tmp117
.L36:
	call	fputs@PLT	;
.L16:
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	; current_15->column, current_15->column
	movq	8(%rbp), %rdx	; current_15->line, tmp142
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; file,
; src/compiler.c:64:                 fputs("\\r", file);
	leaq	.LC16(%rip), %r15	;, tmp133
; src/compiler.c:53:         fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rdx), %rcx	;, tmp120
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	xorl	%eax, %eax	;
	leaq	.LC12(%rip), %rdx	;, tmp122
	call	__fprintf_chk@PLT	;
; src/compiler.c:54:         string lexeme_ptr = token->lexeme;
	movq	0(%rbp), %r14	; current_15->lexeme, lexeme_ptr
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	xorl	%ebp, %ebp	; i
.L27:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	movq	%r14, %rdi	; lexeme_ptr,
	call	strlen@PLT	;
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	cmpq	%rax, %rbp	; tmp138, i
	jnb	.L38	;,
; src/compiler.c:56:             char c = lexeme_ptr[i];
	movsbl	(%r14,%rbp), %edi	; MEM[(char *)lexeme_ptr_27 + i_16 * 1],
; src/compiler.c:58:                 fputs("\\0", file);
	movq	%rbx, %rsi	; file,
; src/compiler.c:57:             if (c == '\0')
	testb	%dil, %dil	; c
	jne	.L28	;,
; src/compiler.c:58:                 fputs("\\0", file);
	leaq	.LC13(%rip), %rdi	;, tmp123
	jmp	.L37	;
.L28:
; src/compiler.c:59:             else if (c == '\n')
	cmpb	$10, %dil	;, c
	jne	.L30	;,
; src/compiler.c:60:                 fputs("\\n", file);
	leaq	.LC14(%rip), %rdi	;, tmp124
.L37:
	call	fputs@PLT	;
	jmp	.L29	;
.L30:
; src/compiler.c:61:             else if (c == '\t')
	cmpb	$9, %dil	;, c
	jne	.L31	;,
; src/compiler.c:62:                 fputs("\\t", file);
	leaq	.LC15(%rip), %rdi	;, tmp125
	jmp	.L37	;
.L31:
; src/compiler.c:63:             else if (c == '\r')
	cmpb	$13, %dil	;, c
	jne	.L32	;,
; src/compiler.c:64:                 fputs("\\r", file);
	movq	%r15, %rdi	; tmp133,
	jmp	.L37	;
.L32:
; src/compiler.c:66:                 fputc(c, file);
	call	fputc@PLT	;
.L29:
; src/compiler.c:55:         for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
	incq	%rbp	; i
	jmp	.L27	;
.L38:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rsi	; file,
	leaq	.LC17(%rip), %rdi	;, tmp131
	call	fputs@PLT	;
; src/compiler.c:34:     for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
	xorl	%esi, %esi	;
	movq	%r12, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp139, current
	jmp	.L15	;
.L26:
; src/compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info@PLT	;
; src/compiler.c:71: }
	popq	%r8	;
	.cfi_def_cfa_offset 56
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; file,
	movl	$2, %esi	;,
; src/compiler.c:71: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
; src/compiler.c:70:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp140, _14
; src/compiler.c:71: }
	popq	%rbp	;
	.cfi_def_cfa_offset 40
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/compiler.c:71: }
	popq	%r12	;
	.cfi_def_cfa_offset 32
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp132
; src/compiler.c:71: }
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
	.cfi_endproc
.LFE52:
	.size	output_token, .-output_token
	.globl	output_ast
	.type	output_ast, @function
output_ast:
.LFB53:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdx, %rbp	; tmp92, parser
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx	; tmp90, file
	movq	%rsi, %rdi	; tmp91, lexer
	pushq	%rax	;
	.cfi_def_cfa_offset 32
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rsi	; builtin_scope,
	call	parse_code@PLT	;
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	movq	%rbp, %rcx	; parser,
	movq	%rbx, %rsi	; file,
	xorl	%edx, %edx	;
; src/compiler.c:73:     Code* ast_root = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rdi	; tmp93, ast_root
; src/compiler.c:74:     output_code(ast_root, file, 0, parser);
	call	output_code@PLT	;
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info@PLT	;
; src/compiler.c:76: }
	popq	%r8	;
	.cfi_def_cfa_offset 24
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rdi	; file,
	movl	$2, %esi	;,
; src/compiler.c:75:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %rcx	; tmp94, _2
; src/compiler.c:76: }
	popq	%rbx	;
	.cfi_def_cfa_offset 16
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp89
	xorl	%eax, %eax	;
; src/compiler.c:76: }
	popq	%rbp	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
	.cfi_endproc
.LFE53:
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
.LFB54:
	.cfi_startproc
	endbr64	
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d	; tmp126, o_ast
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%esi, %r12d	; tmp125, o_token
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp	;,
	.cfi_def_cfa_offset 64
; src/compiler.c:77: void parse_file(const string name, bool o_token, bool o_ast) {
	movq	%fs:40, %rax	; MEM[(<address-space-1> long unsigned int *)40B], tmp139
	movq	%rax, 8(%rsp)	; tmp139, D.5830
	xorl	%eax, %eax	; tmp139
; src/compiler.c:78:     File* file = create_file(name);
	call	create_file@PLT	;
; src/compiler.c:79:     string filename = get_full_path(file);
	movq	%rax, %rdi	; file,
; src/compiler.c:78:     File* file = create_file(name);
	movq	%rax, %rbx	; tmp127, file
; src/compiler.c:79:     string filename = get_full_path(file);
	call	get_full_path@PLT	;
; src/compiler.c:80:     size_t length = 0;
	xorl	%r11d, %r11d	;
; src/compiler.c:81:     FILE* source_file = fopen(filename, "r");
	leaq	.LC19(%rip), %rsi	;, tmp104
	movq	%rax, %rdi	; filename,
; src/compiler.c:80:     size_t length = 0;
	movq	%r11, (%rsp)	;, length
; src/compiler.c:79:     string filename = get_full_path(file);
	movq	%rax, %r14	; tmp128, filename
; src/compiler.c:81:     FILE* source_file = fopen(filename, "r");
	call	fopen@PLT	;
; src/compiler.c:82:     if (source_file == NULL) {
	testq	%rax, %rax	; tmp105
	jne	.L42	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rax	; D.5830, tmp140
	subq	%fs:40, %rax	; MEM[(<address-space-1> long unsigned int *)40B], tmp140
	movq	%r14, %rcx	; filename,
	leaq	.LC20(%rip), %rdx	;, tmp108
	je	.L52	;,
	jmp	.L53	;
.L42:
	movq	%rax, %rbp	; tmp129, tmp105
; src/compiler.c:86:     string source = read_source(source_file, &length);
	movq	%rsp, %rsi	;, tmp109
	movq	%rax, %rdi	; tmp105,
	call	read_source	;
; src/compiler.c:87:     fclose(source_file);
	movq	%rbp, %rdi	; tmp105,
; src/compiler.c:86:     string source = read_source(source_file, &length);
	movq	%rax, %r14	; tmp130, source
; src/compiler.c:87:     fclose(source_file);
	call	fclose@PLT	;
; src/compiler.c:88:     Lexer* lexer = create_lexer(source, length);
	movq	(%rsp), %rsi	; length,
	movq	%r14, %rdi	; source,
	call	create_lexer@PLT	;
	movq	%rax, %rbp	; tmp131, lexer
; src/compiler.c:89:     if (o_token) {
	testb	%r12b, %r12b	; o_token
	je	.L44	;,
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movl	$6, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp111
	call	create_string@PLT	;
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	%rbx, %rdi	; file,
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	movq	%rax, %rsi	; tmp132, _3
; src/compiler.c:90:         change_file_extension(file, create_string(".token", 6));
	call	change_file_extension@PLT	;
; src/compiler.c:91:         string out_token_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	get_full_path@PLT	;
; src/compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC22(%rip), %rsi	;, tmp112
	movq	%rax, %rdi	; out_token_name,
; src/compiler.c:91:         string out_token_name = get_full_path(file);
	movq	%rax, %r14	; tmp133, out_token_name
; src/compiler.c:92:         FILE* out_token_file = fopen(out_token_name, "w");
	call	fopen@PLT	;
	movq	%rax, %r12	; tmp134, tmp113
; src/compiler.c:93:         if (out_token_file == NULL)
	testq	%rax, %rax	; tmp113
	jne	.L45	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r14, %rcx	; out_token_name,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC23(%rip), %rdx	;, tmp115
	call	__fprintf_chk@PLT	;
	jmp	.L44	;
.L45:
; src/compiler.c:96:             output_token(out_token_file, lexer);
	movq	%rax, %rdi	; tmp113,
	movq	%rbp, %rsi	; lexer,
	call	output_token	;
; src/compiler.c:97:             fclose(out_token_file);
	movq	%r12, %rdi	; tmp113,
	call	fclose@PLT	;
.L44:
; src/compiler.c:100:     reset_lexer(lexer);
	movq	%rbp, %rdi	; lexer,
	call	reset_lexer@PLT	;
; src/compiler.c:101:     Parser* parser = create_parser();
	call	create_parser@PLT	;
	movq	%rax, %r14	; tmp135, parser
; src/compiler.c:102:     if (o_ast) {
	testb	%r13b, %r13b	; o_ast
	je	.L41	;,
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movl	$4, %esi	;,
	leaq	.LC24(%rip), %rdi	;, tmp116
	call	create_string@PLT	;
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	%rbx, %rdi	; file,
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	movq	%rax, %rsi	; tmp136, _5
; src/compiler.c:103:         change_file_extension(file, create_string(".ast", 4));
	call	change_file_extension@PLT	;
; src/compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	%rbx, %rdi	; file,
	call	get_full_path@PLT	;
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC22(%rip), %rsi	;, tmp117
	movq	%rax, %rdi	; out_ast_name,
; src/compiler.c:104:         string out_ast_name = get_full_path(file);
	movq	%rax, %r12	; tmp137, out_ast_name
; src/compiler.c:105:         FILE* out_ast_file = fopen(out_ast_name, "w");
	call	fopen@PLT	;
	movq	%rax, %rbx	; tmp138, tmp118
; src/compiler.c:106:         if (out_ast_file == NULL)
	testq	%rax, %rax	; tmp118
	jne	.L47	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rsp), %rax	; D.5830, tmp141
	subq	%fs:40, %rax	; MEM[(<address-space-1> long unsigned int *)40B], tmp141
	movq	%r12, %rcx	; out_ast_name,
	leaq	.LC23(%rip), %rdx	;, tmp121
	jne	.L53	;,
.L52:
	movq	stderr(%rip), %rdi	; stderr,
; src/compiler.c:113: }
	addq	$16, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/compiler.c:113: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	__fprintf_chk@PLT	;
.L47:
	.cfi_restore_state
; src/compiler.c:109:             output_ast(out_ast_file, lexer, parser);
	movq	%rax, %rdi	; tmp118,
	movq	%r14, %rdx	; parser,
	movq	%rbp, %rsi	; lexer,
	call	output_ast	;
; src/compiler.c:110:             fclose(out_ast_file);
	movq	8(%rsp), %rax	; D.5830, tmp142
	subq	%fs:40, %rax	; MEM[(<address-space-1> long unsigned int *)40B], tmp142
	jne	.L53	;,
; src/compiler.c:113: }
	addq	$16, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
; src/compiler.c:110:             fclose(out_ast_file);
	movq	%rbx, %rdi	; tmp118,
; src/compiler.c:113: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; src/compiler.c:110:             fclose(out_ast_file);
	jmp	fclose@PLT	;
.L41:
	.cfi_restore_state
; src/compiler.c:113: }
	movq	8(%rsp), %rax	; D.5830, tmp143
	subq	%fs:40, %rax	; MEM[(<address-space-1> long unsigned int *)40B], tmp143
	je	.L50	;,
.L53:
	call	__stack_chk_fail@PLT	;
.L50:
	addq	$16, %rsp	;,
	.cfi_def_cfa_offset 48
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE54:
	.size	parse_file, .-parse_file
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

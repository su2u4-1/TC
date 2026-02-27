	.file	"helper.c"
	.text
	.p2align 4
	.globl	create_list
	.type	create_list, @function
create_list:
	subq	$8, %rsp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	addq	$8, %rsp
	ret
	.size	create_list, .-create_list
	.p2align 4
	.globl	create_node
	.type	create_node, @function
create_node:
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rbx
	ret
	.size	create_node, .-create_node
	.p2align 4
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rbp, 8(%rax)
	je	.L10
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	list_append, .-list_append
	.p2align 4
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm1
	movups	%xmm1, (%rax)
	popq	%rbx
	ret
	.size	list_copy, .-list_copy
	.p2align 4
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L13
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	je	.L19
.L15:
	movq	8(%rax), %rax
.L13:
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	movq	$0, 8(%rdi)
	jmp	.L15
	.size	list_pop, .-list_pop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"type\n"
.LC1:
	.string	"variable\n"
.LC2:
	.string	"function\n"
.LC3:
	.string	"method\n"
.LC4:
	.string	"class\n"
.LC5:
	.string	"attribute\n"
.LC6:
	.string	"unknown\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
	.align 8
.LC8:
	.string	"Error creating name: unknown NameType %u\n"
	.align 8
.LC9:
	.string	"Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
	.text
	.p2align 4
	.globl	create_name
	.type	create_name, @function
create_name:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movl	%esi, %r12d
	pushq	%rbp
	movq	%r8, %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$24, %rsp
	movq	%rdx, (%rsp)
	movq	%rcx, 8(%rsp)
	testq	%r8, %r8
	je	.L22
	movq	%r8, %r13
.L21:
	movq	8(%r13), %rax
	movq	(%rax), %r14
	testq	%r14, %r14
	jne	.L23
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L64:
	movq	(%r14), %r14
	testq	%r14, %r14
	je	.L26
.L23:
	movq	8(%r14), %r15
	movq	%rbx, %rsi
	movq	(%r15), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L64
	xorl	%eax, %eax
	movq	%rbx, %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC9(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpl	$5, 24(%r15)
	ja	.L33
	movl	24(%r15), %eax
	leaq	.L44(%rip), %rdx
	movq	stderr(%rip), %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L44:
	.long	.L27-.L44
	.long	.L28-.L44
	.long	.L29-.L44
	.long	.L30-.L44
	.long	.L31-.L44
	.long	.L32-.L44
	.text
.L27:
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L22:
	movl	$32, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rbx, (%rax)
	movq	%rax, %r13
	movq	id_counter.0(%rip), %rax
	movl	%r12d, 24(%r13)
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%r13)
	movl	%r12d, %eax
	andl	$-5, %eax
	cmpl	$1, %eax
	je	.L34
	leal	-2(%r12), %eax
	cmpl	$1, %eax
	jbe	.L34
	cmpl	$4, %r12d
	jne	.L38
	movq	8(%rsp), %rax
	testq	%rax, %rax
	je	.L38
.L63:
	movq	%rax, 16(%r13)
.L37:
	movq	8(%rbp), %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%r13, 8(%rax)
	je	.L65
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L20:
	addq	$24, %rsp
	movq	%r13, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	movq	(%rsp), %rax
	testq	%rax, %rax
	jne	.L63
.L36:
	movq	(%rsp), %rax
	orq	8(%rsp), %rax
	movl	%r12d, %ecx
	movq	stderr(%rip), %rdi
	jne	.L39
	leaq	.LC7(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
.L40:
	xorl	%r13d, %r13d
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L26:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L21
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L65:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L20
.L28:
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L22
.L29:
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L22
.L30:
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L22
.L32:
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L22
.L31:
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L22
.L33:
	movq	stderr(%rip), %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L22
.L38:
	testl	%r12d, %r12d
	jne	.L36
	movq	$0, 16(%r13)
	jmp	.L37
.L39:
	leaq	.LC8(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L40
	.size	create_name, .-create_name
	.p2align 4
	.globl	create_scope
	.type	create_scope, @function
create_scope:
	pushq	%rbp
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	subq	$8, %rsp
	call	*alloc_memory@GOTPCREL(%rip)
	movl	$16, %edi
	movq	%rax, %rbx
	movq	%rbp, (%rax)
	call	*alloc_memory@GOTPCREL(%rip)
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	ret
	.size	create_scope, .-create_scope
	.p2align 4
	.globl	search
	.type	search, @function
search:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	testq	%rdi, %rdi
	je	.L69
	movq	%rdi, %r13
	movq	%rsi, %r12
.L73:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L72
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L83:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L70
.L72:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L83
	addq	$8, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L73
.L69:
	addq	$8, %rsp
	xorl	%ebp, %ebp
	popq	%rbx
	movq	%rbp, %rax
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.size	search, .-search
	.p2align 4
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx
	movq	INT_KEYWORD(%rip), %rsi
	movq	%rdi, %rbx
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L85
.L87:
	movl	$1, %eax
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L87
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L87
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L87
	movq	%rbx, %rdi
	movq	VOID_KEYWORD(%rip), %rsi
	call	*string_equal@GOTPCREL(%rip)
	popq	%rbx
	testb	%al, %al
	setne	%al
	ret
	.size	is_builtin_type, .-is_builtin_type
	.p2align 4
	.globl	is_type
	.type	is_type, @function
is_type:
	testl	$-5, 24(%rdi)
	sete	%al
	ret
	.size	is_type, .-is_type
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
	.p2align 4
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	movq	%rdi, %r9
	leaq	.LC10(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.size	parser_error, .-parser_error
	.section	.rodata.str1.1
.LC11:
	.string	"\342\224\202   "
.LC12:
	.string	"    "
.LC13:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC14:
	.string	"\342\224\234\342\224\200\342\224\200 "
	.text
	.p2align 4
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15
	movq	%rsi, %rax
	pushq	%r14
	shrq	$3, %rax
	pushq	%r13
	pushq	%r12
	movq	%rdi, %r12
	movl	%edx, %edi
	pushq	%rbp
	leaq	3(%rcx), %rbp
	pushq	%rbx
	movq	%rsi, %rbx
	movl	%ebx, %ecx
	andl	$7, %ecx
	subq	$24, %rsp
	movl	%edx, 12(%rsp)
	movq	%rax, %rdx
	movl	$1, %eax
	addq	%rbp, %rdx
	sall	%cl, %eax
	movzbl	(%rdx), %esi
	testb	%dil, %dil
	jne	.L92
	orl	%eax, %esi
	movb	%sil, (%rdx)
	cmpq	$1, %rbx
	jbe	.L104
.L93:
	movl	$1, %r15d
	leaq	.LC12(%rip), %r14
	leaq	.LC11(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L99:
	movq	%r15, %rax
	movl	%r15d, %ecx
	movq	%r13, %rdx
	movl	$2, %esi
	shrq	$3, %rax
	andl	$7, %ecx
	movq	%r12, %rdi
	movsbl	0(%rbp,%rax), %eax
	sarl	%cl, %eax
	testb	$1, %al
	cmove	%r14, %rdx
	addq	$1, %r15
	xorl	%eax, %eax
	call	*__fprintf_chk@GOTPCREL(%rip)
	cmpq	%r15, %rbx
	jne	.L99
	cmpb	$0, 12(%rsp)
	je	.L94
.L96:
	leaq	.LC13(%rip), %rdx
.L100:
	addq	$24, %rsp
	movq	%r12, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	*__fprintf_chk@GOTPCREL(%rip)
	.p2align 4,,10
	.p2align 3
.L92:
	notl	%eax
	andl	%esi, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rbx
	ja	.L93
	testq	%rbx, %rbx
	jne	.L96
.L91:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L104:
	testq	%rbx, %rbx
	je	.L91
	.p2align 4,,10
	.p2align 3
.L94:
	leaq	.LC14(%rip), %rdx
	jmp	.L100
	.size	indention, .-indention
	.p2align 4
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	subq	$8, %rsp
	movl	$35, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	xorl	%edx, %edx
	movw	%dx, (%rax)
	movb	$0, 2(%rax)
	addq	$8, %rsp
	ret
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
	.section	.rodata.str1.1
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Error opening library file for import: %s\n"
	.align 8
.LC22:
	.string	"Info: Starting parsing lib file for import: %s\n"
	.align 8
.LC23:
	.string	"Info: Finished parsing lib file for import: %s\n"
	.align 8
.LC24:
	.string	"Error parsing library file for import: %s\n"
	.text
	.p2align 4
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%rdx, %r13
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	pushq	%rbx
	subq	$1048, %rsp
	movb	$0, 16(%rsp)
	testq	%rsi, %rsi
	je	.L128
	leaq	16(%rsp), %rbx
	movq	%rsi, %rcx
	movl	$1024, %esi
	movq	%rbx, %rdx
	movq	%rbx, %rdi
	call	*string_append@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC18(%rip), %rcx
	call	*string_append@GOTPCREL(%rip)
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	*string_append@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC19(%rip), %rcx
	call	*string_append@GOTPCREL(%rip)
.L110:
	leaq	.LC20(%rip), %rsi
	movq	%rbx, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L129
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	leaq	8(%rsp), %rsi
	movq	%rbp, %rdi
	movq	$0, 8(%rsp)
	call	*read_source@GOTPCREL(%rip)
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	*fclose@GOTPCREL(%rip)
	movl	$35, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%r14, %rdi
	movq	%rax, %rbp
	xorl	%eax, %eax
	movw	%ax, 0(%rbp)
	movb	$0, 2(%rbp)
	movq	builtin_scope(%rip), %r15
	movq	8(%rsp), %rsi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rbx, %rdx
	movl	$2, %edi
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	*__printf_chk@GOTPCREL(%rip)
	testq	%rbp, %rbp
	je	.L130
	movq	8(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L118
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L131:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L112
.L118:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	0(%rbp), %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L131
	movq	8(%r13), %rbx
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rbp, 8(%rax)
	je	.L132
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L107:
	addq	$1048, %rsp
	movq	%rbp, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L128:
	leaq	.LC15(%rip), %rsi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	je	.L133
	leaq	.LC16(%rip), %rsi
	movq	%r12, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L111
	movabsq	$8241920901561659182, %rax
	leaq	16(%rsp), %rbx
	movq	%rax, 16(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 21(%rsp)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L133:
	movabsq	$8246143026212319022, %rax
	leaq	16(%rsp), %rbx
	movq	%rax, 16(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 23(%rsp)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L132:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L107
.L111:
	movq	stderr(%rip), %rdi
	leaq	16(%rsp), %rcx
	leaq	.LC17(%rip), %rdx
	xorl	%eax, %eax
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
.L112:
	xorl	%ebp, %ebp
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L130:
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L107
.L129:
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	call	*__fprintf_chk@GOTPCREL(%rip)
	jmp	.L107
	.size	parse_import_file, .-parse_import_file
	.p2align 4
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbx
	movq	ASSIGN_SYMBOL(%rip), %rsi
	movq	%rdi, %rbx
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L134
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L134
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L134
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L134
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L134
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L134
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L134
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L134
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L134
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L134
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L134
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L134
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L134
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L134
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L134
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L134
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L152
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L153
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	*string_equal@GOTPCREL(%rip)
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L134:
	popq	%rbx
	ret
.L152:
	movl	$2, %eax
	popq	%rbx
	ret
.L153:
	movl	$3, %eax
	popq	%rbx
	ret
	.size	string_to_operator, .-string_to_operator
	.p2align 4
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L156
	movl	%edi, %edi
	leaq	CSWTCH.66(%rip), %rax
	movl	(%rax,%rdi,4), %eax
.L156:
	ret
	.size	operator_precedence, .-operator_precedence
	.section	.text.unlikely,"ax",@progbits
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	cmpl	$18, %edi
	ja	.L181
	leaq	.L162(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L162:
	.long	.L180-.L162
	.long	.L179-.L162
	.long	.L178-.L162
	.long	.L177-.L162
	.long	.L176-.L162
	.long	.L175-.L162
	.long	.L174-.L162
	.long	.L173-.L162
	.long	.L172-.L162
	.long	.L171-.L162
	.long	.L170-.L162
	.long	.L169-.L162
	.long	.L168-.L162
	.long	.L167-.L162
	.long	.L166-.L162
	.long	.L165-.L162
	.long	.L164-.L162
	.long	.L163-.L162
	.long	.L161-.L162
	.text
	.p2align 4,,10
	.p2align 3
.L163:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L164:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L167:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	movq	OR_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L169:
	movq	AND_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L170:
	movq	GE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	movq	LE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L172:
	movq	GT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L173:
	movq	LT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	movq	NE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L175:
	movq	EQ_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L176:
	movq	MOD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L177:
	movq	DIV_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L178:
	movq	MUL_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L179:
	movq	SUB_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L180:
	movq	ADD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L161:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.section	.text.unlikely
	.type	operator_to_string.cold, @function
operator_to_string.cold:
.L181:
	xorl	%eax, %eax
	ret
	.text
	.size	operator_to_string, .-operator_to_string
	.section	.text.unlikely
	.size	operator_to_string.cold, .-operator_to_string.cold
.LCOLDE25:
	.text
.LHOTE25:
	.section	.rodata
	.align 32
	.type	CSWTCH.66, @object
	.size	CSWTCH.66, 76
CSWTCH.66:
	.long	4
	.long	4
	.long	5
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	2
	.long	2
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

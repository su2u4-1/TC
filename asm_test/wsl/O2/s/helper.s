	.file	"helper.c"
	.text
	.p2align 4
	.globl	create_list
	.type	create_list, @function
create_list:
.LFB65:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$16, %edi
	call	alloc_memory@PLT
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	create_list, .-create_list
	.p2align 4
	.globl	create_node
	.type	create_node, @function
create_node:
.LFB66:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	create_node, .-create_node
	.p2align 4
	.globl	list_append
	.type	list_append, @function
list_append:
.LFB67:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rbp, 8(%rax)
	je	.L10
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE67:
	.size	list_append, .-list_append
	.p2align 4
	.globl	list_copy
	.type	list_copy, @function
list_copy:
.LFB68:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$16, %edi
	call	alloc_memory@PLT
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm1
	movups	%xmm1, (%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	list_copy, .-list_copy
	.p2align 4
	.globl	list_pop
	.type	list_pop, @function
list_pop:
.LFB69:
	.cfi_startproc
	endbr64
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
	.cfi_endproc
.LFE69:
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
.LFB70:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
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
	call	string_equal@PLT
	testb	%al, %al
	je	.L64
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rcx
	leaq	.LC9(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	cmpl	$5, 24(%r15)
	ja	.L33
	movl	24(%r15), %eax
	leaq	.L44(%rip), %rdx
	movq	stderr(%rip), %rcx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
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
	call	fwrite@PLT
	.p2align 4,,10
	.p2align 3
.L22:
	movl	$32, %edi
	call	alloc_memory@PLT
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
	call	alloc_memory@PLT
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%r13, 8(%rax)
	je	.L65
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L20:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
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
	call	__fprintf_chk@PLT
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
	call	fwrite@PLT
	jmp	.L22
.L29:
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	fwrite@PLT
	jmp	.L22
.L30:
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	jmp	.L22
.L32:
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
	jmp	.L22
.L31:
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	fwrite@PLT
	jmp	.L22
.L33:
	movq	stderr(%rip), %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
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
	call	__fprintf_chk@PLT
	jmp	.L40
	.cfi_endproc
.LFE70:
	.size	create_name, .-create_name
	.p2align 4
	.globl	create_scope
	.type	create_scope, @function
create_scope:
.LFB71:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movl	$16, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
	movl	$16, %edi
	movq	%rbp, (%rax)
	movq	%rax, %rbx
	call	alloc_memory@PLT
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE71:
	.size	create_scope, .-create_scope
	.p2align 4
	.globl	search
	.type	search, @function
search:
.LFB72:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
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
	call	string_equal@PLT
	testb	%al, %al
	je	.L83
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	.cfi_restore_state
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L73
.L69:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%ebp, %ebp
	popq	%rbx
	.cfi_def_cfa_offset 32
	movq	%rbp, %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE72:
	.size	search, .-search
	.p2align 4
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
.LFB73:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	INT_KEYWORD(%rip), %rsi
	movq	%rdi, %rbx
	call	string_equal@PLT
	testb	%al, %al
	je	.L85
.L87:
	movl	$1, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L87
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L87
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L87
	movq	VOID_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	testb	%al, %al
	setne	%al
	ret
	.cfi_endproc
.LFE73:
	.size	is_builtin_type, .-is_builtin_type
	.p2align 4
	.globl	is_type
	.type	is_type, @function
is_type:
.LFB74:
	.cfi_startproc
	endbr64
	testl	$-5, 24(%rdi)
	sete	%al
	ret
	.cfi_endproc
.LFE74:
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
.LFB75:
	.cfi_startproc
	endbr64
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	movq	%rdi, %r9
	leaq	.LC10(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	1(%rax), %r8
	addq	$1, %rcx
	xorl	%eax, %eax
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE75:
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
.LFB78:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	shrq	$3, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	movl	%edx, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	3(%rcx), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	movl	%ebx, %ecx
	andl	$7, %ecx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
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
	xorl	%eax, %eax
	addq	$1, %r15
	call	__fprintf_chk@PLT
	cmpq	%r15, %rbx
	jne	.L99
	cmpb	$0, 12(%rsp)
	je	.L94
.L96:
	leaq	.LC13(%rip), %rdx
.L100:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L92:
	.cfi_restore_state
	notl	%eax
	andl	%esi, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rbx
	ja	.L93
	testq	%rbx, %rbx
	jne	.L96
.L91:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L104:
	.cfi_restore_state
	testq	%rbx, %rbx
	je	.L91
	.p2align 4,,10
	.p2align 3
.L94:
	leaq	.LC14(%rip), %rdx
	jmp	.L100
	.cfi_endproc
.LFE78:
	.size	indention, .-indention
	.p2align 4
	.globl	create_parser
	.type	create_parser, @function
create_parser:
.LFB79:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$35, %edi
	call	alloc_memory@PLT
	xorl	%edx, %edx
	movw	%dx, (%rax)
	movb	$0, 2(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE79:
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
.LFB80:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1064, %rsp
	.cfi_def_cfa_offset 1120
	movq	%fs:40, %rax
	movq	%rax, 1048(%rsp)
	xorl	%eax, %eax
	movb	$0, 16(%rsp)
	testq	%rsi, %rsi
	je	.L129
	leaq	16(%rsp), %rbx
	movq	%rsi, %rcx
	movl	$1024, %esi
	movq	%rbx, %rdx
	movq	%rbx, %rdi
	call	string_append@PLT
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC18(%rip), %rcx
	call	string_append@PLT
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	string_append@PLT
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC19(%rip), %rcx
	call	string_append@PLT
.L110:
	leaq	.LC20(%rip), %rsi
	movq	%rbx, %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L130
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	8(%rsp), %rsi
	movq	%rbp, %rdi
	movq	$0, 8(%rsp)
	call	read_source@PLT
	movq	%rbp, %rdi
	movq	%rax, %r14
	call	fclose@PLT
	movl	$35, %edi
	call	alloc_memory@PLT
	movq	%r14, %rdi
	movq	%rax, %rbp
	xorl	%eax, %eax
	movw	%ax, 0(%rbp)
	movb	$0, 2(%rbp)
	movq	8(%rsp), %rsi
	movq	builtin_scope(%rip), %r15
	call	create_lexer@PLT
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%rax, %rdi
	call	parse_code@PLT
	movq	%rbx, %rdx
	movl	$2, %edi
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	testq	%rbp, %rbp
	je	.L131
	movq	8(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L118
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L132:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L112
.L118:
	movq	8(%rbx), %rbp
	movq	%r12, %rsi
	movq	0(%rbp), %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L132
	movq	8(%r13), %rbx
	movl	$16, %edi
	call	alloc_memory@PLT
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rbp, 8(%rax)
	je	.L133
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L107:
	movq	1048(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L134
	addq	$1064, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L129:
	.cfi_restore_state
	leaq	.LC15(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L135
	leaq	.LC16(%rip), %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
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
.L135:
	movabsq	$8246143026212319022, %rax
	leaq	16(%rsp), %rbx
	movq	%rax, 16(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 23(%rsp)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L133:
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
	call	__fprintf_chk@PLT
.L112:
	xorl	%ebp, %ebp
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L131:
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC24(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	jmp	.L107
.L134:
	call	__stack_chk_fail@PLT
.L130:
	movq	stderr(%rip), %rdi
	movq	%rbx, %rcx
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	leaq	.LC21(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	jmp	.L107
	.cfi_endproc
.LFE80:
	.size	parse_import_file, .-parse_import_file
	.p2align 4
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
.LFB81:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	ASSIGN_SYMBOL(%rip), %rsi
	movq	%rdi, %rbx
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L136
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L136
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L136
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L136
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L136
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L136
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L136
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L136
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L136
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L136
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L136
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L136
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L136
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L136
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L136
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L136
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L154
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L155
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L136:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L154:
	.cfi_restore_state
	movl	$2, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L155:
	.cfi_restore_state
	movl	$3, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE81:
	.size	string_to_operator, .-string_to_operator
	.p2align 4
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
.LFB82:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L158
	movl	%edi, %edi
	leaq	CSWTCH.66(%rip), %rax
	movl	(%rax,%rdi,4), %eax
.L158:
	ret
	.cfi_endproc
.LFE82:
	.size	operator_precedence, .-operator_precedence
	.section	.text.unlikely,"ax",@progbits
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
.LFB83:
	.cfi_startproc
	endbr64
	cmpl	$18, %edi
	ja	.L183
	leaq	.L164(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L164:
	.long	.L182-.L164
	.long	.L181-.L164
	.long	.L180-.L164
	.long	.L179-.L164
	.long	.L178-.L164
	.long	.L177-.L164
	.long	.L176-.L164
	.long	.L175-.L164
	.long	.L174-.L164
	.long	.L173-.L164
	.long	.L172-.L164
	.long	.L171-.L164
	.long	.L170-.L164
	.long	.L169-.L164
	.long	.L168-.L164
	.long	.L167-.L164
	.long	.L166-.L164
	.long	.L165-.L164
	.long	.L163-.L164
	.text
	.p2align 4,,10
	.p2align 3
.L165:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L167:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L169:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L170:
	movq	OR_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	movq	AND_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L172:
	movq	GE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L173:
	movq	LE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	movq	GT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L175:
	movq	LT_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L176:
	movq	NE_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L177:
	movq	EQ_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L178:
	movq	MOD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L179:
	movq	DIV_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L180:
	movq	MUL_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	movq	SUB_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L182:
	movq	ADD_SYMBOL(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	operator_to_string.cold, @function
operator_to_string.cold:
.LFSB83:
.L183:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE83:
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

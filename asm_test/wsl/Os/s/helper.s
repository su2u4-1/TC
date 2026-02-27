	.file	"helper.c"
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$16, %edi
	call	alloc_memory@PLT
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rdx, 8(%rax)
	popq	%rcx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	create_list, .-create_list
	.globl	create_node
	.type	create_node, @function
create_node:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$16, %edi
	call	alloc_memory@PLT
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	create_node, .-create_node
	.globl	list_append
	.type	list_append, @function
list_append:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	call	create_node
	cmpq	$0, (%rbx)
	jne	.L6
	movq	%rax, (%rbx)
	jmp	.L7
.L6:
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L7:
	movq	%rax, 8(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
.LFB54:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L12
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	testq	%rdx, %rdx
	jne	.L14
	xorl	%edx, %edx
	movq	%rdx, 8(%rdi)
.L14:
	movq	8(%rax), %rax
.L12:
	ret
	.cfi_endproc
.LFE54:
	.size	list_pop, .-list_pop
	.globl	create_scope
	.type	create_scope, @function
create_scope:
.LFB56:
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
	pushq	%rax
	.cfi_def_cfa_offset 32
	call	alloc_memory@PLT
	movq	%rbp, (%rax)
	movq	%rax, %rbx
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	create_scope, .-create_scope
	.globl	search
	.type	search, @function
search:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	pushq	%rcx
	.cfi_def_cfa_offset 48
.L21:
	testq	%rbx, %rbx
	je	.L27
	movq	8(%rbx), %rax
	movq	(%rax), %rbp
.L22:
	testq	%rbp, %rbp
	je	.L28
	movq	8(%rbp), %r12
	movq	%r13, %rsi
	movq	(%r12), %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L20
	movq	0(%rbp), %rbp
	jmp	.L22
.L28:
	movq	(%rbx), %rbx
	jmp	.L21
.L27:
	xorl	%r12d, %r12d
.L20:
	popq	%rdx
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE57:
	.size	search, .-search
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
.LC1:
	.string	"type\n"
.LC2:
	.string	"variable\n"
.LC3:
	.string	"function\n"
.LC4:
	.string	"method\n"
.LC5:
	.string	"class\n"
.LC6:
	.string	"attribute\n"
.LC7:
	.string	"unknown\n"
.LC8:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
.LC9:
	.string	"Error creating name: unknown NameType %u\n"
	.text
	.globl	create_name
	.type	create_name, @function
create_name:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%r8, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	movq	%rdi, %rsi
	movq	%r8, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	pushq	%r9
	.cfi_def_cfa_offset 64
	call	search
	testq	%rax, %rax
	je	.L30
	movq	stderr(%rip), %rdi
	movq	%rax, %rbx
	movl	$2, %esi
	xorl	%eax, %eax
	movq	%r14, %rcx
	leaq	.LC0(%rip), %rdx
	call	__fprintf_chk@PLT
	cmpl	$5, 24(%rbx)
	movq	stderr(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	ja	.L58
	movl	24(%rbx), %eax
	leaq	.L33(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L33:
	.long	.L38-.L33
	.long	.L37-.L33
	.long	.L36-.L33
	.long	.L35-.L33
	.long	.L34-.L33
	.long	.L32-.L33
	.text
.L38:
	leaq	.LC1(%rip), %rdi
	jmp	.L58
.L37:
	leaq	.LC2(%rip), %rdi
	jmp	.L58
.L36:
	leaq	.LC3(%rip), %rdi
	jmp	.L58
.L35:
	leaq	.LC4(%rip), %rdi
	jmp	.L58
.L34:
	leaq	.LC5(%rip), %rdi
	jmp	.L58
.L32:
	leaq	.LC6(%rip), %rdi
.L58:
	call	fputs@PLT
.L30:
	movl	$32, %edi
	call	alloc_memory@PLT
	movq	%r14, (%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 24(%rbx)
	incq	%rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	leal	-1(%rbp), %eax
	cmpl	$2, %eax
	jbe	.L39
	cmpl	$5, %ebp
	je	.L39
	cmpl	$4, %ebp
	jne	.L42
	testq	%r12, %r12
	je	.L42
	movq	%r12, 16(%rbx)
	jmp	.L44
.L39:
	testq	%r13, %r13
	je	.L43
	movq	%r13, 16(%rbx)
	jmp	.L44
.L42:
	testl	%ebp, %ebp
	jne	.L43
	xorl	%ecx, %ecx
	movq	%rcx, 16(%rbx)
	jmp	.L44
.L43:
	orq	%r13, %r12
	movq	stderr(%rip), %rdi
	movl	%ebp, %ecx
	leaq	.LC8(%rip), %rdx
	je	.L59
	leaq	.LC9(%rip), %rdx
.L59:
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__fprintf_chk@PLT
	jmp	.L29
.L44:
	movq	8(%r15), %rdi
	movq	%rbx, %rsi
	call	list_append
.L29:
	popq	%rdx
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
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
	.cfi_endproc
.LFE55:
	.size	create_name, .-create_name
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
.LFB58:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	INT_KEYWORD(%rip), %rsi
	movq	%rdi, %rbx
	call	string_equal@PLT
	testb	%al, %al
	je	.L61
.L63:
	movl	$1, %eax
	jmp	.L62
.L61:
	movq	FLOAT_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L63
	movq	STRING_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L63
	movq	BOOL_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L63
	movq	VOID_KEYWORD(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
.L62:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE58:
	.size	is_builtin_type, .-is_builtin_type
	.globl	is_type
	.type	is_type, @function
is_type:
.LFB59:
	.cfi_startproc
	endbr64
	testl	$-5, 24(%rdi)
	sete	%al
	ret
	.cfi_endproc
.LFE59:
	.size	is_type, .-is_type
	.section	.rodata.str1.1
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
.LFB60:
	.cfi_startproc
	endbr64
	movq	16(%rsi), %rax
	movq	8(%rsi), %rcx
	movq	%rdi, %r9
	leaq	.LC10(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	1(%rax), %r8
	incq	%rcx
	xorl	%eax, %eax
	jmp	__fprintf_chk@PLT
	.cfi_endproc
.LFE60:
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
	.globl	indention
	.type	indention, @function
indention:
.LFB63:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	3(%rcx), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edx, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	shrq	$3, %rsi
	movl	%ebx, %ecx
	addq	%r14, %rsi
	andl	$7, %ecx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	sall	%cl, %eax
	movb	(%rsi), %dl
	testb	%r13b, %r13b
	jne	.L68
	orl	%eax, %edx
.L70:
	movb	%dl, (%rsi)
	movl	$1, %ebp
	leaq	.LC12(%rip), %r15
	jmp	.L69
.L68:
	notl	%eax
	andl	%eax, %edx
	jmp	.L70
.L69:
	cmpq	%rbx, %rbp
	jnb	.L78
	movq	%rbp, %rax
	movl	%ebp, %ecx
	movl	$2, %esi
	movq	%rdi, 8(%rsp)
	shrq	$3, %rax
	andl	$7, %ecx
	leaq	.LC11(%rip), %rdx
	movsbl	(%r14,%rax), %eax
	sarl	%cl, %eax
	testb	$1, %al
	cmove	%r15, %rdx
	xorl	%eax, %eax
	incq	%rbp
	call	__fprintf_chk@PLT
	movq	8(%rsp), %rdi
	jmp	.L69
.L78:
	testq	%rbx, %rbx
	je	.L67
	testb	%r13b, %r13b
	leaq	.LC13(%rip), %rax
	movl	$2, %esi
	leaq	.LC14(%rip), %rdx
	cmovne	%rax, %rdx
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	__fprintf_chk@PLT
.L67:
	.cfi_restore_state
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE63:
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
.LFB64:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$35, %edi
	call	alloc_memory@PLT
	movw	$0, (%rax)
	movb	$0, 2(%rax)
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
.LC21:
	.string	"Error opening library file for import: %s\n"
.LC22:
	.string	"Info: Starting parsing lib file for import: %s\n"
.LC23:
	.string	"Info: Finished parsing lib file for import: %s\n"
.LC24:
	.string	"Error parsing library file for import: %s\n"
	.text
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
.LFB65:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1048, %rsp
	.cfi_def_cfa_offset 1104
	movq	%fs:40, %rax
	movq	%rax, 1032(%rsp)
	xorl	%eax, %eax
	testq	%rsi, %rsi
	movb	$0, 8(%rsp)
	leaq	8(%rsp), %rbx
	jne	.L82
	leaq	.LC15(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L83
	movabsq	$8246143026212319022, %rax
	movq	%rax, 8(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 15(%rsp)
	jmp	.L84
.L83:
	leaq	.LC16(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L85
	movabsq	$8241920901561659182, %rax
	movq	%rax, 8(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 13(%rsp)
	jmp	.L84
.L85:
	movq	%rbx, %rcx
	leaq	.LC17(%rip), %rdx
	jmp	.L96
.L82:
	movq	%rsi, %rcx
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	string_append@PLT
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC18(%rip), %rcx
	call	string_append@PLT
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	call	string_append@PLT
	movq	%rbx, %rdx
	movl	$1024, %esi
	movq	%rbx, %rdi
	leaq	.LC19(%rip), %rcx
	call	string_append@PLT
.L84:
	leaq	.LC20(%rip), %rsi
	movq	%rbx, %rdi
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L87
	movq	%rbx, %rcx
	leaq	.LC21(%rip), %rdx
.L96:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__fprintf_chk@PLT
	jmp	.L81
.L87:
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rsp, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	movq	%rax, (%rsp)
	call	read_source@PLT
	movq	%r12, %rdi
	movq	%rax, %r14
	call	fclose@PLT
	call	create_parser
	movq	(%rsp), %rsi
	movq	builtin_scope(%rip), %r12
	movq	%r14, %rdi
	movq	%rax, %r15
	call	create_lexer@PLT
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%rax, %rdi
	call	parse_code@PLT
	movq	%rbx, %rdx
	movl	$2, %edi
	leaq	.LC23(%rip), %rsi
	movq	%rax, %r12
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rcx
	leaq	.LC24(%rip), %rdx
	testq	%r12, %r12
	je	.L96
	movq	8(%r12), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
.L90:
	testq	%rbx, %rbx
	je	.L81
	movq	8(%rbx), %r12
	movq	%rbp, %rsi
	movq	(%r12), %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L91
	movq	(%rbx), %rbx
	jmp	.L90
.L91:
	movq	8(%r13), %rdi
	movq	%r12, %rsi
	movq	%r12, %rbx
	call	list_append
.L81:
	movq	1032(%rsp), %rax
	subq	%fs:40, %rax
	je	.L94
	call	__stack_chk_fail@PLT
.L94:
	addq	$1048, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
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
	.cfi_endproc
.LFE65:
	.size	parse_import_file, .-parse_import_file
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
.LFB66:
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
	jne	.L97
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L97
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L97
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L97
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L97
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L97
	movq	AND_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L97
	movq	OR_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L97
	movq	EQ_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L97
	movq	NE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L97
	movq	LT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L97
	movq	GT_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L97
	movq	LE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L97
	movq	GE_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L97
	movq	ADD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L97
	movq	SUB_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L97
	movq	MUL_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$2, %eax
	testb	%dl, %dl
	jne	.L97
	movq	DIV_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	movl	%eax, %edx
	movl	$3, %eax
	testb	%dl, %dl
	jne	.L97
	movq	MOD_SYMBOL(%rip), %rsi
	movq	%rbx, %rdi
	call	string_equal@PLT
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L97:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
.LFB67:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L119
	movl	%edi, %edi
	leaq	CSWTCH.66(%rip), %rax
	movsbl	(%rax,%rdi), %eax
.L119:
	ret
	.cfi_endproc
.LFE67:
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
.LFB68:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	cmpl	$18, %edi
	ja	.L122
	leaq	.L125(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L125:
	.long	.L143-.L125
	.long	.L142-.L125
	.long	.L141-.L125
	.long	.L140-.L125
	.long	.L139-.L125
	.long	.L138-.L125
	.long	.L137-.L125
	.long	.L136-.L125
	.long	.L135-.L125
	.long	.L134-.L125
	.long	.L133-.L125
	.long	.L132-.L125
	.long	.L131-.L125
	.long	.L130-.L125
	.long	.L129-.L125
	.long	.L128-.L125
	.long	.L127-.L125
	.long	.L126-.L125
	.long	.L124-.L125
	.text
.L130:
	movq	ASSIGN_SYMBOL(%rip), %rax
	ret
.L129:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L128:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	ret
.L127:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	ret
.L126:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	ret
.L124:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	ret
.L132:
	movq	AND_SYMBOL(%rip), %rax
	ret
.L131:
	movq	OR_SYMBOL(%rip), %rax
	ret
.L138:
	movq	EQ_SYMBOL(%rip), %rax
	ret
.L137:
	movq	NE_SYMBOL(%rip), %rax
	ret
.L136:
	movq	LT_SYMBOL(%rip), %rax
	ret
.L135:
	movq	GT_SYMBOL(%rip), %rax
	ret
.L134:
	movq	LE_SYMBOL(%rip), %rax
	ret
.L133:
	movq	GE_SYMBOL(%rip), %rax
	ret
.L143:
	movq	ADD_SYMBOL(%rip), %rax
	ret
.L142:
	movq	SUB_SYMBOL(%rip), %rax
	ret
.L141:
	movq	MUL_SYMBOL(%rip), %rax
	ret
.L140:
	movq	DIV_SYMBOL(%rip), %rax
	ret
.L139:
	movq	MOD_SYMBOL(%rip), %rax
.L122:
	ret
	.cfi_endproc
.LFE68:
	.size	operator_to_string, .-operator_to_string
	.section	.rodata
	.align 16
	.type	CSWTCH.66, @object
	.size	CSWTCH.66, 19
CSWTCH.66:
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
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

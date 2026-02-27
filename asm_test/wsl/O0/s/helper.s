	.file	"helper.c"
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	create_list, .-create_list
	.globl	create_node
	.type	create_node, @function
create_node:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	create_node, .-create_node
	.globl	list_append
	.type	list_append, @function
list_append:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	create_node
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L6
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L8
.L6:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L8:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	call	create_list
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	movl	$0, %eax
	jmp	.L13
.L12:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L14
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
.L14:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
.L13:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	list_pop, .-list_pop
	.section	.rodata
	.align 8
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
	.align 8
.LC8:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
	.align 8
.LC9:
	.string	"Error creating name: unknown NameType %u\n"
	.text
	.globl	create_name
	.type	create_name, @function
create_name:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L16
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$5, %eax
	ja	.L17
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L19(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L19(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L19:
	.long	.L24-.L19
	.long	.L23-.L19
	.long	.L22-.L19
	.long	.L21-.L19
	.long	.L20-.L19
	.long	.L18-.L19
	.text
.L24:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$5, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L16
.L23:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L16
.L22:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L16
.L21:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L16
.L20:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L16
.L18:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L16
.L17:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	nop
.L16:
	movl	$32, %edi
	call	alloc_memory@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	id_counter.0(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 24(%rax)
	cmpl	$1, -28(%rbp)
	je	.L25
	cmpl	$5, -28(%rbp)
	je	.L25
	cmpl	$2, -28(%rbp)
	je	.L25
	cmpl	$3, -28(%rbp)
	jne	.L26
.L25:
	cmpq	$0, -40(%rbp)
	je	.L26
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L27
.L26:
	cmpl	$4, -28(%rbp)
	jne	.L28
	cmpq	$0, -48(%rbp)
	je	.L28
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L27
.L28:
	cmpl	$0, -28(%rbp)
	jne	.L29
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	jmp	.L27
.L29:
	cmpq	$0, -40(%rbp)
	jne	.L30
	cmpq	$0, -48(%rbp)
	jne	.L30
	cmpl	$0, -28(%rbp)
	je	.L30
	movq	stderr(%rip), %rax
	movl	-28(%rbp), %edx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L31
.L30:
	movq	stderr(%rip), %rax
	movl	-28(%rbp), %edx
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L31:
	movl	$0, %eax
	jmp	.L32
.L27:
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append
	movq	-8(%rbp), %rax
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	create_name, .-create_name
	.globl	create_scope
	.type	create_scope, @function
create_scope:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	alloc_memory@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	create_scope, .-create_scope
	.globl	search
	.type	search, @function
search:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L36
.L41:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L37
.L40:
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L38
	movq	-8(%rbp), %rax
	jmp	.L39
.L38:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
.L37:
	cmpq	$0, -32(%rbp)
	jne	.L40
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L36:
	cmpq	$0, -40(%rbp)
	jne	.L41
	movl	$0, %eax
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	search, .-search
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	INT_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L43
	movq	FLOAT_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L43
	movq	STRING_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L43
	movq	BOOL_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	jne	.L43
	movq	VOID_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L44
.L43:
	movl	$1, %eax
	jmp	.L45
.L44:
	movl	$0, %eax
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	is_builtin_type, .-is_builtin_type
	.globl	is_type
	.type	is_type, @function
is_type:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L48
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	cmpl	$4, %eax
	jne	.L49
.L48:
	movl	$1, %eax
	jmp	.L50
.L49:
	movl	$0, %eax
.L50:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	is_type, .-is_type
	.section	.rodata
	.align 8
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rdx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rsi
	movq	%rsi, %r8
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	parser_error, .-parser_error
	.type	set_bool_list, @function
set_bool_list:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, %eax
	movb	%al, -36(%rbp)
	movq	-32(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	cmpb	$0, -36(%rbp)
	je	.L54
	movq	-32(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	movq	-32(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	%ecx, %eax
	orb	-1(%rbp), %al
	movb	%al, (%rdx)
	jmp	.L56
.L54:
	movq	-32(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	andb	-1(%rbp), %al
	movb	%al, (%rdx)
.L56:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	set_bool_list, .-set_bool_list
	.type	get_bool_list, @function
get_bool_list:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-16(%rbp), %rax
	andl	$7, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	setne	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	get_bool_list, .-get_bool_list
	.section	.rodata
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
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, %eax
	movq	%rcx, -48(%rbp)
	movb	%al, -36(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpb	$0, -36(%rbp)
	sete	%al
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	leaq	3(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	set_bool_list
	movq	$1, -16(%rbp)
	jmp	.L60
.L63:
	movq	-8(%rbp), %rax
	leaq	3(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	get_bool_list
	testb	%al, %al
	je	.L61
	leaq	.LC11(%rip), %rax
	jmp	.L62
.L61:
	leaq	.LC12(%rip), %rax
.L62:
	movq	-24(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$1, -16(%rbp)
.L60:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L63
	cmpq	$0, -32(%rbp)
	je	.L67
	cmpb	$0, -36(%rbp)
	je	.L65
	leaq	.LC13(%rip), %rax
	jmp	.L66
.L65:
	leaq	.LC14(%rip), %rax
.L66:
	movq	-24(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L67:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$35, %edi
	call	alloc_memory@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movb	$0, 1(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	create_parser, .-create_parser
	.section	.rodata
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
	.align 8
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
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
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$1152, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -1144(%rbp)
	movq	%rsi, -1152(%rbp)
	movq	%rdx, -1160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	$0, -1128(%rbp)
	movb	$0, -1056(%rbp)
	cmpq	$0, -1152(%rbp)
	jne	.L71
	movq	-1144(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L72
	leaq	-1056(%rbp), %rax
	movabsq	$8246143026212319022, %rbx
	movq	%rbx, (%rax)
	movabsq	$27993765565065586, %rbx
	movq	%rbx, 7(%rax)
	jmp	.L73
.L72:
	movq	-1144(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L74
	leaq	-1056(%rbp), %rax
	movabsq	$8241920901561659182, %rbx
	movq	%rbx, (%rax)
	movabsq	$27993765531771183, %rbx
	movq	%rbx, 5(%rax)
	jmp	.L73
.L74:
	movq	stderr(%rip), %rax
	leaq	-1056(%rbp), %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L83
.L71:
	movq	-1152(%rbp), %rcx
	leaq	-1056(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	string_append@PLT
	leaq	-1056(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	leaq	.LC18(%rip), %rcx
	movl	$1024, %esi
	movq	%rax, %rdi
	call	string_append@PLT
	movq	-1144(%rbp), %rcx
	leaq	-1056(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	string_append@PLT
	leaq	-1056(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	leaq	.LC19(%rip), %rcx
	movl	$1024, %esi
	movq	%rax, %rdi
	call	string_append@PLT
.L73:
	leaq	-1056(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1112(%rbp)
	cmpq	$0, -1112(%rbp)
	jne	.L76
	movq	stderr(%rip), %rax
	leaq	-1056(%rbp), %rdx
	leaq	.LC21(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L83
.L76:
	leaq	-1056(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	$0, -1136(%rbp)
	leaq	-1136(%rbp), %rdx
	movq	-1112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	read_source@PLT
	movq	%rax, -1104(%rbp)
	movq	-1112(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	call	create_parser
	movq	%rax, %r12
	movq	builtin_scope(%rip), %rbx
	movq	-1136(%rbp), %rdx
	movq	-1104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_lexer@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	parse_code@PLT
	movq	%rax, -1096(%rbp)
	leaq	-1056(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpq	$0, -1096(%rbp)
	jne	.L77
	movq	stderr(%rip), %rax
	leaq	-1056(%rbp), %rdx
	leaq	.LC24(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L83
.L77:
	movq	-1096(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -1088(%rbp)
	movq	-1088(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1120(%rbp)
	jmp	.L78
.L81:
	movq	-1120(%rbp), %rax
	movq	%rax, -1080(%rbp)
	movq	-1080(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -1072(%rbp)
	movq	-1072(%rbp), %rax
	movq	(%rax), %rax
	movq	-1144(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L79
	movq	-1072(%rbp), %rax
	movq	%rax, -1128(%rbp)
	jmp	.L80
.L79:
	movq	-1080(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1120(%rbp)
.L78:
	cmpq	$0, -1120(%rbp)
	jne	.L81
.L80:
	cmpq	$0, -1128(%rbp)
	je	.L82
	movq	-1160(%rbp), %rax
	movq	%rax, -1064(%rbp)
	movq	-1064(%rbp), %rax
	movq	8(%rax), %rax
	movq	-1128(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append
.L82:
	movq	-1128(%rbp), %rax
.L83:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L84
	call	__stack_chk_fail@PLT
.L84:
	addq	$1152, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	parse_import_file, .-parse_import_file
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L86
	movl	$13, %eax
	jmp	.L87
.L86:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L88
	movl	$14, %eax
	jmp	.L87
.L88:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L89
	movl	$15, %eax
	jmp	.L87
.L89:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L90
	movl	$16, %eax
	jmp	.L87
.L90:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L91
	movl	$17, %eax
	jmp	.L87
.L91:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L92
	movl	$18, %eax
	jmp	.L87
.L92:
	movq	AND_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L93
	movl	$11, %eax
	jmp	.L87
.L93:
	movq	OR_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L94
	movl	$12, %eax
	jmp	.L87
.L94:
	movq	EQ_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L95
	movl	$5, %eax
	jmp	.L87
.L95:
	movq	NE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L96
	movl	$6, %eax
	jmp	.L87
.L96:
	movq	LT_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L97
	movl	$7, %eax
	jmp	.L87
.L97:
	movq	GT_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L98
	movl	$8, %eax
	jmp	.L87
.L98:
	movq	LE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L99
	movl	$9, %eax
	jmp	.L87
.L99:
	movq	GE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L100
	movl	$10, %eax
	jmp	.L87
.L100:
	movq	ADD_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L101
	movl	$0, %eax
	jmp	.L87
.L101:
	movq	SUB_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L102
	movl	$1, %eax
	jmp	.L87
.L102:
	movq	MUL_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L103
	movl	$2, %eax
	jmp	.L87
.L103:
	movq	DIV_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L104
	movl	$3, %eax
	jmp	.L87
.L104:
	movq	MOD_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	string_equal@PLT
	testb	%al, %al
	je	.L105
	movl	$4, %eax
	jmp	.L87
.L105:
	movl	$19, %eax
.L87:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$18, -4(%rbp)
	ja	.L107
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L109(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L109(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L109:
	.long	.L113-.L109
	.long	.L113-.L109
	.long	.L112-.L109
	.long	.L112-.L109
	.long	.L112-.L109
	.long	.L111-.L109
	.long	.L111-.L109
	.long	.L111-.L109
	.long	.L111-.L109
	.long	.L111-.L109
	.long	.L111-.L109
	.long	.L110-.L109
	.long	.L110-.L109
	.long	.L108-.L109
	.long	.L108-.L109
	.long	.L108-.L109
	.long	.L108-.L109
	.long	.L108-.L109
	.long	.L108-.L109
	.text
.L108:
	movl	$1, %eax
	jmp	.L114
.L110:
	movl	$2, %eax
	jmp	.L114
.L111:
	movl	$3, %eax
	jmp	.L114
.L113:
	movl	$4, %eax
	jmp	.L114
.L112:
	movl	$5, %eax
	jmp	.L114
.L107:
	movl	$0, %eax
.L114:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$18, -4(%rbp)
	ja	.L116
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L118(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L118(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L118:
	.long	.L136-.L118
	.long	.L135-.L118
	.long	.L134-.L118
	.long	.L133-.L118
	.long	.L132-.L118
	.long	.L131-.L118
	.long	.L130-.L118
	.long	.L129-.L118
	.long	.L128-.L118
	.long	.L127-.L118
	.long	.L126-.L118
	.long	.L125-.L118
	.long	.L124-.L118
	.long	.L123-.L118
	.long	.L122-.L118
	.long	.L121-.L118
	.long	.L120-.L118
	.long	.L119-.L118
	.long	.L117-.L118
	.text
.L123:
	movq	ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L122:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L121:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L120:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L119:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L117:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L137
.L125:
	movq	AND_SYMBOL(%rip), %rax
	jmp	.L137
.L124:
	movq	OR_SYMBOL(%rip), %rax
	jmp	.L137
.L131:
	movq	EQ_SYMBOL(%rip), %rax
	jmp	.L137
.L130:
	movq	NE_SYMBOL(%rip), %rax
	jmp	.L137
.L129:
	movq	LT_SYMBOL(%rip), %rax
	jmp	.L137
.L128:
	movq	GT_SYMBOL(%rip), %rax
	jmp	.L137
.L127:
	movq	LE_SYMBOL(%rip), %rax
	jmp	.L137
.L126:
	movq	GE_SYMBOL(%rip), %rax
	jmp	.L137
.L136:
	movq	ADD_SYMBOL(%rip), %rax
	jmp	.L137
.L135:
	movq	SUB_SYMBOL(%rip), %rax
	jmp	.L137
.L134:
	movq	MUL_SYMBOL(%rip), %rax
	jmp	.L137
.L133:
	movq	DIV_SYMBOL(%rip), %rax
	jmp	.L137
.L132:
	movq	MOD_SYMBOL(%rip), %rax
	jmp	.L137
.L116:
	movl	$0, %eax
.L137:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	operator_to_string, .-operator_to_string
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

	.file	"helper.c"
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_list, .-create_list
	.type	create_node, @function
create_node:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_node, .-create_node
	.section	.rodata
	.align 8
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L6
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	*fwrite@GOTPCREL(%rip)
	jmp	.L5
.L6:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	create_node
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L8
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L5
.L8:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L5:
	leave
	ret
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L10
	movl	$0, %eax
	jmp	.L11
.L10:
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
.L11:
	leave
	ret
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L13
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L14
.L13:
	movl	$0, %eax
	jmp	.L15
.L14:
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
	jne	.L16
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
.L16:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
.L15:
	popq	%rbp
	ret
	.size	list_pop, .-list_pop
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L18
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L19
.L18:
	movl	$0, %eax
	jmp	.L20
.L19:
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L21
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	$0, (%rax)
	movq	-40(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-24(%rbp), %rax
	jmp	.L20
.L21:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L22
.L23:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L22:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L23
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
.L20:
	popq	%rbp
	ret
	.size	list_pop_back, .-list_pop_back
	.globl	list_is_empty
	.type	list_is_empty, @function
list_is_empty:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L25
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L25
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L26
.L25:
	movl	$1, %eax
	jmp	.L27
.L26:
	movl	$0, %eax
.L27:
	popq	%rbp
	ret
	.size	list_is_empty, .-list_is_empty
	.section	.rodata
	.align 8
.LC1:
	.string	"Warning: Creating symbol with unknown SymbolType: %d\n"
	.align 8
.LC2:
	.string	"Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n"
	.align 8
.LC3:
	.string	"Warning: Creating symbol with unknown SymbolType for ast_node assignment: %d\n"
	.align 8
.LC4:
	.string	"Warning: Creating symbol '%s' with NULL scope, kind: %d, id: %zu\n"
	.text
	.globl	create_symbol
	.type	create_symbol, @function
create_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	$0, -8(%rbp)
	cmpl	$6, -44(%rbp)
	ja	.L30
	cmpl	$3, -44(%rbp)
	jnb	.L31
	cmpl	$2, -44(%rbp)
	je	.L32
	cmpl	$2, -44(%rbp)
	ja	.L30
	cmpl	$0, -44(%rbp)
	je	.L33
	cmpl	$1, -44(%rbp)
	je	.L34
	jmp	.L30
.L33:
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L35
.L34:
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L35
.L32:
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L35
.L31:
	movq	-64(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L35
.L30:
	movq	stderr(%rip), %rax
	movl	-44(%rbp), %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L35:
	movq	-40(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	search_name
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L36
	movq	id_counter.0(%rip), %rax
	leaq	1(%rax), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rsi
	movq	-16(%rbp), %rax
	movl	32(%rax), %ecx
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L36:
	movl	$40, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	id_counter.0(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, 32(%rax)
	movq	-24(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpl	$6, -44(%rbp)
	ja	.L37
	cmpl	$3, -44(%rbp)
	jnb	.L38
	cmpl	$2, -44(%rbp)
	je	.L39
	cmpl	$2, -44(%rbp)
	ja	.L37
	cmpl	$0, -44(%rbp)
	je	.L40
	cmpl	$1, -44(%rbp)
	je	.L41
	jmp	.L37
.L40:
	movq	-24(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L41:
	movq	-24(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L39:
	movq	-24(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L38:
	movq	-24(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L37:
	movq	stderr(%rip), %rax
	movl	-44(%rbp), %edx
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
.L42:
	cmpq	$0, -8(%rbp)
	jne	.L43
	movq	-24(%rbp), %rax
	movq	16(%rax), %rsi
	movq	stderr(%rip), %rax
	movl	-44(%rbp), %ecx
	movq	-40(%rbp), %rdx
	movq	%rsi, %r8
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	jmp	.L44
.L43:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append
.L44:
	movq	-24(%rbp), %rax
	leave
	ret
	.size	create_symbol, .-create_symbol
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_symbol_table, .-create_symbol_table
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	jmp	.L49
.L54:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L50
.L53:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*strcmp@GOTPCREL(%rip)
	testl	%eax, %eax
	jne	.L51
	movq	-32(%rbp), %rax
	jmp	.L52
.L51:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L50:
	cmpq	$0, -8(%rbp)
	jne	.L53
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L49:
	cmpq	$0, -40(%rbp)
	jne	.L54
	movl	$0, %eax
.L52:
	leave
	ret
	.size	search_name_use_strcmp, .-search_name_use_strcmp
	.globl	search_name
	.type	search_name, @function
search_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	jmp	.L56
.L61:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L57
.L60:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L58
	movq	-32(%rbp), %rax
	jmp	.L59
.L58:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L57:
	cmpq	$0, -8(%rbp)
	jne	.L60
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L56:
	cmpq	$0, -40(%rbp)
	jne	.L61
	movl	$0, %eax
.L59:
	leave
	ret
	.size	search_name, .-search_name
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	INT_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L63
	movq	FLOAT_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L63
	movq	STRING_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L63
	movq	BOOL_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	jne	.L63
	movq	VOID_KEYWORD(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L64
.L63:
	movl	$1, %eax
	jmp	.L65
.L64:
	movl	$0, %eax
.L65:
	leave
	ret
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata
	.align 8
.LC5:
	.string	"Parser Error at %s:%zu:%zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rdi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rcx
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	%rsi, %r9
	movq	%rdi, %r8
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	nop
	leave
	ret
	.size	parser_error, .-parser_error
	.type	set_bool_list, @function
set_bool_list:
	pushq	%rbp
	movq	%rsp, %rbp
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
	je	.L69
	movq	-32(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	orb	-1(%rbp), %al
	jmp	.L70
.L69:
	movq	-32(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	andb	-1(%rbp), %al
.L70:
	movq	-32(%rbp), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movb	%al, (%rdx)
	nop
	popq	%rbp
	ret
	.size	set_bool_list, .-set_bool_list
	.type	get_bool_list, @function
get_bool_list:
	pushq	%rbp
	movq	%rsp, %rbp
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
	ret
	.size	get_bool_list, .-get_bool_list
	.section	.rodata
.LC6:
	.string	"\342\224\202   "
.LC7:
	.string	"    "
.LC8:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC9:
	.string	"\342\224\234\342\224\200\342\224\200 "
	.text
	.globl	indention
	.type	indention, @function
indention:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, %eax
	movq	%rcx, -48(%rbp)
	movb	%al, -36(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpb	$0, -36(%rbp)
	sete	%al
	movzbl	%al, %edx
	movq	-16(%rbp), %rax
	leaq	11(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	set_bool_list
	movq	$1, -8(%rbp)
	jmp	.L74
.L77:
	movq	-16(%rbp), %rax
	leaq	11(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	get_bool_list
	testb	%al, %al
	je	.L75
	leaq	.LC6(%rip), %rax
	jmp	.L76
.L75:
	leaq	.LC7(%rip), %rax
.L76:
	movq	-24(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	addq	$1, -8(%rbp)
.L74:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L77
	cmpq	$0, -32(%rbp)
	je	.L81
	cmpb	$0, -36(%rbp)
	je	.L79
	leaq	.LC8(%rip), %rax
	jmp	.L80
.L79:
	leaq	.LC9(%rip), %rax
.L80:
	movq	-24(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L81:
	nop
	leave
	ret
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$48, %edi
	call	*alloc_memory@GOTPCREL(%rip)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 9(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 10(%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.size	create_parser, .-create_parser
	.section	.rodata
.LC10:
	.string	""
.LC11:
	.string	"%s.tc"
.LC12:
	.string	"D:/TC/std/"
.LC13:
	.string	"r"
	.align 8
.LC14:
	.string	"Error opening library file for import: %s\n"
	.align 8
.LC15:
	.string	"Info: Starting parsing lib file for import: %s\n"
	.align 8
.LC16:
	.string	"Info: Finished parsing lib file for import: %s\n"
	.align 8
.LC17:
	.string	"Error parsing library file for import: %s\n"
	.align 8
.LC18:
	.string	"Error: Imported symbol '%s' was not found in %s\n"
	.text
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rbx
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%rdx, -136(%rbp)
	movq	%rcx, -144(%rbp)
	movq	$0, -24(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L85
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*create_string_not_check@GOTPCREL(%rip)
	movq	%rax, -48(%rbp)
	movq	-120(%rbp), %rdx
	movq	-48(%rbp), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	movq	-48(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*absolute_path@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
	jmp	.L86
.L85:
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	*get_file_dir@GOTPCREL(%rip)
	movq	%rax, %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*absolute_path@GOTPCREL(%rip)
	movq	%rax, -32(%rbp)
.L86:
	movq	-32(%rbp), %rax
	leaq	.LC13(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*fopen@GOTPCREL(%rip)
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L87
	movq	stderr(%rip), %rax
	movq	-32(%rbp), %rdx
	leaq	.LC14(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L96
.L87:
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	*printf@GOTPCREL(%rip)
	movq	$0, -104(%rbp)
	leaq	-104(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*read_source@GOTPCREL(%rip)
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	*fclose@GOTPCREL(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	*create_file@GOTPCREL(%rip)
	movq	%rax, %rdi
	call	create_parser
	movq	%rax, %r12
	movq	builtin_scope(%rip), %rbx
	movq	-104(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*create_lexer@GOTPCREL(%rip)
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	*parse_code@GOTPCREL(%rip)
	movq	%rax, -72(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	*printf@GOTPCREL(%rip)
	cmpq	$0, -72(%rbp)
	jne	.L89
	movq	stderr(%rip), %rax
	movq	-32(%rbp), %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
	movl	$0, %eax
	jmp	.L96
.L89:
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L90
.L93:
	movq	-40(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L91
	movq	-96(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L92
.L91:
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L90:
	cmpq	$0, -40(%rbp)
	jne	.L93
.L92:
	cmpq	$0, -24(%rbp)
	je	.L94
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	list_append
	jmp	.L95
.L94:
	movq	stderr(%rip), %rax
	movq	-32(%rbp), %rcx
	movq	-120(%rbp), %rdx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*fprintf@GOTPCREL(%rip)
.L95:
	movq	-24(%rbp), %rax
.L96:
	subq	$-128, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	ret
	.size	parse_import_file, .-parse_import_file
	.section	.rodata
.LC19:
	.string	"%s.%s"
	.text
	.globl	make_method_name
	.type	make_method_name, @function
make_method_name:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	*strlen@GOTPCREL(%rip)
	addq	%rbx, %rax
	addq	$2, %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	*create_string@GOTPCREL(%rip)
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*sprintf@GOTPCREL(%rip)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	make_method_name, .-make_method_name
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L100
	movl	$13, %eax
	jmp	.L101
.L100:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L102
	movl	$14, %eax
	jmp	.L101
.L102:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L103
	movl	$15, %eax
	jmp	.L101
.L103:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L104
	movl	$16, %eax
	jmp	.L101
.L104:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L105
	movl	$17, %eax
	jmp	.L101
.L105:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L106
	movl	$18, %eax
	jmp	.L101
.L106:
	movq	AND_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L107
	movl	$11, %eax
	jmp	.L101
.L107:
	movq	OR_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L108
	movl	$12, %eax
	jmp	.L101
.L108:
	movq	EQ_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L109
	movl	$5, %eax
	jmp	.L101
.L109:
	movq	NE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L110
	movl	$6, %eax
	jmp	.L101
.L110:
	movq	LT_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L111
	movl	$7, %eax
	jmp	.L101
.L111:
	movq	GT_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L112
	movl	$8, %eax
	jmp	.L101
.L112:
	movq	LE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L113
	movl	$9, %eax
	jmp	.L101
.L113:
	movq	GE_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L114
	movl	$10, %eax
	jmp	.L101
.L114:
	movq	ADD_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L115
	movl	$0, %eax
	jmp	.L101
.L115:
	movq	SUB_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L116
	movl	$1, %eax
	jmp	.L101
.L116:
	movq	MUL_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L117
	movl	$2, %eax
	jmp	.L101
.L117:
	movq	DIV_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L118
	movl	$3, %eax
	jmp	.L101
.L118:
	movq	MOD_SYMBOL(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*string_equal@GOTPCREL(%rip)
	testb	%al, %al
	je	.L119
	movl	$4, %eax
	jmp	.L101
.L119:
	movl	$19, %eax
.L101:
	leave
	ret
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$18, -4(%rbp)
	ja	.L121
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L123(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L123(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L123:
	.long	.L127-.L123
	.long	.L127-.L123
	.long	.L126-.L123
	.long	.L126-.L123
	.long	.L126-.L123
	.long	.L125-.L123
	.long	.L125-.L123
	.long	.L125-.L123
	.long	.L125-.L123
	.long	.L125-.L123
	.long	.L125-.L123
	.long	.L124-.L123
	.long	.L124-.L123
	.long	.L122-.L123
	.long	.L122-.L123
	.long	.L122-.L123
	.long	.L122-.L123
	.long	.L122-.L123
	.long	.L122-.L123
	.text
.L122:
	movl	$1, %eax
	jmp	.L128
.L124:
	movl	$2, %eax
	jmp	.L128
.L125:
	movl	$3, %eax
	jmp	.L128
.L127:
	movl	$4, %eax
	jmp	.L128
.L126:
	movl	$5, %eax
	jmp	.L128
.L121:
	movl	$0, %eax
.L128:
	popq	%rbp
	ret
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$18, -4(%rbp)
	ja	.L130
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L132(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L132(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L132:
	.long	.L150-.L132
	.long	.L149-.L132
	.long	.L148-.L132
	.long	.L147-.L132
	.long	.L146-.L132
	.long	.L145-.L132
	.long	.L144-.L132
	.long	.L143-.L132
	.long	.L142-.L132
	.long	.L141-.L132
	.long	.L140-.L132
	.long	.L139-.L132
	.long	.L138-.L132
	.long	.L137-.L132
	.long	.L136-.L132
	.long	.L135-.L132
	.long	.L134-.L132
	.long	.L133-.L132
	.long	.L131-.L132
	.text
.L137:
	movq	ASSIGN_SYMBOL(%rip), %rax
	jmp	.L151
.L136:
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L151
.L135:
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L151
.L134:
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L151
.L133:
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L151
.L131:
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax
	jmp	.L151
.L139:
	movq	AND_SYMBOL(%rip), %rax
	jmp	.L151
.L138:
	movq	OR_SYMBOL(%rip), %rax
	jmp	.L151
.L145:
	movq	EQ_SYMBOL(%rip), %rax
	jmp	.L151
.L144:
	movq	NE_SYMBOL(%rip), %rax
	jmp	.L151
.L143:
	movq	LT_SYMBOL(%rip), %rax
	jmp	.L151
.L142:
	movq	GT_SYMBOL(%rip), %rax
	jmp	.L151
.L141:
	movq	LE_SYMBOL(%rip), %rax
	jmp	.L151
.L140:
	movq	GE_SYMBOL(%rip), %rax
	jmp	.L151
.L150:
	movq	ADD_SYMBOL(%rip), %rax
	jmp	.L151
.L149:
	movq	SUB_SYMBOL(%rip), %rax
	jmp	.L151
.L148:
	movq	MUL_SYMBOL(%rip), %rax
	jmp	.L151
.L147:
	movq	DIV_SYMBOL(%rip), %rax
	jmp	.L151
.L146:
	movq	MOD_SYMBOL(%rip), %rax
	jmp	.L151
.L130:
	movl	$0, %eax
.L151:
	popq	%rbp
	ret
	.size	operator_to_string, .-operator_to_string
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

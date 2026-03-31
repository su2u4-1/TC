	.file	"D:\\TC\\src\\helper.c"
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.def	create_node;	.scl	3;	.type	32;	.endef
create_node:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L6
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L5
.L6:
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_node
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L8
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L5
.L8:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L5:
	leave
	ret
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L10
	movl	$0, %eax
	jmp	.L11
.L10:
	call	create_list
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
.L11:
	leave
	ret
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L13
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L14
.L13:
	movl	$0, %eax
	jmp	.L15
.L14:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L16
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
.L16:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
.L15:
	leave
	ret
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L18
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L19
.L18:
	movl	$0, %eax
	jmp	.L20
.L19:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L21
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-24(%rbp), %rax
	jmp	.L20
.L21:
	movq	16(%rbp), %rax
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
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L23
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
.L20:
	leave
	ret
	.globl	list_is_empty
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
list_is_empty:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L25
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L25
	movq	16(%rbp), %rax
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
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Warning: Creating symbol with unknown SymbolType: %d\12\0"
	.align 8
.LC2:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.align 8
.LC3:
	.ascii "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %d\12\0"
	.align 8
.LC4:
	.ascii "Warning: Creating symbol '%s' with NULL scope, kind: %d, id: %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$88, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -40(%rbp)
	cmpl	$6, 24(%rbp)
	ja	.L30
	cmpl	$3, 24(%rbp)
	jnb	.L31
	cmpl	$2, 24(%rbp)
	je	.L32
	cmpl	$2, 24(%rbp)
	ja	.L30
	cmpl	$0, 24(%rbp)
	je	.L33
	cmpl	$1, 24(%rbp)
	je	.L34
	jmp	.L30
.L33:
	movq	40(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L35
.L34:
	movq	40(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L35
.L32:
	movq	40(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L35
.L31:
	movq	40(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L35
.L30:
	call	__getreent
	movq	24(%rax), %rax
	movl	24(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L35:
	movq	16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L36
	movq	id_counter.0(%rip), %rax
	leaq	1(%rax), %rsi
	movq	-48(%rbp), %rax
	movq	16(%rax), %rbx
	movq	-48(%rbp), %rax
	movl	32(%rax), %edi
	call	__getreent
	movq	24(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movl	%edi, %r9d
	movq	%rdx, %r8
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L36:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	id_counter.0(%rip), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-56(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 32(%rax)
	movq	-56(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	cmpl	$6, 24(%rbp)
	ja	.L37
	cmpl	$3, 24(%rbp)
	jnb	.L38
	cmpl	$2, 24(%rbp)
	je	.L39
	cmpl	$2, 24(%rbp)
	ja	.L37
	cmpl	$0, 24(%rbp)
	je	.L40
	cmpl	$1, 24(%rbp)
	je	.L41
	jmp	.L37
.L40:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L41:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L39:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L38:
	movq	-56(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	jmp	.L42
.L37:
	call	__getreent
	movq	24(%rax), %rax
	movl	24(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
.L42:
	cmpq	$0, -40(%rbp)
	jne	.L43
	movq	-56(%rbp), %rax
	movq	16(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movl	24(%rbp), %ecx
	movq	16(%rbp), %rdx
	movq	%rbx, 32(%rsp)
	movl	%ecx, %r9d
	movq	%rdx, %r8
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L44
.L43:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L44:
	movq	-56(%rbp), %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	call	create_list
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	leave
	ret
	.globl	search_name_use_strcmp
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	jmp	.L49
.L54:
	movq	16(%rbp), %rax
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
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	strcmp
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
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 16(%rbp)
.L49:
	cmpq	$0, 16(%rbp)
	jne	.L54
	movl	$0, %eax
.L52:
	leave
	ret
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	jmp	.L56
.L61:
	movq	16(%rbp), %rax
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
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	string_equal
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
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 16(%rbp)
.L56:
	cmpq	$0, 16(%rbp)
	jne	.L61
	movl	$0, %eax
.L59:
	leave
	ret
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L63
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L63
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L63
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L63
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
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
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rbx
	movq	24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rsi
	call	__getreent
	movq	24(%rax), %rax
	movq	32(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	%rdx, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%rsi, %r9
	movq	%rcx, %r8
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.def	set_bool_list;	.scl	3;	.type	32;	.endef
set_bool_list:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %eax
	movb	%al, 32(%rbp)
	movq	24(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	cmpb	$0, 32(%rbp)
	je	.L69
	movq	24(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	orb	-1(%rbp), %al
	jmp	.L70
.L69:
	movq	24(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	andb	-1(%rbp), %al
.L70:
	movq	24(%rbp), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	movq	16(%rbp), %rdx
	addq	%rcx, %rdx
	movb	%al, (%rdx)
	nop
	leave
	ret
	.def	get_bool_list;	.scl	3;	.type	32;	.endef
get_bool_list:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	24(%rbp), %rax
	andl	$7, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	setne	%al
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC6:
	.ascii "\342\224\202   \0"
.LC7:
	.ascii "    \0"
.LC8:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC9:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
indention:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, %eax
	movq	%r9, 40(%rbp)
	movb	%al, 32(%rbp)
	movq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpb	$0, 32(%rbp)
	sete	%al
	movzbl	%al, %edx
	movq	-16(%rbp), %rax
	leaq	11(%rax), %rcx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	set_bool_list
	movq	$1, -8(%rbp)
	jmp	.L74
.L77:
	movq	-16(%rbp), %rax
	leaq	11(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	call	get_bool_list
	testb	%al, %al
	je	.L75
	leaq	.LC6(%rip), %rax
	jmp	.L76
.L75:
	leaq	.LC7(%rip), %rax
.L76:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
	addq	$1, -8(%rbp)
.L74:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L77
	cmpq	$0, 24(%rbp)
	je	.L81
	cmpb	$0, 32(%rbp)
	je	.L79
	leaq	.LC8(%rip), %rax
	jmp	.L80
.L79:
	leaq	.LC9(%rip), %rax
.L80:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
.L81:
	nop
	leave
	ret
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rcx, 16(%rbp)
	movl	$48, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 9(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 10(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.section .rdata,"dr"
.LC10:
	.ascii "\0"
.LC11:
	.ascii "%s.tc\0"
.LC12:
	.ascii "D:/TC/std/\0"
.LC13:
	.ascii "r\0"
	.align 8
.LC14:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC15:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC16:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC17:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC18:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	addq	$-128, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -24(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.L85
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	$4, %rax
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-48(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	absolute_path
	movq	%rax, -32(%rbp)
	jmp	.L86
.L85:
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	absolute_path
	movq	%rax, -32(%rbp)
.L86:
	movq	-32(%rbp), %rax
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L87
	call	__getreent
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L96
.L87:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	$0, -104(%rbp)
	leaq	-104(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	read_source
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	create_file
	movq	%rax, %rcx
	call	create_parser
	movq	%rax, %rsi
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rbx
	movq	-104(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	create_lexer
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rax, -72(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	printf
	cmpq	$0, -72(%rbp)
	jne	.L89
	call	__getreent
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
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
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	string_equal
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
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L95
.L94:
	call	__getreent
	movq	24(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC18(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L95:
	movq	-24(%rbp), %rax
.L96:
	subq	$-128, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC19:
	.ascii "%s.%s\0"
	.text
	.globl	make_method_name
	.def	make_method_name;	.scl	2;	.type	32;	.endef
make_method_name:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rbx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	%rbx, %rax
	addq	$2, %rax
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	create_string
	movq	%rax, -24(%rbp)
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	ret
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rcx, 16(%rbp)
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L100
	movl	$13, %eax
	jmp	.L101
.L100:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L102
	movl	$14, %eax
	jmp	.L101
.L102:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L103
	movl	$15, %eax
	jmp	.L101
.L103:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L104
	movl	$16, %eax
	jmp	.L101
.L104:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L105
	movl	$17, %eax
	jmp	.L101
.L105:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L106
	movl	$18, %eax
	jmp	.L101
.L106:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L107
	movl	$11, %eax
	jmp	.L101
.L107:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L108
	movl	$12, %eax
	jmp	.L101
.L108:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L109
	movl	$5, %eax
	jmp	.L101
.L109:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L110
	movl	$6, %eax
	jmp	.L101
.L110:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L111
	movl	$7, %eax
	jmp	.L101
.L111:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L112
	movl	$8, %eax
	jmp	.L101
.L112:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L113
	movl	$9, %eax
	jmp	.L101
.L113:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L114
	movl	$10, %eax
	jmp	.L101
.L114:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L115
	movl	$0, %eax
	jmp	.L101
.L115:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L116
	movl	$1, %eax
	jmp	.L101
.L116:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L117
	movl	$2, %eax
	jmp	.L101
.L117:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L118
	movl	$3, %eax
	jmp	.L101
.L118:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L119
	movl	$4, %eax
	jmp	.L101
.L119:
	movl	$19, %eax
.L101:
	leave
	ret
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L121
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L123(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L123(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L130
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L132(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L132(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L136:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L135:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L134:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L133:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L131:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L139:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L138:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L145:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L144:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L143:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L142:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L141:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L140:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L150:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L149:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L148:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L147:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L146:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L151
.L130:
	movl	$0, %eax
.L151:
	popq	%rbp
	ret
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
	.section	.rdata$.refptr.VOID_KEYWORD, "dr"
	.globl	.refptr.VOID_KEYWORD
	.linkonce	discard
.refptr.VOID_KEYWORD:
	.quad	VOID_KEYWORD
	.section	.rdata$.refptr.BOOL_KEYWORD, "dr"
	.globl	.refptr.BOOL_KEYWORD
	.linkonce	discard
.refptr.BOOL_KEYWORD:
	.quad	BOOL_KEYWORD
	.section	.rdata$.refptr.STRING_KEYWORD, "dr"
	.globl	.refptr.STRING_KEYWORD
	.linkonce	discard
.refptr.STRING_KEYWORD:
	.quad	STRING_KEYWORD
	.section	.rdata$.refptr.FLOAT_KEYWORD, "dr"
	.globl	.refptr.FLOAT_KEYWORD
	.linkonce	discard
.refptr.FLOAT_KEYWORD:
	.quad	FLOAT_KEYWORD
	.section	.rdata$.refptr.INT_KEYWORD, "dr"
	.globl	.refptr.INT_KEYWORD
	.linkonce	discard
.refptr.INT_KEYWORD:
	.quad	INT_KEYWORD

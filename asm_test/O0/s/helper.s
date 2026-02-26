	.file	"D:\\TC\\src\\helper.c"
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
	.seh_proc	create_list
create_list:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
	.seh_proc	create_node
create_node:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
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
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
	.seh_proc	list_append
list_append:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	create_node
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L6
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L8
.L6:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L8:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.seh_proc	list_copy
list_copy:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
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
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	list_pop
list_pop:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	movl	$0, %eax
	jmp	.L13
.L12:
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
	jne	.L14
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
.L14:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
.L13:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Warning: Name '%s' already exists in the current scope, returning existing name, kind: \0"
.LC1:
	.ascii "type\12\0"
.LC2:
	.ascii "variable\12\0"
.LC3:
	.ascii "function\12\0"
.LC4:
	.ascii "method\12\0"
.LC5:
	.ascii "class\12\0"
.LC6:
	.ascii "attribute\12\0"
.LC7:
	.ascii "unknown\12\0"
	.align 8
.LC8:
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %d\12\0"
	.align 8
.LC9:
	.ascii "Error creating name: unknown NameType %d\12\0"
	.text
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
	.seh_proc	create_name
create_name:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rdx
	movq	48(%rbp), %rax
	movq	%rax, %rcx
	call	search
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L16
	call	__getreent
	movq	24(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-8(%rbp), %rax
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
	jmp	*%rax
	.section .rdata,"dr"
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
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L16
.L23:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L16
.L22:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L16
.L21:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L16
.L20:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L16
.L18:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	jmp	.L16
.L17:
	call	__getreent
	movq	24(%rax), %rax
	movq	%rax, %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	nop
.L16:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	id_counter.0(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 24(%rax)
	cmpl	$1, 24(%rbp)
	je	.L25
	cmpl	$5, 24(%rbp)
	je	.L25
	cmpl	$2, 24(%rbp)
	je	.L25
	cmpl	$3, 24(%rbp)
	jne	.L26
.L25:
	cmpq	$0, 32(%rbp)
	je	.L26
	movq	-16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L27
.L26:
	cmpl	$4, 24(%rbp)
	jne	.L28
	cmpq	$0, 40(%rbp)
	je	.L28
	movq	-16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L27
.L28:
	cmpl	$0, 24(%rbp)
	jne	.L29
	movq	-16(%rbp), %rax
	movq	$0, 16(%rax)
	jmp	.L27
.L29:
	cmpq	$0, 32(%rbp)
	jne	.L30
	cmpq	$0, 40(%rbp)
	jne	.L30
	cmpl	$0, 24(%rbp)
	je	.L30
	call	__getreent
	movq	24(%rax), %rax
	movl	24(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L31
.L30:
	call	__getreent
	movq	24(%rax), %rax
	movl	24(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L31:
	movl	$0, %eax
	jmp	.L32
.L27:
	movq	48(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	movq	-16(%rbp), %rax
.L32:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.seh_proc	create_scope
create_scope:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	call	create_list
	movq	-16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
	.seh_proc	search
search:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L36
.L41:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L37
.L40:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L38
	movq	-40(%rbp), %rax
	jmp	.L39
.L38:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
.L37:
	cmpq	$0, -16(%rbp)
	jne	.L40
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L36:
	cmpq	$0, -8(%rbp)
	jne	.L41
	movl	$0, %eax
.L39:
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_builtin_type
is_builtin_type:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L43
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L43
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L43
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L43
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L44
.L43:
	movl	$1, %eax
	jmp	.L45
.L44:
	movl	$0, %eax
.L45:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_type
is_type:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
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
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.seh_proc	parser_error
parser_error:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	40(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rsi
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	leaq	1(%rax), %rbx
	call	__getreent
	movq	24(%rax), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.def	set_bool_list;	.scl	3;	.type	32;	.endef
	.seh_proc	set_bool_list
set_bool_list:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
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
	je	.L54
	movq	24(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	movq	24(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	%ecx, %eax
	orb	-1(%rbp), %al
	movb	%al, (%rdx)
	jmp	.L56
.L54:
	movq	24(%rbp), %rax
	andl	$7, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	movq	24(%rbp), %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	movq	16(%rbp), %rdx
	addq	%rcx, %rdx
	andb	-1(%rbp), %al
	movb	%al, (%rdx)
.L56:
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	get_bool_list;	.scl	3;	.type	32;	.endef
	.seh_proc	get_bool_list
get_bool_list:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
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
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "\342\224\202   \0"
.LC12:
	.ascii "    \0"
.LC13:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC14:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
	.seh_proc	indention
indention:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
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
	leaq	3(%rax), %rcx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	set_bool_list
	movq	$1, -8(%rbp)
	jmp	.L60
.L63:
	movq	-16(%rbp), %rax
	leaq	3(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	call	get_bool_list
	testb	%al, %al
	je	.L61
	leaq	.LC11(%rip), %rax
	jmp	.L62
.L61:
	leaq	.LC12(%rip), %rax
.L62:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
	addq	$1, -8(%rbp)
.L60:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L63
	cmpq	$0, 24(%rbp)
	je	.L67
	cmpb	$0, 32(%rbp)
	je	.L65
	leaq	.LC13(%rip), %rax
	jmp	.L66
.L65:
	leaq	.LC14(%rip), %rax
.L66:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
.L67:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.seh_proc	create_parser
create_parser:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$35, %ecx
	call	alloc_memory
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
	movq	-16(%rbp), %rax
	movb	$0, 1(%rax)
	movq	-16(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC15:
	.ascii "print\0"
.LC16:
	.ascii "arr\0"
	.align 8
.LC17:
	.ascii "Error: Standard library file for import not found: %s\12\0"
.LC18:
	.ascii "/\0"
.LC19:
	.ascii ".tc\0"
.LC20:
	.ascii "r\0"
	.align 8
.LC21:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC22:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC23:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC24:
	.ascii "Error parsing library file for import: %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_import_file
parse_import_file:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$1152, %rsp
	.seh_stackalloc	1152
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 1056(%rbp)
	movq	%rdx, 1064(%rbp)
	movq	%r8, 1072(%rbp)
	movq	$0, 1016(%rbp)
	movb	$0, -80(%rbp)
	cmpq	$0, 1064(%rbp)
	jne	.L71
	movq	1056(%rbp), %rax
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L72
	leaq	-80(%rbp), %rax
	movabsq	$8246143026212319022, %rbx
	movq	%rbx, (%rax)
	movabsq	$27993765565065586, %rsi
	movq	%rsi, 7(%rax)
	jmp	.L73
.L72:
	movq	1056(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L74
	leaq	-80(%rbp), %rax
	movabsq	$8241920901561659182, %rbx
	movq	%rbx, (%rax)
	movabsq	$27993765531771183, %rsi
	movq	%rsi, 5(%rax)
	jmp	.L73
.L74:
	call	__getreent
	movq	24(%rax), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L83
.L71:
	movq	1064(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1024, %edx
	movq	%rax, %rcx
	call	string_append
	leaq	-80(%rbp), %rdx
	leaq	-80(%rbp), %rax
	leaq	.LC18(%rip), %r9
	movq	%rdx, %r8
	movl	$1024, %edx
	movq	%rax, %rcx
	call	string_append
	movq	1056(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$1024, %edx
	movq	%rax, %rcx
	call	string_append
	leaq	-80(%rbp), %rdx
	leaq	-80(%rbp), %rax
	leaq	.LC19(%rip), %r9
	movq	%rdx, %r8
	movl	$1024, %edx
	movq	%rax, %rcx
	call	string_append
.L73:
	leaq	-80(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 1000(%rbp)
	cmpq	$0, 1000(%rbp)
	jne	.L76
	call	__getreent
	movq	24(%rax), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L83
.L76:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	$0, -88(%rbp)
	leaq	-88(%rbp), %rdx
	movq	1000(%rbp), %rax
	movq	%rax, %rcx
	call	read_source
	movq	%rax, 992(%rbp)
	movq	1000(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	call	create_parser
	movq	%rax, %rsi
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %rbx
	movq	-88(%rbp), %rdx
	movq	992(%rbp), %rax
	movq	%rax, %rcx
	call	create_lexer
	movq	%rsi, %r8
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rax, 984(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	printf
	cmpq	$0, 984(%rbp)
	jne	.L77
	call	__getreent
	movq	24(%rax), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L83
.L77:
	movq	984(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, 976(%rbp)
	movq	976(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 1008(%rbp)
	jmp	.L78
.L81:
	movq	1008(%rbp), %rax
	movq	%rax, 968(%rbp)
	movq	968(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, 960(%rbp)
	movq	960(%rbp), %rax
	movq	(%rax), %rax
	movq	1056(%rbp), %rdx
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L79
	movq	960(%rbp), %rax
	movq	%rax, 1016(%rbp)
	jmp	.L80
.L79:
	movq	968(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 1008(%rbp)
.L78:
	cmpq	$0, 1008(%rbp)
	jne	.L81
.L80:
	cmpq	$0, 1016(%rbp)
	je	.L82
	movq	1072(%rbp), %rax
	movq	%rax, 952(%rbp)
	movq	952(%rbp), %rax
	movq	8(%rax), %rax
	movq	1016(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L82:
	movq	1016(%rbp), %rax
.L83:
	addq	$1152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.seh_proc	string_to_operator
string_to_operator:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L85
	movl	$13, %eax
	jmp	.L86
.L85:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L87
	movl	$14, %eax
	jmp	.L86
.L87:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L88
	movl	$15, %eax
	jmp	.L86
.L88:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L89
	movl	$16, %eax
	jmp	.L86
.L89:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L90
	movl	$17, %eax
	jmp	.L86
.L90:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L91
	movl	$18, %eax
	jmp	.L86
.L91:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L92
	movl	$11, %eax
	jmp	.L86
.L92:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L93
	movl	$12, %eax
	jmp	.L86
.L93:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L94
	movl	$5, %eax
	jmp	.L86
.L94:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L95
	movl	$6, %eax
	jmp	.L86
.L95:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L96
	movl	$7, %eax
	jmp	.L86
.L96:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L97
	movl	$8, %eax
	jmp	.L86
.L97:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L98
	movl	$9, %eax
	jmp	.L86
.L98:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L99
	movl	$10, %eax
	jmp	.L86
.L99:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L100
	movl	$0, %eax
	jmp	.L86
.L100:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L101
	movl	$1, %eax
	jmp	.L86
.L101:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L102
	movl	$2, %eax
	jmp	.L86
.L102:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L103
	movl	$3, %eax
	jmp	.L86
.L103:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L104
	movl	$4, %eax
	jmp	.L86
.L104:
	movl	$19, %eax
.L86:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_precedence
operator_precedence:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L106
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L108(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L108(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L108:
	.long	.L112-.L108
	.long	.L112-.L108
	.long	.L111-.L108
	.long	.L111-.L108
	.long	.L111-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L109-.L108
	.long	.L109-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.text
.L107:
	movl	$1, %eax
	jmp	.L113
.L109:
	movl	$2, %eax
	jmp	.L113
.L110:
	movl	$3, %eax
	jmp	.L113
.L112:
	movl	$4, %eax
	jmp	.L113
.L111:
	movl	$5, %eax
	jmp	.L113
.L106:
	movl	$0, %eax
.L113:
	popq	%rbp
	ret
	.seh_endproc
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_to_string
operator_to_string:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L115
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L117(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L117(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L117:
	.long	.L135-.L117
	.long	.L134-.L117
	.long	.L133-.L117
	.long	.L132-.L117
	.long	.L131-.L117
	.long	.L130-.L117
	.long	.L129-.L117
	.long	.L128-.L117
	.long	.L127-.L117
	.long	.L126-.L117
	.long	.L125-.L117
	.long	.L124-.L117
	.long	.L123-.L117
	.long	.L122-.L117
	.long	.L121-.L117
	.long	.L120-.L117
	.long	.L119-.L117
	.long	.L118-.L117
	.long	.L116-.L117
	.text
.L122:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L121:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L120:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L119:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L118:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L116:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L124:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L123:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L130:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L129:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L128:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L127:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L126:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L125:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L135:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L134:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L133:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L132:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L131:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L136
.L115:
	movl	$0, %eax
.L136:
	popq	%rbp
	ret
	.seh_endproc
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	string_append;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
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

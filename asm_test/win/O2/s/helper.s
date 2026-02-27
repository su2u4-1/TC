	.file	"D:\\TC\\src\\helper.c"
	.text
	.p2align 4
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
	.seh_proc	create_list
create_list:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	addq	$40, %rsp
	ret
	.seh_endproc
	.p2align 4
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
	.seh_proc	create_node
create_node:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movl	$16, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
	.seh_proc	list_append
list_append:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L7
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.seh_proc	list_copy
list_copy:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movl	$16, %ecx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm1
	movups	%xmm1, (%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	list_pop
list_pop:
	.seh_endprologue
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L9
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L15
.L11:
	movq	8(%rax), %rax
.L9:
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	movq	$0, 8(%rcx)
	jmp	.L11
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "type\12\0"
.LC1:
	.ascii "variable\12\0"
.LC2:
	.ascii "function\12\0"
.LC3:
	.ascii "method\12\0"
.LC4:
	.ascii "class\12\0"
.LC5:
	.ascii "attribute\12\0"
.LC6:
	.ascii "unknown\12\0"
	.align 8
.LC7:
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %d\12\0"
	.align 8
.LC8:
	.ascii "Error creating name: unknown NameType %d\12\0"
	.align 8
.LC9:
	.ascii "Warning: Name '%s' already exists in the current scope, returning existing name, kind: \0"
	.text
	.p2align 4
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
	.seh_proc	create_name
create_name:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	144(%rsp), %r14
	movq	%r14, %r12
	movq	%rcx, %rdi
	movl	%edx, %ebp
	movq	%r8, %r13
	movq	%r9, %r15
	testq	%r14, %r14
	je	.L18
.L17:
	movq	8(%r12), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L21
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L60:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L19
.L21:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L60
	call	__getreent
	movq	%rdi, %r8
	leaq	.LC9(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	cmpl	$5, 24(%rsi)
	ja	.L29
	movl	24(%rsi), %eax
	leaq	.L40(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L40:
	.long	.L23-.L40
	.long	.L24-.L40
	.long	.L25-.L40
	.long	.L26-.L40
	.long	.L27-.L40
	.long	.L28-.L40
	.text
.L23:
	call	__getreent
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L18:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rdi, (%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 24(%rbx)
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	movl	%ebp, %eax
	andl	$-5, %eax
	cmpl	$1, %eax
	je	.L30
	leal	-2(%rbp), %eax
	cmpl	$1, %eax
	jbe	.L30
	cmpl	$4, %ebp
	jne	.L34
	testq	%r15, %r15
	je	.L34
	movq	%r15, 16(%rbx)
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L30:
	testq	%r13, %r13
	je	.L32
	movq	%r13, 16(%rbx)
.L33:
	movq	8(%r14), %rsi
	movl	$16, %ecx
	call	alloc_memory
	cmpq	$0, (%rsi)
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	je	.L61
	movq	8(%rsi), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rsi)
.L16:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L17
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L61:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	jmp	.L16
.L24:
	call	__getreent
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L18
.L25:
	call	__getreent
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L18
.L26:
	call	__getreent
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L18
.L27:
	call	__getreent
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L18
.L28:
	call	__getreent
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L18
.L29:
	call	__getreent
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L32:
	orq	%r15, %r13
	jne	.L35
	call	__getreent
	movl	%ebp, %r8d
	leaq	.LC7(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L16
.L34:
	testl	%ebp, %ebp
	jne	.L32
	movq	$0, 16(%rbx)
	jmp	.L33
.L35:
	call	__getreent
	movl	%ebp, %r8d
	leaq	.LC8(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L16
	.seh_endproc
	.p2align 4
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.seh_proc	create_scope
create_scope:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	movl	$16, %ecx
	call	alloc_memory
	movl	$16, %ecx
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
	.seh_proc	search
search:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	testq	%rcx, %rcx
	je	.L64
.L68:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L67
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L77:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L65
.L67:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L77
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L65:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L68
.L64:
	xorl	%esi, %esi
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.p2align 4
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_builtin_type
is_builtin_type:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rcx, %rbx
	call	string_equal
	testb	%al, %al
	je	.L79
.L81:
	movl	$1, %eax
.L78:
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L79:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L81
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L81
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L81
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	jmp	.L78
	.seh_endproc
	.p2align 4
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_type
is_type:
	.seh_endprologue
	testl	$-5, 24(%rcx)
	sete	%al
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.p2align 4
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.seh_proc	parser_error
parser_error:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	16(%rdx), %rax
	movq	8(%rdx), %rbx
	leaq	1(%rax), %rsi
	addq	$1, %rbx
	movq	%rcx, %rdi
	call	__getreent
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rdi, 32(%rsp)
	call	fprintf
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
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
	.p2align 4
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
	.seh_proc	indention
indention:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$1, %eax
	movq	%rdx, %rsi
	movq	%rcx, %rbp
	leaq	3(%r9), %rdi
	shrq	$3, %rdx
	movl	%esi, %ecx
	movl	%r8d, %r14d
	addq	%rdi, %rdx
	andl	$7, %ecx
	movzbl	(%rdx), %r8d
	sall	%cl, %eax
	testb	%r14b, %r14b
	jne	.L85
	orl	%eax, %r8d
	movb	%r8b, (%rdx)
	cmpq	$1, %rsi
	jbe	.L96
.L86:
	movl	$1, %ebx
	leaq	.LC12(%rip), %r13
	leaq	.LC11(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L92:
	movq	%rbx, %rax
	movl	%ebx, %ecx
	movq	%r12, %rdx
	shrq	$3, %rax
	andl	$7, %ecx
	movsbl	(%rdi,%rax), %eax
	sarl	%cl, %eax
	movq	%rbp, %rcx
	testb	$1, %al
	cmove	%r13, %rdx
	addq	$1, %rbx
	call	fprintf
	cmpq	%rbx, %rsi
	jne	.L92
	testb	%r14b, %r14b
	je	.L87
.L89:
	leaq	.LC13(%rip), %rdx
.L93:
	movq	%rbp, %rcx
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L85:
	notl	%eax
	andl	%r8d, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rsi
	ja	.L86
	testq	%rsi, %rsi
	jne	.L89
.L84:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L96:
	testq	%rsi, %rsi
	je	.L84
	.p2align 4,,10
	.p2align 3
.L87:
	leaq	.LC14(%rip), %rdx
	jmp	.L93
	.seh_endproc
	.p2align 4
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.seh_proc	create_parser
create_parser:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	$35, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movw	%dx, (%rax)
	movb	$0, 2(%rax)
	addq	$40, %rsp
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
	.p2align 4
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_import_file
parse_import_file:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$1080, %rsp
	.seh_stackalloc	1080
	.seh_endprologue
	movb	$0, 48(%rsp)
	movq	%rcx, %rdi
	movq	%rdx, %r9
	movq	%r8, %rbp
	testq	%rdx, %rdx
	je	.L118
	leaq	48(%rsp), %rbx
	movl	$1024, %edx
	movq	%rbx, %r8
	movq	%rbx, %rcx
	call	string_append
	movq	%rbx, %r8
	movl	$1024, %edx
	movq	%rbx, %rcx
	leaq	.LC18(%rip), %r9
	call	string_append
	movq	%rdi, %r9
	movq	%rbx, %r8
	movl	$1024, %edx
	movq	%rbx, %rcx
	call	string_append
	movq	%rbx, %r8
	movl	$1024, %edx
	movq	%rbx, %rcx
	leaq	.LC19(%rip), %r9
	call	string_append
.L101:
	leaq	.LC20(%rip), %rdx
	movq	%rbx, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L119
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rcx
	call	printf
	leaq	40(%rsp), %rdx
	movq	%rsi, %rcx
	movq	$0, 40(%rsp)
	call	read_source
	movq	%rsi, %rcx
	movq	%rax, %r12
	call	fclose
	movl	$35, %ecx
	call	alloc_memory
	movq	%r12, %rcx
	movq	%rax, %rsi
	xorl	%eax, %eax
	movw	%ax, (%rsi)
	movq	.refptr.builtin_scope(%rip), %rax
	movb	$0, 2(%rsi)
	movq	40(%rsp), %rdx
	movq	(%rax), %r13
	call	create_lexer
	movq	%rsi, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rbx, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %rsi
	call	printf
	testq	%rsi, %rsi
	je	.L120
	movq	8(%rsi), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L109
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L121:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L103
.L109:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L121
	movq	8(%rbp), %rbx
	movl	$16, %ecx
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L122
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L98:
	movq	%rsi, %rax
	addq	$1080, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	leaq	.LC15(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L123
	leaq	.LC16(%rip), %rdx
	movq	%rdi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L102
	movabsq	$8241920901561659182, %rax
	leaq	48(%rsp), %rbx
	movq	%rax, 48(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 53(%rsp)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L123:
	movabsq	$8246143026212319022, %rax
	leaq	48(%rsp), %rbx
	movq	%rax, 48(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 55(%rsp)
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L122:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L119:
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L103:
	xorl	%esi, %esi
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L102:
	call	__getreent
	leaq	48(%rsp), %r8
	leaq	.LC17(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L98
.L120:
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC24(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L98
	.seh_endproc
	.p2align 4
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.seh_proc	string_to_operator
string_to_operator:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rcx, %rbx
	call	string_equal
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L124
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L142
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L143
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L124:
	addq	$32, %rsp
	popq	%rbx
	ret
.L142:
	movl	$2, %eax
	jmp	.L124
.L143:
	movl	$3, %eax
	jmp	.L124
	.seh_endproc
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_precedence
operator_precedence:
	.seh_endprologue
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L145
	movl	%ecx, %ecx
	leaq	CSWTCH.49(%rip), %rax
	movl	(%rax,%rcx,4), %eax
.L145:
	ret
	.seh_endproc
	.section	.text.unlikely,"x"
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_to_string
operator_to_string:
	.seh_endprologue
	cmpl	$18, %ecx
	ja	.L170
	leaq	.L151(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L151:
	.long	.L169-.L151
	.long	.L168-.L151
	.long	.L167-.L151
	.long	.L166-.L151
	.long	.L165-.L151
	.long	.L164-.L151
	.long	.L163-.L151
	.long	.L162-.L151
	.long	.L161-.L151
	.long	.L160-.L151
	.long	.L159-.L151
	.long	.L158-.L151
	.long	.L157-.L151
	.long	.L156-.L151
	.long	.L155-.L151
	.long	.L154-.L151
	.long	.L153-.L151
	.long	.L152-.L151
	.long	.L150-.L151
	.text
	.p2align 4,,10
	.p2align 3
.L152:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
.L148:
	ret
	.p2align 4,,10
	.p2align 3
.L153:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L154:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L155:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L156:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L157:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L159:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L160:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L161:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L162:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L164:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L167:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L169:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L150:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.seh_endproc
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
	.seh_proc	operator_to_string.cold
	.seh_endprologue
operator_to_string.cold:
.L170:
	xorl	%eax, %eax
	jmp	.L148
	.text
	.section	.text.unlikely,"x"
	.seh_endproc
.LCOLDE25:
	.text
.LHOTE25:
	.section .rdata,"dr"
	.align 32
CSWTCH.49:
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
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_append;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
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

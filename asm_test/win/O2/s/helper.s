	.file	"D:\\TC\\src\\helper.c"
	.text
	.p2align 4
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	pushq	%rbp
	movl	$16, %ecx
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	leave
	ret
	.p2align 4
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
create_node:
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$16, %ecx
	subq	$32, %rsp
	call	alloc_memory
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$16, %ecx
	subq	$40, %rsp
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L10
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rax, (%rbx)
	movq	%rax, 8(%rbx)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$16, %ecx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movdqu	(%rbx), %xmm1
	movq	-8(%rbp), %rbx
	movups	%xmm1, (%rax)
	leave
	ret
	.p2align 4
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L13
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L19
.L15:
	movq	8(%rax), %rax
.L13:
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	movq	$0, 8(%rcx)
	jmp	.L15
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
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %u\12\0"
	.align 8
.LC8:
	.ascii "Error creating name: unknown NameType %u\12\0"
	.align 8
.LC9:
	.ascii "Warning: Name '%s' already exists in the current scope, returning existing name, kind: \0"
	.text
	.p2align 4
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
create_name:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	pushq	%rdi
	movl	%edx, %edi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	movq	48(%rbp), %r14
	movq	%r9, 40(%rbp)
	testq	%r14, %r14
	je	.L22
	movq	%r14, %r12
.L21:
	movq	8(%r12), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L25
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L65:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L23
.L25:
	movq	8(%rbx), %r15
	movq	%rsi, %rdx
	movq	(%r15), %rcx
	call	string_equal
	testb	%al, %al
	je	.L65
	call	__getreent
	movq	%rsi, %r8
	leaq	.LC9(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	cmpl	$5, 24(%r15)
	ja	.L33
	movl	24(%r15), %eax
	leaq	.L44(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	call	__getreent
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	.p2align 4,,10
	.p2align 3
.L22:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%edi, 24(%rbx)
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	movl	%edi, %eax
	andl	$-5, %eax
	cmpl	$1, %eax
	je	.L34
	leal	-2(%rdi), %eax
	cmpl	$1, %eax
	jbe	.L34
	cmpl	$4, %edi
	jne	.L38
	cmpq	$0, 40(%rbp)
	je	.L38
	movq	40(%rbp), %rax
	movq	%rax, 16(%rbx)
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L34:
	testq	%r13, %r13
	je	.L36
	movq	%r13, 16(%rbx)
.L37:
	movq	8(%r14), %rsi
	movl	$16, %ecx
	call	alloc_memory
	cmpq	$0, (%rsi)
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	je	.L66
	movq	8(%rsi), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rsi)
.L20:
	leaq	-56(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L21
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L66:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	jmp	.L20
.L28:
	call	__getreent
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L22
.L29:
	call	__getreent
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L22
.L30:
	call	__getreent
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L22
.L31:
	call	__getreent
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L22
.L32:
	call	__getreent
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L22
.L33:
	call	__getreent
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L36:
	orq	40(%rbp), %r13
	jne	.L39
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC7(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L20
.L38:
	testl	%edi, %edi
	jne	.L36
	movq	$0, 16(%rbx)
	jmp	.L37
.L39:
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC8(%rip), %rdx
	xorl	%ebx, %ebx
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L20
	.p2align 4
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
create_scope:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	movq	%rcx, %rsi
	movl	$16, %ecx
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	call	alloc_memory
	movl	$16, %ecx
	movq	%rsi, (%rax)
	movq	%rax, %rbx
	call	alloc_memory
	pxor	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	movq	%rax, 8(%rbx)
	leaq	-16(%rbp), %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
search:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L70
	movq	%rcx, %rbp
	movq	%rdx, %rdi
.L74:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L73
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L84:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L71
.L73:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L84
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L71:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L74
.L70:
	addq	$40, %rsp
	xorl	%esi, %esi
	popq	%rbx
	movq	%rsi, %rax
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	je	.L86
.L88:
	movl	$1, %eax
.L85:
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L88
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L88
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L88
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	jmp	.L85
	.p2align 4
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
is_type:
	testl	$-5, 24(%rcx)
	sete	%al
	ret
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.p2align 4
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	16(%rdx), %rax
	movq	8(%rdx), %rbx
	leaq	1(%rax), %rsi
	addq	$1, %rbx
	call	__getreent
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC10(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rdi, 32(%rsp)
	call	fprintf
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
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
indention:
	pushq	%r14
	movl	$1, %eax
	movl	%r8d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	leaq	3(%r9), %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	shrq	$3, %rdx
	pushq	%rbx
	movl	%esi, %ecx
	addq	%rdi, %rdx
	andl	$7, %ecx
	sall	%cl, %eax
	subq	$32, %rsp
	movzbl	(%rdx), %r8d
	testb	%r14b, %r14b
	jne	.L94
	orl	%eax, %r8d
	movb	%r8b, (%rdx)
	cmpq	$1, %rsi
	jbe	.L106
.L95:
	movl	$1, %ebx
	leaq	.LC12(%rip), %r13
	leaq	.LC11(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L101:
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
	jne	.L101
	testb	%r14b, %r14b
	je	.L96
.L98:
	leaq	.LC13(%rip), %rdx
.L102:
	addq	$32, %rsp
	movq	%rbp, %rcx
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
.L94:
	notl	%eax
	andl	%r8d, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rsi
	ja	.L95
	testq	%rsi, %rsi
	jne	.L98
.L93:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L106:
	testq	%rsi, %rsi
	je	.L93
	.p2align 4,,10
	.p2align 3
.L96:
	leaq	.LC14(%rip), %rdx
	jmp	.L102
	.p2align 4
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	subq	$40, %rsp
	movl	$35, %ecx
	call	alloc_memory
	xorl	%edx, %edx
	movw	%dx, (%rax)
	movb	$0, 2(%rax)
	addq	$40, %rsp
	ret
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
parse_import_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$1072, %rsp
	movb	$0, 48(%rsp)
	testq	%rdx, %rdx
	je	.L130
	leaq	48(%rsp), %rbx
	movq	%rdx, %r9
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
.L112:
	leaq	.LC20(%rip), %rdx
	movq	%rbx, %rcx
	call	fopen
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L131
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rcx
	call	printf
	leaq	40(%rsp), %rdx
	movq	%rsi, %rcx
	movq	$0, 40(%rsp)
	call	read_source
	movq	%rsi, %rcx
	movq	%rax, %r13
	call	fclose
	movl	$35, %ecx
	call	alloc_memory
	movq	%r13, %rcx
	movq	%rax, %rsi
	xorl	%eax, %eax
	movw	%ax, (%rsi)
	movq	.refptr.builtin_scope(%rip), %rax
	movb	$0, 2(%rsi)
	movq	40(%rsp), %rdx
	movq	(%rax), %r14
	call	create_lexer
	movq	%rsi, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rbx, %rdx
	leaq	.LC23(%rip), %rcx
	movq	%rax, %rsi
	call	printf
	testq	%rsi, %rsi
	je	.L132
	movq	8(%rsi), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L120
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L133:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L114
.L120:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L133
	movq	8(%r12), %rbx
	movl	$16, %ecx
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L134
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L109:
	leaq	-48(%rbp), %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L130:
	leaq	.LC15(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L135
	leaq	.LC16(%rip), %rdx
	movq	%rdi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L113
	movabsq	$8241920901561659182, %rax
	leaq	48(%rsp), %rbx
	movq	%rax, 48(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 53(%rsp)
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L135:
	movabsq	$8246143026212319022, %rax
	leaq	48(%rsp), %rbx
	movq	%rax, 48(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 55(%rsp)
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L134:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L131:
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC21(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L114:
	xorl	%esi, %esi
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L113:
	call	__getreent
	leaq	48(%rsp), %r8
	leaq	.LC17(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L109
.L132:
	call	__getreent
	movq	%rbx, %r8
	leaq	.LC24(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L109
	.p2align 4
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx
	movq	%rcx, %rbx
	subq	$32, %rsp
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L136
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L154
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L155
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L136:
	addq	$32, %rsp
	popq	%rbx
	ret
.L154:
	movl	$2, %eax
	jmp	.L136
.L155:
	movl	$3, %eax
	jmp	.L136
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L158
	movl	%ecx, %ecx
	leaq	CSWTCH.49(%rip), %rax
	movl	(%rax,%rcx,4), %eax
.L158:
	ret
	.section	.text.unlikely,"x"
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	cmpl	$18, %ecx
	ja	.L183
	leaq	.L164(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
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
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L167:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L169:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L170:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L172:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L173:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L175:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L176:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L177:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L178:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L179:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L180:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L182:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
operator_to_string.cold:
.L183:
	xorl	%eax, %eax
	ret
	.text
	.section	.text.unlikely,"x"
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

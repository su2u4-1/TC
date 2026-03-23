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
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.p2align 4
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$32, %rsp
	testq	%rcx, %rcx
	je	.L9
	movq	%rcx, %rbx
	movl	$16, %ecx
	movq	%rdx, %rsi
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L10
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	jmp	fwrite
	.p2align 4
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	testq	%rcx, %rcx
	je	.L13
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
	.p2align 4,,10
	.p2align 3
.L13:
	xorl	%eax, %eax
	ret
	.p2align 4
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	testq	%rcx, %rcx
	je	.L21
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L18
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L25
	movq	8(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	xorl	%eax, %eax
.L18:
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	movq	$0, 8(%rcx)
	movq	8(%rax), %rax
	ret
	.p2align 4
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	testq	%rcx, %rcx
	je	.L29
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L26
	movq	8(%rcx), %rdx
	cmpq	%rdx, %rax
	je	.L36
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%rax, %r8
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L28
	movq	8(%rax), %rax
	movq	$0, (%r8)
	movq	%r8, 8(%rcx)
.L26:
	leave
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	pxor	%xmm0, %xmm0
	movq	8(%rax), %rax
	movups	%xmm0, (%rcx)
	leave
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	leave
	xorl	%eax, %eax
	ret
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.p2align 4
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	movq	%r8, %r15
	pushq	%r14
	movl	%edx, %r14d
	pushq	%r13
	pushq	%r12
	movq	%r9, %r12
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	testq	%r9, %r9
	je	.L49
	movq	%r9, %r13
.L42:
	movq	8(%r13), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L41
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L62:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L39
.L41:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	16(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L62
	movq	id_counter.0(%rip), %rax
	movq	24(%rsi), %r13
	movl	32(%rsi), %esi
	leaq	1(%rax), %rbx
	call	__getreent
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 40(%rsp)
	movq	%r13, 32(%rsp)
	call	fprintf
.L49:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rdi, 16(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%r14d, 32(%rbx)
	addq	$1, %rax
	movq	%r15, (%rbx)
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 24(%rbx)
	movq	%r12, 8(%rbx)
	cmpl	$1, %r14d
	jbe	.L63
	movq	8(%r12), %rsi
	testq	%rsi, %rsi
	je	.L59
.L47:
	movl	$16, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	cmpq	$0, (%rsi)
	movq	%rbx, 8(%rax)
	je	.L64
	movq	8(%rsi), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rsi)
.L37:
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
.L39:
	movq	0(%r13), %r13
	testq	%r13, %r13
	jne	.L42
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L63:
	movq	(%r12), %rax
	movq	8(%rax), %rsi
	testq	%rsi, %rsi
	jne	.L47
.L59:
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L64:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	jmp	.L37
	.p2align 4
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
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
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L68
	movq	%rcx, %rbp
	movq	%rdx, %rdi
.L72:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L71
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L82:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L69
.L71:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	16(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L82
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L72
.L68:
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
	je	.L84
.L86:
	movl	$1, %eax
.L83:
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L86
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L86
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L86
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	jmp	.L83
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
	.text
	.p2align 4
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rbp
	movq	%rcx, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	movq	%r8, %rbx
	subq	$56, %rsp
	movq	16(%rdx), %rax
	movq	8(%rdx), %rsi
	leaq	1(%rax), %rdi
	addq	$1, %rsi
	call	__getreent
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC2(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbp, 40(%rsp)
	movq	%rdi, 32(%rsp)
	call	fprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.section .rdata,"dr"
.LC3:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC4:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
.LC5:
	.ascii "\342\224\202   \0"
.LC6:
	.ascii "    \0"
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
	leaq	11(%r9), %rdi
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
	jne	.L91
	orl	%eax, %r8d
	movb	%r8b, (%rdx)
	cmpq	$1, %rsi
	jbe	.L103
.L92:
	movl	$1, %ebx
	leaq	.LC6(%rip), %r13
	leaq	.LC5(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L96:
	movq	%rbx, %rax
	movq	%rbp, %r9
	shrq	$3, %rax
	movsbl	(%rdi,%rax), %edx
	movl	%ebx, %eax
	andl	$7, %eax
	btl	%eax, %edx
	jnc	.L98
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L96
	testb	%r14b, %r14b
	je	.L93
	.p2align 4,,10
	.p2align 3
.L97:
	leaq	.LC3(%rip), %rdx
.L101:
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
.L98:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L96
	testb	%r14b, %r14b
	jne	.L97
.L93:
	leaq	.LC4(%rip), %rdx
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L91:
	notl	%eax
	andl	%r8d, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rsi
	ja	.L92
	testq	%rsi, %rsi
	jne	.L97
.L90:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L103:
	testq	%rsi, %rsi
	je	.L90
	jmp	.L93
	.p2align 4
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$48, %ecx
	subq	$32, %rsp
	call	alloc_memory
	xorl	%edx, %edx
	movw	%dx, 8(%rax)
	movb	$0, 10(%rax)
	movq	%rbx, (%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.section .rdata,"dr"
.LC7:
	.ascii "\0"
.LC8:
	.ascii "%s.tc\0"
.LC9:
	.ascii "D:/TC/std/\0"
.LC10:
	.ascii "r\0"
	.align 8
.LC11:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC12:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC13:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC14:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC15:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.p2align 4
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	testq	%rdx, %rdx
	je	.L126
	movq	%r9, %rcx
	movq	%rdx, %rbx
	call	get_file_dir
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	absolute_path
	movq	%rax, %r12
.L108:
	leaq	.LC10(%rip), %rdx
	movq	%r12, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L127
	movq	%r12, %rdx
	leaq	.LC12(%rip), %rcx
	call	printf
	leaq	40(%rsp), %rdx
	movq	%rbx, %rcx
	movq	$0, 40(%rsp)
	call	read_source
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	fclose
	movq	%r12, %rcx
	call	create_file
	movl	$48, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	40(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	xorl	%eax, %eax
	movw	%ax, 8(%rbx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%r14, (%rbx)
	movb	$0, 10(%rbx)
	movq	(%rax), %r14
	call	create_lexer
	movq	%rbx, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%r12, %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rax, %rbx
	call	printf
	testq	%rbx, %rbx
	je	.L128
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L115
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L129:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L113
.L115:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	16(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L129
	movq	8(%r13), %rbx
	testq	%rbx, %rbx
	je	.L130
	movl	$16, %ecx
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L131
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L106:
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
.L126:
	call	strlen
	leaq	.LC7(%rip), %rcx
	leaq	4(%rax), %rdx
	call	create_string_not_check
	movq	%rdi, %r8
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rbx
	movq	%rax, %rcx
	call	sprintf
	leaq	.LC9(%rip), %rdx
	movq	%rbx, %rcx
	call	absolute_path
	movq	%rax, %r12
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L113:
	call	__getreent
	movq	%r12, %r9
	movq	%rdi, %r8
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	leaq	.LC15(%rip), %rdx
	call	fprintf
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L131:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L130:
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L127:
	call	__getreent
	movq	%r12, %r8
	leaq	.LC11(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L106
.L128:
	call	__getreent
	movq	%r12, %r8
	leaq	.LC14(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L106
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
	jne	.L132
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L132
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L150
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L151
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L132:
	addq	$32, %rsp
	popq	%rbx
	ret
.L150:
	movl	$2, %eax
	jmp	.L132
.L151:
	movl	$3, %eax
	jmp	.L132
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L154
	movl	%ecx, %ecx
	leaq	CSWTCH.50(%rip), %rax
	movl	(%rax,%rcx,4), %eax
.L154:
	ret
	.section	.text.unlikely,"x"
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	cmpl	$18, %ecx
	ja	.L179
	leaq	.L160(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L160:
	.long	.L178-.L160
	.long	.L177-.L160
	.long	.L176-.L160
	.long	.L175-.L160
	.long	.L174-.L160
	.long	.L173-.L160
	.long	.L172-.L160
	.long	.L171-.L160
	.long	.L170-.L160
	.long	.L169-.L160
	.long	.L168-.L160
	.long	.L167-.L160
	.long	.L166-.L160
	.long	.L165-.L160
	.long	.L164-.L160
	.long	.L163-.L160
	.long	.L162-.L160
	.long	.L161-.L160
	.long	.L159-.L160
	.text
	.p2align 4,,10
	.p2align 3
.L161:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L162:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L164:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L165:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L166:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L167:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L169:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L170:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L172:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L173:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L175:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L176:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L177:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L178:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L159:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
operator_to_string.cold:
.L179:
	xorl	%eax, %eax
	ret
	.text
	.section	.text.unlikely,"x"
.LCOLDE16:
	.text
.LHOTE16:
	.section .rdata,"dr"
	.align 32
CSWTCH.50:
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
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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

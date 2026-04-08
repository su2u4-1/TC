	.file	"helper.c"
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
	.p2align 4
	.globl	list_is_empty
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
list_is_empty:
	movl	$1, %eax
	testq	%rcx, %rcx
	je	.L37
	cmpq	$0, (%rcx)
	je	.L37
	cmpq	$0, 8(%rcx)
	sete	%al
.L37:
	ret
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
	.align 8
.LC2:
	.ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
	.align 8
.LC3:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.align 8
.LC4:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
	.text
	.p2align 4
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	movq	%r9, %r13
	pushq	%r12
	pushq	%rdi
	movl	%edx, %edi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	andq	$-16, %rsp
	subq	$48, %rsp
	movq	%r8, 32(%rbp)
	cmpl	$2, %edx
	je	.L43
	ja	.L44
	testl	%edx, %edx
	je	.L77
.L43:
	movq	32(%r13), %rax
	movq	(%rax), %r15
.L48:
	testq	%r15, %r15
	je	.L50
	movq	%r15, %r12
.L54:
	movq	8(%r12), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L53
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L78:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L51
.L53:
	movq	8(%rbx), %r14
	movq	%rsi, %rdx
	movq	8(%r14), %rcx
	call	string_equal
	testb	%al, %al
	je	.L78
	movq	id_counter.0(%rip), %rax
	movq	16(%r14), %r12
	movl	32(%r14), %r14d
	leaq	1(%rax), %rbx
	call	__getreent
	movl	%r14d, %r9d
	movq	%rsi, %r8
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 40(%rsp)
	movq	%r12, 32(%rsp)
	call	fprintf
.L50:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rsi, 8(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%edi, 32(%rbx)
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rbx)
	movq	32(%rbp), %rax
	movq	%r13, 24(%rbx)
	movq	%rax, (%rbx)
	testq	%r15, %r15
	je	.L74
	movq	8(%r15), %rsi
	testq	%rsi, %rsi
	je	.L79
	movl	$16, %ecx
	call	alloc_memory
	cmpq	$0, (%rsi)
	movq	$0, (%rax)
	movq	%rbx, 8(%rax)
	je	.L80
	movq	8(%rsi), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rsi)
.L42:
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
.L44:
	leal	-3(%rdx), %eax
	movq	%r9, %r15
	cmpl	$3, %eax
	jbe	.L48
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movl	$40, %ecx
	call	alloc_memory
	movq	%rsi, 8(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%edi, 32(%rbx)
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rbx)
	movq	32(%rbp), %rax
	movq	%rax, (%rbx)
	call	__getreent
	movl	%edi, %r8d
	leaq	.LC2(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L74:
	movq	16(%rbx), %r12
	call	__getreent
	movl	%edi, %r9d
	movq	%rsi, %r8
	leaq	.LC3(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%r12, 32(%rsp)
	call	fprintf
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L51:
	movq	(%r12), %r12
	testq	%r12, %r12
	jne	.L54
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L77:
	movq	16(%r9), %rax
	movq	(%rax), %r15
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L80:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rsi)
	jmp	.L42
.L79:
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L42
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
	.globl	search_name_use_strcmp
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	testq	%rcx, %rcx
	je	.L88
	movq	%rcx, %rbp
	movq	%rdx, %rdi
.L87:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L86
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L98:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L85
.L86:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L98
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L87
.L88:
	addq	$40, %rsp
	xorl	%esi, %esi
	popq	%rbx
	movq	%rsi, %rax
	popq	%rsi
	popq	%rdi
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
	je	.L100
	movq	%rcx, %rbp
	movq	%rdx, %rdi
.L104:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L103
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L114:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L101
.L103:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L114
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L104
.L100:
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
	je	.L116
.L118:
	movl	$1, %eax
.L115:
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L116:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L118
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L118
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L118
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	jmp	.L115
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "[Parser Error] at %s:%zu:%zu: %s\12\0"
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
	leaq	.LC5(%rip), %rdx
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
.LC6:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC7:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
.LC8:
	.ascii "\342\224\202   \0"
.LC9:
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
	movq	%r9, %rdi
	pushq	%rsi
	movq	%rdx, %rsi
	shrq	$3, %rdx
	pushq	%rbx
	movl	%esi, %ecx
	addq	%r9, %rdx
	andl	$7, %ecx
	sall	%cl, %eax
	subq	$32, %rsp
	movzbl	(%rdx), %r8d
	testb	%r14b, %r14b
	jne	.L123
	orl	%eax, %r8d
	movb	%r8b, (%rdx)
	cmpq	$1, %rsi
	jbe	.L135
.L124:
	movl	$1, %ebx
	leaq	.LC9(%rip), %r13
	leaq	.LC8(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L128:
	movq	%rbx, %rax
	movq	%rbp, %r9
	shrq	$3, %rax
	movsbl	(%rdi,%rax), %edx
	movl	%ebx, %eax
	andl	$7, %eax
	btl	%eax, %edx
	jnc	.L130
	movl	$6, %r8d
	movl	$1, %edx
	movq	%r12, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L128
	testb	%r14b, %r14b
	je	.L125
	.p2align 4,,10
	.p2align 3
.L129:
	leaq	.LC6(%rip), %rdx
.L133:
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
.L130:
	movl	$4, %r8d
	movl	$1, %edx
	movq	%r13, %rcx
	addq	$1, %rbx
	call	fwrite
	cmpq	%rbx, %rsi
	jne	.L128
	testb	%r14b, %r14b
	jne	.L129
.L125:
	leaq	.LC7(%rip), %rdx
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L123:
	notl	%eax
	andl	%r8d, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rsi
	ja	.L124
	testq	%rsi, %rsi
	jne	.L129
.L122:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L135:
	testq	%rsi, %rsi
	je	.L122
	jmp	.L125
	.p2align 4
	.globl	indention_tac
	.def	indention_tac;	.scl	2;	.type	32;	.endef
indention_tac:
	pushq	%rdi
	pushq	%rsi
	movq	%rdx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	salq	$2, %rsi
	je	.L136
	movq	%rcx, %rdi
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L138:
	movq	%rdi, %rdx
	movl	$32, %ecx
	addq	$1, %rbx
	call	putc
	cmpq	%rsi, %rbx
	jne	.L138
.L136:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbx
	movq	%rcx, %rbx
	movl	$16, %ecx
	subq	$32, %rsp
	call	alloc_memory
	xorl	%edx, %edx
	movw	%dx, 8(%rax)
	movb	$0, 11(%rax)
	movq	%rbx, (%rax)
	addq	$32, %rsp
	popq	%rbx
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
	je	.L172
	movq	%r9, %rcx
	movq	%rdx, %rbx
	call	get_file_dir
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	absolute_path
	movq	%rax, %r12
.L148:
	leaq	.LC13(%rip), %rdx
	movq	%r12, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L173
	call	__getreent
	movq	%r12, %r8
	leaq	.LC15(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	leaq	40(%rsp), %rdx
	movq	%rbx, %rcx
	movq	$0, 40(%rsp)
	call	read_source
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	fclose
	movq	%r12, %rcx
	call	create_file
	movl	$16, %ecx
	movq	%rax, %r14
	call	alloc_memory
	movq	40(%rsp), %rdx
	movq	%r12, %r8
	movq	%rsi, %rcx
	movq	%rax, %rbx
	xorl	%eax, %eax
	movw	%ax, 8(%rbx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%r14, (%rbx)
	movb	$0, 11(%rbx)
	movq	(%rax), %r14
	call	create_lexer
	movq	%rbx, %r8
	movq	%r14, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rax, %rbx
	call	__getreent
	movq	%r12, %r8
	leaq	.LC16(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	testq	%rbx, %rbx
	je	.L174
	movq	8(%rbx), %r14
	testq	%r14, %r14
	je	.L153
.L157:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L156
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L175:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L154
.L156:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L175
	movq	8(%r13), %rbx
	testq	%rbx, %rbx
	je	.L176
	movl	$16, %ecx
	call	alloc_memory
	cmpq	$0, (%rbx)
	movq	$0, (%rax)
	movq	%rsi, 8(%rax)
	je	.L177
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
	movq	%rax, 8(%rbx)
.L146:
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
.L154:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L157
.L153:
	call	__getreent
	movq	%r12, %r9
	movq	%rdi, %r8
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	leaq	.LC18(%rip), %rdx
	call	fprintf
	jmp	.L146
	.p2align 4,,10
	.p2align 3
.L172:
	call	strlen
	leaq	.LC10(%rip), %rcx
	leaq	4(%rax), %rdx
	call	create_string_not_check
	movq	%rdi, %r8
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rbx
	movq	%rax, %rcx
	call	sprintf
	leaq	.LC12(%rip), %rdx
	movq	%rbx, %rcx
	call	absolute_path
	movq	%rax, %r12
	jmp	.L148
.L176:
	call	__getreent
	movl	$38, %r8d
	movl	$1, %edx
	leaq	.LC0(%rip), %rcx
	movq	24(%rax), %r9
	call	fwrite
	jmp	.L146
	.p2align 4,,10
	.p2align 3
.L177:
	movq	%rax, %xmm0
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	jmp	.L146
.L173:
	call	__getreent
	movq	%r12, %r8
	leaq	.LC14(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L146
.L174:
	call	__getreent
	movq	%r12, %r8
	leaq	.LC17(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L146
	.section .rdata,"dr"
.LC19:
	.ascii "%s.%s\0"
	.text
	.p2align 4
	.globl	make_method_name
	.def	make_method_name;	.scl	2;	.type	32;	.endef
make_method_name:
	pushq	%rdi
	movq	%rdx, %rdi
	pushq	%rsi
	movq	%rcx, %rsi
	pushq	%rbx
	subq	$32, %rsp
	call	strlen
	movq	%rdi, %rcx
	movq	%rax, %rbx
	call	strlen
	leaq	.LC10(%rip), %rcx
	leaq	2(%rbx,%rax), %rdx
	call	create_string
	movq	%rdi, %r9
	movq	%rsi, %r8
	leaq	.LC19(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	sprintf
	addq	$32, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
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
	jne	.L180
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L180
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L198
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L199
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L180:
	addq	$32, %rsp
	popq	%rbx
	ret
.L198:
	movl	$2, %eax
	jmp	.L180
.L199:
	movl	$3, %eax
	jmp	.L180
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L202
	movl	%ecx, %ecx
	leaq	CSWTCH.56(%rip), %rax
	movl	(%rax,%rcx,4), %eax
.L202:
	ret
	.section	.text.unlikely,"x"
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	cmpl	$18, %ecx
	ja	.L227
	leaq	.L208(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L208:
	.long	.L226-.L208
	.long	.L225-.L208
	.long	.L224-.L208
	.long	.L223-.L208
	.long	.L222-.L208
	.long	.L221-.L208
	.long	.L220-.L208
	.long	.L219-.L208
	.long	.L218-.L208
	.long	.L217-.L208
	.long	.L216-.L208
	.long	.L215-.L208
	.long	.L214-.L208
	.long	.L213-.L208
	.long	.L212-.L208
	.long	.L211-.L208
	.long	.L210-.L208
	.long	.L209-.L208
	.long	.L207-.L208
	.text
	.p2align 4,,10
	.p2align 3
.L209:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L210:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L211:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L212:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L213:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L214:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L215:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L216:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L217:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L218:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L219:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L221:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L222:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L223:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L224:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L225:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L226:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L207:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
operator_to_string.cold:
.L227:
	xorl	%eax, %eax
	ret
	.text
	.section	.text.unlikely,"x"
.LCOLDE20:
	.text
.LHOTE20:
	.section .rdata,"dr"
	.align 32
CSWTCH.56:
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
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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

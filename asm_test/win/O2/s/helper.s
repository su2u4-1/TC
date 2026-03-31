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
	.ascii "Warning: Creating symbol with unknown SymbolType: %d\12\0"
	.align 8
.LC2:
	.ascii "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %d\12\0"
	.align 8
.LC3:
	.ascii "Warning: Creating symbol '%s' with NULL scope, kind: %d, id: %zu\12\0"
	.align 8
.LC4:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.p2align 4
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r15
	pushq	%r14
	movq	%r8, %r14
	pushq	%r13
	movq	%r9, %r13
	pushq	%r12
	pushq	%rbp
	movl	%edx, %ebp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	cmpl	$2, %edx
	je	.L43
	ja	.L44
	testl	%edx, %edx
	je	.L75
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
.L76:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L51
.L53:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L76
	movq	id_counter.0(%rip), %rax
	movq	16(%rsi), %r12
	movl	32(%rsi), %esi
	leaq	1(%rax), %rbx
	call	__getreent
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC4(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 40(%rsp)
	movq	%r12, 32(%rsp)
	call	fprintf
.L50:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rdi, 8(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 32(%rbx)
	addq	$1, %rax
	movq	%r14, (%rbx)
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 16(%rbx)
	movq	%r13, 24(%rbx)
	testq	%r15, %r15
	je	.L72
	movq	8(%r15), %rcx
	movq	%rbx, %rdx
	call	list_append
.L42:
	addq	$56, %rsp
	movq	%rbx, %rax
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
.L44:
	leal	-3(%rdx), %eax
	movq	%r9, %r15
	cmpl	$3, %eax
	jbe	.L48
	call	__getreent
	movl	%ebp, %r8d
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
	movl	$40, %ecx
	call	alloc_memory
	movq	%rdi, 8(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%ebp, 32(%rbx)
	addq	$1, %rax
	movq	%r14, (%rbx)
	movq	%rax, 16(%rbx)
	movq	%rax, id_counter.0(%rip)
	call	__getreent
	movl	%ebp, %r8d
	leaq	.LC2(%rip), %rdx
	movq	24(%rax), %rcx
	call	fprintf
.L72:
	movq	16(%rbx), %rsi
	call	__getreent
	movl	%ebp, %r9d
	movq	%rdi, %r8
	leaq	.LC3(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rsi, 32(%rsp)
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
.L75:
	movq	16(%r9), %rax
	movq	(%rax), %r15
	jmp	.L48
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
	je	.L84
	movq	%rcx, %rbp
	movq	%rdx, %rdi
.L83:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L82
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L94:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L81
.L82:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L94
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L83
.L84:
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
	je	.L96
	movq	%rcx, %rbp
	movq	%rdx, %rdi
.L100:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L99
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L110:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L97
.L99:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L110
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L100
.L96:
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
	je	.L112
.L114:
	movl	$1, %eax
.L111:
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L112:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L114
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L114
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L114
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	jmp	.L111
	.section .rdata,"dr"
	.align 8
.LC5:
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
	.ascii "\342\224\202   \0"
.LC7:
	.ascii "    \0"
.LC8:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC9:
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
	jne	.L119
	orl	%eax, %r8d
	movb	%r8b, (%rdx)
	cmpq	$1, %rsi
	jbe	.L130
.L120:
	movl	$1, %ebx
	leaq	.LC7(%rip), %r13
	leaq	.LC6(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L125:
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
	jne	.L125
	testb	%r14b, %r14b
	je	.L121
.L123:
	leaq	.LC8(%rip), %rdx
.L126:
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
.L119:
	notl	%eax
	andl	%r8d, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rsi
	ja	.L120
	testq	%rsi, %rsi
	jne	.L123
.L118:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L130:
	testq	%rsi, %rsi
	je	.L118
	.p2align 4,,10
	.p2align 3
.L121:
	leaq	.LC9(%rip), %rdx
	jmp	.L126
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
	pushq	%r13
	pushq	%r12
	movq	%r8, %r12
	pushq	%rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	testq	%rdx, %rdx
	je	.L148
	movq	%r9, %rcx
	movq	%rdx, %rbx
	call	get_file_dir
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	absolute_path
	movq	%rax, %rbp
.L135:
	leaq	.LC13(%rip), %rdx
	movq	%rbp, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L149
	movq	%rbp, %rdx
	leaq	.LC15(%rip), %rcx
	call	printf
	leaq	40(%rsp), %rdx
	movq	%rbx, %rcx
	movq	$0, 40(%rsp)
	call	read_source
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	fclose
	movq	%rbp, %rcx
	call	create_file
	movl	$48, %ecx
	movq	%rax, %r13
	call	alloc_memory
	movq	40(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rax, %rbx
	xorl	%eax, %eax
	movw	%ax, 8(%rbx)
	movq	.refptr.builtin_scope(%rip), %rax
	movq	%r13, (%rbx)
	movb	$0, 10(%rbx)
	movq	(%rax), %r13
	call	create_lexer
	movq	%rbx, %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	parse_code
	movq	%rbp, %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rax, %rbx
	call	printf
	testq	%rbx, %rbx
	je	.L150
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L142
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L151:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L140
.L142:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	8(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L151
	movq	8(%r12), %rcx
	movq	%rsi, %rdx
	call	list_append
.L133:
	addq	$56, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L148:
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
	movq	%rax, %rbp
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L140:
	call	__getreent
	movq	%rbp, %r9
	movq	%rdi, %r8
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	leaq	.LC18(%rip), %rdx
	call	fprintf
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L149:
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC14(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L133
.L150:
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC17(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L133
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
	jne	.L154
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L154
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L172
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L173
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L154:
	addq	$32, %rsp
	popq	%rbx
	ret
.L172:
	movl	$2, %eax
	jmp	.L154
.L173:
	movl	$3, %eax
	jmp	.L154
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L176
	movl	%ecx, %ecx
	leaq	CSWTCH.55(%rip), %rax
	movl	(%rax,%rcx,4), %eax
.L176:
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
	ja	.L201
	leaq	.L182(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L182:
	.long	.L200-.L182
	.long	.L199-.L182
	.long	.L198-.L182
	.long	.L197-.L182
	.long	.L196-.L182
	.long	.L195-.L182
	.long	.L194-.L182
	.long	.L193-.L182
	.long	.L192-.L182
	.long	.L191-.L182
	.long	.L190-.L182
	.long	.L189-.L182
	.long	.L188-.L182
	.long	.L187-.L182
	.long	.L186-.L182
	.long	.L185-.L182
	.long	.L184-.L182
	.long	.L183-.L182
	.long	.L181-.L182
	.text
	.p2align 4,,10
	.p2align 3
.L183:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L184:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L185:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L186:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L187:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L188:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L189:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L190:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L191:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L192:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L193:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L194:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L195:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L196:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L197:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L198:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L199:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L200:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
operator_to_string.cold:
.L201:
	xorl	%eax, %eax
	ret
	.text
	.section	.text.unlikely,"x"
.LCOLDE20:
	.text
.LHOTE20:
	.section .rdata,"dr"
	.align 32
CSWTCH.55:
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

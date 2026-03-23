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
	pushq	%r14
	pushq	%r13
	movq	%r8, %r13
	pushq	%r12
	movl	%edx, %r12d
	pushq	%rbp
	movq	%r9, %rbp
	pushq	%rdi
	movq	%rcx, %rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	testq	%r9, %r9
	je	.L45
	movq	%r9, %r14
.L42:
	movq	8(%r14), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L41
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L55:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L39
.L41:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	16(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L55
	movq	id_counter.0(%rip), %rax
	movq	24(%rsi), %r14
	movl	32(%rsi), %esi
	leaq	1(%rax), %rbx
	call	__getreent
	movl	%esi, %r9d
	movq	%rdi, %r8
	leaq	.LC1(%rip), %rdx
	movq	24(%rax), %rcx
	movq	%rbx, 40(%rsp)
	movq	%r14, 32(%rsp)
	call	fprintf
.L45:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rdi, 16(%rax)
	movq	%rax, %rbx
	movq	id_counter.0(%rip), %rax
	movl	%r12d, 32(%rbx)
	addq	$1, %rax
	movq	%r13, (%rbx)
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 24(%rbx)
	movq	%rbp, 8(%rbx)
	cmpl	$1, %r12d
	jbe	.L56
	movq	8(%rbp), %rcx
	movq	%rbx, %rdx
	call	list_append
.L37:
	addq	$48, %rsp
	movq	%rbx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	movq	(%r14), %r14
	testq	%r14, %r14
	jne	.L42
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L56:
	movq	0(%rbp), %rax
	movq	%rbx, %rdx
	movq	8(%rax), %rcx
	call	list_append
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
	je	.L60
	movq	%rcx, %rbp
	movq	%rdx, %rdi
.L64:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L63
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L61
.L63:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	16(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L74
	addq	$40, %rsp
	movq	%rsi, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L64
.L60:
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
	je	.L76
.L78:
	movl	$1, %eax
.L75:
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L78
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L78
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L78
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	setne	%al
	jmp	.L75
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
	.ascii "\342\224\202   \0"
.LC4:
	.ascii "    \0"
.LC5:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC6:
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
	jne	.L83
	orl	%eax, %r8d
	movb	%r8b, (%rdx)
	cmpq	$1, %rsi
	jbe	.L95
.L84:
	movl	$1, %ebx
	leaq	.LC4(%rip), %r13
	leaq	.LC3(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L90:
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
	jne	.L90
	testb	%r14b, %r14b
	je	.L85
.L87:
	leaq	.LC5(%rip), %rdx
.L91:
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
.L83:
	notl	%eax
	andl	%r8d, %eax
	movb	%al, (%rdx)
	cmpq	$1, %rsi
	ja	.L84
	testq	%rsi, %rsi
	jne	.L87
.L82:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L95:
	testq	%rsi, %rsi
	je	.L82
	.p2align 4,,10
	.p2align 3
.L85:
	leaq	.LC6(%rip), %rdx
	jmp	.L91
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
	je	.L113
	movq	%r9, %rcx
	movq	%rdx, %rbx
	call	get_file_dir
	movq	%rbx, %rcx
	movq	%rax, %rdx
	call	absolute_path
	movq	%rax, %rbp
.L100:
	leaq	.LC10(%rip), %rdx
	movq	%rbp, %rcx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L114
	movq	%rbp, %rdx
	leaq	.LC12(%rip), %rcx
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
	leaq	.LC13(%rip), %rcx
	movq	%rax, %rbx
	call	printf
	testq	%rbx, %rbx
	je	.L115
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	jne	.L107
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L116:
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L105
.L107:
	movq	8(%rbx), %rsi
	movq	%rdi, %rdx
	movq	16(%rsi), %rcx
	call	string_equal
	testb	%al, %al
	je	.L116
	movq	8(%r12), %rcx
	movq	%rsi, %rdx
	call	list_append
.L98:
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
.L113:
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
	movq	%rax, %rbp
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L105:
	call	__getreent
	movq	%rbp, %r9
	movq	%rdi, %r8
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	leaq	.LC15(%rip), %rdx
	call	fprintf
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L114:
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC11(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L98
.L115:
	call	__getreent
	movq	%rbp, %r8
	leaq	.LC14(%rip), %rdx
	xorl	%esi, %esi
	movq	24(%rax), %rcx
	call	fprintf
	jmp	.L98
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
	jne	.L117
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	xorl	%eax, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L117
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L135
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	testb	%al, %al
	jne	.L136
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	%rbx, %rcx
	movq	(%rax), %rdx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
.L117:
	addq	$32, %rsp
	popq	%rbx
	ret
.L135:
	movl	$2, %eax
	jmp	.L117
.L136:
	movl	$3, %eax
	jmp	.L117
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	xorl	%eax, %eax
	cmpl	$18, %ecx
	ja	.L139
	movl	%ecx, %ecx
	leaq	CSWTCH.50(%rip), %rax
	movl	(%rax,%rcx,4), %eax
.L139:
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
	ja	.L164
	leaq	.L145(%rip), %rdx
	movl	%ecx, %ecx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L145:
	.long	.L163-.L145
	.long	.L162-.L145
	.long	.L161-.L145
	.long	.L160-.L145
	.long	.L159-.L145
	.long	.L158-.L145
	.long	.L157-.L145
	.long	.L156-.L145
	.long	.L155-.L145
	.long	.L154-.L145
	.long	.L153-.L145
	.long	.L152-.L145
	.long	.L151-.L145
	.long	.L150-.L145
	.long	.L149-.L145
	.long	.L148-.L145
	.long	.L147-.L145
	.long	.L146-.L145
	.long	.L144-.L145
	.text
	.p2align 4,,10
	.p2align 3
.L146:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L147:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L148:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L149:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L150:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L151:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L152:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L153:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L154:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L155:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L156:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L157:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L159:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L160:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L161:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L162:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L163:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	ret
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
operator_to_string.cold:
.L164:
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

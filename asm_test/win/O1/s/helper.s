	.file	"D:\\TC\\src\\helper.c"
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
	.seh_proc	create_list
create_list:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	$16, %ecx
	call	alloc_memory
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	addq	$40, %rsp
	ret
	.seh_endproc
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
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
	.seh_proc	list_append
list_append:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	call	create_node
	cmpq	$0, (%rbx)
	je	.L6
	movq	8(%rbx), %rdx
	movq	%rax, (%rdx)
.L5:
	movq	%rax, 8(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
.L6:
	movq	%rax, (%rbx)
	jmp	.L5
	.seh_endproc
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
	call	create_list
	movq	(%rbx), %rdx
	movq	%rdx, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	list_pop
list_pop:
	.seh_endprologue
	movq	(%rcx), %rax
	testq	%rax, %rax
	je	.L8
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	testq	%rdx, %rdx
	je	.L11
.L10:
	movq	8(%rax), %rax
.L8:
	ret
.L11:
	movq	$0, 8(%rcx)
	jmp	.L10
	.seh_endproc
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
	movq	%rax, %rbx
	movq	%rsi, (%rax)
	call	create_list
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
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
	je	.L18
.L17:
	movq	8(%rbp), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L15
.L16:
	movq	8(%rbx), %rsi
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	string_equal
	testb	%al, %al
	jne	.L13
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L16
.L15:
	movq	0(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L17
	movq	%rbp, %rsi
	jmp	.L13
.L18:
	movq	%rcx, %rsi
.L13:
	movq	%rsi, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
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
	movq	%rcx, %rdi
	movl	%edx, %esi
	movq	%r8, %rbp
	movq	%r9, %r12
	movq	128(%rsp), %r13
	movq	%rcx, %rdx
	movq	%r13, %rcx
	call	search
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L22
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, %r8
	leaq	.LC0(%rip), %rdx
	call	fprintf
	cmpl	$5, 24(%rbx)
	ja	.L23
	movl	24(%rbx), %eax
	leaq	.L25(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L25:
	.long	.L30-.L25
	.long	.L29-.L25
	.long	.L28-.L25
	.long	.L27-.L25
	.long	.L26-.L25
	.long	.L24-.L25
	.text
.L30:
	call	__getreent
	movq	24(%rax), %r9
	movl	$5, %r8d
	movl	$1, %edx
	leaq	.LC1(%rip), %rcx
	call	fwrite
.L22:
	movl	$32, %ecx
	call	alloc_memory
	movq	%rax, %rbx
	movq	%rdi, (%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	%rax, 8(%rbx)
	movl	%esi, 24(%rbx)
	leal	-1(%rsi), %eax
	cmpl	$2, %eax
	jbe	.L31
	cmpl	$5, %esi
	je	.L31
	cmpl	$4, %esi
	jne	.L34
	testq	%r12, %r12
	je	.L34
	movq	%r12, 16(%rbx)
	jmp	.L36
.L29:
	call	__getreent
	movq	24(%rax), %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC2(%rip), %rcx
	call	fwrite
	jmp	.L22
.L28:
	call	__getreent
	movq	24(%rax), %r9
	movl	$9, %r8d
	movl	$1, %edx
	leaq	.LC3(%rip), %rcx
	call	fwrite
	jmp	.L22
.L27:
	call	__getreent
	movq	24(%rax), %r9
	movl	$7, %r8d
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	fwrite
	jmp	.L22
.L26:
	call	__getreent
	movq	24(%rax), %r9
	movl	$6, %r8d
	movl	$1, %edx
	leaq	.LC5(%rip), %rcx
	call	fwrite
	jmp	.L22
.L24:
	call	__getreent
	movq	24(%rax), %r9
	movl	$10, %r8d
	movl	$1, %edx
	leaq	.LC6(%rip), %rcx
	call	fwrite
	jmp	.L22
.L23:
	call	__getreent
	movq	24(%rax), %r9
	movl	$8, %r8d
	movl	$1, %edx
	leaq	.LC7(%rip), %rcx
	call	fwrite
	jmp	.L22
.L31:
	testq	%rbp, %rbp
	je	.L35
	movq	%rbp, 16(%rbx)
.L36:
	movq	8(%r13), %rcx
	movq	%rbx, %rdx
	call	list_append
.L21:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L34:
	testl	%esi, %esi
	jne	.L35
	movq	$0, 16(%rbx)
	jmp	.L36
.L35:
	orq	%rbp, %r12
	jne	.L37
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC8(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L21
.L37:
	call	__getreent
	movq	24(%rax), %rcx
	movl	%esi, %r8d
	leaq	.LC9(%rip), %rdx
	call	fprintf
	movl	$0, %ebx
	jmp	.L21
	.seh_endproc
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_builtin_type
is_builtin_type:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	.refptr.INT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	je	.L45
.L40:
	addq	$32, %rsp
	popq	%rbx
	ret
.L45:
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L40
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L40
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L40
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	setne	%al
	movzbl	%al, %eax
	jmp	.L40
	.seh_endproc
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
	movq	%rcx, %rdi
	movq	16(%rdx), %rax
	leaq	1(%rax), %rsi
	movq	8(%rdx), %rbx
	addq	$1, %rbx
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC10(%rip), %rdx
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
	movq	%rcx, %rbp
	movq	%rdx, %rsi
	movl	%r8d, %r14d
	leaq	3(%r9), %rdi
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	%rdi, %rax
	movzbl	(%rax), %edx
	testb	%r8b, %r8b
	jne	.L49
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	orl	%r8d, %edx
.L52:
	movb	%dl, (%rax)
	movl	$1, %ebx
	leaq	.LC12(%rip), %r13
	leaq	.LC11(%rip), %r12
	cmpq	$1, %rsi
	jbe	.L63
.L50:
	movq	%rbx, %rax
	shrq	$3, %rax
	movsbl	(%rdi,%rax), %eax
	movl	%ebx, %ecx
	andl	$7, %ecx
	sarl	%cl, %eax
	testb	$1, %al
	movq	%r12, %rdx
	cmove	%r13, %rdx
	movq	%rbp, %rcx
	call	fprintf
	addq	$1, %rbx
	cmpq	%rbx, %rsi
	jne	.L50
.L54:
	testb	%r14b, %r14b
	leaq	.LC14(%rip), %rdx
	leaq	.LC13(%rip), %rax
	cmovne	%rax, %rdx
	movq	%rbp, %rcx
	call	fprintf
	jmp	.L48
.L49:
	movl	%esi, %ecx
	andl	$7, %ecx
	movl	$1, %r8d
	sall	%cl, %r8d
	notl	%r8d
	andl	%r8d, %edx
	jmp	.L52
.L63:
	testq	%rsi, %rsi
	jne	.L54
.L48:
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.seh_endproc
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.seh_proc	create_parser
create_parser:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	$35, %ecx
	call	alloc_memory
	movb	$0, (%rax)
	movb	$0, 1(%rax)
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
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rbp
	movb	$0, 48(%rsp)
	testq	%rdx, %rdx
	je	.L76
	leaq	48(%rsp), %rsi
	movq	%rdx, %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
	leaq	.LC18(%rip), %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
	leaq	.LC19(%rip), %r9
	movq	%rsi, %r8
	movl	$1024, %edx
	movq	%rsi, %rcx
	call	string_append
.L68:
	leaq	48(%rsp), %rcx
	leaq	.LC20(%rip), %rdx
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L77
	leaq	48(%rsp), %rsi
	movq	%rsi, %rdx
	leaq	.LC22(%rip), %rcx
	call	printf
	movq	$0, 40(%rsp)
	leaq	40(%rsp), %rdx
	movq	%rbx, %rcx
	call	read_source
	movq	%rax, %r12
	movq	%rbx, %rcx
	call	fclose
	call	create_parser
	movq	%rax, %rbx
	movq	.refptr.builtin_scope(%rip), %rax
	movq	(%rax), %r13
	movq	40(%rsp), %rdx
	movq	%r12, %rcx
	call	create_lexer
	movq	%rax, %rcx
	movq	%rbx, %r8
	movq	%r13, %rdx
	call	parse_code
	movq	%rax, %rbx
	movq	%rsi, %rdx
	leaq	.LC23(%rip), %rcx
	call	printf
	testq	%rbx, %rbx
	je	.L78
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.L65
.L74:
	movq	8(%rbx), %rsi
	movq	(%rsi), %rcx
	movq	%rdi, %rdx
	call	string_equal
	testb	%al, %al
	jne	.L73
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L74
	jmp	.L65
.L76:
	leaq	.LC15(%rip), %rdx
	call	strcmp
	testl	%eax, %eax
	je	.L79
	leaq	.LC16(%rip), %rdx
	movq	%rdi, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L69
	movabsq	$8241920901561659182, %rax
	movq	%rax, 48(%rsp)
	movabsq	$27993765531771183, %rax
	movq	%rax, 53(%rsp)
	jmp	.L68
.L79:
	movabsq	$8246143026212319022, %rax
	movq	%rax, 48(%rsp)
	movabsq	$27993765565065586, %rax
	movq	%rax, 55(%rsp)
	jmp	.L68
.L69:
	call	__getreent
	movq	24(%rax), %rcx
	leaq	48(%rsp), %r8
	leaq	.LC17(%rip), %rdx
	call	fprintf
	jmp	.L65
.L77:
	call	__getreent
	movq	24(%rax), %rcx
	leaq	48(%rsp), %r8
	leaq	.LC21(%rip), %rdx
	call	fprintf
	jmp	.L65
.L78:
	call	__getreent
	movq	24(%rax), %rcx
	movq	%rsi, %r8
	leaq	.LC24(%rip), %rdx
	call	fprintf
	jmp	.L65
.L73:
	movq	8(%rbp), %rcx
	movq	%rsi, %rdx
	call	list_append
	movq	%rsi, %rbx
.L65:
	movq	%rbx, %rax
	addq	$1080, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.seh_proc	string_to_operator
string_to_operator:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	call	string_equal
	movl	%eax, %edx
	movl	$13, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$14, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$15, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$16, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$17, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$18, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$11, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$12, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$5, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$6, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$7, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$8, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$9, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$10, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$0, %eax
	testb	%dl, %dl
	je	.L101
.L80:
	addq	$32, %rsp
	popq	%rbx
	ret
.L101:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	movl	%eax, %edx
	movl	$1, %eax
	testb	%dl, %dl
	jne	.L80
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L98
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L99
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rbx, %rcx
	call	string_equal
	cmpb	$1, %al
	sbbl	%eax, %eax
	andl	$15, %eax
	addl	$4, %eax
	jmp	.L80
.L98:
	movl	$2, %eax
	jmp	.L80
.L99:
	movl	$3, %eax
	jmp	.L80
	.seh_endproc
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_precedence
operator_precedence:
	.seh_endprologue
	cmpl	$18, %ecx
	ja	.L103
	movl	%ecx, %ecx
	leaq	.L105(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L105:
	.long	.L109-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L108-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L110-.L105
	.long	.L110-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.text
.L104:
	movl	$1, %eax
.L102:
	ret
.L107:
	movl	$3, %eax
	jmp	.L102
.L109:
	movl	$4, %eax
	jmp	.L102
.L108:
	movl	$5, %eax
	jmp	.L102
.L103:
	movl	$0, %eax
	jmp	.L102
.L110:
	movl	$2, %eax
	jmp	.L102
	.seh_endproc
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_to_string
operator_to_string:
	.seh_endprologue
	cmpl	$18, %ecx
	ja	.L133
	movl	%ecx, %ecx
	leaq	.L114(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L114:
	.long	.L132-.L114
	.long	.L131-.L114
	.long	.L130-.L114
	.long	.L129-.L114
	.long	.L128-.L114
	.long	.L127-.L114
	.long	.L126-.L114
	.long	.L125-.L114
	.long	.L124-.L114
	.long	.L123-.L114
	.long	.L122-.L114
	.long	.L121-.L114
	.long	.L120-.L114
	.long	.L119-.L114
	.long	.L118-.L114
	.long	.L117-.L114
	.long	.L116-.L114
	.long	.L115-.L114
	.long	.L113-.L114
	.text
.L119:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
.L111:
	ret
.L118:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L117:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L116:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L115:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L113:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L121:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L120:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L127:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L126:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L125:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L124:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L123:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L122:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L132:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L131:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L130:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L129:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L128:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L111
.L133:
	movl	$0, %eax
	jmp	.L111
	.seh_endproc
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

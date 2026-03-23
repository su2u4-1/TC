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
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	16(%rbp), %rdx
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	search_name
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L25
	movq	id_counter.0(%rip), %rax
	leaq	1(%rax), %rsi
	movq	-40(%rbp), %rax
	movq	24(%rax), %rbx
	movq	-40(%rbp), %rax
	movl	32(%rax), %edi
	call	__getreent
	movq	24(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rsi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movl	%edi, %r9d
	movq	%rdx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L25:
	movl	$40, %ecx
	call	alloc_memory
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	id_counter.0(%rip), %rax
	addq	$1, %rax
	movq	%rax, id_counter.0(%rip)
	movq	id_counter.0(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-48(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 32(%rax)
	movq	-48(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-48(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 8(%rax)
	cmpl	$0, 24(%rbp)
	je	.L26
	cmpl	$1, 24(%rbp)
	jne	.L27
.L26:
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L28
.L27:
	movq	40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
.L28:
	movq	-48(%rbp), %rax
	addq	$72, %rsp
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
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	jmp	.L33
.L38:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L34
.L37:
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L35
	movq	-32(%rbp), %rax
	jmp	.L36
.L35:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L34:
	cmpq	$0, -8(%rbp)
	jne	.L37
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, 16(%rbp)
.L33:
	cmpq	$0, 16(%rbp)
	jne	.L38
	movl	$0, %eax
.L36:
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
	jne	.L40
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L40
	movq	.refptr.STRING_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L40
	movq	.refptr.BOOL_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	jne	.L40
	movq	.refptr.VOID_KEYWORD(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L41
.L40:
	movl	$1, %eax
	jmp	.L42
.L41:
	movl	$0, %eax
.L42:
	leave
	ret
	.section .rdata,"dr"
	.align 8
.LC2:
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
	leaq	.LC2(%rip), %rdx
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
	je	.L46
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
	jmp	.L48
.L46:
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
.L48:
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
.LC3:
	.ascii "\342\224\202   \0"
.LC4:
	.ascii "    \0"
.LC5:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC6:
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
	jmp	.L52
.L55:
	movq	-16(%rbp), %rax
	leaq	11(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	call	get_bool_list
	testb	%al, %al
	je	.L53
	leaq	.LC3(%rip), %rax
	jmp	.L54
.L53:
	leaq	.LC4(%rip), %rax
.L54:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
	addq	$1, -8(%rbp)
.L52:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L55
	cmpq	$0, 24(%rbp)
	je	.L59
	cmpb	$0, 32(%rbp)
	je	.L57
	leaq	.LC5(%rip), %rax
	jmp	.L58
.L57:
	leaq	.LC6(%rip), %rax
.L58:
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	fprintf
.L59:
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
	jne	.L63
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	addq	$4, %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	create_string_not_check
	movq	%rax, -48(%rbp)
	movq	16(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	movq	-48(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	absolute_path
	movq	%rax, -32(%rbp)
	jmp	.L64
.L63:
	movq	40(%rbp), %rax
	movq	%rax, %rcx
	call	get_file_dir
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	absolute_path
	movq	%rax, -32(%rbp)
.L64:
	movq	-32(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L65
	call	__getreent
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L74
.L65:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rax
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
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	cmpq	$0, -72(%rbp)
	jne	.L67
	call	__getreent
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %r8
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
	jmp	.L74
.L67:
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L68
.L71:
	movq	-40(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	16(%rax), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L69
	movq	-96(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L70
.L69:
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L68:
	cmpq	$0, -40(%rbp)
	jne	.L71
.L70:
	cmpq	$0, -24(%rbp)
	je	.L72
	movq	32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, %rcx
	call	list_append
	jmp	.L73
.L72:
	call	__getreent
	movq	24(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	16(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L73:
	movq	-24(%rbp), %rax
.L74:
	subq	$-128, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
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
	je	.L76
	movl	$13, %eax
	jmp	.L77
.L76:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L78
	movl	$14, %eax
	jmp	.L77
.L78:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L79
	movl	$15, %eax
	jmp	.L77
.L79:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L80
	movl	$16, %eax
	jmp	.L77
.L80:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L81
	movl	$17, %eax
	jmp	.L77
.L81:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L82
	movl	$18, %eax
	jmp	.L77
.L82:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L83
	movl	$11, %eax
	jmp	.L77
.L83:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L84
	movl	$12, %eax
	jmp	.L77
.L84:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L85
	movl	$5, %eax
	jmp	.L77
.L85:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L86
	movl	$6, %eax
	jmp	.L77
.L86:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L87
	movl	$7, %eax
	jmp	.L77
.L87:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L88
	movl	$8, %eax
	jmp	.L77
.L88:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L89
	movl	$9, %eax
	jmp	.L77
.L89:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L90
	movl	$10, %eax
	jmp	.L77
.L90:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L91
	movl	$0, %eax
	jmp	.L77
.L91:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L92
	movl	$1, %eax
	jmp	.L77
.L92:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L93
	movl	$2, %eax
	jmp	.L77
.L93:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L94
	movl	$3, %eax
	jmp	.L77
.L94:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	string_equal
	testb	%al, %al
	je	.L95
	movl	$4, %eax
	jmp	.L77
.L95:
	movl	$19, %eax
.L77:
	leave
	ret
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%ecx, 16(%rbp)
	cmpl	$18, 16(%rbp)
	ja	.L97
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L99(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L99(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L99:
	.long	.L103-.L99
	.long	.L103-.L99
	.long	.L102-.L99
	.long	.L102-.L99
	.long	.L102-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L100-.L99
	.long	.L100-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.text
.L98:
	movl	$1, %eax
	jmp	.L104
.L100:
	movl	$2, %eax
	jmp	.L104
.L101:
	movl	$3, %eax
	jmp	.L104
.L103:
	movl	$4, %eax
	jmp	.L104
.L102:
	movl	$5, %eax
	jmp	.L104
.L97:
	movl	$0, %eax
.L104:
	popq	%rbp
	ret
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	pushq	%rbp
	movq	%rsp, %rbp
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
	.long	.L126-.L108
	.long	.L125-.L108
	.long	.L124-.L108
	.long	.L123-.L108
	.long	.L122-.L108
	.long	.L121-.L108
	.long	.L120-.L108
	.long	.L119-.L108
	.long	.L118-.L108
	.long	.L117-.L108
	.long	.L116-.L108
	.long	.L115-.L108
	.long	.L114-.L108
	.long	.L113-.L108
	.long	.L112-.L108
	.long	.L111-.L108
	.long	.L110-.L108
	.long	.L109-.L108
	.long	.L107-.L108
	.text
.L113:
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L112:
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L111:
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L110:
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L109:
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L107:
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L115:
	movq	.refptr.AND_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L114:
	movq	.refptr.OR_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L121:
	movq	.refptr.EQ_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L120:
	movq	.refptr.NE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L119:
	movq	.refptr.LT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L118:
	movq	.refptr.GT_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L117:
	movq	.refptr.LE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L116:
	movq	.refptr.GE_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L126:
	movq	.refptr.ADD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L125:
	movq	.refptr.SUB_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L124:
	movq	.refptr.MUL_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L123:
	movq	.refptr.DIV_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L122:
	movq	.refptr.MOD_SYMBOL(%rip), %rax
	movq	(%rax), %rax
	jmp	.L127
.L106:
	movl	$0, %eax
.L127:
	popq	%rbp
	ret
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
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
